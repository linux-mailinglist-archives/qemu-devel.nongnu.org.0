Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09334635A74
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 11:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnFp-0000vA-6T; Wed, 23 Nov 2022 05:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxnFa-0000tR-Hv
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:45:08 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxnFY-0002gE-AY
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:45:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 708E474633D;
 Wed, 23 Nov 2022 11:44:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3F21F74632B; Wed, 23 Nov 2022 11:44:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3D2F1746307;
 Wed, 23 Nov 2022 11:44:24 +0100 (CET)
Date: Wed, 23 Nov 2022 11:44:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 3/2] ppc4xx_sdram: Simplify sdram_ddr_size() to return
In-Reply-To: <87a64i87zp.fsf@pond.sub.org>
Message-ID: <a804f913-920c-e481-318a-5a365173a7e4@eik.bme.hu>
References: <20221122134917.1217307-1-armbru@redhat.com>
 <87a64i87zp.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Wed, 23 Nov 2022, Markus Armbruster wrote:
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

I thought you could include the hunk modifying sdram_ddr2_size in this 
patch too and make it a separate clean up to reduce the size of the 
Coccinelle patch making that easier to review but it's OK either way. 
Thanks for doing this clean up.

Regards,
BALATON Zoltan

> ---
> hw/ppc/ppc4xx_sdram.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
> index 54bf9a2b44..a24c80b1d2 100644
> --- a/hw/ppc/ppc4xx_sdram.c
> +++ b/hw/ppc/ppc4xx_sdram.c
> @@ -192,17 +192,13 @@ static inline hwaddr sdram_ddr_base(uint32_t bcr)
>
> static hwaddr sdram_ddr_size(uint32_t bcr)
> {
> -    hwaddr size;
> -    int sh;
> +    int sh = (bcr >> 17) & 0x7;
>
> -    sh = (bcr >> 17) & 0x7;
>     if (sh == 7) {
> -        size = -1;
> -    } else {
> -        size = (4 * MiB) << sh;
> +        return -1;
>     }
>
> -    return size;
> +    return (4 * MiB) << sh;
> }
>
> static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
>

