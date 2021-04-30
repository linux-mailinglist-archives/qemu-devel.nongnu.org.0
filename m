Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73418370220
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:36:34 +0200 (CEST)
Received: from localhost ([::1]:50760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZsH-0002Qj-CT
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiQ-0008G5-Qx
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:22 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiL-0005wD-0k
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2363597pjh.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fGS2Fo4Z7uDA+2XxvFopAIhWZ1dSlmsnRxCQI2Tn/s=;
 b=AkAo7J7VLDa9cbE2lZulVNBdrMvYaz1gCtFQkqoYhIEryX/Pqrx9jzquXJ5e+QRp5L
 p7B/GSeBRDkiYtnLxOSkSRB7GhOGcH0kuKaqG5gL58VOExui3FE7fyG0Z3Dz2inkukGU
 sB06QJQ2UH0ccZCDHXw+GvM7+UFZDLUYdbgEbugeUR+wG+I01WNTkTP8NuQdcWLEu6A1
 x7DyxyRZ7spR4c5k2rRpte2kaCDUe0fHJybutzyTD0xHwU+yKdYo2y4rC+goaWQH/N+9
 xZq9l6bbV3dA3n0WkkEvamL2J87Rd/58G3HTBA20B+dknb25OudwQsUN/ZuEtU51cmQx
 Xaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fGS2Fo4Z7uDA+2XxvFopAIhWZ1dSlmsnRxCQI2Tn/s=;
 b=XOUw+vdKUW27dXmOrF0VslrCKq6vM14kYPwb4Ed2bTHzeRHIBnwI0qD+xSNoDukIpn
 gBwRox/mjuBcvJvwL+4jTzRXlc7XMRwbTBEXwMvTy4F0wibKOEJnyj5Aqm2h1Kbb8ODp
 JjAx95Eou8OYpJDaNFzMxlY71u9xt2xpQugvXnCo7wVU2vM/eXcb18jlUIacBiJ1sjEA
 4MYi+sVyCZwOyoR087qN352LsZ0e6pi5D6bJB9OdMtcJtN4bZ7jtSRM/5ruC6/+5XdEy
 0zrAVziGdI5hGVi3HqabyZMF0I7pFUOSxsskqKMd1xKMnsKjkoeUlkP0L1e1AfMzfozL
 MGWw==
X-Gm-Message-State: AOAM53289nV4UEkqp+xL9FCHwzYcv04yFvGXc6/wQrGa4LcvfOHvBdNO
 1rqwpT5wg3e88Y7lHmI1zwTR8wARN1gyMg==
X-Google-Smtp-Source: ABdhPJxo+azAAJYwM5vp3IxeN+XHCBVz8mGTOLE36I+qORRErMQSQeQig4nX/RonBgx6e+U0czo4CA==
X-Received: by 2002:a17:90b:294:: with SMTP id
 az20mr17142766pjb.229.1619814375598; 
 Fri, 30 Apr 2021 13:26:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/82] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
Date: Fri, 30 Apr 2021 13:24:55 -0700
Message-Id: <20210430202610.1136687-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 62106c74be..5fdc0d223a 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -226,6 +226,60 @@ DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 93f2479693..58c3f7ede4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1129,3 +1129,14 @@ SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
 UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
 SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
 UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
+
+### SVE2 integer halving add/subtract (predicated)
+
+SHADD           01000100 .. 010 000 100 ... ..... .....  @rdn_pg_rm
+UHADD           01000100 .. 010 001 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 010 100 ... ..... .....  @rdn_pg_rm
+UHSUB           01000100 .. 010 011 100 ... ..... .....  @rdn_pg_rm
+SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
+URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
+UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7eff204c3b..3703b96eb4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
+#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
+
+DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)
+
+DO_ZPZZ(sve2_uhadd_zpzz_b, uint8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_h, uint16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_s, uint32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_uhadd_zpzz_d, uint64_t, DO_HADD_D)
+
+#define DO_RHADD_BHS(n, m)  (((int64_t)n + m + 1) >> 1)
+#define DO_RHADD_D(n, m)    ((n >> 1) + (m >> 1) + ((n | m) & 1))
+
+DO_ZPZZ(sve2_srhadd_zpzz_b, int8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_h, int16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_s, int32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_srhadd_zpzz_d, int64_t, DO_RHADD_D)
+
+DO_ZPZZ(sve2_urhadd_zpzz_b, uint8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_h, uint16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_s, uint32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_urhadd_zpzz_d, uint64_t, DO_RHADD_D)
+
+#define DO_HSUB_BHS(n, m)  (((int64_t)n - m) >> 1)
+#define DO_HSUB_D(n, m)    ((n >> 1) - (m >> 1) - (~n & m & 1))
+
+DO_ZPZZ(sve2_shsub_zpzz_b, int8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_h, int16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_s, int32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_shsub_zpzz_d, int64_t, DO_HSUB_D)
+
+DO_ZPZZ(sve2_uhsub_zpzz_b, uint8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6c1561d897..43690999ab 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5949,3 +5949,11 @@ DO_SVE2_ZPZZ(SRSHL, srshl)
 DO_SVE2_ZPZZ(UQSHL, uqshl)
 DO_SVE2_ZPZZ(UQRSHL, uqrshl)
 DO_SVE2_ZPZZ(URSHL, urshl)
+
+DO_SVE2_ZPZZ(SHADD, shadd)
+DO_SVE2_ZPZZ(SRHADD, srhadd)
+DO_SVE2_ZPZZ(SHSUB, shsub)
+
+DO_SVE2_ZPZZ(UHADD, uhadd)
+DO_SVE2_ZPZZ(URHADD, urhadd)
+DO_SVE2_ZPZZ(UHSUB, uhsub)
-- 
2.25.1


