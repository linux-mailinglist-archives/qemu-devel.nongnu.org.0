Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8542C05D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:44:26 +0200 (CEST)
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madcP-0002IR-FZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1madaE-0000AK-F6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1madaC-0006xg-C4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634128927;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyCjUnibHz0gJpWw8DugJ/HG/yze4my/LczsFtyJ8/E=;
 b=GA9g2LwwLTEwLtZink94ZZWXEz5g+P0qV2RkPdD7A+CQs/gaBaRclLpC90VTjU0WKFdwcn
 V3Xer474/7BiUtU4XbFFcEv6jnp3Nx2udUsbV/drY9y0T5su7CMrCSIDnGD9vX8fokwzA8
 mL48ZrzSO8Aktgi+8eTKUtxin0zAeBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-xDoLanqaPmGnMdG6KCIK3Q-1; Wed, 13 Oct 2021 08:42:05 -0400
X-MC-Unique: xDoLanqaPmGnMdG6KCIK3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 l8-20020a5d6d88000000b001611b5de796so1875735wrs.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=QyCjUnibHz0gJpWw8DugJ/HG/yze4my/LczsFtyJ8/E=;
 b=LMEHmTZX6HeAaHUM5rlO0lH9zFK5fuHw7hcNagNLB/zwq+0Wi3VrVGyHdWe+K+kSzA
 OvYB05SLgUIN3bS4fYFbIuf1t1z5ZYHzjPXjQJRnmR3VkiZNf2djJp1XKlLZ117tDG+v
 rm0BhtI1NPbMp0/aSYWa/p07LdFHL7vA+nkeocS5PT++xtTLp4ToiWpOd8wG7erDAPl4
 b8jR0UIldpnN7GnuzRxv2ev/ILHavgiOP0ni5A6PKzuHeFJTZSiZprxcSeiWaPNEcmyB
 qkTPUwYPj02YFqCkP9ntc2Yx3xB8tLznqikyzSH/DkJzNYDiRoCrO7CrJM+lfqjog9vX
 j8Zw==
X-Gm-Message-State: AOAM5305MnPUF/zWUyTSppTA2xe+r/rDyEmnDdg+npPn1AvW99TrGnF4
 2hmr/Oc9dOcM3X/c81j9MN8InGhASJU+lDtjzUiANhNL7E6gpXYE7HFwDpalBVoHmrcZZAK82Nr
 2jHbdOfIx17pKjCY=
X-Received: by 2002:a1c:a302:: with SMTP id m2mr12579330wme.111.1634128924853; 
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg7/aRaNrdPlFqDYQbXXV2sLLRxqC1nF4CuQlsOHmTSF2Wv6Cci8kc72lytH8PHDGYtwELuw==
X-Received: by 2002:a1c:a302:: with SMTP id m2mr12579293wme.111.1634128924598; 
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id j13sm4164651wro.97.2021.10.13.05.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 05:42:04 -0700 (PDT)
Subject: Re: [PATCH] virtio-iommu: Remove non transitional name
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 peter.maydell@linaro.org
References: <20211013095554.758806-1-eric.auger@redhat.com>
 <875yu1w74z.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ddf10477-6c70-748e-6bfd-4a5498c1e7e3@redhat.com>
Date: Wed, 13 Oct 2021 14:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <875yu1w74z.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connie,

On 10/13/21 12:28 PM, Cornelia Huck wrote:
> On Wed, Oct 13 2021, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Remove non transitional name for virtio iommu. Like other
>> devices introduced after 1.0 spec, the virtio-iommu does
>> not need it.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Andrea Bolognani <abologna@redhat.com>
>> ---
>>  hw/virtio/virtio-iommu-pci.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
>> index 770c286be7..86fa4e6c28 100644
>> --- a/hw/virtio/virtio-iommu-pci.c
>> +++ b/hw/virtio/virtio-iommu-pci.c
>> @@ -100,7 +100,6 @@ static void virtio_iommu_pci_instance_init(Object *obj)
>>  static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
>>      .base_name             = TYPE_VIRTIO_IOMMU_PCI,
>>      .generic_name          = "virtio-iommu-pci",
>> -    .non_transitional_name = "virtio-iommu-pci-non-transitional",
>>      .instance_size = sizeof(VirtIOIOMMUPCI),
>>      .instance_init = virtio_iommu_pci_instance_init,
>>      .class_init    = virtio_iommu_pci_class_init,
> No objections, but I'm a bit confused regarding base_name and
> generic_name here. Can you drop base_name, re-define
> TYPE_VIRTIO_IOMMU_PCI to "virtio-iommu-pci", and switch generic_name
> over to it? I think that would be more in line with other modern-only
> devices. AFAICS, the places using the #define should continue to work.
>
Sure, this all makes sense to me.

Thanks!

Eric


