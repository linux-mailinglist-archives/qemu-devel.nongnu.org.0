Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0453F0CAC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:24:47 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS7C-0008Hg-68
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2K-00081W-L4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-00068t-7p
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:44 -0400
Received: by mail-pf1-x42e.google.com with SMTP id t13so3334639pfl.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+CMPBOKVQeWTwZGrxMiWTzbA3RbAllHepTMsTUswk6M=;
 b=Zp2bL720Hll6EKYci/jXuMy8QpKRNEFGZinSwnDBhJVvnqNxnGwUwKDgcZ5DwwsVBp
 ICxX1CPTvpa3YJ64341/iQIHJ1Tm4gIWTFjj7h8mERmuAZrJqj4h6BX35lkixCIH7RDF
 qDVSH1o1kO3M/M/2rjDX8jQrwP79UHCOWP4GZs9Km8VT7o/0K0c1hW3RXLmuh4DkPd+f
 bmrU20OZtys6MQwCTV2Hp8CNCIlgobD0A5CvcbSKuyXXFQU3hLEQLZ5rKyP7RvzJMVvr
 Kh9Xv8709i3US18NzOCZmwKMfZTkvDVg4wen5uw0BqtcXMgUNjYWwIDkOqBOWIbUwyAg
 uBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CMPBOKVQeWTwZGrxMiWTzbA3RbAllHepTMsTUswk6M=;
 b=pumQw4Am+HEAMQkBGNQwoFIMViQyi/+ZLi0SsHLvvwwm1NuqcEMuUr+ANuF+QKY1IC
 tup7NwU5CbcVnLHG7VlW4M9Xtxm3oSe35kdV5IS1TqcJfLb8W4ScLIFebHecNbENc/kE
 WwWFaZVh9T2JhuB+f8XWbf1LjCeTxiKjb8v8uFBm73UZaKduIR/mcpRCHfBatfYPjPKb
 mGnyVVtan7ub7z/L7eY6J1LTYpf0NktRu3B7ZsCz8TQ9A53BR+X4eMcFNFwLsnUsL1JS
 M0hXdFu+8TS7LXX3wWVkXqjG/Ogr+BTKj1tRf9QBiAm+hu2OjvIvBO+0uVCqnEh7nnV4
 KTYg==
X-Gm-Message-State: AOAM530Wm9Our3MvM++LQ1zim5Sphiw7vTkDk59RlpfdDi68uskkG/o3
 EEuds6dG3KYdP0PxlwnJTXEuZpcKiF28wQ==
X-Google-Smtp-Source: ABdhPJwr/up1Vjpv30vuG6xsArjAtIzIwPr71QBUqZ1S+CU4i2NwcvRQ16FGH3sQCjrM9HzoDXVrMQ==
X-Received: by 2002:a05:6a00:a0b:b0:3e1:e511:1224 with SMTP id
 p11-20020a056a000a0b00b003e1e5111224mr10795873pfh.67.1629317978188; 
 Wed, 18 Aug 2021 13:19:38 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/16] tcg/mips: Move TCG_AREG0 to S8
Date: Wed, 18 Aug 2021 10:19:19 -1000
Message-Id: <20210818201931.393394-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

No functional change; just moving the saved reserved regs to the end.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     | 2 +-
 tcg/mips/tcg-target.c.inc | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 3afbb31918..c34cccebd3 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -80,7 +80,7 @@ typedef enum {
     TCG_REG_RA,
 
     TCG_REG_CALL_STACK = TCG_REG_SP,
-    TCG_AREG0 = TCG_REG_S0,
+    TCG_AREG0 = TCG_REG_S8,
 } TCGReg;
 
 /* used for function call generation */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 94f1bebdba..92bde50704 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2542,7 +2542,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_callee_save_regs[] = {
-    TCG_REG_S0,       /* used for the global env (TCG_AREG0) */
+    TCG_REG_S0,
     TCG_REG_S1,
     TCG_REG_S2,
     TCG_REG_S3,
@@ -2550,7 +2550,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S5,
     TCG_REG_S6,
     TCG_REG_S7,
-    TCG_REG_S8,
+    TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
 };
 
-- 
2.25.1


