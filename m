Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5A332DAD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:58:24 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgch-000311-DG
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7W-000088-Vl
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:07 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7R-0002jl-T8
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:06 -0500
Received: by mail-oi1-x231.google.com with SMTP id y131so12657590oia.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hd9WE+PagjBcQKfB5basSfMLdVZ3AAupsplglzUvPSg=;
 b=wkzuxtEK7luGbXzArxop8L2YAqXPwJj30XO+XdjUasAVq9Zq8zR2CA4DrYaD30uRSP
 /6BhRwl68BcM+mA+zgQL89lAZG8BZcCbhKN+ZXCrxrioWFf9aXZTxqiJw5EXSO7WZCi1
 BABFSH+NxZVpaUW+vOPXSF5O9T6EaSdYjK51VyApJFGenlPK6iTnFkRYl4n6s/FDyxRf
 a426mkfwpVG91J8VLa+VxyYTVhRHP1nSfkY9EaXt9suUBOBf9iqImbuT3Lzc+Z3zFAVR
 H+sMeYAOXlBBzAP7FF62YFG8Bq2Ker/ip1zqKTjNX+adHOfeYmX0PZ4Pva3gLcktA8qC
 Y7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd9WE+PagjBcQKfB5basSfMLdVZ3AAupsplglzUvPSg=;
 b=B8Fh8tL+NV2hox8OGKqvWvaja0zGUoOEyN+/JkSdz779vQVfIqUdZJvJ9eWdao0K4I
 og/r6U0cZPhZMlzLKY5j8nFJS4ExePeyRZkaKG6GeZtKggUFISlmzU4rcsCJ/Tfi5uP0
 1GaWwflYBdsZV5qn4RyibQZtR1PPVsk+m+LrPKkLiVaUOtQRFy3/BScbmMq1MErEt+/X
 DiwMojj1qVSmgLfzRCoUy8WXA1Z9kxdw7A4HtCpQ+kuPSfsX7IJiVQUaeVef3bPHJ5UX
 lY17mKGtrsmKE+Um3YUnsA/VcAX9+8BoCdH71miB9Fu9SI6WTKoP2zQQtcwOHXQ6kHOQ
 gFrQ==
X-Gm-Message-State: AOAM531EO7qSVHTdCGfXZly7z5dUvdqFyWSjyHo0t1TJJIBPd/n1B9Jh
 uaqAkfDmMCtHwfHbY3VQ3QsDIitb3IaZZnjT
X-Google-Smtp-Source: ABdhPJyhedfI1u8qz1vMPV7oxDJsCG/XPhtEkCDvUhxt44uzuflkirDrBl+EjW1CfQvWcQJX3cD+tg==
X-Received: by 2002:a05:6808:148a:: with SMTP id
 e10mr3145299oiw.138.1615306920747; 
 Tue, 09 Mar 2021 08:22:00 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/78] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
Date: Tue,  9 Mar 2021 08:20:04 -0800
Message-Id: <20210309162041.23124-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

This completes the section 'SVE2 integer add/subtract narrow high part'

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3642e7c820..98e6b57e38 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2533,6 +2533,14 @@ DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c68bfcf6ed..388bf92acf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1328,6 +1328,8 @@ RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
 SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
+RSUBHNB         01000101 .. 1 ..... 011 110 ..... .....  @rd_rn_rm
+RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 229dde282e..860ab564cd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2137,6 +2137,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 #define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
+#define DO_RSUBHN(N, M, SH) ((N - M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2162,6 +2163,15 @@ DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
 
+DO_BINOPNB(sve2_rsubhnb_h, uint16_t, uint8_t, 8, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_s, uint32_t, uint16_t, 16, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_d, uint64_t, uint32_t, 32, DO_RSUBHN)
+
+DO_BINOPNT(sve2_rsubhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RSUBHN)
+
+#undef DO_RSUBHN
 #undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 792ec38cb0..08622432bd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7480,6 +7480,8 @@ DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
 DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
+DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1


