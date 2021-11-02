Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F22443468
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:13:02 +0100 (CET)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxLJ-0003N7-Hl
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhxIi-0000sb-Oe
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhxIg-0001wi-TZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635873018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqB2+vWDu8kUZTT+JPMQEQDA5wOgN4OdhbbH+AKsKFU=;
 b=LrRkPPkMxTJquC8+a2ZtyG/yuH55t+zkLq0omIukhtonsadJFD7v1/eFS2kh96U3tvq5nH
 KclFzqn2dWGjEnqTA6m+sJCqaWhBKunYTgkUcWcgfilKrteXgdl7hP9DGFUA6ANdckKTjZ
 2OZCyru1+DKDmLIcTliqwQhGJ7fjIG4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-4GFOtBCyO_-Qwx4itvJssQ-1; Tue, 02 Nov 2021 13:10:16 -0400
X-MC-Unique: 4GFOtBCyO_-Qwx4itvJssQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso7658046wri.17
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AqB2+vWDu8kUZTT+JPMQEQDA5wOgN4OdhbbH+AKsKFU=;
 b=ABwwbe6XMcUqL4I52R7CnKFZ/iim5swtGew2VN97+Ui6lZqkc3KTWi7GQfKemsDQPw
 dMTsJr3XRk+wwu7GUDuApkJCk6wylpip0A8UhY+7Z0ZXRWR269G7r2btUIrnuH9mppO6
 WcxPm0Jaqzz2QTpkCeNmrCYAeZcBy64rDwGA0r4FstE1X1hqGIiGs8g6LHCm2Q6tSWso
 ebu7bxIlapbyqTdxGpVG6GjjpAn3GAAOpWsV/B9vrhbp7Hs1+hTR3HHsrYl2wqeZ3CDd
 2qbJjW+bAcqIVrfPbtUoPU1VF41O2uVSDrll3zIl29UvAaJgSvpM9uaokKflTC0uarlg
 pvwQ==
X-Gm-Message-State: AOAM532qOijyTBYN3Uq+BWAU6Uvekgwr4viPynd8+YYPlo2b1KM2KgNm
 rVm59q6g6cw+aBF7AS8CXSjmMYifCqd0mgHOWZCiTitR0R0Llksr8yWT+VNasXpdLalv46+rlzx
 NTCis2VhFS6QKIco=
X-Received: by 2002:a5d:5984:: with SMTP id n4mr27750282wri.23.1635873015290; 
 Tue, 02 Nov 2021 10:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2W66tFfyiDF+65PYWfaVjjbQg42cKoiuKxiz9n2v7pdkOFWhAZRfESPhnoXBuqcFdQeT6xA==
X-Received: by 2002:a5d:5984:: with SMTP id n4mr27750240wri.23.1635873015040; 
 Tue, 02 Nov 2021 10:10:15 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6810.dip0.t-ipconnect.de. [91.12.104.16])
 by smtp.gmail.com with ESMTPSA id
 w15sm8634967wrk.77.2021.11.02.10.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:10:14 -0700 (PDT)
Message-ID: <e4b63a74-57ad-551c-0046-97a02eb798e5@redhat.com>
Date: Tue, 2 Nov 2021 18:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
 <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
 <20211102111228-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211102111228-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.11.21 18:06, Michael S. Tsirkin wrote:
> On Tue, Nov 02, 2021 at 12:55:17PM +0100, David Hildenbrand wrote:
>> On 02.11.21 12:35, Michael S. Tsirkin wrote:
>>> On Tue, Nov 02, 2021 at 09:33:55AM +0100, David Hildenbrand wrote:
>>>> On 01.11.21 23:15, Michael S. Tsirkin wrote:
>>>>> On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
>>>>>> This is the follow-up of [1], dropping auto-detection and vhost-user
>>>>>> changes from the initial RFC.
>>>>>>
>>>>>> Based-on: 20211011175346.15499-1-david@redhat.com
>>>>>>
>>>>>> A virtio-mem device is represented by a single large RAM memory region
>>>>>> backed by a single large mmap.
>>>>>>
>>>>>> Right now, we map that complete memory region into guest physical addres
>>>>>> space, resulting in a very large memory mapping, KVM memory slot, ...
>>>>>> although only a small amount of memory might actually be exposed to the VM.
>>>>>>
>>>>>> For example, when starting a VM with a 1 TiB virtio-mem device that only
>>>>>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
>>>>>> in order to hotplug more memory later, we waste a lot of memory on metadata
>>>>>> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
>>>>>> optimizations in KVM are being worked on to reduce this metadata overhead
>>>>>> on x86-64 in some cases, it remains a problem with nested VMs and there are
>>>>>> other reasons why we would want to reduce the total memory slot to a
>>>>>> reasonable minimum.
>>>>>>
>>>>>> We want to:
>>>>>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
>>>>>>    inside QEMU KVM code where possible.
>>>>>> b) Not always expose all device-memory to the VM, to reduce the attack
>>>>>>    surface of malicious VMs without using userfaultfd.
>>>>>
>>>>> I'm confused by the mention of these security considerations,
>>>>> and I expect users will be just as confused.
>>>>
>>>> Malicious VMs wanting to consume more memory than desired is only
>>>> relevant when running untrusted VMs in some environments, and it can be
>>>> caught differently, for example, by carefully monitoring and limiting
>>>> the maximum memory consumption of a VM. We have the same issue already
>>>> when using virtio-balloon to logically unplug memory. For me, it's a
>>>> secondary concern ( optimizing a is much more important ).
>>>>
>>>> Some users showed interest in having QEMU disallow access to unplugged
>>>> memory, because coming up with a maximum memory consumption for a VM is
>>>> hard. This is one step into that direction without having to run with
>>>> uffd enabled all of the time.
>>>
>>> Sorry about missing the memo - is there a lot of overhead associated
>>> with uffd then?
>>
>> When used with huge/gigantic pages, we don't particularly care.
>>
>> For other memory backends, we'll have to route any population via the
>> uffd handler: guest accesses a 4k page -> place a 4k page from user
>> space. Instead of the kernel automatically placing a THP, we'd be
>> placing single 4k pages and have to hope the kernel will collapse them
>> into a THP later.
> 
> How much value there is in a THP given it's not present?

If you don't place a THP right during the first page fault inside the
THP region, you'll have to rely on khugepagd to eventually place a huge
page later -- and manually fault in each and every 4k page. I haven't
done any performance measurements so far. Going via userspace on every
4k fault will most certainly hurt performance when first touching memory.

-- 
Thanks,

David / dhildenb


