Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE2380CC5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:21:48 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZdL-0003E1-Sd
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVk-0005SL-6v
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:56 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVi-0006xg-EN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:55 -0400
Received: by mail-qt1-x82d.google.com with SMTP id t20so18136070qtx.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Am14AxV+KQh4bHEznp653AdoYsyeLiCdw25zID82iYg=;
 b=M/WtbCGsjZ7eKzLS0Or7lxiSHG4Bso5o+eyvWP1gGoFFa8Iql9ir8nQVHg0fZ88ycr
 lYAVmq9cibnO3VuG+fciD11qWLXrgwNC61V1E62R8MaEhJhuA3goe5+GdY3IvKCd8gmf
 L8k/AgpGVmqRDV2TTWgLyljU58w+gwb3eIMM3sYnoNrWe3Wrce9o9efBHWwQMxBz+GCW
 kXTV9xawyTX9ELTfX+zFwZ+yrX5PtzxX3br8DcdvKTAS/hjK+JkHB46weO1n41ygRbRt
 Z6IesF7bBXjFjinaSsL5ZpUEPboafWaWZFCiceNLuw4Pel/+wjMawSUyi0340eA4a+HG
 jSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Am14AxV+KQh4bHEznp653AdoYsyeLiCdw25zID82iYg=;
 b=b5hcSM19cGF6tvmsiYDeasvHNVuRoRGvJAWEtL/tfeZhQa0U2ijUsGLcAY53WqdjQ/
 BksZiNVRqi3KvC3vw2Z9pEUhUR5sVJD8Em4toK0yeQgF9kP38NG/QC9cVPfZXzRdL7fE
 BnF4GWU8hm4qX7gS08AHn8CZ6t5u0aXDz6TO/wnFsk2k5HuadTwvzwg4ahJBjXyhJ7U2
 NL6D1qNt0wnsgeV+c6PajWgJ2MsK03jnudoTitDSesArf7/CbYaUbmLLyECfB5a9xYEJ
 7gxD6vYGpHZaugnBpssj3R37Epv3H92bqRnARqtTPnE4wS+dbxHrdy+WAD4rFf5xuyk0
 tBxA==
X-Gm-Message-State: AOAM531MkSiW7a065Qxly68JnP3YV3okYse1rEfxueFhl9yZ5CD3wySO
 D4zRP0XgeuUPNFTeX3cJOIq3fqy+/6/p/KTH468=
X-Google-Smtp-Source: ABdhPJyHNVAYh96acyStPpYryb2L0F1ERsl0zsVFiKLJJet/9QHXr5pgWteLhNcz+/fHturPMLHVIw==
X-Received: by 2002:ac8:5d10:: with SMTP id f16mr42752117qtx.123.1621005233581; 
 Fri, 14 May 2021 08:13:53 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/50] target/i386: Assert CODE32 for x86_64 user-only
Date: Fri, 14 May 2021 10:13:02 -0500
Message-Id: <20210514151342.384376-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
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


