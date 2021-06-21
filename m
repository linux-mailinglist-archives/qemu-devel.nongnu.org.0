Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194643AE180
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:42:23 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8xC-0001Sm-4o
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q5-0003tn-Hc
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:03 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pv-0005Cd-Ct
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id t32so1055498pfg.2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+A+nkJp2mLCVWp/nN9qk7znE4gchviqhiQyiO9wFNI=;
 b=eEPW0PV6a78eUSDanE2/wuTEz1mk/7zCcpdaOFY7DuejgymgV6+AGycj6fweELofWm
 5jvCqEXx7M3xsa6DO8+2KzzeuaxIfv20n45aE0b90a4MZSoLglwjFbBoysh5c5rdeCSR
 oaCxblSXly5vhn7FgRP9rzEyZuPtws1GAas8Ps5FwD5oWJx+umk27ZqJiVPUyeDY4mqJ
 ggikpKsx/ZZoCebnbeYrKj9LwqBvJPlq4r7EKTENTEJ8cmIZ2TfwCPBI49In71UGl7tb
 Ol50oTGm/afTouVQ5/iYyEtPIVWV4Te+m9jlTMwg6BhGXiKqZ7TCJIC4D8DNQTuXjxbT
 MHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+A+nkJp2mLCVWp/nN9qk7znE4gchviqhiQyiO9wFNI=;
 b=c2qx49K8d8TYCzwvX3RtbCcEWZ8ou3kFnj7oDk1svs4iwKzG0WGjmr0gAu6VJCjrfV
 PotKUZ8r2wvAv08aw3YF+e6IUOJLsOAUTp1x+ij9IkcNIZbkYCfK9q2bMJ+UAZBaGGhV
 I9ynNpfBQLSvMKqDw9QCTWavtU5PBcUNpkK0mMyf3tT2F+sFWZzsRiOGTHX1pRcv9hur
 HtYgKNm3613gWOaSZ+9d10PI1OKwJqvUpW6DGMFkbvS/r80y/UQvzpgsENlb5dZL1JDd
 4JgS3VHMPUyRFNzXBEfxx1HAC46jxcu72w/RePqOXJ1TpT2BtD/uBAzy4urYiPUBJkdF
 J4yQ==
X-Gm-Message-State: AOAM531uPTZZS+2G7kyHSVhZb045L3S0gfiBak/JtMHBjPfqmVtWG1eq
 7EFS2WeJYkuYDPL+zuiqUA17kFXmAb1mLg==
X-Google-Smtp-Source: ABdhPJxZLn7E0eRDXjsalIzVyTGsni9Lm++ztB2d3IAY4IcMtIiVW/6i9QL3jtMM1ehXg87tGMQVZA==
X-Received: by 2002:a63:5fc5:: with SMTP id t188mr13033677pgb.10.1624239289727; 
 Sun, 20 Jun 2021 18:34:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/26] target/nios2: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:28 -0700
Message-Id: <20210621013439.1791385-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 276643cee0..2e2c83f3ad 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -150,24 +150,11 @@ static void t_gen_helper_raise_exception(DisasContext *dc,
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-static bool use_goto_tb(DisasContext *dc, uint32_t dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
 {
     const TranslationBlock *tb = dc->base.tb;
 
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_R[R_PC], dest);
         tcg_gen_exit_tb(tb, n);
-- 
2.25.1


