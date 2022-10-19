Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CAB603964
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 07:54:00 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol21f-00067h-2R
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 01:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ol1tN-00025h-1G
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ol1tL-0002JO-Fx
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 01:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666158322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTjfiKqI3ws7NMqWZ0qvULbBrSvCxTJ2huOyTLgXKLo=;
 b=WlPDJCvKaXZYIpUayjXzV8sx7PqQlexut4/sFkHZMWyl7usK7l5NwstDQQi6uHpL1mwuWE
 zTB4dxBQeycgBK6ZV+NvKppYR5gGqQBlTw/xV7p0+5J0FCk5z/MZW8hEsw1ZLoNd168DWY
 E1N+k1N+RaXg83EcDLBZLp+U4Rz2xXE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Dl5NzB0fMnewtah4BSh7cQ-1; Wed, 19 Oct 2022 01:45:21 -0400
X-MC-Unique: Dl5NzB0fMnewtah4BSh7cQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 q3-20020a17090a304300b0020aede449d6so7897084pjl.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 22:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTjfiKqI3ws7NMqWZ0qvULbBrSvCxTJ2huOyTLgXKLo=;
 b=TOaa8/cfV1J5++iV12KqsUgsgpvp0xIKhPMJWFyl0NDFqZXYj7H1j0fGzthdG7T5VM
 k2aM3ExqhAA8St+7GWjr+OihIft18X3KqKhTmz9J5QOxyr9EcJdehUPzrM9EDK2Tkw4y
 VQMGhFHbtfbmmFArI/6oOZoT8g7LYBy1kfUARc2LsRm2ls4vh4+KR8vDvAAM+ox3t07q
 SWoqJSZosTR2Lu95J22b5bQ709JWEb7AFUNlnnw0kcVOBpjflaGjCzMfi/cg4gOVP5uj
 521XGmv0lwtFmFrJYxsAD1iEaOQxWGhVbWN1o9OirzwkpM1mfvcaIK+YuBCs5vbQFELA
 mHGQ==
X-Gm-Message-State: ACrzQf07WGApCBI72mmLinFZZZlQoKicreP88o31s4EayZVb65i6BdAI
 WSkpo6ajkEG4OYK83xrsx/hzPEXAXtmocGQZVh+FjWnkQySl0WFUzDFCdc8B3FwkwWzqXHtNTxe
 wnMHEtNASsvwO4kE=
X-Received: by 2002:a17:903:2346:b0:183:3e95:6f5d with SMTP id
 c6-20020a170903234600b001833e956f5dmr6778099plh.165.1666158320308; 
 Tue, 18 Oct 2022 22:45:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IjuYQ52425uMKlubTk9JPWPmsflT5ii/hEMAwVnMXWlDhh77mzVi3g/4dKAkdFzREq1NaNg==
X-Received: by 2002:a17:903:2346:b0:183:3e95:6f5d with SMTP id
 c6-20020a170903234600b001833e956f5dmr6778088plh.165.1666158320060; 
 Tue, 18 Oct 2022 22:45:20 -0700 (PDT)
Received: from [10.72.12.164] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b001786b712bf7sm9707489pli.151.2022.10.18.22.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 22:45:19 -0700 (PDT)
Message-ID: <1e705138-e640-b753-b1ae-26ec2ac97985@redhat.com>
Date: Wed, 19 Oct 2022 13:45:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
References: <20221018215407.363986-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221018215407.363986-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/10/19 05:54, Peter Xu 写道:
> All x86 IOMMUs need to fail DEVIOTLB notification registrations if DT is
> not supported.  Otherwise any device (e.g. vhost) can register with
> DEVIOTLB but it'll never receive the notifications, causing device not
> operational.
>
> Fixes: b68ba1ca57 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/i386/amd_iommu.c   | 8 ++++++++
>   hw/i386/intel_iommu.c | 7 +++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 725f69095b..42486e790f 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1476,6 +1476,7 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                                              Error **errp)
>   {
>       AMDVIAddressSpace *as = container_of(iommu, AMDVIAddressSpace, iommu);
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(as->iommu_state);
>   
>       if (new & IOMMU_NOTIFIER_MAP) {
>           error_setg(errp,
> @@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                      PCI_FUNC(as->devfn));
>           return -EINVAL;
>       }
> +
> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "Device-iotlb not declared support for vIOMMU");
> +        return -ENOTSUP;
> +    }
> +
>       return 0;
>   }
>   
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6524c2ee32..a07d9631b0 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3057,6 +3057,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>   {
>       VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>       IntelIOMMUState *s = vtd_as->iommu_state;
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>   
>       /* TODO: add support for VFIO and vhost users */
>       if (s->snoop_control) {
> @@ -3065,6 +3066,12 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>           return -ENOTSUP;
>       }
>   
> +    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "Device-iotlb not declared support for vIOMMU");
> +        return -ENOTSUP;
> +    }
> +
>       /* Update per-address-space notifier flags */
>       vtd_as->notifier_flags = new;
>   


