Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891C2EB1D7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:55:27 +0100 (CET)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqYI-0007Po-Ha
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq1A-0003Jc-QO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:14 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq15-0006n4-9l
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id f14so13668pju.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDt9G4G0380iY4uD326AhbzaTibvzTwO85rcnYobk9o=;
 b=HDP2nytzc/Y8eGQiCFchpkgmcdojCFDZCAR8hWWpdnPWXBRucxocoVT2TdknZbQmbz
 MRIYsFYyighvXoYVVJczBAQKtx+EtWCVCnrqAlQsPbdUY2RmKEll/YbGzwXxsdqCfVBd
 EvyM3DKaPPM6Gwx2DfQgf5fwRnDBC4hhBdovWKpYo7jWImrbBFY+n1qZTXbE2R+8Kje/
 7s+xn25sC4gtUiSFl9zWKcyyWOTEFqd3AWSeXXnekRr4EDhDpAshnWwZ0OjEy2VNwt62
 haZubOytL1hx7f0sMu4zB45X9jp91qyGvohYsFKVX9DuivhcLOM8TAHUolQOeL/9ZZzt
 PvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDt9G4G0380iY4uD326AhbzaTibvzTwO85rcnYobk9o=;
 b=poCNoq0DyWBTrDBjeb3/RMrbt+hmCEYALNWu3gFUjwmedmiIChD1NhWNpLnAkKkliL
 cfN/kVgYMgodrcoxaGKYsLM2153JsPolAq9PSGwLOdUwhjSLOlFjojXyGwDCLk1VRXzp
 zWFTjn41jrzQHVrFhrnQ2RJE+Rv47efXmKSxMYSDqYsoAFTqzOKYmLIWmziaPQAqjeUs
 wfqqmyTKZWv2eqYfd7SKMJp3bLGJJ1nfr+pBATwiSH89AmGGgHKI4ao0/sICiMd20lt0
 s5wWYyJq6nRlO3xCv401AEOx8OB6Cspwk/AYfsoBGUNn++fJOx2Hsc3FDIrMFYeh0Tz2
 qdZA==
X-Gm-Message-State: AOAM533hrr7tIfm6uEVo/S4ZbYV2djrsRnN9mQQQAsGJlrzeMIUQ1Tn9
 MC9dIdHqhohaCARrYqCHG5ZXA1O746n04A==
X-Google-Smtp-Source: ABdhPJx2glmQJNDgDqWaHX7+ioU/MFCgftrpbYbgiGDY8dZ+qiw5ATODF5T8m9TppXK8OJxhJ5/6zA==
X-Received: by 2002:a17:902:6b89:b029:da:fc41:baec with SMTP id
 p9-20020a1709026b89b02900dafc41baecmr528675plk.39.1609867265841; 
 Tue, 05 Jan 2021 09:21:05 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:21:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 43/43] tcg: Constify TCGLabelQemuLdst.raddr
Date: Tue,  5 Jan 2021 07:19:50 -1000
Message-Id: <20210105171950.415486-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx,
make this pointer const.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 3 +--
 tcg/arm/tcg-target.c.inc     | 3 +--
 tcg/i386/tcg-target.c.inc    | 3 +--
 tcg/mips/tcg-target.c.inc    | 3 +--
 tcg/ppc/tcg-target.c.inc     | 3 +--
 tcg/riscv/tcg-target.c.inc   | 3 +--
 tcg/s390/tcg-target.c.inc    | 3 +--
 tcg/tcg-ldst.c.inc           | 2 +-
 8 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 0b7eb09a27..ab199b143f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1636,8 +1636,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->type = ext;
     label->datalo_reg = data_reg;
     label->addrlo_reg = addr_reg;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d6cb19ca9f..0fd1126454 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1340,8 +1340,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 91400d575c..46e856f442 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1795,8 +1795,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
         label->label_ptr[1] = label_ptr[1];
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 18fd474593..add157f6c3 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1283,8 +1283,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         label->label_ptr[1] = label_ptr[1];
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5f191c03d9..19a4a12f15 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2001,8 +2001,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi_reg;
     label->addrlo_reg = addrlo_reg;
     label->addrhi_reg = addrhi_reg;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = lptr;
 }
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c76dc9f9ca..c60b91ba58 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -996,8 +996,7 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
     label->addrhi_reg = addrhi;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr[0];
 }
 
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index b3660ffedf..d7ef079055 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1587,8 +1587,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGMemOpIdx oi,
     label->oi = oi;
     label->datalo_reg = data;
     label->addrlo_reg = addr;
-    /* TODO: Cast goes away when all hosts converted */
-    label->raddr = (void *)tcg_splitwx_to_rx(raddr);
+    label->raddr = tcg_splitwx_to_rx(raddr);
     label->label_ptr[0] = label_ptr;
 }
 
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 05f9b3ccd6..c3ce88e69d 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -28,7 +28,7 @@ typedef struct TCGLabelQemuLdst {
     TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
     TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
     TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    tcg_insn_unit *raddr;   /* gen code addr of the next IR of qemu_ld/st IR */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
     tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
     QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
 } TCGLabelQemuLdst;
-- 
2.25.1


