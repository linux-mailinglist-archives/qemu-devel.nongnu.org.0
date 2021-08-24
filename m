Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE73F62A5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:25:55 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZFK-0006Sg-H7
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIZE5-0004Nq-8P
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:24:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIZE1-00040i-LU
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629822271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1AcUw+Iy9iC0Bz5Z3PkFWJ5COVTG5mW/NfkZAs0G3I=;
 b=giraZZ7kUzLPlLQ4eRFlQScMdnBaZvJpHP6qMht9EMV238ob2+gZENGx3akpzXAG+tk2GB
 tIAcOVzoeymk/HALrUDoepW6q62SLi258nD8oII1oqXjbib1r6zyx/umq3csSSVDPJQHfi
 BTS4qMQ3qRIzWGNuctcWFrEy7xOyxrk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-nrP1CjcDNE2q5f6k-knnbg-1; Tue, 24 Aug 2021 12:24:30 -0400
X-MC-Unique: nrP1CjcDNE2q5f6k-knnbg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso1445700wma.9
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y1AcUw+Iy9iC0Bz5Z3PkFWJ5COVTG5mW/NfkZAs0G3I=;
 b=QwLYILSChN39+/Ekox6VaiNTq3JDyALy441G8g8JOQ5lxmWZ8J2VMXWnoDzl74nOLU
 JmpzemFENjHYmEZ5LTXkMl3pXraI+Blb4IzRveBZbYgxRMaJt7KyJdRDOtl1ADyySBnm
 93vyutJD+rQmOh8RKZjfGcgPYkAH4SQuJ3Cs2SOeUiQ49JGOn0bh3+Qe1V1SpjE7thsU
 gh0YmdDauTnklS3yxLH/RTQRyI7/iLRtafM96rDLTW2ud/aQWfaQ3gHmv3ErauuTtoNb
 99h2eB9sW4A3ID6HpKQXrza6nrVRyyzv2NuE/DTMjoas0/3Ss3zVz5lSB1kIw7lZRT1l
 AEWw==
X-Gm-Message-State: AOAM531DNrDKmr75l9l3lKVvKZaiajxqm8yKUIEYsf0KdYzF0RiHVSKU
 AaffM0ifpl+SmV2FKIdSLk4WJ0TLIOjPBxpSJ16hQM46FZ8ZBPB2auugGCNXXCQGm83P7967Mxx
 GMU+G9s14cDeTwhg=
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr20610726wrk.301.1629822269257; 
 Tue, 24 Aug 2021 09:24:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGIb30lgq7FWwYdPVnu5w71/MSu38ZtmFwzXbn4jqXAFPf5WbY6hVLISw0YOJA/4u9Fq4TXw==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr20610711wrk.301.1629822269059; 
 Tue, 24 Aug 2021 09:24:29 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c4d.dip0.t-ipconnect.de. [79.242.60.77])
 by smtp.gmail.com with ESMTPSA id
 b13sm18595953wrf.86.2021.08.24.09.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:24:28 -0700 (PDT)
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <4246646f-dee8-c868-0439-1ba7c8fdef3e@redhat.com>
Date: Tue, 24 Aug 2021 18:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823175457-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 00:05, Michael S. Tsirkin wrote:
> On Mon, Aug 23, 2021 at 03:18:51PM -0400, Peter Xu wrote:
>> On Mon, Aug 23, 2021 at 02:49:12PM -0400, Eduardo Habkost wrote:
>>> On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
>>>> QEMU creates -device objects in order as specified by the user's cmdline.
>>>> However that ordering may not be the ideal order.  For example, some platform
>>>> devices (vIOMMUs) may want to be created earlier than most of the rest
>>>> devices (e.g., vfio-pci, virtio).
>>>>
>>>> This patch orders the QemuOptsList of '-device's so they'll be sorted first
>>>> before kicking off the device realizations.  This will allow the device
>>>> realization code to be able to use APIs like pci_device_iommu_address_space()
>>>> correctly, because those functions rely on the platfrom devices being realized.
>>>>
>>>> Now we rely on vmsd->priority which is defined as MigrationPriority to provide
>>>> the ordering, as either VM init and migration completes will need such an
>>>> ordering.  In the future we can move that priority information out of vmsd.
>>>>
>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>>
>>> Can we be 100% sure that changing the ordering of every single
>>> device being created won't affect guest ABI?  (I don't think we can)
>>
>> That's a good question, however I doubt whether there's any real-world guest
>> ABI for that.  As a developer, I normally specify cmdline parameter in an adhoc
>> way, so that I assume most parameters are not sensitive to ordering and I can
>> tune the ordering as wish.  I'm not sure whether that's common for qemu users,
>> I would expect so, but I may have missed something that I'm not aware of.
>>
>> Per my knowledge the only "guest ABI" change is e.g. when we specify "vfio-pci"
>> to be before "intel-iommu": it'll be constantly broken before this patchset,
>> while after this series it'll be working.  It's just that I don't think those
>> "guest ABI" is necessary to be kept, and that's exactly what I want to fix with
>> the patchset..
>>
>>>
>>> How many device types in QEMU have non-default vmsd priority?
>>
>> Not so much; here's the list of priorities and the devices using it:
>>
>>         |--------------------+---------|
>>         | priority           | devices |
>>         |--------------------+---------|
>>         | MIG_PRI_IOMMU      |       3 |
>>         | MIG_PRI_PCI_BUS    |       7 |
>>         | MIG_PRI_VIRTIO_MEM |       1 |
>>         | MIG_PRI_GICV3_ITS  |       1 |
>>         | MIG_PRI_GICV3      |       1 |
>>         |--------------------+---------|
> 
> iommu is probably ok. I think virtio mem is ok too,
> in that it is normally created by virtio-mem-pci ...

IIRC:

intel-iommu has to be created on the QEMU cmdline before creating 
virtio-mem-pci.

-device intel-iommu,caching-mode=on,intremap=on,device-iotlb=on \
...
-device 
virtio-mem-pci,disable-legacy=on,disable-modern=off,iommu_platform=on,ats=on,id=vm0,...

Creating virtio-mem-pci will implicitly create virtio-mem. virtio-mem 
device state has to be migrated before migrating intel-iommu state.

I do wonder if migration priorities are really what we want to reuse 
here. I guess it works right, but just by pure luck (because we ignore 
the implicit dependency regarding priorities)

-- 
Thanks,

David / dhildenb


