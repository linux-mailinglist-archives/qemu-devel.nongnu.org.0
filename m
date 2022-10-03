Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CD5F31B9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:03:48 +0200 (CEST)
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofM2t-0000bT-Sf
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofLpy-0003nb-Vx
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:50:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofLpw-00039o-IB
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:50:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a3so4572765wrt.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=DqhahMheD2f6MxxH/HmT28BtA5XnXgyRgBr70YiSXuw=;
 b=wSYHBmRW70rHLIZ3jEcBSDjdaL3l66mvd4/Hi4D38/y5LX28nac0ka5qI9Jxy47jk+
 Ko7Wcu9ee3RbCRsP6SCo4HzMOGq190FghvVS5gxp1fOGgOKl74RD6EeMgpMyKOGcesCw
 aAuSMcCMKt13kuGCqo1YsY6ikaKMzQyugafAEW1ODnZq+llI2mWqUv5/h+qG0ApTVJU6
 A2lXt3NznA2gHFmvoiRKYfggHe+brFyeIsnSXLFdAgsvIpMa86Cy0+C7sPDdEGu35cOz
 l6Fdb4lFsvna+vYj713/oL7cQ6PT+5iq6+yawQnCEXAc8+00iuLbhqcesZQ3UC4Gp09o
 Op/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=DqhahMheD2f6MxxH/HmT28BtA5XnXgyRgBr70YiSXuw=;
 b=D5/tXSe9TC6u9DbbPnKNbfT+IHjvpgbaVfPnFQYgHkixwVYFy7LGGNefoQqFw88kDj
 ZYhZV3egooHp8B8BBXdds6yEnrIygYlV1YVsMdGxuFn1DwzQwAlaEfZDt33BrWEUj4CX
 u0F9asViRyo0YVbpKkPBvIJjS8K6iU658P7uwdVxWztGQYC08By1kA7rMxl2+WKQJZyB
 ydxRKEl/p5uKBeDSbJvMn9PbJqYDAHRaUFhtmtxddiEN1m7614w4ophh2LHAMOQKsSwC
 /j/3in/liJiXd8FUIOWxcM2tlerNcERDt5pAFyjdKp3vnC/9PRRmlhTf4c6y/Te8x5ou
 +Xrg==
X-Gm-Message-State: ACrzQf33eOjl4nLTRrxxcNFu4OZedk5aTzugZBDoNQFoaUyJU7NDjdRG
 XUYTLvGkMQLnubhw47mrS6nOtg==
X-Google-Smtp-Source: AMsMyM7y9d+SnkCGW44dQHZt4nH3tjOKgLsBtLbZwjQvzkTHEbpWoM+Wr2F52kLjsOO1JM5C/Wuhzg==
X-Received: by 2002:a05:6000:144d:b0:22a:f4ef:c900 with SMTP id
 v13-20020a056000144d00b0022af4efc900mr13570209wrx.678.1664805022551; 
 Mon, 03 Oct 2022 06:50:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c0a0200b003b48dac344esm18035154wmp.43.2022.10.03.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 06:50:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18DFD1FFB7;
 Mon,  3 Oct 2022 14:50:21 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-19-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 18/18] accel/tcg: Introduce TARGET_TB_PCREL
