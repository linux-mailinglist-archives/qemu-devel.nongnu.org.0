Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A9370FFF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:07:44 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM7j-0002ja-Hd
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxz-0007dl-Kp
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxw-0000aA-UX
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:39 -0400
Received: by mail-pl1-x632.google.com with SMTP id e2so1888754plh.8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gfApsUVxapPN3chTec8btRYUXrbwOLgLsDlRoxJfFYs=;
 b=AXq9iY0apu8TysWSNHXo8gw+obZ/HG1vU6AVyzy2n0hWuxunurVjS6Asae1mH4TN5q
 7J0md1ZiTPkkCL7THHImZR2vDRSL72aMt5IAF62c5AuuTG16Remt8XGY86GzKEs18t21
 BDmFz2XwhoNYXhMK8/HDM0VgA4zc4Cd9E5zVvLCqLe+1pMJwfxgWnozMpPLL1Q5xlBSq
 o4PQRNsxgWpRVr5Qo3VWmInRnbHXyHGDV5sg86dKfd/Xpn+qVnEhv1BfS9v158YZYpz+
 3zXq//bVhqH2eAEX4l4e4X+s0edLlqdPJjBgTn9o1fqajdz9m4gU7jSLfcwiQDiOd9x3
 5a1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gfApsUVxapPN3chTec8btRYUXrbwOLgLsDlRoxJfFYs=;
 b=Jit803a+qiLlRZLEbqBRx0H31yXWnSRXLshuvhMx/YeC0TtLoKpPStu/vGefBZz3x1
 lvnDzkDpqyrP2zcFvj64MVGtZffc09qITjz1Ku22havvYxweyAVmYuc+zSgoBrioevoI
 qp/FHGRRUW+vlQkZCFIZz7mq/IQKa9OJdspi/yNFLziGdvCC6nI38DRWMYYK/JwrWwjx
 e6hLj7XVR2m9B8VJ081yMkQ3PuqZWOgo/sU4cpSDQfrJTIcN4UrDKdVxs+kSKsGpjswU
 TZJVzpr9ivHtqyVzD35NyPeQBo+x9r+gDP1Ay8STaFBKq4ykfSwG7tA22dsY++z01hlP
 sSuA==
X-Gm-Message-State: AOAM532yVxf4PfEa2MwM5RzLHJRQm5pIeIzFVvJZvwI5v39ygKgFK3Kr
 lHnQ8Xy2JPbnNnHPqFJmVlmZReZp8W+BGw==
X-Google-Smtp-Source: ABdhPJwJ8rcZrVt4zqE39ngkXLedlwHv0HSbg8FzCe5KckTrSpLIE766eYBveqW7/Uns1Zhb1gH4QA==
X-Received: by 2002:a17:902:8487:b029:e9:a884:7450 with SMTP id
 c7-20020a1709028487b02900e9a8847450mr17418575plo.49.1619999855524; 
 Sun, 02 May 2021 16:57:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/26] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Sun,  2 May 2021 16:57:10 -0700
Message-Id: <20210502235727.1979457-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ee6cdfec71..fb7c927fdf 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -812,8 +812,14 @@ static void tcg_target_init(TCGContext *s)
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


