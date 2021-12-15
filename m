Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145704758C4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:22:54 +0100 (CET)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTJ7-0005GV-0O
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:22:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxT6U-00075V-IK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:09:51 -0500
Received: from [2a00:1450:4864:20::42d] (port=33345
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxT6S-00035a-SD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:09:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j9so5691922wrc.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChUJvWaabfm4uxv7Ve8c34LxGrdwC2tsdOorfO3L+BM=;
 b=if57bamXCm0cY5EDkcNFDXeXrFTUlwIg9npd5uu/9Ts0tnbmgjlUcQcEOn9UEjGdWO
 lNi1Kq0LA363kMWwtZgnHqR0kdIPvt2vMCdjwnHDc8oCKhCmhBkrOGARB2xr+2V1GcMk
 0z7cAg/8oJ+20LkhP4LwURsm6pJgCo5IrFLHShppGdCPjAvppVSYKz7RtsMt63Xox7/f
 /9sUpl6twLa2a3cXsa0l29JoGwGP/j14E/AcBtvUXn7NOcwSDGYOLNhiLeolDP2VoS78
 3yPiTITAut+bzgeZQ/xQCPoekINbNHCp0hAA73qEuy2m8isTaeUKexo/h4Ac9YrQT+X7
 zh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChUJvWaabfm4uxv7Ve8c34LxGrdwC2tsdOorfO3L+BM=;
 b=nYWljz9p8NtIGwbvCPZq/8zb6jw0Xkrm4dNhoJPPcv8i5BlLufVCKvzfX2pe9qOEd8
 cKbyjh/nGYFLRaR8eOGQ968XDcXBi4P8kaGXmHppKCygpx5qeLwCXQkK1Y4x5D2hVAQA
 64XqKIhdnxeo85Nu+Ar64arP0t9/dtbUznfWF8A6KyRxmMZURUQomhaJXc2siW8ybyGf
 iYv5hWV6TNAqZJ5svdP6Vr1RuBH4x1bbB8vKL/oFqJ7/ilRA0eH2Rr7q4bujkn7lBmBQ
 +DSdjtgISJRZBmDWQkGVmaLPAWqrdqN/48Tzo+gVzUYEDq5WNq53dLfC0WjjoaJ0YfgP
 ZCTw==
X-Gm-Message-State: AOAM531KijNndli2XicWLBBSM6Gid6cmTTWj49hygfgtEL7aQgAomcyr
 ZvgmPF867pzvBY91QVClUm85bA==
X-Google-Smtp-Source: ABdhPJxNWtKfWf8bUrqC4FAvZmvslb5opwVcVioKGcjmbxctxV36B9ZXJKNTAXnwtOksBNN7PosM1g==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr4065599wrp.4.1639570185346;
 Wed, 15 Dec 2021 04:09:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j11sm1814656wrt.3.2021.12.15.04.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 04:09:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D69E1FF96;
 Wed, 15 Dec 2021 12:09:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Date: Wed, 15 Dec 2021 12:09:26 +0000
Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jerome Forissier <jerome@forissier.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally a guest needs an external source of randomness to properly
enable things like address space randomisation. However in a trusted
boot environment where the firmware will cryptographically verify
components having random data in the DTB will cause verification to
fail. Add a control knob so we can prevent this being added to the
system DTB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Jerome Forissier <jerome@forissier.org>
---
 docs/system/arm/virt.rst |  7 +++++++
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..c86a4808df 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -121,6 +121,13 @@ ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+kaslr-dtb-seed
+  Set ``on``/``off`` to pass a random seed via the guest dtb to use for features
+  like address space randomisation. The default is ``on``. You will want
+  to disable it if your trusted boot chain will verify the DTB it is
+  passed. It would be the responsibility of the firmware to come up
+  with a seed and pass it on if it wants to.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dc6b66ffc8..acd0665fe7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -148,6 +148,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool kaslr_dtb_seed;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe0..4496612e89 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -248,11 +248,15 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    create_kaslr_seed(ms, "/chosen");
+    if (vms->kaslr_dtb_seed) {
+        create_kaslr_seed(ms, "/chosen");
+    }
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        create_kaslr_seed(ms, "/secure-chosen");
+        if (vms->kaslr_dtb_seed) {
+            create_kaslr_seed(ms, "/secure-chosen");
+        }
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
@@ -2236,6 +2240,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->kaslr_dtb_seed;
+}
+
+static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->kaslr_dtb_seed = value;
+}
+
 static char *virt_get_oem_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2765,6 +2783,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_bool(oc, "kaslr-dtb-seed",
+                                   virt_get_kaslr_dtb_seed,
+                                   virt_set_kaslr_dtb_seed);
+    object_class_property_set_description(oc, "kaslr-dtb-seed",
+                                          "Set off to disable passing of kaslr "
+                                          "dtb node to guest");
+
     object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
@@ -2829,6 +2854,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* Supply a kaslr-seed by default */
+    vms->kaslr_dtb_seed = true;
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.30.2