Date: Mon, 03 Oct 2022 14:46:28 +0100
In-reply-to: <20220930212622.108363-19-richard.henderson@linaro.org>
Message-ID: <87y1txm2xu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> Prepare for targets to be able to produce TBs that can
> run in more than one virtual context.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h      |  4 +++
>  accel/tcg/tb-jmp-cache.h  |  5 ++++
>  include/exec/cpu-defs.h   |  3 +++
>  include/exec/exec-all.h   | 32 ++++++++++++++++++++--
>  accel/tcg/cpu-exec.c      | 56 +++++++++++++++++++++++++++++++--------
>  accel/tcg/translate-all.c | 50 +++++++++++++++++++++-------------
>  6 files changed, 119 insertions(+), 31 deletions(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index a3875a3b5a..dc800fd485 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -21,7 +21,11 @@ void tb_htable_init(void);
>  /* Return the current PC from CPU, which may be cached in TB. */
>  static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock =
*tb)
>  {
> +#if TARGET_TB_PCREL
> +    return cpu->cc->get_pc(cpu);
> +#else
>      return tb_pc(tb);
> +#endif
>  }
>=20=20
>  #endif /* ACCEL_TCG_INTERNAL_H */
> diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
> index 2d8fbb1bfe..a7288150bc 100644
> --- a/accel/tcg/tb-jmp-cache.h
> +++ b/accel/tcg/tb-jmp-cache.h
> @@ -14,10 +14,15 @@
>=20=20
>  /*
>   * Accessed in parallel; all accesses to 'tb' must be atomic.
> + * For TARGET_TB_PCREL, accesses to 'pc' must be protected by
> + * a load_acquire/store_release to 'tb'.
>   */
>  struct CPUJumpCache {
>      struct {
>          TranslationBlock *tb;
> +#if TARGET_TB_PCREL
> +        target_ulong pc;
> +#endif
>      } array[TB_JMP_CACHE_SIZE];
>  };
>=20=20
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 67239b4e5e..21309cf567 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -54,6 +54,9 @@
>  #  error TARGET_PAGE_BITS must be defined in cpu-param.h
>  # endif
>  #endif
> +#ifndef TARGET_TB_PCREL
> +# define TARGET_TB_PCREL 0
> +#endif
>=20=20
>  #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
>=20=20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 7ea6026ba9..e5f8b224a5 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -496,8 +496,32 @@ struct tb_tc {
>  };
>=20=20
>  struct TranslationBlock {
> -    target_ulong pc;   /* simulated PC corresponding to this block (EIP =
+ CS base) */
> -    target_ulong cs_base; /* CS base for this block */
> +#if !TARGET_TB_PCREL
> +    /*
> +     * Guest PC corresponding to this block.  This must be the true
> +     * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
> +     * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
> +     * privilege, must store those bits elsewhere.
> +     *
> +     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
> +     * written such that the TB is associated only with the physical
> +     * page and may be run in any virtual address context.  In this case,
> +     * PC must always be taken from ENV in a target-specific manner.
> +     * Unwind information is taken as offsets from the page, to be
> +     * deposited into the "current" PC.
> +     */
> +    target_ulong pc;
> +#endif
> +
> +    /*
> +     * Target-specific data associated with the TranslationBlock, e.g.:
> +     * x86: the original user, the Code Segment virtual base,
> +     * arm: an extension of tb->flags,
> +     * s390x: instruction data for EXECUTE,
> +     * sparc: the next pc of the instruction queue (for delay slots).
> +     */
> +    target_ulong cs_base;
> +
>      uint32_t flags; /* flags defining in which context the code was gene=
rated */
>      uint32_t cflags;    /* compile flags */
>=20=20
> @@ -573,7 +597,11 @@ struct TranslationBlock {
>  /* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
>  static inline target_ulong tb_pc(const TranslationBlock *tb)
>  {
> +#if TARGET_TB_PCREL
> +    qemu_build_not_reached();
> +#else
>      return tb->pc;
> +#endif
>  }
>=20=20
>  /* Hide the qatomic_read to make code a little easier on the eyes */
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 8b3f8435fb..acb5646b03 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *=
d)
>      const TranslationBlock *tb =3D p;
>      const struct tb_desc *desc =3D d;
>=20=20
> -    if (tb_pc(tb) =3D=3D desc->pc &&
> +    if ((TARGET_TB_PCREL || tb_pc(tb) =3D=3D desc->pc) &&
>          tb->page_addr[0] =3D=3D desc->page_addr0 &&
>          tb->cs_base =3D=3D desc->cs_base &&
>          tb->flags =3D=3D desc->flags &&
> @@ -237,7 +237,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *c=
pu, target_ulong pc,
>          return NULL;
>      }
>      desc.page_addr0 =3D phys_pc;
> -    h =3D tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
> +    h =3D tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
> +                     flags, cflags, *cpu->trace_dstate);
>      return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
>  }
>=20=20
> @@ -247,27 +248,52 @@ static inline TranslationBlock *tb_lookup(CPUState =
*cpu, target_ulong pc,
>                                            uint32_t flags, uint32_t cflag=
s)
>  {
>      TranslationBlock *tb;
> +    CPUJumpCache *jc;
>      uint32_t hash;
>=20=20
>      /* we should never be trying to look up an INVALID tb */
>      tcg_debug_assert(!(cflags & CF_INVALID));
>=20=20
>      hash =3D tb_jmp_cache_hash_func(pc);
> -    tb =3D qatomic_rcu_read(&cpu->tb_jmp_cache->array[hash].tb);
> +    jc =3D cpu->tb_jmp_cache;
> +#if TARGET_TB_PCREL
> +    /* Use acquire to ensure current load of pc from jc. */
> +    tb =3D qatomic_load_acquire(&jc->array[hash].tb);
> +#else
> +    /* Use rcu_read to ensure current load of pc from *tb. */
> +    tb =3D qatomic_rcu_read(&jc->array[hash].tb);
> +#endif

You could further hide the #ifdef nastiness by wrapping this load and
the store further down into appropriate inline helpers in tb-jmp-cache.h.

>=20=20
> -    if (likely(tb &&
> -               tb->pc =3D=3D pc &&
> -               tb->cs_base =3D=3D cs_base &&
> -               tb->flags =3D=3D flags &&
> -               tb->trace_vcpu_dstate =3D=3D *cpu->trace_dstate &&
> -               tb_cflags(tb) =3D=3D cflags)) {
> -        return tb;
> +    if (likely(tb)) {
> +        target_ulong jmp_pc;
> +
> +#if TARGET_TB_PCREL
> +        jmp_pc =3D jc->array[hash].pc;
> +#else
> +        jmp_pc =3D tb_pc(tb);
> +#endif
> +        if (jmp_pc =3D=3D pc &&
> +            tb->cs_base =3D=3D cs_base &&
> +            tb->flags =3D=3D flags &&
> +            tb->trace_vcpu_dstate =3D=3D *cpu->trace_dstate &&
> +            tb_cflags(tb) =3D=3D cflags) {
> +            return tb;
> +        }
>      }
> +
>      tb =3D tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
>      if (tb =3D=3D NULL) {
>          return NULL;
>      }
> -    qatomic_set(&cpu->tb_jmp_cache->array[hash].tb, tb);
> +
> +#if TARGET_TB_PCREL
> +    jc->array[hash].pc =3D pc;
> +    /* Use store_release on tb to ensure pc is written first. */
> +    qatomic_store_release(&jc->array[hash].tb, tb);
> +#else
> +    qatomic_set(&jc->array[hash].tb, tb);
> +#endif
> +
>      return tb;
>  }
>=20=20
> @@ -453,6 +479,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int=
 *tb_exit)
