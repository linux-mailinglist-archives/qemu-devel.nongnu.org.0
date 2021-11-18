Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7A455F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:20:03 +0100 (CET)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjCk-00078t-EE
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mnjBo-0006Ec-3D; Thu, 18 Nov 2021 10:19:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:24931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mnjBl-0003Wf-El; Thu, 18 Nov 2021 10:19:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF2B37475FA;
 Thu, 18 Nov 2021 16:18:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A25A3746333; Thu, 18 Nov 2021 16:18:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A11487462D3;
 Thu, 18 Nov 2021 16:18:56 +0100 (CET)
Date: Thu, 18 Nov 2021 16:18:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v2 2/3] target/ppc: ppc_store_fpscr doesn't update bit 52
In-Reply-To: <20211118132502.984059-3-lucas.araujo@eldorado.org.br>
Message-ID: <6b46d3aa-9297-72a5-2747-9ec86f85efdc@eik.bme.hu>
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-3-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 clg@kaod.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Nov 2021, Lucas Mateus Castro (alqotel) wrote:
> This commit fixes the difference reported in the bug in the reserved
> bit 52, it does this by adding this bit to the mask of bits to not be
> directly altered in the ppc_store_fpscr function (the hardware used to
> compare to QEMU was a Power9).
>
> Although this is a difference reported in the bug, since it's a reserved
> bit it may be a "don't care" case, as put in the bug report. Looking at
> the ISA it doesn't explicitly mentions this bit can't be set, like it
> does for FEX and VX, so I'm unsure if this is necessary.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> target/ppc/cpu.c | 2 +-
> target/ppc/cpu.h | 3 +++
> 2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index f933d9f2bd..d7b42bae52 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -112,7 +112,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCState *env)
>
> void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
> {
> -    val &= ~(FP_VX | FP_FEX);
> +    val &= FPSCR_MTFS_MASK;
>     if (val & FPSCR_IX) {
>         val |= FP_VX;
>     }
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e946da5f3a..53463092ab 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -759,6 +759,9 @@ enum {
>                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
>                           FP_VXSQRT | FP_VXCVI)
>
> +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
> +#define FPSCR_MTFS_MASK (~((1ull << 11) | FP_VX | FP_FEX))

Instead of (1ull << 11) maybe PPC_BIT(52) is a bit clearer (or not 
depending on personal preference, so I don't mind either way.

Regards,
BALATON Zoltan

> +
> /*****************************************************************************/
> /* Vector status and control register */
> #define VSCR_NJ         16 /* Vector non-java */
>

