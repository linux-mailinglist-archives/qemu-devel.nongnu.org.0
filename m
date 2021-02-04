Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8D730EA2A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:28:17 +0100 (CET)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UNU-00036l-OX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjN-0005WG-Tq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:49 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjJ-00040b-1l
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:49 -0500
Received: by mail-pl1-x630.google.com with SMTP id u15so904873plf.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+UfUeTWFJ5sSlDyvmwmN/rqHNhQrzPFRwjNfVSoaYw=;
 b=Z1AJygRCzzkDiuFD91cuO5BeHc8sRMeodW0JJ/c1QgGL4er58kxwmGV8un6+A6w3bP
 FWJHs4LU0GCsubebVrvzik6QvADmpANJaj9HW6KJJPnWkXZaC/+AS6kvhSU1glf4rdX6
 PhbPWCnwrE4miQNgPHpMrDGac2i2Ee2pQ7PEYYTXVgjFtl0vkT6GMbzW+Owz3y89orKI
 gtvjxOfN8N1ZyjUY5vl+gD8WAHT0g0x8ql2WeOYf0QkiM+O6RXIoOaVfMNzw6Mh8cKF4
 DFLPoLd4hPYrMQ7JebUpoH/YnVq3a3xzPOIDuT8MJFx6Msuplh9Z36Z6OW/4Uu/9mMe9
 2b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+UfUeTWFJ5sSlDyvmwmN/rqHNhQrzPFRwjNfVSoaYw=;
 b=CJgohCt/4MkmKtdFcbgZEKl8mZBeR+RyGvvvflW7YvqR/zrqigs6faQHx15uLTA4ft
 S+DVyGNZx8V+Y18kkGk4wbGK+70BL9tAXEFL7HZxK5oaAtJKTWm7qNoqUdijnxlMNhp+
 1AHaKCELGUHZDMCXrTDgeTSvHx6dibtn/qhPC1Rps6cElUY+8gE3KrupPqr69H+7rglf
 2VcsxHbEitNoPn2uAyrZNAIdqFTB3LhEUBd0/G6JxBqtueDloIeo2GLKJX8qfqJl/g/T
 m700H+ykxKt7JlYGmBa0KhYisG1fwylSQhPdMvw1R3SRFcKohr4h1fLoq1mlO6DpBSb9
 TW8Q==
X-Gm-Message-State: AOAM530wJP8geeGK6hJ7Ku8CzxsgQdpAa+q/LRn0yyV6wUEzKPyZ5Mp+
 XMi9zVAlNJejPTi9zrCidmPypGNLahSF64pJ
X-Google-Smtp-Source: ABdhPJz1DhlRv+nAFzLWLyVdBDpt7dAIcbg1YHZyo8WanJr6rCV+TgCy0gmN624uxieLW6WhUhAo3A==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr6031847pjg.189.1612403203505; 
 Wed, 03 Feb 2021 17:46:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 51/93] tcg/tci: Reuse tci_args_l for calls.
Date: Wed,  3 Feb 2021 15:44:27 -1000
Message-Id: <20210204014509.882821-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