>          if (cc->tcg_ops->synchronize_from_tb) {
>              cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
>          } else {
> +            assert(!TARGET_TB_PCREL);
>              assert(cc->set_pc);
>              cc->set_pc(cpu, tb_pc(last_tb));
>          }
> @@ -1002,7 +1029,14 @@ int cpu_exec(CPUState *cpu)
>                   * for the fast lookup
>                   */
>                  h =3D tb_jmp_cache_hash_func(pc);

And re-use the helper here as well.

> +
> +#if TARGET_TB_PCREL
> +                cpu->tb_jmp_cache->array[h].pc =3D pc;
> +                /* Use store_release on tb to ensure pc is current. */
> +                qatomic_store_release(&cpu->tb_jmp_cache->array[h].tb, t=
b);
> +#else
>                  qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
> +#endif
>              }
>=20=20
>  #ifndef CONFIG_USER_ONLY
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 13c964dcd8..776ac9efe4 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -299,7 +299,7 @@ static int encode_search(TranslationBlock *tb, uint8_=
t *block)
>=20=20
>          for (j =3D 0; j < TARGET_INSN_START_WORDS; ++j) {
>              if (i =3D=3D 0) {
> -                prev =3D (j =3D=3D 0 ? tb_pc(tb) : 0);
> +                prev =3D (!TARGET_TB_PCREL && j =3D=3D 0 ? tb_pc(tb) : 0=
);
>              } else {
>                  prev =3D tcg_ctx->gen_insn_data[i - 1][j];
>              }
> @@ -327,7 +327,7 @@ static int encode_search(TranslationBlock *tb, uint8_=
t *block)
>  static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>                                       uintptr_t searched_pc, bool reset_i=
count)
>  {
> -    target_ulong data[TARGET_INSN_START_WORDS] =3D { tb_pc(tb) };
> +    target_ulong data[TARGET_INSN_START_WORDS];
>      uintptr_t host_pc =3D (uintptr_t)tb->tc.ptr;
>      CPUArchState *env =3D cpu->env_ptr;
>      const uint8_t *p =3D tb->tc.ptr + tb->tc.size;
> @@ -343,6 +343,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, =
TranslationBlock *tb,
>          return -1;
>      }
>=20=20
> +    memset(data, 0, sizeof(data));
> +    if (!TARGET_TB_PCREL) {
> +        data[0] =3D tb_pc(tb);
> +    }
> +
>      /* Reconstruct the stored insn data while looking for the point at
>         which the end of the insn exceeds the searched_pc.  */
>      for (i =3D 0; i < num_insns; ++i) {
> @@ -885,13 +890,13 @@ static bool tb_cmp(const void *ap, const void *bp)
>      const TranslationBlock *a =3D ap;
>      const TranslationBlock *b =3D bp;
>=20=20
> -    return tb_pc(a) =3D=3D tb_pc(b) &&
> -        a->cs_base =3D=3D b->cs_base &&
> -        a->flags =3D=3D b->flags &&
> -        (tb_cflags(a) & ~CF_INVALID) =3D=3D (tb_cflags(b) & ~CF_INVALID)=
 &&
> -        a->trace_vcpu_dstate =3D=3D b->trace_vcpu_dstate &&
> -        a->page_addr[0] =3D=3D b->page_addr[0] &&
> -        a->page_addr[1] =3D=3D b->page_addr[1];
> +    return ((TARGET_TB_PCREL || tb_pc(a) =3D=3D tb_pc(b)) &&
> +            a->cs_base =3D=3D b->cs_base &&
> +            a->flags =3D=3D b->flags &&
> +            (tb_cflags(a) & ~CF_INVALID) =3D=3D (tb_cflags(b) & ~CF_INVA=
LID) &&
> +            a->trace_vcpu_dstate =3D=3D b->trace_vcpu_dstate &&
> +            a->page_addr[0] =3D=3D b->page_addr[0] &&
> +            a->page_addr[1] =3D=3D b->page_addr[1]);
>  }
>=20=20
>  void tb_htable_init(void)
> @@ -1170,8 +1175,8 @@ static void do_tb_phys_invalidate(TranslationBlock =
*tb, bool rm_from_page_list)
>=20=20
>      /* remove the TB from the hash list */
>      phys_pc =3D tb->page_addr[0];
> -    h =3D tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
> -                     tb->trace_vcpu_dstate);
> +    h =3D tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
> +                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
>      if (!qht_remove(&tb_ctx.htable, tb, h)) {
>          return;
>      }
> @@ -1187,11 +1192,18 @@ static void do_tb_phys_invalidate(TranslationBloc=
k *tb, bool rm_from_page_list)
>      }
>=20=20
>      /* remove the TB from the hash list */
> -    h =3D tb_jmp_cache_hash_func(tb->pc);
> -    CPU_FOREACH(cpu) {
> -        CPUJumpCache *jc =3D cpu->tb_jmp_cache;
> -        if (qatomic_read(&jc->array[h].tb) =3D=3D tb) {
> -            qatomic_set(&jc->array[h].tb, NULL);
> +    if (TARGET_TB_PCREL) {
> +        /* A TB may be at any virtual address */
> +        CPU_FOREACH(cpu) {
> +            tcg_flush_jmp_cache(cpu);
> +        }
> +    } else {
> +        h =3D tb_jmp_cache_hash_func(tb_pc(tb));
> +        CPU_FOREACH(cpu) {
> +            CPUJumpCache *jc =3D cpu->tb_jmp_cache;
> +            if (qatomic_read(&jc->array[h].tb) =3D=3D tb) {
> +                qatomic_set(&jc->array[h].tb, NULL);
> +            }
>          }

This code should also be a inline helper.

>      }
>=20=20
> @@ -1302,8 +1314,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t p=
hys_pc,
>      }
>=20=20
>      /* add in the hash table */
> -    h =3D tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
> -                     tb->trace_vcpu_dstate);
> +    h =3D tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
> +                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
>      qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
>=20=20
>      /* remove TB from the page(s) if we couldn't insert it */
> @@ -1373,7 +1385,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>=20=20
>      gen_code_buf =3D tcg_ctx->code_gen_ptr;
>      tb->tc.ptr =3D tcg_splitwx_to_rx(gen_code_buf);
> +#if !TARGET_TB_PCREL
>      tb->pc =3D pc;
> +#endif
>      tb->cs_base =3D cs_base;
>      tb->flags =3D flags;
>      tb->cflags =3D cflags;


--=20
Alex Benn=C3=A9e

