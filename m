Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105693C1608
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:32:04 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W0Q-0001LO-S0
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmx-0000QN-Nj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmu-0008CZ-FH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: by mail-ej1-x62f.google.com with SMTP id nd37so10295260ejc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsiydnwXi2pVHwHvf7cAuq4Vujnf6TZXOmMKdhvCc9I=;
 b=lRrU8n/Z7nnHVscKohvLvzrKFnVVZ5S2Av8WGemu9orNrA32EfeG7/W8fLthG3sXiy
 PMaNJ61FSjFuH0A7xdWjCdAbCwNvNhq6TVDbnZ359wcj++yReDUt7NI62uobmJEXz+s8
 hvdv8wAggCk7KRRBKFCWNsDOuCG2E2X+Qnau/s0dFQUz5IZx/ruYC6246jVBz/7wF9Y1
 4Bh+dfIQ2g7C3PbZm1MOsx4eH2pkkL+RHSLFSnqP8qt03Gtz5A/OEKGt27+WRjtGkcys
 I+ZMUBas7RJbus/bzpC5MP2yTyYhmHFuA5BM5V7p6jSmE0DblXj2QLRs/8xiUIHobqoK
 Kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LsiydnwXi2pVHwHvf7cAuq4Vujnf6TZXOmMKdhvCc9I=;
 b=O/31GCxTjYZwDH/wojFnHBghOsDX2ibIeTr800vHqhJzrc+s5POtQ+GN27PVo01Emb
 ewQQ2XWton+TmvPDRRBuDB8fqO508wMnghUOytkPH5Jk3qI/dl7EivifUiki9RCHz5X5
 6ofvl+rph0NID9ukakZfnRjJcHl1Qut9KzHx3d8NQpy4sGarEp5QOi1m41dynLo5xiDR
 5+M/fkBWIzcxFonzbijtyG8V7QmsEURd4yg0BmQu+Y138n7bA4fXAD9YDupBSlW5vUqv
 C1pprz1FTDh70i+0Sb+t7Vxyp8CLiWedXd18D298VP8qrUfmVp2p1BI9doGo9kDZKuL1
 orFw==
X-Gm-Message-State: AOAM533J6Nz9B/cOWZaWppoMmET1hN33nBft0WwCzs7998C8aTnnD11U
 iB6LkX+JIszJqNnoDstLxbMJNSt8myU=
X-Google-Smtp-Source: ABdhPJzt+Ffy3CX7Syy2AHxTL0zYsTeS6n2abxQ2TNUF6Ds/bcT0LUrATfTkrd3ZN9zt6fUXf+GV2w==
X-Received: by 2002:a17:907:5096:: with SMTP id
 fv22mr4801840ejc.525.1625757483190; 
 Thu, 08 Jul 2021 08:18:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/48] modules: use modinfo for qom load
Date: Thu,  8 Jul 2021 17:17:19 +0200
Message-Id: <20210708151748.408754-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Use module database to figure which module implements a given QOM type.
Drop hard-coded object list.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-16-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 77 ++++++++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 53 deletions(-)

diff --git a/util/module.c b/util/module.c
index 7d7b69cbda..745ae0fb20 100644
--- a/util/module.c
+++ b/util/module.c
@@ -280,80 +280,51 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     return success;
 }
 
-/*
- * Building devices and other qom objects modular is mostly useful in
- * case they have dependencies to external shared libraries, so we can
- * cut down the core qemu library dependencies.  Which is the case for
- * only a very few devices & objects.
- *
- * So with the expectation that this will be rather the exception than
- * the rule and the list will not gain that many entries, go with a
- * simple manually maintained list for now.
- *
- * The list must be sorted by module (module_load_qom_all() needs this).
- */
-static struct {
-    const char *type;
-    const char *prefix;
-    const char *module;
-} const qom_modules[] = {
-    { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
-    { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
-    { "usb-redir",             "hw-", "usb-redirect"          },
-    { "qxl-vga",               "hw-", "display-qxl"           },
-    { "qxl",                   "hw-", "display-qxl"           },
-    { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
-    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu-gl" },
-    { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
-    { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-gl-pci",     "hw-", "display-virtio-gpu-pci-gl" },
-    { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
-    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
-    { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
-    { "virtio-vga",            "hw-", "display-virtio-vga"    },
-    { "virtio-vga-gl",         "hw-", "display-virtio-vga-gl" },
-    { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
-    { "chardev-braille",       "chardev-", "baum"             },
-    { "chardev-spicevmc",      "chardev-", "spice"            },
-    { "chardev-spiceport",     "chardev-", "spice"            },
-};
+#ifdef CONFIG_MODULES
 
 static bool module_loaded_qom_all;
 
 void module_load_qom_one(const char *type)
 {
-    int i;
+    const QemuModinfo *modinfo;
+    const char **sl;
 
     if (!type) {
         return;
     }
-    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
-        if (strcmp(qom_modules[i].type, type) == 0) {
-            module_load_one(qom_modules[i].prefix,
-                            qom_modules[i].module,
-                            false);
-            return;
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->objs) {
+            continue;
+        }
+        for (sl = modinfo->objs; *sl != NULL; sl++) {
+            if (strcmp(type, *sl) == 0) {
+                module_load_one("", modinfo->name, false);
+            }
         }
     }
 }
 
 void module_load_qom_all(void)
 {
-    int i;
+    const QemuModinfo *modinfo;
 
     if (module_loaded_qom_all) {
         return;
     }
-    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
-        if (i > 0 && (strcmp(qom_modules[i - 1].module,
-                             qom_modules[i].module) == 0 &&
-                      strcmp(qom_modules[i - 1].prefix,
-                             qom_modules[i].prefix) == 0)) {
-            /* one module implementing multiple types -> load only once */
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->objs) {
             continue;
         }
-        module_load_one(qom_modules[i].prefix, qom_modules[i].module, true);
+        module_load_one("", modinfo->name, false);
     }
     module_loaded_qom_all = true;
 }
+
+#else
+
+void module_load_qom_one(const char *type) {}
+void module_load_qom_all(void) {}
+
+#endif
-- 
2.31.1



