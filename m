Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BC6101A4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:29:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7sv-0005ao-VH; Thu, 27 Oct 2022 14:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sC-0005SG-1J
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s6-0004jP-BZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id n14so1581935wmq.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZL65v0q08abuMcd8/dJR1pUqsCkfFRqsKtdLqAeDaiw=;
 b=qiJ+/yvctHt/wwB0cDMAsn79ysduxf0i4rVsh9GCRjFzl/RvNmvwBwIRZ97VrXY05t
 /ZCid/GvtUnub0pI73k6lLNpiqRUkt3ViwSkY1RjhuWfkdvgZ3+Ev+vZqtpvsgsi9nJl
 T592Iv083BoO3+p80NQwIPo/XaXFnDo8c1Tl+kZkR3prACfPZFGn7M6xxUOnIEbtdLhA
 v2pCGwfUBmBmW6DeKXGy+C626L4Qu7ZcBUPvJr+viP5y4UMZ1Pt0GgpXRlanVtp9LDHa
 FW4oRvzxyWwgXtjz4YI8hZi+cjfjLh7DGeURNqH+0SJ7hlkSj+02F+PPbQIHOcruomms
 cQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZL65v0q08abuMcd8/dJR1pUqsCkfFRqsKtdLqAeDaiw=;
 b=rF7xivfgzX5/EFRD2bzsWLm+eXxlnzTN17enjAV+INqm41wrs3ecqr2TR7DObRqrgl
 Tsp4O5cGWdtR0tTeSNATQHiArs7gvrpOhsudBgWfjDOAG283h378+cLtzZGa9SpKG4K7
 G7iOZ4rkx5UyAfTYlaEVtGQJ68jxiJOK5/5o6PU1cOcvxkkKLNl4Y5iGhkvgCx9iXK4s
 vkLKMqWTsD5JWSZBuKtmKRHU35WFge2iLi5pusEdOsmO7/dbFm2w+GChHzdRuA++SOo4
 JxuixoVKYWU8ipoi6+dMbYLqPDa2+NK9FS+ahgV7q/Sujoq0m3QWOSg6pKec7hA23weF
 fMmw==
X-Gm-Message-State: ACrzQf3W5LfXxbf7UdWO41RJEoOiNqjfE/F7DWSHTh/hRwztyfbnBzDa
 cvODRFNne459HKeAhmP85OIcqw==
X-Google-Smtp-Source: AMsMyM6gZnOFNrKlzNul+5zMB87VrZxl8Mk3Xp/znuJ0dv2f3PKSc16BRDOj8hajieLmTR2aQHp4jw==
X-Received: by 2002:a05:600c:19ca:b0:3c6:ee5a:45fd with SMTP id
 u10-20020a05600c19ca00b003c6ee5a45fdmr6952156wmq.106.1666896292975; 
 Thu, 27 Oct 2022 11:44:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b0023655e51c33sm1748613wrt.4.2022.10.27.11.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3986D1FFCA;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v4 20/30] tests/avocado: disable sh4 rd2 tests on Gitlab
Date: Thu, 27 Oct 2022 19:36:26 +0100
Message-Id: <20221027183637.2772968-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Running repeated invocations on a number of test boxes show a fairly
high error rate:

  $ retry.py -n 100 -c -- ./tests/venv/bin/avocado run tests/avocado/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d
  retry.py called with ['./tests/venv/bin/avocado', 'run', 'tests/avocado/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d']
  Results:
  Run, Ret, Pass/Fail, Time, Total Pass, Total Run
  ...
  Results summary:
  0: 94 times (94.00%), avg time 2.254 (0.00 varience/0.04 deviation)
  1: 3 times (3.00%), avg time 1.837 (0.02 varience/0.14 deviation)
  8: 3 times (3.00%), avg time 91.288 (0.02 varience/0.15 deviation)

Examining the logs they fall into various categories of un-handled
unaligned access by user space and unexpected FPU usage by the kernel
which ultimately lead to the failure to reach the login prompt. This
could be bugs in the translator that only get hit occasionally or just
a flaky kernel - its hard to tell. To avoid these failures gating CI
lets skip on GitLab.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>

---
v2
  - add import for skipIf
---
 tests/avocado/boot_linux_console.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index eed4b49e6e..4c9d551f47 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -15,6 +15,7 @@
 
 from avocado import skip
 from avocado import skipUnless
+from avocado import skipIf
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
@@ -1175,6 +1176,10 @@ def test_ppc_mac99(self):
         self.vm.add_args('-M', 'graphics=off')
         self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
 
+    # This test has a 6-10% failure rate on various hosts that look
+    # like issues with a buggy kernel. As a result we don't want it
+    # gating releases on Gitlab.
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_sh4_r2d(self):
         """
         :avocado: tags=arch:sh4
-- 
2.34.1


