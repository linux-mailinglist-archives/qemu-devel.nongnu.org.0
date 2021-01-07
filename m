Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711D2EE709
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:39:15 +0100 (CET)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc3u-00066z-0v
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhW-0001XU-4a
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:06 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhE-0001gT-Rr
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:03 -0500
Received: by mail-pl1-x630.google.com with SMTP id q4so4154306plr.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=j4k7cODbUlVvQ57DiYLgTqp2bcvpN+C+0KnuW8UCb+C/svfe3m9L7eyoWteQYQySZ1
 2rv8KXr2nxCirPDDrM1leGwtgTlQ6e0UQfbFDH5dtu1yLtyVww7hwMK0ksNaGcIVBije
 0GrNjHLwVJSNKuMj2N0KMvBB/jky0xygnccjx2cbSSfEH34yrS2zGvMiGUAk+ZiXwpyw
 qxc85AijBIVDUOf/BehJs39QnmrGqCA9+rKZTAAeV3ipM3gYGnjJD8Ho+/rgTExKheg/
 0vSRmOxlj5N4UHCmTYrkcyNe/nG4QMspPI22kaYHUCRgUswnDGLMoh3amtKR5uIQqRUU
 Jv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qay0jNTmpyZq4ULzg3vkr0em7pJVaOqPAuzaBx5paoU=;
 b=bpEAHK8+BL3hpT3Z1DwIfKNoA9/+D/e5ZaRn1TuWcu11mUXiHNER+6GVORjTYqzNwO
 qiL7j18ZI4S2wnqho/uyvAyrMV24v1xtQr88nrfDbxg1ZpCncQIN7LtpaKkF/Zq7WWR2
 8iYLwY5/N0i5vIeEihkLK+bF2lYQH5z9VUM3DYxJPV+IOQForKURxJNCwRyeeboKmnMo
 tmEfIqvvgMTJduzqSUG+ojuZ7H3Txm/z05AgTJgMpGmJF0OVNOC2TXAx/Gb3KtgnoEKq
 Drw1zBoUNqw+qM+HzRAyojQsOWPlYrP5xtd/O4tul4fl2jqXMoMmxhg9j7E7DpZUIBMW
 ipQg==
X-Gm-Message-State: AOAM531p3MUyyGoiEpeX8TmQesKWnODGLvrUtyfEUQ9Pm21EV/8q/cAm
 wgcD404M+C2djpDm6D4JyfXjbqa/rnPIlQ==
X-Google-Smtp-Source: ABdhPJzb+Ji2n0vbVBnAATMic2zp687AwxbAT6KlNVhqM6Q3pFmPXrklLTRlTEEBNc9g8RSUtVsx5Q==
X-Received: by 2002:a17:90a:e60d:: with SMTP id
 j13mr211559pjy.52.1610050546543; 
 Thu, 07 Jan 2021 12:15:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/47] tcg/ppc: Use tcg_tbrel_diff
Date: Thu,  7 Jan 2021 10:14:32 -1000
Message-Id: <20210107201448.1152301-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_tbrel_diff when we need a displacement to a label,
and with a NULL argument when we need the normalizing addend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0eb9c4ebe2..ed7a201578 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -837,7 +837,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 
     /* Load addresses within the TB with one insn.  */
-    tb_diff = arg - (intptr_t)s->code_gen_ptr;
+    tb_diff = tcg_tbrel_diff(s, (void *)arg);
     if (!in_prologue && USE_REG_TB && tb_diff == (int16_t)tb_diff) {
         tcg_out32(s, ADDI | TAI(ret, TCG_REG_TB, tb_diff));
         return;
@@ -890,7 +890,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* Use the constant pool, if possible.  */
     if (!in_prologue && USE_REG_TB) {
         new_pool_label(s, arg, R_PPC_ADDR16, s->code_ptr,
-                       -(intptr_t)s->code_gen_ptr);
+                       tcg_tbrel_diff(s, NULL));
         tcg_out32(s, LD | TAI(ret, TCG_REG_TB, 0));
         return;
     }
@@ -940,7 +940,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
      */
     if (USE_REG_TB) {
         rel = R_PPC_ADDR16;
-        add = -(intptr_t)s->code_gen_ptr;
+        add = tcg_tbrel_diff(s, NULL);
     } else {
         rel = R_PPC_ADDR32;
         add = 0;
-- 
2.25.1


