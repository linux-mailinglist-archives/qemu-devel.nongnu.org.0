Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FB37022C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:37:12 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZss-0002lg-Ob
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZii-00008m-2V
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiS-00065q-Vw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id b15so5008792pfl.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1T/TF/O8cuPuJru/dQDvvvNN7AjjLNborpcatweuNPQ=;
 b=S59PrQZQSC77IZgLEIpErMEf0MkIrdaF3uE0u9P5yqJgKeFariqFO+1+AcfE/WVxkQ
 EsrkpDNw8J0XtT/a4u5FcVxGydOt/fuoFG0lWo+kyeBbA4awACs0tZfqRpsAQIg7CAkm
 zMoIn/9skax9d+rRXTG3KVuOtvVHnpm9ZWdHtacz57iKnnIKytWPVqreQeoU/1QlTtXI
 bMO4Z0SQ5vn9rK/lVR6nwfLoL6EqNyEtLGlsU71OhzNb03lr+LjBBz/d31JmSpwe7nAS
 blHZ9C6Tcz98Ae9SnD9cs3i6XyMb40HVf/eO7hM1Wga7auIJEbzvsNpfq+aoVyEy2/7b
 Ho5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1T/TF/O8cuPuJru/dQDvvvNN7AjjLNborpcatweuNPQ=;
 b=Xxw8qy6y+SmeFM3x/5QXLd1n0Uq4q3GPUSX76eh1+Ii717bEGu3VCnFuSAbqH9mDJ7
 9XaZzjpGAc6/6g3fWrgQZ8wL8IofMKvcbUktxlJ0sDS2uPcDRkkfGl/JrGeDjFeWOeZH
 KJaxqkneYDttEtJ3ZUeoWSnDG84Zy3tZtXb1EKPw+XSNUJXaKTrvL4H4iqPL2JH3rCSl
 8cW1y2dZd/OXOjOYu1PWgLnaUNfejvqtUfGYCMEXSHniO/cafWrwFhYwje8Cb6SjT7k/
 HwIznwWdFPL4W9a8ikeLUYSov31yFFjEBxDCrHAvLgANJaVL1EEPDdBBvkT5y6H8pc40
 whLQ==
X-Gm-Message-State: AOAM530xLMDCQUxoS6F+cw5Os6PBy9LIzuKPGUBFOiBTYYhXjn0yDY8k
 6CHKQrwE0+LtHcZzc9YT/yyiWqRdjVF5RA==
X-Google-Smtp-Source: ABdhPJz7+AyGsWtQ3wdCacCSmh/W/X6ppdRt6rqp5agAX65bPkut0rZGOqUo2BTKezudtoW/QXxhFw==
X-Received: by 2002:a05:6a00:a95:b029:25c:eb77:723a with SMTP id
 b21-20020a056a000a95b029025ceb77723amr6410804pfl.23.1619814383527; 
 Fri, 30 Apr 2021 13:26:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/82] target/arm: Implement SVE2 integer add/subtract long
 with carry
Date: Fri, 30 Apr 2021 13:25:08 -0700
Message-Id: <20210430202610.1136687-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sel indexing and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve.decode      |  6 ++++++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 229fb396b2..4a62012850 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2416,3 +2416,6 @@ DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_adcl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_adcl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 56b7353bfa..79046d81e3 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1247,3 +1247,9 @@ SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
 SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
 UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
 UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
+
+## SVE2 integer add/subtract long with carry
+
+# ADC and SBC decoded via size in helper dispatch.
+ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
+ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4871e90d9b..0049ad861f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1264,6 +1264,40 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZW_ACC
 
+void HELPER(sve2_adcl_s)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = H4(extract32(desc, SIMD_DATA_SHIFT, 1));
+    uint32_t inv = -extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t *a = va, *n = vn;
+    uint64_t *d = vd, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint32_t e1 = a[2 * i + H4(0)];
+        uint32_t e2 = n[2 * i + sel] ^ inv;
+        uint64_t c = extract64(m[i], 32, 1);
+        /* Compute and store the entire 33-bit result at once. */
+        d[i] = c + e1 + e2;
+    }
+}
+
+void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        Int128 e1 = int128_make64(a[i]);
+        Int128 e2 = int128_make64(n[i + sel] ^ inv);
+        Int128 c = int128_make64(m[i + 1] & 1);
+        Int128 r = int128_add(int128_add(e1, e2), c);
+        d[i + 0] = int128_getlo(r);
+        d[i + 1] = int128_gethi(r);
+    }
+}
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6ac50fd61f..6f5e39b741 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6371,3 +6371,26 @@ static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_abal(s, a, true, true);
 }
+
+static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2] = {
+        gen_helper_sve2_adcl_s,
+        gen_helper_sve2_adcl_d,
+    };
+    /*
+     * Note that in this case the ESZ field encodes both size and sign.
+     * Split out 'subtract' into bit 1 of the data field for the helper.
+     */
+    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+}
+
+static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, false);
+}
+
+static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, true);
+}
-- 
2.25.1


