Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859A5104D9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:04:32 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOc3-0004km-Kf
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5u-00036A-8X
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5o-0003u2-U4
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id c23so30752179plo.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqPxzsOVci11FTYqMcAeRTTX6WFeSM6vs3YcepVF8+s=;
 b=Hwj23mMLdrr1U7OV2zrQ3m/mhiPlbnhQgcpGWBdssFfAmBRtM3M8f0jfITLT6W5uTj
 S/r0ePxzZQ97bEpyvPz4g8eSKrEMtgjfvzPNpiEq+81hSDVIj73CXPtcowir5lXSINQN
 t1Vu5IFzL3G27v2BsKpqJxYYxoMVVVVVdeNgqnYIc5vkJMZVdBl2pdBEvDDIzi3wXppb
 k4Km1r+w0mx6O0VMcmkCWkwiRR4x+KllHglWCjPS2KWogoe6P/6nIbg9hC5CIx4ZBZMh
 I3+mj7tvbgmNlTtTLoExLnl2xUrMMr4QCmtGZDbi4+b1AobQQGRRJPvA7UFtBfKkGhVj
 kXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqPxzsOVci11FTYqMcAeRTTX6WFeSM6vs3YcepVF8+s=;
 b=d2SML9Wz21vu4RDk1MMq6JrjhxlXPBT0lWQ6pij2nBRkszyZ7oAA8SRbj3/OglxAcB
 HEmewSIKHksPL5DSz8+6l8yBiu2ZScwZVY5ksZAfl0vvxDWEQWR/zeQssffa1PActfiA
 Lyod2psiOao5MVlrzt6ClRJMWRHFhdUSw8PleaUFXe9MAOTSJuMjcLEbQush6kHWGFOi
 y2JHpAddcpfvzZWslFNYhfFOj4FU1qa0q1kEnsoy+qNGzTuWhsG+QiT5EFbY8M5/mpAw
 LyvKt8dUZk+aiTWtsMSqDTh55xjXODikSgjezaOk2dorrs+2+08k9OoqYv75ziVSku+M
 FDDA==
X-Gm-Message-State: AOAM531OjDtKSUbg3ApqksTqHDJc6uV+7KPOkBf2DB6DjmDuLO5aFP7z
 7utGqlhzevp7L9oAitVmUzAdi5Sch2sV7A==
X-Google-Smtp-Source: ABdhPJwv7XiOr4lSlyG1Az+mL9QPsfrey+uQxjJfS2mlrdX8atGubZLnCaFqGVNQ1bg0t/LubuWvNw==
X-Received: by 2002:a17:902:9b94:b0:156:2c08:14a5 with SMTP id
 y20-20020a1709029b9400b001562c0814a5mr23905606plp.60.1650990671653; 
 Tue, 26 Apr 2022 09:31:11 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/47] target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
Date: Tue, 26 Apr 2022 09:30:25 -0700
Message-Id: <20220426163043.100432-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/arm/translate.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 223fd5fdfe..cc540f2b47 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5652,14 +5652,11 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
 
 static bool trans_MOVW(DisasContext *s, arg_MOVW *a)
 {
-    TCGv_i32 tmp;
-
     if (!ENABLE_ARCH_6T2) {
         return false;
     }
 
-    tmp = tcg_const_i32(a->imm);
-    store_reg(s, a->rd, tmp);
+    store_reg(s, a->rd, tcg_constant_i32(a->imm));
     return true;
 }
 
@@ -6030,14 +6027,13 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
     tcg_gen_mulu2_i32(t0, t1, t0, t1);
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     t2 = load_reg(s, a->ra);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
     t2 = load_reg(s, a->rd);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(zero);
     store_reg(s, a->ra, t0);
     store_reg(s, a->rd, t1);
     return true;
@@ -6284,14 +6280,13 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     default:
         g_assert_not_reached();
     }
-    t3 = tcg_const_i32(1 << sz);
+    t3 = tcg_constant_i32(1 << sz);
     if (c) {
         gen_helper_crc32c(t1, t1, t2, t3);
     } else {
         gen_helper_crc32(t1, t1, t2, t3);
     }
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     store_reg(s, a->rd, t1);
     return true;
 }
-- 
2.34.1


