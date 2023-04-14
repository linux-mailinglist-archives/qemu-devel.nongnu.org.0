Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161436E22AE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:53:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHzQ-0002Dj-JK; Fri, 14 Apr 2023 07:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnHzN-0002DP-T5; Fri, 14 Apr 2023 07:53:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pnHzM-0004qQ-8V; Fri, 14 Apr 2023 07:53:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FD001FD97;
 Fri, 14 Apr 2023 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681473190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFyVXzKMApk5w0AWc1M4DY/FCXoayEskESFpMu6WLhQ=;
 b=QdqLiE8Mu7eSlSiHDF8vIGS627AuMf1MW3WtWaPQNkOhi0wy8noBddIe8lumVddR17O3hC
 6cJjfFMTBl7KCunXinohvIwbktYG9H5S8VjooMig8FJ0n4j1m/9RwPLixDlXbnokcrCUEX
 bd4zQ82UB/hIBP2duvhVIN2otbzAZQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681473190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFyVXzKMApk5w0AWc1M4DY/FCXoayEskESFpMu6WLhQ=;
 b=N8ND1BBO8ugW7oH/7OhDS2cip/qoOZfH5rSkB3PTNtYqu2h4NEB79DsgXQJTphLqV4z3en
 jUfD8I0oF8u2eJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06FA613498;
 Fri, 14 Apr 2023 11:53:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gSK/L6U+OWTJVAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 14 Apr 2023 11:53:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: Re: [PATCH 2/5] ppc: spapr: cleanup h_enter_nested() with helper
 routines.
In-Reply-To: <20230331065344.112341-3-harshpb@linux.ibm.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <20230331065344.112341-3-harshpb@linux.ibm.com>
Date: Fri, 14 Apr 2023 08:53:07 -0300
Message-ID: <87v8hyist8.fsf@suse.de>
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

> h_enter_nested() currently does a lot of register specific operations
> which should be abstracted logically to simplify the code for better
> readability. This patch breaks down relevant blocks into respective
> helper routines to make use of them for better readability/maintenance.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 99 +++++++++++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 39 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 124cee5e53..a13e5256ab 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1544,6 +1544,62 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
>      return H_FUNCTION;
>  }
>  
> +static void restore_hdec_from_hvstate(CPUPPCState *dst,
> +                                      struct kvmppc_hv_guest_state *hv_state,
> +                                      target_ulong now)
> +{
> +    target_ulong hdec;

add a blank line here

> +    assert(hv_state);
> +    hdec = hv_state->hdec_expiry - now;
> +    cpu_ppc_hdecr_init(dst);
> +    cpu_ppc_store_hdecr(dst, hdec);
> +}
> +
> +static void restore_lpcr_from_hvstate(PowerPCCPU *cpu,
> +                                      struct kvmppc_hv_guest_state *hv_state)
> +{
> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> +    CPUPPCState *dst = &cpu->env;
> +    target_ulong lpcr, lpcr_mask;

here as well

> +    assert(hv_state);
> +    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
> +    lpcr = (dst->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state->lpcr & lpcr_mask);
> +    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
> +    lpcr &= ~LPCR_LPES0;
> +    dst->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
> +}
> +
> +static void restore_env_from_ptregs_hvstate(CPUPPCState *env,

Take a look at how the kernel does it. It might be better to have ptregs
and hv regs separate. Also probably better to have some terms specific
to the domain (l2 state, l1 state, etc).

> +                                            struct kvmppc_pt_regs *regs,
> +                                            struct kvmppc_hv_guest_state *hv_state)
> +{
> +    assert(env);
> +    assert(regs);
> +    assert(hv_state);
> +    assert(sizeof(env->gpr) == sizeof(regs->gpr));
> +    memcpy(env->gpr, regs->gpr, sizeof(env->gpr));
> +    env->nip = regs->nip;
> +    env->msr = regs->msr;
> +    env->lr = regs->link;
> +    env->ctr = regs->ctr;
> +    cpu_write_xer(env, regs->xer);
> +    ppc_store_cr(env, regs->ccr);
> +    /* hv_state->amor is not used in api v1 */

That's not really an API thing. More of an oversight.

> +    env->spr[SPR_HFSCR] = hv_state->hfscr;
> +    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
> +    env->cfar = hv_state->cfar;
> +    env->spr[SPR_PCR]      = hv_state->pcr;
> +    env->spr[SPR_DPDES]     = hv_state->dpdes;
> +    env->spr[SPR_SRR0]      = hv_state->srr0;
> +    env->spr[SPR_SRR1]      = hv_state->srr1;
> +    env->spr[SPR_SPRG0]     = hv_state->sprg[0];
> +    env->spr[SPR_SPRG1]     = hv_state->sprg[1];
> +    env->spr[SPR_SPRG2]     = hv_state->sprg[2];
> +    env->spr[SPR_SPRG3]     = hv_state->sprg[3];
> +    env->spr[SPR_BOOKS_PID] = hv_state->pidr;
> +    env->spr[SPR_PPR]       = hv_state->ppr;

I would advise against the extra spacing inside functions.


