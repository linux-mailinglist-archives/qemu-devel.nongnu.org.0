Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23DF6A1FFF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbGM-00023I-Fm; Fri, 24 Feb 2023 11:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pVbGK-000231-Sz
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:49:36 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pVbGI-0000a7-Ub
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:49:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F460614DD;
 Fri, 24 Feb 2023 16:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91990C433EF;
 Fri, 24 Feb 2023 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677257362;
 bh=HFJzZXsAawpQPTHlSu7kb4Np6Ai6hH3VPH4al9o5Hnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqzby6Rw9U4dfrweFt3MHKSorOsSs9c3tgAxVUKh5E4CeL2+uiH3qG5nQBMHiCVKg
 4iMLEqL3XKY6kbJOQPEO/2iZoVzeJaILwFnTgK/VOdVKFxgLtuDGlRC2igaMW9r+as
 qTGIqiAF/woNBL8MAUOJBf4414cELNlrOF5ZEmTIGPnY6S29M6wmwaEu0hBx/4gTsu
 t/9ibP5ukedq66nO22eIH+Dr7SAm7sGI7nRqFwd4T0Eg5noMBGEv1qxkKQC0cK5gwW
 HfWAKI1NS76iTtVjYdbHggLgx2wH67aMmFKM/AQoa/JqqZXy7aKwux5ABg8V747JV8
 RT4b9KL0YcGjQ==
Date: Fri, 24 Feb 2023 09:49:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, balaton@eik.bme.hu
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Message-ID: <Y/jqkCQjm6nKlMCs@dev-arch.thelio-3990X>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=nathan@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Feb 23, 2023 at 04:19:58PM +0000, Jiaxun Yang wrote:
> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
> 
> However CFGADDR as a ISD internal register is not controled by MByteSwap
> bit, it follows endian of all other ISD register, which means it ties to
> little endian.
> 
> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
> endian-swapping.
> 
> This should fix some recent reports about poweroff hang.
> 
> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for the fix!

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  hw/pci-host/gt64120.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
> index f226d0342039..82c15edb4698 100644
> --- a/hw/pci-host/gt64120.c
> +++ b/hw/pci-host/gt64120.c
> @@ -321,9 +321,6 @@ static void gt64120_isd_mapping(GT64120State *s)
>  static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
>  {
>      /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
> -    static const MemoryRegionOps *pci_host_conf_ops[] = {
> -        &pci_host_conf_be_ops, &pci_host_conf_le_ops
> -    };
>      static const MemoryRegionOps *pci_host_data_ops[] = {
>          &pci_host_data_be_ops, &pci_host_data_le_ops
>      };
> @@ -339,15 +336,6 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
>       * - Table 16: 32-bit PCI Transaction Endianess
>       * - Table 158: PCI_0 Command, Offset: 0xc00
>       */
> -    if (memory_region_is_mapped(&phb->conf_mem)) {
> -        memory_region_del_subregion(&s->ISD_mem, &phb->conf_mem);
> -        object_unparent(OBJECT(&phb->conf_mem));
> -    }
> -    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
> -                          pci_host_conf_ops[s->regs[GT_PCI0_CMD] & 1],
> -                          s, "pci-conf-idx", 4);
> -    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
> -                                        &phb->conf_mem, 1);
>  
>      if (memory_region_is_mapped(&phb->data_mem)) {
>          memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
> @@ -1208,6 +1196,12 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
>                                  PCI_DEVFN(18, 0), TYPE_PCI_BUS);
>  
>      pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
> +    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
> +                          &pci_host_conf_le_ops,
> +                          s, "pci-conf-idx", 4);
> +    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
> +                                        &phb->conf_mem, 1);
> +
>  
>      /*
>       * The whole address space decoded by the GT-64120A doesn't generate
> -- 
> 2.37.1 (Apple Git-137.1)
> 
> 

