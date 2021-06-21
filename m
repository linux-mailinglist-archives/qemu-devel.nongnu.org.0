Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD583AE18D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:50:52 +0200 (CEST)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv95P-0002W9-Pk
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qF-00049n-Fu
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0005F6-Hr
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: by mail-pl1-x629.google.com with SMTP id 69so7651782plc.5
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2Ouh73hF0AN8kJMLg+kfMZ9F8C6D2HrVX+Y0FukeRM=;
 b=EcaxYBWRyh18mYoxCHXWUA7BGoSb1bRc0HD4P2Yr7aExkjdnVJVbTDi1avkWY1XggQ
 XgLdh7V06xcjs3Mu0Wa+XWl+Q6OtjN4AbxuDy2Uqa0XURIMc8XjfDsGvsi+EE/bjc0rM
 Ba34foj5s5EhNz3S7MBSZ9SPAx1wb1NYO50kJn4VcTpeHcKPxrTjs0Jbr6/IbENdhYLx
 6sDsJGip5tQ1kwXllS+b0pQDOrHoGGHMozfBlVbTyDlEYZuhNO1girer33hxtIko/iu7
 Nsxr3/xKtnvuptx51kj3BI3bvCAvde92c3MsBPxqXuqi6tQbl7kVg+tu1B+vJIT1P4en
 kajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2Ouh73hF0AN8kJMLg+kfMZ9F8C6D2HrVX+Y0FukeRM=;
 b=An3BapQUcrvurrPkfrwh87WvCFTovnAsISEZieYGWhWSwTY3PbBQRFGiZFThuKOahV
 WlFTMetlbudnZYPi8EoJ+ezQtzTcnFNnjwbDoL84zBXZETVh9zBHB9UAqJUFiSyP4r59
 n4d+n1eG8P+4+1E6EjkhXzCqItsIwmvkrj75Zn71Y6+SlA8GRjCJnAzhlczwPwwDchLs
 7GsHdlpBg4Cmcr5WZwl5570XWYTW2WY79ZVC4/qEF/nDQq5J4ez7sOS7aKLGcZSKhuw4
 lBS854w+GFKllYfkyWKr1n1Aou2/BU8u4A00T9yPn4a0l84AHPWKF7YrjpTmvpndlCYM
 ZxyQ==
X-Gm-Message-State: AOAM530w017lU2ofpiFDemfbzlMCr0L4GFnLuSAVsYFrEkV55pv1/Zbb
 JASGTlQzs22OAPOeC1ENSe7sgn00DGqrFA==
X-Google-Smtp-Source: ABdhPJx5nRv3e8hkBuA1OflyauVXS+AhzeeFus1arUXPqdp7D7xCQwQdaHshNYKlb3q0x+9RZido/w==
X-Received: by 2002:a17:90b:8d:: with SMTP id
 bb13mr23683552pjb.98.1624239294431; 
 Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/26] target/sparc: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:36 -0700
Message-Id: <20210621013439.1791385-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4bfa3179f8..fb0c242606 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -339,23 +339,14 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
-                               target_ulong npc)
+static bool use_goto_tb(DisasContext *s, target_ulong pc, target_ulong npc)
 {
-    if (unlikely(s->base.singlestep_enabled || singlestep)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) &&
-           (npc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&s->base, pc) &&
+           translator_use_goto_tb(&s->base, npc);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int tb_num,
-                               target_ulong pc, target_ulong npc)
+static void gen_goto_tb(DisasContext *s, int tb_num,
+                        target_ulong pc, target_ulong npc)
 {
     if (use_goto_tb(s, pc, npc))  {
         /* jump to same page: we can use a direct jump */
-- 
2.25.1


