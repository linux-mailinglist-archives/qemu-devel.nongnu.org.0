Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BA2D9A18
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:38:02 +0100 (CET)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koozA-0000WS-Er
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSs-0002QS-Ne
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:40 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSn-00043C-ID
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:38 -0500
Received: by mail-ot1-x343.google.com with SMTP id y24so15770627otk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N6wN/s3cc8J4fe6ZTQ6/bUXQAJNTNrqoJE7CR9wrYBA=;
 b=DxdpOyKK+fQ9MRgOQGqF0E3STQVbxynzSWtPvMTyR4uxI5lQ3zx0SO9TsurGtVTWxC
 7PgqfXe4binBgLhGHYnZ5StzVaP+g5nIiG/EYlVbGVF+QtqgmyTYGuggRMtRO95wUMUP
 AREzof4HVihkkURKqcEAqVuUPzO83+5+yHEbcBFFpOamq9wD5vkcwhp6z9so1liHGTwh
 7Q/uElTU4qanluRZUIdQ8fXgrb6KDx2NAPC9eSmCmtNkF3B2GAw/neBiM7i1j5tiUS1S
 gwW49JHyrFTRre1eeCdbhpJW8jA7g/ADMYvAJ/FAQFMAo89/uG7bRUP5ZwzcBKqlDXAD
 6AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6wN/s3cc8J4fe6ZTQ6/bUXQAJNTNrqoJE7CR9wrYBA=;
 b=D3Z5xZnuWP+2XhCM5VcRteoNhL6ta9OFUXVUcGKWOW8tKLMOD6S8TXAPSvoNgYrx9T
 l17MeGy/30ARd5/1TOe0sT9ZpynOYNavmsVCqDpozKE6Xow/b4TA5voPINXEbi6Bma2Y
 u6LTR5adNl1PK6a8s1BlVVDpZqX5Nj8HnAVtnDG+E662up08N7ThaexmAx4RIrsGT0Ft
 z4mPN8rwVNjK0paWFMcVE5leEvuyPPcI09CsQC4VhHkwLuIrbCcSs4NdPUO2gPVQHOkM
 fFC65cWQPDlxZkg0MYzu2sJkV3iCce34gl+2hZ19bh7/Wt1t4J2hOgcvnmcBPmp3a3BF
 sO7Q==
X-Gm-Message-State: AOAM530NsA9SVsi5mw9fYSUZ/6gtQTsCSeDftk/WCvOv40gngufGINoj
 xoFG8iqs7DG6AGzXVACUm+/4F7b9nrWc1sx1
X-Google-Smtp-Source: ABdhPJxTP8Wbp2bF4SEWUeGK0ONCTgQnaT7AXo+2zb98X2vjN3v+10ZUm/PKq01NotDJBP+QgXIjLA==
X-Received: by 2002:a05:6830:22eb:: with SMTP id
 t11mr20675595otc.114.1607954670432; 
 Mon, 14 Dec 2020 06:04:30 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/43] tcg: Constify TCGLabelQemuLdst.raddr
Date: Mon, 14 Dec 2020 08:03:14 -0600
Message-Id: <20201214140314.18544-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx,
make this pointer const.

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
index be57d2330a..18a3af53bb 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1786,8 +1786,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
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
index 7b4ee4a084..f48a028dac 100644
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


