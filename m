Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D76B2E35
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:10:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaJ-0004s0-I3; Thu, 09 Mar 2023 15:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaG-0004ZN-J3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:52 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaE-0001Wh-Kw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:52 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2995854pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQnWwlhEOKwN526EJ7vC1SsHFf1qm8x3kCA+Rd+BHqo=;
 b=My/ofDXcfpfd6aRg6la0BpvUIKk/PkEFAeDl9XSQDBB+hC8qTjxVqN65G/75Gkso+d
 m4jLEVIRcq8mNOYARAbfAJAiGTo0lpKV2EZXUPWtFXIN5Ie3SWFTNrFoIvVKP3Nn8Zec
 MOUXYB10XP3cEM0VgX8XUuj9xxiD0mT4kaZxYVMy9QZDNPGWCcp08hn9RxI0vGjQKUAD
 unpsUuCURBNDYZtX+/fpxPkK8ALOQAInhnJb+ordysDw+8PXIwBWMXp+/ufshHP+Z8DQ
 Vswxoz49MyMsTQT91V2qcSoujSzJY1CR8/omFhnUDXwL1SEffvyfboWKcgmoi2sS6Ph/
 LC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQnWwlhEOKwN526EJ7vC1SsHFf1qm8x3kCA+Rd+BHqo=;
 b=Axs5w7fpitLAVIx397LZDPHO7WaNjUbFWYZ0a3yuSfk5oCYShmzuQeFxJUkB87pYYe
 4cIxsayikbX3vN6pBr4rkgPw11aspB2nfBvjOKim+usSQHcpW+Fd2QyAFW2glRMUSJpn
 qVmspiNnbw8mgNugKuvWk+blxaZJv4taHJ6NHzlwk+FtD6cdOktdXteMvx4H93hol3RH
 1SsJ9ry5cxkxzruNSb5J4PTNBssm83UURB2hGY+VhAoaXyWRXoGN4c9pkWr77Ge9EnGg
 JHYotIE0hmaT2Zi0F/Slvq6JnKtlGCk50+1ZUyuNaec//dRLSJJUFByTMX3m+mDSHnn7
 nuTg==
X-Gm-Message-State: AO0yUKXJ+yT6B0R5WUu01adW6FkHHt3t39gbeP+MjVWUvB6CSaVN8Nt3
 ARbjAx/GXZuMYmtjvZDEkrZdZbSY/MqWrH5O+RU=
X-Google-Smtp-Source: AK7set9o3L3ki2MWvAt6Qcs5ZUaPuJ49VsrRpGIa6xhJT5TJONIFM81jpHsbcE24IVrhgqiD6bJlYg==
X-Received: by 2002:a17:902:7106:b0:19d:1c6e:d31f with SMTP id
 a6-20020a170902710600b0019d1c6ed31fmr19480838pll.29.1678392589922; 
 Thu, 09 Mar 2023 12:09:49 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 65/91] target/tricore: Drop some temp initialization
Date: Thu,  9 Mar 2023 12:05:24 -0800
Message-Id: <20230309200550.3878088-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

The temp variables here are always set afterward;
the initialization with a constant was discarded.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 6b2065803f..4e3e648049 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6914,7 +6914,7 @@ static void decode_rrr1_maddq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
@@ -7396,7 +7396,7 @@ static void decode_rrr1_msubq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
-- 
2.34.1


