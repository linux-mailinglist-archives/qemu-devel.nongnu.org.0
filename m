Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720957EA2A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:11:25 +0200 (CEST)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF1nn-0004VW-DM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1m6-0002x5-5i; Fri, 22 Jul 2022 19:09:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1m3-0003O0-As; Fri, 22 Jul 2022 19:09:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9575C746381;
 Sat, 23 Jul 2022 01:09:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5718A74637E; Sat, 23 Jul 2022 01:09:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 55535745702;
 Sat, 23 Jul 2022 01:09:29 +0200 (CEST)
Date: Sat, 23 Jul 2022 01:09:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2 01/10] hw/arm/boot.c: do not free machine->fdt
 in arm_load_dtb()
In-Reply-To: <20220722200007.1602174-2-danielhb413@gmail.com>
Message-ID: <fc35eb70-93fd-3d90-8d95-2f42f47652ac@eik.bme.hu>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-2-danielhb413@gmail.com>
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

On Fri, 22 Jul 2022, Daniel Henrique Barboza wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> This is not an issue right now because there's no code that access
> machine->fdt after arm_load_dtb(), but we're going to add a couple do
> FDT HMP commands that will rely on machine->fdt being valid.
>
> Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
> machine->fdt. This will allow the FDT of ARM machines that relies on
> arm_load_dtb() to be accessed later on.
>
> Since all ARM machines allocates the FDT only once, we don't need to
> worry about leaking the existing FDT during a machine reset (which is
> something that other machines have to look after, e.g. the ppc64 pSeries
> machine).
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/arm/boot.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..1d9c6047b1 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      */
>     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
>
> -    g_free(fdt);
> +    /* Update ms->fdt pointer */
> +    ms->fdt = fdt;

Not sure this comment is useful as it just states what the assignment does 
so provides no further info.

Regards,
BALATON Zoltan

>
>     return size;
>
>

