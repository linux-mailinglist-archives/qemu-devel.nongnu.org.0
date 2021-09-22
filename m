Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BF4141D0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:28:44 +0200 (CEST)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvkJ-0003xC-Vj
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWx-0001PN-6Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:55 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWv-0007Zx-OU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:54 -0400
Received: by mail-io1-xd31.google.com with SMTP id b10so1920646ioq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNhKAq0Hehk07nStkX54pJwuqwCV1f5deD76MoX6Rzw=;
 b=xdTn1jRTAOawVo4jB2+K+E5FRWIY2jMMD5bR7r0slx9yqt72CDfRw8oRI6av/UHvL2
 sTBzF9JWUUV33BRVIGnQOOjZVD/7XP++/X31mgOlzRrdkqWg+6B6mlVSqAoUFiE0MKxX
 YOinPVHD9jzqGeAVdw0WdgMx0r7FMgJVUKv9pBQflypp41/wdMqsMDspUE2H80gVukw9
 I3ooIi0qdgN/ykUU3Vk4mh6mrL+9gpvV6cHYGYuNZyS2Ti02ungl/U7VcDdaVhrsGLcj
 CUSt+/k7Ylewd3qlh4rBf+6lMQTYTm9w3QmLNtz9sWkk2Wd9CYBPiZon1dZagyD97z/H
 UYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNhKAq0Hehk07nStkX54pJwuqwCV1f5deD76MoX6Rzw=;
 b=Cc1gacJ9G9J5VBOnoa7Me5INMTKNlvl0I1neucoADjY2V/BdWC5zletlhPCXQ0+CsJ
 rU7b1kDDa3flieNyU7LXbtNlzjsQNH6qD0oxsdwpSUwfs2EpfvbIpUCX3xq/A/VfmY6A
 pTBUGQ2kSUBWvKV0rgq8tvOQDTpRpTAZWHbh23D6yhc47kMFa+LrFsf6KTpR6Lq70too
 KCyaq4E3zAgB9bac6K7MgE907gj7sB0fqfS1W2U8b0a9mWaZFWPtd2wFdSG7gAQUoc3m
 fKT25dvzZN/lFE7QcxdUgWPD8PziAuQgj6GxWcrmFY9eWFXv7DDISNu1FMBHMw9javDh
 Y43g==
X-Gm-Message-State: AOAM5310ziB9hH6suFkoeTeU822vO0Ve24R5Dq8cNbNMfWAoQwaQwjbr
 EUQ7L79VrJARIO2kWYw1lLvigxA8aPqSk6VyMvk=
X-Google-Smtp-Source: ABdhPJyCMEXn1CbJjIwdv7YNlRPH2I39KA4sHl9gq4qKPwlU5aQUjD2LkzcFSyZXNDIZDnRtyMBiTQ==
X-Received: by 2002:a02:6988:: with SMTP id e130mr1092054jac.97.1632291292621; 
 Tue, 21 Sep 2021 23:14:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:52 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing function
Date: Wed, 22 Sep 2021 00:14:38 -0600
Message-Id: <20210922061438.27645-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create dummy signal queueing function so we can start to integrate other
architectures (at the cost of signals remaining broken) to tame the
dependency graph a bit and to bring in signals in a more controlled
fashion.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   | 1 +
 bsd-user/signal.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5a2fd87e44..85d1f8fd2a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
+int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 
 /* mmap.c */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ad6d935569..4e7f618944 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -19,6 +19,14 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+/*
+ * Queue a signal so that it will be send to the virtual CPU as soon as
+ * possible.
+ */
+int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
+{
+    return 1;
+}
 
 void signal_init(void)
 {
-- 
2.32.0


