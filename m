Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22155EFA13
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:19:01 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwFY-0007ic-ON
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odtus-00085J-7f
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:49:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odtun-0006bX-Ix
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:49:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id h7so2276423wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=yZHmJy7jRNhB7Vec2UHN605SDfSo7OTvKbvcJiWHfFA=;
 b=S+Yt9dpdmBj817rqDvNVnZ4swq1rP8m1H6XXennHZGSqqFa4UcnkhN2RYv+Dr2xypG
 vqMjNZl+ieJXLUVCntXbh5wEEsxNuAeq+FMkwuN3nyFTQ1br2d5FR+A2jCbR4sInNp1B
 TgKiCu7ZXMDFBkvsgVhkqn4IS8JjLSw6bRy6zPmr5umhlzr8jIUO4g9XttEy6UWXY0YA
 kCuWMaVwa+Gh73QTKsguwpcdUpDq6XFKi1BSTS/7UkivVrXZaPW7miLNMlO1DSPBkH1D
 LJppoU4Qpmf+fvKnyLYhcDw8bkNrORs3l+Fo+9m8SDEgJ/sph8wZ48jpqkb5S4tB+dVN
 hvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=yZHmJy7jRNhB7Vec2UHN605SDfSo7OTvKbvcJiWHfFA=;
 b=EhL91oARCqhSlTxJwWqjheTYrkRVkh60js/7W28+1hTYMcgXgUhTISkVv2G0+VHK6k
 W5wd0DgAnrjeBbkS5E7JqzMKmIgMKwn/+Kw1RVfXwrEhX679x55yZgqH5ZHkRjMXhAlZ
 kn/dfctNoovQIa+qSnH6gfJONu32ub2lw/+CbWSsShOKRy8wrapSQtlmm+sgTs+sptpy
 y6Wdsx5kubKWxgI+Mf7QY3Btelm++nY36kzlQvorIg5xHh49ooy8CoUL5o97EYpmrImV
 vuxzvLv3eO3AzZAFqLtq6zN/8RO7MVPVTIVwCqMH1VhECv5yr3Cpu5W1RrWloscbdHh8
 pVgQ==
X-Gm-Message-State: ACrzQf1dbcedjRwVuXXKGssbvMga0oDVlNeCp1+UkqzjBzZcR3X3dTOI
 dnkuGztXJDmOsCy48q2vOYd/vA==
X-Google-Smtp-Source: AMsMyM6k5Tg8T6svUE22h4XuJbjDt4d8oMG7DlJFDFYbbQ9YIL8IH8ZuOW5fPC//9jZXmaYID8luTA==
X-Received: by 2002:a5d:47c1:0:b0:22a:5858:993b with SMTP id
 o1-20020a5d47c1000000b0022a5858993bmr2407762wrc.99.1664459362727; 
 Thu, 29 Sep 2022 06:49:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adfe40e000000b0022ae8b862a7sm6657902wrm.35.2022.09.29.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:49:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E7261FFB7;
 Thu, 29 Sep 2022 14:49:21 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-15-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 14/17] include/hw/core: Create struct CPUJumpCache
Date: Thu, 29 Sep 2022 14:46:45 +0100
In-reply-to: <20220925105124.82033-15-richard.henderson@linaro.org>
Message-ID: <87k05mz3xa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Wrap the bare TranslationBlock pointer into a structure.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h     | 8 ++++++--
>  accel/tcg/cpu-exec.c      | 9 ++++++---
>  accel/tcg/cputlb.c        | 2 +-
>  accel/tcg/translate-all.c | 4 ++--
>  4 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 9e47184513..ee5b75dea0 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -232,6 +232,10 @@ struct hvf_vcpu_state;
>  #define TB_JMP_CACHE_BITS 12
>  #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
>=20=20
> +typedef struct {
> +    TranslationBlock *tb;
> +} CPUJumpCache;
> +

I don't quite follow whats going on here. I see we add vaddr pc in a
later patch but I don't quite see why a cache for looking up TBs gets a
sidechan value added later.

Is this because the vaddr will no longer match the tb->pc? Maybe a
comment on the structure is needed?

>  /* work queue */
>=20=20
>  /* The union type allows passing of 64 bit target pointers on 32 bit
> @@ -361,7 +365,7 @@ struct CPUState {
>      IcountDecr *icount_decr_ptr;
>=20=20
>      /* Accessed in parallel; all accesses must be atomic */
> -    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
> +    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
>=20=20
>      struct GDBRegisterState *gdb_regs;
>      int gdb_num_regs;
> @@ -452,7 +456,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *c=
pu)
>      unsigned int i;
>=20=20
>      for (i =3D 0; i < TB_JMP_CACHE_SIZE; i++) {
> -        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
> +        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
>      }
>  }
>=20=20
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index dd58a144a8..c6283d5798 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -252,7 +252,7 @@ static inline TranslationBlock *tb_lookup(CPUState *c=
pu, target_ulong pc,
>      tcg_debug_assert(!(cflags & CF_INVALID));
>=20=20
>      hash =3D tb_jmp_cache_hash_func(pc);
> -    tb =3D qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
> +    tb =3D qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
>=20=20
>      if (likely(tb &&
>                 tb->pc =3D=3D pc &&
> @@ -266,7 +266,7 @@ static inline TranslationBlock *tb_lookup(CPUState *c=
pu, target_ulong pc,
>      if (tb =3D=3D NULL) {
>          return NULL;
>      }
> -    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
> +    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
>      return tb;
>  }
>=20=20
> @@ -987,6 +987,8 @@ int cpu_exec(CPUState *cpu)
>=20=20
>              tb =3D tb_lookup(cpu, pc, cs_base, flags, cflags);
>              if (tb =3D=3D NULL) {
> +                uint32_t h;
> +
>                  mmap_lock();
>                  tb =3D tb_gen_code(cpu, pc, cs_base, flags, cflags);
>                  mmap_unlock();
> @@ -994,7 +996,8 @@ int cpu_exec(CPUState *cpu)
>                   * We add the TB in the virtual pc hash table
>                   * for the fast lookup
>                   */
> -                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc=
)], tb);
> +                h =3D tb_jmp_cache_hash_func(pc);
> +                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
>              }
>=20=20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index f5e6ca2da2..fb8f3087f1 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, ta=
rget_ulong page_addr)
>      unsigned int i, i0 =3D tb_jmp_cache_hash_page(page_addr);
>=20=20
>      for (i =3D 0; i < TB_JMP_PAGE_SIZE; i++) {
> -        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
> +        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
>      }
>  }
>=20=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index f429d33981..efa479ccf3 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1187,8 +1187,8 @@ static void do_tb_phys_invalidate(TranslationBlock =
*tb, bool rm_from_page_list)
>      /* remove the TB from the hash list */
>      h =3D tb_jmp_cache_hash_func(tb->pc);
>      CPU_FOREACH(cpu) {
> -        if (qatomic_read(&cpu->tb_jmp_cache[h]) =3D=3D tb) {
> -            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
> +        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) =3D=3D tb) {
> +            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
>          }
>      }


--=20
Alex Benn=C3=A9e

