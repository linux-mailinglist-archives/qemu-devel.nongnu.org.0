Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D556186F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 12:41:28 +0200 (CEST)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6rbx-0003Lw-N9
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6ra8-0002T9-Hf
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:39:33 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:48168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6ra6-0004RD-9f
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 06:39:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 591FC6224A;
 Thu, 30 Jun 2022 10:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 569CCC34115;
 Thu, 30 Jun 2022 10:39:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gRFor25L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656585565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/ufmWZXz39vcuBww5VjiB4lAt2QPm9liRwFbzntMoA=;
 b=gRFor25LuNIIbbQO0vVN6vMAlRyY/Ujv2HaqQIYdWfuh6CxR3tjly4S7AAGmyWPgMZOxqJ
 +Pg1dN8lyxxtnSSUKqWuiV7YhaJmKU7zHvOBIt71tvK5K4IgFf9rUdxAcb2MbtYWAUOY6d
 m0R8ua5VN+miMxJ9IvCwGtx6C8muf+4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3293938d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 10:39:25 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] hw/arm/virt: dt: add rng-seed property
Date: Thu, 30 Jun 2022 12:37:39 +0200
Message-Id: <20220630103739.1727346-1-Jason@zx2c4.com>
In-Reply-To: <Yr15VHaAVQ11wlw+@zx2c4.com>
References: <Yr15VHaAVQ11wlw+@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
kaslr-seed. It then changes the name of the disabling option to reflect
that this has more to do with randomness vs determinism, rather than
something particular about kaslr.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 docs/system/arm/virt.rst | 17 ++++++++++------
 hw/arm/virt.c            | 44 ++++++++++++++++++++++++----------------
 include/hw/arm/virt.h    |  2 +-
 3 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3d1058a80c..3b6ba69a9a 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -126,13 +126,18 @@ ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+dtb-randomness
+  Set ``on``/``off`` to pass random seeds via the guest DTB
+  rng-seed and kaslr-seed nodes (in both "/chosen" and
+  "/secure-chosen") to use for features like the random number
+  generator and address space randomisation. The default is
+  ``on``. You will want to disable it if your trusted boot chain
+  will verify the DTB it is passed, since this option causes the
+  DTB to be non-deterministic. It would be the responsibility of
+  the firmware to come up with a seed and pass it on if it wants to.
+
 dtb-kaslr-seed
-  Set ``on``/``off`` to pass a random seed via the guest dtb
-  kaslr-seed node (in both "/chosen" and /secure-chosen) to use
-  for features like address space randomisation. The default is
-  ``on``. You will want to disable it if your trusted boot chain will
-  verify the DTB it is passed. It would be the responsibility of the
-  firmware to come up with a seed and pass it on if it wants to.
+  A deprecated synonym for dtb-randomness.
 
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 097238faa7..924ded7f85 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -221,14 +221,18 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
-static void create_kaslr_seed(MachineState *ms, const char *node)
+static void create_randomness(MachineState *ms, const char *node)
 {
-    uint64_t seed;
+    struct {
+        uint64_t kaslr;
+        uint8_t rng[32];
+    } seed;
 
     if (qemu_guest_getrandom(&seed, sizeof(seed), NULL)) {
         return;
     }
-    qemu_fdt_setprop_u64(ms->fdt, node, "kaslr-seed", seed);
+    qemu_fdt_setprop_u64(ms->fdt, node, "kaslr-seed", seed.kaslr);
+    qemu_fdt_setprop(ms->fdt, node, "rng-seed", seed.rng, sizeof(seed.rng));
 }
 
 static void create_fdt(VirtMachineState *vms)
@@ -251,14 +255,14 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    if (vms->dtb_kaslr_seed) {
-        create_kaslr_seed(ms, "/chosen");
+    if (vms->dtb_randomness) {
+        create_randomness(ms, "/chosen");
     }
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        if (vms->dtb_kaslr_seed) {
-            create_kaslr_seed(ms, "/secure-chosen");
+        if (vms->dtb_randomness) {
+            create_randomness(ms, "/secure-chosen");
         }
     }
 
@@ -2348,18 +2352,18 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
-static bool virt_get_dtb_kaslr_seed(Object *obj, Error **errp)
+static bool virt_get_dtb_randomness(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    return vms->dtb_kaslr_seed;
+    return vms->dtb_randomness;
 }
 
-static void virt_set_dtb_kaslr_seed(Object *obj, bool value, Error **errp)
+static void virt_set_dtb_randomness(Object *obj, bool value, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    vms->dtb_kaslr_seed = value;
+    vms->dtb_randomness = value;
 }
 
 static char *virt_get_oem_id(Object *obj, Error **errp)
@@ -2988,12 +2992,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_bool(oc, "dtb-randomness",
+                                   virt_get_dtb_randomness,
+                                   virt_set_dtb_randomness);
+    object_class_property_set_description(oc, "dtb-randomness",
+                                          "Set off to disable passing random or "
+                                          "non-deterministic dtb nodes to guest");
+
     object_class_property_add_bool(oc, "dtb-kaslr-seed",
-                                   virt_get_dtb_kaslr_seed,
-                                   virt_set_dtb_kaslr_seed);
+                                   virt_get_dtb_randomness,
+                                   virt_set_dtb_randomness);
     object_class_property_set_description(oc, "dtb-kaslr-seed",
-                                          "Set off to disable passing of kaslr-seed "
-                                          "dtb node to guest");
+                                          "Deprecated synonym of dtb-randomness");
 
     object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
@@ -3061,8 +3071,8 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
-    /* Supply a kaslr-seed by default */
-    vms->dtb_kaslr_seed = true;
+    /* Supply kaslr-seed and rng-seed by default */
+    vms->dtb_randomness = true;
 
     vms->irqmap = a15irqmap;
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 15feabac63..6ec479ca2b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -152,7 +152,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
-    bool dtb_kaslr_seed;
+    bool dtb_randomness;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
-- 
2.35.1


