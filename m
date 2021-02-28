Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288832753F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:35:38 +0100 (CET)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVb7-0000oC-6k
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPk-0005RQ-7y
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPT-0007i5-9e
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id jx13so6380620pjb.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjuG897ecqPHqn9o+8GNgZG7OZ+sBrEQD+MOGdNWOSM=;
 b=Ife5a/pGxobkc9E1YaiZhO7HeDjFqjeNL/e/lqINvKnP7JxM60vdvUebBdsuHh11pQ
 LIWhRGQ5/B8E/n0z36jyrI+4EyY6+qo7412l2PlwjJqxdqK25IOnNatsc+EtXvUQe6i5
 T7T2GfJLRH2P8zKeSrduhTTVC+070o6TVhYK+8sM4yobwz/1RyI/PLzH41kwQi50eQjB
 IEUMgZ0B6d+SUpUmlxvq4C/atgxJx1Tq/E1Y2I57gwMHJOvQ/KFXs95XOCPiwUlUzYVW
 dgB0lwyQQbSxLpVClecc8lzvJi67qCoSxqIWlhASGLU1d49BAJad7a303E+VJIcnWqZ3
 qibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjuG897ecqPHqn9o+8GNgZG7OZ+sBrEQD+MOGdNWOSM=;
 b=pD3CBayX7Mnt5L7WRHtBDUJds3cFwECvoNLbKi/253t4H09rBW89bLO9vsryjo3yj/
 6rs+C77OjKq2cbTvy/LWupVNt8ZmGe7TjnoZ9NmHp8khGJJqlYiGNMkGaATSrgwuNQR4
 O8ij6Vf90FNrdIgJXitdtwhFXB58zCAOTu+AIEkbq63ICEHQmDfzFwHzvKBBA39osUJU
 vHEj8ebD4mlJQU246bDQI/67feGgkmgZkGaIZX5ZGABZUzlG1EkOFJtUTeOuOs7fU0py
 6dc66w8GHOxb90hLGFEOxba4p4Lj6US9AZsYbXASuoI9TndUb+etRkxPjNFp4QzpeAVB
 AEOw==
X-Gm-Message-State: AOAM5335/R0BCr8X9F2Hi92mMr8N3I00Qrve+aUnwqpzelmVUPPc8rUX
 RRN+rET3m3XBACZFuBWDTvQ909VJ+NGOCA==
X-Google-Smtp-Source: ABdhPJzxu+VbnsyzNA/gbuNOSm2cvF6KCugBEHaMcpEFgyI2b2yfobbcEAOGxg+c6BI8zyLNL0n+qQ==
X-Received: by 2002:a17:902:b206:b029:e3:f546:2f70 with SMTP id
 t6-20020a170902b206b02900e3f5462f70mr12815869plr.63.1614554614091; 
 Sun, 28 Feb 2021 15:23:34 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/50] target/i386: Assert CODE64 for x86_64 user-only
Date: Sun, 28 Feb 2021 15:22:43 -0800
Message-Id: <20210228232321.322053-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For x86_64 user-only, there is no way to leave 64-bit mode.

Without x86_64, there is no way to enter 64-bit mode.  There is
an existing macro to aid with that; simply place it in the right
place in the ifdef chain.

Since we're adding an accessor macro, pull the value directly out
of flags when we're not assuming a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ede6e4c5cd..e7f4392d55 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -41,11 +41,9 @@
 #define PREFIX_VEX    0x20
 
 #ifdef TARGET_X86_64
-#define CODE64(s) ((s)->code64)
 #define REX_X(s) ((s)->rex_x)
 #define REX_B(s) ((s)->rex_b)
 #else
-#define CODE64(s) 0
 #define REX_X(s) 0
 #define REX_B(s) 0
 #endif
@@ -102,7 +100,6 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
-    int code64; /* 64 bit code segment */
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
@@ -165,6 +162,13 @@ typedef struct DisasContext {
 #define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
 #define SS32(S)   (((S)->flags & HF_SS32_MASK) != 0)
 #endif
+#if !defined(TARGET_X86_64)
+#define CODE64(S) false
+#elif defined(CONFIG_USER_ONLY)
+#define CODE64(S) true
+#else
+#define CODE64(S) (((S)->flags & HF_CS64_MASK) != 0)
+#endif
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
@@ -8491,6 +8495,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(IOPL(dc) == iopl);
     g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
+    g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
@@ -8512,7 +8517,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
 #ifdef TARGET_X86_64
     dc->lma = (flags >> HF_LMA_SHIFT) & 1;
-    dc->code64 = (flags >> HF_CS64_SHIFT) & 1;
 #endif
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
-- 
2.25.1


