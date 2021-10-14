Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBBD42DA25
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:19:14 +0200 (CEST)
Received: from localhost ([::1]:44672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0dd-0000NZ-PP
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mb0cV-00084a-J2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:18:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mb0cM-0006zO-EB
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634217472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NM1i2J1rp8JeWkPr4/uwbyR3ctjMXN7223LR2qKUpY=;
 b=jOBc7kDMC3XONRCkXvLLok77PrQOPx0xr0POMbNdFRsPyW63NXLp0IaJG1woFKfDPvwTBW
 Wxv2puZ0LBUEkmHMfzvDjOTGv/CwaolzU1LRiPYspYoJEaBCq9/uchS4X+dbN4LgZdYZg/
 RCvcUIGYENzLesjw3pZMObox/AULeSY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-Wq4OQC2IO-udT0xiByQY2g-1; Thu, 14 Oct 2021 09:17:50 -0400
X-MC-Unique: Wq4OQC2IO-udT0xiByQY2g-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so4515599wrk.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=+NM1i2J1rp8JeWkPr4/uwbyR3ctjMXN7223LR2qKUpY=;
 b=GJNUFsZNBHZU8rpJXssekGo7TE/Bg6l0jWHV2clF8LOWcgIQqKRvsd/daClkBdYrRx
 ovmtUk0MZwDmGRB58hVjlCqyjcw88CUzSP5OoCXDm4aZb6uCOFAZNc8lE2tWUK915n54
 s5qJwVlnrinjfp+dmSBykryeq230HtTjE26IjQIz1u254uEKOCWwq9x7LToBRirclZYK
 QFqgP+dP2Tcuz1Rvlyojg06ORcqXlDfNu72EH8EU4TfXLJ0W3QV5xpK2UK3jY+N46/6D
 8gSGrB4npHSGestTZbjCKd9WjzDaFy0hQuPEYiy8SUWX1nU8qElAlHSdZoL0VyV2vw85
 7YAg==
X-Gm-Message-State: AOAM530jGOdyBvfX0A35f6NE7cuNXD4o6hetiBJWjfTXxus4s9PI1GLP
 UcAK3lP9kw6QwFocrlIyoZgf4a0OE4hCkaxphTelwyQ9AJ+/1XaTtD4xGvkpFZchXfkq7ospb0G
 bRpBVOGx5DZkif8I=
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr6666744wrh.131.1634217469623; 
 Thu, 14 Oct 2021 06:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2BfYIGMw79FwUmfGlEluL+KqUBa1b2ecvJGEpX5k+JnUg3VeJnT6NiIpjp/IKGNNy7P2dmg==
X-Received: by 2002:adf:bc4a:: with SMTP id a10mr6666700wrh.131.1634217469359; 
 Thu, 14 Oct 2021 06:17:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c694e.dip0.t-ipconnect.de. [91.12.105.78])
 by smtp.gmail.com with ESMTPSA id
 l2sm2353420wrw.42.2021.10.14.06.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 06:17:48 -0700 (PDT)
Message-ID: <83270a38-a179-b2c5-9bab-7dd614dc07d6@redhat.com>
Date: Thu, 14 Oct 2021 15:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
 <20211013103330.26869-13-david@redhat.com> <YWgYdWXsiI2mcfak@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 12/15] virtio-mem: Expose device memory via separate
 memslots
In-Reply-To: <YWgYdWXsiI2mcfak@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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

On 14.10.21 13:45, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> KVM nowadays supports a lot of memslots. We want to exploit that in
>> virtio-mem, exposing device memory via separate memslots to the guest
>> on demand, essentially reducing the total size of KVM slots
>> significantly (and thereby metadata in KVM and in QEMU for KVM memory
>> slots) especially when exposing initially only a small amount of memory
>> via a virtio-mem device to the guest, to hotplug more later. Further,
>> not always exposing the full device memory region to the guest reduces
>> the attack surface in many setups without requiring other mechanisms
>> like uffd for protection of unplugged memory.
>>
>> So split the original RAM region via memory region aliases into separate
>> chunks (ending up as individual memslots), and dynamically map the
>> required chunks (falling into the usable region) into the container.
>>
>> For now, we always map the memslots covered by the usable region. In the
>> future, with VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, we'll be able to map
>> memslots on actual demand and optimize further.
>>
>> Users can specify via the "max-memslots" property how much memslots the
>> virtio-mem device is allowed to use at max. "0" translates to "auto, no
>> limit" and is determinded automatically using a heuristic. When a maximum
>> (> 1) is specified, that auto-determined value is capped. The parameter
>> doesn't have to be migrated and can differ between source and destination.
>> The only reason the parameter exists is not make some corner case setups
>> (multiple large virtio-mem devices assigned to a single virtual NUMA node
>>  with only very limited available memslots, hotplug of vhost devices) work.
>> The parameter will be set to be "0" as default soon, whereby it will remain
>> to be "1" for compat machines.
>>
>> The properties "memslots" and "used-memslots" are read-only.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> I think you need to move this patch after the vhost-user patches so that
> you don't break a bisect including vhost-user.

As the default is set to 1 and is set to 0 ("auto") in the last patch in
this series, there should be (almost) no difference regarding vhost-user.

> 
> But I do worry about the effect on vhost-user:

The 4096 limit was certainly more "let's make it extreme so we raise
some eyebrows and we can talk about the implications". I'd be perfectly
happy with 256 or better 512. Anything that's bigger than 32 in case of
virtiofsd :)

>   a) What about external programs like dpdk?

At least initially virtio-mem won't apply to dpdk and similar workloads
(RT). For example, virtio-mem is incompatible with mlock. So I think the
most important use case to optimize for is virtio-mem+virtiofsd
(especially kata).

>   b) I worry if you end up with a LOT of slots you end up with a lot of
> mmap's and fd's in vhost-user; I'm not quite sure what all the effects
> of that will be.

At least for virtio-mem, there will be a small number of fd's, as many
memslots share the same fd, so with virtio-mem it's not an issue.

#VMAs is indeed worth discussing. Usually we can have up to 64k VMAs in
a process. The downside of having many is some reduce pagefault
performance. It really also depends on the target application. Maybe
there should be some libvhost-user toggle, where the application can opt
in to allow more?

-- 
Thanks,

David / dhildenb


