Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93345442C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:49:52 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHZf-0006cb-0x
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnHXf-0005ur-EE
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:47:47 -0500
Received: from [2a00:1450:4864:20::42b] (port=40777
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnHXb-00042h-BO
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:47:45 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r8so3420438wra.7
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=35aCEfDWr94+1/B0Vc7qQY/6H4XWLupjbcSJrr9SuUk=;
 b=JqL9Vw2zuS4PhZmBeCxSOiVsX098uCUDy4mx7vLmcrcPR/WmvSHiXn9pj6msetEhnk
 s1si9Eeec+y8UBakpB9BQN1KFicn4K6HdNLSoUoZAt+T5VblDXLj54sHKr+t5+kJYezV
 2mHFvkoqrMt4D2mshkreS+2gFB9yLK1n8rFJhzuzM2r8i/gG6EzVtSiPRAby9FQLUOlY
 KVCnN+HL8sk/YfeQF5wztXpN25gH0LbL51CXSkW5fp9PDY+3seh/As7dc7gNniFqhDa2
 rECzh5qgq6JZj+dtUyc8CkI5B61i+h37FpKMzcFYvUb+OkOmxogkNv8lx93ifArUUVld
 6H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=35aCEfDWr94+1/B0Vc7qQY/6H4XWLupjbcSJrr9SuUk=;
 b=hMQJ6Q6sCCPpHcS7TlL7ehF3RqXjgTkXZkGepV+FXbuz0bvE7Tq//l20oprwkNSrmn
 n6gISIYYDpwCZwpBzwQ9DfSllSMz8YTULywOnWTIl75uPWYEj0b6EnECb8Enl7D2+eBw
 64JVhwhpLKWwy6hLfCKaKrKSMdp3yjbAeYFOpv7Z+ErPz1J3/ZQKVy5yhQ9OprZklBEN
 vYNMjd1gOiQr6WtjpQxke+NJ48IVk3emmNylEt+CcAEwyZBCx/i0mJg9KYjlRIClEVOK
 R+EQCxYCO2fRCzZHbKW5bWnCyjZqTFGZ+Ao5fxZ8AOXewY9GvCHQLA/fRk87P61/X80a
 MXbQ==
X-Gm-Message-State: AOAM533iYty4iyhFt8vIioKNe3cuuKmJIBA5x7nN22DkkHiZPc9UposX
 4YoutATWL6EymtTkkX3qBwP3rg==
X-Google-Smtp-Source: ABdhPJyLnPHJMslqtbNrKocmKSaLrEyvmvyBt7rToTLYtHRsFkjdWZgIQEYS6Tr12k5eZ/mHNZXrPg==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr18758359wrr.11.1637142460327; 
 Wed, 17 Nov 2021 01:47:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o26sm4970701wmc.17.2021.11.17.01.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 01:47:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E47D81FF96;
 Wed, 17 Nov 2021 09:47:38 +0000 (GMT)
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about
 to execute
Date: Wed, 17 Nov 2021 09:47:01 +0000
In-reply-to: <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
Message-ID: <87h7cbw1tx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> When debugging with the watchpoints, qemu may need to create
> TB with single instruction. This is achieved by setting cpu->cflags_next_=
tb.
> But when this block is about to execute, it may be interrupted by another
> thread. In this case cflags will be lost and next executed TB will not
> be the special one.
> This patch checks TB exit reason and restores cflags_next_tb to allow
> finding the interrupted block.

How about this alternative?

--8<---------------cut here---------------start------------->8---
accel/tcg: suppress IRQ check for special TBs

Generally when we set cpu->cflags_next_tb it is because we want to
carefully control the execution of the next TB. Currently there is a
race that causes cflags_next_tb to get ignored if an IRQ is processed
before we execute any actual instructions.

To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
this check in the generated code so we know we will definitely execute
the next block.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245

3 files changed, 22 insertions(+), 3 deletions(-)
include/exec/exec-all.h   |  1 +
include/exec/gen-icount.h | 19 ++++++++++++++++---
accel/tcg/cpu-exec.c      |  5 +++++

modified   include/exec/exec-all.h
@@ -503,6 +503,7 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT    0x00020000
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock hel=
d */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel contex=
t */
+#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
=20
modified   include/exec/gen-icount.h
@@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock *t=
b)
 {
     TCGv_i32 count;
=20
-    tcg_ctx->exitreq_label =3D gen_new_label();
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         count =3D tcg_temp_local_new_i32();
     } else {
@@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBlock *=
tb)
         icount_start_insn =3D tcg_last_op();
     }
=20
-    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    /*
+     * Emit the check against icount_decr.u32 to see if we should exit
+     * unless we suppress the check with CF_NOIRQ. If we are using
+     * icount and have suppressed interruption the higher level code
+     * should have ensured we don't run more instructions than the
+     * budget.
+     */
+    if (tb_cflags(tb) & CF_NOIRQ) {
+        tcg_ctx->exitreq_label =3D NULL;
+    } else {
+        tcg_ctx->exitreq_label =3D gen_new_label();
+        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    }
=20
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         tcg_gen_st16_i32(count, cpu_env,
@@ -74,7 +85,9 @@ static inline void gen_tb_end(const TranslationBlock *tb,=
 int num_insns)
                            tcgv_i32_arg(tcg_constant_i32(num_insns)));
     }
=20
-    gen_set_label(tcg_ctx->exitreq_label);
+    if (tcg_ctx->exitreq_label) {
+        gen_set_label(tcg_ctx->exitreq_label);
+    }
     tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
 }
=20
modified   accel/tcg/cpu-exec.c
@@ -954,11 +954,16 @@ int cpu_exec(CPUState *cpu)
              * after-access watchpoints.  Since this request should never
              * have CF_INVALID set, -1 is a convenient invalid value that
              * does not require tcg headers for cpu_common_reset.
+             *
+             * As we don't want this special TB being interrupted by
+             * some sort of asynchronous event we apply CF_NOIRQ to
+             * disable the usual event checking.
              */
             cflags =3D cpu->cflags_next_tb;
             if (cflags =3D=3D -1) {
                 cflags =3D curr_cflags(cpu);
             } else {
+                cflags |=3D CF_NOIRQ;
                 cpu->cflags_next_tb =3D -1;
             }
=20
--8<---------------cut here---------------end--------------->8---

>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/cpu-exec.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2d14d02f6c..df12452b8f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -846,6 +846,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, T=
ranslationBlock *tb,
>           * cpu_handle_interrupt.  cpu_handle_interrupt will also
>           * clear cpu->icount_decr.u16.high.
>           */
> +        if (cpu->cflags_next_tb =3D=3D -1
> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
> +                || cpu_neg(cpu)->icount_decr.u16.low >=3D tb->icount)) {
> +            /*
> +             * icount is disabled or there are enough instructions
> +             * in the budget, do not retranslate this block with
> +             * different parameters.
> +             */
> +            cpu->cflags_next_tb =3D tb->cflags;
> +        }
>          return;
>      }
>=20=20


--=20
Alex Benn=C3=A9e

