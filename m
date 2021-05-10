Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295E37981B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 22:05:11 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgC9O-0008An-FM
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 16:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lgC7g-0007Cr-O3; Mon, 10 May 2021 16:03:24 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lgC7c-00039W-8F; Mon, 10 May 2021 16:03:24 -0400
Received: by mail-qt1-x834.google.com with SMTP id t20so8645209qtx.8;
 Mon, 10 May 2021 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a+vil3B7jddylIzRbFEU1VbBECy+RXw1XkC0uR3ipfM=;
 b=O0fmzombBPGJ/0pvWc2y/UD7WsZkFaFDF8XOk28Ova9n5L9tbYATo8Ucnd/ALqxwZe
 T0J7Q7aVl/BKL/7VocLbm/ka51d/s4PDiXMNHRSKWsSpgcQfDZ1t9UUDiGFhRG3iUN50
 KgLiGQDR0TkUf23M2hfgvNWx0ydoc1KD3yimB3JGkkC0waH4EgmAjr7cAgWk0wKi9Fba
 EMdyfMHzjsvFLK4wcK7n+3t827xBZ49+298ElJOSBHwppChcJk6CTZvE1zfln3tOOKPX
 +wE12Duam1Dg0VZr5DA7mYBdJcJizgLw6hPBdrH0Ox4kg+ezd8kH8LU73simM+QUKZgA
 PpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a+vil3B7jddylIzRbFEU1VbBECy+RXw1XkC0uR3ipfM=;
 b=iQcx01iOAKM9ADvr82WdjvcTTY0ibZD7yVQ2ER/9HEDHrSj6gd1Jvb3G1BEu+I5FXT
 WOP6JYRgb0aDE8dJfCmlHoxGzrfXBlgn4t5ShQY5eZ2ZgeJbfipu+rlagcaVXYg6h46f
 ec8pNnq9QfYeDCksQoiMXnaXinRE+fMabf9lG7jQxaUuS/S15IPA9HFpZzlHXy2ei0Cx
 eNcmAhAwe8AM0HHGzseaJ82KfpEslwh+DXv3qKUtxnFnVP/E9EEN8wpR6I0w0kwiIZXL
 Fw2a16Qnm0Y7TLA6e4/IUnylX/j3eILbpsYBut+MeVkXbtYZRpLUiHaa5ez385N83ky5
 j1dw==
X-Gm-Message-State: AOAM532VnUmIAKebseQlHscLoc/6PUb3bfWqzV6HQBuAeNWUC19el5Wf
 vOE77CQCiL0i98Pkt3a5dbI=
X-Google-Smtp-Source: ABdhPJwixZy8MRgW3LXyEgrowukTHWSk8NcDL94w7gXOI1nrcvnLafh9jOxMa8H0OTe8gqgJxt9wbA==
X-Received: by 2002:a05:622a:d1:: with SMTP id
 p17mr24739684qtw.86.1620676998410; 
 Mon, 10 May 2021 13:03:18 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69?
 ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id h8sm4155457qtp.46.2021.05.10.13.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 13:03:18 -0700 (PDT)
