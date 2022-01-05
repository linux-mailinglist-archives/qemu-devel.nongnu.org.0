Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0F4854BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:37:54 +0100 (CET)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57QH-0001If-62
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q6-0004cn-FX
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:33 -0500
Received: from [2a00:1450:4864:20::334] (port=40756
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q4-0006Sp-0g
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:29 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m14-20020a7bcb8e000000b00346da381d59so557172wmi.5
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PR+qxQ2shEV/A+tfSEgZk9rUCgVOrjyYAYISimz0Tis=;
 b=GVMFC3O4RlmooLTibiHBxnIbIg+K3MyuA7x/bxsy7tf0c0Ra4rbk+ZJCmHwZyOMmrN
 PBIDHeoMWlDO0GA7cH1ig2rJYOs3fEAzpAvaaEHHO62QoosnZlHqB47MYYNpw/xpR15f
 SmG8x5rNpBxCtJC6NeElcoP9MvWTYiUxKa2nhKW2CCCc7zv45tcphSGaZlTINcEGuiHN
 U7UmZ8iDYyedbYbGf4jipg0hKzjKUKwXwbIJwTy7qgJbjlsIhGKfaTBrBTGmV9UkNZU0
 UgVsSkOkeP6pexvvYIZ3lWIAmo8m1+wt43NF47VXuOTWEkOrPd1qkxp7meUeDEVwtxoF
 EB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PR+qxQ2shEV/A+tfSEgZk9rUCgVOrjyYAYISimz0Tis=;
 b=w3V3Lz7N5bS1uE7o/9Ph7H+JIqh/TKLZDaa1a9MloEnyzFC/DSZPwDJw6EXXYldg+F
 bWa3KXYhyszLsdQxpbxTN1tkODE5K1dDoMflVSAFEUOiKr1KgotkfLuP1FbnCl0BC/Y0
 b4YEaPloDVcWeKNb51mmtRg5758PaoJRFS3ttklwJ2NiW8pLiGR2tqUkNhpgmu+nAQR9
 zBWBLrlwGCQIWDp58nv/tYXWAXnzeN7Y/MmjkFquDRokhm7c0lD/GSnb0i7uA5rPbFZx
 C0J/tWUtqF6MhPR2YjmXjKlA9lce34fUfDcD0JDbAoZEHvTkkvifXOU5NYO7dP5FLe4O
 /8Fg==
X-Gm-Message-State: AOAM533FseRXzrGx7xqaknLyTHrKt/Vm0BAWosvSZkauD3oLqaAVSZm1
 oI95ljKDh1JL/rkOXUL/C4KfQOTFclhFNA==
X-Google-Smtp-Source: ABdhPJwktN0qMZpAlrQYWqRxr/OtIhR1x4dqa8RPBpwe9KtKw6E9X+CI3/9avHFaDTwOTtr5bmhHaw==
X-Received: by 2002:a1c:4d04:: with SMTP id o4mr2898678wmh.161.1641391226634; 
 Wed, 05 Jan 2022 06:00:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k33sm2765825wms.21.2022.01.05.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B4571FFCD;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 21/34] hw/arm: add control knob to disable kaslr_seed via
 DTB
Date: Wed,  5 Jan 2022 13:49:56 +0000
Message-Id: <20220105135009.1584676-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, f4bug@amsat.org,
 Jerome Forissier <jerome@forissier.org>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, "open list:Virt" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
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
index 6bce595aba..1781e47c76 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
 
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
@@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
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
@@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)
     /* MTE is disabled by default.  */
     vms->mte = false;
 
+    /* Supply a kaslr-seed by default */
+    vms->kaslr_dtb_seed = true;
+
     vms->irqmap = a15irqmap;
 
     virt_flash_create(vms);
-- 
2.30.2


