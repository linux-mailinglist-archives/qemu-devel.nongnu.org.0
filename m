Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130D31E0A3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:42:59 +0100 (CET)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTf0-00025J-DX
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLd-0008EL-Rc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLc-0007Mx-42
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:57 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so8022750plh.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWt9l+M7f3QWN4u3GyxAdQRX+QI3GedTTpv25vEiGn4=;
 b=GFEdAIwc9QKIQWZFi7QTxwXJ9lUvesqlViPDzhUTUIzYSWx0QlqzWLDK5Ps2ViBixg
 xvuLU7CDV5d74iwz3Gpnz9VbeCo1bSH4Nt91bbbOioZqB8MQascKVFFL+f7+/b8tLk9j
 bjks3uIqLpHU0L8txfavvIQgPeqaipqiiHoBFyGFVY/gXgWA5nRRMjBV2I8I3tg1dbSh
 bVa6Zm6bCo98TGHA78Y7q1obVINo8GbKii5OYQc77a+puhuJUI0YKWSOwHRWCKI4GT3U
 kRJmSvPvZfRXAlYK/SUeuRkgewOG0BxqLi5ZIF8YseaWXi3WQeejVMPwrnGUM3KD1NKn
 eaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWt9l+M7f3QWN4u3GyxAdQRX+QI3GedTTpv25vEiGn4=;
 b=qRwfGiQ09hxPrHMjbydu1R5LK9OLhmXLVhP54iyjNtt2q2lTLe6HQSFqXzGcuVv/3b
 6d3HGa3Qt8E4sxl1jRDWMCQDnLz6y5mI+b5f4Ox4+WBI/GiF7yQPugVa7xOb2H3isSQ8
 y89PLVbw1CfKkYKK1c6i7HH/B7OuEOCgKkFzShTESlvhmRefBzyKPUPs+cn7qvROYgse
 snJD9EXcNcSem8G7Dep1vodX390yS6UON2UeFEDF2+xGsYMebMfmeRsvBYGlL/MvwT7O
 7X1pTiQ7HuwFQUm5BKVhtwqGX2fogJilfUiWjsg8txOozNPIi+neOhb9v1CG+nHK+Aob
 iY8w==
X-Gm-Message-State: AOAM530s2Hv0sOzH9/n8Pb2/072bs8e8GlIAWg0b/bM0kaht88EN5Gxq
 7EXBoyB8UnOYqHjOWAZ+XdM+6CoOFJE84A==
X-Google-Smtp-Source: ABdhPJwNMtksNF88YyPHKMKrkVAZRwWZJCPaJR/Vv+PLBJk1JmE5yMf0WP9cxRmug3S7c9n6SaA0Ow==
X-Received: by 2002:a17:902:eb45:b029:e3:99ad:7fb9 with SMTP id
 i5-20020a170902eb45b02900e399ad7fb9mr778297pli.24.1613593374905; 
 Wed, 17 Feb 2021 12:22:54 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/71] tcg/tci: Split out tci_args_rrrr
Date: Wed, 17 Feb 2021 12:19:55 -0800
Message-Id: <20210217202036.1724901-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 tcg/tci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8b38687d9a..10f58e4f25 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -237,6 +237,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrr(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
@@ -659,11 +668,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
         case INDEX_op_mulu2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp64 = (uint32_t)tci_read_rval(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
+            tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


