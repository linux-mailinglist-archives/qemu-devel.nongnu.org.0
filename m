Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FF2D999A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:17:39 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koofS-0000md-PY
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS5-0001gQ-EI
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:49 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRq-0003ve-M0
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:49 -0500
Received: by mail-oi1-x242.google.com with SMTP id w124so16111412oia.6
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3VsbV4FnPPISc6ywNLv+k5MiXrPyQIckC3OGJZ+UW18=;
 b=C8WBcWlQiJwDqBWuEqZFsN/Sm1XJSyiFWtu44gDCT8+WfsngplIGSReGBJC4BXD5ch
 juNrG7smvJmpCFP0kaLiIOkT973PUQSOhxuKJtFk28wI92LNurlgH6IRhVhvJz+EgnC6
 Ae6FzHTDgQwNMCD0w12+Dcw2h8APIyrADkUahPblqQC5iFR7fDMS3XGJp75iag5xjpBN
 G7pUV8lajz9ssTp4l6/JBWFsGjjNmf8yG166XZ1dYVcTndBI7r5vGUv+rlESucRV2+bv
 6VTPfl3kOcrWuP3qYBtSQ3ugYM9d2T3IhexscNrbCVGInMxeEq0KNcUIqVSEi+CwuGvy
 XGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VsbV4FnPPISc6ywNLv+k5MiXrPyQIckC3OGJZ+UW18=;
 b=FIz7KsXCUGbhaiD23G4rmY88EE9YNP1tyU8DSfQZifkcjEE6/ldB7YT8lrysHAIYey
 AS2O4C+l64RZgfzdmS3e6nV3NHQ9kBM76HE2Sz18UM54WcZWLMygxhtagJxzxOwmu9Jp
 8itSStw4TB3Pe4tWikuqKXQoaN6Il2RzVbRXcnjuuj7FeIRO/zB9s9awycFvpO/eWXLB
 gisRyji296xVYChna+NtEFGzWMhYcdyoLyimfg4UnjahOS32uBSWbi2u1gxvMrUYmOj0
 dJzeWhs3nhjDZ4+9xhGrNCBPactzz2X2+OSHoOd/dc5D1FO04xTi18nZs4Xj1nxKKdY8
 6/CA==
X-Gm-Message-State: AOAM533HDILKTgQ/vwdE/0OE+rN8vb989jQzgLSuHEswEiy1pE5Jxsyz
 g3Y2lpKdgjc/c6GtIr04D8f4GO5gt7lrxxQ0
X-Google-Smtp-Source: ABdhPJyu0X6mDiSie/5FVeS9kBHyGYvpTMKsj7T1ghENZ2IbwiYvzaUhiddfF8HwoDDgHWuahNeqKA==
X-Received: by 2002:aca:5c08:: with SMTP id q8mr18484410oib.54.1607954612668; 
 Mon, 14 Dec 2020 06:03:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/43] tcg: Adjust TCGLabel for const
Date: Mon, 14 Dec 2020 08:02:40 -0600
Message-Id: <20201214140314.18544-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Change TCGLabel.u.value_ptr to const, and initialize it with
tcg_splitwx_to_rx.  Propagate const through tcg/host/ only
as far as needed to avoid errors from the value_ptr change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 2 +-
 tcg/tcg.c                    | 2 +-
 tcg/aarch64/tcg-target.c.inc | 2 +-
 tcg/arm/tcg-target.c.inc     | 2 +-
 tcg/mips/tcg-target.c.inc    | 5 +++--
 tcg/ppc/tcg-target.c.inc     | 4 ++--
 tcg/s390/tcg-target.c.inc    | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 249f83be72..b2ba16ea8c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -261,7 +261,7 @@ struct TCGLabel {
     unsigned refs : 16;
     union {
         uintptr_t value;
-        tcg_insn_unit *value_ptr;
+        const tcg_insn_unit *value_ptr;
     } u;
     QSIMPLEQ_HEAD(, TCGRelocation) relocs;
     QSIMPLEQ_ENTRY(TCGLabel) next;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5bb1edb804..98cd42d311 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -306,7 +306,7 @@ static void tcg_out_label(TCGContext *s, TCGLabel *l, tcg_insn_unit *ptr)
 {
     tcg_debug_assert(!l->has_value);
     l->has_value = 1;
-    l->u.value_ptr = ptr;
+    l->u.value_ptr = tcg_splitwx_to_rx(ptr);
 }
 
 TCGLabel *gen_new_label(void)
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 76f8ae48ad..96dc9f4d0b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1306,7 +1306,7 @@ static void tcg_out_cmp(TCGContext *s, TCGType ext, TCGReg a,
     }
 }
 
