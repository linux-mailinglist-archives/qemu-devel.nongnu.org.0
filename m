Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC93FDA2F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:15:51 +0200 (CEST)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQ5m-0006p7-B3
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLQ4D-0004kw-Iq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLQ4A-0007lt-PM
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630502048;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTq8bzNn/15bWWZP7Imc88LXypLn3mTLFNxBVP2+CAo=;
 b=CTIfx1VWntzYqGCAmslNuRUc2xXL5+8vftUj02MeqFKa2dvP6ClNGpprA19xB458a8R/wO
 TO5xAh6+zA3Z3rFbYpnKF0T1hFyerIjki8JrnicDjX2xxujPazl9fyDx776Z68DSVTeFAy
 CNEoZ8PxPGGpivcCn6Btbsg61AZk7nc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ljfNFpXaNaeShk2prLaW6g-1; Wed, 01 Sep 2021 09:14:07 -0400
X-MC-Unique: ljfNFpXaNaeShk2prLaW6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso2833075wmx.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 06:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zTq8bzNn/15bWWZP7Imc88LXypLn3mTLFNxBVP2+CAo=;
 b=Roal+S7OOVd/iUr/2kHGWemadx9N0tp1rg+bxi0CI28DZ+G5TcN1CqtUt80yeUFNii
 kCgvWtnDo7KnEHEEU83CHpujFKElpfki7AaP1MGt8/WkGQLN+/4uLPzWWpr24VxGo5pE
 LefxOVkNoXOqHDl6hsE392zF+qBq2b89kJT5dvxpwrSljBBG2fMEaXAfJLLU7dp28zaY
 oF9J3i4Pk3t2+gjNswJWMPR5iixEZ1IY7wxdv5oTP78omQnkiRdx4e5zImsnbWb3pHV5
 1uHflctyITnbbgWgLX7o+WQxq7ZsloT3ipQMwbLwBrj/EWOphrGiYUHT2QiKMk2CD4OK
 Yyvg==
X-Gm-Message-State: AOAM532Z5bTh7H4bvJbOfDWzJX/8ET8KteuklIkeEjFVmDEC7XQ+osHS
 d2yvh8ULXWdceFMwX3bOmxENuPtATkqDIpkGoPoWY5s16p9PJ3a8AKjWQ496neyE7q/reQV51LN
 NB+4aNVxXjVUQRcg=
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr9820008wmq.6.1630502046693; 
 Wed, 01 Sep 2021 06:14:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyos1xg1ISqaCeGUtS5ZXi1DVj2SU4ebEl5f+vKuo84PhdG6hBVUicg5/t+kjC4p8VVYLztCw==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr9819982wmq.6.1630502046423; 
 Wed, 01 Sep 2021 06:14:06 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r12sm21903785wrv.96.2021.09.01.06.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:14:05 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
To: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
 <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
 <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <48a545f5-d21c-85b1-20dd-b5449b88e993@redhat.com>
Date: Wed, 1 Sep 2021 15:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6EA1E0@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/1/21 8:33 AM, Liu, Renwei wrote:
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Tuesday, August 31, 2021 10:46 PM
>> To: Liu, Renwei; Peter Maydell
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Li, Chunming; Wen,
>> Jianxian
>> Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
>>
>> Hi Liu,
>>
>> On 8/23/21 9:50 AM, Liu, Renwei wrote:
>>> Simplify range invalidation which can avoid to iterate over all
>>> iotlb entries multi-times. For instance invalidations patterns like
>>> "invalidate 32 4kB pages starting from 0xffacd000" need to iterate
>> over
>>> all iotlb entries 6 times (num_pages: 1, 2, 16, 8, 4, 1). It only
>> needs
>>> to iterate over all iotlb entries once with new implementation.
>> This wouldn't work. This reverts commit
>> 6d9cd115b9df ("hw/arm/smmuv3: Enforce invalidation on a power of two
>> range")
>> which is mandated for VFIO and virtio to work. IOTLB invalidations must
>> be naturally aligned and with a power of 2 range, hence this iteration.
>>
>> Thanks
>>
>> Eric
> Hi Eric,
>
> Could you try the patch firstly? I want to know whether it's failed
> in your application scenario with this implementation.
There are many test cases, virtio-pci, vhost, VFIO, ...
> I agree with you that IOTLB entry must be naturally aligned and
> with a power of 2 range. But we can invalidate multi IOTLB entries
> in one iteration. We check the overlap between invalidation range
> and IOTLB range, not check mask.
This smmu_hash_remove_by_asid_iova() change only affects the internal
SMMUv3 IOTLB hash table lookup. However there are also IOTLB
invalidation notifications sent to components who registered notifiers,
ie. smmuv3_notify_iova path.
>  The final result is same with
> your implementation (split to multi times with a power of 2 range).
> I wonder why we can't implement it directly when the application can
> send an invalidation command with a non power of 2 range.
> We have tested it in our application scenario and not find any fail.
Assume the driver invalidates 5 * 4kB pages =0x5000 range.  Without the
loop you removed

in smmuv3_notify_iova()  event.entry.addr_mask = num_pages * (1 <<
granule) - 1 = 0x4FFF. This addr_mask  is an invalid mask
this entry is passed to components who registered invalidation notifiers
such as vhost or vfio. for instance in VFIO you have '&' ops on the
addr_mask.
addr_mask is expected to be a mask of a power of 2 range.

Does it clarify?

Thanks

Eric
>
> In addition, from the code implementation, smmu_iotlb_inv_iova()
> should be OK. In another call smmuv3_inv_notifiers_iova() ->
> smmuv3_notify_iova() -> memory_region_notify_iommu_one(),
> it also checks range overlap. So it should be OK if the range
> is not a power of 2.
>
> Could you take a look at it again?
>
> Thanks
> Renwei Liu


