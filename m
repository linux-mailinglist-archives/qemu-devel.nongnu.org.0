Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1042EB1D0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:52:24 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqVL-0002nc-Lp
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0S-0002Mo-MH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:30 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0I-0006T4-33
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:28 -0500
Received: by mail-pl1-x630.google.com with SMTP id v3so37871plz.13
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yHpWBji5XIjin1o+94tFD6CTmKluj6DDVpJFH1M81zM=;
 b=tRkynvK0gMEUTVwcQFPkTQ0+nn92LsFakrs+F1z4MpwWFGwGnUeZClogoT01xjtdvC
 R3MEnB2gfLELgMbgioH47n6xmxYtDJ1NDVc92twm+Q16Ap9B1dPFSq5u/uC8DtEiXWS4
 Kk0btifDCRjlxO3y4XKV7WirHLcTKfuRIJTKwzynw8hko6y2MADhpEjotnuU39gSpl9r
 f9/VWv5W7ut1IdyxkZ4YsgmJi3F+5x7J9r91sw8Uebzh7EjATT+UR/u66ZoYQw3idWBB
 N+ST1FU1PgSMMeer+vD1wKnlr3QG/m9Y0EvshKAgPB7jtyf2tT2DlAgzpy8sjAG2i+mQ
 Cc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHpWBji5XIjin1o+94tFD6CTmKluj6DDVpJFH1M81zM=;
 b=oPj/CYLOdxHGbAftiuXx3CvRoh6LfOmwTs3bVHVQy09dbiKH+W94Eh3KaBFhh9G1eN
 QtDJGr3ggmq/EXjaqaSDpY5qIAkuyIuW0+X/J134/d4KLhCxy6heH4gLwHe43PNkcnLs
 ltOkHhCx6+1ExBb95kpG5osn2x2gqetOc4wDvibWr64jT7hu06myV5JgOh8FJobuSc8+
 zh+mJ05FUexbLdOQkIZVPBcI2SYeH45c2kYbWPXCHJvOkHxOJRr9PVwu8ohWKI067BZE
 /EVLGp6o4jX9sLHFkqYEBO8C6y7FXRdRmjRLOOQFOFO53QGdnzFREoOeUpLIvbHlvg8X
 8j/Q==
X-Gm-Message-State: AOAM533It7MeY29Fw1qF3yjSniJOFKF5t9G41lXg3he1ZaO25YjNV1K4
 mX1yD7zMQKaWUlXOoSlJa8Sj1Ua7LuzALQ==
X-Google-Smtp-Source: ABdhPJwsV7x9yeK52zRdtaAcTKBK70wOcKxIITII6tmRMfQy30msjlpeeey6O3bwLiw9r/QO6iQWrA==
X-Received: by 2002:a17:902:a388:b029:da:bad:ed3 with SMTP id
 x8-20020a170902a388b02900da0bad0ed3mr539512pla.76.1609867212998; 
 Tue, 05 Jan 2021 09:20:12 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/43] tcg: Adjust TCGLabel for const
Date: Tue,  5 Jan 2021 07:19:16 -1000
Message-Id: <20210105171950.415486-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Change TCGLabel.u.value_ptr to const, and initialize it with
tcg_splitwx_to_rx.  Propagate const through tcg/host/ only
as far as needed to avoid errors from the value_ptr change.

Reviewed-by: Joelle van Dyne <j@getutm.app>
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
index b769e868bc..e9af279738 100644
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
index 7bf441979d..325e439cb7 100644
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


