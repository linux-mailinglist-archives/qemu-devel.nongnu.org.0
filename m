Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358460D167
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMUm-0002rm-Bw; Tue, 25 Oct 2022 12:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMUj-0002Xq-Ml
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:09:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMUh-0004MM-Pc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:09:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 e20-20020a05600c449400b003cce0107a6fso1043633wmo.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rd7WmxVww6pp0bZyoCmCXcPrk9JapwBc3YXEy27RSyc=;
 b=f02ISoPIdgD2S1VtB/RUD6PJW3cUsR0ejsnzJQz69ibuOFMYoZYcR2tTOUIsP4NE3J
 yhAoXlyYZVvulvrg9QUby4yNkdok7OGY8Axn2FYFv1VnvdEq/Z9rkqSwry+dY8I5MjUP
 vkZ/1IrkukK40vBHQfo3/jcjA17rOEMVymDgPC1xfS7xI1M1C/LG2C6V8/v+nF1S95jy
 bPeKjEQeLLxS9MIGH4u02yjtIcKWzRmTLfjuIWGBW/ddeMpWLi6pFBzcnLDYXTTchfnN
 FwcYN0/rKUSrweAKDD3WqFXAgNKg2/uaVnheIn8Q6bOzSM9LQDpyKSbRlZhrvklquJJR
 P54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rd7WmxVww6pp0bZyoCmCXcPrk9JapwBc3YXEy27RSyc=;
 b=f/dEkf3J7m9GHdLUzgEzUNIy41sv9FzTuxeDpANekch8RXele+7uBc7GqnoQnSHgSG
 J4oEGXey7aibmldGUApGTMTIvYhXnUzWHSRISYmHwZunqRlYynBAlcuaFbC4zuKhS2mj
 j0PT4nR3NRLS9l6fyFWqKkdWAyVbETL/Td9RwMLtqdR1TtBmGjtjCg6bwcl6gnpPecfq
 xciyqFXbEgi+Idr4Q/BDv3Xn59kz1XNonMlkiAFPQfa7WAGCBbb5eo7FSCr6aTH+zsCE
 93MAXnsPItEUQ/8kBUTO2EsUdsTLg1veP1t1+QKkUgIc4XlEsZM6fIOxEGntKfyWDPUb
 T/hg==
X-Gm-Message-State: ACrzQf0/zwYACHkBW0DSuC93UIVPJ1SYPSs8XYLWpA0/JhZM8k8w8JZg
 /CemY0Sedov0DpXhR8Cyce/n8g==
X-Google-Smtp-Source: AMsMyM5KfHp207WA3l3MHjgl6WcUnVJmHOZYjSI39yZeX+/dGkJDJOmY0he8YylZYas0je9EX2Ebyg==
X-Received: by 2002:a05:600c:2b94:b0:3c6:f941:a26f with SMTP id
 j20-20020a05600c2b9400b003c6f941a26fmr26227524wmc.8.1666714174012; 
 Tue, 25 Oct 2022 09:09:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff642000000b0022a3a887ceasm3000529wrp.49.2022.10.25.09.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:09:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D27431FFB7;
 Tue, 25 Oct 2022 17:09:32 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-16-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 15/24] accel/tcg: Use interval tree for TBs in user-only
 mode
Date: Tue, 25 Oct 2022 16:58:19 +0100
In-reply-to: <20221006031113.1139454-16-richard.henderson@linaro.org>
Message-ID: <87wn8n6g1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Begin weaning user-only away from PageDesc.
>
> Since, for user-only, all TB (and page) manipulation is done with
> a single mutex, and there is no virtual/physical discontinuity to
> split a TB across discontinuous pages, place all of the TBs into
> a single IntervalTree. This makes it trivial to find all of the
> TBs intersecting a range.
>
> Retain the existing PageDesc + linked list implementation for
> system mode.  Move the portion of the implementation that overlaps
> the new user-only code behind the common ifdef.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h      |  16 +-
>  include/exec/exec-all.h   |  43 ++++-
>  accel/tcg/tb-maint.c      | 388 ++++++++++++++++++++++----------------
>  accel/tcg/translate-all.c |   4 +-
>  4 files changed, 280 insertions(+), 171 deletions(-)
>
<snip>
> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index c8e921089d..14e8e47a6a 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -18,6 +18,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/interval-tree.h"
>  #include "exec/cputlb.h"
>  #include "exec/log.h"
>  #include "exec/exec-all.h"
> @@ -50,6 +51,75 @@ void tb_htable_init(void)
>      qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
>  }

