Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019635D473
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 02:28:49 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW6vA-0001w4-5U
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 20:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tP-0000YG-41; Mon, 12 Apr 2021 20:26:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55003 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tM-0006Nb-0w; Mon, 12 Apr 2021 20:26:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FK5yL4dbKz9sWk; Tue, 13 Apr 2021 10:26:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618273610;
 bh=FaidQ3aeeCMRxwF1w6cEeC4qGis4DcWLA3Rs8WDcY6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LbWpfGqiXkJV7H0Rucm5yp+U64DGkger/xr4BizF5PVoX+MyGU8P1kVJKxaptnXN0
 JH15e5WHXuR2M15Hfo4l0/DWwYFUPtWcynl68LlV1fCyZcf4Vml3cUTN8OVP6pxWPS
 oFX67m6kcTIaBhhK6ME5CFp0XX+5NKHvHNSl+PMM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 1/2] spapr: rollback 'unplug timeout' for CPU hotunplugs
Date: Tue, 13 Apr 2021 10:26:47 +1000
Message-Id: <20210413002648.8281-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413002648.8281-1-david@gibson.dropbear.id.au>
References: <20210413002648.8281-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The pseries machines introduced the concept of 'unplug timeout' for CPU
hotunplugs. The idea was to circunvent a deficiency in the pSeries
specification (PAPR), that currently does not define a proper way for
the hotunplug to fail. If the guest refuses to release the CPU (see [1]
for an example) there is no way for QEMU to detect the failure.

Further discussions about how to send a QAPI event to inform about the
hotunplug timeout [2] exposed problems that weren't predicted back when
the idea was developed. Other QEMU machines don't have any type of
hotunplug timeout mechanism for any device, e.g. ACPI based machines
have a way to make hotunplug errors visible to the hypervisor. This
would make this timeout mechanism exclusive to pSeries, which is not
ideal.

The real problem is that a QAPI event that reports hotunplug timeouts
puts the management layer (namely Libvirt) in a weird spot. We're not
telling that the hotunplug failed, because we can't be 100% sure of
that, and yet we're resetting the unplug state back, preventing any
DEVICE_DEL events to reach out in case the guest decides to release the
device. Libvirt would need to inspect the guest itself to see if the
device was released or not, otherwise the internal domain states will be
inconsistent.  Moreover, Libvirt already has an 'unplug timeout'
concept, and a QEMU side timeout would need to be juggled together with
the existing Libvirt timeout.

All this considered, this solution ended up creating more trouble than
it solved. This patch reverts the 3 commits that introduced the timeout
mechanism for CPU hotplugs in pSeries machines.

This reverts commit 4515a5f786024fabf0bef4cf3d28adf5647e6e82
"qemu_timer.c: add timer_deadline_ms() helper"

This reverts commit d1c2e3ce3d5a5424651967bce1cf1f4caa0c6d91
"spapr_drc.c: add hotunplug timeout for CPUs"

This reverts commit 51254ffb320183a4636635840c23ee0e3a1efffa
"spapr_drc.c: introduce unplug_timeout_timer"

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1911414
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg04682.html

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210401000437.131140-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c             |  4 ---
 hw/ppc/spapr_drc.c         | 52 --------------------------------------
 include/hw/ppc/spapr_drc.h |  5 ----
 include/qemu/timer.h       |  8 ------
 util/qemu-timer.c          | 13 ----------
 5 files changed, 82 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 73a06df3b1..05a765fab4 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3778,10 +3778,6 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
-    } else {
-        error_setg(errp, "core-id %d unplug is still pending, %d seconds "
-                   "timeout remaining",
-                   cc->core_id, spapr_drc_unplug_timeout_remaining_sec(drc));
     }
 }
 
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8a71b03800..9e16505fa1 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -57,8 +57,6 @@ static void spapr_drc_release(SpaprDrc *drc)
     drck->release(drc->dev);
 
     drc->unplug_requested = false;
-    timer_del(drc->unplug_timeout_timer);
-
     g_free(drc->fdt);
     drc->fdt = NULL;
     drc->fdt_start_offset = 0;
@@ -372,17 +370,6 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
     } while (fdt_depth != 0);
 }
 
-static void spapr_drc_start_unplug_timeout_timer(SpaprDrc *drc)
-{
-    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-
-    if (drck->unplug_timeout_seconds != 0) {
-        timer_mod(drc->unplug_timeout_timer,
-                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-                  drck->unplug_timeout_seconds * 1000);
-    }
-}
-
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
     trace_spapr_drc_attach(spapr_drc_index(drc));
