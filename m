Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC563F4BB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:05:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0m2C-0001RG-F7; Thu, 01 Dec 2022 11:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0m2A-0001NL-BQ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:03:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0m28-0006TI-At
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669910610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7UM0HkPPTTX7kIX9xjSwYnrCPhq0I1jN4v2m1oBPnOc=;
 b=DnazeEzK6aj0y9aov7WG9559rtr2YqwoVQsSrMhm2c1A3yGU9hb6CKlW/4Qn+hSwqK0Ez6
 cwT/iEZ73u2gYRjP3VTHb35TBHqCqpLz2Vo82jE2m4NZ124pUexO+iQ+BPi0katiSmecVq
 dDztneP/Zl96SE0NuX9oXnY+5OS49c4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-pW5dTgQ5MfeeAw-PujNfhw-1; Thu, 01 Dec 2022 11:03:22 -0500
X-MC-Unique: pW5dTgQ5MfeeAw-PujNfhw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj4-20020a05620a190400b006fc7c5d454cso7427419qkb.14
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 08:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UM0HkPPTTX7kIX9xjSwYnrCPhq0I1jN4v2m1oBPnOc=;
 b=uz/UKezWrI7H5eFrj8+4yfG6Q0m5dun6AxE/Js7USeyaYPUZNfLkd9972BVeWiGVHA
 G6xJlROsepSSaRGbyShny9GXR5v4q2qOhVMwsEblaXqFKMLB5nLJrOOw7NJAdGF4Jwc4
 AKwoyg/xJU7PlBigNYjwshD32xQy2wcKVzFIovJMOnVegy2XMMAoMC0KcAdpcyvUH5R0
 ahpfUdTNt5LTcteQRSwV4nnXoGiC7irz1SxDE651NclO6wyWId/mZ57XjE5OGdeX8hOT
 fEed5bS9pUow+XuH1FNX53mxtLfx/R6MWX82whEupqot2KuUCZ8SmM/SmOkr8ueXuCuq
 0hTQ==
X-Gm-Message-State: ANoB5plIsk9OjyD8P4ghNv6+owrvoBKOSGDyGREp+dU80xf3CirS9nkt
 G0unDN6EPkaGpkNM/jEd8ETVcz0jW6NbTQv6WbR8e/+SM37rgMn3iR9lUYhlUeija1uhRrQvpzz
 e49tzUtSq+TttkPo=
X-Received: by 2002:ac8:47c5:0:b0:3a5:6a0e:db3c with SMTP id
 d5-20020ac847c5000000b003a56a0edb3cmr62846079qtr.398.1669910600445; 
 Thu, 01 Dec 2022 08:03:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4BNQjTBBk3QUHTs8WQEQsXhjtu44z4IWu+OyJVksLEhnNrBiqDJrcekeMK3/18jIGXizHpBw==
X-Received: by 2002:ac8:47c5:0:b0:3a5:6a0e:db3c with SMTP id
 d5-20020ac847c5000000b003a56a0edb3cmr62846052qtr.398.1669910600184; 
 Thu, 01 Dec 2022 08:03:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05620a318600b006fa16fe93bbsm3579107qkb.15.2022.12.01.08.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 08:03:19 -0800 (PST)
Date: Thu, 1 Dec 2022 11:03:18 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Message-ID: <Y4jQRu9KB05EYDVm@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-3-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Nov 29, 2022 at 04:10:36PM +0800, Jason Wang wrote:
> Without dt mode, device IOTLB notifier won't work since guest won't
> send device IOTLB invalidation descriptor in this case. Let's fail
> early instead of misbehaving silently.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 9143376677..d025ef2873 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>      IntelIOMMUState *s = vtd_as->iommu_state;
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>  
>      /* TODO: add support for VFIO and vhost users */
>      if (s->snoop_control) {
> @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                           PCI_FUNC(vtd_as->devfn));
>          return -ENOTSUP;
>      }
> +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "device %02x.%02x.%x requires device IOTLB mode",
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }

While my r-b holds.. let's also do this for amd-iommu in the same patch?
dt never supported there, so we can fail as long as DEVIOTLB registered.

>  
>      /* Update per-address-space notifier flags */
>      vtd_as->notifier_flags = new;
> -- 
> 2.25.1
> 

-- 
Peter Xu


