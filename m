Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1D68931C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNs3u-0002VC-IZ; Fri, 03 Feb 2023 04:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pNs3q-0002V0-5t
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 04:08:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pNs3n-0007Eq-S7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 04:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675415321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReBdY3C0L8LLrS6o3zx9/2zwjmKGht/tsEwAqDDuCXI=;
 b=aLo5U/l5xOi5BSAmuHfIEnT+pH2o77yZcQhkosZGUnJUTvFhSbwOi8UOdc57r8jW8UUmNT
 YxvBJqPEJa46kJXFNoFAZmS8OlMAFKB43Dldv/THotb98MvY7KxVp6BIx9muXeH4XFStbI
 nIY+vaskUAOqTXP0cORyUZ6AID7kNzY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-qG9qkbn2NFiL4eX_RaIDog-1; Fri, 03 Feb 2023 04:08:40 -0500
X-MC-Unique: qG9qkbn2NFiL4eX_RaIDog-1
Received: by mail-qk1-f198.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so2953894qkg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 01:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReBdY3C0L8LLrS6o3zx9/2zwjmKGht/tsEwAqDDuCXI=;
 b=JzCEtUZTReofJ9ckeK5IoDsHuCSEaEdBxqZ5i3ljOC3/6aKLAL3qCkAEm3kkaMgqdb
 8ExY9MI181vlzgaPDxR4QMiaUkARanj3Z0Vk7lBG07l9OamrFs6GRZ0VD6GZ14gUAyrd
 08KWVKYTYnpb9jUm2J6vQF9vat8EzPFnoB6Sn6C1O/banw7R4L6luYzzVyN4YzeVaIii
 6BGaSfJ1T0iTwDZ3u2nBAjuLGwSjiScjUtlVSoJhnlId0FfLmfR1UMniI7a66Q56KDH5
 2BM7KgEXhBsTOOGJoslS/R7qcn3GwFedXg35lWnIFlmpxEeyQYbD8Obx1SqYFzayWjgO
 sJFQ==
X-Gm-Message-State: AO0yUKWDKg6T5Q3f/h/9+BmavgAJ+7Kg5QW9nQBqF7FLwSZv2slLZdJL
 OcMcEXtx9pypHc2G8d0tmfIlzn0rs6Jwrbkl/04eO6db3jcrSHe9+NQjQ6IPn8/zAXTud3t3Frn
 IPCpGZksmuSfpoCU=
X-Received: by 2002:ac8:7d94:0:b0:3b9:ba7a:dd89 with SMTP id
 c20-20020ac87d94000000b003b9ba7add89mr7795528qtd.58.1675415318388; 
 Fri, 03 Feb 2023 01:08:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9t7/653FmczY4WJ1JA7PT6S6CwdXiBX5VdQfKetjd+JvWUWPM54VqRez8HcsyrdMSrwt3cgA==
X-Received: by 2002:ac8:7d94:0:b0:3b9:ba7a:dd89 with SMTP id
 c20-20020ac87d94000000b003b9ba7add89mr7795514qtd.58.1675415318094; 
 Fri, 03 Feb 2023 01:08:38 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aed2799000000b003b8484fdfccsm1255198qtd.42.2023.02.03.01.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 01:08:37 -0800 (PST)
Message-ID: <185ce2ea-62c3-71e5-7ef1-1e0b4e35d01c@redhat.com>
Date: Fri, 3 Feb 2023 10:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20221129081037.12099-3-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/29/22 09:10, Jason Wang wrote:
> Without dt mode, device IOTLB notifier won't work since guest won't
> send device IOTLB invalidation descriptor in this case. Let's fail
> early instead of misbehaving silently.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/i386/intel_iommu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 9143376677..d025ef2873 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>   {
>       VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>       IntelIOMMUState *s = vtd_as->iommu_state;
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>   
>       /* TODO: add support for VFIO and vhost users */
>       if (s->snoop_control) {
> @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                            PCI_FUNC(vtd_as->devfn));
>           return -ENOTSUP;
>       }
> +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "device %02x.%02x.%x requires device IOTLB mode",
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }
>   
>       /* Update per-address-space notifier flags */
>       vtd_as->notifier_flags = new;

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Buglink: https://bugzilla.redhat.com/2156876


