Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF85A06F3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 03:49:35 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR1zy-000840-7v
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 21:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR1xv-0006Yw-1L
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 21:47:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR1xt-0001yH-3R
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 21:47:26 -0400
Received: by mail-pj1-x102c.google.com with SMTP id bf22so18826104pjb.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4G5GaOd+RU4RLhAxhUjGPelwQrQN5Kdq95zA17CAp8Q=;
 b=aOJhdXDyj/4KabCakicpTcBwpVwFaMtOdyYR/hMxPi4hztq7UFRLzcabzF9XLsgaHb
 W8rjFMsiLy6/oJAGUbDXNbQabBrCRwa2KSQYV4PWj1pdTVrfvGefKHWJwWoXRQLq44RO
 j1ceL8dFGNs2grtQtHlDxil2rdVE/mpk/HqqvdecuTJyFPJQn33jsYVep4MHghPqc7X0
 SrepExXo2vuxsfHw9b0N3VeMAK1/biar+R0BgsRpgHj7ixke0oQS8uBqJDO7PThKzeo6
 8kTvzicYRcygf6XoA2bYLLp92+SY06YutR6t2SPuaJpq3ql7uhOnbgpyRit6dp20EnlV
 JGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4G5GaOd+RU4RLhAxhUjGPelwQrQN5Kdq95zA17CAp8Q=;
 b=GVZJKBUceRrxiugbTs9+BFKTa8toKHasA5VUyR/T0V6/m9xBAWayHHXKb4oPujiF15
 YwSiuNlfH8gXVMm2uRQM7XsI7eyVVKcgv5ZT1hu7WonKDsmwF1Mykbq6qSandPbbxzPe
 CGOxdF1TPm45XpbpXKjP4MRojduwThg7GVSXoctDOgjJxuFByd4RLhDZ5svFI33LnYRs
 7Wkmfb19K9cNtzKtGp5yPxfPE8G29VJZTmOw5agqUQofTBYXbQOPlourIwH+Jar7hGn+
 7s6KKQuJoz2JhCcaTT6ck1NTaRhY661zmCpRwjr1TqZ9Wi3ztmHKGKkQmdhFfpwBbcNw
 J2gA==
X-Gm-Message-State: ACgBeo0VcwSeQagd1wcow8xz57v5wDqQEXZWClfS+HAyFZgWdrT4LbBC
 G7wiT6KiTXcTR0aXXQLxjy0GlXAoGHZBFA==
X-Google-Smtp-Source: AA6agR7hOE6dG8OKbV6R4tAw1x8Psi45guzkOcFDmxyephT18uQcIjFqHiAqDUc8Whc11Tafnifi/A==
X-Received: by 2002:a17:902:e552:b0:16d:c98c:5954 with SMTP id
 n18-20020a170902e55200b0016dc98c5954mr1622587plf.111.1661392043396; 
 Wed, 24 Aug 2022 18:47:23 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a655c8a000000b0042af14719f4sm3853992pgt.51.2022.08.24.18.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 18:47:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	paul@nowt.org
Subject: Re: [PATCH 03/17] target/i386: add core of new i386 decoder
Date: Wed, 24 Aug 2022 18:47:22 -0700
Message-Id: <c2ee77f9-9c46-0b67-468a-85d13a58dd6a@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824173123.232018-4-pbonzini@redhat.com>
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-4-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 8/24/22 10:31, Paolo Bonzini wrote:
> diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
> index 603642d6e1..fb86855501 100644
> --- a/target/i386/tcg/decode-old.c.inc
> +++ b/target/i386/tcg/decode-old.c.inc
> @@ -1808,10 +1808,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>       prefixes = 0;
>   
> +    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
> +    bool use_new = true;
>    next_byte:
> +    s->prefix = prefixes;
>       b = x86_ldub_code(env, s);
>       /* Collect prefixes.  */
>       switch (b) {
> +    default:
> +#ifdef CONFIG_USER_ONLY
> +        use_new &= limit > 0;
> +#else
> +        use_new &= b <= limit;
> +#endif
> +        if (use_new && 0) {
> +            return disas_insn_new(s, cpu, b);
> +        }

Is this use_new/limit thing actually helpful?

I would have thought it would be helpful to block out adjusted opcodes
in the old decoder switch, and remove old code.  E.g. below.  That would
make it obvious what remains to be done.

>       case 0xc5: /* 2-byte VEX */
>       case 0xc4: /* 3-byte VEX */
> +        use_new = false;

Why?  You have support for By in the new decoder.

In the medium term, I wonder about passing in the vex.mmmmm argument,
so you can start someplace other than root.  Long term, that would go
away again when prefix processing is re-integrated with the new decoder.


r~


diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9b925c7ec8..04626fa086 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2816,7 +2816,6 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
 }
 
