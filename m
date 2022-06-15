Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0BC54C97A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:12:19 +0200 (CEST)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Sok-0002Ec-T1
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Slh-0007Oc-Vs
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:09 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Slg-0007S9-4z
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id r1so10346048plo.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdCfM/E/sBCwxDaEnY0hKLAiONdLlmSF8uYj2g3FhG4=;
 b=R8cXjnqGktPsxnFfsroMUO43ZRAJKY/BB8irFuxWZAVFha73wzwV1bJRoSOCGmQOl4
 7G/X9XMYFMtuoXB0bDMrdRV4lHBQGpdHLoEE33oT3weeQZDQu4iaRrPy25yEdzb8vx5A
 x9YYk2jDyohBkML1e+8x9RP6LBw5M8T9Pjl6slUFQjB0y4EQbZtKTtJaU36xup1ftfBg
 PR280yhNR46QCfZ2xtp+g6zkRqXReAxTTkOGbXY29I7091TqgKeMtfS0yhxr1O/CS775
 lPW9Gno9v1rQk8iW3ldYXiIVuziwZR6E6yJ5/ahaRTEV52ykrnFAE293938SOUBWJBZ9
 yqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdCfM/E/sBCwxDaEnY0hKLAiONdLlmSF8uYj2g3FhG4=;
 b=UMuLF5SUCOyxQJJHi99sj9j71ZRJeZx62MOvl9ew09PiexuTRDcS4VABCDxsl4Id9N
 imkBoOcJh+EglEoeVFXmnJViVadAE/bcIqW5S6HZVSYM74Lrdfy6Xq/DDEnS6CqHtnpU
 hf1QxVmBb7FWLt5ulLNhK8GrRHF+XcfzeA+CzQX9/WO8uDo0OJ2XJPqkUzOZw7lulgLP
 W2QF48f3U9NU1o2Z1AhKSyeKUsdIK7W0+XYJ7LUdNyO3uu26muwJtkBPVd2zCQQaMKxP
 NhZhb/ST+f8Sw3ZntGOBrLt7LyBCpdEBcPLTW0mLqW6vNzqP9YXEI/WEshe2YB8j3ibe
 uTvg==
X-Gm-Message-State: AJIora/SUkdldFa6ZF4RHwJvYYv+rDLLmneYcddeV8XLq+ToXif6Xe1t
 OoC1NpjoGh9woOUomBk3xVc=
X-Google-Smtp-Source: AGRyM1vtKzjo4K9YcKTRolprvc9PEhnXDqUZ4QpHphHSSOjGSXCVPYiJc95A4doDNqC+9f7TaIlfHg==
X-Received: by 2002:a17:90b:287:b0:1e3:45c9:9a93 with SMTP id
 az7-20020a17090b028700b001e345c99a93mr10358569pjb.80.1655298546651; 
 Wed, 15 Jun 2022 06:09:06 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b0016392bd5060sm9278448pln.142.2022.06.15.06.09.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 06:09:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 1/4] cutils: Introduce bundle mechanism
Date: Wed, 15 Jun 2022 22:08:42 +0900
Message-Id: <20220615130845.32674-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615130845.32674-1-akihiko.odaki@gmail.com>
References: <20220615130845.32674-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/qemu/cutils.h | 19 +++++++++++++++++++
 meson.build           | 12 ++++++++++++
 util/cutils.c         | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 40e10e19a7e..3b66026cd3c 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -213,6 +213,25 @@ const char *qemu_get_exec_dir(void);
  */
 char *get_relocated_path(const char *dir);
 
+/**
+ * find_bundle:
+ * @path: Relative path
+ *
+ * Returns a path for the specified directory or file bundled in QEMU. It uses
+ * the directory of the running executable as the prefix first. See
+ * get_relocated_path() for the details. The next candidate is "qemu-bundle"
+ * directory in the directory of the running executable. "qemu-bundle"
+ * directory is typically present in the build tree.
+ *
+ * The returned string should be freed by the caller.
+ *
+ * Returns: a path that can access the bundle, or NULL if no matching bundle
+ * exists.
+ */
+char *find_bundle(const char *path);
+
+void list_bundle_candidates(const char *path);
+
 static inline const char *yes_no(bool b)
 {
      return b ? "yes" : "no";
diff --git a/meson.build b/meson.build
index 0c2e11ff071..2f9bb27554c 100644
--- a/meson.build
+++ b/meson.build
@@ -32,6 +32,7 @@ if get_option('qemu_suffix').startswith('/')
   error('qemu_suffix cannot start with a /')
 endif
 
+qemu_bundledir = meson.project_build_root() / 'qemu-bundle'
 qemu_confdir = get_option('sysconfdir') / get_option('qemu_suffix')
 qemu_datadir = get_option('datadir') / get_option('qemu_suffix')
 qemu_docdir = get_option('docdir') / get_option('qemu_suffix')
@@ -2844,6 +2845,8 @@ target_arch = {}
 target_softmmu_arch = {}
 target_user_arch = {}
 
+bundles = {}
+
 ###############
 # Trace files #
 ###############
@@ -3614,6 +3617,15 @@ if host_machine.system() == 'windows'
   alias_target('installer', nsis)
 endif
 
+###########
+# Bundles #
+###########
+
+foreach dst, src: bundles
+  run_command('mkdir', '-p', qemu_bundledir / fs.parent(dst), check: true)
+  run_command('ln', '-sf', src, qemu_bundledir / dst, check: true)
+endforeach
+
 #########################
 # Configuration summary #
 #########################
diff --git a/util/cutils.c b/util/cutils.c
index a58bcfd80e7..100e6c03c5c 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1086,3 +1086,36 @@ char *get_relocated_path(const char *dir)
     }
     return g_string_free(result, false);
 }
+
+static const char * const bundle_formats[] = {
+    "%s" G_DIR_SEPARATOR_S "qemu-bundle" G_DIR_SEPARATOR_S "%s",
+    "%s" G_DIR_SEPARATOR_S ".." G_DIR_SEPARATOR_S "%s"
+};
+
+char *find_bundle(const char *path)
+{
+    const char *dir = qemu_get_exec_dir();
+    char *candidate;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(bundle_formats); i++) {
+        candidate = g_strdup_printf(bundle_formats[i], dir, path);
+        if (access(candidate, R_OK) == 0) {
+            return candidate;
+        }
+        g_free(candidate);
+    }
+
+    return NULL;
+}
+
+void list_bundle_candidates(const char *path)
+{
+    const char *dir = qemu_get_exec_dir();
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(bundle_formats); i++) {
+        printf(bundle_formats[i], dir, path);
+        putc('\n', stdout);
+    }
+}
-- 
2.32.1 (Apple Git-133)


