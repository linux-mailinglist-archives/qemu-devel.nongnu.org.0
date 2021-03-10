Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C4333451
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:19:31 +0100 (CET)
Received: from localhost ([::1]:37248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqJm-0008PT-DT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAt-0003XO-Ot; Tue, 09 Mar 2021 23:10:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34123 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAp-0004AL-Gn; Tue, 09 Mar 2021 23:10:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd6Fc9z9sWr; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=3JVFh3T5/1SjVQVjHQbKQS4RpDisM0JMdcKLl9/GTMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUXCMsH3S8bFAWQNMif5Pt2XOcHYsxTCnyUTRZVUViIhzlTs1ZW4GkS7hi/p5y0Fx
 vZ9k8qBFEXwvPksv5TbI6h0ICQfcX1MAwcXMR3WPVxrbmGXk43VcEwVmFzXyR7JO9E
 A7ZBsJvhmXbBBY75D9F83628vj9BYU2FQv9x87dw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/20] spapr_drc.c: add hotunplug timeout for CPUs
Date: Wed, 10 Mar 2021 15:09:53 +1100
Message-Id: <20210310041002.333813-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Xujun Ma <xuma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

There is a reliable way to make a CPU hotunplug fail in the pseries
machine. Hotplug a CPU A, then offline all other CPUs inside the guest
but A. When trying to hotunplug A the guest kernel will refuse to do it,
because A is now the last online CPU of the guest. PAPR has no 'error
callback' in this situation to report back to the platform, so the guest
kernel will deny the unplug in silent and QEMU will never know what
happened. The unplug pending state of A will remain until the guest is
shutdown or rebooted.

Previous attempts of fixing it (see [1] and [2]) were aimed at trying to
mitigate the effects of the problem. In [1] we were trying to guess
which guest CPUs were online to forbid hotunplug of the last online CPU
in the QEMU layer, avoiding the scenario described above because QEMU is
now failing in behalf of the guest. This is not robust because the last
online CPU of the guest can change while we're in the middle of the
unplug process, and our initial assumptions are now invalid. In [2] we
were accepting that our unplug process is uncertain and the user should
be allowed to spam the IRQ hotunplug queue of the guest in case the CPU
hotunplug fails.

This patch presents another alternative, using the timeout
infrastructure introduced in the previous patch. CPU hotunplugs in the
pSeries machine will now timeout after 15 seconds. This is a long time
for a single CPU unplug to occur, regardless of guest load - although
the user is *strongly* encouraged to *not* hotunplug devices from a
guest under high load - and we can be sure that something went wrong if
it takes longer than that for the guest to release the CPU (the same
can't be said about memory hotunplug - more on that in the next patch).

Timing out the unplug operation will reset the unplug state of the CPU
and allow the user to try it again, regardless of the error situation
that prevented the hotunplug to occur. Of all the not so pretty
fixes/mitigations for CPU hotunplug errors in pSeries, timing out the
operation is an admission that we have no control in the process, and
must assume the worst case if the operation doesn't succeed in a
sensible time frame.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03353.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04400.html

Reported-by: Xujun Ma <xuma@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210222194531.62717-5-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c             |  4 ++++
 hw/ppc/spapr_drc.c         | 13 +++++++++++++
 include/hw/ppc/spapr_drc.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b066df68cb..ecce8abf14 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3724,6 +3724,10 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
+    } else {
+        error_setg(errp, "core-id %d unplug is still pending, %d seconds "
+                   "timeout remaining",
+                   cc->core_id, spapr_drc_unplug_timeout_remaining_sec(drc));
     }
 }
 
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 27adbc5c30..fd2e45640f 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -409,6 +409,8 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
 
     drc->unplug_requested = true;
 
+    spapr_drc_start_unplug_timeout_timer(drc);
+
     if (drc->state != drck->empty_state) {
         trace_spapr_drc_awaiting_quiesce(spapr_drc_index(drc));
         return;
@@ -417,6 +419,16 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
     spapr_drc_release(drc);
 }
 
+int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
+{
+    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_timer)) {
+        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expire_time) -
+                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;
+    }
+
+    return 0;
+}
+
 bool spapr_drc_reset(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
@@ -710,6 +722,7 @@ static void spapr_drc_cpu_class_init(ObjectClass *k, void *data)
     drck->drc_name_prefix = "CPU ";
     drck->release = spapr_core_release;
     drck->dt_populate = spapr_core_dt_populate;
+    drck->unplug_timeout_seconds = 15;
 }
 
 static void spapr_drc_pci_class_init(ObjectClass *k, void *data)
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 38ec4c8091..26599c385a 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -248,6 +248,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
  */
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_unplug_request(SpaprDrc *drc);
+int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc);
 
 /*
  * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
-- 
2.29.2


