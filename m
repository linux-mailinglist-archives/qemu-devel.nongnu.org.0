Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040033F426
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:45:04 +0100 (CET)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYM3-0006Bx-8y
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCM-000538-An
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:02 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCF-00076V-C2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:02 -0400
Received: by mail-oi1-x22a.google.com with SMTP id x78so42214278oix.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xkAhhh9xDBGJqS4Ff/RQebFkN9aKkBl1/y4BfG2kuo=;
 b=Wmjjm++8DandsT2UBvqpcaRaI4PIJ0X0pgrGeQWpU7Pw2clJ0cgDpi1XnykljDul18
 7jVl10C+R4SxHtlHPpD5A3zXR5QGhRUn1rsNfnwT7V5K90VuXpyV1uYrfaiYrfcUSjgB
 J7aiuwj46ZwGp+HILFeg6P25bThplysuPJrtuquyV54WPpg4Gk7k32yf03GZwEfoxnna
 jI1W6eV++t+R80oEq7eYcnflMtZ95AvivA5/3RbAveR1FFXJ+Mj5SsjsJSi8C9N2Pr9U
 DBSdLbsq0F3KHugkUKM89JSldidh0/TCleWtDcT7m/Nq+DcJkOT9Cmxda1wGdse4kfxd
 sIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xkAhhh9xDBGJqS4Ff/RQebFkN9aKkBl1/y4BfG2kuo=;
 b=KpDRRI5XB4aDq2xkkAAZ33k4yuHLBYguLUbZZGd1YKwM0vL1YCThCucMU/sPOCxacz
 OEkObgZe9XJXaZc1/Vw6X/k/c8yxkNsub5BSlXLbHiuJw8Z7MG5w/62DV4BYHBeyDHZv
 jU9xc8aHCEIoRP2DDkW14Va5GHhbnFNw4ERWPrsdAMfskyo43fugIke8537sO/EtpTGn
 3RDH3HCgvEgtWFMLwy4o2zK0lACRqkTY+Ttutj0Q9UjFEvW/hyVtWrLPa0Yoi9rc0wBf
 mcz6W5+qYP68xr5jq+bem836aJGsiLlUrfAcHajQebYJxVeccOfF439lyFS4RBR2iFkQ
 CgKw==
X-Gm-Message-State: AOAM533xu893HNnnHbXkAFGmyIqTyN1DjreFhEsTPjdnO9B2hji75HxF
 OBQ/k+gC5aR4ot7PSU1WE8DhToUD1nsPdVJM
X-Google-Smtp-Source: ABdhPJxzdmdaPMN8nOY6Y2YJsoxHC+d5z0Sq7Voijlpusoshv1WmP/g+fbD858ePv24FaxfUTPBBQA==
X-Received: by 2002:aca:f13:: with SMTP id 19mr3146009oip.56.1615995294106;
 Wed, 17 Mar 2021 08:34:54 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/38] tcg/tci: Split out tci_args_rrrrrc
Date: Wed, 17 Mar 2021 09:34:14 -0600
Message-Id: <20210317153444.310566-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e323351b75..22ede4016d 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -223,6 +223,19 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
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
@@ -385,7 +398,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        uint64_t v64;
+        TCGReg r3, r4;
+        uint64_t v64, T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -434,11 +448,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


