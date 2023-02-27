Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261446A3CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWO7-0006g5-Sr; Mon, 27 Feb 2023 00:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMu-0002bU-Bo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:12 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMr-0007PQ-Gc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id u5so2165712plq.7
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoOc9y4gxns7hXo8hpTTJjZUS2Pw2Ja2akP0DgIEizQ=;
 b=RcIb40jX3ohyJrPxeRa/L+yr54MDdd8GW5iJsIQez//BRSURl54EZZHeEEYwv0+KG0
 r+zeSo/LbPte2H3z/leyY5zQhcqfOoPARf84urcN2KeVKiNWRQ/qeEZem6Z7SW3Jy7bL
 8Grgn5sYE4EPff59FPOCZG99OymZaWGqB0j+GbUWS6WFvI1d5vRWg95JB/6+28E7pd4x
 YB6yhYFaLpQIp9icV2bKavWpb7AiDSp8rEJrvucUzDVY6r2UZKdiZ2IUvsYiY1pYsgbM
 JQI+6PQFbZVTwKbrGlo42SmdSGbMDpptpGu4WM3orG9L2Xn2DMJFcVCYFwey6oRznnyu
 hfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoOc9y4gxns7hXo8hpTTJjZUS2Pw2Ja2akP0DgIEizQ=;
 b=E3VwQ5O+Ho+zgG8rnJ9dsXkmTRN19Ckm3ICKUw3YP7PPK0f2VfGhep0dAg6T09pbuy
 tqCBcaBfnq2hRsER7+UTTXrsMbs87D7GYCU1SLPurlqDSrm/4QllROgjUR4/01kP/EtW
 Cr+EtM61lKdZG7fMoN7H4gC9Vaj3tJoXSiwpRJnhqUyEB++sFn5gbI+jwod61jKKAZTh
 4kLd/lDTFCePrjoPByWPwTmKxijBAC+jyvDv0IHIVvrre81Q2/t1cbrAw53LLnKkNf5m
 4Yi+Dc55G/9l7ticALnV3Nn4l7Ex3JgmlJScOogiL9Ljgqg2roGAqQBN1zYqGln2RZgK
 5BTw==
X-Gm-Message-State: AO0yUKU5sw86YeO/JgfesTYaz9859uHcb8pBNx9M0pv5L8WqHM5zY2cc
 S4P6kImHMwYB4dGWtfGyOcSjVYZL2ZwtyXo+0lY=
X-Google-Smtp-Source: AK7set8MfebtV0YZSWXMa0GdXMqrzl1zUkfZL+q2kOKitklz6O2M8W/g0oDSmUK35iPk2l1XqMI/nQ==
X-Received: by 2002:a17:903:430f:b0:19c:fc41:2dfd with SMTP id
 jz15-20020a170903430f00b0019cfc412dfdmr4598417plb.29.1677476887880; 
 Sun, 26 Feb 2023 21:48:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 54/70] tcg/sparc: Avoid tcg_const_tl in gen_edge
Date: Sun, 26 Feb 2023 19:42:17 -1000
Message-Id: <20230227054233.390271-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Push tcg_constant_tl into the shift argument directly.
Since t1 no longer exists as a temp, replace with lo1,
whose last use was just above.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 814f3f8b1e..925023adef 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2842,7 +2842,7 @@ static inline void gen_load_trap_state_at_tl(TCGv_ptr r_tsptr, TCGv_env cpu_env)
 static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
                      int width, bool cc, bool left)
 {
-    TCGv lo1, lo2, t1, t2;
+    TCGv lo1, lo2;
     uint64_t amask, tabl, tabr;
     int shift, imask, omask;
 
@@ -2909,10 +2909,8 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
     tcg_gen_shli_tl(lo1, lo1, shift);
     tcg_gen_shli_tl(lo2, lo2, shift);
 
-    t1 = tcg_const_tl(tabl);
-    t2 = tcg_const_tl(tabr);
-    tcg_gen_shr_tl(lo1, t1, lo1);
-    tcg_gen_shr_tl(lo2, t2, lo2);
+    tcg_gen_shr_tl(lo1, tcg_constant_tl(tabl), lo1);
+    tcg_gen_shr_tl(lo2, tcg_constant_tl(tabr), lo2);
     tcg_gen_andi_tl(dst, lo1, omask);
     tcg_gen_andi_tl(lo2, lo2, omask);
 
@@ -2931,9 +2929,9 @@ static void gen_edge(DisasContext *dc, TCGv dst, TCGv s1, TCGv s2,
         lo2 |= -(s1 == s2)
         dst &= lo2
     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, t1, s1, s2);
-    tcg_gen_neg_tl(t1, t1);
-    tcg_gen_or_tl(lo2, lo2, t1);
+    tcg_gen_setcond_tl(TCG_COND_EQ, lo1, s1, s2);
+    tcg_gen_neg_tl(lo1, lo1);
+    tcg_gen_or_tl(lo2, lo2, lo1);
     tcg_gen_and_tl(dst, dst, lo2);
 }
 
-- 
2.34.1


