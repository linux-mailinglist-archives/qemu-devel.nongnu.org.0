Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D630EA0B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:18:58 +0100 (CET)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UET-00017w-GH
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tin-0005B9-BM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:15 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tid-0003sM-Sp
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:13 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u15so904047plf.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jQllLPStMSpXHN7NTbXqzAr+6+LQfKhn+prBrsPItko=;
 b=T7gx58sfcOcVq3/jelk2LUWq3qrkCIfnRtVKOXZMyibprPGKIvN5uVRVt9A3vdnonF
 i+SKczPklN2tuolzwPWwgzGJ49sbRoK2W515hMKauRkGOrp60A6CHZLKPJvoPExdIh9T
 NyYzVRoMEt27boiANqqY8pbGv822rGEQLv2t61YvwF+78YqqdaUs96hiEQfxnueVzl9E
 Bb3Fonaw34qt086HoGjfp7Q+ZTMmb/49rxnjwH27HSzAI2dWTqUiHe12OhOGIJI/ZubE
 io+5N/I7TKJUhzE68/bhdVuJ4QqYghVLr22x8mJCNK6YgrDcG1XDV4nsVIcusTRsMvxt
 QBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jQllLPStMSpXHN7NTbXqzAr+6+LQfKhn+prBrsPItko=;
 b=PWMw3eC26PsN7mBhiNoryUjkf17OC9EKFQt4Oif5Qh8NLivUWiHYJNrDjatE0Mc4Xx
 uWhTO+sKyJ+bCKqvIZ0Hpq9rPCrgqfRlMpTmU7yVxtoshR7Ca22VwJ/L5896Beuyl0C0
 yJ0nr5TzNq43wRCmmE0pWPNAaHK+0YuIXORD8E9NfDKr5IQsaTwe+QuTJ5t153i4HU2c
 MoCcoS+X+kro1JD3qwWXxApHBUVt8XXfM7rNnGr7e4tuR+qShoQMsGpeaULZmtyvbmug
 bV6EDPOVkxjiEjWCnoTU6PO5OooT4fGkqUv0L+donrSPL4sdUt4G+XFdO11nhI7zRQhx
 NkjA==
X-Gm-Message-State: AOAM531z560PejwkgqYkLxaAntpvoaIGO4MAG5CLmb5obTThpH8kwhZb
 ehaJXqHdNFwURtrYBWpSKkrwKo1oNRfTDXBA
X-Google-Smtp-Source: ABdhPJxvsOPG3Wcb1hDAwJ53+UtsTLidPudyox5M5M7fbjGf/cA9bHpQ0oKWAgCXmZ1w5K32mwuFfw==
X-Received: by 2002:a17:90a:ce89:: with SMTP id
 g9mr5786744pju.42.1612403162730; 
 Wed, 03 Feb 2021 17:46:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/93] tcg/tci: Fix TCG_REG_R4 misusage
Date: Wed,  3 Feb 2021 15:44:03 -1000
Message-Id: <20210204014509.882821-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

This was removed from tcg_target_reg_alloc_order and
tcg_target_call_iarg_regs on the assumption that it
was the stack.  This was incorrectly copied from i386.
For tci, the stack is R15.

By adding R4 back to tcg_target_call_iarg_regs, adjust the other
entries so that 6 (or 12) entries are still present in the array,
and adjust the numbers in the interpreter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 8 ++++----
 tcg/tci/tcg-target.c.inc | 7 +------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e0d815e4b2..935eb87330 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -511,14 +511,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                                           tci_read_reg(regs, TCG_REG_R1),
                                           tci_read_reg(regs, TCG_REG_R2),
                                           tci_read_reg(regs, TCG_REG_R3),
+                                          tci_read_reg(regs, TCG_REG_R4),
                                           tci_read_reg(regs, TCG_REG_R5),
                                           tci_read_reg(regs, TCG_REG_R6),
                                           tci_read_reg(regs, TCG_REG_R7),
                                           tci_read_reg(regs, TCG_REG_R8),
                                           tci_read_reg(regs, TCG_REG_R9),
                                           tci_read_reg(regs, TCG_REG_R10),
-                                          tci_read_reg(regs, TCG_REG_R11),
-                                          tci_read_reg(regs, TCG_REG_R12));
+                                          tci_read_reg(regs, TCG_REG_R11));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
             tci_write_reg(regs, TCG_REG_R1, tmp64 >> 32);
 #else
@@ -526,8 +526,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                                           tci_read_reg(regs, TCG_REG_R1),
                                           tci_read_reg(regs, TCG_REG_R2),
                                           tci_read_reg(regs, TCG_REG_R3),
-                                          tci_read_reg(regs, TCG_REG_R5),
-                                          tci_read_reg(regs, TCG_REG_R6));
+                                          tci_read_reg(regs, TCG_REG_R4),
+                                          tci_read_reg(regs, TCG_REG_R5));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
 #endif
             break;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7e3bed811e..aba7f75ad1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -181,9 +181,7 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
-#if 0 /* used for TCG_REG_CALL_STACK */
     TCG_REG_R4,
-#endif
     TCG_REG_R5,
     TCG_REG_R6,
     TCG_REG_R7,
@@ -206,19 +204,16 @@ static const int tcg_target_call_iarg_regs[] = {
     TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
-#if 0 /* used for TCG_REG_CALL_STACK */
     TCG_REG_R4,
-#endif
     TCG_REG_R5,
-    TCG_REG_R6,
 #if TCG_TARGET_REG_BITS == 32
     /* 32 bit hosts need 2 * MAX_OPC_PARAM_IARGS registers. */
+    TCG_REG_R6,
     TCG_REG_R7,
     TCG_REG_R8,
     TCG_REG_R9,
     TCG_REG_R10,
     TCG_REG_R11,
-    TCG_REG_R12,
 #endif
 };
 
-- 
2.25.1


