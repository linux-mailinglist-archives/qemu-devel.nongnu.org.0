Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F166245D23F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 01:54:42 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq32A-00063y-4P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 19:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq31A-0005E9-Uo; Wed, 24 Nov 2021 19:53:40 -0500
Received: from [2001:738:2001:2001::2001] (port=21779 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq318-0008PP-Rv; Wed, 24 Nov 2021 19:53:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 27ECB7475FA;
 Thu, 25 Nov 2021 01:53:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 03386746353; Thu, 25 Nov 2021 01:53:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0144C7462D3;
 Thu, 25 Nov 2021 01:53:36 +0100 (CET)
Date: Thu, 25 Nov 2021 01:53:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 3/3] target/ppc: ppc_store_fpscr doesn't update bits
 0 to 28 and 52
In-Reply-To: <20211124172523.3598396-4-lucas.araujo@eldorado.org.br>
Message-ID: <dde8d40-7ac9-86b-3a33-334345262aee@eik.bme.hu>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-4-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021, Lucas Mateus Castro (alqotel) wrote:
> This commit fixes the difference reported in the bug in the reserved
> bit 52, it does this by adding this bit to the mask of bits to not be
> directly altered in the ppc_store_fpscr function (the hardware used to
> compare to QEMU was a Power9).
>
> The bits 0 to 27 were also added to the mask, as they are marked as
> reserved in the PowerISA and bit 28 is a reserved extension of the DRN
> field (bits 29:31) but can't be set using mtfsfi, while the other DRN
> bits may be set using mtfsfi instruction, so bit 28 was also added to
> the mask.
>
> Although this is a difference reported in the bug, since it's a reserved
> bit it may be a "don't care" case, as put in the bug report. Looking at
> the ISA it doesn't explicitly mentions this bit can't be set, like it

doesn't explicitly mention (no s needed)

Regards,
BALATON Zoltan

> does for FEX and VX, so I'm unsure if this is necessary.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> target/ppc/cpu.c | 2 +-
> target/ppc/cpu.h | 4 ++++
> 2 files changed, 5 insertions(+), 1 deletion(-)
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
> index e946da5f3a..441d3dce19 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -759,6 +759,10 @@ enum {
>                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
>                           FP_VXSQRT | FP_VXCVI)
>
> +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
> +#define FPSCR_MTFS_MASK (~(MAKE_64BIT_MASK(36, 28) | PPC_BIT(28) |        \
> +                           FP_FEX | FP_VX | PPC_BIT(52)))
> +
> /*****************************************************************************/
> /* Vector status and control register */
> #define VSCR_NJ         16 /* Vector non-java */
>

