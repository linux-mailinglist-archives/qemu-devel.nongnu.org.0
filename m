Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3876137DB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUij-0006Hr-OB; Mon, 31 Oct 2022 09:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUi1-0003Fo-AV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUht-0005Sk-I7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id o4so15947805wrq.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbYpYlCRpuLNEiOsilZB4ylHATLxZmTnkB//H2Jyq78=;
 b=HLim6mGNyK/xYlrVd1lnXAIe2BQg5FJnNDaIZXa1pbV6I9C0dskToFoeHb+9TbUX4b
 E+WvOSh1jEVVl3qxdB9sXGDgkelUyVJHBAaWfozkKTKpOK+73GfXV8BTAxObO2OXBTcw
 u3NCYdpSPvBozFQjMBwiE0GzRyRVGuzqjnQP9Hz6CtygiZJwsiN4gLbPOZxYlPg8zPhi
 pu7qWgblzAml3U+o+ju8kWWUjobcHjw866wz83sl5d+oTder+B5WAIHTIU4hbf5OZS6n
 ZBYcydU3hDfimK14UxY9Ly46Wvivx2pFtjfmbLsfvMtYg6uG2kxp42pjQYCkRY2Gt9fD
 Jhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JbYpYlCRpuLNEiOsilZB4ylHATLxZmTnkB//H2Jyq78=;
 b=p3VVm2kfVz3DqoaqYdZod3X7CqifLabHUh2oI1FgwAsfsmGayqvnsGeF0n8/v82Gfj
 rip8hn6ZtzdSWnvNCfNoIrWMFJbLSJVpeSqflAx8hePfg7Voki2jiKC50HJ6Izd3ieci
 ziCqdTZnKA9InU8bITUVEccsckQAFUd7TREQi+4lOKJ4m1OAiQucrMfTTT8nkPhw92rD
 +qv5AXb0fU0U+JhSbyYzuDUtgq6ccpxdq+8LXe0SIDLzJ+nPxPQl9sAOSHVYi3dhXsCY
 qJzKQhhIHMXBsdgYmf/yCQWrcVJ9515EsNWwTWu4TdQCiaysqmz9F4415ZhgtmTd3D2e
 kZtA==
X-Gm-Message-State: ACrzQf3blCo81hvJMauxL9JIGaf8FAta6toP9vWDChxK9vSCSXRox0kR
 u2tqCjftYSvJvbs40Ld8k5E3NQ==
X-Google-Smtp-Source: AMsMyM5vUcHrEl3M/xPIo4g1crW+ABM5J7MJ913yiDdHgTZQR3iQxqe0SdPGAZDyXlkq0VmP1Uu6mg==
X-Received: by 2002:a5d:49d0:0:b0:236:ba53:ec39 with SMTP id
 t16-20020a5d49d0000000b00236ba53ec39mr6224136wrs.412.1667222399529; 
 Mon, 31 Oct 2022 06:19:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c081200b003b4935f04a4sm7772851wmp.5.2022.10.31.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E51071FFCB;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 21/31] tests/avocado: disable sh4 rd2 tests on Gitlab
Date: Mon, 31 Oct 2022 13:10:00 +0000
Message-Id: <20221031131010.682984-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221027183637.2772968-21-alex.bennee@linaro.org>

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


