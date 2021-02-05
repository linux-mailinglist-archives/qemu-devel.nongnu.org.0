Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F7311670
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:13:17 +0100 (CET)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AHs-0005HJ-En
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2y-0002TX-FR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:54 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2r-0003VL-Db
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id fa16so3998452pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpWGR2pzYCq2nhr0I+4v9m7InqBQYpMtzCuE7YrrkGg=;
 b=NSZplcO+8PJeXUTBol9psnMFi5eU5iK/eBhSnx/24VTIe8RVlRQcM9qUUZzUPVIJES
 bBwGwjwZxzcqI6h2eeh0NskIylD1ryqKjM16WoD6wtQNr337kuQt2JJzHSwVMga4RKW9
 rahJBhuYspwT1Zb8ZysGJi2vH0Sz8COBaDG1rLJV08ELu2y5WhfDSE0B3h9alzfz/ZDr
 D6RM/coevpbwkaP054WXQCdtaxlsWvN7Qd8bnZ1glS4pXoz1rcmqjiyBnfvuTUdCpPv7
 dMStcr/9OnDQmafy5QE7uK08RlW5kE0iCVHq+V6jIJepvM4/kKVCy4VRmh728dWvbWJM
 zO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpWGR2pzYCq2nhr0I+4v9m7InqBQYpMtzCuE7YrrkGg=;
 b=GT6otCo5ee9m/OOj94gZ9951kdNITuTqkXlXG8aZqaJO8I8lVYPbwX6H500WMCGXYL
 tPbPFVevs0JjdZ1Ju/iSG45ZKYja7+w0vEkvK9W+M9WTmMMa77XQsVfJkrnEZRit947e
 PhfvQJf0Ex7d/rA0OgpCCz1QnwFTt8xBienWbJ4R/Kf/dC8BIqHnjMpL2/FNhD/6k5q4
 tUhvgD3t2AwFMLSRVP+YaQPuXMzYLJr/PerXTcdXvX0zFYWOKrUx9QakZHZwKM0+nSnX
 QmrpbNrvCrDElf1a3a/XIMkQD01KYQ3ECX9u3Y7DWeDoE8lFLSMrNuzxHNZi63p5T8ky
 S2FA==
X-Gm-Message-State: AOAM530xDFBOPpy3BEQkcSy5dyVI+xtkNTUikko9pfPVOWdHwaKX+EtI
 t7RTwoUSC9camLpc5NqkECQVklnIsnqOLV6f
X-Google-Smtp-Source: ABdhPJznWhl8o99lYZNA/Qtp5I/CZeoT89jKNgZ6QmPNIMAniIarIaRszRJzzr5Jl17hdq1JlJrWlg==
X-Received: by 2002:a17:90a:46cb:: with SMTP id
 x11mr6251365pjg.124.1612565863753; 
 Fri, 05 Feb 2021 14:57:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/46] tcg/tci: Fix TCG_REG_R4 misusage
Date: Fri,  5 Feb 2021 12:56:31 -1000
Message-Id: <20210205225650.1330794-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was removed from tcg_target_reg_alloc_order and
tcg_target_call_iarg_regs on the assumption that it
was the stack.  This was incorrectly copied from i386.
For tci, the stack is R15.

By adding R4 back to tcg_target_call_iarg_regs, adjust the other
entries so that 6 (or 12) entries are still present in the array,
and adjust the numbers in the interpreter.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


