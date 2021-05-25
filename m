Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977639056B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:28:12 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYyZ-0003BN-5V
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbN-00033g-R7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbF-0004Lt-Hj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id b7so16343036wmh.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5ZWeQI7S2+0WumdBa/2LByr5UL+Idb9qOyu1ErxUk/o=;
 b=gLQUVUd1lEwyRIEaXXqJPgVOxDe4Q24e3HOs0FxkO4nprjtCOSxnBk8mQ53XVuJari
 CRklM8/kvqfmyLtyePeOXGlIzMv9N90PoNM08jFb5hTp+Rz4UlPMcZmLtvGGUmiRA2KT
 4cld2HBz5j1lT7U5jNfwrhIn3qszVLpP8T6DKtZvyw0VBoRsvgeZhbJ6Ty3/09zfiDml
 gY0b2Es+va44Ob3v/KbIPB0j29Mxyf5cOZouh1k/2eR4pCKSPDo2RevXgL/FRqutFgs2
 sYaOzrF9aabtah85OQdZKYZIgrUt1K+v3a22+1Ag8HLjoTV4F4OFzq281wxa8FmfmwUo
 VOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ZWeQI7S2+0WumdBa/2LByr5UL+Idb9qOyu1ErxUk/o=;
 b=bbf43h0LQBCL+FCYA7kau0JAT7VSqdiKZhK7EFkCoGYaNcDH2DrYsJTAtukxIqtmsM
 ZuJbAzdewuSJP3NOenrYX4yaxg+t858zo5czVw+a32/BCtYxZG2FiQtBqpZ0jgR0gjjl
 AGYsBlJ9XSjHGM9f3phjZ4Hwxe23+mZhRkUspve5p9Jc5TDp0MmLK3EoDttmjFO42h8j
 zWI2cf3zAtE8ciqjCcism6DVzVjnoLZkdXhRQ29CGZByhg8V+ZYjYBdizuO0uG5z4o91
 vUJV7eXroFVMkCK7QRB5513JalzTEtSTDHC18ZVf0qkiOVpny4kLwaaIyJY30g/Es2T+
 DEcg==
X-Gm-Message-State: AOAM532Bqo8KTYBRRlT4wN7LQiuvXlHKZGZoGjLBk2hoQbdN8XRapuY/
 rPxzz+acJmn4oZXLvNmf/vQmJW7MHxl9Bsyn
X-Google-Smtp-Source: ABdhPJzfnX2zeKdVmk5+7ssUz6ZRV7PNq5nx2MXo8ixr7NNQWrAZo9YuRoIDoX5pICB6uZ0iXCCEDA==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr4295844wmj.44.1621955042259; 
 Tue, 25 May 2021 08:04:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 040/114] target/arm: Implement SVE2 complex integer add
Date: Tue, 25 May 2021 16:02:10 +0100
Message-Id: <20210525150324.32370-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 10 +++++++++
 target/arm/sve.decode      |  9 ++++++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4861481fe0a..c2155cc5444 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2392,3 +2392,13 @@ DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_bgrp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_cadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_cadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7cb89a0d47e..7508b901d03 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1226,3 +1226,12 @@ EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
 BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
 BDEP            01000101 .. 0 ..... 1011 01 ..... .....  @rd_rn_rm
 BGRP            01000101 .. 0 ..... 1011 10 ..... .....  @rd_rn_rm
+
+#### SVE2 Accumulate
+
+## SVE2 complex integer add
+
+CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
+CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
+SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
+SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3cb256e4a56..9015e68cb8b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1319,6 +1319,48 @@ DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
 
 #undef DO_BITPERM
 
+#define DO_CADD(NAME, TYPE, H, ADD_OP, SUB_OP)                  \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    int sub_r = simd_data(desc);                                \
+    if (sub_r) {                                                \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = ADD_OP(acc_r, el2_i);                       \
+            acc_i = SUB_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    } else {                                                    \
+        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
+            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
+            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
+            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
+            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
+            acc_r = SUB_OP(acc_r, el2_i);                       \
+            acc_i = ADD_OP(acc_i, el2_r);                       \
+            *(TYPE *)(vd + H(i)) = acc_r;                       \
+            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
+        }                                                       \
+    }                                                           \
+}
+
+DO_CADD(sve2_cadd_b, int8_t, H1, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_h, int16_t, H1_2, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_s, int32_t, H1_4, DO_ADD, DO_SUB)
+DO_CADD(sve2_cadd_d, int64_t,     , DO_ADD, DO_SUB)
+
+DO_CADD(sve2_sqcadd_b, int8_t, H1, DO_SQADD_B, DO_SQSUB_B)
+DO_CADD(sve2_sqcadd_h, int16_t, H1_2, DO_SQADD_H, DO_SQSUB_H)
+DO_CADD(sve2_sqcadd_s, int32_t, H1_4, DO_SQADD_S, DO_SQSUB_S)
+DO_CADD(sve2_sqcadd_d, int64_t,     , do_sqadd_d, do_sqsub_d)
+
+#undef DO_CADD
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ea42758fc5..27eb6f32333 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6285,3 +6285,34 @@ static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
     }
     return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
 }
+
+static bool do_cadd(DisasContext *s, arg_rrr_esz *a, bool sq, bool rot)
+{
+    static gen_helper_gvec_3 * const fns[2][4] = {
+        { gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
+          gen_helper_sve2_cadd_s, gen_helper_sve2_cadd_d },
+        { gen_helper_sve2_sqcadd_b, gen_helper_sve2_sqcadd_h,
+          gen_helper_sve2_sqcadd_s, gen_helper_sve2_sqcadd_d },
+    };
+    return do_sve2_zzw_ool(s, a, fns[sq][a->esz], rot);
+}
+
+static bool trans_CADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, false);
+}
+
+static bool trans_CADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, false, true);
+}
+
+static bool trans_SQCADD_rot90(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, false);
+}
+
+static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_cadd(s, a, true, true);
+}
-- 
2.20.1


