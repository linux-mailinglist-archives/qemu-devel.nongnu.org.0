Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F293C17DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:12:59 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xa7-0006Oh-08
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5D-0001Z2-5A
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:03 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X59-0008Am-TA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:02 -0400
Received: by mail-pg1-x530.google.com with SMTP id f5so6601768pgv.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lllHgSMReAFAQW4NFUeLJDN7hewzeEeGDsmTtDYLnv8=;
 b=s9nuLELFDWCl3eBIm0//0L9Zff3cKMaJgEwIJbMXZg8TzasFiq312GmcUh5nIAfQQG
 XNlie09OH4t2/hoStUkc6nauJIQCtAw/PZCK6Pg2461MHEvE1YbRujvcuMEapY0w5g9G
 5omZq3U/ZDOhZ5cGm5/Zy/rWdTNn6SmMSgWZKqzhiE3mhJyagV6EC49KOsuIswfgTMFU
 NX+WOgsNNeuJ5oYg8zUsp1R1oHdSo7xStNrGTJOtZJM+C20NbpIquhBfmasyu5ioITeE
 jfaOWrJ5Q20/Qw+tf5vEKxYNFbnl4l1TlNba83VNIZHAlyODZnGfqj1lLff40i2Nmec+
 +InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lllHgSMReAFAQW4NFUeLJDN7hewzeEeGDsmTtDYLnv8=;
 b=K4CxKfUPGGKwHb4VqNryhvLXTV59xQccnpK3mzvtUw1e03PQrjutzsh6saJ8iWbiip
 C12J4yhNzNO13TnBVfdf/oUpQA8zX3UzYpJkNu5LclORHF9Rv2dhjXISy2l2hXVMzR29
 yt0ymQUpr4iJv0YMbmsSmVyB51yBVi+MdRoEihuL0xVK3sQSRBWUcbrYjtaLOTfDX86q
 WwG/kgp3sRNYvhyDZZ2LH+Pe/rTF6ec4Jl/P0jQHyu7KMAcb7MgAm8/20qYDsG4KlKFD
 0ODeMGGq3R73pJi+Xa/VIa6jj3q9lkI+27I7OeiKCr0GAgN4kt/hRs4E1HMv8WpHEVrg
 QfRA==
X-Gm-Message-State: AOAM532IuOxrK0LvMOKilKlPsFuB7UkVnhxY8/S4mFs/Mg5BK6YuZn0I
 rdOwL4O6Vfd6YJtb7xPGJvtvrxvA7df6ag==
X-Google-Smtp-Source: ABdhPJyWoWsE4jRvH0aq4OPxbehd9i0la3z7KJaIO3U4vhKNQmaRxqS1Oz3w1MKTPDp5NR7jvC9GrA==
X-Received: by 2002:a63:e50a:: with SMTP id r10mr32887801pgh.30.1625762454784; 
 Thu, 08 Jul 2021 09:40:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/28] target/arm: Use translator_use_goto_tb for aarch32
Date: Thu,  8 Jul 2021 09:40:29 -0700
Message-Id: <20210708164050.711967-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 293917be4f..535b691f3e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2579,16 +2579,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           ((s->base.pc_next - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_ptr(void)
 {
     tcg_gen_lookup_and_goto_ptr();
@@ -2600,7 +2590,7 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
-    if (use_goto_tb(s, dest)) {
+    if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


