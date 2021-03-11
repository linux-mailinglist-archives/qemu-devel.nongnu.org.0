Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBF3375FA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:43:24 +0100 (CET)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMX5-0005Jc-HK
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUA-0003Gh-CK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:22 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMU7-0006If-3N
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:22 -0500
Received: by mail-qk1-x732.google.com with SMTP id l4so20792862qkl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7uiPbIkaltXGyGrTOejJhAFYjDYkkPY5RpXmb9ap/U=;
 b=Ei4nU4eiMdLD9kUWaJea7qgUG0qap+/UJrbMMFi15JjivBGLjw+NJ11r0BKc6OMLdJ
 Wlty0Z7RROHZBVz6Flh1MOw1jMl/TFle3H74G2MnYvnEXza1BjKVscRpSzDFLMZ/4JZL
 f/8sddvm3GYrL4JF9YFxsjBE3gtCR/5UPNbjWx1X0LzeJxLntMorxeiBImprPo/qt8t8
 auw7fB9djpHxQ/F9WxlpRSyk47I4pL2jmOPHdAYxNSedFc4rbrzNdJU0fSGU6jpKZvR6
 Uunwssb6ehkfKn27aEcKlNLuTClmML/mmjUR4Kw33fHadxM+igSIE8f+o6RFb4br9YoI
 h5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7uiPbIkaltXGyGrTOejJhAFYjDYkkPY5RpXmb9ap/U=;
 b=ek+/tEsN9BOvqw/nb9ZrpJBVIWR0QTrQ25yQaFN4HiNWHgImydWvdJiNGA/Snl+93Q
 3YZddoaWG4m1Q7qRYyxrQTcE/M7Ad+dx/MHLvNVkx19cAlRta0nTgwQbwWZwcjYh3wmw
 eFSv19XR7jImmQP8VEUg4ohj0Qcaikk9eqlh832hpt8Q6C0/vAMa7Jzh7zx3iAXTJ1PG
 QWGdRX0vxroYwj9OOj0hSxR/7omk5Vg+GJClpNqqtbk/Fmmv60+SiPLej//f9YPuPz+/
 8z1nw9uqvhoPMWOOioFCfnPrj4EFqPsgVRZ7TDJ/R2TNnO50K2Amgz1bt4tkAdOuGP9x
 Vi3g==
X-Gm-Message-State: AOAM530D7qHHHtIX6h94r9cmxRYc+myCrfagIalX7jjkeEuw8HEpvFxV
 THI+OZba2g9eAZ3o31u42030nWh+jhSZGLtZ
X-Google-Smtp-Source: ABdhPJxwfcCnJvZ8HfdJ/Wtni+gfJtoEGFnvmqx3uAw2DwDjK9sIS3O5PH+ZQ1ehz7cHfLEaEH46Ug==
X-Received: by 2002:a37:f518:: with SMTP id l24mr7720907qkk.118.1615473617774; 
 Thu, 11 Mar 2021 06:40:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/57] tcg/tci: Split out tci_args_rrrrrr
Date: Thu, 11 Mar 2021 08:39:15 -0600
Message-Id: <20210311143958.562625-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
 tcg/tci.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3fe0831b33..8b38687d9a 100644
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
@@ -420,7 +431,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        TCGReg r3, r4;
+        TCGReg r3, r4, r5;
         uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
@@ -626,18 +637,16 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


