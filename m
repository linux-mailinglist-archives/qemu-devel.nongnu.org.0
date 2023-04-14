Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4806E22BE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:59:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnI4i-0005Pl-GX; Fri, 14 Apr 2023 07:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnI4h-0005PY-8Q; Fri, 14 Apr 2023 07:58:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnI4e-00061z-Qn; Fri, 14 Apr 2023 07:58:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F06CF1FD95;
 Fri, 14 Apr 2023 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681473518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34AunsGFoTzDINdEqfPZUlKMx4ZVBWBHO7OqPiLvBdY=;
 b=1YQxs9CFZPapq3HlE+UcuIydCdQLxe7W45d8OYxmOtNeHBkCJckoHM/LOtukww2upTpze/
 xtkPsZE/9/Eq4qQQTgZKmbB0MzhE7BIGsFh3yEpkYoALNAgXT1cS0mW8LTOlV7YWey0yC6
 zaZ0yNFP3c2KnTteTErljl4rMIrVb18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681473518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34AunsGFoTzDINdEqfPZUlKMx4ZVBWBHO7OqPiLvBdY=;
 b=74R2HhJFCzwJvU9o239feHVeLeJUJA7zMsNQ9ngOHjOuGunhC7mr0Ub6Rb1VHUwdnU+eO4
 Bbmk/zOqT2wX0zDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7820213498;
 Fri, 14 Apr 2023 11:58:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QiKqD+4/OWTaVwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 14 Apr 2023 11:58:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: Re: [PATCH 4/5] ppc: spapr: cleanup spapr_exit_nested() with helper
 routines.
In-Reply-To: <20230331065344.112341-5-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-5-harshpb@linux.ibm.com>
Date: Fri, 14 Apr 2023 08:58:35 -0300
Message-ID: <87pm86isk4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Harsh Prateek Bora <harshpb@linux.ibm.com> writes:

> Currently, in spapr_exit_nested(), it does a lot of register state
> restoring from ptregs/hvstate after mapping each of those before
> restoring the L1 host state. This patch breaks down those set of ops
> to respective helper routines for better code readability/maintenance.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 132 +++++++++++++++++++++++++------------------
>  1 file changed, 78 insertions(+), 54 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index a77b4c9076..ed3a21471d 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1701,36 +1701,23 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>      return env->gpr[3];
>  }
>  
> -void spapr_exit_nested(PowerPCCPU *cpu, int excp)
> +static void restore_hvstate_from_env(struct kvmppc_hv_guest_state *hvstate,
> +                                     CPUPPCState *env, int excp)
>  {
> -    CPUState *cs = CPU(cpu);
> -    CPUPPCState *env = &cpu->env;
> -    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> -    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
> -    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
> -    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
> -    struct kvmppc_hv_guest_state *hvstate;
> -    struct kvmppc_pt_regs *regs;
> -    hwaddr len;
> -
> -    assert(spapr_cpu->in_nested);
> -
> -    cpu_ppc_hdecr_exit(env);
> -
> -    len = sizeof(*hvstate);
> -    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
> -                                MEMTXATTRS_UNSPECIFIED);
> -    if (len != sizeof(*hvstate)) {
> -        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
> -        r3_return = H_PARAMETER;
> -        goto out_restore_l1;
> -    }
> -
> -    hvstate->cfar = env->cfar;
> -    hvstate->lpcr = env->spr[SPR_LPCR];
> -    hvstate->pcr = env->spr[SPR_PCR];
> -    hvstate->dpdes = env->spr[SPR_DPDES];
> -    hvstate->hfscr = env->spr[SPR_HFSCR];
> +    hvstate->cfar    = env->cfar;
> +    hvstate->lpcr    = env->spr[SPR_LPCR];
> +    hvstate->pcr     = env->spr[SPR_PCR];
> +    hvstate->dpdes   = env->spr[SPR_DPDES];
> +    hvstate->hfscr   = env->spr[SPR_HFSCR];
> +    /* HEIR should be implemented for HV mode and saved here. */
> +    hvstate->srr0    = env->spr[SPR_SRR0];
> +    hvstate->srr1    = env->spr[SPR_SRR1];
> +    hvstate->sprg[0] = env->spr[SPR_SPRG0];
> +    hvstate->sprg[1] = env->spr[SPR_SPRG1];
> +    hvstate->sprg[2] = env->spr[SPR_SPRG2];
> +    hvstate->sprg[3] = env->spr[SPR_SPRG3];
> +    hvstate->pidr    = env->spr[SPR_BOOKS_PID];
> +    hvstate->ppr     = env->spr[SPR_PPR];

Just leave these lines as they were. Let's avoid spending time
discussing code style. Also, the patch became harder to review by having
these unrelated changes interspersed.


