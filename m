Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2754D038
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 19:42:32 +0200 (CEST)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1X2F-0004iY-M1
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 13:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wu8-0007Uc-LR
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Wu5-0006qe-02
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 13:34:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso2793749pjg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 10:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGyUx6WJ7IuooXOQfMo8XNwBte4ZcmmFehFpTIjffJ8=;
 b=kAs3TfftCCbiE1zU+HTwmID+N2QAU5p6ES98IXMxh02FxGozF8SZIwQ3LeHtwE/dzl
 jjqwsxxRhLIJDnYZYv+yswEWXmbId208WpIB8blfhequoIn6grZYqxNObeNfqIj0iZv3
 SdbIhKYKUeFH/IVyXsgJGwBZsGuIwGUd/nIS/0foZLYZ/jvovWFVTqxmdCc5AjYIuKbJ
 gW4vzvFPij3A4eROnNuAVX+LPrV1boz2tj7R5Gj1rDngr94axjZQQN5r7OE1pz4VIq22
 dJ76bEkyxRAOSMATCQOf89xkpzyyT+vvNJ1rjS9SmRz4v1CG+8670+pz9YTB2r6AOm4j
 CnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGyUx6WJ7IuooXOQfMo8XNwBte4ZcmmFehFpTIjffJ8=;
 b=Or/l/RZncDX8xjf2Cq2KwdlBWTZJ9zbQXCw4o8NOK+5vtfLFzL35poMiOeu39FRQtn
 Bhis4qGfu1QANqTw17y48Ys9DaIxpwsvmY0G9BtG0PPRWlV+ZYE+DlgbE3m4tPCrrFio
 CzqqreUMDoOYj7XVWITR4JNxpeha45dn3ErEOhlog3Jg7YsAmznpb+bZENZkqiobBFNj
 AlRT9Kxn7w6J6sqIafI00upVJyTADnpf0EU8Pzqwt3DwCwlblAYiWxrQAF65mQF0tmcN
 7I3euC2i4rRrwP3HsgC6WXrGdC8RovpzBUJzM2XJmTIgpVIAJiE2PFOGzCbc6BrvIHEX
 gMTw==
X-Gm-Message-State: AJIora9pz66SbMORSvApjRiBwT92QbFSdFYXVHZb78Y799oDTj4TUj09
 7JcFbOT/3CbIhrtNf2RxS74=
X-Google-Smtp-Source: AGRyM1tdaZHjX1jZZAVftcEUirfYO/+8zyhRxFOmsO98tC3wWyTXC1lWwJu0zhaQqaZkuQNa3Zcfag==
X-Received: by 2002:a17:902:8ec9:b0:168:c341:847e with SMTP id
 x9-20020a1709028ec900b00168c341847emr621515plo.170.1655314443565; 
 Wed, 15 Jun 2022 10:34:03 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a633c4d000000b003fcf1279c84sm10171451pgn.33.2022.06.15.10.34.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 10:34:02 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v7 3/6] cutils: Introduce bundle mechanism
Date: Thu, 16 Jun 2022 02:33:42 +0900
Message-Id: <20220615173345.32456-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
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
 util/cutils.c         | 23 +++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 57de1da5c95..ca5bddb9e1c 100644
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
index b982bfd5d07..8961df266d1 100644
--- a/meson.build
+++ b/meson.build
@@ -32,6 +32,7 @@ if get_option('qemu_suffix').startswith('/')
   error('qemu_suffix cannot start with a /')
 endif
 
+qemu_bundledir = meson.project_build_root() / 'qemu-bundle'
 qemu_confdir = get_option('sysconfdir') / get_option('qemu_suffix')
 qemu_datadir = get_option('datadir') / get_option('qemu_suffix')
 qemu_docdir = get_option('docdir') / get_option('qemu_suffix')
@@ -2843,6 +2844,8 @@ target_arch = {}
 target_softmmu_arch = {}
 target_user_arch = {}
 
+bundles = {}
+
 ###############
 # Trace files #
 ###############
@@ -3613,6 +3616,15 @@ if host_machine.system() == 'windows'
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
index 983db97b4df..64cb1616b9c 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1066,3 +1066,26 @@ char *get_relocated_path(const char *dir)
 
     return g_string_free(result, false);
 }
+
+char *find_bundle(const char *path)
+{
+    char *bundle = g_strdup_printf("%s/qemu-bundle/%s", qemu_get_exec_dir(), path);
+    if (access(bundle, R_OK) == 0) {
+        return bundle;
+    }
+
+    g_free(bundle);
+
+    return get_relocated_path(path);
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


