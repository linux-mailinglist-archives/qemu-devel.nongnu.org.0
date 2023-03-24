Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3186C81A9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhd1-0001gt-0K; Fri, 24 Mar 2023 09:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pfhcy-0001gc-IU; Fri, 24 Mar 2023 09:38:44 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pfhcp-000343-37; Fri, 24 Mar 2023 09:38:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7717333702;
 Fri, 24 Mar 2023 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679664662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YU5W0OmE4ipRcPlxac3dSK/wf1YoWH7wGDnkXlOiEOU=;
 b=2M5cpm5PTv00RwtSKmrUoUI7lD2/UMUQskycDEaPIddpgvsDp17mHJmlVBv6KIaghvgZQ+
 7kg7cf40Aw5Dj0D8GGvxcP7VE4VWd4O89+Lf6K/54prVxHbACh5/p3+s4xrtphSvNEwMkq
 DGyH+nc56p6tFM57IWAhsqBDfLr5/DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679664662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YU5W0OmE4ipRcPlxac3dSK/wf1YoWH7wGDnkXlOiEOU=;
 b=JfBaPlDq+uulgHLhwGvF49KIH3Lu8biRZY7BbN09bP3TSI82BDfsFbx3j07VLfSqkx8KDm
 yh/hnx7PLFjlG5CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03937133E5;
 Fri, 24 Mar 2023 13:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DrpkLxWmHWS6KwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 24 Mar 2023 13:31:01 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/6] target/ppc: Fix instruction loading endianness in
 alignment interrupt
In-Reply-To: <20230323022237.1807512-3-npiggin@gmail.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-3-npiggin@gmail.com>
Date: Fri, 24 Mar 2023 10:30:59 -0300
Message-ID: <87zg82ff8s.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Nick,

> powerpc ifetch endianness depends on MSR[LE] so it has to byteswap
> after cpu_ldl_code(). This corrects DSISR bits in alignment
> interrupts when running in little endian mode.
>

Just a thought, we have these tests that perhaps could have caught
this:  https://github.com/legoater/pnv-test

Despite the name they do have (some) support to pseries as well. Not
sure how the P8 support is these days though.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/excp_helper.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 287659c74d..5f0e363363 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -133,6 +133,31 @@ static void dump_hcall(CPUPPCState *env)
>                    env->nip);
>  }
>  
> +/* Return true iff byteswap is needed in a scalar memop */
> +static inline bool need_byteswap(CPUArchState *env)
> +{
> +#if TARGET_BIG_ENDIAN

TARGET_BIG_ENDIAN is always set for softmmu mode. See
configs/targets/ppc64-softmmu.mak

> +     return !!(env->msr & ((target_ulong)1 << MSR_LE));
> +#else
> +     return !(env->msr & ((target_ulong)1 << MSR_LE));
> +#endif
> +}
> +
> +static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
> +{
> +    uint32_t insn = cpu_ldl_code(env, addr);
> +#if TARGET_BIG_ENDIAN
> +    if (env->msr & ((target_ulong)1 << MSR_LE)) {
> +        insn = bswap32(insn);
> +    }
> +#else
> +    if (!(env->msr & ((target_ulong)1 << MSR_LE))) {
> +        insn = bswap32(insn);
> +    }
> +#endif
> +    return insn;
> +}
> +
>  static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>  {
>      const char *es;
> @@ -3097,7 +3122,7 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>  
>      /* Restore state and reload the insn we executed, for filling in DSISR.  */
>      cpu_restore_state(cs, retaddr);
> -    insn = cpu_ldl_code(env, env->nip);
> +    insn = ppc_ldl_code(env, env->nip);
>  
>      switch (env->mmu_model) {
>      case POWERPC_MMU_SOFT_4xx:

