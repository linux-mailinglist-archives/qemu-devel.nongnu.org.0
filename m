Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4B312946
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:19:51 +0100 (CET)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x5a-0005af-Gs
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSe-0002sE-Jy
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:36 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSc-0006CG-VN
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:36 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gb24so934597pjb.4
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=eL56fdB7dyq1paBQrTFlHCnfzDliZniJhBuOY3z1M63RLg4nGFW2pZCxafS2V7kDbI
 /jK2HJthMJfLLCXmUDMYDw+PItlVbQWNj/5HpPXLA9JvqEaAoMac0xho7Mr+AG/RBeCU
 WcD+A2qBMwV5Zg4A7wAfPKwCQCuEUViH8OU+ZtbiCRZYZAkN3vu3+tTue/huHbbKHfVu
 1loX7SAsYPQGb88jSE1L007sGZUcXJxN7RdGh/1XHRoneG3loudrgZIQy6zocFuqItwy
 0tnQ0ogSN2pxyVpZGjNgxHjvQKRqxOpTk8bb4sUHvGcD/1Ftykb0YDY3YDDSXAUYiprl
 rybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=gwoZUoqMUW5mBENnj6wTOtug9lQEDKu7F/72ys6/D7LzhUTAcAx14sn/r72fkxHGOq
 6DBZlWjF0N6akROnEyz1/XB8PS24EQAMLv5yOjtz5E89nmkhKULxTuGRF/MM2hu3KF/4
 xTTtD1OadlbI+kdck87f0Rn1iayll/BGEYViOoJtT20wYD2IyU3NnqOGqaCIwhdlHovL
 sWW6EJ+bZsKztfWj6FVqI6UgvKeL4oQtb7vixgJRdSePeXkjNA/w8QV/qObcjwnrdOdF
 Rep20cZInyIMWDyU4L/gocXz5kO4FOe7cObd9rdrjg5HwF+QchXf3lg1QOmKincSIOWh
 CHcQ==
X-Gm-Message-State: AOAM533uDOufuRfCNYUjHWFt6tO8ACkdN8hso6ep96QqAQ8qzOeOXOkq
 crtH6qISfcv/Znx4BwazJ6C7ZJOawH6J9Q==
X-Google-Smtp-Source: ABdhPJxu48cQ3QZpw9ml+tipO7mMneeXUTlapQmt+Wg8x7YAzp1Ahf/ZqWY0lHxSsXwzBxXC2T+4pg==
X-Received: by 2002:a17:90a:e646:: with SMTP id
 ep6mr8310147pjb.218.1612751973862; 
 Sun, 07 Feb 2021 18:39:33 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 58/70] tcg/tci: Reserve r13 for a temporary
Date: Sun,  7 Feb 2021 18:37:40 -0800
Message-Id: <20210208023752.270606-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to adjust the offset range on host memory ops,
and the format of branches.  Both will require a temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 1 +
 tcg/tci/tcg-target.c.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 4df10e2e83..1558a6e44e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -155,6 +155,7 @@ typedef enum {
     TCG_REG_R14,
     TCG_REG_R15,
 
+    TCG_REG_TMP = TCG_REG_R13,
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
 } TCGReg;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2d2bd24d7..b29e75425d 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -829,6 +829,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


