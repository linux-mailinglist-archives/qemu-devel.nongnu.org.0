Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3D41991C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:38:25 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUte4-0001K0-F8
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXP-0002GI-Tp; Mon, 27 Sep 2021 12:31:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXO-0002Wo-Co; Mon, 27 Sep 2021 12:31:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so450250wme.1; 
 Mon, 27 Sep 2021 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T1aPkKUrc80d/vqmLgc+PWq3pe5Uicwcn8ttvXrLTeU=;
 b=FOnqWgbOkCQhcjkwn4FfWDxoBTEJ5m8sWco68AWUOC1dlk0SpdZ2A72Edkr2cuXkkh
 MWhliyTacJr28U3b2RCWEMcBhuOSDK770spxZyPUgUDDVn9sWLmubYGGZhC8bQAk//Wc
 NdUl028xnLXZMSxsIIq5lu/YRjsIkTaF7rjpb0AxCkQeFLSUE2rxd90bgrG041HJjHQf
 1i0oJYx5jyZPM4OA/zMf+uNgL8j6tjRfjM3SYGKupGwXp1fZcfBwnNEVzt5ntKcVzOqp
 20nSS+caITlgo5AYDiP2yNsLj3XzQ7hn+AA0gaKC92p+SQyyGAzYZGSMCypA2PBzDbQv
 yj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T1aPkKUrc80d/vqmLgc+PWq3pe5Uicwcn8ttvXrLTeU=;
 b=1W229c1z8EcQaoepHDuFW8FuODuePC4OY/yluOTwK7eH02KxQIW9bty6OQgEauMxO9
 ZnEtQvz+jvqtTZ/d9nbV4cP1Ah+piLHUOyjFZAulVgI51qC+p8TA7uAJmJKyue7izj8b
 axF3fbYjOw8DfM0olWZKNiMWtgzJy6eZN7ScQm5RqUy2c0TRNRGNrNf6i9u9C/Tj/nS+
 +voFC0vfjPyQpRS6WcztINweiKNhMOYO5y95osGcUqC+36lDjzm7pxcANUCiLzn+un/j
 bHMXWxLnbJRdSuw7QUS7IWdDT94i5OZq4FS6c9PVuQ90EhEEeN30fedOZqL6skEBy5Lu
 VCTA==
X-Gm-Message-State: AOAM53211UaYLLeaqgyLk7si6eeVOAy1xBIipKpcAoUyjM704HqQplyI
 hV1Y43bLR3zMjjuDBL5iZYh0C6cR1sg=
X-Google-Smtp-Source: ABdhPJznlZqOCkgEMrxGDYaocikq81fxFtsK9xSgVMuM1cqqXK0pAUCgiTLQUq0wzfUVgx7jxDlQng==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr1827114wmq.163.1632760288483; 
 Mon, 27 Sep 2021 09:31:28 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x5sm21242438wmk.32.2021.09.27.09.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] tests/acceptance: Make pick_default_qemu_bin() more
 generic
Date: Mon, 27 Sep 2021 18:31:12 +0200
Message-Id: <20210927163116.1998349-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 8fcbed74849..2b9b5dd27fe 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -52,7 +52,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -71,7 +71,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -185,14 +185,14 @@ def _get_unique_tag_val(self, tag_name):
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
@@ -220,7 +220,7 @@ class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
 
-        super(Test, self).setUp()
+        super(Test, self).setUp('qemu-system-')
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
-- 
2.31.1


