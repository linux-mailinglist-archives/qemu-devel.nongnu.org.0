Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC930E9FA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:10:08 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U5v-0008Cw-TA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tj7-0005Ks-Ii
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:34 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiu-0003wk-ST
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id fa16so337021pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTK4SJ5LYtJuHvuHu8AwQw2u8TQxf0ZzT7dsGBYnc0Y=;
 b=kePOshLbYGH7DlnSrh6q2+BxLTkAzaVnUfnvBxbMu11rWZNnm2hVdev2GyPL4CiJV/
 +Np8864tiZXPvGE3hTxK1qG8snvXhZltjWZ+Bzqnl2lVI7nCY0c3Xt6PqQsu44f8kGYB
 YEDg0mxtYrbiycHRm4lP/jE9IxzySecnxxwAkiSZAheF/IEcGDIj1idzMhh3hoilpIjm
 dfI+FKdSUacZcrRCwY5vgkQbJ7uFitV/zWlodcFPBYZ03tkHay6UYWppOEJJoqxstEuJ
 ClYCpFhY9ElVfKCQk1V+YEtZxBZeGjtrff+7oaldWVmatNXOoFrX+cnV4JW/ZA/XI624
 EnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTK4SJ5LYtJuHvuHu8AwQw2u8TQxf0ZzT7dsGBYnc0Y=;
 b=EWuepmu8Dvv+Sg358OiQZQN4Ma5jpR0+KHlxMhwm70uANDJWjL6+TWll5RtveH+Ulu
 /3pg9GVBu8dba9dZOT/w2kjc/GTCwLCZC3DTCV0D00qvI3wADAt2PzvW3vOyclFgn7+W
 sv3d2q5e7XZANubWlad7tC9BFIkZPMfyBfxWs0ROgh9aVZHw7pKjFeOVhs39b9KkpjWq
 5o4Tpo13rKAdDz9cG4ey+amvWUtUiayfRuovnfjt0tLm7CHVMvlETrut9ItIKmKWVf0u
 fmGbp+2ggS0GN3Pac3lukDZHyCOt3LBpNnRR1HP8RNGZMMfzbsDO2mL5nZn+rMhwrdkM
 6mlA==
X-Gm-Message-State: AOAM531rmWuPun1JFBTdbb2bq2SR8qsVvwoQrU64umaSPs6SfnrHrf48
 87RxSmMthHnJoIneZPaJlszpO/uEj2hbNLxI
X-Google-Smtp-Source: ABdhPJxiWk6mRMbUfz+0DBKOIJhVNaktFtQFqUA1m5uxBaJzd5OQmcFsSyn4PhmLu+P2DigJ6lwJAg==
X-Received: by 2002:a17:90a:4096:: with SMTP id
 l22mr4322871pjg.34.1612403179342; 
 Wed, 03 Feb 2021 17:46:19 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/93] tcg/tci: Merge basic arithmetic operations
Date: Wed,  3 Feb 2021 15:44:13 -1000
Message-Id: <20210204014509.882821-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
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


