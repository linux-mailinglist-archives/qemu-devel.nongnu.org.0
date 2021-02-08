Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9D312935
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:12:42 +0100 (CET)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wyf-0003om-7N
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRq-0001m9-1u
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:46 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRn-0005ul-4i
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:45 -0500
Received: by mail-pf1-x435.google.com with SMTP id d26so7523957pfn.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=BKmkc3L+y2YKo9x6+3VASigGz1F93P3W0BTkZgKmCoCjzlZvCkap6NtC+cFlpn9TKi
 8FK7+WTjMbyGLT1WBDUOOUVsJZmaLgkVbP5YTtpbx4y1CqHTuSc0nqwR7chtc/G/wxj6
 iTiZesgAnBRW96qIQEz+hxSaRy34xoQEpo58u3+gdc5kvkWVkiKByTLBXvAu+jq3Bxfh
 KuGQcHx/loiBNSgCFAsmlMJTv5zTFOVW/4e8zsHSPhlgIeS/P3LH7BVoS2IFgTNdOKgp
 p8qlBBnxORbgrSv2WmcgwsvPl72AnPhaAkO1Yt8Zyc5ua5TLd7cO2LbYvWraV8gZX+3M
 owcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=stBtyPhHeQSL0KZNxE9wdPKHwitCe6WnkGYgGQM/rVTYwvuc9D5bWT6jIq1YEB9cK5
 5T2Vfl+Q4LI8SCaw/oN+UH5sBT4+k7YqT+nHhrp2hPwO0cns+DvOgM46rt8hjiqTGyoy
 g4SxEjzBZqXNt9pf/0t/a3U2Mx+791Vh/tt8XB1hXogCnTPXQpvLoy9Lzu4vpnWFSexK
 WYJ3C3O0JecpXyG8BYLOAUFw408tSJsc6ZKawhz5DUdOddUFiWvmv9Uvc4Xe0wxobMdw
 d4NjX0LamJF47nsnl/PywQYn9rzyCSfI6tqRxDjYD9wfw/8Tl/mey+eMzId8oXWJJGrs
 oMug==
X-Gm-Message-State: AOAM533WI2WhFsuzNw6apVlDgMO156qK1z1giz0phv1diRmTsb1afi4M
 Sv57xc/WfKKrU14tvNezZoQ7veHUib/uHQ==
X-Google-Smtp-Source: ABdhPJxWUen4CYsc0ID1q4cCUA9YZxNSLL4UyKPBdLs7DmxDquyYS/XfX4Tx988ORu7JaJ7EdAKhYg==
X-Received: by 2002:a63:d446:: with SMTP id i6mr15074741pgj.446.1612751921883; 
 Sun, 07 Feb 2021 18:38:41 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/70] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Sun,  7 Feb 2021 18:37:21 -0800
Message-Id: <20210208023752.270606-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: sw@weilnetz.de
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


