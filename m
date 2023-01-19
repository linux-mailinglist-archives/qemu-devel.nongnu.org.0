Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27180674087
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHD-0003MV-Hs; Thu, 19 Jan 2023 13:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH3-0003I7-4s
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00011E-5L
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso1876001wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TseWXLLVLdaVHAb6N/tVCJv6wFOZdD280J8VfGZpAXE=;
 b=eSJw+hJBHtPSGXVQ7/8jLjhoY0ZN2iPx/CAg8+10YbXk9Ftffk2mSbK9kuLJPThUlM
 ZzAb62vmdtn2ySG+CQo/gFPEN6K2CIWq6HjZW7EVUELjINUqzZLIsTbuCOcvEZbKjp2d
 5WnitmLOrz3ocHWEdx814De3FK70DyB0H+v4r7FSpvVRpH2HoNUFIbK1TFDLAEjP0Emj
 3Si3BPHqnyPJOIOLIRPGVXFZ0SNfse/Gba8rPN7qivE4/JZ2xTGhYYUtPXLgYEJPP6Gu
 WiqiPbfcszp9rjZVRBfW0aMNKD/qJIM/hJcLIW1CGZSm204k2Ink2bvFDuvAQEWDuL7/
 b/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TseWXLLVLdaVHAb6N/tVCJv6wFOZdD280J8VfGZpAXE=;
 b=dJQ2SMNhKwzaMcEQA1lM9Eg2aR5vW6kiR9X3bUjGU88j1Xq0J3DS60vK+oREHAeiHI
 wVhvs3n/0p+OxalQuFJZ5RbGB+EVanf/vPwJ8NIP+rcnI4hcFMum+8vVEwC8M+wagaYe
 dWZ67TBqaFiBXwxmFoWcZQs8NsqaoqZ4netqNASYZb8ppVmKwStpAZqltmfUDsFtwesr
 T6ukZedIQOHpGDlumLQY+RxYKcxy3MNI4h7SFqjk5ZLempG77M4EaZ8yx6THoadtNQsQ
 hrjKV1beyOLdkkcV/mO/0WFWLFD4eudu/Ids28a2ON71hU8D9lUcIVTDtGDQBCvcV5EW
 JQ2g==
X-Gm-Message-State: AFqh2krlwtNyJ3dZsWt5xjXkLoltcf0sSzP8jK32H4d3kMyugvYOZI/5
 49LITZprnE/mC6MmX9zHC/B5+g==
X-Google-Smtp-Source: AMrXdXvrSHJLF7vZzYHov+77c6dqJ++6P5yoJhFo5jWYrKeoND8hCKQ11VwigJSpHkLKy6uMi7LRpw==
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id
 bg38-20020a05600c3ca600b003d1caf13f56mr19809041wmb.9.1674151462788; 
 Thu, 19 Jan 2023 10:04:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c502500b003db03725e86sm5840059wmr.8.2023.01.19.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F26BF1FFBD;
 Thu, 19 Jan 2023 18:04:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 05/18] build-sys: fix crlf-ending C code
Date: Thu, 19 Jan 2023 18:04:06 +0000
Message-Id: <20230119180419.30304-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On msys2, the shader-to-C script produces bad C:
./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]

Fix it by changing the line ending from crlf to lf, and convert the
script to Python (qemu build seems perl-free after that).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230110132700.833690-2-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build              |  2 +-
 scripts/shaderinclude.pl | 16 ----------------
 scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 17 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

diff --git a/meson.build b/meson.build
index 58d8cd68a6..ac8c8f2cc9 100644
--- a/meson.build
+++ b/meson.build
@@ -2779,7 +2779,7 @@ config_host_data.set('CONFIG_SLIRP', slirp.found())
 genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 
 hxtool = find_program('scripts/hxtool')
-shaderinclude = find_program('scripts/shaderinclude.pl')
+shaderinclude = find_program('scripts/shaderinclude.py')
 qapi_gen = find_program('scripts/qapi-gen.py')
 qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
                      meson.current_source_dir() / 'scripts/qapi/commands.py',
diff --git a/scripts/shaderinclude.pl b/scripts/shaderinclude.pl
deleted file mode 100644
index cd3bb40b12..0000000000
--- a/scripts/shaderinclude.pl
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/usr/bin/env perl
-use strict;
-use warnings;
-
-my $file = shift;
-open FILE, "<", $file or die "open $file: $!";
-my $name = $file;
-$name =~ s|.*/||;
-$name =~ s/[-.]/_/g;
-print "static GLchar ${name}_src[] =\n";
-while (<FILE>) {
-    chomp;
-    printf "    \"%s\\n\"\n", $_;
-}
-print "    \"\\n\";\n";
-close FILE;
diff --git a/scripts/shaderinclude.py b/scripts/shaderinclude.py
new file mode 100644
index 0000000000..ab2aade2cd
--- /dev/null
+++ b/scripts/shaderinclude.py
@@ -0,0 +1,26 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2023 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import sys
+import os
+
+
+def main(args):
+    file_path = args[1]
+    basename = os.path.basename(file_path)
+    varname = basename.replace('-', '_').replace('.', '_')
+
+    with os.fdopen(sys.stdout.fileno(), "wt", closefd=False, newline='\n') as stdout:
+        with open(file_path, "r", encoding='utf-8') as file:
+            print(f'static GLchar {varname}_src[] =', file=stdout)
+            for line in file:
+                line = line.rstrip()
+                print(f'    "{line}\\n"', file=stdout)
+            print('    "\\n";', file=stdout)
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv))
-- 
2.34.1


