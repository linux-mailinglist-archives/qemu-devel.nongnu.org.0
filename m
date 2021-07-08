Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F03C15F8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:29:29 +0200 (CEST)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vxw-0003YK-Tk
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmx-0000QB-JD
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmv-0008D5-7C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: by mail-ed1-x530.google.com with SMTP id h2so9075725edt.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4blzcFYDfyCZS+BewUZTETIsp8Hl/UKwSDBrmkzuOI=;
 b=G83r6EVuqfCRCtB0ilbL3UmDVTM6kaUEV7avqKiLLGH/1AhtuwqORGL1kNkMNGaIQC
 r/baWlf8uh50QW56n8APgHg4D18HIthc2N13lAPf2fD2cZHHKYuWM3BZ15QKJ/TjHf6W
 wSpWyqg0XitE/+KJnYirAiTsaG+AiffSDxJaUiUEufN1HPpXR1C78MDeIjdDUU2oqZZ9
 ywVOsvV7iTOQ+IFlnMhlw5UBv7Ji7E7QvC5fp6cnrqVTDUIJkW4h6lyHdydwFiWsdf7Y
 9qdlYpKxD+SP7eWna0sOUteeNlTwzzKNqh72no/VS/LXSpmx6aGJyVWjtCQ3eeKcaJLq
 bj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s4blzcFYDfyCZS+BewUZTETIsp8Hl/UKwSDBrmkzuOI=;
 b=By9u3gQB5hcTMlwZYfGrzufSMXlA4KwCNtaCN7gJDerw4D32Q7tcJIuxvWu7NtMUHM
 4alWuP3gTBZbwqoD8g117ZxpvlPTcCDwEffM9qMq/OdlanzlNt0R1lapxgfYUGwcai0A
 pPOV7qjEDLi5+8alurRFy/d+y6Wf+5VWNbKSVGntBJZtYcotD0b5X6JEmgvIy1t7DSA2
 eYUVYtP4cV/sleHSwNl4kOrK7Dm5o5ZMNjy2oz8U53BerYAGgO+moVer2GxIYJ6QR5ct
 tL3/uoROgvnuUqxT/2qxo2P0HwX21HsFPPpyIKn/bBoMcCytxpcYufMWV/QHEyxbCb03
 lchw==
X-Gm-Message-State: AOAM532q+qpJZ2lLvHKoebGQkztZStMIJPLjMmxhgPpMdycrhK60ks52
 p9UzHXbrpUldoCmNICTv0h3F2yAFl7g=
X-Google-Smtp-Source: ABdhPJzucrTwjQwZUr0dmINiio1FDHYfgIS4XO3BrEdFhF5H7NV0SFIAovS2EPPGVa8Rg/DhhiXVKw==
X-Received: by 2002:a50:fb04:: with SMTP id d4mr18058508edq.143.1625757483854; 
 Thu, 08 Jul 2021 08:18:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/48] modules: use modinfo for qemu opts load
Date: Thu,  8 Jul 2021 17:17:20 +0200
Message-Id: <20210708151748.408754-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Use module database to figure which module adds given QemuOpts group.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-17-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c        | 17 -----------------
 stubs/module-opts.c |  4 ----
 util/module.c       | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7cef3423a7..190b71a0f2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2691,23 +2691,6 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
-#ifdef CONFIG_MODULES
-void qemu_load_module_for_opts(const char *group)
-{
-    static bool spice_tried;
-    if (g_str_equal(group, "spice") && !spice_tried) {
-        ui_module_load_one("spice-core");
-        spice_tried = true;
-    }
-
-    static bool iscsi_tried;
-    if (g_str_equal(group, "iscsi") && !iscsi_tried) {
-        block_module_load_one("iscsi");
-        iscsi_tried = true;
-    }
-}
-#endif
-
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
diff --git a/stubs/module-opts.c b/stubs/module-opts.c
index a7d0e4ad6e..5412429ea8 100644
--- a/stubs/module-opts.c
+++ b/stubs/module-opts.c
@@ -1,6 +1,2 @@
 #include "qemu/osdep.h"
 #include "qemu/config-file.h"
-
-void qemu_load_module_for_opts(const char *group)
-{
-}
diff --git a/util/module.c b/util/module.c
index 745ae0fb20..a9ec2da997 100644
--- a/util/module.c
+++ b/util/module.c
@@ -20,6 +20,7 @@
 #include "qemu/queue.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/config-file.h"
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
@@ -322,8 +323,26 @@ void module_load_qom_all(void)
     module_loaded_qom_all = true;
 }
 
+void qemu_load_module_for_opts(const char *group)
+{
+    const QemuModinfo *modinfo;
+    const char **sl;
+
+    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (!modinfo->opts) {
+            continue;
+        }
+        for (sl = modinfo->opts; *sl != NULL; sl++) {
+            if (strcmp(group, *sl) == 0) {
+                module_load_one("", modinfo->name, false);
+            }
+        }
+    }
+}
+
 #else
 
+void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
 
-- 
2.31.1



