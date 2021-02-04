Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9530EA18
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:22:39 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UI2-0004Tc-Lj
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjK-0005Sg-CK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjG-0003zB-Pd
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id s24so768508pjp.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjI7Jfr8LIthM/+Hr8pg5fY2MZ87PA6SSlhcAVNxWvA=;
 b=G4HqM0/mqxJNMm3fqDKPNJKEWL26cvA+6DWhVEsAnvZ7U1V5D0UDAsYgTW6j3pfQKJ
 AFdxcii/wAJPtx57GcTmqlsHWWhPnUnZbJ9xDz1MX1C63Br/tOg2GCsuYvV+d8k1PUvx
 dIRfEx1BHhQpTDTmRlXLhW/U+7gaWWJoUJH7iPAoTHNM065qKuH9iLV67zwQQo1iQulX
 LnOE4fmxpBwEHV0BacxOdVCpzx2txURrIyZt5lml3CWYGl4nI/y1w+Scxa+TG3oGwmgs
 1oGs1Oe3/yS5p0o+mal6tDvCG36cLpJKMRNwOVvqIZ2mNb7G8mCOHan/4nW3icPtvvxX
 i4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjI7Jfr8LIthM/+Hr8pg5fY2MZ87PA6SSlhcAVNxWvA=;
 b=LS+dL3R6WV27o5CnLuPO94YUF3kPKq+WLfmG7P8j/oM9q2e0SLqfLUB/8cI75e0zJN
 ZNcJdYBZ4goVWMP2IbHyApmI+q9C8e/VPB7zqME52XvPk4hy4xEz2mkO7Q/SrDz+BlT6
 kqEzSV8wfkpI2zyEiWpUpSm9nAxbWWi0xyV9Gr9GrNE/PrJt+w6LbXKIxYYqXa5pEx7I
 aFXufzjgYreNKtOyRb0wPGtVJxhy3urnHAT6cCCTVz8jPh3E8EZ+kB7qZNU4OcEozZhv
 MrOXHTFj66Tbr2mU3uM0QUTwzOZ34e1dgdd2DcYLmLrVD0Cvpbs1iTYh8c7647wBYnux
 QYYA==
X-Gm-Message-State: AOAM531nGqRmiH+UakvCsKqgee7+MAheuZbxocAe8uYpbdpwdZOywNtx
 ews8m4jWyOlqVFu0RSrWuJeE+pGxDWHVn2CB
X-Google-Smtp-Source: ABdhPJyafhQqvxqdqNAfOjG1dEx9+r430g09liiQIF/WvGujCYteWhgguE0oNt0UGrtseVT/X+ovMA==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id
 d21mr5756924pjw.228.1612403198876; 
 Wed, 03 Feb 2021 17:46:38 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/93] tcg/tci: Split out tci_args_rrrrrc
Date: Wed,  3 Feb 2021 15:44:24 -1000
Message-Id: <20210204014509.882821-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 tcg/tci.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8bc9dd27b0..692b95b5c2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -221,6 +221,19 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
     *c3 = tci_read_b(tb_ptr);
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *c5 = tci_read_b(tb_ptr);
+}
+#endif
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -400,7 +413,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        uint64_t v64;
+        TCGReg r3, r4;
+        uint64_t v64, T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -449,11 +463,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
-            t0 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
+            tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &condition);
+            T1 = tci_uint64(regs[r2], regs[r1]);
+            T2 = tci_uint64(regs[r4], regs[r3]);
+            regs[r0] = tci_compare64(T1, T2, condition);
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-- 
2.25.1


