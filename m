Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C4337636
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:54:18 +0100 (CET)
Received: from localhost ([::1]:52036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMhd-0003Xu-MJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU0-00037u-Nb
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:12 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTy-0006Ex-WF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:12 -0500
Received: by mail-qk1-x72d.google.com with SMTP id f124so20770485qkj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxHyIf5IQ/iHhFCB4XIpWAKun69n1MIgbHeQ1l++JBg=;
 b=OkynKqK7OqTuV7TUngpr9YL2Q0kPrZDrvFlHil1KqsiQLLXLF8J1AEQerXOzGaob0A
 WhttbDKvVOwOjymXCF7xQtvMCDu8Go8wWVQ7t9kDTlGhmsjHv8ew5vMev7Ai1RKPiRZr
 6HP6RsmsjZL8deQrSYeRA/tthx/3uNWbLy/oMMqDaBQGlLTQRU06MDJIMHEjvSenx59Q
 VDHVdyOIZWh78im9m+GMJfcduZfDUJUHmT3ccCvaiU/jzbwf404idubQB5GQip18xWNO
 Sw6ISvUbw5mB6/7HNaZ3E2urX8F7ndQiaC2h6vnFFHWc4yegPfPhUPESsLY2BIkqLrcC
 HBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxHyIf5IQ/iHhFCB4XIpWAKun69n1MIgbHeQ1l++JBg=;
 b=Wg3m+uPLIA2mnWae+HKyzL2NJCFeOTJwMxm4cf13CwldxR8C+YXcCtb/gnj9sZ4i/j
 orY3jzEQkDEO3K9Xyv6j60PuCUhXiAbqd981O+WZBNjiNrkHCWdh3eEN5H2XMNej1oPG
 xuH7mDNdrhT9rBJnvkg2srTEbtc5wgPbn9gC+i1zWWkkBh+tYWJrV+UEApaBqW2XkS/Q
 /zyeIjQSeeUoc7xRXLJlnGZA3d9qh720rNC9ew/YemFHSulyrMNsI5mRYC5D2Cm0YCGu
 DAnEljdvniEGiPNuLGvWlNBXIuJVrj8fB65ABC0s1EdQH1lm672w2YilRSfYbhjBIEwH
 0C5Q==
X-Gm-Message-State: AOAM53177LIXrPpcCv7XpRCcgZ8FZqvGGx303NUNzCaBUX9Zwr+T/s99
 h9t25Q6FdNx+Y0+G/J1slvkqcNCuszkRL75V
X-Google-Smtp-Source: ABdhPJzDdlQKJzjl9OMf/4iQ0TsGsw8DzmErDZUwBQa0OYC98UrRpapfI6OQZBt0JiFoo/gAy1X+5Q==
X-Received: by 2002:a37:b983:: with SMTP id j125mr7792349qkf.363.1615473610157; 
 Thu, 11 Mar 2021 06:40:10 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/57] tcg/tci: Split out tci_args_rrrrrc
Date: Thu, 11 Mar 2021 08:39:09 -0600
Message-Id: <20210311143958.562625-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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


