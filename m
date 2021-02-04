Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B277430EA35
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:32:22 +0100 (CET)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7URR-0006on-M5
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjP-0005aA-H7
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:52 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjN-00042D-P7
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:51 -0500
Received: by mail-pl1-x632.google.com with SMTP id 8so873960plc.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAFEcBhH5Bm/1S+hn6Be2S25m9MyX50Fw2Tvsr0CL7s=;
 b=vRfRRsIUon+0UU2dXlgzfAEjFgukXsHoKg4a+hTih4VUa3QM7Fdx2xhumbcbVXJ/9B
 5nFiJjEjgVjp+4UwCnebniGWuDT4DT7TG+eDUYATrIfrmo18KiK3oVouddt9z93DzVzN
 SfIZQ40GLlS31cl8cIF3fs3kEw3ari/tbCoN7oZbvkjcS9Ifo280g7S1MxwKDm+s5JMT
 +jRK33h58hWb3Cjaliztvnjhc/g6Oor0A4txb8rSTIRsJLQy8arOEnp9now1uFhDqGF0
 u3wlist0uix5z7wNJv/VwvNvhWrJoZo9/38eyEWKj0GUcxyX2t7/T31mPg575n69XxkE
 J9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAFEcBhH5Bm/1S+hn6Be2S25m9MyX50Fw2Tvsr0CL7s=;
 b=pCzJ1upqPCwcBFY/yv67OZ34HhO/iaTbm3vXM9ydxn3F/H8/ZSH1NrgNXrXTOz3ArH
 MpLtVVCyUolhn9kfYwPbzBw34dQxkHX5IsMJj81v8qsCb9wLhzxKhP3DX+UCGgmBSvoL
 w8pcBluNABi5TA9TIdS6AvfV5eKDodRZE93xKB6EbvqDqtUqc2KYRkVXDCSWbHGa1Trq
 UImpDk4K3aTvC/OgQoK+k86H3wqWI8Lfa5xhg3F4YjPxlSXwl8W3Iy6QR0vlNDaDDMt7
 sZKi4+RvX6y3yCWru9lvMew0C9gXDyCQ5fWynTWGzYZDBQ7IOzeXmBc3oLdvFFshi2N3
 sBxw==
X-Gm-Message-State: AOAM5318WDbsCCY5pDkGDig8ZwfSO0tJgfYd7m29xxKU3mGUmR4LJf4s
 q/HF1UbbGvn30mFdKS6HDXfkyvv9vAoQlfNU
X-Google-Smtp-Source: ABdhPJzp2ya/dkrwliLOcNCdMVCNgvT4Q4ZB9OZMpGFj6n6RWB5d3k6WxTmAAszH94sZCgeVbAluIA==
X-Received: by 2002:a17:90a:8d13:: with SMTP id
 c19mr6080617pjo.179.1612403208515; 
 Wed, 03 Feb 2021 17:46:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 54/93] tcg/tci: Split out tci_args_rrrrrr
Date: Wed,  3 Feb 2021 15:44:30 -1000
Message-Id: <20210204014509.882821-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0301ee63a7..84d77855ee 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -258,6 +258,17 @@ static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
 }
+
+static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *r5 = tci_read_r(tb_ptr);
+}
 #endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
@@ -437,7 +448,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4;
+        TCGReg r3, r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -643,18 +654,16 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_add2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 += tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
         case INDEX_op_sub2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            tmp64 -= tci_read_r64(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, tmp64);
+            tci_args_rrrrrr(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = tci_uint64(regs[r3], regs[r2]);
+            T2 = tci_uint64(regs[r5], regs[r4]);
+            tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
         case INDEX_op_brcond2_i32:
             tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-- 
2.25.1


