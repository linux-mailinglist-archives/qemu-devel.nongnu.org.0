Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EF32A970
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:27:23 +0100 (CET)
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9ju-0003tw-DX
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hb-00038x-0S
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:07 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HZ-0007by-87
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:06 -0500
Received: by mail-pg1-x52a.google.com with SMTP id t25so14355191pga.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5opNq1HXc5ZvZ4ePdaKdxyOS1mjysh0i6AOuC6K4OYo=;
 b=sqyPBjCoVxLbslvGCYHMNFiXINmIiAPZC90r3dIBeUgYK0IFBJoJZU7WXLYv2zTm9F
 OUfCo2hAwGfMqTq54zbFLZBF3cBUok/PXWDsTVws0DscVlqMzGhWtJ3GqQwoppJC1YH2
 W9aE3E6NX4NDMbjg/pCpeNZIAqvCnpr1cxNaOwi/9ccidwpvRBLJcSvqetscWUeyStT1
 Z/4VJVIfBFndl8j+VUZpVGRrOl3aj5MU+hnN7/vXJvxydXik140CJFryOVUxOzTxDThR
 7dWqQV1nJd75CuZWH3uDVVACF1+qmMdDtyE4PXqCukCDrSpInC3H/DBHlBh9khbrdeX6
 Q6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5opNq1HXc5ZvZ4ePdaKdxyOS1mjysh0i6AOuC6K4OYo=;
 b=Z5pzjX+lClWLCjRPpWWosxfhInFEFKYUcIui9ZDHE1gYPjj2T8hEpO9FBs7dyF+x7U
 MlXjfYMbZIda1yj6paX5I5CjWjrHYH16pQnKTe4Il9rXcFavm48IElT05pRqKt//UYTM
 wfjHLo/KQf/G+5C9zyaGaCul6sh+wLRH78OMUvH2ty1qVdFn/ve5H75hu9QKv4D93pIs
 4FuQcIvMgNDpdJkRH39wTZuBjiju3LkYZAwwjrkV4JjpEYIy/dWx5S99xgQxirmz0yRJ
 woiVjJflPGh6D2ykoyGqwZt5MgUtfd/3vvEosfLzJ1PNk6IKIjk3ahvw5dihZxhknGYj
 oTJQ==
X-Gm-Message-State: AOAM5314OE+9ZzXo1OsV9zAVuj+4LUmigjdqwXVND9kTgXsv0c/RT1eO
 zvfcTZhxhx74EG4kC13nSSHLjdU0/j+/yg==
X-Google-Smtp-Source: ABdhPJyZrlJDeeEsG6r5LMMQaGTBIQgd6M6FCWk6C5o5G3kfLeMXGw3bOD4EcRyWbdR+g1FaHEGK0w==
X-Received: by 2002:a05:6a00:1506:b029:1bc:6f53:8eb8 with SMTP id
 q6-20020a056a001506b02901bc6f538eb8mr4318869pfu.36.1614707883903; 
 Tue, 02 Mar 2021 09:58:03 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/27] tcg/tci: Merge basic arithmetic operations
Date: Tue,  2 Mar 2021 09:57:33 -0800
Message-Id: <20210302175741.1079851-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes add, sub, mul, and, or, xor.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 83 +++++++++++++++++--------------------------------------
 1 file changed, 25 insertions(+), 58 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 9efe69d05f..d0bf810781 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -451,26 +451,47 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -495,24 +516,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -695,24 +698,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
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
@@ -737,24 +722,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


