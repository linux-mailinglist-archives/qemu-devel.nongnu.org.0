Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0142EE71F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:44:50 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc9J-0003n7-Sn
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhf-0001fT-Pw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:16 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhd-0001nk-Mw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:15 -0500
Received: by mail-pf1-x433.google.com with SMTP id s21so4543457pfu.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/axlOMlK9mP+17efpjcCMV26tl84bU61W0fMNh0sRdI=;
 b=Mvlb87Ax8F1pSxrYId/kf8csdowCkIiQ7FVPeo2DOX5HpaxtWP3G/vRT2SN/uEN4D7
 XgKtln3HncNPkltdkVomAdWVK+/rRIwQSJqkaNtagVBsaw9b+E5v6/YUhqH/8e5a1PDs
 d2VBq5DsCMdJOD5WNXddSlqhtoiwOnluEy2VZcUP/gcTlCR+CFNiXnWnWbfly2CWeIHU
 fIg5pulSgGs0seIHDhRM4nt7n9s4fvq/OMm88uAIdGJkFlqwO3udeGcFVuTAW9mYJBQR
 UKuwUaADdgN6nOTNNHJdW2C7rWWKDOmVSGCRPRDBPBWnqInFyaXS73VaaZnsuVmwD/OU
 Osig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/axlOMlK9mP+17efpjcCMV26tl84bU61W0fMNh0sRdI=;
 b=eevCAkRkfS6c5jn8fLKhfnsIN5Ny/w2bXj5wY4ny/22qzFhl6UVjRwTj+VBj9nOOjb
 8R5H4S/9M7/CRqNnXPpshjH1JzDkt0PBnQg2Q4uGYOBDjdAwAANERcUYfuZnYPcpWkb5
 H7I3a76ENvT8J6nA5fwlvQXgLIczazWm+6ZKFoQ11BYrfSoWvgr7L1YN40tmr/rKkrtn
 Fq1dySuznsAEHvwsMZQ+E1k3A2PQpZlWTpGx4JtVzrMx2qbY9599L+wvMSMP4fM0VghQ
 0h1o4NHJ6ZrN1WK6MIT5t+oWow4r7URomMZ1c8GaNCtOaC423qhwbjmVRXcD/bLZAtzm
 AbYg==
X-Gm-Message-State: AOAM530kVn8HG1mBZR1Lc7n3ywkP4kq4xZBINObVbNx04AA3XfVSC34c
 7hls3RhktS/yLQlI1vz5YdxTu7oZnHHD+A==
X-Google-Smtp-Source: ABdhPJwMAjCY5wI7fLpbpJq3KudYM+q8VeDSuosH5/u4sYbbuKSOU82kpHsP8yDx4JkuKJuXg+bL5w==
X-Received: by 2002:a05:6a00:a88:b029:19e:4ba8:bbe4 with SMTP id
 b8-20020a056a000a88b029019e4ba8bbe4mr3675085pfl.41.1610050571831; 
 Thu, 07 Jan 2021 12:16:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:16:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/47] tcg: Constify TCGLabelQemuLdst.raddr
Date: Thu,  7 Jan 2021 10:14:48 -1000
Message-Id: <20210107201448.1152301-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx,
make this pointer const.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


