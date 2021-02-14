Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73131B20B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:39:23 +0100 (CET)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMIk-0006NI-0C
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjA-0001P7-H3
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLj5-0004hq-RB
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r21so6084038wrr.9
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbl9/61wM37nBJWaz7/wAXPCJcp3ey0kqtBTl5rgBR4=;
 b=qGzTr9/PvCuaprwZhrz3F1W4/R4yIE/+GKJtiZD8Y0jeV5DjPHVdPLXMTusB/oiOfl
 q/FnShDy481dTAftmHSQq3xx9BCgdGge48Ox5TjC1e+1hWdpZaWqTrXCdx8DIrCMMTNG
 iohrcjua+bm7zkAYSiaBtKEoytBxfg42Ve7w9M+rU3y6XfS2IkIhtYAoupZZDQWK/NwZ
 +zmahm8vahEDZOGQnbqaKZMdCcEhAXqhBnnUq1JCSbp3mUAZhAViuNfLhY5HH17OvxzI
 eHn4U6qVvjmwXFQjdneRmmzyUZb5dEtp3PbBP+89AH1ksIMtmeFJ5vKojLnffRFLCaT/
 PK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xbl9/61wM37nBJWaz7/wAXPCJcp3ey0kqtBTl5rgBR4=;
 b=VAgHf30vuFiYtEimBJtiqLa7U8HEXeCclg7/GTV57RZMouu3BXqK5/AuMHcJ7hQdQu
 5YwGuE/eM0t1o8om2e9SbMUHbUTFVjXp6Quh78AtQeB/ieL4IkjOcQftaxt5JLKeIVtS
 TdyaJTAkbrDRF7P0vh2ePW/KihHwuEaraMsaRsXagUNo6s4zw8Xcvzehjky8x2XU3Hhu
 GByg5qSyVMhpOm5dYyihjOaijexBb9UT/uxwK8S93mF+3f58mXuhEBAATJMyvpbOlcff
 wI9JTSLUO77grvloNy7eVMggrDHT6fvdQzQOy0EPmD/uiv6jFyopgWxSFqcCYkkNShC1
 eaJQ==
X-Gm-Message-State: AOAM530LFsaY/I12bQDavwjBZMb2KWU3rlhhW4LZHNKhx1bp2JPsUxNi
 w8x86v5w9+u5BIg6lNkhsoU01AsW6mk=
X-Google-Smtp-Source: ABdhPJwXS2FCGdhgqLXj/yRSvfRTIPhHY70AMqN/giruUifvEZc58fbjyMGJzRAKJeK8aE3JwP2rTw==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr14787333wrx.357.1613325750310; 
 Sun, 14 Feb 2021 10:02:30 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u4sm19386083wrr.37.2021.02.14.10.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 39/42] tests/acceptance: Make pick_default_qemu_bin() more
 generic
Date: Sun, 14 Feb 2021 18:59:09 +0100
Message-Id: <20210214175912.732946-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 31b7064c0e5..e0067abca61 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -38,7 +38,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_fmt, arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -57,7 +57,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_fmt % arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -155,14 +155,14 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
-    def setUp(self):
+    def setUp(self, bin_fmt):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
-        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
+        default_qemu_bin = pick_default_qemu_bin(bin_fmt, arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
                                         default=default_qemu_bin)
         if self.qemu_bin is None:
@@ -185,7 +185,7 @@ def fetch_asset(self, name,
 class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
-        super(Test, self).setUp()
+        super(Test, self).setUp("qemu-system-%s")
 
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
-- 
2.26.2


