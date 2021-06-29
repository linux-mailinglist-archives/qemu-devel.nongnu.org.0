Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B03B78D9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:48:38 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJid-0007Ac-Pr
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwH-0003yj-Hj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwC-0002xZ-7r
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id q91so142980pjk.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fXrizxcUnvvf6PXr7Yc72AhaPXA1gSYgiDq85iqI09c=;
 b=eXW4prePy3Lf1Se7IA+P5zotkPGKPaWBvHrZhZO8vxGR8al4hnb6+3HBfnuQURsG7X
 OBhdjyoQMFuOGV5zq76NGKHbwiwUvvLPKzJv1L/PT5zbXGrTok4GPvZxgIhoJSwAv17L
 9byE/q4MTgWtlmYDjLqaEGDcHcvCjxGJh/KgQ9r01HpimWuwCb4oRaUhrcSNdVtckHub
 OIjel75mtskoI5nC8sC+jnOtCgGPZpsCDqJNN111nP9qX1w1baNJBO1LdeltPQe1ir7N
 j6bp5iy3PHvXbY1XVsrekl45Ms1FMVgtqR56sTGdjsfymH/GBt1bZyJIW3G0tvCTyF0D
 QrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fXrizxcUnvvf6PXr7Yc72AhaPXA1gSYgiDq85iqI09c=;
 b=bn/bAQVv/bA820j4KWUqzMGdhkCTE+A+GM+r9Yj3LT2rA/Q7+3WOphBpf83G0sZpVO
 HtLwDL8VUIUOwqV3nxSdmzXTL/BcFZJ5ecvw5UG1axb4FPAGqRC5iMSchElIaNl4/5Qn
 4nKsXS+spYQCNrk7W2wAHOQe2FgFNJ5ZTz2rDmdgzNc9RfHprHF9+VQdPgHstaGi9ZK6
 Vso6e+V032+9NxSy7+DOjIdhFSf2uslVjcfofEdD17gR+kvttocuORFlEse5q9xlPJ0X
 /aC+n+GUU2Y9kry8pHXNxEdY1T48BwHuHz3kUhIxsuGECjI8y0Y6qa1qPIpoFRqQ5lQV
 0LwQ==
X-Gm-Message-State: AOAM532Y9O8uCpGd0ZJNSH09bXDglgNX+PXX9AHe0I4NatXEm+/hBrob
 6aIueu0flu/CwAad9oIEZRXfytSNx7HS8A==
X-Google-Smtp-Source: ABdhPJzzT0VVa16mNM96q6eXvjPvg0iqxYcafpjW/4oEAa/UNJljcvYhMs9EzjhbwsohY5Byrz8yNQ==
X-Received: by 2002:a17:902:e548:b029:124:5738:cd9b with SMTP id
 n8-20020a170902e548b02901245738cd9bmr28555466plf.37.1624993102375; 
 Tue, 29 Jun 2021 11:58:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/63] tcg/ppc: Split out tcg_out_sari{32,64}
Date: Tue, 29 Jun 2021 11:54:33 -0700
Message-Id: <20210629185455.3131172-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

We will shortly require sari in other context;
split out both for cleanliness sake.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index aa35ff8250..50347182d7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -768,6 +768,12 @@ static inline void tcg_out_shli64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICR, dst, src, c, 63 - c);
 }
 
+static inline void tcg_out_sari32(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    /* Limit immediate shift count lest we create an illegal insn.  */
+    tcg_out32(s, SRAWI | RA(dst) | RS(src) | SH(c & 31));
+}
+
 static inline void tcg_out_shri32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, 32 - c, c, 31);
@@ -778,6 +784,11 @@ static inline void tcg_out_shri64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICL, dst, src, 64 - c, c);
 }
 
+static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2601,8 +2612,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i32:
         if (const_args[2]) {
-            /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
+            tcg_out_sari32(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAW | SAB(args[1], args[0], args[2]));
         }
@@ -2690,8 +2700,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_sar_i64:
         if (const_args[2]) {
-            int sh = SH(args[2] & 0x1f) | (((args[2] >> 5) & 1) << 1);
-            tcg_out32(s, SRADI | RA(args[0]) | RS(args[1]) | sh);
+            tcg_out_sari64(s, args[0], args[1], args[2]);
         } else {
             tcg_out32(s, SRAD | SAB(args[1], args[0], args[2]));
         }
-- 
2.25.1


