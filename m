Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF13B78EC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:56:53 +0200 (CEST)
Received: from localhost ([::1]:50672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJqm-0000iz-TI
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwU-000447-Kb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:43 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwF-0002ym-Gx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:42 -0400
Received: by mail-pj1-x1033.google.com with SMTP id n11so158147pjo.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wNqQIrhEpVyoEqJCER7tLRV/SXmN4s4drjfWv5Csp4=;
 b=T3XA5rKBDBl9+CIQ2lB1WkmRrRN6PjJqA/5xY8fo7YRgpanrPLRrpdP8zZfMr2AYlY
 II6vz53kavMdXsCfDkaG9khaSy7U95zipnLHUVa69thkktzPXmNi1R32QKgShoMgo1f9
 pzRr6yL//Kwyz49KLfoejKzeFUrf9I058pJDfTzEFKpkisKeoiNbF1bhWpjKU3nRBG2T
 sMZt9qUWrgSv/UeEQDY1o3ho4ED3hI3nXxQSrNDHw0mT3D1P2tj+lN/ClbM6v3uZIVE5
 awlSP77070iDgjLpd9gOaJtL1vzNyL6b/cyvefDn7UpDHizCc1Z1uAWnWmok1q9prui/
 9luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wNqQIrhEpVyoEqJCER7tLRV/SXmN4s4drjfWv5Csp4=;
 b=b1RzJCKeb+4XIyHkLk2Ra86aIVgZ37IOImB/U/S9och3MuEy34xErrjjmpjOxcWtEM
 i2d6lAopgqi38RKYtpBEP9xBUvwCQaYBQ2KCmtchbeIjMjL56BL7sElOOLUmQQR3WR4E
 HE2bGMS1V5L8q83aTcVTMctNWNmsOq6mj/yXp8BuOW3JaKQCoUdnuHG7ye+j0loYjq3N
 3P4oD3Wq9Ksh1hA406g19KvlZZMv6NpVgx9ZTXfjWXoJgsOKTUur7eZxYLo7NX72VuMC
 ZRYPPE3lf+meFZiMNuFcbiLAyQ/wNqQ0VuhQLL4b/pQiHmv2a++WKPsbcC4fDpDQGtXI
 S1/w==
X-Gm-Message-State: AOAM533Xbue6Vq8y15VZwzkaPbVLX/smhtc02pmDdk1EnmIceAf2TgZ8
 3tiNOHEydfdm0RUZww3JozC9XqF28zPxLg==
X-Google-Smtp-Source: ABdhPJyPf/LtBib0IPzYjsfU4kaJRcCrIf7ZqJI6QcvB/e2M7h4PrYqgYBCzI0NQnIdR+knVVAViQQ==
X-Received: by 2002:a17:90a:eb11:: with SMTP id
 j17mr10016602pjz.177.1624993105757; 
 Tue, 29 Jun 2021 11:58:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/63] tcg/ppc: Use power10 byte-reverse instructions
Date: Tue, 29 Jun 2021 11:54:38 -0700
Message-Id: <20210629185455.3131172-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 33f0139519..e0f4665213 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -413,6 +413,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define SRAD   XO31(794)
 #define SRADI  XO31(413<<1)
 
+#define BRH    XO31(219)
+#define BRW    XO31(155)
+#define BRD    XO31(187)
+
 #define TW     XO31( 4)
 #define TRAP   (TW | TO(31))
 
@@ -748,6 +752,11 @@ static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
 
+static inline void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
+}
+
 static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSW | RA(dst) | RS(src));
@@ -793,6 +802,16 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRH | RA(dst) | RS(src));
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_ext16s(s, dst, dst);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext16u(s, dst, dst);
+        }
+        return;
+    }
+
     /*
      * In the following,
      *   dep(a, b, m) -> (a & ~m) | (b & m)
@@ -815,6 +834,16 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRW | RA(dst) | RS(src));
+        if (flags & TCG_BSWAP_OS) {
+            tcg_out_ext32s(s, dst, dst);
+        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tcg_out_ext32u(s, dst, dst);
+        }
+        return;
+    }
+
     /*
      * Stolen from gcc's builtin_bswap32.
      * In the following,
@@ -841,6 +870,11 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
     TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
     TCGReg t1 = dst == src ? dst : TCG_REG_R0;
 
+    if (have_isa_3_10) {
+        tcg_out32(s, BRD | RA(dst) | RS(src));
+        return;
+    }
+
     /*
      * In the following,
      *   dep(a, b, m) -> (a & ~m) | (b & m)
-- 
2.25.1


