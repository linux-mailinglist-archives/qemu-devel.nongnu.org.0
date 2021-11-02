Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF20442999
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:35:10 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpG9-0006ZF-HX
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhpF5-0005rp-1C
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhpF2-0007F0-JK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635842039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7fsGBnnhC8BQeylsaAgY7K2+bRY3MKBnbDUAo28LV0=;
 b=cRNKTpjUbDUrBTKmPg8GdSKia7bspo18WcuXmkvh4BiF6QTtjcQTMEymgzElROn0E50oUg
 xVzZ9dGYhM7JrC70/zp/FOROmwydv6xWYh/wpNSnqnphY+OHLOqsJ9N8C8Aunj3zqYPk7p
 lmwY+03uC1Bbbq4LV0RtT1lwSliVBQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-NhBAwt6ANdunx9JIKcteAg-1; Tue, 02 Nov 2021 04:33:58 -0400
X-MC-Unique: NhBAwt6ANdunx9JIKcteAg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso765084wme.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=q7fsGBnnhC8BQeylsaAgY7K2+bRY3MKBnbDUAo28LV0=;
 b=xqYH0LA+WVptPnP8vCXShxZ3VcQI5MER8InvH6V02hwtVketPdXUeYWzlmRgxYb9LD
 FRBJmGxaIdf7PP1x2Ljo4YqGCdmBHu73yEIf7L/2x/pnLOYuViSf7JBVwPwZdJv5uPUr
 eNlZsTd7oZ8o5RXaH5DCR9F044eEOeQsxp8GbpcLPqIcwpIwL/jFlhe0JRMYZsuwW5FQ
 tcbvDcT7bCZ3/IBQ1pTV3lkwITgTBR198UVPcYYh52/+ayV5iZzd2xJKtHEr2FvtmJj2
 WjpnyWiX9Ky9wkt3v5SrCf+kiR+NBT0rF8F6n2l2cWpplmGImBlZB692rV8kUD6JfZ+4
 oGzQ==
X-Gm-Message-State: AOAM5327BlTMG9foOrdMThqseMFuGS4ltmCLavV1A0ut9jZuiKeK28te
 HxETMiMe+aleWppz2bfYWFSBjVBACdXmA2uRrUtdjDVVcL6ZUgsQiRa+6QMt+nVUMGXiF0YxFXu
 HSYBsBZqoyHttyEo=
X-Received: by 2002:adf:e109:: with SMTP id t9mr12442510wrz.387.1635842037404; 
 Tue, 02 Nov 2021 01:33:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs2tnlyBrfSp//qVukaaX2gV3Nt62R9ZyF4w+gV8LdMIo4KHmR/ftwxaIaWeKCzGOnk9KbOA==
X-Received: by 2002:adf:e109:: with SMTP id t9mr12442485wrz.387.1635842037201; 
 Tue, 02 Nov 2021 01:33:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6810.dip0.t-ipconnect.de. [91.12.104.16])
 by smtp.gmail.com with ESMTPSA id
 z8sm10432494wrh.54.2021.11.02.01.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:33:56 -0700 (PDT)
Message-ID: <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
Date: Tue, 2 Nov 2021 09:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
In-Reply-To: <20211101181352-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.11.21 23:15, Michael S. Tsirkin wrote:
> On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
>> This is the follow-up of [1], dropping auto-detection and vhost-user
>> changes from the initial RFC.
>>
>> Based-on: 20211011175346.15499-1-david@redhat.com
>>
>> A virtio-mem device is represented by a single large RAM memory region
>> backed by a single large mmap.
>>
>> Right now, we map that complete memory region into guest physical addres
>> space, resulting in a very large memory mapping, KVM memory slot, ...
>> although only a small amount of memory might actually be exposed to the VM.
>>
>> For example, when starting a VM with a 1 TiB virtio-mem device that only
>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
>> in order to hotplug more memory later, we waste a lot of memory on metadata
>> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
>> optimizations in KVM are being worked on to reduce this metadata overhead
>> on x86-64 in some cases, it remains a problem with nested VMs and there are
>> other reasons why we would want to reduce the total memory slot to a
>> reasonable minimum.
>>
>> We want to:
>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
>>    inside QEMU KVM code where possible.
>> b) Not always expose all device-memory to the VM, to reduce the attack
>>    surface of malicious VMs without using userfaultfd.
> 
> I'm confused by the mention of these security considerations,
> and I expect users will be just as confused.

Malicious VMs wanting to consume more memory than desired is only
relevant when running untrusted VMs in some environments, and it can be
caught differently, for example, by carefully monitoring and limiting
the maximum memory consumption of a VM. We have the same issue already
when using virtio-balloon to logically unplug memory. For me, it's a
secondary concern ( optimizing a is much more important ).

Some users showed interest in having QEMU disallow access to unplugged
memory, because coming up with a maximum memory consumption for a VM is
hard. This is one step into that direction without having to run with
uffd enabled all of the time.

("security is somewhat the wrong word. we won't be able to steal any
information from the hypervisor.)


> So let's say user wants to not be exposed. What value for
> the option should be used? What if a lower option is used?
> Is there still some security advantage?

My recommendation will be to use 1 memslot per gigabyte as default if
possible in the configuration. If we have a virtio-mem devices with a
maximum size of 128 GiB, the suggestion will be to use memslots=128.
Some setups will require less (e.g., vhost-user until adjusted, old
KVM), some setups can allow for more. I assume that most users will
later set "memslots=0", to enable auto-detection mode.


Assume we have a virtio-mem device with a maximum size of 1 TiB and we
hotplugged 1 GiB to the VM. With "memslots=1", the malicious VM could
actually access the whole 1 TiB. With "memslots=1024", the malicious VM
could only access additional ~ 1 GiB. With "memslots=512", ~ 2 GiB.
That's the reduced attack surface.

Of course, it's different after we hotunplugged memory, before we have
VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE support in QEMU, because all memory
inside the usable region has to be accessible and we cannot "unplug" the
memslots.


Note: With upcoming VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE changes in QEMU,
one will be able to disallow any access for malicious VMs by setting the
memblock size just as big as the device block size.

So with a 128 GiB virtio-mem device with memslots=128,block-size=1G, or
with memslots=1024,block-size=128M we could make it impossible for a
malicious VM to consume more memory than intended. But we lose
flexibility due to the block size and the limited number of available
memslots.

But again, for "full protection against malicious VMs" I consider
userfaultfd protection more flexible. This approach here gives some
advantage, especially when having large virtio-mem devices that start
out small.

-- 
Thanks,

David / dhildenb


