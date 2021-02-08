Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A3312910
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:49:47 +0100 (CET)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wcU-0005Zd-Ia
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRJ-0001Iq-T9
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:14 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRH-0005kv-IF
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a16so7014295plh.8
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b0OZ8HZNEJw4TVjXNMfY9ukiBorqmrftQz6h6YJ1/P4=;
 b=hFk2RcxsCbAnQ8rgRutcBjlLBtpYCeFzCIpyow2O6uZ3rnQ9f6aS2bpiz19BvAWSyb
 ebT+8aX8OIgb2DOMcO84AIVbHQjtWkIvrfeLXqfsHMix8axRrT+vTmUNpCJbRM8NMgo1
 o9mW5z7wd+hIEWqP+AVe1JDwaKIcoRPfsRgdKsy9BCz6c+NQfmQMkgcVF4dEqxylV/yQ
 lPRpf2529t2H9qXFIRL6qD4uXfMEsEuFZTV4s3Ce4BcfriisrxvA7IwiIf4aYs5vMVy0
 YwT5XjOM8mcEhMOAt5foqB/+JJ9y9Xe2WaMHoniEiAkPbPNfwBXndEw3s2KuNCSO/umh
 IMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b0OZ8HZNEJw4TVjXNMfY9ukiBorqmrftQz6h6YJ1/P4=;
 b=TWCm8hMx/YQBbj0WB33pxLqRthrksSEwrb3TV/y+D+TC4wJQO36APFD6QCzTARvPB1
 ytiiWUUuMroSA5tC0wmmd+q3AornnYRjz8Oj7sHrKw+P7O4upZE+EY46BP1m6NI7dd7d
 xeEUpSzznDiYqiD3wAkT0dApjX/Pjto20B8tfafMfqnL8S22G6slEW4U//WSdPh94ZY3
 xuldtCeX06c55FCEQZncfyW9YKtIayBXqjF5QDEega6iarA/a4Rdu308O0ZsLexwdj/7
 89P0FjuOZ2Jo0VruVhxGbRikvPEjoIa8PK5cEoYqKxcpdMQCrr2RSIMohfwNRIgeXcSZ
 GiHQ==
X-Gm-Message-State: AOAM5324KCCSQakhbs/l9lgSAZ3tVGHgh5xpket8qcEabO41Yn1oSxiF
 RSSFl0YofrjsiMh2abLzA94x4PvXU4as0w==
X-Google-Smtp-Source: ABdhPJzzHnnCp+VOrBXgb74JGQGNFefO42dsEuxpYwK6unjr72D1+cSw1KvSm9XqW8pKaEwcvJNH4w==
X-Received: by 2002:a17:90a:7343:: with SMTP id
 j3mr9665566pjs.169.1612751890352; 
 Sun, 07 Feb 2021 18:38:10 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/70] tcg/tci: Merge extension operations
Date: Sun,  7 Feb 2021 18:36:55 -0800
Message-Id: <20210208023752.270606-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This includes ext8s, ext8u, ext16s, ext16u.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 894e87e1b0..cdfd9b7af8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -624,29 +624,29 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
-#if TCG_TARGET_HAS_ext8s_i32
-        case INDEX_op_ext8s_i32:
+#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
+        CASE_32_64(ext8s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32
-        case INDEX_op_ext16s_i32:
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+        CASE_32_64(ext16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext8u_i32
-        case INDEX_op_ext8u_i32:
+#if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
+        CASE_32_64(ext8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16u_i32
-        case INDEX_op_ext16u_i32:
+#if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
+        CASE_32_64(ext16u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
@@ -796,34 +796,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext8u_i64
-        case INDEX_op_ext8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext8s_i64
-        case INDEX_op_ext8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-        case INDEX_op_ext16s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-        case INDEX_op_ext16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
-            break;
-#endif
 #if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
 #endif
-- 
2.25.1


