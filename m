Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B23D4F42
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 19:47:48 +0200 (CEST)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7iE7-0000Ws-Fy
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 13:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAf-0003v1-80
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAc-0006Q2-6d
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so496999wmg.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/EOd9NVG4jg0l2RelALFJTn19qCwhoAFbcCaykxst8=;
 b=kYzsvNlpzqPRnq7ukV7Lovu5c16RQjQ1Jt/tk2tqxPAFgCPCRzn7zEncsrU/Wia5DT
 PhrWTDliGrYmqL3Sxl4nnHWWHz8ApTsT6ErNcSqObSKlgMVFsZMUfridqrh/JFKaDyx2
 BvjcCYUxJw/7Ym+mMiQ8OW9fzoJjaLZOUlWkWTd5cHOa+oD0CXX3Brkxl7qDETtqlPgb
 RwUsOnV6CX1vYSHjKRBXyw+N9fpe5VNcKnQdAYGyj9Nyck409a15QcejfBHCkDUbBkcI
 0eRFGhSLIjOJ99JRfqv/g4Qe8fEKTkwEQjj1jrSBYNULmcPNKw4B6Wk751wuKsP4dTz2
 B0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/EOd9NVG4jg0l2RelALFJTn19qCwhoAFbcCaykxst8=;
 b=Zeo6dkme+YcwK2k4u/LBBCGdIULg+ZlQefaximO/BAfQhVj0z4JtQO7mS4pfZftRww
 xQxsq1PNf8aAwA56/quQ5Di4Qe85pht8FncEw19qp4RiAFMKq/mwF1z3w7s+OyFANPEY
 pWqIR9IDt71tnjdc8W/w36Qjb5pozt4ciU5ECH/+doWuV/hAWQadZT12D1UPaBgstRNk
 4jTwALRtDJyuLfuPxsjpwfIUkl7b8KUjek0SJwvN72Yul/VcFxxmMtBhKaPK6a9XGzuG
 f/MhMmJKQvu9x3COFNU6K0Xz1IAd66wmYxS5Qm6XhtiWKqvBXakqDY4iTmfiB+qxzKKC
 sRZw==
X-Gm-Message-State: AOAM533/N9nvNq0J9TVWziKiOpKDnp+YJzsotBoyN5woRMeq9BXP3rrC
 rxp88RgIPvmZvd22JWLQMUXChZtXesaNaQ==
X-Google-Smtp-Source: ABdhPJwD2HF3NklQ5phpEiKA1O3WlTPuO5uHM6bovS8QVKqto8dWXr51R0tF7SOqVme5esk+Eid2KA==
X-Received: by 2002:a05:600c:2104:: with SMTP id
 u4mr13828429wml.45.1627235048974; 
 Sun, 25 Jul 2021 10:44:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m15sm33666655wmc.20.2021.07.25.10.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 10:44:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/2] accel/tcg: Remove unnecessary check on
 icount_extra in cpu_loop_exec_tb()
Date: Sun, 25 Jul 2021 18:44:05 +0100
Message-Id: <20210725174405.24568-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725174405.24568-1-peter.maydell@linaro.org>
References: <20210725174405.24568-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In cpu_loop_exec_tb(), we decide whether to look for a TB with
exactly insns_left instructions in it using the condition
 (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)

The check for icount_extra == 0 is unnecessary, because we just set
  insns_left = MIN(0xffff, cpu->icount_budget);
  icount_extra = icount_budget - insns_left;
and so icount_extra can only be non-zero if icount_budget > 0xffff
and insns_left == 0xffff. But in that case insns_left >= tb->icount
because 0xffff is much larger than TCG_MAX_INSNS, so the condition
will be false anyway.

Remove the unnecessary check, and instead assert:
 * that we are only going to execute a partial TB here if the
   icount budget has run out (ie icount_extra == 0)
 * that the number of insns we're going to execute does fit into
   the CF_COUNT_MASK

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
You could argue that we don't need the asserts, if you like.
The first one would have caught the bug fixed in the previous
commit, though.
---
 accel/tcg/cpu-exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6e8dc291197..5aa42fbff35 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -843,7 +843,9 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
      * execute we need to ensure we find/generate a TB with exactly
      * insns_left instructions in it.
      */
-    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
+    if (insns_left > 0 && insns_left < tb->icount)  {
+        assert(insns_left <= CF_COUNT_MASK);
+        assert(cpu->icount_extra == 0);
         cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
-- 
2.20.1


