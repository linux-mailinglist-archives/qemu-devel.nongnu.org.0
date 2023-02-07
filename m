Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3E68DDC3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:18:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQfc-0004DF-0p; Tue, 07 Feb 2023 11:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pPQfW-00045d-E9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pPQfT-0005CE-Ar
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675786681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ymC4Lb+Or96wQJg6/UsRWwOAe/S2dsLKYdASsAg18Q=;
 b=GGBVq7YhidvRlzdabsntzdEKM0FwHy3BTvAfoF8fPaDBdroU/tizOGbGBXIcGBBuejhEhm
 CqygGI7xwmsjA79EuWHT0TCKPIyKD9QN8VWN7OtgFcBjqcEz98nDQtBNeJ5C95cP4R4Uae
 uDg+y6ZjqIpBXEeZC984Ukn0BoOotFg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-u0m8UgVCOX66E4uetHFwUA-1; Tue, 07 Feb 2023 11:17:47 -0500
X-MC-Unique: u0m8UgVCOX66E4uetHFwUA-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay10-20020a05620a178a00b0072db6346c39so8797712qkb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ymC4Lb+Or96wQJg6/UsRWwOAe/S2dsLKYdASsAg18Q=;
 b=BIWPy5EaQJXCsD4X/oi/YRUI3j3CNBnhnDyvW6aa3j1T4rAxEWXGR73TyDa5cWLKSr
 WG5h8HBLgUfsEE5jhJIhHtOSHJKVIuAab8f9/5pDECB7TXdt3ETgDjKZq7fQrOXYkL3h
 6jucgEHDGKw72IGxjCYSuJEBPvtqjbuBIIi9A1n8NnZ1OhIriP4tWQtddv9p632djQOy
 lL0wXqfq98wY7wT/xb8wuC+ppscpFf88ph38kINlsy0grsnhZnoKNYBs6W0d6c669Fg3
 VuhR8tUHyGiKORoMZKn4FPF/B64AFzyCxZfoJCrWxKtVhNqV7d5QqLKJgKkGmF2yqZS3
 QwIw==
X-Gm-Message-State: AO0yUKV35AcucXRCEejp/K6iptB/JWkdMOwcvYtI5as/39dEKgYfSKT1
 mATXDqT0cBPbx5X9p6ejeRgDnmkQiKBHNU/La4v4/GRD07rLaDpA669ta8TSnkNnVL+3uCGgU/3
 jq9UbjEqydqUM29Q=
X-Received: by 2002:a05:6214:21ad:b0:56b:f7fa:4591 with SMTP id
 t13-20020a05621421ad00b0056bf7fa4591mr5200299qvc.29.1675786666058; 
 Tue, 07 Feb 2023 08:17:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/GqsVvAiqBSmQJ+4FfNT1sDPIo8YLMkSogej3unlg6Qy7znSVZvq5uBsCqlitYlJyVt69AbA==
X-Received: by 2002:a05:6214:21ad:b0:56b:f7fa:4591 with SMTP id
 t13-20020a05621421ad00b0056bf7fa4591mr5200266qvc.29.1675786665806; 
 Tue, 07 Feb 2023 08:17:45 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05620a408600b0072a375c291csm9788679qko.30.2023.02.07.08.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:17:45 -0800 (PST)
Message-ID: <c4df55fe-99ff-ef0f-c006-e70809e8890d@redhat.com>
Date: Tue, 7 Feb 2023 17:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
 <185ce2ea-62c3-71e5-7ef1-1e0b4e35d01c@redhat.com>
In-Reply-To: <185ce2ea-62c3-71e5-7ef1-1e0b4e35d01c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/3/23 10:08, Laurent Vivier wrote:
> On 11/29/22 09:10, Jason Wang wrote:
>> Without dt mode, device IOTLB notifier won't work since guest won't
>> send device IOTLB invalidation descriptor in this case. Let's fail
>> early instead of misbehaving silently.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/i386/intel_iommu.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index 9143376677..d025ef2873 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>   {
>>       VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>>       IntelIOMMUState *s = vtd_as->iommu_state;
>> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>>       /* TODO: add support for VFIO and vhost users */
>>       if (s->snoop_control) {
>> @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>                            PCI_FUNC(vtd_as->devfn));
>>           return -ENOTSUP;
>>       }
>> +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
>> +        error_setg_errno(errp, ENOTSUP,
>> +                         "device %02x.%02x.%x requires device IOTLB mode",
>> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
>> +                         PCI_FUNC(vtd_as->devfn));
>> +        return -ENOTSUP;
>> +    }
>>       /* Update per-address-space notifier flags */
>>       vtd_as->notifier_flags = new;
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> Tested-by: Laurent Vivier <lvivier@redhat.com>
> Buglink: https://bugzilla.redhat.com/2156876

Is this possible to have this patch merged?
It fixes a real problem and it is really trivial.

Thanks,
Laurent


