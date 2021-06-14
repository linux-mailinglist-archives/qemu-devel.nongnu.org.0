Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD153A5E82
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:43:10 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiBZ-0002Eu-5F
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6j-00025b-4G
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:09 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6g-0003W2-Aj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:08 -0400
Received: by mail-pf1-x431.google.com with SMTP id a127so4191603pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9falKtlgXRX7iCDYqgvSVBqx7lbth/xVIEcKWW9LxMo=;
 b=nXTRdb8KXaAuAeJmMgNjW1OUc5p0SwNP6e0IGPHJLZK0UMcOqqvrPPBJe7bx0uBnRc
 jDTsqpTixrFLqCXohxD7jgj4BsaAY3xXVkIzmLh5UXOLzfv9ETMxIGYjgVjmRompm1wC
 0sJwDoQTIqgvRg3gmhH0+FvE9k9WYsQ3tcUzx2zaAnmI2ZwA9KI2S6rbBGfL/yHgNNUX
 rT6TyhabjUfoROy1s6Sd8KZEJs5rqraMhJJXTyzdjTkRXvHKLUo1WmVydeyB7Eg2uEz3
 nnPWM4lZ9AgHlCxe2qG5PNciZf6Qo7Xprw9k5zEq8BVXYZADrXtPt20bURa0HvIzz243
 fRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9falKtlgXRX7iCDYqgvSVBqx7lbth/xVIEcKWW9LxMo=;
 b=eB4mnREex/O2/xNK2Rql3BX7UOPxbSAV5gM+za9KoxMyIdkdpl8yLoMdlHxL0U5Hc2
 SF4MHrKR6eP0KfdNSDkWiFl5QyIfQcHKXVHlYGos3ofgDYA3QStKdXKSHnoaGpJdF+4w
 vMBoWpWQkPRzzbCukn6h4AowJFgpnNFyU0koV5BKflm46XLYM6SIAcOXznvu7I/K+xV6
 Vkm8aA/JISsCLUwNV+icOXDZi2deq/rwt5kQ4GiPS4d9XJxFocnR3rxez4MZL3+jWmh3
 A2DW2TkSOSiR07qPtH47G40OGXapUdYDPIFkIDpUgtcD3ayqAjrNWjXMMAUeSZ4eIRr7
 8tvg==
X-Gm-Message-State: AOAM533apUiBKusWkhGTeggjK7TwzgwdNef/XHEbVmq51+s2DeX9IE95
 m5VPmtJfBhDjfXsSzwX+k08I0ZoeH7VdNQ==
X-Google-Smtp-Source: ABdhPJzEQIx5u2p+GqI3aCIhIMQ5wInX3ZYN2QM79jGlfek+e+LU+BMHJJYprb4Letvlfo3RkXfj9A==
X-Received: by 2002:a63:2f05:: with SMTP id v5mr15883826pgv.449.1623659885043; 
 Mon, 14 Jun 2021 01:38:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/28] tcg/ppc: Split out tcg_out_sari{32,64}
Date: Mon, 14 Jun 2021 01:37:38 -0700
Message-Id: <20210614083800.1166166-7-richard.henderson@linaro.org>
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

We will shortly require sari in other context;
split out both for cleanliness sake.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index aa35ff8250..b49204f707 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -768,6 +768,11 @@ static inline void tcg_out_shli64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out_rld(s, RLDICR, dst, src, c, 63 - c);
 }
 
+static inline void tcg_out_sari32(TCGContext *s, TCGReg dst, TCGReg src, int c)
+{
+    tcg_out32(s, SRAWI | RA(dst) | RS(src) | SH(c));
+}
+
 static inline void tcg_out_shri32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, 32 - c, c, 31);
@@ -778,6 +783,11 @@ static inline void tcg_out_shri64(TCGContext *s, TCGReg dst, TCGReg src, int c)
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
@@ -2602,7 +2612,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sar_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.  */
-            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
+            tcg_out_sari32(s, args[0], args[1], args[2] & 31);
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


