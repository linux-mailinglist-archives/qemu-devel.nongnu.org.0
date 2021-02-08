Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560931291B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:58:57 +0100 (CET)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wlK-0007aT-MI
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRb-0001Yv-83
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:32 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRX-0005rP-Kg
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:31 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o7so9279778pgl.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+UfUeTWFJ5sSlDyvmwmN/rqHNhQrzPFRwjNfVSoaYw=;
 b=IXGrDUA1pZH779Z/goHF8ay7vhc+6dTf7Z3JoRRYoQ8GqNrPB8nrs8lvfV9OXOGB0n
 8pXFOL1rbwv47vQSvySPAy+nJXdpDYZgH7Jt0YhNm9iapUjpDiCBq7Cy+A8IxcvxBd7R
 0X960XxDucO1SwxVjSS6nvIozEUgxm9/A51AREwe8t3aU9Ze0O0jdwZvbdP+zwVWWc9/
 VFYB1iAjaN6aY7c7grKiVKTghX2aKOv/aaXV0WJXKlYoParfMlfsrByNqLbKiC0AJWpw
 9w3TEIfq/iCQwFERQCJfI0K0biJWol5yRLqlrMbQh4Bx4vaXhHV5jbHZVTvvp3L6E3w1
 XFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+UfUeTWFJ5sSlDyvmwmN/rqHNhQrzPFRwjNfVSoaYw=;
 b=YhwZJ3lqyi3vTP7kZYvUSarEm5vddW6oZFLmTgrYZsOK/nKagMCSRTgalLiX5Gbowi
 YLlnzz3JECl80nzwMa8SLm55I5cu0N/CF0x6982zvp7DG3pufqngggAH6MzLAH1einVF
 oCGKl3uEw7LyYyoOocLVXr0fUe6ouu49+2Kl4a6xtI/sEVgNLljGvtK722M7I/zEp21Q
 hE/v+o3X/nqENYuNheMkU3VWefHQkqWP7xic92OwUjc2c3ebCVjmMTfTl7AaPARhV9/h
 reeSA74QBQQHBDEu9+Ab5qyjNYKSlRodnYf2hDHPoadV0kXPBFS1TAOaL2osenzFr9SJ
 hMiA==
X-Gm-Message-State: AOAM532i1MngIs09YJ4tCjDQirWd9eRdeRStL6K8elZGOu55iZYI2iIS
 rF16UbWBhGX4DbVurX4pLB2ux9RUcDQyWA==
X-Google-Smtp-Source: ABdhPJyRgpl3UgkkOBZE0Evs2TB9bMuPwklWVBdBFSYFOHyIMR2BPvISv6Yh58IdR9IEvH4gNTkpkA==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id
 n193-20020a628fca0000b02901a939bced37mr15863561pfd.61.1612751906360; 
 Sun, 07 Feb 2021 18:38:26 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/70] tcg/tci: Reuse tci_args_l for calls.
Date: Sun,  7 Feb 2021 18:37:08 -0800
Message-Id: <20210208023752.270606-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5cc05fa554..92b13829c3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -452,30 +452,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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


