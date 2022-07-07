Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63B56A232
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:39:23 +0200 (CEST)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qmw-0001sg-En
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbd-0007h1-Ve
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbb-0006vC-2D
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z12so16480529wrq.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A1Q2JKEPW4FUywVz3aNzReARCY9uYbuNteUss9UEJ04=;
 b=sxzhwwaA261wS5wkrMUGNdhLz7Vg2quRnngFC8nSLDRs/VNKvy9SrN/hKP6igCE9HL
 9n7N5X0jRjQgR2Ps6cMyfY9ZBwKE+2Hj5oGqburRhCSACRsfT4e24JjVt/fPRQNrn1Eb
 LNRcxKDrRPpoNTXv7sIqp0ffO+U/QOktZctLC7g7gaV7OoClBg/m4HmtV5CzoNokajq+
 vuM0Xc8QpCZWMPsPQR/3meslA9J3YIMoBiWE/bvc4B1MAI7J3orWJyrGH3NRJcttkiHj
 gcYlWTA/xQW74Ps1fGtOTkqQtg8RNpIUCnbfLKVrW1Tyit3gAZ52tfakJHKYVD71y5iL
 M+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1Q2JKEPW4FUywVz3aNzReARCY9uYbuNteUss9UEJ04=;
 b=V/5OB8vVdsfEj6IropmQSOE1cJ/4EttJqp1mO/NsgOknIqY5V8XeGrfr6PrDWihSMD
 hqXpYk1DIxxe2cAEjfdm8UW6sTs+GdgtMoAUuP69rWqun9C5BRSkZh9QGXRqj8UE+lmS
 3MkBQRZCnz1f62uiFWJ9kI8UA5Dpr7t6Bby1IRrket3t9XZSXil4T5KQ5qprwcTjp1ta
 JVHf9W4Inewfi7aQuerjqlwtNJZzAiEeJ5gQuHe4uoJ0fMf9aFONsfd59UImkhR0z1W9
 ze0fLtW+7ntBKkawvzLbtHotEYVGDVHFflqE8JmyuSv94vBSAdtEl4UYmN1dLDNmu2Wd
 mwbQ==
X-Gm-Message-State: AJIora/5qMVmx7HDJMfN7YthLbdHETeoq47aM6u92T8MNGyZ9LRBeKQK
 PWD94BmtZxZHo5JNP5rmiXqKpETgERBXWQ==
X-Google-Smtp-Source: AGRyM1sLXwf+bFW4lsDSGhClIGFD4Cus8qeg1kXJgYBZ2wgh1pTCMeRq/DDq6M3uGGCXRPApbkk2aQ==
X-Received: by 2002:adf:f345:0:b0:21d:6927:ec8f with SMTP id
 e5-20020adff345000000b0021d6927ec8fmr21580522wrp.490.1657196857225; 
 Thu, 07 Jul 2022 05:27:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] hw/arm/virt: dt: add rng-seed property
Date: Thu,  7 Jul 2022 13:27:26 +0100
Message-Id: <20220707122734.288929-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
kaslr-seed property was added, but the equally as important rng-seed
property was forgotten about, which has identical semantics for a
similar purpose. This commit implements it in exactly the same way as
kaslr-seed. It then changes the name of the disabling option to reflect
that this has more to do with randomness vs determinism, rather than
something particular about kaslr.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[PMM: added deprecated.rst section for the deprecation]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst |  8 +++++++
 docs/system/arm/virt.rst  | 17 +++++++++------
 include/hw/arm/virt.h     |  2 +-
 hw/arm/virt.c             | 44 ++++++++++++++++++++++++---------------
 4 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 19a91b575fb..7ee26626d5c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -225,6 +225,14 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
 System emulator machines
 ------------------------
 
+Arm ``virt`` machine ``dtb-kaslr-seed`` property
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``dtb-kaslr-seed`` property on the ``virt`` board has been
+deprecated; use the new name ``dtb-randomness`` instead. The new name
+better reflects the way this property affects all random data within
+the device tree blob, not just the ``kaslr-seed`` node.
+
 PPC 405 ``taihu`` machine (since 7.0)
 '''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3d1058a80c0..3b6ba69a9a9 100644
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
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 15feabac63d..6ec479ca2b7 100644
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
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5502aa60c83..9633f822f36 100644
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
 
@@ -2340,18 +2344,18 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -2980,12 +2984,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -3053,8 +3063,8 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
-    /* Supply a kaslr-seed by default */
-    vms->dtb_kaslr_seed = true;
+    /* Supply kaslr-seed and rng-seed by default */
+    vms->dtb_randomness = true;
 
     vms->irqmap = a15irqmap;
 
-- 
2.25.1


