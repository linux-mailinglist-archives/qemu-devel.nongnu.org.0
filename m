Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A266E33343E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:12:24 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqCt-00061h-Kn
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAs-0003Wn-9D; Tue, 09 Mar 2021 23:10:19 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35073 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAp-0004AO-GK; Tue, 09 Mar 2021 23:10:18 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd5t4Cz9sWp; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=v/NiisTvwZjjJreAZMnQLch913SxxNiDzagydM1u/7c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kB4yk/01mKd5tYIll6K2EYLoRFssFgiBWV2m/FwP6wJ3U3a2QaLArPWmiVTNJ7YJq
 t1wy2W8vSTrPHb7n/9RwpXJz/OffEJLyT9ShERK8WyIAQt/k+G0NFRlO7P8SoTCaPA
 Nf8EXjrab7jtifog2huwvgq+/r1y7lprbXncQSQo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/20] spapr_drc.c: introduce unplug_timeout_timer
Date: Wed, 10 Mar 2021 15:09:52 +1100
Message-Id: <20210310041002.333813-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The LoPAR spec provides no way for the guest kernel to report failure of
hotplug/hotunplug events. This wouldn't be bad if those operations were
granted to always succeed, but that's far for the reality.

What ends up happening is that, in the case of a failed hotunplug,
regardless of whether it was a QEMU error or a guest misbehavior, the
pSeries machine is retaining the unplug state of the device in the
running guest.  This state is cleanup in machine reset, where it is
assumed that this state represents a device that is pending unplug, and
the device is hotunpluged from the board. Until the reset occurs, any
hotunplug operation of the same device is forbid because there is a
pending unplug state.

This behavior has at least one undesirable side effect. A long standing
pending unplug state is, more often than not, the result of a hotunplug
error. The user had to dealt with it, since retrying to unplug the
device is noy allowed, and then in the machine reset we're removing the
device from the guest. This means that we're failing the user twice -
failed to hotunplug when asked, then hotunplugged without notice.

Solutions to this problem range between trying to predict when the
hotunplug will fail and forbid the operation from the QEMU layer, from
opening up the IRQ queue to allow for multiple hotunplug attempts, from
telling the users to 'reboot the machine if something goes wrong'. The
first solution is flawed because we can't fully predict guest behavior
from QEMU, the second solution is a trial and error remediation that
counts on a hope that the unplug will eventually succeed, and the third
is ... well.

This patch introduces a crude, but effective solution to hotunplug
errors in the pSeries machine. For each unplug done, we'll timeout after
some time. If a certain amount of time passes, we'll cleanup the
hotunplug state from the machine.  During the timeout period, any unplug
operations in the same device will still be blocked. After that, we'll
assume that the guest failed the operation, and allow the user to try
again. If the timeout is too short we'll prevent legitimate hotunplug
situations to occur, so we'll need to overestimate the regular time an
unplug operation takes to succeed to account that.

The true solution for the hotunplug errors in the pSeries machines is a
PAPR change to allow for the guest to warn the platform about it. For
now, the work done in this timeout design can be used for the new PAPR
'abort hcall' in the future, given that for both cases we'll need code
to cleanup the existing unplug states of the DRCs.

At this moment we're adding the basic wiring of the timer into the DRC.
Next patch will use the timer to timeout failed CPU hotunplugs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210222194531.62717-4-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c         | 40 ++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_drc.h |  4 ++++
 2 files changed, 44 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 67041fb212..27adbc5c30 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -57,6 +57,8 @@ static void spapr_drc_release(SpaprDrc *drc)
     drck->release(drc->dev);
 
     drc->unplug_requested = false;
+    timer_del(drc->unplug_timeout_timer);
+
     g_free(drc->fdt);
     drc->fdt = NULL;
     drc->fdt_start_offset = 0;
@@ -370,6 +372,17 @@ static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
     } while (fdt_depth != 0);
 }
 
+static void spapr_drc_start_unplug_timeout_timer(SpaprDrc *drc)
+{
+    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
+
+    if (drck->unplug_timeout_seconds != 0) {
+        timer_mod(drc->unplug_timeout_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  drck->unplug_timeout_seconds * 1000);
+    }
+}
+
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d)
 {
     trace_spapr_drc_attach(spapr_drc_index(drc));
@@ -475,11 +488,23 @@ static bool spapr_drc_needed(void *opaque)
         spapr_drc_unplug_requested(drc);
 }
 
+static int spapr_drc_post_load(void *opaque, int version_id)
+{
+    SpaprDrc *drc = opaque;
+
+    if (drc->unplug_requested) {
+        spapr_drc_start_unplug_timeout_timer(drc);
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_spapr_drc = {
     .name = "spapr_drc",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = spapr_drc_needed,
+    .post_load = spapr_drc_post_load,
     .fields  = (VMStateField []) {
         VMSTATE_UINT32(state, SpaprDrc),
         VMSTATE_END_OF_LIST()
@@ -490,6 +515,15 @@ static const VMStateDescription vmstate_spapr_drc = {
     }
 };
 
+static void drc_unplug_timeout_cb(void *opaque)
+{
+    SpaprDrc *drc = opaque;
+
+    if (drc->unplug_requested) {
+        drc->unplug_requested = false;
+    }
+}
+
 static void drc_realize(DeviceState *d, Error **errp)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(d);
@@ -512,6 +546,11 @@ static void drc_realize(DeviceState *d, Error **errp)
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
     g_free(link_name);
+
+    drc->unplug_timeout_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                             drc_unplug_timeout_cb,
+                                             drc);
+
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
                      drc);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
@@ -529,6 +568,7 @@ static void drc_unrealize(DeviceState *d)
     name = g_strdup_printf("%x", spapr_drc_index(drc));
     object_property_del(root_container, name);
     g_free(name);
+    timer_free(drc->unplug_timeout_timer);
 }
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 02a63b3666..38ec4c8091 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -187,6 +187,8 @@ typedef struct SpaprDrc {
     bool unplug_requested;
     void *fdt;
     int fdt_start_offset;
+
+    QEMUTimer *unplug_timeout_timer;
 } SpaprDrc;
 
 struct SpaprMachineState;
@@ -209,6 +211,8 @@ typedef struct SpaprDrcClass {
 
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
+
+    int unplug_timeout_seconds;
 } SpaprDrcClass;
 
 typedef struct SpaprDrcPhysical {
-- 
2.29.2


