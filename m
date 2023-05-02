Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991526F43A9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:21:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovK-0004Aa-Lp; Tue, 02 May 2023 08:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oQ-T4
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouV-0003Cc-9o
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2210709f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029710; x=1685621710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HvcZB1nLO4O7UxWgLqh9cONwlcXJM51ksSbsOzMDZ0U=;
 b=rdq0QzxYuWZz3O0Aeest5H0NB4J1pdY1QatAMXUppCbbk54O2E1onkkaDH4WQah5+S
 P3mqhJZ4dJsSY/P8gIW5IiPU2vR13XxmLKx/E6IoW9n9UTS2ZJP6bfqEvFsov7hrUw2F
 gJwL8H0ygYZ+ZCwojLRgO/JMlwzXKJkhDVzfnFYDdc1JzBZ+ypLQYzfOnQy0Pk4C9pR/
 dnK+fixoly2+Ws9PqdjoR8lebgZLmPIq+1WD7uxlflkMgMkBX2G63//cRewkKY1xUhtm
 /2MbuPm9B0G4/rn0p/x62xNOYup5vgGwmswU0Aq1jlOkqixisWjxurGS6tfjFQxTrxYK
 vhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029710; x=1685621710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvcZB1nLO4O7UxWgLqh9cONwlcXJM51ksSbsOzMDZ0U=;
 b=k942lpbNqJEGgWMoIswkXFo2w8B6XwO6QEfFZODiDM39uE2EFJWYjdmSTkCnhZBlTB
 RzgnfF/DJe3AOFfpYuvXIVyyBjHOc8jADlaYqe8hk8CSoUm5/5BZWdn7P0EL5W2SgJ7W
 hMfBQ8gVkPHRiPDLvj+u90eF6g/YaUBpkw4hXIo+qDLAE7eEWqRv8uRxDplp1DlmX7l5
 o0ObtrjJZoa8TJ8s9Z2Z3KuiUUjRInlKRqp9r9hKJSkx1I1Yt8ze2ZUi+yvZJ4tTX2HJ
 IoXKlbQsuf/cWaczQ2lBQBwShm+cxVERQk+CBHx2vwMiJbPKjG8Jk/Y9nFBbuQrNLIHs
 TL+Q==
X-Gm-Message-State: AC+VfDxzcn8F4QWWPL2GdnmEYRyw3Xopp1USdv8XoVO5PUFt4rdaLO61
 T+dcQDF7TpvMGUuYO0v/LyGdn8V/8lqmUWFG704=
X-Google-Smtp-Source: ACHHUZ7sTh9NhecOHRFsV5ZBR4io9UTvEhHhVstZNvNJyjiX23krdvB15jVr1kLIIrRfJQ+GZ/tXcQ==
X-Received: by 2002:a5d:524b:0:b0:306:2fd1:a929 with SMTP id
 k11-20020a5d524b000000b003062fd1a929mr3825441wrc.7.1683029709914; 
 Tue, 02 May 2023 05:15:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] linux-user: Add '-one-insn-per-tb' option equivalent to
 '-singlestep'
Date: Tue,  2 May 2023 13:14:43 +0100
Message-Id: <20230502121459.2422303-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-5-peter.maydell@linaro.org
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


