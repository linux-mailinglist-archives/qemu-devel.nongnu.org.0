Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551B42BBA7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:32:07 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maacI-0007cR-CX
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEo-0002Jq-1G
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:50 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEj-0005m3-45
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:49 -0400
Received: by mail-ed1-x536.google.com with SMTP id r18so7149969edv.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cVoPyB8QPmFDHLHl6dUbs6vG5blXkCtoV/NqW9eQRE=;
 b=g41k7akcEkcva3nO7ubDZE+LdC9L0m2opj/iJKCgMAhgOgBP/SNj7rfvYXv4leidSh
 n+dRn5bBkIQ/164LgqkGvt494mR1iziTFJ+lZ8Q4FF/UhjXkzJiNfg+vYKcc+Z0x3X3p
 gr2g1C1EaLeSbwfIGE1A68dMTD9ZOr8UnRUfYuHMn+PFkERVDalJXZUnGxIwj7RrFyXS
 kOLtRlj/dZCi5Vc8kXR1zMSAgomzjTNGGld6qifIW+tc4vV/wB5v8UeTu0BonKepsvkw
 zOQOLQ121v+3dFSlxFDdZz/JmTkBUkwRHD9z9F3HTY/sN15mi0IcRoUJo/ukyNFvGVHo
 rQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5cVoPyB8QPmFDHLHl6dUbs6vG5blXkCtoV/NqW9eQRE=;
 b=fquruJD7nFQYsCcxTplfeJ0aZS3PytDwkygqX+uy6JOsTbHyEPNnzxABOnpbCMIetg
 b0ngXh5UUme1f6UFUArvk8jNjNCygy98Wx2urLq4RetNt89ODyjct5FQ7Fo3CGQ5zBSx
 3eV2vs1kqkcg1Y4CUQjhNYf2GiuNZOY9ggc6bOOFvLBVuvgJlIKHERtB7ZpgQcfTvJMX
 VAEFdfyl2HwgXSoZ05SAVQ2cU4t5cIdOXN5A3IKFA7njDKmlWIQjNUBS87EnnXCdd+ux
 kRfR6vd5e3QD+g8/1LMDzadpfOl4jv423gQJfzNZY//HHlb6AEBR19atJ5jOfXwoCwXV
 R00w==
X-Gm-Message-State: AOAM533I7qjq77FcVxIll4pwJzxcMlI27bKmxgC4y5VwOBokIpVq0ScH
 XYjMX9Iqfm44qqGujQKGwnhKJuEjflU=
X-Google-Smtp-Source: ABdhPJxeuPm2hA9AsAVxJjGvSx43qolXueZmaxiFmWUmcqWoY9/g/ZYs5FJINTjnsflYxPAp4QAkbA==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr7918890edt.177.1634116062431; 
 Wed, 13 Oct 2021 02:07:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/40] target/i386/sev: Restrict SEV to system emulation
Date: Wed, 13 Oct 2021 11:07:06 +0200
Message-Id: <20211013090728.309365-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

SEV is irrelevant on user emulation, so restrict it to sysemu.
Some stubs are still required because used in cpu.c by
x86_register_cpudef_types(), so move the sysemu specific stubs
to sev-sysemu-stub.c instead. This will allow us to simplify
monitor.c (which is not available in user emulation) in the
next commit.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-14-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/meson.build       |  4 ++-
 target/i386/sev-stub.c        | 43 -------------------------
 target/i386/sev-sysemu-stub.c | 60 +++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 44 deletions(-)
 create mode 100644 target/i386/sev-sysemu-stub.c

diff --git a/target/i386/meson.build b/target/i386/meson.build
index dac19ec00d..a4f45c3ec1 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,7 @@ i386_ss.add(files(
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c', 'sev.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
@@ -20,6 +20,8 @@ i386_softmmu_ss.add(files(
   'monitor.c',
   'cpu-sysemu.c',
 ))
+i386_softmmu_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-sysemu-stub.c'))
+
 i386_user_ss = ss.source_set()
 
 subdir('kvm')
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 55f1ec7419..170e9f50fe 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -15,11 +15,6 @@
 #include "qapi/error.h"
 #include "sev_i386.h"
 
-SevInfo *sev_get_info(void)
-{
-    return NULL;
-}
-
 bool sev_enabled(void)
 {
     return false;
@@ -35,49 +30,11 @@ uint32_t sev_get_reduced_phys_bits(void)
     return 0;
 }
 
-char *sev_get_launch_measurement(void)
-{
-    return NULL;
-}
-
-SevCapability *sev_get_capabilities(Error **errp)
-{
-    error_setg(errp, "SEV is not available in this QEMU");
-    return NULL;
-}
-
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp)
-{
-    return 1;
-}
-
-int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
-{
-    g_assert_not_reached();
-}
-
 bool sev_es_enabled(void)
 {
     return false;
 }
 
-void sev_es_set_reset_vector(CPUState *cpu)
-{
-}
-
-int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
-{
-    g_assert_not_reached();
-}
-
-SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp)
-{
-    error_setg(errp, "SEV is not available in this QEMU");
-    return NULL;
-}
-
 bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
 {
     g_assert_not_reached();
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
new file mode 100644
index 0000000000..d556b4f091
--- /dev/null
+++ b/target/i386/sev-sysemu-stub.c
@@ -0,0 +1,60 @@
+/*
+ * QEMU SEV system stub
+ *
+ * Copyright Advanced Micro Devices 2018
+ *
+ * Authors:
+ *      Brijesh Singh <brijesh.singh@amd.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/error.h"
+#include "sev_i386.h"
+
+SevInfo *sev_get_info(void)
+{
+    return NULL;
+}
+
+char *sev_get_launch_measurement(void)
+{
+    return NULL;
+}
+
+SevCapability *sev_get_capabilities(Error **errp)
+{
+    error_setg(errp, "SEV is not available in this QEMU");
+    return NULL;
+}
+
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp)
+{
+    return 1;
+}
+
+int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void sev_es_set_reset_vector(CPUState *cpu)
+{
+}
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
+{
+    g_assert_not_reached();
+}
+
+SevAttestationReport *sev_get_attestation_report(const char *mnonce,
+                                                 Error **errp)
+{
+    error_setg(errp, "SEV is not available in this QEMU");
+    return NULL;
+}
-- 
2.31.1



