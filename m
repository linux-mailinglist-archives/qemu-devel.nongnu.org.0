Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E9644568
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:17:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Y5A-0000T3-Ey; Tue, 06 Dec 2022 08:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Y58-0000ST-CY
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:33:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2Y56-00055P-Cm
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 08:33:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670333635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dlWykFnWHJYYTbTLIS0LbCYa4QeUmsL+mLQqZl//v0=;
 b=UIjPkT6hg/Zx00FVtG8sUJMOuDiZmyVT7d9mQblopR6TPju6LeLIE2UxsXG+gY4G0Jbqcd
 eQgAOEiwSzp+xrNiSUTN2E9+8VQ7lBTsKr75W0T0+RJkPpXPhBEwvdfVQPwhlnn0CviMtJ
 Chk45UjgZ7UMz0ReDCZOwMO7BBQTAgo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-WyKbxBRoM7Gd-xvlxSMUGA-1; Tue, 06 Dec 2022 08:33:54 -0500
X-MC-Unique: WyKbxBRoM7Gd-xvlxSMUGA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so5664934wmb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 05:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4dlWykFnWHJYYTbTLIS0LbCYa4QeUmsL+mLQqZl//v0=;
 b=Ejxj/K4SJWPm5yl+LRqaJMQr4gXkoE5vgDO3KmUHFancsBAIp7yohl+aI4XbE2pjqA
 o4xz0Q+LYc4rf9emQmLZnrXcoYRUHtXE0MErrCQXrVO6PBfd+qkDf2bHyTX4YWekEBS/
 GrbkkI7hgFDjtUrMTYgi45czSbdHTFX7dAzUl3sm55SeaI+hprjfP3cOqNTm3hI48mnX
 CDEeLqmUxD8zL+sPyN6OI/2tYVagnVEcVMkNuJlRCEKDh1yHBYGVG8Kmd27cbUSxiNZG
 F7cMqqX31PZtbjur2cJ1R6JcX8B1WDrBEbkQNajYKHmdrD55r+ftVnvSxTUpNhLLrFSo
 +KUw==
X-Gm-Message-State: ANoB5pmGcDo6mITlim25C4dUbPkvgaXnTcm2Llhw0+/793+mDRuzb6qp
 pe/vnJpX6hYryZog7kP/PD22p7HyBiRSK98Tvu9xJN2VF5OLcm69rKALQV5fR4tgjm8f7d3mMCS
 RoTNv0nzEMQnMv88=
X-Received: by 2002:adf:e3c3:0:b0:242:14b:7435 with SMTP id
 k3-20020adfe3c3000000b00242014b7435mr33723147wrm.627.1670333630984; 
 Tue, 06 Dec 2022 05:33:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6LaJ+Q2zPBqfwKB1Pn2aHE9EnG7BoZasg1aMAPlvq/G4ITyxhbfsngH8X5fN3tIJtKEEympQ==
X-Received: by 2002:adf:e3c3:0:b0:242:14b:7435 with SMTP id
 k3-20020adfe3c3000000b00242014b7435mr33723134wrm.627.1670333630742; 
 Tue, 06 Dec 2022 05:33:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm32166987wmo.0.2022.12.06.05.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:33:49 -0800 (PST)
Message-ID: <7a7ea6ed-1c5f-77be-3343-c637abc9beed@redhat.com>
Date: Tue, 6 Dec 2022 14:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, peterx@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221129081037.12099-3-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi jason,

On 11/29/22 09:10, Jason Wang wrote:
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
maybe precise INTEL IOMMU device-IOTLB mode. otherwise this may be
confused with device ATS capability?

While thinking about those error handlings (including the SMMU ones)
nothing should really prevent you from registering a notifier that is
not signalled. Maybe we should add in the documentation that any attempt
to register an IOMMU notifier to an IOMMU MR that is not able to signal
it will return an error.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }
>  
>      /* Update per-address-space notifier flags */
>      vtd_as->notifier_flags = new;


