Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C412532753B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:31:00 +0100 (CET)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVWd-0005mn-L4
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPg-0005PL-Ev
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:49 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPT-0007hL-55
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id i14so8243628pjz.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDVFGxFwrmBHnWFNAj8HT9b7D+hlCMSrCwvbH/K9RpM=;
 b=eTrsJ5SEEQaChT2lpyshsSNqlRY7I1a33ZXbSVZnnTCJb29YbYx7IU9F7QT4t4uPk/
 M10VwZR+11DGTWU9pKNMoxIcDhZ8RDktkwtst/0k8fAovKg9aQwcp9V/Y9YiSeNSUOka
 MBliu/BzdOBSI3Z8WM4uYTgJl8205tqSrvNIrZD8sKkBpsJL2yiTUjEAW7rIS03/MBRO
 ihb7pq9ILvRA/cORK59aNqBEIgwBpfa6zK5C6x8vmZFqX3Ei+mV5E7H3suHxcB56BQTE
 ZtTcVmNHhHLEu4T23QZxNN5zEFwnui1EzHqKrq+kPQvcHtav387RuHN/t9IIFKk3CoB9
 s57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDVFGxFwrmBHnWFNAj8HT9b7D+hlCMSrCwvbH/K9RpM=;
 b=L+BP5F1twExyNBzeIIDDMFaOuYwGD/WuOByBVYg6PvKKJbjNiWdhoo9sGhOXjW0xOV
 z8eH7LVzfYC4ialNQQdqAwfnayOrbvqw4GH0ebP+Iyh2gbbkagZjFB5RYAj8nVdFurER
 OynrgWnLE6SAtQGG0ihxw2aO/tz+ug9R0XOt3h3WKDDYAGx6jx4WSxzBflY00E/SuIhN
 68M6bzi26gM1iRolY81KZLE4N8JEFTtAfD2Zckt78Ey7pMByLq7KvNnTmnM/B6r+K9VZ
 PVWcpVFjJxxjzkVxwJRuvmjGGki1cfS1U231NpG+ddSHmbzPZUmVRFOtyR1dhm0f4qtQ
 Kgpg==
X-Gm-Message-State: AOAM531mxMbpityjhjd/bWmrFV8CJUN8OvGQAPyl11vtpZEnyX5F3r9h
 610FYq6x0F0NITRoucc9XGr8+0I3yOeSbg==
X-Google-Smtp-Source: ABdhPJzFsJ3nnNEikzn0XOGNoQ55s0nTOOioM9eRcBMrze09UYIiVmecO5JYZvhQ9mzwQv6NHd3htA==
X-Received: by 2002:a17:902:ab8f:b029:e1:8334:c845 with SMTP id
 f15-20020a170902ab8fb02900e18334c845mr12859210plr.55.1614554612450; 
 Sun, 28 Feb 2021 15:23:32 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/50] target/i386: Assert CODE32 for x86_64 user-only
Date: Sun, 28 Feb 2021 15:22:41 -0800
Message-Id: <20210228232321.322053-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For user-only, CODE32 == !VM86, because we are never in real-mode.
Since we cannot enter vm86 mode for x86_64 user-only, CODE32 is
always set.

Since we're adding an accessor macro, pull the value directly out
of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0e4f34f201..d46ebc1dc2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -100,7 +100,6 @@ typedef struct DisasContext {
     uint8_t iopl;  /* i/o priv level */
 #endif
 
-    int code32; /* 32 bit code segment */
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
     int code64; /* 64 bit code segment */
@@ -160,8 +159,10 @@ typedef struct DisasContext {
 #endif
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
+#define CODE32(S) true
 #else
 #define VM86(S)   (((S)->flags & HF_VM_MASK) != 0)
+#define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -2370,7 +2371,7 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
            because ss32 may change. For R_SS, translation must always
            stop as a special handling must be done to disable hardware
            interrupts for the next instruction */
-        if (seg_reg == R_SS || (s->code32 && seg_reg < R_FS)) {
+        if (seg_reg == R_SS || (CODE32(s) && seg_reg < R_FS)) {
             s->base.is_jmp = DISAS_TOO_MANY;
         }
     } else {
@@ -4619,7 +4620,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xc4: /* 3-byte VEX */
         /* VEX prefixes cannot be used except in 32-bit mode.
            Otherwise the instruction is LES or LDS.  */
-        if (s->code32 && !VM86(s)) {
+        if (CODE32(s) && !VM86(s)) {
             static const int pp_prefix[4] = {
                 0, PREFIX_DATA, PREFIX_REPZ, PREFIX_REPNZ
             };
@@ -4686,13 +4687,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         aflag = (prefixes & PREFIX_ADR ? MO_32 : MO_64);
     } else {
         /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
-        if (s->code32 ^ ((prefixes & PREFIX_DATA) != 0)) {
+        if (CODE32(s) ^ ((prefixes & PREFIX_DATA) != 0)) {
             dflag = MO_32;
         } else {
             dflag = MO_16;
         }
         /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
-        if (s->code32 ^ ((prefixes & PREFIX_ADR) != 0)) {
+        if (CODE32(s) ^ ((prefixes & PREFIX_ADR) != 0)) {
             aflag = MO_32;
         }  else {
             aflag = MO_16;
@@ -8488,8 +8489,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CPL(dc) == cpl);
     g_assert(IOPL(dc) == iopl);
     g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
+    g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
 
-    dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
-- 
2.25.1


