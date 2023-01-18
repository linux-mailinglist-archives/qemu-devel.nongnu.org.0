Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566C671C6D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7nO-0006FK-4v; Wed, 18 Jan 2023 07:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nM-0006FC-V8
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:00 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nL-0006vA-BB
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:00 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so19567400otu.7
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72g+RpKzaheKXfUuYSTQXNOokn2Y08u64N6tCSAziKc=;
 b=oYjX1QkHDT8dQIsqfOqpRBHf3FJufNw2spQ8e3iOsRO7M/XeV6+X7m3FVdYdMU+zFK
 Wtga6h3LK+GlizF7rCJNwDSrkqjsAcQJT2As6jbt1Hd6Wi7o8kP45aCGSyt3kJ2n6s/T
 Xnz/S3Ci67LzG2zmH+cPF6JWmk8s4keyvym9O8+23YAmSCzVuv6onywIwNl7JPf+FY0E
 0RShUWlsmJEWAeGZGATkJoDA9zXIh+a7cQBnwdbdjkHo4IA818YIkHCxUxpIADJEO/FH
 IidgTI5fhcse1bDhvUsrqpYqZb3Gb/tGeV8YGOmzpEVlNVvetu/78LjgoaVmHlfst0hw
 G+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72g+RpKzaheKXfUuYSTQXNOokn2Y08u64N6tCSAziKc=;
 b=6h/ajGqTisPBoTyg6xpJsr9B85C8eu5jcQ5cQOUZKwu0fbKp/DCTPB0gQgh/ql+Y/N
 XwXQAuDFSJBXAK6DDDL1IlkGhoyGCFtcFUTP2CI7VkDQ7KRhWM7ayqSt5IxbHsnbNrwp
 Y/6LCqzTB1EGMD54SiSb5kne95MYWYRPUpNz853G2ATsVFKkeVjIodBDku96x7Q9KD1r
 F2O7B3otWeeMmVJpv/J1WyY4G2M2RnrDfH4uo9rQspgONCv/sfudLf/SsJ+AAk7CTsWX
 UxqMn9WA0lY4fI+rGdq4pJutuRzmXItoSslCGDGzppddDBjuKQUlTIfSDd2HNnwpomwb
 ITpA==
X-Gm-Message-State: AFqh2kpCJ/JZnsMvqCC7+yNz42GKaDLBWoN0ZcGQoWPE+S+IStcda2Pi
 hCXbWTIxpVjDCrW4DIMjuf/2ooDnAoEDQJUu/1M=
X-Google-Smtp-Source: AMrXdXtF3WPhxzsjRvhCYXeIWPOwxOBDTfzFgevFxXi0iWOCdrkOCbKgvAkv8SWy7Gne6xeCEEhPKA==
X-Received: by 2002:a9d:4805:0:b0:671:b52f:5c3a with SMTP id
 c5-20020a9d4805000000b00671b52f5c3amr3300341otf.34.1674045837600; 
 Wed, 18 Jan 2023 04:43:57 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 cb2-20020a056830618200b0068460566f4bsm18158432otb.30.2023.01.18.04.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:43:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 1/3] avocado_qemu: enhance CANCEL message in
 QemuBaseTest:setUp()
Date: Wed, 18 Jan 2023 09:43:46 -0300
Message-Id: <20230118124348.364771-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118124348.364771-1-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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

Trying to run 'make check-avocado' while having only non-x86_64 QEMU
binaries built, in a x86_64 host machine, will give us the following
cancel message:

"CANCEL: No QEMU binary defined or found in the build tree"

Which is not quite what's happening here. Avocado defaults to the host
arch for every arch-agnostic test, and in the case mentioned above it
cancelled the test because there were no qemu-system-x86_64 binary to be
found.

Change pick_default_qemu_bin() to return a (qemu_bin, arch) tuple, then
use 'arch' in the CANCEL message. This will make the error more
informative:

"CANCEL: No QEMU binary defined or found in the build tree for arch x86_64"

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 tests/avocado/avocado_qemu/__init__.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..8614ac3978 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -128,8 +128,8 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     ]
     for path in qemu_bin_paths:
         if is_readable_executable_file(path):
-            return path
-    return None
+            return path, arch
+    return None, arch
 
 
 def _console_interaction(test, success_message, failure_message,
@@ -247,11 +247,13 @@ def setUp(self, bin_prefix):
         self.cpu = self.params.get('cpu',
                                    default=self._get_unique_tag_val('cpu'))
 
-        default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
+        default_qemu_bin, arch = pick_default_qemu_bin(bin_prefix,
+                                                       arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
                                         default=default_qemu_bin)
         if self.qemu_bin is None:
-            self.cancel("No QEMU binary defined or found in the build tree")
+            self.cancel("No QEMU binary defined or found in the "
+                        "build tree for arch %s" % arch)
 
     def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
-- 
2.39.0