Subject: Re: [PATCH updated v2] spapr: Fix EEH capability issue on KVM guest
 for PCI passthru
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Qemu-devel <qemu-devel@nongnu.org>
References: <162022601665.118720.1424074431457537864.stgit@jupiter>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <9c9bd838-5199-3706-583e-6b55eafacb6a@gmail.com>
Date: Mon, 10 May 2021 17:03:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162022601665.118720.1424074431457537864.stgit@jupiter>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/5/21 11:48 AM, Mahesh Salgaonkar wrote:
> With upstream kernel, especially after commit 98ba956f6a389
> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> guest isn't able to enable EEH option for PCI pass-through devices anymore.
> 
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.032337] EEH: pSeries platform initialized
> [    0.298207] EEH: No capable adapters found: recovery disabled.
> [root@atest-guest ~]#
> 
> So far the linux kernel was assuming pe_config_addr equal to device's
> config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> commit 98ba956f6a389 fixed this flow. With that fixed, linux now uses PE
> config address returned by ibm,get-config-addr-info2 RTAS call to enable
> EEH option per-PE basis instead of per-device basis. However this has
> uncovered a bug in qemu where ibm,set-eeh-option is treating PE config
> address as per-device config address.
> 
> Hence in qemu guest with recent kernel the ibm,set-eeh-option RTAS call
> fails with -3 return value indicating that there is no PCI device exist for
> the specified PE config address. The rtas_ibm_set_eeh_option call uses
> pci_find_device() to get the PC device that matches specific bus and devfn
> extracted from PE config address passed as argument. Thus it tries to map
> the PE config address to a single specific PCI device 'bus->devices[devfn]'
> which always results into checking device on slot 0 'bus->devices[0]'.
> This succeeds when there is a pass-through device (vfio-pci) present in
> slot 0. But in cases where there is no pass-through device present in slot
> 0, but present in non-zero slots, ibm,set-eeh-option call fails to enable
> the EEH capability.
> 
> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>     case RTAS_EEH_ENABLE: {
>          PCIHostState *phb;
>          PCIDevice *pdev;
> 
>          /*
>           * The EEH functionality is enabled on basis of PCI device,
>           * instead of PE. We need check the validity of the PCI
>           * device address.
>           */
>          phb = PCI_HOST_BRIDGE(sphb);
>          pdev = pci_find_device(phb->bus,
>                                 (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>          if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>              return RTAS_OUT_PARAM_ERROR;
>          }
> 
> hw/pci/pci.c:pci_find_device()
> 
> PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
> {
>      bus = pci_find_bus_nr(bus, bus_num);
> 
>      if (!bus)
>          return NULL;
> 
>      return bus->devices[devfn];
> }
> 
> This patch fixes ibm,set-eeh-option to check for presence of any PCI device
> (vfio-pci) under specified bus and enable the EEH if found. The current
> code already makes sure that all the devices on that bus are from same
> iommu group (within same PE) and fail very early if it does not.
> 
> After this fix guest is able to find EEH capable devices and enable EEH
> recovery on it.
> 
> [root@atest-guest ~]# dmesg | grep EEH
> [    0.048139] EEH: pSeries platform initialized
> [    0.405115] EEH: Capable adapter found: recovery enabled.
> [root@atest-guest ~]#
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> Change in v2:
> - Fix ibm,set-eeh-option instead of returning per-device PE config address.
> - Changed patch subject line.
> ---
>   hw/ppc/spapr_pci_vfio.c |   27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> index e0547b1740..b30020da6a 100644
> --- a/hw/ppc/spapr_pci_vfio.c
> +++ b/hw/ppc/spapr_pci_vfio.c
> @@ -47,6 +47,16 @@ void spapr_phb_vfio_reset(DeviceState *qdev)
>       spapr_phb_vfio_eeh_reenable(SPAPR_PCI_HOST_BRIDGE(qdev));
>   }
>   
> +static void spapr_eeh_pci_find_device(PCIBus *bus, PCIDevice *pdev,
> +                                      void *opaque)
> +{
> +    bool *found = opaque;
> +
> +    if (object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> +        *found = true;
> +    }
> +}
> +
>   int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
>                                     unsigned int addr, int option)
>   {
> @@ -59,17 +69,20 @@ int spapr_phb_vfio_eeh_set_option(SpaprPhbState *sphb,
>           break;
>       case RTAS_EEH_ENABLE: {
>           PCIHostState *phb;
> -        PCIDevice *pdev;
> +        bool found = false;
>   
>           /*
> -         * The EEH functionality is enabled on basis of PCI device,
> -         * instead of PE. We need check the validity of the PCI
> -         * device address.
> +         * The EEH functionality is enabled per sphb level instead of
> +         * per PCI device. We just need to check the validity of the PCI
> +         * pass-through devices (vfio-pci) under this sphb bus.
> +         * We have already validated that all the devices under this sphb
> +         * are from same iommu group (within same PE) before comming here.
>            */
>           phb = PCI_HOST_BRIDGE(sphb);
> -        pdev = pci_find_device(phb->bus,
> -                               (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
> -        if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
> +        pci_for_each_device(phb->bus, (addr >> 16) & 0xFF,
> +                            spapr_eeh_pci_find_device, &found);
> +
> +        if (!found) {
>               return RTAS_OUT_PARAM_ERROR;
>           }
>   
> 
> 

