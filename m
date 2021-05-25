Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4B390582
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:32:39 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZ2s-00058x-Qe
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbJ-0002lr-4K
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb7-0004Iq-6u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p7so28889287wru.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=slO6fGayTWYAm0xaJSLlUgOe2jJeqXuq0W3arxftcWw=;
 b=oCEL+6yAcjUbn8SDx5D+Jy8+wEpCDAYKXARoewCe1nQO0PGbZ7YWONZpAYQXoL8n9r
 OclKEGpxD/zTyO+IkDReNuzeRe+1TLHRh/gGgUgAOjEhTFK2y3BMscp52TSDNba2CGXu
 OXDkB56E8cLL6rvihiImVAwUSIKdUgMIg6ZDIDWwkANNaPLVgJ+aE/Ey/uFOTLrRE4Nu
 18eiVsfJd3qoWmpZmmjy7UEYmcWJcRl11IQFkHelyuAQadxy/OWsaAImNIAiCJ9LpP0X
 Pz587rT8JtxwhQ0bcv+5lWG0K49PPMPcWuCgXiVQZqPfSTfIJLeTp9W7r7s7lGmxNrio
 oa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slO6fGayTWYAm0xaJSLlUgOe2jJeqXuq0W3arxftcWw=;
 b=gDFxzTWsTpVDIRAn7LBCeOqxo5byzz0DFgac2fU+kxXj3uj/+z7smSOztuCqUIYK86
 GgZPq7qYUwkmrrPRYTrAeeZGaySfLUvabaMGGkgjlrS6zMSI8cV/7mdMEDAzLUsz6pij
 MxFmRgwTac4O/6an4xD4mAmG0pyDc2ip6BZIog5691U8f8Rsaku9DEhLyD1/DrgTqIKQ
 HecTx2F48pEcCpzIeOTqi5bB4cuz/bWyrks5DUtFuJm0HXw9F+2TkUxMxBL66La3/NnL
 4aI+BeMz68c6aUp6/u8EEl4L+dVGu+rNMscvPZ1xQkoA2xih3d/AkV/Pwm2YsHajCCLV
 g6tA==
X-Gm-Message-State: AOAM5304A5FJXO1XqYJI+E1eHw2/9lNWh9Gwum+Qi+e7etDGjdAY9+rn
 7SzO1pBmwEwXWccVwwJjbZdJ14lpbMi7ofDr
X-Google-Smtp-Source: ABdhPJzqu6Z0MD26EwqALXAaAXRjruFx9lrE26h244zPqv/USgn7IsJByxGP/5Fzbuec3h042a/5iA==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr27904171wrp.152.1621955033713; 
 Tue, 25 May 2021 08:03:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 029/114] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
Date: Tue, 25 May 2021 16:01:59 +0100
Message-Id: <20210525150324.32370-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-id: 20210525010358.152808-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 62106c74be2..5fdc0d223ab 100644
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
index 93f2479693f..58c3f7ede40 100644
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
index 17c6440b06e..f30af5596c3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -648,6 +648,45 @@ DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
 #undef do_uqrshl_d
 
+#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
+#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
+
+DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)
+
+DO_ZPZZ(sve2_uhadd_zpzz_b, uint8_t, H1, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_h, uint16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_s, uint32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_uhadd_zpzz_d, uint64_t, DO_HADD_D)
+
+#define DO_RHADD_BHS(n, m)  (((int64_t)n + m + 1) >> 1)
+#define DO_RHADD_D(n, m)    ((n >> 1) + (m >> 1) + ((n | m) & 1))
+
+DO_ZPZZ(sve2_srhadd_zpzz_b, int8_t, H1, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_h, int16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_s, int32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_srhadd_zpzz_d, int64_t, DO_RHADD_D)
+
+DO_ZPZZ(sve2_urhadd_zpzz_b, uint8_t, H1, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_h, uint16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_s, uint32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_urhadd_zpzz_d, uint64_t, DO_RHADD_D)
+
+#define DO_HSUB_BHS(n, m)  (((int64_t)n - m) >> 1)
+#define DO_HSUB_D(n, m)    ((n >> 1) - (m >> 1) - (~n & m & 1))
+
+DO_ZPZZ(sve2_shsub_zpzz_b, int8_t, H1, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_h, int16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_s, int32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_shsub_zpzz_d, int64_t, DO_HSUB_D)
+
+DO_ZPZZ(sve2_uhsub_zpzz_b, uint8_t, H1, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6c1561d897c..43690999abc 100644
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
2.20.1


