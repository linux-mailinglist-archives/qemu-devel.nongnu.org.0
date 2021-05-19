Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B03895B3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:44:46 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRBV-0004cf-Bm
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyJ-0003Yv-6i
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:07 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyF-0005c6-Sy
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:06 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so12602737otp.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZrjIdoHsYv9s/pOgxcbiN0IEOU2edVxfdbfsxChIBE=;
 b=MTGWI1Dq1vKic44Aw+HLAxnQ71Qx3QywXc1P7F3tB4u0Hv/6JdKxQ7x2zdcyc7ZB1A
 waWgmiZT5kqYh1fIjTud+m6ZYb4Ok3KrKGO5qkopqa0I3cMVlttTqrUExSrrYul9tFW+
 bPvVvB95LfaqJTePcGoY1X+WoDB0EsYV8Lcy0Y2cwcYMj3RiZbp1ukhMCOiawRxRpY88
 M9/1E6OD7DihzOWLhdNUW7BIl5j2dTHWM7Tq0O9K/K9+ns9OzK4uBOVUAAOuPRk6wGhv
 tYF9PH9l6W21VN54zxPNvuPV638fJcfFvRjWi+RiZT7MCVuIkUby9Lcs4hegNeplgHX/
 dO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZrjIdoHsYv9s/pOgxcbiN0IEOU2edVxfdbfsxChIBE=;
 b=PsGK9hvgu1D6sX/533pMVGW+N63Paxc6ukBwvJ1n16PhujOBcnV11mLbdHozPJd1xS
 gC/WSMFU50d21nAUWSJLq7ogYOv7WT2Iyj56mq76sB+nOS2Sh+96Q3Bs3XLdWVc74ozu
 +lo/P64zHmCCYOWTrl61erNxykRr1v0gyCoRUmJjuV31dMNUmOSp7zCqk2WF1Do3PKSL
 2pjppgd25sepNadIp5oTUQmCVCNZNNn/c7ztTBRY7tc14D1qar42YvwIO1Mij0irDiMv
 U7vL7RzLMKPvoilvXbZX0BzHiES4amaBlzj+BHNGJ4rLfHWoPrFbC6g2SMfScsYcpWpz
 inmQ==
X-Gm-Message-State: AOAM530GyQ95ZZ4kIuEcHpFJ2gLYMjogL3dkqbwcRtHu4QCO4lG28fyG
 GeuZ0EIRf5yUJMMhBTZHh2g5+lnxuwcaTjhU
X-Google-Smtp-Source: ABdhPJwwbVotllBRhSpeHma2M+7kimschmlykMTj3gFUaXWriM5NvXJZ2S9GVtweKs4GM80Uap+OXg==
X-Received: by 2002:a9d:1d45:: with SMTP id m63mr649692otm.302.1621449062589; 
 Wed, 19 May 2021 11:31:02 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/50] target/i386: Assert CODE32 for x86_64 user-only
Date: Wed, 19 May 2021 13:30:10 -0500
Message-Id: <20210519183050.875453-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For user-only, CODE32 == !VM86, because we are never in real-mode.
Since we cannot enter vm86 mode for x86_64 user-only, CODE32 is
always set.

Since we're adding an accessor macro, pull the value directly out
of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-11-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 27806f35f9..b570921410 100644
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
@@ -8494,8 +8495,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
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


