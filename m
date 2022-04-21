Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B298150A4F3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:02:41 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZGS-0005hG-QM
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZn-0008Ig-0n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZl-0006N4-Hh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bx5so5231232pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dld49d9db7Y5yyVgQQiQvPetwjIIOD6aVGgarCZ6u4M=;
 b=sotuOlqBtsVxaz0N4W3FSlGKpX6T7WwCXovACDR3PctZep/jBgBl1BprHTvm1M5YXc
 Xaize9SqdgYBXeJkcJ6gk3sB/2NzI0Wkad8kx7JJgCh0T6vu3glwhBB0qwFuY2OLwoGi
 XJueczY8bOA5tKi2Wtnim726PyyyZll0DIMfpcpgtDHIPdAVAQi1D0spzNWj2mN2AP63
 OF5+1iJb/OYuZgqjfpc2ub1xue58rTqb8T48Ow9Gxgk/c/g8yS3Fa8oVxq0UaregAnPp
 w1Zyr+jY2ZohGTGpLNaNqbIueigjqlrk0gebIJaS8/cQrolkBwMpadRXKlwpW+/PrKtP
 IUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dld49d9db7Y5yyVgQQiQvPetwjIIOD6aVGgarCZ6u4M=;
 b=F3Pdbolb+YWzi8dgBFqBCimfOJIm+WVEXyELzjF+drYvgR1ZebtMH1GI1zXSHcOFBV
 v1ZmWI2KTPThrVl6Zx0WT2lhiqiHtS4bYrSODSVqVQW+2nFAF8thqfXN8aZOhTYmoxdD
 9WO6ANgkv/ErlQR4L6PLFae0/0yiydmhi2yLiP+N2sC/IyCfBmx7O60T9WpzIBYvq/6P
 yaG/PZVBrcIb3srt4aI/S9su21PE7Y1rdZZETsn2qUMhZYSoHOvrMdzNhVGdwAeg6VPw
 X9EtadzjNrottWERedJI4EYNY75fhgrys1ZCHquuWZ7R3CbU7aLndzJBLB6GJJeScwqj
 Gzwg==
X-Gm-Message-State: AOAM531V1jXujY8ZsDtTjrTOjRR6INwvc5RWX6Ciy7xF7FsnGIX4H4ov
 ajdEY5ur3zivJ+T5tIiumI2FHd+6g4sqvg==
X-Google-Smtp-Source: ABdhPJx6huIDsYjpBYVdmTib8WrBRjOVqMICsRbCL0L74peMrUW3Sm2dKjR/xgiejhfVJRAm7CfgUQ==
X-Received: by 2002:a17:903:189:b0:15a:fe6d:34aa with SMTP id
 z9-20020a170903018900b0015afe6d34aamr7184plg.141.1650554312353; 
 Thu, 21 Apr 2022 08:18:32 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 35/64] target/nios2: Cleanup set of CR_EXCEPTION for
 do_interrupt
Date: Thu, 21 Apr 2022 08:17:06 -0700
Message-Id: <20220421151735.31996-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The register is entirely read-only for software, and we do not
implement ECC, so we need not deposit the cause into an existing
value; just create a new value from scratch.

Furthermore, exception.CAUSE is not written for break exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 25a89724d0..3d9869453b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,9 +54,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
     env->ctrl[CR_STATUS] = new_status;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                         CR_EXCEPTION, CAUSE,
-                                         cs->exception_index);
+    if (!is_break) {
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
+    }
     env->pc = exception_addr;
 }
 
-- 
2.34.1


