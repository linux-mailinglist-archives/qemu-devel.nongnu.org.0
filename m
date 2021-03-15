Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E033C9CF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:13:48 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwPD-0008Vq-RS
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKU-0001BT-Bd
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKS-0001xO-QT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id d191so9053815wmd.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tUMWakslWwBjVs/0HfBBNZUO07+acnd7bqh9wtAzCw=;
 b=Pfp4mXSB6BRs6AyUQcrqNueIcckZSnAqKC6YhbHReVFjWbLSlYTTgLFw3UqpVZqofJ
 9fQwxPAfZv2vp73qHoqQwx1FfWB6Ph1m05Hd/LE4hNzFpWmUTViP1m4eo0OTNPZUmiNC
 FQ9AZde3MVcT8z1Yc+KrGDawf7OnLF640Q9VcKIm2y8G53jpQpAqG4q81ZhtyEl0odDO
 wpABsIoRO6plAQ9ryRWMgszHPhv7IvfXzE5eO5VauiMf5BsS4FTZN5TCC1eF/Lex0qfq
 rjTQrc9AZ0QHUO3XjxFyWlTPyTIipSlZccZbXbwHr0NVYDeQONlj6/DfF2xyQN8P3Vii
 Cmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4tUMWakslWwBjVs/0HfBBNZUO07+acnd7bqh9wtAzCw=;
 b=TThEewXsFRUUOaMgZ8tvXzqnFsuL5JDl5Usos0LYumnHGMg5T5I5x+nGxG1tHDlT8K
 lTrJPbIzE4fQe2rMh9kGZ+6IQgW6QZavFnANFEXkL2JLl4gLrJ5DA/dxPCeoWtkr1dSj
 LYYVhOLMVHpO9uOz8CiDRvDdAdRIOWuO/jSDMvqieJ0H58rrS88meHaDt4rkVrDuT71Q
 KvHI4KmFsO8XLELAEkjfGfe1og5H/LWcy6LYApeU3GI5veNfhvtk4zEliXuA8Mi+8ZqF
 4YjX1I4XNKuG32aigpXctFZ0aPOlssT+wBbdJLd4thSj14T+Olt2vyRIP9lTodj7CGSE
 m/uQ==
X-Gm-Message-State: AOAM530MVr4gWezudjXHMK6gLO9vSq+ENDlup25Ce4D16ewV/MuFZ7MY
 BSIXsb3/25qyU9Cl/eSsOx6YPGo7phU3XQ==
X-Google-Smtp-Source: ABdhPJwdtclBfiy7VjSzlPh5aFxVBpqF8KAyTx6Geszb6/CHdKeZ/m4+P27DNdagmYJgGXaXcMC1Vw==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr1774110wmc.51.1615849731136;
 Mon, 15 Mar 2021 16:08:51 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r11sm20380080wrm.26.2021.03.15.16.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:08:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] tests/acceptance: Make pick_default_qemu_bin() more
 generic
Date: Tue, 16 Mar 2021 00:08:35 +0100
Message-Id: <20210315230838.2973103-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315230838.2973103-1-f4bug@amsat.org>
References: <20210315230838.2973103-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4f814047176..08b3fa1124f 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -48,7 +48,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_fmt, arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -67,7 +67,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_fmt % arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -187,14 +187,14 @@ def require_accelerator(self, accelerator):
             self.cancel("%s accelerator does not seem to be "
                         "available" % accelerator)
 
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
@@ -217,7 +217,7 @@ def fetch_asset(self, name,
 class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
-        super(Test, self).setUp()
+        super(Test, self).setUp("qemu-system-%s")
 
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
-- 
2.26.2


