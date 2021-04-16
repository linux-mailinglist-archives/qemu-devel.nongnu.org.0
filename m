Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BE362A8D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:46:44 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWIV-0000cN-Aq
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcm-0004wl-Uh
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcV-0001Ko-6P
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:33 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q14-20020a17090a430eb02901503aaee02bso4204519pjg.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJ0tUraTJVmXKzlkMts/F1yRCYj8V5rL50FUHOT1wnQ=;
 b=htqssexTKoC13nx8EVJXjOQbQbIfLR0RxK3Af+UynlXWByHg+MocJDMq/FUrrbv3PF
 v2e0bDs9Q27r7V3Na8B5mlPavJe8wHk/zkcoy1AIGLKROdwCxtP87w9tFby2/LvAf9mU
 jjANbCFPXfDHCKKgopIRPtSlkyofbZmmD67dfVz4ZOmHYd3A+1E8N4mqzkHzfDdHnEQ2
 reS8IO5HmkUXLndUVNqKGWk9HEJtgngfwDye/xnxKHdgPO2SnFcHgjaNoJBX3Cs82eke
 vfRhGOTjsn6WS60tAZzFh8lZQMJvzbUrs3C5bYo0x1KsBf67qxtC2UjC2BhYM7tFIgWx
 xHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJ0tUraTJVmXKzlkMts/F1yRCYj8V5rL50FUHOT1wnQ=;
 b=Lyt6yubtqI1o5QhUbvHtc7lPSgFwM7EQPWVGBBZ7RdAMZKAxRgdxcurKy0FfpHbVqk
 EtcIQP6hs2sw8kJ5EXCAtxwTEgPzrsv6AIanvq4tfwrg574DOEYa7gxGRz8lZycVb7dk
 iysTkjjxKRAX7AvurAD221PuPqghXmnjCHHCFvSOkqZera0AOOQAipM3yjxm5Sj9wsiu
 LVUSzMiRYq33+9paYvTPRzXzb4cYUpa8W9Ovze3wESxETo17xGXFJea2qMNv7kXAJnW1
 3es/nsnJiPi+O2jlZyTZ1H7gAUTxwil6bzx4/aPASrsIJg1hEzfrNw2iDC8vEj6veq+q
 u6tg==
X-Gm-Message-State: AOAM533QKYJ/MZr+FvcQpirm12qz4cLFmwJt1ezhMyFi9kCyuxxrMhWR
 pU2k89+iullYl0cSxBuJMuBVmkqHh3hNjQ==
X-Google-Smtp-Source: ABdhPJyFFXU11jgaseXE0LjXyWBF/DDykC4cO1zkFejNQw6bzJOqPb6jETGaNmc9ateh3wHtzPjQHg==
X-Received: by 2002:a17:902:cec3:b029:eb:5441:9897 with SMTP id
 d3-20020a170902cec3b02900eb54419897mr11173730plg.48.1618606997816; 
 Fri, 16 Apr 2021 14:03:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/81] target/arm: Implement SVE2 integer multiply-add long
Date: Fri, 16 Apr 2021 14:01:55 -0700
Message-Id: <20210416210240.1591291-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 target/arm/helper-sve.h    | 28 ++++++++++++++
 target/arm/sve.decode      | 11 ++++++
 target/arm/sve_helper.c    | 18 +++++++++
 target/arm/translate-sve.c | 76 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d8f390617c..457a421455 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2573,3 +2573,31 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8308c9238a..b28b50e05c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1351,3 +1351,14 @@ SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
 
 SQRDMLAH_zzzz   01000100 .. 0 ..... 01110 0 ..... .....  @rda_rn_rm
 SQRDMLSH_zzzz   01000100 .. 0 ..... 01110 1 ..... .....  @rda_rn_rm
+
+## SVE2 integer multiply-add long
+
+SMLALB_zzzw     01000100 .. 0 ..... 010 000 ..... .....  @rda_rn_rm
+SMLALT_zzzw     01000100 .. 0 ..... 010 001 ..... .....  @rda_rn_rm
+UMLALB_zzzw     01000100 .. 0 ..... 010 010 ..... .....  @rda_rn_rm
+UMLALT_zzzw     01000100 .. 0 ..... 010 011 ..... .....  @rda_rn_rm
+SMLSLB_zzzw     01000100 .. 0 ..... 010 100 ..... .....  @rda_rn_rm
+SMLSLT_zzzw     01000100 .. 0 ..... 010 101 ..... .....  @rda_rn_rm
+UMLSLB_zzzw     01000100 .. 0 ..... 010 110 ..... .....  @rda_rn_rm
+UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 859091b7cf..8b86e7ecd6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1308,6 +1308,24 @@ DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZW_ACC(sve2_smlal_zzzw_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZW_ACC(sve2_smlal_zzzw_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZW_ACC(sve2_smlal_zzzw_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZW_ACC(sve2_umlal_zzzw_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZW_ACC(sve2_umlal_zzzw_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZW_ACC(sve2_umlal_zzzw_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+#define DO_NMUL(N, M)  -(N * M)
+
+DO_ZZZW_ACC(sve2_smlsl_zzzw_h, int16_t, int8_t, H1_2, H1, DO_NMUL)
+DO_ZZZW_ACC(sve2_smlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2, DO_NMUL)
+DO_ZZZW_ACC(sve2_smlsl_zzzw_d, int64_t, int32_t,     , H1_4, DO_NMUL)
+
+DO_ZZZW_ACC(sve2_umlsl_zzzw_h, uint16_t, uint8_t, H1_2, H1, DO_NMUL)
+DO_ZZZW_ACC(sve2_umlsl_zzzw_s, uint32_t, uint16_t, H1_4, H1_2, DO_NMUL)
+DO_ZZZW_ACC(sve2_umlsl_zzzw_d, uint64_t, uint32_t,     , H1_4, DO_NMUL)
+
 #undef DO_ZZZW_ACC
 
 #define DO_XTNB(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4326b597e6..0fdfd1e9e0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7580,3 +7580,79 @@ static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
     };
     return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
 }
+
+static bool do_smlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_smlal_zzzw_h,
+        gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_SMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlal_zzzw(s, a, false);
+}
+
+static bool trans_SMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlal_zzzw(s, a, true);
+}
+
+static bool do_umlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_umlal_zzzw_h,
+        gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_UMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlal_zzzw(s, a, false);
+}
+
+static bool trans_UMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlal_zzzw(s, a, true);
+}
+
+static bool do_smlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_smlsl_zzzw_h,
+        gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_SMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlsl_zzzw(s, a, false);
+}
+
+static bool trans_SMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlsl_zzzw(s, a, true);
+}
+
+static bool do_umlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_umlsl_zzzw_h,
+        gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_UMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlsl_zzzw(s, a, false);
+}
+
+static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlsl_zzzw(s, a, true);
+}
-- 
2.25.1


