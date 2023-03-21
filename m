Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484C6C301D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pea0A-0006Rk-Kq; Tue, 21 Mar 2023 07:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pea08-0006RV-BM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:18:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pea06-0002Uf-JD
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:17:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so13253859wrh.6
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679397476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dtMdpGocr62ge5sh3wVlQKfA9cyOF99U8VoIMH9fQsk=;
 b=ALStwZu+KZOp2yoQ51qjkjlVPwzpJt7D4zyWIHIvr6PachMCE9mw/N7wTzqe4NjbQK
 rJv8HkKZHIDCVHekHNFRCAlOCY2Pm76mDsonItc5OoPXlLBRJyVp8VDip1LMrxVeg460
 H5RN1lVDN6V5ZHLPb7BgQiAfuQjnSA/PZYcWq7KEVf9jGzKjSfCbwkWG5ffK3HOpusgo
 57Dzg0+RnBWpyU5kSAGzLoFSM7h/CAEfCE2hPwJiTcFHRgzSVPGrfWCL12SGo9tdItgQ
 nF6AuWnb+LrNBmbvREXKn09oTJyZZXLxcbIXQN6uvOSXzxqdvE5nSODaBjLtaomPBQXs
 /CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679397476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtMdpGocr62ge5sh3wVlQKfA9cyOF99U8VoIMH9fQsk=;
 b=KISk+qmiDtX2g3kx13O1cP1Vq/tJQyHCyHuAPyv9tYwNJ3rc/V2lpolSP/ryL8jEld
 nAo5G7dgEsVWFeqGAKZwyvE1i3hEmqpbb+kgKJQ0n7o05L3mWqrHDtjlFdF/uBl91cuO
 rUinqZmMsmWrbiYDgEHwgNKOcikW+do5l0enCdZ1OaOOhtLcOExQApce7Dt6JkBB6vSe
 23a9607ALEsnu0pJCrRTCCWO+1ya2G0hrA5/+Qtz9dC/tiEDO/NRao+qn+1g4DLWLSmi
 68LdPAPelPy3BRFFlQMNrHVIOyhuoka8hcz6Jg8I7ppyFrqc7PVvVQrYSS61vFV7wI4B
 Zw0g==
X-Gm-Message-State: AO0yUKWLjZCYaj2eP+FW+GM4M31O3yq2bwUDLNf5KL0G8D16JL7GwlFF
 VWk04twEJdzkauCKJKnfGRQ/7Q==
X-Google-Smtp-Source: AK7set+Z+eQUYmgqln7LxTmF4GRkBIrSyX1vLrU6rLuhFVBEufJuBeNHBdBN1mA+dEmtyxjpTlLh2g==
X-Received: by 2002:a5d:654a:0:b0:2c7:1a86:aecd with SMTP id
 z10-20020a5d654a000000b002c71a86aecdmr1908802wrv.2.1679397476592; 
 Tue, 21 Mar 2023 04:17:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b002c8476dde7asm11028605wrs.114.2023.03.21.04.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 04:17:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5CC51FFB7;
 Tue, 21 Mar 2023 11:17:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: probe for multi-process support before
 running test
Date: Tue, 21 Mar 2023 11:17:52 +0000
Message-Id: <20230321111752.2681128-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

A recent attempt to let avocado run more tests on the CentOS stream
build failed because there was no gating on the multiprocess feature.
Like missing accelerators avocado should gracefully skip when the
feature is not enabled.

In this case we use the existence of the proxy device as a proxy for
multi-process support.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>
Cc: John G Johnson <john.g.johnson@oracle.com>
---
 tests/avocado/avocado_qemu/__init__.py | 10 ++++++++++
 tests/avocado/multiprocess.py          |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index a313e88c07..cb71f50db9 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -309,6 +309,16 @@ def require_netdev(self, netdevname):
         if netdevhelp.find('\n' + netdevname + '\n') < 0:
             self.cancel('no support for user networking')
 
+    def require_multiprocess(self):
+        """
+        Test for the presence of the x-pci-proxy-dev which is required
+        to support multiprocess.
+        """
+        devhelp = run_cmd([self.qemu_bin,
+                           '-M', 'none', '-device', 'help'])[0];
+        if devhelp.find('x-pci-proxy-dev') < 0:
+            self.cancel('no support for multiprocess device emulation')
+
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
diff --git a/tests/avocado/multiprocess.py b/tests/avocado/multiprocess.py
index 80a3b8f442..9112a4cacc 100644
--- a/tests/avocado/multiprocess.py
+++ b/tests/avocado/multiprocess.py
@@ -22,6 +22,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
                 machine_type):
         """Main test method"""
         self.require_accelerator('kvm')
+        self.require_multiprocess()
 
         # Create socketpair to connect proxy and remote processes
         proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
-- 
2.39.2


