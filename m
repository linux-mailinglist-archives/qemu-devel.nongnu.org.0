Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0B3C15F4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:28:57 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VxQ-0001eM-3x
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmy-0000UB-OB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmw-0008Dq-K5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id cy23so4051398edb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKXLncUdY1O92DDL+MV//B7jAo0Y2NMb/vk36fn5i5s=;
 b=Elp5W8CmV/6IS6u4+AF9A6Npt+b0dNi476POgGep3S539Urm54TbQk0Zocru+a1bZm
 WjSvetZ6tML+Mmj1aGHDyfByiUW6Xa1obRL5vL6wiidTV3C3rSx75BkSSErFbnZXtyr/
 Mq0uXbiNcrlYhlHIduSGMdanT4cdUBYXSiqdi379YeZokDqgTuYIls1kO+wPaUsSSnsd
 sKJJtDVwcfek7Ltz2CZI+vYTivg0qU+EGbzUKucKLL6/vBD6+AgkKbiuBTJ5iFysYAmC
 4r10aGs6/JHXmVdEtZMtxGaEGnkIbMvL+Si97Q8IA6PAEbaaXG71Mli4ujz8Xe6aykU8
 vF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QKXLncUdY1O92DDL+MV//B7jAo0Y2NMb/vk36fn5i5s=;
 b=P4Xk6Yt9gG32PXsTycs/I+RtHJPF4LCwU4dZimp4G+Mu7nRX4ULtxk2Ttp67GewT2t
 SzP2hXKVUjr4iy2EVh1U3O2Qg0i0WEsyvExK+kikd2UlQxPP3puM+xuRuGt/MpxU+azV
 yzjFm+IpE1fpRTR5CaEx6xMBQytJFF09DaGRHwe5KkJqf2rnNiWeFT9vkuysj0G9q8CT
 JBcQMdsqQbf5LjKS+h2V8fbkAxTif/EoM+tCmsYJcIfpeYkDWrR7XrYRwi9ByNbnZ7ge
 DPsJBqqdP0BKmlHW7DC0AnJVRf98ou8RI01+TcskQKPpjEKTIYckN5zsZPik3eimlvfh
 c9Rg==
X-Gm-Message-State: AOAM532hd+3lIcgcdq4rg6t138NyRvCIWXf0mIxtJtC4bZ4WaE3bqvoX
 ZgWPSLT6/8W1peFZSS7DVbRt3iRBEqI=
X-Google-Smtp-Source: ABdhPJxnXjm4A9AK5BNPnSjZ9Q0d+f/dMgzUdgl2ogfyzEQGYKJ7IXHJrd8clRxPk2z9zxwFJnQPoQ==
X-Received: by 2002:a05:6402:451:: with SMTP id
 p17mr38353898edw.332.1625757485375; 
 Thu, 08 Jul 2021 08:18:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/48] modules: check arch and block load on mismatch
Date: Thu,  8 Jul 2021 17:17:22 +0200
Message-Id: <20210708151748.408754-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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

Add module_allow_arch() to set the target architecture.
In case a module is limited to some arch verify arches
match and ignore the module if not.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-19-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h |  1 +
 softmmu/vl.c          |  3 +++
 util/module.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index a98748d501..7f4b1af819 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -72,6 +72,7 @@ void module_call_init(module_init_type type);
 bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
+void module_allow_arch(const char *arch);
 
 /*
  * module info annotation macros
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 190b71a0f2..2004d57108 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -126,6 +126,8 @@
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
 
+#include "config-host.h"
+
 #define MAX_VIRTIO_CONSOLES 1
 
 typedef struct BlockdevOptionsQueueEntry {
@@ -2740,6 +2742,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
 #ifdef CONFIG_MODULES
     module_init_info(qemu_modinfo);
+    module_allow_arch(TARGET_NAME);
 #endif
 
     qemu_init_subsystems();
diff --git a/util/module.c b/util/module.c
index acaaecad56..065aed09ff 100644
--- a/util/module.c
+++ b/util/module.c
@@ -117,12 +117,33 @@ static const QemuModinfo module_info_stub[] = { {
     /* end of list */
 } };
 static const QemuModinfo *module_info = module_info_stub;
+static const char *module_arch;
 
 void module_init_info(const QemuModinfo *info)
 {
     module_info = info;
 }
 
+void module_allow_arch(const char *arch)
+{
+    module_arch = arch;
+}
+
+static bool module_check_arch(const QemuModinfo *modinfo)
+{
+    if (modinfo->arch) {
+        if (!module_arch) {
+            /* no arch set -> ignore all */
+            return false;
+        }
+        if (strcmp(module_arch, modinfo->arch) != 0) {
+            /* mismatch */
+            return false;
+        }
+    }
+    return true;
+}
+
 static int module_load_file(const char *fname, bool mayfail, bool export_symbols)
 {
     GModule *g_module;
@@ -224,6 +245,13 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     g_hash_table_add(loaded_modules, module_name);
 
     for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
+        if (modinfo->arch) {
+            if (strcmp(modinfo->name, module_name) == 0) {
+                if (!module_check_arch(modinfo)) {
+                    return false;
+                }
+            }
+        }
         if (modinfo->deps) {
             if (strcmp(modinfo->name, module_name) == 0) {
                 /* we depend on other module(s) */
@@ -345,6 +373,7 @@ void qemu_load_module_for_opts(const char *group)
 
 #else
 
+void module_allow_arch(const char *arch) {}
 void qemu_load_module_for_opts(const char *group) {}
 void module_load_qom_one(const char *type) {}
 void module_load_qom_all(void) {}
-- 
2.31.1



