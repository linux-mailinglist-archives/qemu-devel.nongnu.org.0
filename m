Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A88E535ED0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 12:59:39 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuXgw-0004i9-8v
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 06:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nuXUq-0000dZ-9v; Fri, 27 May 2022 06:47:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nuXUm-0001jm-Ry; Fri, 27 May 2022 06:47:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E7BA474763E;
 Fri, 27 May 2022 12:46:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D7264746381; Fri, 27 May 2022 12:46:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D479874637A;
 Fri, 27 May 2022 12:46:57 +0200 (CEST)
Date: Fri, 27 May 2022 12:46:57 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] ppc: fix boot with sam460ex
In-Reply-To: <20220526224229.95183-1-mst@redhat.com>
Message-ID: <352916f8-efb1-c192-5fc-6df69b559a8@eik.bme.hu>
References: <20220526224229.95183-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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

Hello,

Some changes to commit message (patch is OK).

On Thu, 26 May 2022, Michael S. Tsirkin wrote:
> Recent changes to pcie_host corrected size of its internal region to
> match what it expects - only the low 28 bits are ever decoded. Previous
> code just ignored bit 29 (if size was 1 << 29) in the address which does
> not make much sense.  We are now asserting on size > 1 << 28 instead,
> but it so happened that ppc actually allows guest to configure as large
> a size as it wants to, and current firmware set it to 1 << 29.
>
> With just qemu-system-ppc -M sam460ex this triggers an assert which
> seems to happen when the guest (board firmware?) writes a value to
> CFGMSK reg:
>
> (gdb) bt

Backtrace is missing but you could just drop this line and replace : with 
. at end of previous line as we probably don't need the full backtrace, 
the commit message is already too long in my opinion.

> This is done in the board firmware here:
>
> https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
>
> when trying to map config space.
>
> Note that what firmware does matches
> https://www.hardware.com.br/comunidade/switch-cisco/1128380/

That's not it. It's a different hardware and firmware, just quoted it as 
an example that this value seems to be common to that SoC even on 
different hardware/OS/firmware (probably comes from reference 
hardware/devel board?). The sam460ex is here

https://www.acube-systems.biz/index.php?page=hardware&pid=5

the U-Boot in above repo is matching the firmware from the acube page but 
I had to fix some bugs in it to make it compile and work.

Otherwise this should be OK.

Regards,
BALATON Zoltan

> So it's not clear what the proper fix should be.
>
> However, allowing guest to trigger an assert in qemu is not good practice anyway.
>
> For now let's just force the mask to 256MB on guest write, this way
> anything outside the expected address range is ignored.
>
> Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> Affected system is orphan so I guess I will merge the patch unless
> someone objects.
>
> hw/ppc/ppc440_uc.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 993e3ba955..a1ecf6dd1c 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
>     case PEGPL_CFGMSK:
>         s->cfg_mask = val;
>         size = ~(val & 0xfffffffe) + 1;
> +        /*
> +         * Firmware sets this register to E0000001. Why we are not sure,
> +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
> +         * ignored.
> +         */
> +        if (size > PCIE_MMCFG_SIZE_MAX) {
> +            size = PCIE_MMCFG_SIZE_MAX;
> +        }
>         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
>         break;
>     case PEGPL_MSGBAH:
>

