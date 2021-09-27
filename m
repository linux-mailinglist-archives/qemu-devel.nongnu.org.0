Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789B419961
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:41:37 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUthA-0005xS-3o
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXV-0002Rk-4b; Mon, 27 Sep 2021 12:31:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXT-0002ag-Fj; Mon, 27 Sep 2021 12:31:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id b192so1019110wmb.2;
 Mon, 27 Sep 2021 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrZcRAqwbX1CgOU4/ghYIXImscGfB+p01+/+JsHL8L4=;
 b=fs+6upgVoe/3ZOqqYgzLYXU3AzouMLtbaC8RNg1yGELCQ9F5cp412j8o7Ha2h97kFA
 r/2kAGriD6Gz81zn2XV5vzhTrtglR1m3muwOtaC/Sm5GC48pfX3sKU1vlS+J6O+h6G+W
 NE9/MsWQ1khI2t7jgkhNmTWd5o1QcrK93Gm9AxbNQKnbiV9SVAD0zdOX15paesEBnb17
 9nx3dPeEuXmBc25Hxurn0+Bipk5l7uq8PNlodqvhLGkA1D9yOdcmF73ZdLnhQDQZqWbv
 5F0tRezhvlxIbv28bKiXNV939Z3KsXANMjYghIfcmK/8H8viSiYYQzOTpqfeEM7kkmxt
 Of/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rrZcRAqwbX1CgOU4/ghYIXImscGfB+p01+/+JsHL8L4=;
 b=W/cYPrD6JT1WGft0YH7kGh/Gu2cUnAJwTdeb8hKvMo5UZj7klnirEKFV7mhC4ETT7m
 p1QW9sie103u/YLGU/2aCiA2T4ByElcaqt3l9prLfU5N4Nb5mKxuJqPMQus9Y4t5/56H
 b2QT1n93LuXZaS4KrtBX9gUZJ1ZHwh4idMbTi6+TvAq2uxccVsBWVMHF8NnWxK/zpOkz
 +vM8T+GqBOXz1trbXypl1UonLjnFqKl3GVaejv69pgIEzjOoDGJ5aShQMvl5fjyTx+Qi
 CbcL/Z6G3iNsxCa+/qMHcGG3fKJ8fWAYhuJ+G8SmGGFateqlgRxflccAULUohhgFA57W
 DwOw==
X-Gm-Message-State: AOAM532JskY+6wfsCF7DuOz4YFikVebbp1eBuU/+qQNXF3+vBmsnbVvW
 X58HjT+2fAQ6NMzL7EzbNUuh/Zx6Mbg=
X-Google-Smtp-Source: ABdhPJxOLc9mOMQcnGywAfc/RxVO1EwPe5c8xjxKFiJ3u0/3RLS290LuyH8Kd/rIwaYczwRy3+U4yA==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr3018269wmf.47.1632760293268; 
 Mon, 27 Sep 2021 09:31:33 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t16sm691286wry.0.2021.09.27.09.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] tests/acceptance: Introduce QemuUserTest base class
Date: Mon, 27 Sep 2021 18:31:13 +0200
Message-Id: <20210927163116.1998349-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2b9b5dd27fe..2f59e171e49 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -20,6 +20,7 @@
 from avocado.utils import cloudinit
 from avocado.utils import datadrainer
 from avocado.utils import network
+from avocado.utils import process
 from avocado.utils import ssh
 from avocado.utils import vmimage
 from avocado.utils.path import find_command
@@ -300,6 +301,23 @@ def tearDown(self):
         self._sd = None
 
 
+class QemuUserTest(QemuBaseTest):
+    """Facilitates user-mode emulation tests."""
+
+    def setUp(self):
+        self._ldpath = []
+        super(QemuUserTest, self).setUp('qemu-')
+
+    def add_ldpath(self, ldpath):
+        self._ldpath += [os.path.abspath(ldpath)]
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
+
+
 class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
 
-- 
2.31.1


