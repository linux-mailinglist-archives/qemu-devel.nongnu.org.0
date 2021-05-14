Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2F380CCF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:23:58 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZfR-0000n1-Az
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVn-0005gA-D6
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:59 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVk-0006yb-76
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:59 -0400
Received: by mail-qk1-x72d.google.com with SMTP id f18so7152577qko.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uGy85OrDgVnauK85Xs6cOcVQ3zxe/WtnhuNWmWoCY8U=;
 b=xTfSTNUmwQj0DAWNVSw3QP0+gNNw7K00Uj86kzsy9GYzPtytB5X/EEkyUJHxqx1iJc
 Bns9aQskwrW0YlqA0Px5rVa1ix3RMNK3AYLt8dWIWbkUjAoqE/ADi8VCrM1A7+07yPua
 BgddC8U2ciQMqd5Sdn8CEZzpU0vxZhdjzXyE/fFh5CxH0qxkKiP4ScBo00Y9LsoaK1h1
 quJRQIg3g4aYuaoHC4hGdHPYbjbKte3wdqtEjEl1F0HcpzvQHhNqBBRMrfbd5kfeZNfL
 AyRdy6xEvBUxImPXq/RPGrGlNcHY3lH2ysnJyeD5B6Ocs2zbTgCdN2bHTLfZfd2XVbB2
 b1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uGy85OrDgVnauK85Xs6cOcVQ3zxe/WtnhuNWmWoCY8U=;
 b=mc/ef/EKB5bacKQ/Rp+M8IZqi0JRmnRyw/tSo9kivHTeuC9KhqupVOOfmqAcOJ8DSS
 kfGKyFypvv+kObz/2/qc8+gFx+vI0r/0BZwkuzlKkBYhwmo1gzZYbu0IuiKwLm7FfDxn
 NPUpBIxJMeBNHscd/o4vHRDCFWcfqTJz2JxQ4q8fKwXUESgmeuwoeTZP/q5AC7fqOYeB
 K9AS4LbrB8ZA9aEOMRL9xaMggfCgIA+l0GPkowAfIceJU0oPknhvCdz9NTZJSNxIvXso
 9Yjkdbw2xgQSXbvKUxomCdFe0hmNth2CUIB3cw5gOcnpAdBmxKbpvqJ7umEN5Rjn8Zyk
 w1jQ==
X-Gm-Message-State: AOAM53311ttl+cNGQbTr8vcpUgY4U+cPZuHz2n84oER5jSAI4b0TS/JZ
 xmz9qZddFuO1KrVeH7Qzjk/PlMAkG6Hu2gaVq4I=
X-Google-Smtp-Source: ABdhPJwpqctZolIB29epTW2tf8hF9lb1oKz2SUHhrkncnC+OPEmCRcyYSGTflplvdfuuzVkli71fCA==
X-Received: by 2002:a05:620a:675:: with SMTP id
 a21mr12404053qkh.333.1621005235319; 
 Fri, 14 May 2021 08:13:55 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/50] target/i386: Assert CODE64 for x86_64 user-only
Date: Fri, 14 May 2021 10:13:04 -0500
Message-Id: <20210514151342.384376-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
index 7b5031f647..e3907f9066 100644
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
@@ -8497,6 +8501,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(IOPL(dc) == iopl);
     g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
+    g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
@@ -8518,7 +8523,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
 #ifdef TARGET_X86_64
     dc->lma = (flags >> HF_LMA_SHIFT) & 1;
-    dc->code64 = (flags >> HF_CS64_SHIFT) & 1;
 #endif
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
-- 
2.25.1


