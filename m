Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54C6F3CCF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 06:51:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pthxY-00020u-Cz; Tue, 02 May 2023 00:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pthxU-00020D-Ra; Tue, 02 May 2023 00:49:48 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pthxS-00088D-Qm; Tue, 02 May 2023 00:49:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64115eef620so31800404b3a.1; 
 Mon, 01 May 2023 21:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683002984; x=1685594984;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MifQdYUg1G/ADtq6QFsZ8PZXTX0qMXWSO/bOUdJU1P0=;
 b=YJkdIDqlmpBZgL20t2bMlRihM77zWcTXR4DruRJbFuDMjfrhijIff9/8n9sL4pvUhY
 KduIMllUH9b1LVHGrK9urrZaYxwfuF4w9GvFBoqMIPQyr/TaG4sap1nvmoExyguO8C9n
 MZ5Oijtd5bsZrTN1pXMHPrBI1Bdob9CpkbEK9BqZSW1toXA87r2cX6U6SY1MTlx9542O
 ppVQwyAEXRkKl12/iTJbW7Zs5W59SZeNAWItp/v2TaS9pZ2w8IW6SDG8B6phNQgCXxR9
 KjvRTMvciJTCt3PKjln5KBGq4BwUJEZrkWRda/4kalNfj/aGYe37ATZfqv/q/zH/HfLF
 cL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683002984; x=1685594984;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MifQdYUg1G/ADtq6QFsZ8PZXTX0qMXWSO/bOUdJU1P0=;
 b=SXfIfpYZBvfql4okUDr54HLlM8kRY5IWI3H2v3wpNkFuflwB6aRuF9VL38VV8OnzKu
 NaE5F5Tov4Vdh+BgeTlVWJcYYAysdYMy84wSQwHfA3OSlGPOrFkFkjSNsncCRunLFhxB
 pC57bYTWIDiu4Sc/aYsYhTqTwykC+Xk0IJ4zbl6QqYkcHEkLrTYIVIUcCM1ent8FoMwz
 uj6BJ+P10MepRswYlj59eN/qGiuUITmUFLxg40p+vT9wllMGsLaiSKctHhSyntS4RMFN
 nEBBpzOMvFA3WPcU7zI6DVnFmYzrzn13ahBoY1I2hW8tzhMrRGMadVkcAkRn+5PsdO/9
 9OHA==
X-Gm-Message-State: AC+VfDzxGoAvu5ATtsvwYAONyoNaVnslDc/Lr8nxhADcYt8mV/XpHJt7
 bRKhm0imViD2dKb55X05v0A=
X-Google-Smtp-Source: ACHHUZ4MzdfIYY+VT2TbrLQ88vG8AGCsh9GbI4iGWOgJ7tdeXxRPHeaIVh7HC/yNwc5LS7vINYB0QQ==
X-Received: by 2002:a05:6a00:c8e:b0:63b:8da4:352e with SMTP id
 a14-20020a056a000c8e00b0063b8da4352emr30292149pfv.1.1683002983632; 
 Mon, 01 May 2023 21:49:43 -0700 (PDT)
Received: from localhost (118-208-214-188.tpgi.com.au. [118.208.214.188])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a62f84e000000b0063b6d68f4bcsm20604918pfm.41.2023.05.01.21.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 21:49:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 14:49:38 +1000
Message-Id: <CSBIRIKYBL78.3GGM8KZ1ERZUC@wheely>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/4] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-3-harshpb@linux.ibm.com>
In-Reply-To: <20230424144712.1985425-3-harshpb@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> h_enter_nested() currently does a lot of register specific operations
> which should be abstracted logically to simplify the code for better
> readability. This patch breaks down relevant blocks into respective
> helper routines to make use of them for better readability/maintenance.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 117 ++++++++++++++++++++++++++++---------------
>  1 file changed, 78 insertions(+), 39 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 124cee5e53..f24d4b368e 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1544,6 +1544,81 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU=
 *cpu,
