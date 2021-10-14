Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D105C42D32B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:03:56 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maumR-0003le-FJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maukj-0002OQ-2h
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mauke-0003qV-T3
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634194923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nV+9cAXFAaAUf9+EligMbnXZds0iT1HILQQ/LHkCQ8M=;
 b=OqE5a553O0PqCr56bdkCpQoQAmvIhYdOwHhX8piVT0bsu/7pnlc7DsCP6wgh+D8Z8wAAC5
 xaJV3atir9vuWuXE08Z4VFY7Mgx5wQRdydTBkJ9+LUkFSTgmtXiPV2AsZYBb0hJ/MTIbOn
 2jYxBRZPhKvAC8h9jINFUAhL9DdzfW8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-lg1k_qoQPxKo83hGuLVqAg-1; Thu, 14 Oct 2021 03:02:02 -0400
X-MC-Unique: lg1k_qoQPxKo83hGuLVqAg-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso3811348wrb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 00:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=nV+9cAXFAaAUf9+EligMbnXZds0iT1HILQQ/LHkCQ8M=;
 b=ATJ1tutNH/ZxNTnbMRvbD+Hy47EQz5bphV7YELT2Ni3sj0koXK0nhJg6eQTuM7sNPe
 BNR5lIdTeJL9yqRORNiQl+XfWykb996Ronmo/zYnNfQ36jg+pKEmx4V1gjlL7Qd4on9K
 6SI1L1in191b9C/s5CzthOiZLY8Zj3X8Zueknb9XbhBg1Fy2laFAYhaW8G8+N0uaPeqT
 7rGtauTwwVutXJ95EQzwxsje93UG9alajpie2vDYfM6YddeDYUN/5QzCg0rw1Gl38PSr
 vnOpqVm5Vy9rC8XGSnXU/cqq7EfSyBe5M1jPUrZVKcLcGu4QZz7bbalIdRq7Rxg60fZQ
 8lhg==
X-Gm-Message-State: AOAM533Pc1Q1ofcnm51CFEoZSfXpo3MS2gnONmLfzaz/Sxmcz1K4ryd3
 QPUiYL8HI4mASHNDTGsb70zZ2E3TEMJuXMdLCukRfIovc//J7vTK7OH4EoeDxe60gKoRj/uVXmo
 SSvtduNjiAegneNs=
X-Received: by 2002:adf:a4d5:: with SMTP id h21mr4513645wrb.203.1634194920811; 
 Thu, 14 Oct 2021 00:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDx2I3U4zxq/63r7oAUEGjcUmSrHpTlks2tcl8ZftOIzFaiE3I9j4MrrbpibabmH0jBI2hHw==
X-Received: by 2002:adf:a4d5:: with SMTP id h21mr4513615wrb.203.1634194920578; 
 Thu, 14 Oct 2021 00:02:00 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c694e.dip0.t-ipconnect.de. [91.12.105.78])
 by smtp.gmail.com with ESMTPSA id
 q7sm1609405wrs.73.2021.10.14.00.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 00:02:00 -0700 (PDT)
Message-ID: <f63fc766-a044-7978-df40-27dff8f79bf5@redhat.com>
Date: Thu, 14 Oct 2021 09:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
 <YWcthytjDJUXdN0w@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 00/15] virtio-mem: Expose device memory via separate
 memslots
In-Reply-To: <YWcthytjDJUXdN0w@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 21:03, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
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
>>
>> So instead, expose the RAM memory region not by a single large mapping
>> (consuming one memslot) but instead by multiple mappings, each consuming
>> one memslot. To do that, we divide the RAM memory region via aliases into
>> separate parts and only map the aliases into a device container we actually
>> need. We have to make sure that QEMU won't silently merge the memory
>> sections corresponding to the aliases (and thereby also memslots),
>> otherwise we lose atomic updates with KVM and vhost-user, which we deeply
>> care about when adding/removing memory. Further, to get memslot accounting
>> right, such merging is better avoided.
>>
>> Within the memslots, virtio-mem can (un)plug memory in smaller granularity
>> dynamically. So memslots are a pure optimization to tackle a) and b) above.
>>
>> Memslots are right now mapped once they fall into the usable device region
>> (which grows/shrinks on demand right now either when requesting to
>>  hotplug more memory or during/after reboots). In the future, with
>> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, we'll be able to (un)map aliases even
>> more dynamically when (un)plugging device blocks.
>>
>>
>> Adding a 500GiB virtio-mem device and not hotplugging any memory results in:
>>     0000000140000000-000001047fffffff (prio 0, i/o): device-memory
>>       0000000140000000-0000007e3fffffff (prio 0, i/o): virtio-mem-memslots
>>
>> Requesting the VM to consume 2 GiB results in (note: the usable region size
>> is bigger than 2 GiB, so 3 * 1 GiB memslots are required):
>>     0000000140000000-000001047fffffff (prio 0, i/o): device-memory
>>       0000000140000000-0000007e3fffffff (prio 0, i/o): virtio-mem-memslots
>>         0000000140000000-000000017fffffff (prio 0, ram): alias virtio-mem-memslot-0 @mem0 0000000000000000-000000003fffffff
>>         0000000180000000-00000001bfffffff (prio 0, ram): alias virtio-mem-memslot-1 @mem0 0000000040000000-000000007fffffff
>>         00000001c0000000-00000001ffffffff (prio 0, ram): alias virtio-mem-memslot-2 @mem0 0000000080000000-00000000bfffffff
> 
> I've got a vague memory that there were some devices that didn't like
> doing split IO across a memory region (or something) - some virtio
> devices?  Do you know if that's still true and if that causes a problem?

Interesting point! I am not aware of any such issues, and I'd be
surprised if we'd still have such buggy devices, because the layout
virtio-mem now creates is just very similar to the layout we'll
automatically create with ordinary DIMMs.

If we hotplug DIMMs they will end up consecutive in guest physical
address space, however, having separate memory regions and requiring
separate memory slots. So, very similar to a virtio-mem device now.

Maybe the catch is that it's hard to cross memory regions that are e.g.,
>- 128 MiB aligned, because ordinary allocations (e.g., via the buddy in
Linux which supports <= 4 MiB pages) in won't cross these blocks.

-- 
Thanks,

David / dhildenb


