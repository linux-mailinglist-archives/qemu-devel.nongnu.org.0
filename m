Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD055BB26
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:36:13 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rie-00044T-Re
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org>)
 id 1o5rHM-00051G-HE
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:08:00 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:35718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org>)
 id 1o5rHJ-0000Ti-OU
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:08:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F866B818AB;
 Mon, 27 Jun 2022 16:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BB3C3411D;
 Mon, 27 Jun 2022 16:07:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bPsP0ZAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656346064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gl2bGCwvidHGRf34EOahEdvPd+oVpSmthXOgsUIqYwM=;
 b=bPsP0ZAekNbwOB0Cdfb6aJtjU8MhT0gLYjt3K/juXR/1Nlab216Wnsg5lJ9wYyUBfBDBfw
 lDJnEFcDvwwCqlLuPShirG8ewIXNAbeFR3sKHz3Kgi6eDu++Rt3hLIORxJDk3gypNDEEhh
 2D/L+Wvzkb15blroqATjemOKuErFCJQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d41bbf6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 27 Jun 2022 16:07:43 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hw/arm/virt: dt: add rng-seed property
Date: Mon, 27 Jun 2022 18:07:34 +0200
Message-Id: <20220627160734.749861-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=EJqm=XC=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
kaslr-seed property was added, but the equally as important rng-seed
property was forgotten about, which has identical semantics for a
similar purpose. This commit implements it in exactly the same way as
kaslr-seed.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/virt.c         | 40 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 097238faa7..8a3436a370 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -221,6 +221,16 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
+static void create_rng_seed(MachineState *ms, const char *node)
+{
+    uint8_t seed[32];
+
+    if (qemu_guest_getrandom(&seed, sizeof(seed), NULL)) {
+        return;
+    }
+    qemu_fdt_setprop(ms->fdt, node, "rng-seed", seed, sizeof(seed));
+}
+
 static void create_kaslr_seed(MachineState *ms, const char *node)
 {
     uint64_t seed;
@@ -251,6 +261,9 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
+    if (vms->dtb_rng_seed) {
+        create_rng_seed(ms, "/chosen");
+    }
     if (vms->dtb_kaslr_seed) {
         create_kaslr_seed(ms, "/chosen");
     }
@@ -260,6 +273,9 @@ static void create_fdt(VirtMachineState *vms)
         if (vms->dtb_kaslr_seed) {
             create_kaslr_seed(ms, "/secure-chosen");
         }
+        if (vms->dtb_rng_seed) {
+            create_rng_seed(ms, "/secure-chosen");
+        }
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
@@ -2348,6 +2364,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_dtb_rng_seed(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->dtb_rng_seed;
+}
+
+static void virt_set_dtb_rng_seed(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->dtb_rng_seed = value;
+}
+
 static bool virt_get_dtb_kaslr_seed(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2988,6 +3018,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_bool(oc, "dtb-rng-seed",
+                                   virt_get_dtb_rng_seed,
+                                   virt_set_dtb_rng_seed);
+    object_class_property_set_description(oc, "dtb-rng-seed",
+                                          "Set off to disable passing of rng-seed "
+                                          "dtb node to guest");
+
     object_class_property_add_bool(oc, "dtb-kaslr-seed",
                                    virt_get_dtb_kaslr_seed,
                                    virt_set_dtb_kaslr_seed);
@@ -3061,6 +3098,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* Supply a rng-seed by default */
+    vms->dtb_rng_seed = true;
+
     /* Supply a kaslr-seed by default */
     vms->dtb_kaslr_seed = true;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 15feabac63..cf652f1f3d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -152,6 +152,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool dtb_rng_seed;
     bool dtb_kaslr_seed;
     OnOffAuto acpi;
     VirtGICType gic_version;
-- 
2.35.1


