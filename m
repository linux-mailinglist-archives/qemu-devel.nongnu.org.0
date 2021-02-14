Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26731B210
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:42:44 +0100 (CET)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMLz-0008SR-7B
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjC-0001Se-Dy
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjB-0004iA-0M
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so5810259wmh.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+cZfbBSXi4Z9o9LLnkjECQmd20GFE8Z07Hn7lNqThho=;
 b=KI59o3Gjm1IkC0lZcR7O24Aa/dmZfbhYzKvR02FUgoF67vhPjH42Sn5xnZxc28pLVn
 Ce5f/GyHBXRJMkt5QamBJQS4O4nhu5wOYFC/T0SHHJiyQmsI9CddizSz9mhuNjFqFu0d
 78zOKxxLqDQhzSGLCcuS+RZPZsR0KL4SZdcC+E6J0O+gMH0HjOK2HAYssEauzNKWWKKd
 fn2g4oADG8fBxfFNFso2I++2hf/BIVH/33k11+zgbm2X6BXfdm4/9spZhJSurFH2wlAP
 Il5Cn+ice6jIN8tQR2wk65vWw142kNKS+SSWvT+o7PIypAMnhLRqDBWOHhUAhFknQgOI
 zVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+cZfbBSXi4Z9o9LLnkjECQmd20GFE8Z07Hn7lNqThho=;
 b=IHQKTSzyBHmqa8NHEsDwZJGqGawthOkrrpRgTfyUD6UVLNpU0JK/E539nClilFKF+i
 Usjdb0A0v9MmVlj1CnLDT73569Kfy7OMoxIn6YIz29s9AdpiWVnTw/ElOKyecZe7wfow
 x+X2ZiRDgyXmvIqo2958P/Q+QzTQrrSekuNKiNUNYrUgtGicXV/i2ecSD/88zUAJGos1
 xPYuUAC99KBO+JSkbBuSfXjzuJC2hMS3Bkr7NC2EACLxpjuiBGuozXUj05wxSnHJ8mCv
 AP7xuhX5DXt835psCliDg/2qwWruCXLUBpJTQLVdNbUwggaiD4pSc4Y1wIJ0MyWlmPyE
 GtdA==
X-Gm-Message-State: AOAM5314nHy2957IECHJNIhl82tccYO2aQsQAw3pjHqEkDPU/8GRsiI2
 0AEDCWEwm+oxGTxOMPJyZOA27CNEPEQ=
X-Google-Smtp-Source: ABdhPJxYo+adgBsrVCRP0mlymx98Z/ToQ3zYqO/gpkNAvvyWXjSwucxpep3anJ38dLYbhFgN9Hh7Ng==
X-Received: by 2002:a1c:3804:: with SMTP id f4mr8843697wma.115.1613325755252; 
 Sun, 14 Feb 2021 10:02:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n186sm4728191wmn.22.2021.02.14.10.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 40/42] tests/acceptance: Introduce QemuUserTest base class
Date: Sun, 14 Feb 2021 18:59:10 +0100
Message-Id: <20210214175912.732946-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index e0067abca61..a293d228140 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -15,6 +15,7 @@
 import tempfile
 
 import avocado
+from avocado.utils import process
 
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
@@ -211,3 +212,17 @@ def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
         self._sd = None
+
+class QemuUserTest(QemuBaseTest):
+    def setUp(self):
+        self._ldpath = []
+        super(QemuUserTest, self).setUp("qemu-%s")
+
+    def add_ldpath(self, ldpath):
+        self._ldpath += [os.path.abspath(ldpath)]
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
-- 
2.26.2