@@ -409,8 +396,6 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
 
     drc->unplug_requested = true;
 
-    spapr_drc_start_unplug_timeout_timer(drc);
-
     if (drc->state != drck->empty_state) {
         trace_spapr_drc_awaiting_quiesce(spapr_drc_index(drc));
         return;
@@ -419,15 +404,6 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
     spapr_drc_release(drc);
 }
 
-int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
-{
-    if (drc->unplug_requested) {
-        return timer_deadline_ms(drc->unplug_timeout_timer) / 1000;
-    }
-
-    return 0;
-}
-
 bool spapr_drc_reset(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
@@ -499,23 +475,11 @@ static bool spapr_drc_needed(void *opaque)
         spapr_drc_unplug_requested(drc);
 }
 
-static int spapr_drc_post_load(void *opaque, int version_id)
-{
-    SpaprDrc *drc = opaque;
-
-    if (drc->unplug_requested) {
-        spapr_drc_start_unplug_timeout_timer(drc);
-    }
-
-    return 0;
-}
-
 static const VMStateDescription vmstate_spapr_drc = {
     .name = "spapr_drc",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = spapr_drc_needed,
-    .post_load = spapr_drc_post_load,
     .fields  = (VMStateField []) {
         VMSTATE_UINT32(state, SpaprDrc),
         VMSTATE_END_OF_LIST()
@@ -526,15 +490,6 @@ static const VMStateDescription vmstate_spapr_drc = {
     }
 };
 
-static void drc_unplug_timeout_cb(void *opaque)
-{
-    SpaprDrc *drc = opaque;
-
-    if (drc->unplug_requested) {
-        drc->unplug_requested = false;
-    }
-}
-
 static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
@@ -557,11 +512,6 @@ static void drc_realize(DeviceState *d, Error **errp)
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
     g_free(link_name);
-
-    drc->unplug_timeout_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                             drc_unplug_timeout_cb,
-                                             drc);
-
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
@@ -579,7 +529,6 @@ static void drc_unrealize(DeviceState *d)
     name = g_strdup_printf("%x", spapr_drc_index(drc));
     object_property_del(root_container, name);
     g_free(name);
-    timer_free(drc->unplug_timeout_timer);
 }
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
@@ -721,7 +670,6 @@ static void spapr_drc_cpu_class_init(ObjectClass *k, void *data)
     drck->drc_name_prefix = "CPU ";
     drck->release = spapr_core_release;
     drck->dt_populate = spapr_core_dt_populate;
-    drck->unplug_timeout_seconds = 15;
 }
 
 static void spapr_drc_pci_class_init(ObjectClass *k, void *data)
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 26599c385a..02a63b3666 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -187,8 +187,6 @@ typedef struct SpaprDrc {
     bool unplug_requested;
     void *fdt;
     int fdt_start_offset;
-
-    QEMUTimer *unplug_timeout_timer;
 } SpaprDrc;
 
 struct SpaprMachineState;
@@ -211,8 +209,6 @@ typedef struct SpaprDrcClass {
 
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
-
-    int unplug_timeout_seconds;
 } SpaprDrcClass;
 
 typedef struct SpaprDrcPhysical {
@@ -248,7 +244,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
  */
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_unplug_request(SpaprDrc *drc);
-int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc);
 
 /*
  * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 301fa47b42..88ef114689 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -797,14 +797,6 @@ static inline int64_t get_max_clock_jump(void)
     return 60 * NANOSECONDS_PER_SECOND;
 }
 
-/**
- * timer_deadline_ms:
- *
- * Returns the remaining miliseconds for @timer to expire, or zero
- * if the timer is no longer pending.
- */
-int64_t timer_deadline_ms(QEMUTimer *timer);
-
 /*
  * Low level clock functions
  */
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index be529c1f65..f36c75e594 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -242,19 +242,6 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
     return delta;
 }
 
-/*
- * Returns the time remaining for the deadline, in ms.
- */
-int64_t timer_deadline_ms(QEMUTimer *timer)
-{
-    if (timer_pending(timer)) {
-        return qemu_timeout_ns_to_ms(timer->expire_time) -
-               qemu_clock_get_ms(timer->timer_list->clock->type);
-    }
-
-    return 0;
-}
-
 /* Calculate the soonest deadline across all timerlists attached
  * to the clock. This is used for the icount timeout so we
  * ignore whether or not the clock should be used in deadline
-- 
2.30.2


