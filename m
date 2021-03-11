Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5833765D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:01:16 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMoN-0007XD-S7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUN-0003dG-FY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:35 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUL-0006Vs-PF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:35 -0500
Received: by mail-qk1-x733.google.com with SMTP id 130so20749632qkh.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=XyYsQi8Sl5M1QLZWcju+fpxXdo8vmpu858SeXAAqQaZisBMQGhbEDDkdCbEUr2SF4C
 /xrda1VgQ8wDEqiH/Jn3gDTqiTW//l/a7iaL4P4vHLatGNKJomhmzaJ0DQv7NKL7BZjt
 /Cp4Jtc5srrqz1p1Aze/9wYIlo3gLV4nrF9eIiYNy/Y2I9I1N9mp37+7wDgEBod9crJe
 WknLO9Cz11RFOCxukRPRLP9xtGFJLudCSkQF2N+V1OfLHx1bD/qZ73kntx9Y6DmtgOg5
 nLeKtQiIEWwewxQIQ3pRD4BG/YGGjF5Qty3EUOmdWxjf7uWpQICJ6ESXj5Tj9SXX/Xz5
 FMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=IgmRZUF3aIyxJLY28pDJfU1BaEF5CtiRXDn5yFr0NreKBNc5Xq/4kg/4ypx9FyQe/x
 SuCbrxmME0Ign0zjLAqSEy0O4ZJfvqPuuQsiQsWlvqSU53i5WKoXG7aLEs9vOr9bYxyE
 Prqf55moZsBVl7rU6SZwhEl/ejh4HShYW9hH6ha8A6mZVU85r+Q8/D1imPFtAAY5cu+d
 xMUsZ1KSjAjQl1lEMMLny2+QR2CQe4nedQJhG60cVwHV/B9EVioDAcuPhDxJhMiJi9+9
 ukuyvlbdkfugGXu8scEOH5zapgd1wadYAT79gpvppY8nW03dsmNEWibLLFq/w6Dm8VvD
 5jaw==
X-Gm-Message-State: AOAM530IaerMKlDZJj1oodn7wOtlRA5K/Z/queVA/zyci7JIFHCNT4ub
 Zb6v8L10Yp26FsVhFo449cO/M+WbnXoQlvJq
X-Google-Smtp-Source: ABdhPJzEGk83eFQa/QO1dH1QtgE+Y4Jm9zlzB5Vl2Tu3M2z+MGDlpUjI/uIpY+8Pc2/Fi5SZfzijOg==
X-Received: by 2002:a05:620a:798:: with SMTP id
 24mr7908872qka.493.1615473630257; 
 Thu, 11 Mar 2021 06:40:30 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/57] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Thu, 11 Mar 2021 08:39:25 -0600
Message-Id: <20210311143958.562625-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8d75482546..4dae09deda 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -623,8 +623,14 @@ static void tcg_target_init(TCGContext *s)
     tcg_target_available_regs[TCG_TYPE_I32] = BIT(TCG_TARGET_NB_REGS) - 1;
     /* Registers available for 64 bit operations. */
     tcg_target_available_regs[TCG_TYPE_I64] = BIT(TCG_TARGET_NB_REGS) - 1;
-    /* TODO: Which registers should be set here? */
-    tcg_target_call_clobber_regs = BIT(TCG_TARGET_NB_REGS) - 1;
+    /*
+     * The interpreter "registers" are in the local stack frame and
+     * cannot be clobbered by the called helper functions.  However,
+     * the interpreter assumes a 64-bit return value and assigns to
+     * the return value registers.
+     */
+    tcg_target_call_clobber_regs =
+        MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-- 
2.25.1


