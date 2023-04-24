Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF46EC8D3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:26:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsPX-0007Af-Oc; Mon, 24 Apr 2023 05:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPW-00079j-1T
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPO-0004ld-Gm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so29974915e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328173; x=1684920173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPLhtaZltjDsm0+7czRR+umbyKr+Au9dGft4aGwUTwE=;
 b=JINczLzorryr1mK2BH3fpR1gApIw8GzNALXrpymsuVON0Gn4Zjj4FV45bHu6JVcEmi
 1ZpejeXyznctGAtmf2FOlGGJLZyT1TCAAZxsPjc8L8tkaK4KtgDdLj2zLpQD+x4bj5HY
 4yKizdrwwPEYSLAl+FY144Tqyt8pE1Y3GhnTvjVwvtPWg75sqw4HawGm0uCMEniBMFDr
 ubeaNkmgUaNUn7WHgMj08albaZmnvRdMKQyPOX2hWdNPKMRA7hisfQLIlUmCED7XAQK1
 xdxp6/HL3E9zvtOeYEIriGhrxsjRCpckN+8ZC0I6J3qGNOhtq2ywInkOD/GlDaJh1zrK
 5crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328173; x=1684920173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPLhtaZltjDsm0+7czRR+umbyKr+Au9dGft4aGwUTwE=;
 b=bWHM8tQrlsguQIfm5h2jsOqTN1C0yF2AWAHE+i1t0wruwHXf+caG/kB05q6O2k55IY
 JGZ7M3sy5owAJzlbipwo+eQCwE22zSlfoqV9QnuENpt1FdrgAcsCXpdy8qEnBJ7n43hh
 jt0t6mdJws5F5w0XLdPIKSYag4q932z6bb/WqNU4iUmTid2ETnk3f04Wn/OJg3zahNOm
 RKh2r/8mzaIiK24HM1LAzf2wWyK4rH4IGWnILqy/BY7u1YbpzPQwUVvxPll9oycris4x
 ak1KHJAjxjm7GmVQP0ebSQgD0EvSCewW+438/5EcIQFLskspYQ3sQPuoPWRbb3t+7dge
 aNPw==
X-Gm-Message-State: AAQBX9cbqvNF5PiNWFVksMcCNU77hstwTsR37BaOP1/24gDMIiZuOXga
 HlNbdgJLuFw7MeTRCnEifvNt9Q==
X-Google-Smtp-Source: AKy350bDxB1lpbxb5x0yEXdw01e/iJnvIdahsWC5PAqCtzU4LykOO70XZ1dVmHVQZcQGmzPIwEWuOw==
X-Received: by 2002:a7b:cb96:0:b0:3f0:7e15:f8fc with SMTP id
 m22-20020a7bcb96000000b003f07e15f8fcmr7214993wmi.14.1682328173070; 
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 eo9-20020a05600c82c900b003f0ad8d1c69sm8698363wmb.25.2023.04.24.02.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C14C1FFC0;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 08/18] tests/avocado: Make ssh_command_output_contains()
 globally available
Date: Mon, 24 Apr 2023 10:22:39 +0100
Message-Id: <20230424092249.58552-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

This function will be useful in other tests, too, so move it to the
core LinuxSSHMixIn class.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
 tests/avocado/linux_ssh_mips_malta.py  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cb71f50db9..6788837e1b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -431,6 +431,14 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+    def ssh_command_output_contains(self, cmd, exp):
+        stdout, _ = self.ssh_command(cmd)
+        for line in stdout:
+            if exp in line:
+                break
+        else:
+            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
+
 class LinuxDistro:
     """Represents a Linux distribution
 
diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index 0179d8a6ca..d9bb525ad9 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
         self.ssh_disconnect_vm()
         wait_for_console_pattern(self, 'Power down', 'Oops')
 
-    def ssh_command_output_contains(self, cmd, exp):
-        stdout, _ = self.ssh_command(cmd)
-        for line in stdout:
-            if exp in line:
-                break
-        else:
-            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
-
     def run_common_commands(self, wordsize):
         self.ssh_command_output_contains(
             'cat /proc/cpuinfo',
-- 
2.39.2


