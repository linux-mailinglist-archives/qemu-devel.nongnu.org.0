Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9376E4E7C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuO-0002Kb-1p; Mon, 17 Apr 2023 12:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuK-0002IS-Eh
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuI-0001ME-PY
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so1625987f8f.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749645; x=1684341645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6Rq6d1Hv/zkHtdwcgnd6mnoTvLT3U0+uR+FS829PXk=;
 b=kUnsnGuOQuMOURCNSr5vyZb8ntfhk+uoD8Y9IhzxyEOVuAVkAy6zaAPKulWn8aONeA
 7bQ9yCspX5Mvq61wp7GR0oq+/IhAYwxfu/x33XGIyNlANyheKaXwO+lpiGORf2YMv2pv
 O6NqANTUAYgKn2J0MwchaKm9mdgXkW9oaETe87iP+4edK2aW+CYanfCIX/0EVY7BBqW8
 qP/c8KRd20QTDEappUITbt1gPDaUMC22sFlXwzsAPV3lz48/t584/9g+moM3Gd77858D
 7a4HRrtFxvdJMlcmpK+TUfBp8g2h6PHbk9pZ61QI0Fza1m02GFPHE7Srl72gry5gvgSH
 JXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749645; x=1684341645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6Rq6d1Hv/zkHtdwcgnd6mnoTvLT3U0+uR+FS829PXk=;
 b=Sd0cZMg7owNduGT0hpycWS2/nJwzdwDbOR3M+jilzIrfBq8YyJowDVi0td/i1ZaBz0
 dOvoR07BxvSxBhfXhT6Ui1GC/xMwxn/xJ0EXLF1nEDOx3ZuJvNJK46hE4LoMkRFeN3Nc
 fKn+9b0ju46BmBGXBLitIIapvuG/9GDmVFHnG+TEh6mwjwDri0OygHFdL8K6ejtnDA79
 hPuXmEI7GY3IZMkuxW+JgHCSY2Fhvq346asWecqRXJkjQEYYQgMIgxqn1AD4z2aUC6AQ
 pFwP/DHfM+cyAHCGTHzAbVN9f2Y6UtCAE9EzdG+Ump2oykoh2Zv3sE7OFDqvpKxO5zvL
 mB9w==
X-Gm-Message-State: AAQBX9eHIgQ5KgpWYDJubqLo3KLeF2hrBSmLl19fQOVD7z75wIAB4kXz
 9bB7FoUGLf8qE0c2inCPLST45kPsRj68gfj8GvE=
X-Google-Smtp-Source: AKy350YsHcqybPJCRuIzB0Cyw++psKo0ZOIWDv5wU5RktE36vXAZHrbyrTNvOlhlAcBtcAwah1+ZTA==
X-Received: by 2002:adf:fd44:0:b0:2f4:15f3:271e with SMTP id
 h4-20020adffd44000000b002f415f3271emr5854630wrs.2.1681749645250; 
 Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 04/10] linux-user: Add '-one-insn-per-tb' option equivalent
 to '-singlestep'
Date: Mon, 17 Apr 2023 17:40:35 +0100
Message-Id: <20230417164041.684562-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The '-singlestep' option is confusing, because it doesn't actually
have anything to do with single-stepping the CPU. What it does do
is force TCG emulation to put one guest instruction in each TB,
which can be useful in some situations.

Create a new command line argument -one-insn-per-tb, so we can
document that -singlestep is just a deprecated synonym for it,
and eventually perhaps drop it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
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


