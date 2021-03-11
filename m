Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB8337619
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:49:31 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMd0-0004Pl-EJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUB-0003IV-Pn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:23 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU6-0006I2-0P
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:23 -0500
Received: by mail-qk1-x731.google.com with SMTP id 130so20748595qkh.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Vh7s6UroDOBSVmOQabkt7Snkgw14XUdmLA5IgFSZHM=;
 b=vPz6sr4tsse06jHrHUvPJ2qtk2vcx9puREW2YrQqqK74fltO4BBEJL8CSbUX8/df3h
 aAjEm9SU3N3UcztnWSCugFYTMp2IANUjXV4MvUjq4lojw7QbcPLETOOpn/XmYwyu4Ou1
 o71ZyVAEt1j0bAMhgj1WOBGqAnCCsZINKPmbNhcu0ByLDop+CJwAklci0B6Mm9f0zC/C
 L6e/e1hqiI+D+BaVHbfwG/x2zjYX5VLI+upq0fOFgKts6hurIRvoxjIVgJUY+RgQUXAJ
 T+0Ra2wn+JLa23JhW2ad1w2EJEyH6Mf5WAdHzCRlHmxstKEOEIqjueTu4LGiX019M8/Q
 hDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Vh7s6UroDOBSVmOQabkt7Snkgw14XUdmLA5IgFSZHM=;
 b=k3fuhA7v4NO4FguGEBZo1nIyW12Mts3HPOwacDPVcrGvY2Et38A+Nwx35jqqZMyz7D
 Bp8IMRQzUlf0/O9gXJ4dRlOu3r0xqKz7h1G4ohTMkwuZjDOBlPQGn38/4by9nwJUs8d6
 zaiU6H9etpPFtSfPv1S77DEJizKAKEGvjO4ltNpBnkeHbaTiGCaEz0JS113m0r0dvSYJ
 Ifrq+SmQdcoiGyaf9jg4fPDf9qwQwF+C/ab6XnUJHZXX//y51gU9JiKX2lbOtAcvDH4F
 8lUpTjoMkzqGZ4Ty/LGeNzX3HwB7HFB1KSOXVeo9WiynhU8mrxaJWDRgM4eKibJ0qcEb
 p/cw==
X-Gm-Message-State: AOAM532g8VxRaKWXQkwRYahlkrWtqK8T3VxrtAqK3tcpfSLuB97Kq6e7
 FKwzlaVUfSDok6HR2Vnocd46VVmsTh9Z27nv
X-Google-Smtp-Source: ABdhPJwBYh1BKruyoxYc1ELB5FPo1rlBzjtiGqcYb4nlXBu38Tez1juxpDFRFWSwrH3uSH4YCLlAVA==
X-Received: by 2002:a37:30f:: with SMTP id 15mr8049887qkd.494.1615473613577;
 Thu, 11 Mar 2021 06:40:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/57] tcg/tci: Reuse tci_args_l for calls.
Date: Thu, 11 Mar 2021 08:39:12 -0600
Message-Id: <20210311143958.562625-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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