I wonder for the sake of avoiding recompilation of units later on and
having a clean separation between user and system mode it would be worth
putting this stuff in a tb-maint-user.c?

>=20=20
> +#ifdef CONFIG_USER_ONLY
> +/*
> + * For user-only, since we are protecting all of memory with a single lo=
ck,
> + * and because the two pages of a TranslationBlock are always contiguous,
> + * use a single data structure to record all TranslationBlocks.
> + */
<snip>
> +
> +/*
> + * Called with mmap_lock held. If pc is not 0 then it indicates the
> + * host PC of the faulting store instruction that caused this invalidate.
> + * Returns true if the caller needs to abort execution of the current
> + * TB (because it was modified by this store and the guest CPU has
> + * precise-SMC semantics).
> + */
> +bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
> +{
> +    assert(pc !=3D 0);
> +#ifdef TARGET_HAS_PRECISE_SMC
> +    assert_memory_lock();

Out of interest is this just because x86 has such a strong memory model
you can get away with this sort of patching without explicit flushes?
I'm curious why this is the only arch we jump through these hoops for?

> +    {
> +        TranslationBlock *current_tb =3D tcg_tb_lookup(pc);
> +        bool current_tb_modified =3D false;
> +        TranslationBlock *tb;
> +        PageForEachNext n;
> +
> +        addr &=3D TARGET_PAGE_MASK;
> +
> +        PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
> +            if (current_tb =3D=3D tb &&
> +                (tb_cflags(current_tb) & CF_COUNT_MASK) !=3D 1) {
> +                /*
> +                 * If we are modifying the current TB, we must stop its
> +                 * execution. We could be more precise by checking that
> +                 * the modification is after the current PC, but it would
> +                 * require a specialized function to partially restore
> +                 * the CPU state.
> +                 */
> +                current_tb_modified =3D true;
> +                cpu_restore_state_from_tb(current_cpu, current_tb, pc, t=
rue);
> +            }
> +            tb_phys_invalidate__locked(tb);
> +        }
> +
> +        if (current_tb_modified) {
> +            /* Force execution of one insn next time.  */
> +            CPUState *cpu =3D current_cpu;
> +            cpu->cflags_next_tb =3D 1 | CF_NOIRQ | curr_cflags(current_c=
pu);
> +            return true;
> +        }
> +    }
> +#else
> +    tb_invalidate_phys_page(addr);
> +#endif /* TARGET_HAS_PRECISE_SMC */
> +    return false;
> +}
> +#else
>  /*
>   * @p must be non-NULL.
>   * user-mode: call with mmap_lock held.
> @@ -492,22 +637,17 @@ tb_invalidate_phys_page_range__locked(struct page_c=
ollection *pages,
>  {
>      TranslationBlock *tb;
>      tb_page_addr_t tb_start, tb_end;
> -    int n;
> +    PageForEachNext n;
>  #ifdef TARGET_HAS_PRECISE_SMC
> -    CPUState *cpu =3D current_cpu;
> -    bool current_tb_not_found =3D retaddr !=3D 0;
>      bool current_tb_modified =3D false;
> -    TranslationBlock *current_tb =3D NULL;
> +    TranslationBlock *current_tb =3D retaddr ? tcg_tb_lookup(retaddr) : =
NULL;
>  #endif /* TARGET_HAS_PRECISE_SMC */
>=20=20
> -    assert_page_locked(p);
> -
>      /*
>       * We remove all the TBs in the range [start, end[.
>       * XXX: see if in some cases it could be faster to invalidate all th=
e code
>       */

I'm guessing this comment is quite stale now given we try quite hard to
avoid doing lots of code gen over and over again. The only case I can
think of is memory clear routines after we've had code which there might
be some heuristics we could use to detect but don't currently.

<snip>

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

