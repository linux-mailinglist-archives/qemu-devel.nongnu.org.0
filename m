Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1254442DB0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:18:38 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhskP-0004OC-MW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhsNy-0003ps-Sa
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhsNv-0001Ep-RR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635854123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFshW3JLim2zFO9+vUC4D0dfCH/FT0qqDtGdoGlRVNk=;
 b=XyftZf7YZ/424KnOd+XdXfy1c8ZJHfyZxHLHkWJGNPbIzyUrvj2jK7sxuBOJGTsRecsfue
 3gIbGdaHJK3DjhYnBi5dwU7B5ySRPBv4dhsiwIiCdVBKPgWxmoMb7+eDcjYZ4cw4oiUqJY
 dHXa22a+BvHxCBkp/uDnkaMpx18ZaPA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-BfcEEHYSOZeBotq3n9vvRA-1; Tue, 02 Nov 2021 07:55:20 -0400
X-MC-Unique: BfcEEHYSOZeBotq3n9vvRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1011273wmc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=fFshW3JLim2zFO9+vUC4D0dfCH/FT0qqDtGdoGlRVNk=;
 b=jwYG+wKEE0vAPwFDhwFQLIqmIqv4b/b5GcQorawRnpjii0XtJJ3TT51sir5GpteNZK
 B4FaODkotpcHDSRfjewEYy65dpk+WSrnNl3T/cu7/jIUiMIzzPSOSLVBaiW7HUBbOpby
 /P0Fjnh7r2/foxXQfgPuG8AaogzykW0XJAuZIPgL2c9fHUxX2wbckpsQd1uCDXR1zNZP
 cEK/grKNHOfbLXflZ/2CYNEv1txvQsJzTqom58324y9N91QtisJ9p2Lf/F6mh9eAyH7s
 9+fVWuh5JI/i2ehkl3MyvsUAJQmzZNwqv9+7FD21t1gukYbG868cPuz7JMLNIZahEl2D
 q8Nw==
X-Gm-Message-State: AOAM532QM+byVCj5b28rG78ncWrN8caLOoJ73qVt1U0fV90ms8oHwYMV
 TT+nKjZdpTD+SgUrfnMUYF1T/aCxlA8Xjqp2KpKIoHpx7qSlU094r3uJ9o+cpZnJSw9ic4LABTf
 ZiEAojonnLdeFOEo=
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr43852287wrn.82.1635854119100; 
 Tue, 02 Nov 2021 04:55:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe7p+c9E/Dn4jS7oHad/sj2/GKi44Lr+SGhdT5gVBsStvYSoAer9B4vFXlfhkBnQwIjOvoKA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr43852238wrn.82.1635854118870; 
 Tue, 02 Nov 2021 04:55:18 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6810.dip0.t-ipconnect.de. [91.12.104.16])
 by smtp.gmail.com with ESMTPSA id
 l20sm2517148wmq.42.2021.11.02.04.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:55:18 -0700 (PDT)
Message-ID: <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
Date: Tue, 2 Nov 2021 12:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
In-Reply-To: <20211102072843-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 02.11.21 12:35, Michael S. Tsirkin wrote:
> On Tue, Nov 02, 2021 at 09:33:55AM +0100, David Hildenbrand wrote:
>> On 01.11.21 23:15, Michael S. Tsirkin wrote:
>>> On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
>>>> This is the follow-up of [1], dropping auto-detection and vhost-user
>>>> changes from the initial RFC.
>>>>
>>>> Based-on: 20211011175346.15499-1-david@redhat.com
>>>>
>>>> A virtio-mem device is represented by a single large RAM memory region
>>>> backed by a single large mmap.
>>>>
>>>> Right now, we map that complete memory region into guest physical addres
>>>> space, resulting in a very large memory mapping, KVM memory slot, ...
>>>> although only a small amount of memory might actually be exposed to the VM.
>>>>
>>>> For example, when starting a VM with a 1 TiB virtio-mem device that only
>>>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
>>>> in order to hotplug more memory later, we waste a lot of memory on metadata
>>>> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
>>>> optimizations in KVM are being worked on to reduce this metadata overhead
>>>> on x86-64 in some cases, it remains a problem with nested VMs and there are
>>>> other reasons why we would want to reduce the total memory slot to a
>>>> reasonable minimum.
>>>>
>>>> We want to:
>>>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
>>>>    inside QEMU KVM code where possible.
>>>> b) Not always expose all device-memory to the VM, to reduce the attack
>>>>    surface of malicious VMs without using userfaultfd.
>>>
>>> I'm confused by the mention of these security considerations,
>>> and I expect users will be just as confused.
>>
>> Malicious VMs wanting to consume more memory than desired is only
>> relevant when running untrusted VMs in some environments, and it can be
>> caught differently, for example, by carefully monitoring and limiting
>> the maximum memory consumption of a VM. We have the same issue already
>> when using virtio-balloon to logically unplug memory. For me, it's a
>> secondary concern ( optimizing a is much more important ).
>>
>> Some users showed interest in having QEMU disallow access to unplugged
>> memory, because coming up with a maximum memory consumption for a VM is
>> hard. This is one step into that direction without having to run with
>> uffd enabled all of the time.
> 
> Sorry about missing the memo - is there a lot of overhead associated
> with uffd then?

When used with huge/gigantic pages, we don't particularly care.

For other memory backends, we'll have to route any population via the
uffd handler: guest accesses a 4k page -> place a 4k page from user
space. Instead of the kernel automatically placing a THP, we'd be
placing single 4k pages and have to hope the kernel will collapse them
into a THP later.

khugepagd will only collapse into a THP if all affected page table
entries are present and don't map the zero page, though.

So we'll most certainly use less THP for our VM and VM startup time
("first memory access after plugging memory") can be slower.

I have prototypes for it, with some optimizations (e.g., on 4k guest
access, populate the whole THP area), but we might not want to enable it
all of the time. (interaction with postcopy has to be fixed, but it's
not a fundamental issue)


Extending uffd-based protection for virtio-mem to other processes
(vhost-user), is a bit more complicated, and I am not 100% sure if it's
worth the trouble for now. memslots provide at least some high-level
protection for the important case of having a virtio-mem device to
eventually hotplug a lot of memory later.

> 
>> ("security is somewhat the wrong word. we won't be able to steal any
>> information from the hypervisor.)
> 
> Right. Let's just spell it out.
> Further, removing memory still requires guest cooperation.

Right.


-- 
Thanks,

David / dhildenb


