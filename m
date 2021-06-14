Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CE3A5E86
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:46:59 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiFF-0001oc-Fm
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6r-0002Cc-I4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6h-0003WA-7H
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so9600594pjz.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RmJRRsSQCfFpzMnGvbeflLavjd8sak/ufPXwSJZUO4k=;
 b=e6NRlOWjJEoa0MCTC1H93fuvJ6hi19fzTMbTZa2kn6d/HnTvIyTvyLTzZcvOz8yArs
 FjLFTblo0JGUi7kg06Z5oKOFGDWeSWqBVHrzsY+Kwaq+PU8KkYoIK06epYL7/CrEBfOF
 fZFGG6oCv1IwujY8O+8fxrgNCN+Nl9fgfnT+xfOhINbBdx2juPGdl/Vn+EaBsFff0Fe0
 Av4hluWFpawitsq5OlUwQC019bHUT4QV+jjKuj6B+pp/ANIJtYul1Gg7z2yL8SOrdwRk
 xGvUDmZhYssnW4I0gjFRIyrtLuuMcqm4oLnR/QmeekbKTTsXAUr6aiMK7suJNK5pjYu5
 8R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RmJRRsSQCfFpzMnGvbeflLavjd8sak/ufPXwSJZUO4k=;
 b=TbWF0I/VQPn8me2KqLElhsj2MUGSoTavL2FNQ+gdnupdWmEAritReLJPP42xX27BQp
 ZQDHDohgZP27QjhfHVLnuTfrEOOAlA9K0kBUzUl1FDzwUfyNZleMczmZrn0gy5RRV+m1
 zN/2HnHwcY/cDvOVp10ROC0lFfFG8c8nu0Vu3oR2TdVbzIrmUlFOX1gX3ptpp+UalYV+
 NX4hj+UPd7wTLQsASG+8UQwEfJYmOP15DBXlOTFws8+ORXpfs5IVEp8gMRYsxHzwF2Z9
 uiMx/zbJdh00fetE4s/QAbnz4wSiNhF22seShSgkyg9H2PXZLNpgS7GPOkBtcdriXIgn
 bPjw==
X-Gm-Message-State: AOAM531JoDWUQJbWneNRkR9zvPq9K0U5r5T4bdNCYxraKS8A0xtXoqE6
 FfLKMejq7JEB1eozNJUxBk5kFq45vR+jcw==
X-Google-Smtp-Source: ABdhPJwM6iG7hD9H01F1W8Y0NmPJcwQCxF4OyS8t2bQsKnH0TPnShwA5I0xuvuU0ZktbBwSIonWhpA==
X-Received: by 2002:a17:90b:4f83:: with SMTP id
 qe3mr22611280pjb.32.1623659885654; 
 Mon, 14 Jun 2021 01:38:05 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/28] tcg/ppc: Split out tcg_out_bswap16
Date: Mon, 14 Jun 2021 01:37:39 -0700
Message-Id: <20210614083800.1166166-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

With the use of a suitable temporary, we can use the same
algorithm when src overlaps dst.  The result is the same
number of instructions either way.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b49204f707..64c24382a8 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -788,6 +788,16 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
+
+                                                   /* src = abcd */
+    tcg_out_rlw(s, RLWINM, tmp, src, 24, 24, 31);  /* tmp = 000c */
+    tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);   /* tmp = 00dc */
+    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+}
+
 /* Emit a move into ret of arg, if it can be done in one insn.  */
 static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
 {
@@ -2779,21 +2789,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        a0 = args[0], a1 = args[1];
-        /* a1 = abcd */
-        if (a0 != a1) {
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = (a0 & ~0xff00) | (a1 r<< 8) & 0xff00 # 00dc */
-            tcg_out_rlw(s, RLWIMI, a0, a1, 8, 16, 23);
-        } else {
-            /* r0 = (a1 r<< 8) & 0xff00 # 00d0 */
-            tcg_out_rlw(s, RLWINM, TCG_REG_R0, a1, 8, 16, 23);
-            /* a0 = (a1 r<< 24) & 0xff # 000c */
-            tcg_out_rlw(s, RLWINM, a0, a1, 24, 24, 31);
-            /* a0 = a0 | r0 # 00dc */
-            tcg_out32(s, OR | SAB(TCG_REG_R0, a0, a0));
-        }
+        tcg_out_bswap16(s, args[0], args[1]);
         break;
 
     case INDEX_op_bswap32_i32:
-- 
2.25.1


