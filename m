Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9731E0AB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:44:16 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTgF-00041I-Q7
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLA-0007cc-74
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:28 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTL8-0007DK-FU
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:27 -0500
Received: by mail-pl1-x636.google.com with SMTP id s16so4124349plr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q8ATFxOFO2yR9AaepzxKx2luv+FtTID7dtKlxe4pkRs=;
 b=BsYjuxPUDPsYndixf5IV+lLZygdkyphnJMX6g2ETbgope4z/6lg+c05tahz7nbnrtC
 9CONWuO/Dk0wgn6YUWA07pheFPSqZnBErANhoCjBbmFhupNgnH6zX87V4/oBh/mcHX+4
 aN/gB14ftGz6a5BxZAAd0/OepzSaICMzzINoSKnipl8ZaTivxyMrFPJC69o39m70Ktw/
 /QTCfzyEWoNNbqyRp5B/qJ413NR9E9sGobiKeRkuueXeHQKOk8+7ey6ivsczOHqpHfRv
 kQRrm2CVhaKd/L9wX/AMAUzwOLi96ZBu8kj3+3AOeNV9RcxrmvgGAUVZ6f9EE6ps4d0T
 1zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8ATFxOFO2yR9AaepzxKx2luv+FtTID7dtKlxe4pkRs=;
 b=uJOq5MRgm5ap+q6ofOLclqqXgh85sQ5yOYzv0l5XSzbo1KlZylGa+FvG8M9Pfq1vDN
 6ZWCqL5YHrrHFOBd6ReibKKQglNLmPs4v8PXsl88uJWjkcsM+2nQkNjTFDeulTE94HeY
 7KK239xcLeddJIK/HZI7uIh/ztBf2h/DQkyqaVA6vHq4g5xH5W9onFF2eDULDMuUwn0k
 5HtWrgnxBaTFrkbFc0wEkXS68vATGP6Br+kWEDolpOGYV/MbWgp2twHgVw2IbvToPMNF
 0hGY78TwtIU3tgPOJKOEE7p5MYnOo6Uf8wMBcTSNcFAjRS/wUKVtuuGdMXHOfZRLq/It
 Z2xw==
X-Gm-Message-State: AOAM533yXna6R2wJW3kBGqX0F0cHqwfy82no5svFCbyiaBFSP7GPMlb+
 AwXa5ylvIbqRd60JNthTslX5wOmVO18okw==
X-Google-Smtp-Source: ABdhPJzzQEJ1MzFOObgFzfQ+np7FFR2MkyFOesq1UlWVpbL3iJrxDL54edZfb6/uQCX2ZTE2AvXHhQ==
X-Received: by 2002:a17:90a:2c9:: with SMTP id d9mr526965pjd.67.1613593345200; 
 Wed, 17 Feb 2021 12:22:25 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/71] tcg/tci: Merge basic arithmetic operations
Date: Wed, 17 Feb 2021 12:19:37 -0800
Message-Id: <20210217202036.1724901-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

This includes add, sub, mul, and, or, xor.

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


