Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6E31E0BC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:48:21 +0100 (CET)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTkC-0007Zn-Ng
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLY-00089w-Ni
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:52 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:32805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLW-0007Ll-I6
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:52 -0500
Received: by mail-pg1-x534.google.com with SMTP id z68so9232705pgz.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Vh7s6UroDOBSVmOQabkt7Snkgw14XUdmLA5IgFSZHM=;
 b=jXwm0HpXebmm980AAmIIi1WZXgXBDxKnwoPo9ayhrYZE4EiJxtl49Uft1pRryxIBL2
 7L3OZIXs93o5WD1kKdk8QmOdxAQMy6pnYoIq8GMoA3CcA71OpDwdeqffSrbwD+2idXnA
 dVwoHGSqK49kCEUjO6nWMT9sMgaxVcg9cOx5bNh2OA8ikYecRJgMXCT/cQs+twKvFBgu
 UL22WViRe7VZ5ZAD6uZvSk3tqpJXsVckEsn47aQZ+LJ1/fB49aktmtOrO9d+lrY2RiFx
 y7nrGBcEdFMCO0vxCunKLWMa3DyoUfCDrsN6F9b/i+0okmYNV2j0xYSrg1Z60zRlelQz
 kgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Vh7s6UroDOBSVmOQabkt7Snkgw14XUdmLA5IgFSZHM=;
 b=ey9FmQxyYsfGHV8EpwkStdG/kftYF25PdBWD+9HmdQREDmpLjKOdKlK/pLF3bu9yUp
 5vftXe0MGKLFTbw2copyliEJkidLoh1wWdditX47Ojf2HPRiKNZRL4Q/LGWae0RdjEzb
 j+tl6ltjVX+FNjkPBIXXYmqHsmVNlk2gp2nQ7VD3Y6Ejzd9MVtXadfZS2pZtr1R6NkW2
 hupVr01gGFOnhiPGAtHgq9zrxupR97x17MNopPDiTVBHEaWPirTk6xhsSaeKpQy69DI/
 YOYnJHItwGSbKJzoo+Ex2PgojF2mAW18D3Qpe5XOkyYS48KXP02R9dniUasCa+2N2Zjn
 3uPw==
X-Gm-Message-State: AOAM532zDoZ9eUW3KbEHAvS+7QoVF8rh9apLJRTFyTUXGFBWIBkIUuV6
 WoJvTgxCTbRarTIKB1CY8/tOFJEAPQOBrQ==
X-Google-Smtp-Source: ABdhPJz5xCmqEb5Gz4nBa49Ih3lg/RquOUhmaaEv4zxm8Tb8JgKRRDvUtuCQE3n8wJFogwiXPbiQjA==
X-Received: by 2002:a65:5a09:: with SMTP id y9mr915946pgs.243.1613593368638;
 Wed, 17 Feb 2021 12:22:48 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/71] tcg/tci: Reuse tci_args_l for calls.
Date: Wed, 17 Feb 2021 12:19:51 -0800
Message-Id: <20210217202036.1724901-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cfbe039fa6..066e27b492 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -435,30 +435,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            t0 = tci_read_i(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
-            tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
-                                          tci_read_reg(regs, TCG_REG_R1),
-                                          tci_read_reg(regs, TCG_REG_R2),
-                                          tci_read_reg(regs, TCG_REG_R3),
-                                          tci_read_reg(regs, TCG_REG_R4),
-                                          tci_read_reg(regs, TCG_REG_R5),
-                                          tci_read_reg(regs, TCG_REG_R6),
-                                          tci_read_reg(regs, TCG_REG_R7),
-                                          tci_read_reg(regs, TCG_REG_R8),
-                                          tci_read_reg(regs, TCG_REG_R9),
-                                          tci_read_reg(regs, TCG_REG_R10),
-                                          tci_read_reg(regs, TCG_REG_R11));
+            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
+                                           tci_read_reg(regs, TCG_REG_R1),
+                                           tci_read_reg(regs, TCG_REG_R2),
+                                           tci_read_reg(regs, TCG_REG_R3),
+                                           tci_read_reg(regs, TCG_REG_R4),
+                                           tci_read_reg(regs, TCG_REG_R5),
+                                           tci_read_reg(regs, TCG_REG_R6),
+                                           tci_read_reg(regs, TCG_REG_R7),
+                                           tci_read_reg(regs, TCG_REG_R8),
+                                           tci_read_reg(regs, TCG_REG_R9),
+                                           tci_read_reg(regs, TCG_REG_R10),
+                                           tci_read_reg(regs, TCG_REG_R11));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
             tci_write_reg(regs, TCG_REG_R1, tmp64 >> 32);
 #else
-            tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
-                                          tci_read_reg(regs, TCG_REG_R1),
-                                          tci_read_reg(regs, TCG_REG_R2),
-                                          tci_read_reg(regs, TCG_REG_R3),
-                                          tci_read_reg(regs, TCG_REG_R4),
-                                          tci_read_reg(regs, TCG_REG_R5));
+            tmp64 = ((helper_function)ptr)(tci_read_reg(regs, TCG_REG_R0),
+                                           tci_read_reg(regs, TCG_REG_R1),
+                                           tci_read_reg(regs, TCG_REG_R2),
+                                           tci_read_reg(regs, TCG_REG_R3),
+                                           tci_read_reg(regs, TCG_REG_R4),
+                                           tci_read_reg(regs, TCG_REG_R5));
             tci_write_reg(regs, TCG_REG_R0, tmp64);
 #endif
             break;
-- 
2.25.1