>      return H_FUNCTION;
>  }
> =20
> +static void restore_hdec_from_hvstate(CPUPPCState *dst,
> +                                      struct kvmppc_hv_guest_state *hv_s=
tate,
> +                                      target_ulong now)
> +{
> +    target_ulong hdec;
> +
> +    assert(hv_state);
> +    hdec =3D hv_state->hdec_expiry - now;
> +    cpu_ppc_hdecr_init(dst);
> +    cpu_ppc_store_hdecr(dst, hdec);
> +}
> +
> +static void restore_lpcr_from_hvstate(PowerPCCPU *cpu,
> +                                      struct kvmppc_hv_guest_state *hv_s=
tate)
> +{
> +    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *dst =3D &cpu->env;
> +    target_ulong lpcr, lpcr_mask;
> +
> +    assert(hv_state);
> +    lpcr_mask =3D LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
> +    lpcr =3D (dst->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state->lpcr & lpcr_=
mask);
> +    lpcr |=3D LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
> +    lpcr &=3D ~LPCR_LPES0;
> +    dst->spr[SPR_LPCR] =3D lpcr & pcc->lpcr_mask;
> +}
> +
> +static void restore_env_from_ptregs(CPUPPCState *env,
> +                                    struct kvmppc_pt_regs *regs)
> +{
> +    assert(env);
> +    assert(regs);
> +    assert(sizeof(env->gpr) =3D=3D sizeof(regs->gpr));
> +    memcpy(env->gpr, regs->gpr, sizeof(env->gpr));
> +    env->nip =3D regs->nip;
> +    env->msr =3D regs->msr;
> +    env->lr =3D regs->link;
> +    env->ctr =3D regs->ctr;
> +    cpu_write_xer(env, regs->xer);
> +    ppc_store_cr(env, regs->ccr);
> +}
> +
> +static void restore_env_from_hvstate(CPUPPCState *env,
> +                                     struct kvmppc_hv_guest_state *hv_st=
ate)
> +{
> +    assert(env);
> +    assert(hv_state);
> +    env->spr[SPR_HFSCR] =3D hv_state->hfscr;
> +    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR S=
PRs*/
> +    env->cfar =3D hv_state->cfar;
> +    env->spr[SPR_PCR] =3D hv_state->pcr;
> +    env->spr[SPR_DPDES] =3D hv_state->dpdes;
> +    env->spr[SPR_SRR0] =3D hv_state->srr0;
> +    env->spr[SPR_SRR1] =3D hv_state->srr1;
> +    env->spr[SPR_SPRG0] =3D hv_state->sprg[0];
> +    env->spr[SPR_SPRG1] =3D hv_state->sprg[1];
> +    env->spr[SPR_SPRG2] =3D hv_state->sprg[2];
> +    env->spr[SPR_SPRG3] =3D hv_state->sprg[3];
> +    env->spr[SPR_BOOKS_PID] =3D hv_state->pidr;
> +    env->spr[SPR_PPR] =3D hv_state->ppr;
> +}
> +
> +static inline void restore_l2_env(PowerPCCPU *cpu,
> +		                  struct kvmppc_hv_guest_state *hv_state,
> +				  struct kvmppc_pt_regs *regs,
> +				  target_ulong now)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    restore_env_from_ptregs(env, regs);
> +    restore_env_from_hvstate(env, hv_state);
> +    restore_lpcr_from_hvstate(cpu, hv_state);
> +    restore_hdec_from_hvstate(env, hv_state, now);
> +}
> +
>  /*
>   * When this handler returns, the environment is switched to the L2 gues=
t
>   * and TCG begins running that. spapr_exit_nested() performs the switch =
from
> @@ -1554,14 +1629,12 @@ static target_ulong h_enter_nested(PowerPCCPU *cp=
u,
>                                     target_ulong opcode,
>                                     target_ulong *args)
>  {
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
>      target_ulong hv_ptr =3D args[0];
>      target_ulong regs_ptr =3D args[1];
> -    target_ulong hdec, now =3D cpu_ppc_load_tbl(env);
> -    target_ulong lpcr, lpcr_mask;
> +    target_ulong now =3D cpu_ppc_load_tbl(env);
>      struct kvmppc_hv_guest_state *hvstate;
>      struct kvmppc_hv_guest_state hv_state;
>      struct kvmppc_pt_regs *regs;
> @@ -1607,49 +1680,15 @@ static target_ulong h_enter_nested(PowerPCCPU *cp=
u,
>          return H_P2;
>      }
> =20
> -    len =3D sizeof(env->gpr);
> -    assert(len =3D=3D sizeof(regs->gpr));
> -    memcpy(env->gpr, regs->gpr, len);
> -
> -    env->lr =3D regs->link;
> -    env->ctr =3D regs->ctr;
> -    cpu_write_xer(env, regs->xer);
> -    ppc_store_cr(env, regs->ccr);
> -
> -    env->msr =3D regs->msr;
> -    env->nip =3D regs->nip;
> +    /* restore L2 env from hv_state and ptregs */
> +    restore_l2_env(cpu, &hv_state, regs, now);
> =20
>      address_space_unmap(CPU(cpu)->as, regs, len, len, false);

I don't agree this improves readability. It also does more with the
guest address space mapped, which may not be a big deal is strictly
not an improvement.

The comment needn't just repeat what the function says, and it does
not actually restore the l2 environment. It sets some registers to
L2 values, but it also leaves other state.

I would like to see this in a larger series if it's going somewhere,
but at the moment I'd rather leave it as is.

Thanks,
Nick

