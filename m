Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F78058453F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:05:55 +0200 (CEST)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH7tR-00045e-Mb
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oH7r5-0002YH-Hd; Thu, 28 Jul 2022 14:03:28 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:12419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oH7r2-0006qc-Qy; Thu, 28 Jul 2022 14:03:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 514067462D3;
 Thu, 28 Jul 2022 20:03:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 453F47461AE; Thu, 28 Jul 2022 20:03:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4139B745702;
 Thu, 28 Jul 2022 20:03:17 +0200 (CEST)
Date: Thu, 28 Jul 2022 20:03:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [RFC 0/2] Fix Coverity and other errors in ppc440_uc DMA
In-Reply-To: <20220726182341.1888115-1-peter.maydell@linaro.org>
Message-ID: <bf85e7a2-e824-b424-3422-a5b85cca7c5@eik.bme.hu>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jul 2022, Peter Maydell wrote:
> This patchset is mainly trying to fix a problem that Coverity spotted
> in the dcr_write_dma() function in hw/ppc/ppc440_uc.c, where the code
> is not correctly using the cpu_physical_memory_map() function.
> While I was fixing that I noticed a second problem in this code,
> where it doesn't have a fallback for when cpu_physical_memory_map()
> says "I couldn't map that for you".
>
> I've marked these patches as RFC, partly because I don't have any
> guest that would exercise the code changes[*], and partly because
> I don't have any documentation of the hardware to tell me how it
> should behave, so patch 2 in particular has some FIXMEs. I also
> notice that the code doesn't update any of the registers like the
> count or source/base addresses when the DMA transfer happens, which
> seems odd, but perhaps the real hardware does work like that.
>
> I think we should probably take patch 1 (which is a fairly minimal
> fix of the use-of-uninitialized-data problem), but patch 2 is a bit
> more unfinished.
>
> [*] The commit 3c409c1927efde2fc that added this code says it's used
> by AmigaOS.)

AmigaOS still boots with these patches and I see no difference so

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

(I did not check what parameters AmigaOS uses (could not find a simple 
trace option for that, may need to add some debug printfs to test that) so 
not sure if the added code was actually run or it still only uses the code 
path as before. Fixing the map length should show some effect but I don't 
see any.)

Regards,
BALATON Zoltan

> thanks
> -- PMM
>
> Peter Maydell (2):
>  hw/ppc/ppc440_uc: Initialize length passed to
>    cpu_physical_memory_map()
>  hw/ppc/ppc440_uc: Handle mapping failure in DMA engine
>
> hw/ppc/ppc440_uc.c | 34 +++++++++++++++++++++++++++++++++-
> 1 file changed, 33 insertions(+), 1 deletion(-)
>
>

