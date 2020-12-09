Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CD2D4590
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 16:40:02 +0100 (CET)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1ZR-0006Df-1P
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 10:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kn1Xn-0005O6-Eg; Wed, 09 Dec 2020 10:38:20 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:26550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1kn1Xk-0003l5-Ol; Wed, 09 Dec 2020 10:38:18 -0500
Received: from wise (unknown [77.159.208.71])
 (Authenticated sender: stephane.duverger@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1827A5FFD8;
 Wed,  9 Dec 2020 16:38:03 +0100 (CET)
Date: Wed, 9 Dec 2020 16:38:00 +0100
From: Stephane Duverger <stephane.duverger@free.fr>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] ppc/translate: Fix need_access_type for non MMU_64
Message-ID: <20201209153800.GA60507@wise>
References: <20201209093544.GA58577@wise> <20201209144045.65b4d9da@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209144045.65b4d9da@bahia.lan>
Received-SPF: none client-ip=212.27.42.5;
 envelope-from=stephane.duverger@free.fr; helo=smtp5-g21.free.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 02:40:45PM +0100, Greg Kurz wrote:
> But I agree that the 0x00000001 causes the check to be wrong for
> CPUs using the POWERPC_MMU_32B MMU model. So your change is clearly
> the way to go but the changelog should rather state that it doesn't
> make sense to use an MMU model enum as a mask. The POWERPC_MMU_64
> flag is to be used to detect 64-bit MMU models, as it is done
> everywhere else.

Good to know, I understand your concern :)

> How did you spot this ? Would you have an example that illustrates
> how this can break things to share ?

I run a proprietary embedded OS inside qemu with a board I
developped. It uses a 32 bits PPC with mmu-hash32 implementation. At
some point, I add a slow path memory access throught
helper_be_stl_mmu() that triggered:

mmu-hash32.c:ppc_hash32_direct_store()
{
    switch (env->access_type) {
    ...
    default:
        cpu_abort(cs, "ERROR: instruction should not need "
                  "address translation\n");
}

How come did we lost 'access_type' ? In turn, it was related to:

translate.c:gen_set_access_type()
{
    if (ctx->need_access_type && ctx->access_type != access_type) {
        tcg_gen_movi_i32(cpu_access_type, access_type);
        ctx->access_type = access_type;
    }
}

At TCG level, the 'need_access_type' prevented updating the
'access_type'. And so I ended up in
translate.c:ppc_tr_init_disas_context() and discovered the bug.

Unfortunately, it will be difficult to provide you with a test case as
it depends on the current MMU state configured by the running
firmware.

Maybe you might be able to craft something that triggers a slow-path
memory access through:

ppc_hash32_handle_mmu_fault()
...
    /* 3. Look up the Segment Register */
    sr = env->sr[eaddr >> 28];

    /* 4. Handle direct store segments */
    if (sr & SR32_T) {
        if (ppc_hash32_direct_store(cpu, sr, eaddr, rwx,
                                    &raddr, &prot) == 0) {
...


> Also, this could have:
> 
> Fixes: 5f2a6254522b ("ppc: Don't set access_type on all load/stores on hash64")
> 
> Finally, we also have a similar nit a few lines below in the same
> function:
> 
>     ctx->lazy_tlb_flush = env->mmu_model == POWERPC_MMU_32B
>         || env->mmu_model == POWERPC_MMU_601
>         || (env->mmu_model & POWERPC_MMU_64B);
> 
> This happens to be working because POWERPC_MMU_32B is checked first but
> the last check should also be (env->mmu_model & POWERPC_MMU_64).

Great. I didn't look few lines below nor other locations using
POWERPC_MMU_64B. Just spotted my initial issue. Maybe it would be more
consistent to trash my patch and submit something fixing both issues.

Feel free to fusion my finding with your and sign-off a new candidate
for the sake of the glory of our dear PPC softmmu :)

