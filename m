Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A43A5E81
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:43:09 +0200 (CEST)
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiBY-00028M-7u
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6h-000249-Bn
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:07 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6d-0003Tx-MD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:07 -0400
Received: by mail-pf1-x431.google.com with SMTP id s14so10005628pfd.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iqNyuQcVQISsWNDc33MXpnTn2txRGHf9DOqpB2Sl+J8=;
 b=xEXUF6qSou5HkYhjhFaDapam0OTmKI8ofnVuhucNEO3T8fo/wvK/uYxWzPF0TWZvC7
 9DUGXYwfRTQ2xDP87ZwLNZLd6/TzaUKUV47RqPkDjCKS2FbA+Yxk502TezGSG+15bOhE
 AUQdvOhA8JI8kcCXyWn/U4RXoONpkwMKMWLnjzNpPs4EuyyZYlTAnpbmUsX4WdEQzDSt
 zZnZmVJXCpqOJ11GtptZQqmxqPZmvqTZDqMw6QPyoIqrDTLbErgW5cDIXofUm85p0dMv
 RihygSafGqAX8xGZVeEg/Hnb4ehbR6SJ1dQGw00dr6aPcGtXjk6UzZzeLSPBmqzaR8oV
 4EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqNyuQcVQISsWNDc33MXpnTn2txRGHf9DOqpB2Sl+J8=;
 b=hC6af4aWKJaFsfnae4wdRTt4HnuqMT79M6gihnKuJtdirpi4MQzaVABYxoWPgbodvc
 A0DwRY7oK5fZ+NQwcSqtIJAZz/1HMu8ACPdpmCZZRUUOUfy7HtYsDQd31oAXI+m4L0pr
 Kh53CymHGgQus32nQv9qJDmeNDsKCnGYKmy9xuIeYquPPD31D9WRv0vDcmARdqiCIz35
 Z3FhAlo/QlBSFdLxC+TPEuLSqWk+fzRSRmiK7qGTt+BGjVzMJkv7fKs+OHv66hgaHCaN
 uwfZkw5GdU7WMg4o41Pth9j/VDl0ExmivC0JUpkbcOANAcCJ5dpnwYb4LcJedSfxvTTK
 YjnA==
X-Gm-Message-State: AOAM533aQqGJYcawPJDzt75pcEhxdtrr8hpbrPQIItkJPzcqTT8dfL6g
 OOFCqmtSWeKVv1sOK+tz9ISEQongrAKtNg==
X-Google-Smtp-Source: ABdhPJw5earLDI+AxaAwQPw1a/3HrsMgRcl7w4xND5vOSruJhLFPJ2b1/5Eug9pEZk728zLXq1e1Cw==
X-Received: by 2002:a63:e205:: with SMTP id q5mr15993024pgh.404.1623659882195; 
 Mon, 14 Jun 2021 01:38:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
Date: Mon, 14 Jun 2021 01:37:33 -0700
Message-Id: <20210614083800.1166166-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

This will eventually simplify front-end usage, and will allow
backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
optimization.

The argument is added during expansion, not currently exposed
to the front end translators.  Non-zero values are not yet
supported by any backends.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h | 10 +++++-----
 include/tcg/tcg.h     | 12 ++++++++++++
 tcg/tcg-op.c          | 13 ++++++++-----
 tcg/README            | 18 ++++++++++--------
 4 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index bbb0884af8..fddcc42cbd 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -96,8 +96,8 @@ DEF(ext8s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8s_i32))
 DEF(ext16s_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16s_i32))
 DEF(ext8u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext8u_i32))
 DEF(ext16u_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ext16u_i32))
-DEF(bswap16_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap16_i32))
-DEF(bswap32_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_bswap32_i32))
+DEF(bswap16_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap16_i32))
+DEF(bswap32_i32, 1, 1, 1, IMPL(TCG_TARGET_HAS_bswap32_i32))
 DEF(not_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_i32))
 DEF(neg_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_i32))
 DEF(andc_i32, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_i32))
@@ -165,9 +165,9 @@ DEF(ext32s_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext32s_i64))
 DEF(ext8u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext8u_i64))
 DEF(ext16u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext16u_i64))
 DEF(ext32u_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_ext32u_i64))
-DEF(bswap16_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
-DEF(bswap32_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
-DEF(bswap64_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
+DEF(bswap16_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap16_i64))
+DEF(bswap32_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap32_i64))
+DEF(bswap64_i64, 1, 1, 1, IMPL64 | IMPL(TCG_TARGET_HAS_bswap64_i64))
 DEF(not_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_not_i64))
 DEF(neg_i64, 1, 1, 0, IMPL64 | IMPL(TCG_TARGET_HAS_neg_i64))
 DEF(andc_i64, 1, 2, 0, IMPL64 | IMPL(TCG_TARGET_HAS_andc_i64))
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 064dab383b..7a060e532d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -430,6 +430,18 @@ typedef enum {
     TCG_COND_GTU    = 8 | 4 | 0 | 1,
 } TCGCond;
 
+/*
+ * Flags for the bswap opcodes.
+ * If IZ, the input is zero-extended, otherwise unknown.
+ * If OZ or OS, the output is zero- or sign-extended respectively,
+ * otherwise the high bits are undefined.
+ */
+enum {
+    TCG_BSWAP_IZ = 1,
+    TCG_BSWAP_OZ = 2,
+    TCG_BSWAP_OS = 4,
+};
+
 /* Invert the sense of the comparison.  */
 static inline TCGCond tcg_invert_cond(TCGCond c)
 {
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index dcc2ed0bbc..dc65577e2f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -1005,7 +1005,8 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
 void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_bswap16_i32) {
-        tcg_gen_op2_i32(INDEX_op_bswap16_i32, ret, arg);
+        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
 
@@ -1020,7 +1021,7 @@ void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
 void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_bswap32_i32) {
-        tcg_gen_op2_i32(INDEX_op_bswap32_i32, ret, arg);
+        tcg_gen_op3i_i32(INDEX_op_bswap32_i32, ret, arg, 0);
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
         TCGv_i32 t1 = tcg_temp_new_i32();
@@ -1661,7 +1662,8 @@ void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg));
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
     } else if (TCG_TARGET_HAS_bswap16_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap16_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
 
@@ -1680,7 +1682,8 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_gen_bswap32_i32(TCGV_LOW(ret), TCGV_LOW(arg));
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
     } else if (TCG_TARGET_HAS_bswap32_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap32_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg,
+                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
@@ -1717,7 +1720,7 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
         tcg_temp_free_i32(t0);
         tcg_temp_free_i32(t1);
     } else if (TCG_TARGET_HAS_bswap64_i64) {
-        tcg_gen_op2_i64(INDEX_op_bswap64_i64, ret, arg);
+        tcg_gen_op3i_i64(INDEX_op_bswap64_i64, ret, arg, 0);
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
diff --git a/tcg/README b/tcg/README
index 8510d823e3..19fbf6ca52 100644
--- a/tcg/README
+++ b/tcg/README
@@ -295,19 +295,21 @@ ext32u_i64 t0, t1
 
 8, 16 or 32 bit sign/zero extension (both operands must have the same type)
 
-* bswap16_i32/i64 t0, t1
+* bswap16_i32/i64 t0, t1, flags
 
-16 bit byte swap on a 32/64 bit value. It assumes that the two/six high order
-bytes are set to zero.
+16 bit byte swap on a 32/64 bit value.  The flags values control how
+the input and output sign- or zero-extension is treated.
 
-* bswap32_i32/i64 t0, t1
+* bswap32_i32/i64 t0, t1, flags
 
-32 bit byte swap on a 32/64 bit value. With a 64 bit value, it assumes that
-the four high order bytes are set to zero.
+32 bit byte swap on a 32/64 bit value.  For 32-bit value, the flags
+are ignored; for a 64-bit value the flags values control how the
+input and output sign- or zero-extension is treated.
 
-* bswap64_i64 t0, t1
+* bswap64_i64 t0, t1, flags
 
-64 bit byte swap
+64 bit byte swap.  The flags are ignored -- the argument is present
+for consistency with the smaller bswaps.
 
 * discard_i32/i64 t0
 
-- 
2.25.1


