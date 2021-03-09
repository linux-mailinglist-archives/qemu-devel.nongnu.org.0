Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B72332E1D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:21:04 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgyd-0006jd-8Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7G-0007tJ-I5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:50 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6w-0002Y3-Uo
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:50 -0500
Received: by mail-oi1-x22a.google.com with SMTP id f3so15494070oiw.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSMseqklTx5XGInPbltkyfVEXNwiNbXjqnPSDdzuxDo=;
 b=TgkozMefSqZ+GhCKjKxmVoP9sOUMytnoBHBk/KDSlyJkdrpzRzuOsFikQ7Mr/W2L5U
 i7IbZqO8JdRo0wjfRW+KyVzEjfncqLuYrZ68wobXnsieO/A2NjI6iFztm2sAvDVhc8sJ
 FSx19wYUT5S5sCRywRWDdTxxzto2ANfYokd/WbNRE4139+pew7sO/f1IwCtdwppFXgxS
 ZmSTgUVDaJy1p0LpxazzvSR4LLl1mHO9gcNrYb6EC+R6WTw1qv1tq+H6XiA/+jT5UrDa
 OR9NUvemvTRTBzHwrX9RuHxcRO1VKLLfOz1ookGatjPUQNiEs1QzUCpNgvLnGD3eSMs3
 vncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSMseqklTx5XGInPbltkyfVEXNwiNbXjqnPSDdzuxDo=;
 b=EJ6kr4rjWpkJiWhRvPKx0Dhvm0ceN26XYbC2TNx+zg2zx3pH/qHW/PguogDaEkg+Vu
 nBDjrXZ4kmaGMu/4VqwQiHOQlf8dHN9gBB70uWPmyGQKkRL09HEtXDzvREuWx0eeg/Rp
 Bx2iDP+8mMXW55piei9yymk5uuqomJ7B6dn4fNt+dV6+P3BNkt9nf/iz5QgznjQA720V
 SQHClp043+OAzIebCaFrdFE7KBhsM1nMKyxJnSubpxuy0dG8TZhiAgrHZhjMh9ld7Vhk
 lYgSHaYlL0B6vqXhorxWCwSiA1kHtPSd9JmcStNnwoCOs6EPu3mYWECs5sjYSDI22DsA
 bZfQ==
X-Gm-Message-State: AOAM532YXVpa0sAovQfJVYVV/3OprvszpN5P48PqPNpj6qNuSkvsAXK2
 7P9vIFiG/3+LEX6R2gVPeBfOcTIPwEHxZNPe
X-Google-Smtp-Source: ABdhPJx7PjRedCAxtUf0qoH220oGFzzmeCe8f+lSjxtuUQB5xdsR1VLUvWv6hWHQwQtmjhf8V903HA==
X-Received: by 2002:a54:488b:: with SMTP id r11mr3637344oic.166.1615306884402; 
 Tue, 09 Mar 2021 08:21:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/78] target/arm: Implement SVE2 integer multiply-add long
Date: Tue,  9 Mar 2021 08:19:59 -0800
Message-Id: <20210309162041.23124-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
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
index bd7332be43..61903cded6 100644
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
index f6eea9554b..c112548db4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7581,3 +7581,79 @@ static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
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


