Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259862FB1E5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:49:00 +0100 (CET)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kp1-00018j-4R
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQu-0001WU-Td; Tue, 19 Jan 2021 01:24:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33095 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQs-0000ad-4u; Tue, 19 Jan 2021 01:24:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrZ6Yk9z9ssD; Tue, 19 Jan 2021 17:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037406;
 bh=bUdcRt/C02JGH6ZSqYyd7wasHsvkSZHIq6uK/d97gi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLxKn5r0JNZNlw3miy6CkLlFkl1amhhg1InXipQKLmXLmRsn4BfBdSmRISUlPpNGq
 CWIQ3YIyixwpyu2537yN5UGA9wN6j061tsaCdvDHw3mER13m9bnkxp/OK1pAbH1bqG
 9O+KHQ1FcF14veipSdHMKffn61c3RKdvbfv2sg5M=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/13] spapr: Improve handling of memory unplug with old guests
Date: Tue, 19 Jan 2021 17:23:14 +1100
Message-Id: <20210119062318.13857-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

From: Greg Kurz <groug@kaod.org>

Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
trying to unplug memory from a guest that doesn't support it (eg. rhel6)
no longer generates an error like it used to. Instead, it leaves the
memory around : only a subsequent reboot or manual use of drmgr within
the guest can complete the hot-unplug sequence. A flag was added to
SpaprMachineClass so that this new behavior only applies to the default
machine type.

We can do better. CAS processes all pending hot-unplug requests. This
means that we don't really care about what the guest supports if
the hot-unplug request happens before CAS.

All guests that we care for, even old ones, set enough bits in OV5
that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
heuristic to decide if CAS has already occured or not.

Always accept unplug requests that happen before CAS since CAS will
process them. Restore the previous behavior of rejecting them after
CAS when we know that the guest doesn't support memory hot-unplug.

This behavior is suitable for all machine types : this allows to
drop the pre_6_0_memory_unplug flag.

Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              | 24 +++++++++++++-----------
 hw/ppc/spapr_events.c       |  3 +--
 hw/ppc/spapr_ovec.c         |  7 +++++++
 include/hw/ppc/spapr.h      |  2 +-
 include/hw/ppc/spapr_ovec.h |  1 +
 5 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2c403b574e..6c47466fc2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(HotplugHandler *hotplug_dev,
     }
 }
 
+bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
+{
+    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
+        /*
+         * CAS will process all pending unplug requests.
+         *
+         * HACK: a guest could theoretically have cleared all bits in OV5,
+         * but none of the guests we care for do.
+         */
+        spapr_ovec_empty(spapr->ov5_cas);
+}
+
 static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_dev,
                                                 DeviceState *dev, Error **errp)
 {
@@ -4056,16 +4068,9 @@ static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_dev,
     SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        if (!smc->pre_6_0_memory_unplug ||
-            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
+        if (spapr_memory_hot_unplug_supported(sms)) {
             spapr_memory_unplug_request(hotplug_dev, dev, errp);
         } else {
-            /* NOTE: this means there is a window after guest reset, prior to
-             * CAS negotiation, where unplug requests will fail due to the
-             * capability not being detected yet. This is a bit different than
-             * the case with PCI unplug, where the events will be queued and
-             * eventually handled by the guest after boot
-             */
             error_setg(errp, "Memory hot unplug not supported for this guest");
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
@@ -4543,11 +4548,8 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
-    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
-
     spapr_machine_6_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
-    smc->pre_6_0_memory_unplug = true;
 }
 
 DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 6aedd988b3..d51daedfa6 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -658,8 +658,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
         /* we should not be using count_indexed value unless the guest
          * supports dedicated hotplug event source
          */
-        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug ||
-                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
+        g_assert(spapr_memory_hot_unplug_supported(spapr));
         hp->drc_id.count_indexed.count =
             cpu_to_be32(drc_id->count_indexed.count);
         hp->drc_id.count_indexed.index =
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index dd003f1763..b2567caa5c 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -125,6 +125,13 @@ bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr)
     return test_bit(bitnr, ov->bitmap) ? true : false;
 }
 
+bool spapr_ovec_empty(SpaprOptionVector *ov)
+{
+    g_assert(ov);
+
+    return bitmap_empty(ov->bitmap, OV_MAXBITS);
+}
+
 static void guest_byte_to_bitmap(uint8_t entry, unsigned long *bitmap,
                                  long bitmap_offset)
 {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 1cc19575f5..3ad2ff7132 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -142,7 +142,6 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
-    bool pre_6_0_memory_unplug;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio, 
@@ -950,4 +949,5 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
 
 void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
 hwaddr spapr_get_rtas_addr(void);
+bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
 #endif /* HW_SPAPR_H */
diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index d4dee9e06a..48b716a060 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -71,6 +71,7 @@ void spapr_ovec_cleanup(SpaprOptionVector *ov);
 void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
 void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
 bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
+bool spapr_ovec_empty(SpaprOptionVector *ov);
 SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
 int spapr_dt_ovec(void *fdt, int fdt_offset,
                   SpaprOptionVector *ov, const char *name);
-- 
2.29.2