-static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
+static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = target - s->code_ptr;
     tcg_debug_assert(offset == sextract64(offset, 0, 26));
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 1e32bf42b8..f8f485d807 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1019,7 +1019,7 @@ static inline void tcg_out_st8(TCGContext *s, int cond,
  * with the code buffer limited to 16MB we wouldn't need the long case.
  * But we also use it for the tail-call to the qemu_ld/st helpers, which does.
  */
-static void tcg_out_goto(TCGContext *s, int cond, tcg_insn_unit *addr)
+static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f641105f9a..a3f838fa51 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -144,7 +144,8 @@ static tcg_insn_unit *bswap32_addr;
 static tcg_insn_unit *bswap32u_addr;
 static tcg_insn_unit *bswap64_addr;
 
-static inline uint32_t reloc_pc16_val(tcg_insn_unit *pc, tcg_insn_unit *target)
+static inline uint32_t reloc_pc16_val(tcg_insn_unit *pc,
+                                      const tcg_insn_unit *target)
 {
     /* Let the compiler perform the right-shift as part of the arithmetic.  */
     ptrdiff_t disp = target - (pc + 1);
@@ -152,7 +153,7 @@ static inline uint32_t reloc_pc16_val(tcg_insn_unit *pc, tcg_insn_unit *target)
     return disp & 0xffff;
 }
 
-static inline void reloc_pc16(tcg_insn_unit *pc, tcg_insn_unit *target)
+static inline void reloc_pc16(tcg_insn_unit *pc, const tcg_insn_unit *target)
 {
     *pc = deposit32(*pc, 0, 16, reloc_pc16_val(pc, target));
 }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 15d5c78798..d108f01fec 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -184,7 +184,7 @@ static inline bool in_range_b(tcg_target_long target)
     return target == sextract64(target, 0, 26);
 }
 
-static uint32_t reloc_pc24_val(tcg_insn_unit *pc, tcg_insn_unit *target)
+static uint32_t reloc_pc24_val(tcg_insn_unit *pc, const tcg_insn_unit *target)
 {
     ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
     tcg_debug_assert(in_range_b(disp));
@@ -201,7 +201,7 @@ static bool reloc_pc24(tcg_insn_unit *pc, tcg_insn_unit *target)
     return false;
 }
 
-static uint16_t reloc_pc14_val(tcg_insn_unit *pc, tcg_insn_unit *target)
+static uint16_t reloc_pc14_val(tcg_insn_unit *pc, const tcg_insn_unit *target)
 {
     ptrdiff_t disp = tcg_ptr_byte_diff(target, pc);
     tcg_debug_assert(disp == (int16_t) disp);
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index ac99ccea73..1b5c4f0ab0 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1302,7 +1302,7 @@ static void tgen_extract(TCGContext *s, TCGReg dest, TCGReg src,
     tcg_out_risbg(s, dest, src, 64 - len, 63, 64 - ofs, 1);
 }
 
-static void tgen_gotoi(TCGContext *s, int cc, tcg_insn_unit *dest)
+static void tgen_gotoi(TCGContext *s, int cc, const tcg_insn_unit *dest)
 {
     ptrdiff_t off = dest - s->code_ptr;
     if (off == (int16_t)off) {
-- 
2.25.1


