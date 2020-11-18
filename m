Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6972B8332
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:41:52 +0100 (CET)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRSo-0005Xw-LC
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfRPK-00034M-5J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfRPF-0004ZP-P4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605721086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kv17k17HOjmTW8d236HGR9As9kNj2WtUcr2lb5UuEs=;
 b=iANB4bMmCJ/mW7QtvVHhs9B4nhv4S6WPi1Dbe1VuNQP+bl3+awRVcG3JB4d4WaPheNvd9O
 Zfmv6nS4Fj3NDMx/W0oOTFOfSjiQOwVlI5gHak6V1xF6pnHn67gpbZoDujzVpiceFBNEzF
 Mr1WvCupqf6b5Xg/cjkflzm+mqxQ/p4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ZIXfYgtOM-GkBE1p03VrgQ-1; Wed, 18 Nov 2020 12:38:03 -0500
X-MC-Unique: ZIXfYgtOM-GkBE1p03VrgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 202F5805F15;
 Wed, 18 Nov 2020 17:38:02 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6127510016F8;
 Wed, 18 Nov 2020 17:37:43 +0000 (UTC)
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
To: Peter Xu <peterx@redhat.com>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com> <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
 <20201118152311.GB29639@xz-x1>
 <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
 <20201118170143.GC29639@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <1f1602db-748a-4e9d-dfde-950b573592fb@redhat.com>
Date: Wed, 18 Nov 2020 18:37:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201118170143.GC29639@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Le Tan <tamlokveer@gmail.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, wei.huang2@amd.com,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> virtio-mem + vfio + iommu seems to work. More testing to be done.
>>
>> However, malicious guests can play nasty tricks like
>>
>> a) Unplugging plugged virtio-mem blocks while they are mapped via an
>>     IOMMU
>>
>> 1. Guest: map memory location X located on a virtio-mem device inside a
>>     plugged block into the IOMMU
>>     -> QEMU IOMMU notifier: create vfio DMA mapping
>>     -> VFIO pins memory of unplugged blocks (populating memory)
>> 2. Guest: Request to unplug memory location X via virtio-mem device
>>     -> QEMU virtio-mem: discards the memory.
>>     -> VFIO still has the memory pinned
> 
> When unplug some memory, does the user need to first do something to notify the
> guest kernel that "this memory is going to be unplugged soon" (assuming echo
> "offline" to some dev file)?  Then the kernel should be responsible to prepare
> for that before it really happens, e.g., migrate anonymous pages out from this
> memory block.  I don't know what would happen if some pages on the memblock
> were used for DMA like this and we want to unplug it.  Ideally I thought it
> should fail the "echo offline" operation with something like EBUSY if it can't
> notify the device driver about this, or it's hard to.

In the very simple case (without resizable RAMBlocks/allocations.memory 
regions) as implemented right now, a virtio-mem device really just 
consists of a static RAM memory region that's mapped into guest physical 
address space. The size of that region corresponds to the "maximum" size 
a virtio-mem device can provide.

How much memory the VM should consume via such a device is expressed via 
a "requested size". So for the hypervisor requests the VM to consume 
less/more memory, it adjusts the "requested size".

It is up to the device driver in the guest to plug/unplug memory blocks 
(e.g., 4 MiB granularity), in order to reach the requested size. The 
device driver selects memory blocks within the device-assigned memory 
region and requests the hypervisor to (un)plug them - think of it as 
something similar (but different) to memory ballooning.

When requested to unplug memory by the hypervisor, the device driver in 
Linux will try to find memory blocks (e.g., 4 MiB) within the 
device-assigned memory region it can free up. This involves migrating 
pages away etc. Once that succeeded - nobody in the guest is using that 
memory anymore; the guest requests the hypervisor to unplug that block, 
resulting in QEMU discarding the memory. The guest agreed to not touch 
that memory anymore before officially requesting to "plug" it via the 
virtio-mem device.

There is no further action inside the guest required. A sane guest will 
never request to unplug memory that is still in use (similar to memory 
ballooning, where we don't inflate memory that is still in use).

But of course, a malicious guest could try doing that just to cause 
trouble.

> 
> IMHO this question not really related to vIOMMU, but a general question for
> unplugging. Say, what would happen if we unplug some memory with DMA buffers
> without vIOMMU at all?  The buffer will be invalid right after unplugging, so
> the guest kernel should either fail the operation trying to unplug, or at least
> tell the device drivers about this somehow?

A sane guest will never do that. The way memory is removed from Linux 
makes sure that there are no remaining users, otherwise it would be a BUG.

> 
>>
>> We consume more memory than intended. In case virtio-memory would get
>> replugged and used, we would have an inconsistency. IOMMU device resets/ fix
>> it (whereby all VFIO mappings are removed via the IOMMU notifier).
>>
>>
>> b) Mapping unplugged virtio-mem blocks via an IOMMU
>>
>> 1. Guest: map memory location X located on a virtio-mem device inside an
>>     unplugged block
>>     -> QEMU IOMMU notifier: create vfio DMA mapping
>>     -> VFIO pins memory of unplugged blocks (populating memory)
> 
> For this case, I would expect vfio_get_xlat_addr() to fail directly if the
> guest driver force to map some IOVA onto an invalid range of the virtio-mem
> device.  Even before that, since the guest should know that this region of
> virtio-mem is not valid since unplugged, so shouldn't the guest kernel directly
> fail the dma_map() upon such a region even before the mapping message reaching
> QEMU?

Again, sane guests will never do that, for the very reason you mentioned 
"the guest should know that this region of virtio-mem is not valid since 
unplugged,". But a malicious guest could try doing that to cause trouble :)

The memory region managed by a virtio-mem device is always fully mapped 
into the system address space: one reason being, that fragmenting it in 
2 MiB granularity or similar would not be feasible (e.g., KVM memory 
slots limit, migration, ...), but there are other reasons. (Again, 
similar to how memory ballooning works).

vfio_get_xlat_addr() only checks if that mapping exists. It would be 
easy to ask the virtio-mem device (similar as done in this prototype) if 
that part of the identified memory region may be mapped by VFIO right now.

-- 
Thanks,

David / dhildenb


