Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8716F08B2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:49:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3om-0002Xz-1f; Thu, 27 Apr 2023 11:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o7-0001po-4O
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o3-0004kp-MC
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso7955217f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PG4UaEnYvjghjI9pm8jP+I8uIcN8w3ndXb9vuAXwPTg=;
 b=vFjEqhh+IQXdASsFj7312Yd5G7ee1P/BBHvOIWEw7UAXgxxZth8bK+CMH6EGyd88MO
 OnpdOAQqWb83CN8aplBAlkzZcvlknZXAFp2vk1gQMz1DelhqKLk99dlOR3wb63/5T75x
 WsdGJM09+yJDH2foVEEa17YnGkuguNWFTZ+cc41ZBrlZIhYo6D4TPzpX0rLA5EBLRWgm
 Z8xRPNOrIVcHZ733dVNz3HXYS5SN78TRudN/MRgGM9ocGv92fovpRK5IUyCMjQnUkyj+
 ThHZyAqL3ca1pmWRY77CW/Nwf6KaA6GMW3Ul5ROTtLxNNS6CoP/yIaUTKfiep45zdw4a
 H9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PG4UaEnYvjghjI9pm8jP+I8uIcN8w3ndXb9vuAXwPTg=;
 b=H5kuOf4HiLKgcvlswpXUtovzkBzwzK3Vig2JikcwrlhFMxawIbVmm0pU4T14YUibWP
 uWxzMkH+ZUDeLHkB6pJWZU1BvjGAfthqlLlWB646HYwpCZQXap+Dl903L5MI9jNC/UOo
 vgj3FwnLrUE583AW61MZdt8xA/59Hw8zEmbPtLak+UocB87La07KDJMGlzWCJNpCHcbQ
 39H0JNoDWyaG7dBPDPHHHKk8Zu67Lh+SQxE6dPw3XrLzUZXFjn2lqvYVLroqrPwmW3Ph
 xMWE4hGAIiKH7PYA01tB+gLEGVuJ8tk1Yc8em5LlO30RkRY5ojniY/l3shxwqoMOnW6R
 30WQ==
X-Gm-Message-State: AC+VfDzG5zHzPBXYAsO+BPWSiWSHDb7qS9EkEWX18gckuSbRIvRD2MOv
 WOVF1mlCvkVcAKGRnscJXdGxIA==
X-Google-Smtp-Source: ACHHUZ7Bn0wkshWYFfEKQE2YQqwookwmi1vC2KMWEGqOtytZPFZLfCj90ZPJboNUFbRlth7r0T9PHQ==
X-Received: by 2002:a5d:6e03:0:b0:2f5:9b1f:da81 with SMTP id
 h3-20020a5d6e03000000b002f59b1fda81mr1667169wrz.54.1682610314112; 
 Thu, 27 Apr 2023 08:45:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm21468459wmk.20.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 808E31FFC0;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 08/18] tests/avocado: Make ssh_command_output_contains()
 globally available
Date: Thu, 27 Apr 2023 16:45:00 +0100
Message-Id: <20230427154510.1791273-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20230424092249.58552-9-alex.bennee@linaro.org>

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


