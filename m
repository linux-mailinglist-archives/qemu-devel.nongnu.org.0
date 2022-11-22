Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169BF6343CE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxYEs-0005On-U3; Tue, 22 Nov 2022 13:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1oxYEq-0005OI-C8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:43:20 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1oxYEo-0006eE-Q2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:43:20 -0500
Received: by mail-qk1-x72f.google.com with SMTP id g10so10906538qkl.6
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0stdGxZJoW4+fl+PEBfAO0Yqa9E8HMHVk2sjTE6IMvw=;
 b=J86QFg1w0nAESfksEWiKohfAJ6Vqw2XfUxokR4fUT2GzNsoJD+/8gPRALYz/3NUz97
 lmcrU5DtlbOuHUET58FU6Kse1bo+hyMxns3BZlH4rXIOyQMDQWJqo5blLtkIFpvXF1wo
 Mp9zx4YeXHsMph3E2EJ1i9MevS7KLWKsLHmhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0stdGxZJoW4+fl+PEBfAO0Yqa9E8HMHVk2sjTE6IMvw=;
 b=YpFgfYNRTdoZyYBE2UCQHwCfk2PUmrkcGGlEvHvAHV3dQ8rJ53ZM7NUDMT5maRoXKp
 3KWOAKlSlMdC4+qjm7ormB+bfX2Oci1mzdcS2K95T/MquM5ojuBt6hcWHAVT3JVc1bPo
 x2PbhUFCJWlJZyOE4SLqJbA1jslgEHkB5d45zYPMC6OFf7KQjvxXXTD/0rNUCRdOmH1+
 Qb4gK6Nq7jcEOjbCjQGV2WFmgPHRBKnprM4MCenxoNAAMwJtm54vU4sPNfZLIOfskUVn
 tsXDavP0ZJ9AJscXulDsnKVWSZHpufCuVCfdvgTVzvot/VA8sUQ+9B5erSA8wq4z7/cs
 tEQg==
X-Gm-Message-State: ANoB5pnUSDZCMH9lHPyMFJQWZ9FiootCrFwGmyj8I+5A6RFvl3Z+VPxV
 IQuPGJqQoHCvk1TcJAnG0jK1sg==
X-Google-Smtp-Source: AA0mqf7eyVc9fvoA4hzM0KUmnAJcUCocvK7XHbITz1Kel5pkfinw62Ez+MkZMmvWZH4tscoaPxInkA==
X-Received: by 2002:a37:6894:0:b0:6fa:7224:4a38 with SMTP id
 d142-20020a376894000000b006fa72244a38mr5820839qkc.622.1669142597141; 
 Tue, 22 Nov 2022 10:43:17 -0800 (PST)
Received: from localhost ([64.18.11.69]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05620a244900b006fbdeecad51sm8222142qkn.48.2022.11.22.10.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 10:43:16 -0800 (PST)
Date: Tue, 22 Nov 2022 13:43:16 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] be less conservative with the 64bit pci io window
Message-ID: <Y30YREAQZY8twJA/@morn>
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-5-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121103213.1675568-5-kraxel@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=kevin@koconnor.net; helo=mail-qk1-x72f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Nov 21, 2022 at 11:32:13AM +0100, Gerd Hoffmann wrote:
> Current seabios code will only enable and use the 64bit pci io window in
> case it runs out of space in the 32bit pci mmio window below 4G.
> 
> This patch will also enable the 64bit pci io window when
>   (a) RAM above 4G is present, and
>   (b) the physical address space size is known, and
>   (c) seabios is running on a 64bit capable processor.
> 
> This operates with the assumption that guests which are ok with memory
> above 4G most likely can handle mmio above 4G too.

Thanks.  In general, the series looks good to me.  Can you elaborate
on the background to this change though?  It sounds like there is a
(small) risk of a regression, so I think it would be good to have a
high level understanding of what is driving this memory reorg.

Cheers,
-Kevin


> 
> In case the 64bit pci io window is enabled also assign more memory to
> prefetchable pci bridge windows (scale with address space).
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  src/fw/pciinit.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
> index ad6def93633b..3e9636b139a4 100644
> --- a/src/fw/pciinit.c
> +++ b/src/fw/pciinit.c
> @@ -51,6 +51,7 @@ u64 pcimem_end     = BUILD_PCIMEM_END;
>  u64 pcimem64_start = BUILD_PCIMEM64_START;
>  u64 pcimem64_end   = BUILD_PCIMEM64_END;
>  u64 pci_io_low_end = 0xa000;
> +u32 pci_use_64bit  = 0;
>  
>  struct pci_region_entry {
>      struct pci_device *dev;
> @@ -920,6 +921,8 @@ static int pci_bios_check_devices(struct pci_bus *busses)
>          for (type = 0; type < PCI_REGION_TYPE_COUNT; type++) {
>              u64 align = (type == PCI_REGION_TYPE_IO) ?
>                  PCI_BRIDGE_IO_MIN : PCI_BRIDGE_MEM_MIN;
> +            if (pci_use_64bit && (type == PCI_REGION_TYPE_PREFMEM))
> +                align = (u64)1 << (PhysBits - 11);
>              if (!pci_bridge_has_region(s->bus_dev, type))
>                  continue;
>              u64 size = 0;
> @@ -1108,7 +1111,7 @@ static void pci_bios_map_devices(struct pci_bus *busses)
>          panic("PCI: out of I/O address space\n");
>  
>      dprintf(1, "PCI: 32: %016llx - %016llx\n", pcimem_start, pcimem_end);
> -    if (pci_bios_init_root_regions_mem(busses)) {
> +    if (pci_use_64bit || pci_bios_init_root_regions_mem(busses)) {
>          struct pci_region r64_mem, r64_pref;
>          r64_mem.list.first = NULL;
>          r64_pref.list.first = NULL;
> @@ -1174,6 +1177,9 @@ pci_setup(void)
>  
>      dprintf(3, "pci setup\n");
>  
> +    if (PhysBits >= 36 && LongMode && RamSizeOver4G)
> +        pci_use_64bit = 1;
> +
>      dprintf(1, "=== PCI bus & bridge init ===\n");
>      if (pci_probe_host() != 0) {
>          return;
> -- 
> 2.38.1
> 
> 

