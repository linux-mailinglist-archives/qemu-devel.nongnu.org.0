Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DF6F866F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:09:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxzK-0000W6-HR; Fri, 05 May 2023 12:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1puxzH-0000UO-MY; Fri, 05 May 2023 12:08:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1puxzC-0005CW-2M; Fri, 05 May 2023 12:08:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5CAF8746335;
 Fri,  5 May 2023 18:06:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 27BB2745706; Fri,  5 May 2023 18:06:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 25D7C7456E3;
 Fri,  5 May 2023 18:06:47 +0200 (CEST)
Date: Fri, 5 May 2023 18:06:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Nicholas Piggin <npiggin@gmail.com>
cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix nested-hv HEAI delivery
In-Reply-To: <20230505125655.329422-1-npiggin@gmail.com>
Message-ID: <9dcade18-366a-769a-7919-3512a865349e@eik.bme.hu>
References: <20230505125655.329422-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 5 May 2023, Nicholas Piggin wrote:
> ppc hypervisors turn HEAI interrupts into program interrupts injected
> into the guest that executed the illegal instruction, if the hypervisor
> doesn't handle it some other way.
>
> The nexted-hv implementation failed to account for this HEAI->program

Typo: nested-hv?

> conversion. The virtual hypervisor wants to see the HEAI when running
> a nested guest, so that interrupt type can be returned to its KVM
> caller.
>
> Fixes: 7cebc5db2eba6 ("target/ppc: Introduce a vhyp framework for nested HV support")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> target/ppc/excp_helper.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 199328f4b6..a833efa8f9 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1358,10 +1358,13 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>
>     /*
>      * We don't want to generate a Hypervisor Emulation Assistance
> -     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
> +     * Interrupt if we don't have HVB in msr_mask (PAPR mode),
> +     * unless running a nested-hv guest, in which case the L1
> +     * kernel wants the interrupt.
>      */
>     if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
> -        excp = POWERPC_EXCP_PROGRAM;
> +        if (!books_vhyp_handles_hv_excp(cpu))

You could instead write:

      if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB) &&
          !books_vhyp_handles_hv_excp(cpu)) {

Regards.
BALATON Zoltan

> +            excp = POWERPC_EXCP_PROGRAM;
>     }
>
>     vector = env->excp_vectors[excp];
>

