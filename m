Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FC48C350
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:39:08 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7by7-0001bO-DW
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvK-0007Dt-Vq
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:15 -0500
Received: from [2a00:1450:4864:20::536] (port=44579
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvI-0004iu-Qm
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:14 -0500
Received: by mail-ed1-x536.google.com with SMTP id w16so8648640edc.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHX28DbuMN3e321WwVG/apIaG3UsFppN0tUYzi+lF40=;
 b=xvygSE8cqqFyULW2hwJTnM5zdpbl71GHeMYwgaFXgv/cvbxCO9CbCLMKU4zDCf1IKl
 7HUlMpGJtZnQSPL7Kts5WbechXZ5uP/pVGIm3mVpS9bXSrvve+y0DMyDdSfVizyYiXee
 GFVxB2gY7L2gTtvJYrI+8jVXn4aheX6iWKfNyc7uNosAY3nh6NH7PkQeMs+b521O4Irg
 cFbyRtZIChs+ypU1Q24XLeP+85o/8fC/wNjsFq5pz/N3E0cFMq6rp2uRccfbiPOrJyHi
 6yiup1rUY/wUMeIY3DE8Fc5oJ06YTW3+jEK6CY5agWgfy6OM7CEcSgfFeuLAWvpM8nGx
 AjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHX28DbuMN3e321WwVG/apIaG3UsFppN0tUYzi+lF40=;
 b=xGqDwSDuETfaQfJB/Mbb7cKUjJ6FUgoTBNzSC/zP2R3em4pRToeBZRVSiZP8YtJznH
 i+rdjRYrY34XnwHKQsW9EuOUX1xonBWO1sY7ZMmVrGVlGF/T1/pMwjdK6KYixsFbtrwU
 nPfMhZkWJGFRm6jOth8AICNwgapfIajMwKrmgdHAb04sLYYWMrwOB4pWIPkNSz2BLDwV
 4SikyhfTJ5qLpO5KUXmA9MO8qdK8HoB7xFg+BIQ9YEFFxVVVZtV91iRVBvbLEhDZZTAo
 mTpoCqsWKv4P5jSL6K2O8K3gZB3RvE6Dhgi34YIJAaz5/4zSd7TtTdl4pad0IkmFzJ5O
 djKQ==
X-Gm-Message-State: AOAM5302lzn39oB7Dxe92Bo7QnxTg6edyRK0MwT8JOMuy4R8u//gXsne
 LOQGNHCZMQhDZ60dMx+u8fisAw==
X-Google-Smtp-Source: ABdhPJzDKFuGhu/5SsUvibP6TkCo/JJ6pYsKQW8DliyQF3UdDbhX1LpxSVLI+/NFSz9ITbWkLjQgIA==
X-Received: by 2002:a17:907:7602:: with SMTP id
 jx2mr7342937ejc.92.1641987371152; 
 Wed, 12 Jan 2022 03:36:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id hd17sm4394939ejc.58.2022.01.12.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32F721FFCD;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/31] hw/arm: add control knob to disable kaslr_seed via DTB
Date: Wed, 12 Jan 2022 11:27:12 +0000
Message-Id: <20220112112722.3641051-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jerome Forissier <jerome@forissier.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 "open list:Virt" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally a guest needs an external source of randomness to properly
enable things like address space randomisation. However in a trusted
boot environment where the firmware will cryptographically verify
components having random data in the DTB will cause verification to
fail. Add a control knob so we can prevent this being added to the
system DTB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Acked-by: Jerome Forissier <jerome@forissier.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20220105135009.1584676-22-alex.bennee@linaro.org>

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..1544632b67 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -121,6 +121,14 @@ ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+dtb-kaslr-seed
+  Set ``on``/``off`` to pass a random seed via the guest dtb
+  kaslr-seed node (in both "/chosen" and /secure-chosen) to use
+  for features like address space randomisation. The default is
+  ``on``. You will want to disable it if your trusted boot chain will
+  verify the DTB it is passed. It would be the responsibility of the
+  firmware to come up with a seed and pass it on if it wants to.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dc6b66ffc8..be0534608f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -148,6 +148,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool dtb_kaslr_seed;
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b45b52c90e..84c2444fff 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    create_kaslr_seed(ms, "/chosen");
+    if (vms->dtb_kaslr_seed) {
+        create_kaslr_seed(ms, "/chosen");
+    }
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        create_kaslr_seed(ms, "/secure-chosen");
+        if (vms->dtb_kaslr_seed) {
+            create_kaslr_seed(ms, "/secure-chosen");
+        }
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
@@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
     vms->its = value;
 }
 
+static bool virt_get_dtb_kaslr_seed(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->dtb_kaslr_seed;
+}
+
+static void virt_set_dtb_kaslr_seed(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->dtb_kaslr_seed = value;
+}
+
 static char *virt_get_oem_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
+    object_class_property_add_bool(oc, "dtb-kaslr-seed",
+                                   virt_get_dtb_kaslr_seed,
+                                   virt_set_dtb_kaslr_seed);
+    object_class_property_set_description(oc, "dtb-kaslr-seed",
+                                          "Set off to disable passing of kaslr-seed "
+                                          "dtb node to guest");
+
     object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
@@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* Supply a kaslr-seed by default */
+    vms->dtb_kaslr_seed = true;
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.30.2


