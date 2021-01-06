Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0452EB89B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:46:34 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzmL-0006hs-Ai
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzek-0005fn-OW; Tue, 05 Jan 2021 22:38:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42103 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzei-0006IG-RQ; Tue, 05 Jan 2021 22:38:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG4Sv9z9sW4; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=MqLChWp/n6WijjmfjZsHO4+ZsPDJqKKaYFCgTPmIWEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jrdr9JHcM8jVAeTd1QSUJRpkPffx9XY6cmt07cYodamiqhep3FqRrI7ckVVCoZ9B/
 BKs89RTmDvkXPOpKyjRa62I5JzpBxz7gGDSrqHZ1XlUWQdX6B6yY43uqvKqzNoEpDS
 wky1StFijy62ZVhWekbZJ6vZh2/f9v/QK/Rm4JPU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/22] spapr: Allow memory unplug to always succeed
Date: Wed,  6 Jan 2021 14:38:02 +1100
Message-Id: <20210106033816.232598-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

It is currently impossible to hot-unplug a memory device between
machine reset and CAS.

(qemu) device_del dimm1
Error: Memory hot unplug not supported for this guest

This limitation was introduced in order to provide an explicit
error path for older guests that didn't support hot-plug event
sources (and thus memory hot-unplug).

The linux kernel has been supporting these since 4.11. All recent
enough guests are thus capable of handling the removal of a memory
device at all time, including during early boot.

Lift the limitation for the latest machine type. This means that
trying to unplug memory from a guest that doesn't support it will
likely just do nothing and the memory will only get removed at
next reboot. Such older guests can still get the existing behavior
by using an older machine type.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160794035064.23292.17560963281911312439.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 6 +++++-
 hw/ppc/spapr_events.c  | 3 ++-
 include/hw/ppc/spapr.h | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 68a3ceb927..9f89b1c298 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4069,7 +4069,8 @@ static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_dev,
     SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        if (spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
+        if (!smc->pre_6_0_memory_unplug ||
+            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
             spapr_memory_unplug_request(hotplug_dev, dev, errp);
         } else {
             /* NOTE: this means there is a window after guest reset, prior to
@@ -4555,8 +4556,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_6_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    smc->pre_6_0_memory_unplug = true;
 }
 
 DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 3f37b49fd8..6aedd988b3 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -658,7 +658,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
         /* we should not be using count_indexed value unless the guest
          * supports dedicated hotplug event source
          */
-        g_assert(spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
+        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug ||
+                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
         hp->drc_id.count_indexed.count =
             cpu_to_be32(drc_id->count_indexed.count);
         hp->drc_id.count_indexed.index =
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index e0f10f252c..06a5b4259f 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -139,6 +139,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_0_memory_unplug;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio, 
-- 
2.29.2


