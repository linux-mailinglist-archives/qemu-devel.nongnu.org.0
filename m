Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEC6F519C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:32:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qp-0003ZT-Oo; Wed, 03 May 2023 03:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q9-00022K-Ui
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q6-0001iF-PT
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so2903999f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098629; x=1685690629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqFKDoDRW2jAkSF1UORiXyuaYARnoAzrFOXByppFRbU=;
 b=pVcTSHXeBavlwPKfcxFvIFrQgCLhUs1QQepQHJG9aPxtEKbk7jKn6A081h1Nknjw6J
 VPv0FrBNqZUOu58/ZqB3b2OfrC57+e2jKol7+lS0tov+4N51LVrEL1Hjp+CjVNcMTlXY
 ozoCiolm3iXzkgznZRYAx+Omg5UnC+I/OrstPbKUpJYJtLUHsEX9DCp0W1bJvusQeJXM
 OlNbL01CEXDoEuxrSaFe/bRSD+NIVMOSiTBluEqK1+Z4MyHWX35whFOW2rR4b7GrFfqN
 xrPUF3KQiIcdDqf5qbUn6baeZEpsS+Y/m73w2m7gjLtowOtX2fu2r2HXto+iE0etZLtz
 s3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098629; x=1685690629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqFKDoDRW2jAkSF1UORiXyuaYARnoAzrFOXByppFRbU=;
 b=U3GQWloBebYhmHMqMaaeiEF9GMwtpJvJ2BMlzJwLB5NxDAwrXSRcKPAnZWW4s8C5jW
 0jNfyIGjnd0APvAsgfQZfTrv1IdaE0Uwmp2mRySuvbyrMaI69FqNUJa8YQi1m0HJZFBO
 U2mLFlg8Snk2/qc6Jr3IFzIWywYGI7IkizrKcXIXe65jKS0SABuE1Py7XOZdNJnpyWEV
 2EWT80cHuq5LE+HQRHMO4AP6EAOc8yXtV2vRvUR0hXp+adZUGXiW7LxUo6Hel67Lr9UV
 aY8oFQUgFFjdne0jAWAnDYH9lWaDMfVr7mJYl/7gCYPpbL2vq2dnB21GeW2XJhn8gr18
 0qLQ==
X-Gm-Message-State: AC+VfDx0NxuuW1R58FuesVpzXttzD6Fcow7OuXJbROVjNfugjL+ltnX4
 A0bPkH+vYdSSZjr66biclQ+GkZ88NA9O7auhoZRv1g==
X-Google-Smtp-Source: ACHHUZ5amE5sl0WdxFRl3cWFzz4WqH7dUV/RMNfJ55K0dYrMOztmnOMdw+9/u3B6yZ1rwmOCNdxpGg==
X-Received: by 2002:a05:6000:1141:b0:2fa:6c49:5c8a with SMTP id
 d1-20020a056000114100b002fa6c495c8amr12789385wrx.67.1683098629331; 
 Wed, 03 May 2023 00:23:49 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 20/84] tcg/arm: Remove TARGET_LONG_BITS
Date: Wed,  3 May 2023 08:22:27 +0100
Message-Id: <20230503072331.1747057-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

All uses can be infered from the INDEX_op_qemu_*_a{32,64}_*
opcode being used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a4c3240b3f..3bbb846b76 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1418,18 +1418,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * Load the tlb comparator into R2/R3 and the fast path addend into R1.
      */
     if (cmp_off == 0) {
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
-        } else {
+        if (s->addr_type == TCG_TYPE_I32) {
             tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
+        } else {
+            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
         }
     } else {
         tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
                         TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
-        } else {
+        if (s->addr_type == TCG_TYPE_I32) {
             tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
+        } else {
+            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
         }
     }
 
@@ -1472,7 +1472,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                         SHIFT_IMM_LSL(TARGET_PAGE_BITS));
     }
 
-    if (TARGET_LONG_BITS == 64) {
+    if (s->addr_type != TCG_TYPE_I32) {
         tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
     }
 
-- 
2.34.1


