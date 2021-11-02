Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA84429BF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:44:36 +0100 (CET)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpPH-0000Wu-So
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNX-0006QC-Cx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNV-0007Wy-Hp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id v127so14910903wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKG0tKklLgRk4YA9OrX5SnwD2Q874lcpxjeqTTiQFYw=;
 b=ZSRohisD6mlmpfGEQ8DIS9r6VlKaamZLe7J+qarvCpEgt8gsJoj8VDTL2JPojnm/du
 p3RcRsUJL/2SZ0Q27EzGdHFpZAqe3BFyIlU9A+3GwALf6zwCKW3W2fbi/Ynx2WuVsGZT
 018xKFzGgxU/+RS70LjSLYbngdm57KRTqzHcE1XY7+e1JVEOZNgj1xcliaqNYpra87zZ
 75upDlVcDcg4ZgXYmFcdqZ5ItbuWE4Fwufg1PytgS+XIBSgXeFSn3nmgYo2cC9MG7g3d
 GsFIxT6AMAuO7Tx4dnkt/hLfGsd+VjcnBv82haxeHFNvkG1oZBd+KpzL8zfCNzTRX6Pk
 BxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EKG0tKklLgRk4YA9OrX5SnwD2Q874lcpxjeqTTiQFYw=;
 b=jMjhqab+l1EVyEMyF1zbmfPjeZA7rG802xbxhZ2wHwWb1I2OWXLchR5ueGWvSr/IUm
 AwS0fgJqtXgXmDV4PQ2srNCiFgnkvh2ZeWV3OogI5oV/lgJkgBGRsSgoRdJScUmznOh2
 N6wgSAoOtibHqJtM68fz9di9pkmzInr/gxIYnETRqDDq57wfK0z45o4+ulbNvBciiE5A
 KgIsJ8ZBsKC1UXcUXZg544DOf5xzQo9eYzjmx+UaiPkxKEVlGsHKRd7NJNEC8nwRIcbb
 s686R4skOSHNDRXTTKH/XTv4A/X9kLowxNluzB2SE20ZfL+3sh++kReiYaIGc3a7Eq7F
 Buvw==
X-Gm-Message-State: AOAM530UgzUnRO/2IdYd/YFo3ONLo1c020Cyvib3MzSqpDfqkDoT9OuH
 fkBNL1FaoWjAah2JHyz0JBnCvHXO240=
X-Google-Smtp-Source: ABdhPJyXOLftb+nJLPZ721ch6mwG+e6e6aYy78HfficcvGnenbAQ407KzDOqgxr+NWHWcQ3uFnuytQ==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr5351047wmb.78.1635842564091; 
 Tue, 02 Nov 2021 01:42:44 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h22sm36426wmq.14.2021.11.02.01.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] tests/acceptance: Make pick_default_qemu_bin() more
 generic
Date: Tue,  2 Nov 2021 09:42:28 +0100
Message-Id: <20211102084232.2965062-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102084232.2965062-1-f4bug@amsat.org>
References: <20211102084232.2965062-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5: Use PEP3135
---
 tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1ed381f5037..9b2ea3b248a 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -45,7 +45,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -64,7 +64,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -179,14 +179,14 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
-    def setUp(self):
+    def setUp(self, bin_prefix):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
         self.cpu = self.params.get('cpu',
                                    default=self._get_unique_tag_val('cpu'))
 
-        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
+        default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
                                         default=default_qemu_bin)
         if self.qemu_bin is None:
@@ -214,7 +214,7 @@ class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
 
-        super().setUp()
+        super().setUp('qemu-system-')
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
-- 
2.31.1


