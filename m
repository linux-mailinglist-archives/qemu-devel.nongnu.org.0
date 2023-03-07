Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A296AED73
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbeB-0003ys-NF; Tue, 07 Mar 2023 13:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe9-0003pL-8O
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:45 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe7-00019l-8z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:44 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a9so14988969plh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQnWwlhEOKwN526EJ7vC1SsHFf1qm8x3kCA+Rd+BHqo=;
 b=r8C2nWVQNJVlE0HixO4aUbw9UbbDuZbZaYWvDWolC+kdhzxswL0KnIYaS15pXIAMeE
 VSgSR+FOh3fMlyp3oYNdbx9APfM2P/R8E0Kipoo0oWfBoJ9T/0THrXsjCgaOMXm6WHsx
 2sMpw/pCjpNi1nrAOomipzS5QSGvOrPYLeEGiBU2yeY0Rx2SlSy4LNN1vInphRcEYEXM
 oR0avsKOc5jEDlrTukzKTItfhReaTMiEnAWAI4UNrfzg/zOyZPmD1g1Cc7NhAmSvizLt
 4m+o58VtwlShT5Q3op7XT6Xhaga3Rtugc1g2NOY3TinCTBHWTqAe0/9zsO08N4DX9sge
 JHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQnWwlhEOKwN526EJ7vC1SsHFf1qm8x3kCA+Rd+BHqo=;
 b=fszf61RpONJHZVv6x+3n3/9sIr1a0Ni8yCIY9xyHMFs4YETAc4Akxt/lPofimnafsz
 m/k0saSdZ0hrXIltkk73T6XVU/RsYFzhDHVBNf+AXpwPe9w3XtQcmKVf1KUisI/fH3cP
 5ITOwL65bm++bJ5omlHZS8q3AEhD6Ksmy6yjhW3Zj/l2zlgEyH7Md6ncF1ZtgWDmho0E
 GLwe9PGvGuYWUgJhI04mIga1NV84MmrrALFGMP1p02oaW300wzV7KRAb9O6EHzWJpfEK
 rdnRrBYJBjZpdAtSspi/Vwe4rcRvI45gCiz1pnwk5e2jSUPoiZk/K24u8IcGcv/0XV4V
 DXlQ==
X-Gm-Message-State: AO0yUKUYLuZNrjjkrvrjfH4eGGmXmeyvnjyrpSN5+gmnu/heO7oAqQpK
 h8+jIka44gZK5dtwcvDik1TIrbc9/XZPDHi9mag=
X-Google-Smtp-Source: AK7set+Vn5OnPE1cBu5vUDdhdgEfdiLbccpbpBiKK0hGCK/He/LRlNkMyWw3ui569rRZe4RDe7KKiw==
X-Received: by 2002:a05:6a20:69a3:b0:ca:4fde:4aec with SMTP id
 t35-20020a056a2069a300b000ca4fde4aecmr26179133pzk.49.1678212161730; 
 Tue, 07 Mar 2023 10:02:41 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 65/67] target/tricore: Drop some temp initialization
Date: Tue,  7 Mar 2023 09:58:46 -0800
Message-Id: <20230307175848.2508955-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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


