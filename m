Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D911851042B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:46:33 +0200 (CEST)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOKf-0001EB-0I
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0002xg-MI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5d-0003oh-Fi
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:03 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a15so18431342pfv.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GJv6uZ84D47M1bBbT1Lvoq355I9dlxsiUNns6tmEPo=;
 b=RjYX9P8MDw7aMPqEYP7Z4crwTbQ3JfgVrKpSC+NFUERqEmUUS+shoh8wFh4eEOU2PQ
 1+cRsFXgsPC03I55UXZhV5c2g90VgJsuqNqoHps0OaePE2iVwB5UW4q0bGCpLvQB4TBg
 eGuu0J+89QB//CE/nBomwhk3jdnTFbEfrZexTOxP6S10mckHjJC9aNiY0LNhO5j5r5Z+
 LGoIqutq+RAsUIyZBe7+CjOHoeeWqyEmkHcVoK9mQ5BNBY6kRcG7cBLnSUnOCwBowHEg
 J3fd/cuNuHZGudRtBU2Xk17F7pB2oT9r4Dtec0qHvH/zIizcrb4Sqj8+CfS4MAam98jO
 GPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GJv6uZ84D47M1bBbT1Lvoq355I9dlxsiUNns6tmEPo=;
 b=jFEEhZ8RiOoE1KmYs0uLd+j1LeDy7oJoZnLC7l6xWbnPhCCt7q1F6Zky3VTr0Ie4G0
 TDn9qLLFiUlDTw/GOvNZjFOiboB4IDuwPYtODNKIkrMGyvEC5qs2YzdkyBfEGfBIozHR
 X8kei95snSNcGsjRzYZfZIKrpkYhj/1w3dn2dUGXH95C0EGJGKOb1gG/Es9Ye3EwiXjQ
 9GLq0nIplN6Vex0GD5iWmDbDAbA/FmMZOtTklVX70lgzAHfbPTQ/ovw+GyLh/Z3XW6g3
 MzbjQ6wv6F/+9e4qKxa6LNtC+9k7LwBZdMq+pdlBFttnXa6XnwIKM3w1CUrJc7YkqUL2
 hywQ==
X-Gm-Message-State: AOAM533Wpu/gk1oH8WAyZ1/uUSNgi3slcsIL94gv8idRlC8/0r8Ua/gR
 rxl6dEFxnFIPeDrzVik111RLGhFFuBJW2w==
X-Google-Smtp-Source: ABdhPJwAnOn4qOPPXFH41ts2Bb+kwNKo429ew5gAhaapdwYtqGE/uchxJdLEA9iEMOgpSBWd/mcRkA==
X-Received: by 2002:a63:7457:0:b0:3ab:224c:fef4 with SMTP id
 e23-20020a637457000000b003ab224cfef4mr11504776pgn.149.1650990659956; 
 Tue, 26 Apr 2022 09:30:59 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/47] target/arm: Use tcg_constant in disas_cond_select
Date: Tue, 26 Apr 2022 09:30:10 -0700
Message-Id: <20220426163043.100432-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3de2b27cc7..9b678cc5af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5255,7 +5255,7 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg(s, rd);
 
     a64_test_cc(&c, cond);
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
 
     if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
         /* CSET & CSETM.  */
@@ -5276,7 +5276,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
         tcg_gen_movcond_i64(c.cond, tcg_rd, c.value, zero, t_true, t_false);
     }
 
-    tcg_temp_free_i64(zero);
     a64_free_cc(&c);
 
     if (!sf) {
-- 
2.34.1


