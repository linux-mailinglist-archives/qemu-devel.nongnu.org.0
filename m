Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384245104B2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:55:16 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOT5-0007oA-BI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035a-6Z
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5m-0003sx-RF
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j17so18443072pfi.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wz/sQ3opM+63UBKCObMqywBPZke4KVXsahzdcx00DUk=;
 b=Y9lEghH8yifuMykg/i4TZSaD8tQWOqq6PSAVXLaLfaqfjKmhaQMlTdmzTbxv5nwEao
 nl3s40rkL2hZFJSPu+ji5EtzMb7cUfxkvTAXRm8io02wnNOdGYn/XBQG0ja22Wr5oJQu
 blqprpnz3g8A4aImSWl+3QyAg2ic/yErkmZUK8PmoOpwXk0kVc8E2Qg8kwr3ZEbtmtoN
 2EbScE0ZttHOPaDS8/ztLumLkjLa+8ET5dF56v6QGPm+fPSrky+NsRH1TwHNjL4pU/Mm
 YygR1MeiA8gDhcerzbNE+Oa9NkpizT89Zxw3ZxASMUD9UAc040HtI4Z5ILIDINvrI13p
 5PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wz/sQ3opM+63UBKCObMqywBPZke4KVXsahzdcx00DUk=;
 b=R2FIl95QYxfViFJ/+OKHWgU1aUfkW/zZhL0HVeARUsH09hrvPGo4c6jNcZpGwPR81N
 faqFNLEtD6reVYImVGFTRImluBL3tOjkcNTrWkXAOm5vI2b5O3jpoj8umvmFXj9pjaNk
 3UkMRZTb8tmLnCyGaro0HMr6GcL8kRXWDCuWyxNFpAlUAhFL/7GVr4ITVaI/lZyJ4ToV
 5Cy8sh6bQ51kO6U8DN5cacekLA6sJtkaz8gC9FyBqW1Re51Df04efRw6e8ZfNQ605hvM
 iNX68YOTBL1UFTddZUE6F4PEKg8QSZbsubQovSHgHdus3E4j6cwbc9gH2jQOgQjDZ+NX
 F1hA==
X-Gm-Message-State: AOAM530xqvSs6IZwKqCm3kRsuF03+oibFOHU83sRW++g3tiCF4pLapYa
 cYJ8sPW5VTbISb7qc6zPFDwmMLn1T0kE9g==
X-Google-Smtp-Source: ABdhPJxq1g9xHlP+en+dGDqjzdtjO5ubVZFoxKH2PvKG99SERR/T0UDyBIhs/PlTPk7caNSVSyMyIw==
X-Received: by 2002:a63:cf0c:0:b0:380:fb66:fa2a with SMTP id
 j12-20020a63cf0c000000b00380fb66fa2amr20486873pgg.273.1650990668680; 
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/47] target/arm: Use tcg_constant for vector shift expanders
Date: Tue, 26 Apr 2022 09:30:21 -0700
Message-Id: <20220426163043.100432-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2e4165be3d..9539d2e8ca 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2996,9 +2996,8 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
-        TCGv_vec zero = tcg_const_zeros_vec_matching(d);                \
+        TCGv_vec zero = tcg_constant_vec_matching(d, vece, 0);          \
         tcg_gen_cmp_vec(COND, vece, d, a, zero);                        \
-        tcg_temp_free_vec(zero);                                        \
     }                                                                   \
     void gen_gvec_##NAME##0(unsigned vece, uint32_t d, uint32_t m,      \
                             uint32_t opr_sz, uint32_t max_sz)           \
@@ -3988,8 +3987,8 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(32);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(32);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4007,8 +4006,6 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4017,8 +4014,8 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(64);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(64);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4036,8 +4033,6 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
@@ -4132,8 +4127,8 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(31);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(31);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4152,8 +4147,6 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4162,8 +4155,8 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(63);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(63);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4182,8 +4175,6 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
-- 
2.34.1


