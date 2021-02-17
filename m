Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C031E0BB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:48:21 +0100 (CET)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTkC-0007Ys-FA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLU-00086e-0B
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:48 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLP-0007JM-OQ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:47 -0500
Received: by mail-pf1-x434.google.com with SMTP id b145so9172631pfb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BT+fbUWdo2Z5pG47CxveBKKbFIzxyg6+zMffoyRH9Us=;
 b=PC0tvNLPwANw9F53zcwvjAyGCgpRj9nbl4QTRqolTDl3w0o4OjR40i2nlalIzmJ+Jg
 wkFdoHLeqvSKYhrMJLg5SvGElxpHgYxZNMZE/xy8Or2xs6p88+r3ee31C7N8FsuwsNXV
 2EK9wWHUccyLbgVn6kW1Ulv9ez61Qyq9DEhXIkbSGdTBAMXoCkHcbcrX7r3AcZ2+0bxN
 egooAN4ShkpWMnDY4FuuFn076NMeg8GBZUB1gci3gTrG2M8+Hg+fNXtB/xCsLR6tK2gw
 VhTwHFpHpHL8VcyyMwc69vNfBsgLl2AhIrEV6JAC6iwQNxrrogq+EfsgPIjGhhRieHCX
 miEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BT+fbUWdo2Z5pG47CxveBKKbFIzxyg6+zMffoyRH9Us=;
 b=FB4Aau6UaFTHTfYoGceVCX4VhTWwDmtmUOvqw+Pgh4V0/MaDkUhqS5ScCRQe24kcbq
 4oIiBECO32CU/3MQD4XsUjlT6bdyA717+/iviGrp3H6zhNQ0NtcUsZKH95mVBdahA18G
 lO7cFaBeAFVbeAgY+i0LLbVVD0ZyY0WB6JEySlT/nZ8X//pPma2XfIon3HWoQNS4+93n
 Z7z/AFAm0EC4iJH2g46RCpujxIla2isQI6dsUrhT0snZVAE3jn1Z8Ac/kWB5MoQh2Drj
 bL/tCOh6JRAUFj+xfYd54/9zISAgTQzGXrYptYN8zh+pjAJz3FwDqOFMf0noEpKzEtlf
 EQtw==
X-Gm-Message-State: AOAM532Vz9mL28HE6ZSa0vs+M0m+XIAfCG/O86havuF6yrHsdNl2fZb0
 pdAu/l85wylztQ17bcJ35IszOlMy/VuCVQ==
X-Google-Smtp-Source: ABdhPJyP1XDeXM3YI5TfQOJyssR9TIgrkLRfTJcliPxBdUTc5rwnggz33/uYK0o7jpF1tV5Zg3lIZg==
X-Received: by 2002:a63:e1b:: with SMTP id d27mr931820pgl.135.1613593361601;
 Wed, 17 Feb 2021 12:22:41 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/71] tcg/tci: Split out tci_args_rrrc
Date: Wed, 17 Feb 2021 12:19:46 -0800
Message-Id: <20210217202036.1724901-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 tcg/tci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c879a2536..bdd2127ec8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -207,6 +207,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrrc(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *c3 = tci_read_b(tb_ptr);
+}
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -413,11 +422,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tb_ptr = (uint8_t *)label;
             continue;
         case INDEX_op_setcond_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
@@ -429,11 +435,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
+            tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
+            regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
 #endif
         CASE_32_64(mov)
-- 
2.25.1


