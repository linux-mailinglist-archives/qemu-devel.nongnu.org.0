Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47887606104
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:08:38 +0200 (CEST)
Received: from localhost ([::1]:47730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVHl-00080L-1t
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:08:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV9R-00067x-6N
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDT-0000c5-TU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDM-00050j-Ir
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id bp11so34018855wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjfZFuDfwZki0Motf5d0a8lYGhUl/fr0hF/I9a/jdfg=;
 b=MHBuXt/MG2BzTyt5bjkm9Os3FpD5dgAPeF9EoRxBHvDWyh7ASax9r5zj6lPozWIxV1
 w+f89UCaJcM40SPDbq6idPEDYxDI0qgUYH/KTHqLdLyjqYSpzeWzmW6EwIT/Qopyd9BZ
 EwJNcZeyUC6Z2MbopFPqm9XRuSVqD6pC/AEjE5emakgk3U6MK5VBrjsxHcgzQVv7CTog
 wv4AZMK5MGHU+SN1tsiHxWwfxJ2QCIOs5xvXmyx/Ge9WN7eg5jihnX+zQZp0ebfVrb76
 u+ZoQGj/pD8lVw5/0T1H0qOoGPR0oC/GRAbWGVToySWJw+AW9kQid1zEPACaN3aMME8t
 URgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjfZFuDfwZki0Motf5d0a8lYGhUl/fr0hF/I9a/jdfg=;
 b=y8Cpaf6c1Hduk30jhbpBOYNcBmfVrmTq54hhYUL6RXQ7zUjVrxfjjJGN/UIaMKtR0W
 9Gj9CgLnFx5nrHiZV1Yh3oihwisXLdGl6jPASsGaLbN9E/DbtmScX84et8jcEbRlYyYa
 N/3/IBZuOzekdMxaBR4BTVqgS/V0oO9rsRRLqXbdxkEOq0d/q1ckz4vr95rm6DsMH7+1
 xq/5efNxzROlNrRh0nSGzrJsa8Rr6LPfiYSoYiFwTDdk70b/z34EHo+WBLle4RBVHfo+
 9f9uybZ3kUqVOAf+TxHrY79MsPeWxNUBHpEPH+fQzXk3XSLPEQQvaNod+L3+fBxIDtgL
 hIvw==
X-Gm-Message-State: ACrzQf2Xk3x8HyEaoko2ys2HZwJvceLrsLr5uXDxAx3wJeXEOBza/3ll
 vabgCJHCpm6nLuC6Ucu1OdXvzw==
X-Google-Smtp-Source: AMsMyM7s/7RiqGQcZDtPw185EGrA1Wc7XKtb6tqVHoXZCWHUI1grHfdqYU4g+Sh+D2EpPCocT3zEMA==
X-Received: by 2002:adf:e195:0:b0:22f:6117:a932 with SMTP id
 az21-20020adfe195000000b0022f6117a932mr8523758wrb.572.1666267195151; 
 Thu, 20 Oct 2022 04:59:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d4308000000b0022cdb687bf9sm19963414wrq.0.2022.10.20.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E29761FFCA;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 20/26] tests/avocado: disable sh4 rd2 tests on Gitlab
Date: Thu, 20 Oct 2022 12:52:03 +0100
Message-Id: <20221020115209.1761864-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Magnus Damm <magnus.damm@gmail.com>
---
 tests/avocado/boot_linux_console.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index eed4b49e6e..26eaf1a119 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1175,6 +1175,10 @@ def test_ppc_mac99(self):
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


