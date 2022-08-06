Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B158B30D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 02:33:34 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK7kz-0004A3-Ay
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 20:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oK7i3-0002U3-G7; Fri, 05 Aug 2022 20:30:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oK7i0-0007Wc-EM; Fri, 05 Aug 2022 20:30:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B7DB974637E;
 Sat,  6 Aug 2022 02:30:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8279774635D; Sat,  6 Aug 2022 02:30:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 809B0745702;
 Sat,  6 Aug 2022 02:30:24 +0200 (CEST)
Date: Sat, 6 Aug 2022 02:30:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
In-Reply-To: <20220805205435.139286-1-danielhb413@gmail.com>
Message-ID: <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
References: <20220805205435.139286-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Aug 2022, Daniel Henrique Barboza wrote:
> Coverity reports a OVERFLOW_BEFORE_WIDEN issue in dcr_write_dma(). When
> handling the DMA0_CR switch we're doing a multiplication between two
> integers (count and width), and the product is assigned to an uint64_t
> (xferlen). The int32 product can be overflow before widened.

It can't in practice though as count is max 0xffff and width is max 8 so 
this sounds like a Coverity false positive. Maybe you could avoid it by 
changing the type of count or width to uint64_t instead of casting?

> Fix it by casting the first operand to uint64_t to force the product to
> be 64 bit.
>
> Fixes: Coverity CID 1490852
> Fixes: 3c409c1927ef ("ppc440_uc: Basic emulation of PPC440 DMA controller")

This line does not appear in 3c409c1927ef so this second Fixes line is 
bogus. This was added to fix other Coverity issues in eda3f17bcd7b96 but 
still did not make Coverity happy :-)

Regards,
BALATON Zoltan

> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/ppc/ppc440_uc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 11fdb88c22..31eeffa946 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -908,7 +908,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
>
>                     sidx = didx = 0;
>                     width = 1 << ((val & DMA0_CR_PW) >> 25);
> -                    xferlen = count * width;
> +                    xferlen = (uint64_t)count * width;
>                     wlen = rlen = xferlen;
>                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
>                                                    false);
>