-static bool first = true; static unsigned long limit;
 #include "decode-new.c.inc"
 #include "decode-old.c.inc"
 
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index b8726608bb..1195fea7c7 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -819,9 +819,6 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
     X86DecodedInsn decode;
     X86DecodeFunc decode_func = decode_root;
 
-#ifdef CONFIG_USER_ONLY
-    --limit;
-#endif
     s->has_modrm = false;
 #if 0
     s->pc_start = s->pc = s->base.pc_next;
diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
index c97289a3e4..b96c677915 100644
--- a/target/i386/tcg/decode-old.c.inc
+++ b/target/i386/tcg/decode-old.c.inc
@@ -1808,24 +1808,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
     prefixes = 0;
 
-    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
-    bool use_new = true;
  next_byte:
     s->prefix = prefixes;
     b = x86_ldub_code(env, s);
     /* Collect prefixes.  */
     switch (b) {
-    default:
-#ifdef CONFIG_USER_ONLY
-        use_new &= limit > 0;
-#else
-        use_new &= b <= limit;
-#endif
-        if (use_new && b <= 0x1f) {
-            return disas_insn_new(s, cpu, b);
-        }
-    case 0x0f:
-        break;
     case 0xf3:
         prefixes |= PREFIX_REPZ;
         prefixes &= ~PREFIX_REPNZ;
@@ -1876,7 +1863,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
     case 0xc5: /* 2-byte VEX */
     case 0xc4: /* 3-byte VEX */
-        use_new = false;
         /* VEX prefixes cannot be used except in 32-bit mode.
            Otherwise the instruction is LES or LDS.  */
         if (CODE32(s) && !VM86(s)) {
@@ -1969,12 +1955,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         b = x86_ldub_code(env, s) | 0x100;
         goto reswitch;
 
+    case 0x00 ... 0x0e:
+    case 0x10 ... 0x1f:
+        return disas_insn_new(s, cpu, b);
+
         /**************************/
         /* arith & logic */
-    case 0x00 ... 0x05:
-    case 0x08 ... 0x0d:
-    case 0x10 ... 0x15:
-    case 0x18 ... 0x1d:
     case 0x20 ... 0x25:
     case 0x28 ... 0x2d:
     case 0x30 ... 0x35:
@@ -2764,40 +2750,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xc9: /* leave */
         gen_leave(s);
         break;
-    case 0x06: /* push es */
-    case 0x0e: /* push cs */
-    case 0x16: /* push ss */
-    case 0x1e: /* push ds */
-        if (CODE64(s))
-            goto illegal_op;
-        gen_op_movl_T0_seg(s, b >> 3);
-        gen_push_v(s, s->T0);
-        break;
     case 0x1a0: /* push fs */
     case 0x1a8: /* push gs */
         gen_op_movl_T0_seg(s, (b >> 3) & 7);
         gen_push_v(s, s->T0);
         break;
-    case 0x07: /* pop es */
-    case 0x17: /* pop ss */
-    case 0x1f: /* pop ds */
-        if (CODE64(s))
-            goto illegal_op;
-        reg = b >> 3;
-        ot = gen_pop_T0(s);
-        gen_movl_seg_T0(s, reg);
-        gen_pop_update(s, ot);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
-        break;
     case 0x1a1: /* pop fs */
     case 0x1a9: /* pop gs */
         ot = gen_pop_T0(s);


