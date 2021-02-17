Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A907B31E09C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:38:58 +0100 (CET)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTb7-0006s4-PF
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLV-000882-B2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:50 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLR-0007KU-KH
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:49 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kr16so2149571pjb.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxHyIf5IQ/iHhFCB4XIpWAKun69n1MIgbHeQ1l++JBg=;
 b=zgL9YjY/NmOLgw/h9uXS1b8CLBepEkwTqLrrBE/DrJUAT+cFO6JVxn9KnBTdC8/YFk
 LZIFQW27dYj/Fx33DLW2c3L1kVaIOJPKOYV+wzRTj0xwc+CxMUXM7PuMuK2lX6MP2XF7
 FdRugLj9KQB2QQRbTKvsYPbOlk7uWzIbDXH3oBhYvMFBUslzQPC9WbY4gzExgaVONDLD
 KcsQrQ7R+KuGIle9mt2G/w4HbYLKZ9Q2VAZDfM43TQkFSoriQOh0qtE22YN/qMN+DUgG
 OFirM1GaRczv2/OrwBtJ4kL8EE36Aaj0hTinnV3FjTjt37bhJvbKfBajDIF6DbR9infd
 Jfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxHyIf5IQ/iHhFCB4XIpWAKun69n1MIgbHeQ1l++JBg=;
 b=o/EzCzAf/jSCRNu3AnGnARAHAW75lN7vzn0K6gbEQbt1KV4s+hCqPGoj31YXJUWJDx
 xRyP4SzAA0eiavs8SIKBrd2qK9FIBwE7S6bnS+yNe6atoZw1H6T28PrQqGqVduOwrPM/
 xdz/IPMYip+SwAXB9vq8kCS0KrvAMwxWQd41bxztyI682aP7NKNYCclmg0jSYYe63XbR
 FI/BRHKi9gkCXiidZ4xeGk9Ujrk+Re5/h8ZMTvi8lSnQq+8mUm/voWxiAEkREgUE9nuA
 m4oVoV1zChCpu9SsQ6dUBxNhKpBlD2DM94RnFTuzjvw5/hLd7G6SPQjWNwyl6tH97SsG
 xJ8Q==
X-Gm-Message-State: AOAM531ziML+LK+NHLcq19hF3isNW8pVxJLcMF3RIuMi6aEUiwp4+uuX
 ubFDPYCvfS8yV678bDm8HEVtvlf5y0anpg==
X-Google-Smtp-Source: ABdhPJyG7/+Wc1bZHlUIwRwEoMdWCClEuIUnxs/hLD4u7A5tm+XpophLo3cZ95B+Dg/qC1t39jopEA==
X-Received: by 2002:a17:902:e884:b029:e1:50bb:683 with SMTP id
 w4-20020a170902e884b02900e150bb0683mr941194plg.61.1613593364173; 
 Wed, 17 Feb 2021 12:22:44 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/71] tcg/tci: Split out tci_args_rrrrrc
Date: Wed, 17 Feb 2021 12:19:48 -0800
Message-Id: <20210217202036.1724901-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 tcg/tci.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 6e9d482885..558d03fd1b 100644
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
@@ -383,7 +396,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        uint64_t v64;
+        TCGReg r3, r4;
+        uint64_t v64, T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -432,11 +446,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


