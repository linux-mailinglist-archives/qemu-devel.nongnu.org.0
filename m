Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7283AE189
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:48:30 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv937-0006LI-To
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qB-0003zL-63
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pw-0005DX-5W
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:06 -0400
Received: by mail-pg1-x536.google.com with SMTP id n12so4084344pgs.13
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwYY5dSeWSmGGmBhQNMUtGlmdzOhLZK9MJXdyKrBIlg=;
 b=Wbm4H0VzQw11w3Vq0kX838OumjE6H4WhVGjVWwnW2cyh4ZVch9vgj/GqfqyqQqbsiM
 WjT6Fjhy2jSJ+URdpvdh0JWjSZ6R/m9xETSzeXMoFH3ySaT+Fk+an+E6LP86o12DJPYJ
 wEAJvQQyJn4m7Ap4IWIIYZpjXGtDTMUx9cXli5OpCUdZTlJNyFaWyU0/zvsA2L3N7JY1
 nQexC+dugIgb8Qf2nlM3nKTG9KEowVnpqQ54Y6KQhnauKvlHN0thIhQRbB5T2dKKLTiP
 it5iZFaiW+Pl3l0HkCYh9nAi8qYECL31s9uBgS/JeDNLY5gvnazcoMD6uFjH/mlg2Bmv
 ALEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwYY5dSeWSmGGmBhQNMUtGlmdzOhLZK9MJXdyKrBIlg=;
 b=HjsDhGMpoMeqCGoAH7vtg+nSdKRdzjxXOcBWQrAqrn4Yq7Abw5v5+ijlJrStwY5/T/
 2we0fHwMT1/alDMJjbNKE0qOA/HWtgk8CYZXO127nzizVkPsre5VVbNTI3QUPP+Lo7h0
 sslDxBhcPcoseTc79RFcoiJ9N/Xe/+APdUIo5ghqzULLJxMpNjS8Bpu8h31IRWdrZ8Y+
 xBeicP6sa/qnd0dhdTH000sF3EQMrwakj1m4r5Gt6/vVaohXu9EedBu1J/hhfPtXM12f
 bn1JmL1754/46aZsfDhNtIS47znFgH+85stKrYBmyNGPvhRep4b77Itn+sDYuepHG1TW
 +jSg==
X-Gm-Message-State: AOAM530+ZyPorz9Q39Dvrw/717us9rI1lnLH+N6y4/Q5YJWJoMOq7NDG
 EvbPpBsAqYbZAvbE61XcGOJnXrbbUB2ADA==
X-Google-Smtp-Source: ABdhPJxpo5Ls7gjQmpvfqt4boXJ3CA1+U2E+oXkwuthkmME6jrXrDkg9HUtEYe73qBYed9GyfrI7Vw==
X-Received: by 2002:a65:438c:: with SMTP id m12mr21743183pgp.425.1624239290794; 
 Sun, 20 Jun 2021 18:34:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] target/ppc: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:30 -0700
Message-Id: <20210621013439.1791385-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..0fb09f2301 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4302,15 +4302,7 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    if (unlikely(ctx->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_lookup_and_goto_ptr(DisasContext *ctx)
-- 
2.25.1


