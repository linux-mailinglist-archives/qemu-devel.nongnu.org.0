Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CE3ADB4C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:25:28 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufep-00046B-F0
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUm-0000ls-6F
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUh-0002Fd-Q2
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:03 -0400
Received: by mail-pf1-x429.google.com with SMTP id x16so10323888pfa.13
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vC/L18edcuCe8FZFGeMjtTSdBtjX4uN3kFKzp4cnVKo=;
 b=NpcmAhthp5Daas6jXrcETc/yk4/7uyz+K0DRRYtXghovRVi7vC0/LorACo1kNEGmhJ
 Dr+8G5N5NFPdMEyPxDxQp/91PlPziiHhE+4OP186qfY8625SdWbhciW6EfYcjR+UuX8s
 n1Zn3XCidcC1Po4U6HKI8qHYA4VlbjF5Aw5OpKAnZP35lzdR+Akr2CKvJA+b5sm0O1Jy
 fIZ2p+fVD7le767l/1nJtAIuLIrj5UKGkJeDB2LcSeYZ/vi3hS5hdPcQfsnB2R4tQ7LA
 bSAY1lU44RhTHlROPy0tAV8v6Cn2clHMi5juJSH00zLys9KbVx8r95PQlvmIxok0EUuY
 gbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vC/L18edcuCe8FZFGeMjtTSdBtjX4uN3kFKzp4cnVKo=;
 b=M6C9RhbHqU9/9I5edc44UgUc21pCPJCk3uEsinH4qKX3KzwzZ79aBytXG2hV6trDJN
 KiA7w97uq+Bx/IVr+CBIZ62BFJxuPTKVkbndjMl2vn38/y5SPqsqCa2abbAySHzjMZ1l
 7FUGKWGe7nSOc32z6IVO6BfuDyFfsjYCVPS7o9EHPeZLCixnMmUNRhH8moVnwFIryhhJ
 2v6/yAgKizzX858REp454V6vFq/z2Td8LA7KA5JuxvNzYIjL0R8s6CPzWHKPk+OVzGnW
 iTDKBXJuwjQkVrTb0QFMkXUyHTt+DJdVibHTDpq/gVyWbROeW9WzfgP71+Ni+gyk6Sw4
 XwTA==
X-Gm-Message-State: AOAM532EOyZEYJGHwC7iHVO9BV8VtBlIOU4tAhcmBGEgXs7Pt/HJorwT
 PYbrK90Ldy5KgLBMnK2s03gILply6tgITA==
X-Google-Smtp-Source: ABdhPJze0+V/AYhsgXUWyMHUQXrPZldN9ZXSu4zPl/HFkzSN+l1Pqm3KEThf3n8XskEutb5S+Auepg==
X-Received: by 2002:a65:4c46:: with SMTP id l6mr16030341pgr.91.1624126498579; 
 Sat, 19 Jun 2021 11:14:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Sat, 19 Jun 2021 11:14:28 -0700
Message-Id: <20210619181452.877683-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 823ecd5d35..8f3f9ef7d3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -810,8 +810,14 @@ static void tcg_target_init(TCGContext *s)
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


