Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7E6D4A96
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSX-0003uJ-Qj; Mon, 03 Apr 2023 10:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSM-0003qg-66
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001AE-MZ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id n19so17286884wms.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IM5IsuhD9SWzbJFvTVd/5A+kw5NS2zU/+ji41aVhTPA=;
 b=GJo+lWOK5EC+L1Q52nA7EBpDQg+4w0ri284Yl8v7S6H+Z6CEd4v8uFlX72GXAgvOMX
 RcXsJpHxVrij9GEEfQKj5S+si2X+uf6l5+wc44OCbPj+o8BT7s+5sO55QM595cjR3ycJ
 BKJyM72bJRXHFjYKoRSa5MLhRz03XXQawk2uLD+A1fkOyLWmpOiAMvCZ6A/w0gBNegcs
 wPf5Fsg1/O8b8D/K2hVinufJwLfS4T+V6ra9xzDMsQieGsvc9djIPGRMaw8umLUmW3+C
 JAhyzisgNLl3Qh0yg8tuReaD3n0KTQaZRN4QwZvnAjRLTR0Qn3mWK6P3qqdnWZRI5w+G
 ME5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IM5IsuhD9SWzbJFvTVd/5A+kw5NS2zU/+ji41aVhTPA=;
 b=w2dXJzl1ltWAcF5viQObwJ+1NTtbQSA1/dW5gkqIMzLfhzVeCYXeM78W1aTVPQsEBq
 QYAW3S+0MgsWP4GIktuCo1+GhNb3ztEvx4uT09OgPU/Awf6vADGGtaSxlTWBaOU+5SvA
 03NcuRY8HGrBA8JbtOsR8duk8KX+lL/QTMlf4Kw5X/vL0XmAfXFf8ZVWCz6EThOqbj0p
 EAZ5sCytjQfxKBOoP8G1P82aqzDRDq/YC/sKQ8Oj+BkvAtptm8ZsenzKIqSyVcyTgTBc
 NSE85CUzDyS/4ndAYDRvx30N5bQH5nowddccKs1CiY5Bw8GifGZa+1kUCCkCDBh3dhLn
 sZ8g==
X-Gm-Message-State: AO0yUKUFnF6931dIQLHXIyHeRl10YC9+q2yUJZ6vf6F8ZRruLZA78HBz
 bqH8lxD3qkgQ2sNx+QxtwKzxioC8UaQ2oI46dOo=
X-Google-Smtp-Source: AK7set8bAtbo09K8nwTSw25qFbAuWGClvp45GbAIrqYEEwdKHeeoNypdZ89BiRyEN6JbDdULXJop0A==
X-Received: by 2002:a05:600c:21d8:b0:3ee:5d1d:6c2d with SMTP id
 x24-20020a05600c21d800b003ee5d1d6c2dmr25667055wmj.35.1680533201775; 
 Mon, 03 Apr 2023 07:46:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 04/10] linux-user: Add '-one-insn-per-tb' option equivalent
 to '-singlestep'
Date: Mon,  3 Apr 2023 15:46:31 +0100
Message-Id: <20230403144637.2949366-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The '-singlestep' option is confusing, because it doesn't actually
have anything to do with single-stepping the CPU. What it does do
is force TCG emulation to put one guest instruction in each TB,
which can be useful in some situations.

Create a new command line argument -one-insn-per-tb, so we can
document that -singlestep is just a deprecated synonym for it,
and eventually perhaps drop it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/user/main.rst | 7 ++++++-
 linux-user/main.c  | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index 6f2ffa080f7..f9ac701f4b1 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -93,8 +93,13 @@ Debug options:
 ``-g port``
    Wait gdb connection to port
 
+``-one-insn-per-tb``
+   Run the emulation with one guest instruction per translation block.
+   This slows down emulation a lot, but can be useful in some situations,
+   such as when trying to analyse the logs produced by the ``-d`` option.
+
 ``-singlestep``
-   Run the emulation in single step mode.
+   This is a deprecated synonym for the ``-one-insn-per-tb`` option.
 
 Environment variables:
 
diff --git a/linux-user/main.c b/linux-user/main.c
index c7020b413bc..5defe5a6db8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -409,7 +409,7 @@ static void handle_arg_reserved_va(const char *arg)
     reserved_va = val ? val - 1 : 0;
 }
 
-static void handle_arg_singlestep(const char *arg)
+static void handle_arg_one_insn_per_tb(const char *arg)
 {
     opt_one_insn_per_tb = true;
 }
@@ -500,8 +500,11 @@ static const struct qemu_argument arg_table[] = {
      "logfile",     "write logs to 'logfile' (default stderr)"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
      "pagesize",   "set the host page size to 'pagesize'"},
-    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
-     "",           "run in singlestep mode"},
+    {"one-insn-per-tb",
+                   "QEMU_ONE_INSN_PER_TB",  false, handle_arg_one_insn_per_tb,
+     "",           "run with one guest instruction per emulated TB"},
+    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_one_insn_per_tb,
+     "",           "deprecated synonym for -one-insn-per-tb"},
     {"strace",     "QEMU_STRACE",      false, handle_arg_strace,
      "",           "log system calls"},
     {"seed",       "QEMU_RAND_SEED",   true,  handle_arg_seed,
-- 
2.34.1


