Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCF31290E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:49:37 +0100 (CET)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wcK-0005Gm-BO
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRM-0001Oe-Ae
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRG-0005kn-DT
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:16 -0500
Received: by mail-pf1-x429.google.com with SMTP id o20so8785379pfu.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTK4SJ5LYtJuHvuHu8AwQw2u8TQxf0ZzT7dsGBYnc0Y=;
 b=yY+M2DBVqN7G7/N0ierStD/e3CHeouNVaH65ToWfywhl2JB9DqWzOhDeVsSzKJzN2S
 FgQYusjqoIURH6Z3/XJyD99fS1u1P8bVtZNEpRQti8B32UP92EaIen8vWqVCmwDZQn8H
 ByJY7aw2B0EvxZOeIOlc8CmLTfrno7bBUclJ8vVZJDtOLk9X1YVbMEShHo7zy2r95/zI
 eXIKl9Aq7S+ZX+YvF+WdU4i2djGYKo1XRDboYaUqCPLLH6QFQYTxdu4YrYPNh83YC8yP
 QhILm6Nmc4jK/13VTQlTC0vw+azmCrounFEypUu+5zuz14R2CoC9ZjzJVhV8+gr0JlPj
 CUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTK4SJ5LYtJuHvuHu8AwQw2u8TQxf0ZzT7dsGBYnc0Y=;
 b=XuG6MViTtTnvJ0EEcQPPdTHJzewWwW/2TjDUo4DYrlDu0cNzaqJoOTp5aHRgqy01SK
 atXeux3a24SRrTNh4RNiiJXqwbCQJuTtfGF6tv6R6kxC59WRjMGYFA3/xxmy82AJcBfF
 XM625tvcYfr/tah/4z7sABWcW92XiG65eadiXgx3svIPytvvXPpJmzqnwf2lVxIl+rtB
 HZAEjHbbno5iUrrO02sNeURUYxw6Fm5tOgXxiV3jdUOew+9xGJ4wVrjaSPXaqTs3qt8/
 UJZrNQ3I/fKA3HWlw6KXTf4THOljPqE2PZxZvyNsrgQkiINBXbqEYz+XSOGqMUvorw3z
 lFUQ==
X-Gm-Message-State: AOAM5306Rjfiv7c3zEZhPnOIUBKNn5KCX4IDvgGQH3/9OcEPTgzxAi1E
 Gsbp20VYA9E4Bu4HTRyrmeu6iThTbnEMmA==
X-Google-Smtp-Source: ABdhPJxmmhp3+/Hqf+2pyfVDogQvkGrkRuxLCN83gU+nVF7o/Lu+84SPKuYcjg8z8WCjKzFZQI0swQ==
X-Received: by 2002:a63:587:: with SMTP id 129mr4300992pgf.233.1612751889120; 
 Sun, 07 Feb 2021 18:38:09 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/70] tcg/tci: Merge basic arithmetic operations
Date: Sun,  7 Feb 2021 18:36:54 -0800
Message-Id: <20210208023752.270606-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes add, sub, mul, and, or, xor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 83 +++++++++++++++++--------------------------------------
 1 file changed, 25 insertions(+), 58 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0246e663a3..894e87e1b0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -468,26 +468,47 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint32_t *)(t1 + t2) = t0;
             break;
 
-            /* Arithmetic operations (32 bit). */
+            /* Arithmetic operations (mixed 32/64 bit). */
 
-        case INDEX_op_add_i32:
+        CASE_32_64(add)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
-        case INDEX_op_sub_i32:
+        CASE_32_64(sub)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
-        case INDEX_op_mul_i32:
+        CASE_32_64(mul)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
+        CASE_32_64(and)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 & t2);
+            break;
+        CASE_32_64(or)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 | t2);
+            break;
+        CASE_32_64(xor)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, t1 ^ t2);
+            break;
+
+            /* Arithmetic operations (32 bit). */
+
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
@@ -512,24 +533,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1 % (uint32_t)t2);
             break;
-        case INDEX_op_and_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
-            break;
-        case INDEX_op_or_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
-            break;
-        case INDEX_op_xor_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
-            break;
 
             /* Shift/rotate operations (32 bit). */
 
@@ -712,24 +715,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Arithmetic operations (64 bit). */
 
-        case INDEX_op_add_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 + t2);
-            break;
-        case INDEX_op_sub_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 - t2);
-            break;
-        case INDEX_op_mul_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 * t2);
-            break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
@@ -754,24 +739,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
-        case INDEX_op_and_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 & t2);
-            break;
-        case INDEX_op_or_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 | t2);
-            break;
-        case INDEX_op_xor_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1 ^ t2);
-            break;
 
             /* Shift/rotate operations (64 bit). */
 
-- 
2.25.1


