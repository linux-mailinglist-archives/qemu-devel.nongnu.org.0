Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF29649E18
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:43:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h55-0002Ft-Ie; Mon, 12 Dec 2022 06:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4h4j-000299-Gm
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4h4g-0000Xe-AP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670844849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB4cbIghYmGUMwRvC4AZkrJwQn3gllsQKn+ScP7LYPg=;
 b=XC9WTYjTiwwzJ6DijtTohjKDCiEY2Mcg6I9KAeMtPUP+FDCbfQp99YsfNBEhAeSHBfOQSL
 dRjEOKcJfF+jezd6cr4frQkl49j8QHeuxydHxl3IhJ8M0qFEn0C8UsAQ/QmEhbQSxCAMu5
 1q3Dz2Z7senPA8pa+pF6/rYjgBHTRMQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-fdHyP32GMKOIA1lR7SkO2g-1; Mon, 12 Dec 2022 06:34:06 -0500
X-MC-Unique: fdHyP32GMKOIA1lR7SkO2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so2146142wrg.16
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LB4cbIghYmGUMwRvC4AZkrJwQn3gllsQKn+ScP7LYPg=;
 b=IyU55GSlqBINhmWIE/EJqomEJ7sIpjz4tJwGivduPhxInrTwTBQeigKt3fyzLBLGkZ
 C3x9jrr0cVltJFkOlWKDrK6Ws3qi+kjbvfMIT1F7NoJbnfemxwQQsPlQeaiOYsaI4TJs
 VeMZ7vby0pWERNxAcAOmsiUear//c1fRy7CYL1NAVADed1C0YP4DxNnoGcreLULce52K
 NERYIqbVmiUm/si3zjJ5LQ7a+yiFYM4THMX+8yI2a4tBxG+crkwKZ7fYEjJdqlDC9ssC
 7XCHwIrEazmzXjfOL7d+Fw/DJw2u8ma7olUq03smZPKRpzhrqxvETOHORxFbcMm7CQ4d
 zLQw==
X-Gm-Message-State: ANoB5plznA9onwwtFf01ohgyD1b96GHtoqfUbPGwEOuuxZ+tLCnDzskv
 P2onKuO5ZAtK0QQHfxL6GnK52z6N4nS+M9O92tgE2m5wGwr7jT0IfmnpAXXLwJpuEg33ueRRUif
 k8MbnwSb7NnNImYQ=
X-Received: by 2002:a05:600c:3549:b0:3c6:e61e:ae8c with SMTP id
 i9-20020a05600c354900b003c6e61eae8cmr15324251wmq.28.1670844843364; 
 Mon, 12 Dec 2022 03:34:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4lSawH5UXcHaDfsFk32urY5KzHew4jyRtz+gxfuwIutlHoGGxslhpzsWwRP9PK0XuS69ME4Q==
X-Received: by 2002:a05:600c:3549:b0:3c6:e61e:ae8c with SMTP id
 i9-20020a05600c354900b003c6e61eae8cmr15324232wmq.28.1670844843134; 
 Mon, 12 Dec 2022 03:34:03 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003d21759db42sm9388983wmq.5.2022.12.12.03.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:34:02 -0800 (PST)
Message-ID: <8a0aa955-6637-789a-cac3-063c384111dc@redhat.com>
Date: Mon, 12 Dec 2022 12:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] s390x/pci: reset ISM passthrough devices on shutdown and
 system reset
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 qemu-devel@nongnu.org
References: <20221209195700.263824-1-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221209195700.263824-1-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/12/2022 20.57, Matthew Rosato wrote:
> ISM device firmware stores unique state information that can
> can cause a wholesale unmap of the associated IOMMU (e.g. when
> we get a termination signal for QEMU) to trigger firmware errors
> because firmware believes we are attempting to invalidate entries
> that are still in-use by the guest OS (when in fact that guest is
> in the process of being terminated or rebooted).
> To alleviate this, register both a shutdown notifier (for unexpected
> termination cases e.g. virsh destroy) as well as a reset callback
> (for cases like guest OS reboot).  For each of these scenarios, trigger
> PCI device reset; this is enough to indicate to firmware that the IOMMU
> is no longer in-use by the guest OS, making it safe to invalidate any
> associated IOMMU entries.
> 
> Fixes: 15d0e7942d3b ("s390x/pci: don't fence interpreted devices without MSI-X")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c         | 28 ++++++++++++++++++++++++++++
>   hw/s390x/s390-pci-vfio.c        |  2 ++
>   include/hw/s390x/s390-pci-bus.h |  5 +++++
>   3 files changed, 35 insertions(+)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 977e7daa15..02751f3597 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -24,6 +24,8 @@
>   #include "hw/pci/msi.h"
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
>   
>   #ifndef DEBUG_S390PCI_BUS
>   #define DEBUG_S390PCI_BUS  0
> @@ -150,10 +152,30 @@ out:
>       psccb->header.response_code = cpu_to_be16(rc);
>   }
>   
> +static void s390_pci_shutdown_notifier(Notifier *n, void *opaque)
> +{
> +    S390PCIBusDevice *pbdev = container_of(n, S390PCIBusDevice,
> +                                           shutdown_notifier);
> +
> +    pci_device_reset(pbdev->pdev);
> +}
> +
> +static void s390_pci_reset_cb(void *opaque)
> +{
> +    S390PCIBusDevice *pbdev = opaque;
> +
> +    pci_device_reset(pbdev->pdev);
> +}
> +
>   static void s390_pci_perform_unplug(S390PCIBusDevice *pbdev)
>   {
>       HotplugHandler *hotplug_ctrl;
>   
> +    if (pbdev->pft == ZPCI_PFT_ISM) {
> +        notifier_remove(&pbdev->shutdown_notifier);
> +        qemu_unregister_reset(s390_pci_reset_cb, pbdev);
> +    }
> +
>       /* Unplug the PCI device */
>       if (pbdev->pdev) {
>           DeviceState *pdev = DEVICE(pbdev->pdev);
> @@ -1111,6 +1133,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                   pbdev->fh |= FH_SHM_VFIO;
>                   pbdev->forwarding_assist = false;
>               }
> +            /* Register shutdown notifier and reset callback for ISM devices */
> +            if (pbdev->pft == ZPCI_PFT_ISM) {
> +                pbdev->shutdown_notifier.notify = s390_pci_shutdown_notifier;
> +                qemu_register_shutdown_notifier(&pbdev->shutdown_notifier);
> +                qemu_register_reset(s390_pci_reset_cb, pbdev);
> +            }
>           } else {
>               pbdev->fh |= FH_SHM_EMUL;
>               /* Always intercept emulated devices */
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 5f0adb0b4a..419763f829 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -122,6 +122,8 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>       /* The following values remain 0 until we support other FMB formats */
>       pbdev->zpci_fn.fmbl = 0;
>       pbdev->zpci_fn.pft = 0;
> +    /* Store function type separately for type-specific behavior */
> +    pbdev->pft = cap->pft;
>   }

Thanks, queued:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

I had to adjust the hunk in s390_pci_read_base() due to a conflict with your 
earlier patch, please check whether it looks sane to you.

  Thomas


