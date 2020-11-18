Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960062B818C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:16:12 +0100 (CET)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQ7v-0003eY-LS
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfQ6g-00039C-Nm
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:14:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfQ6c-0001S7-ID
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605716088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=furaEVSOXlGd6uV7czHlnimCYtDaARcqyU/MqSnrdh8=;
 b=guG8Sv8nZYnUOvsGYYh3xmdtHzeG/uCRbKPJ0XGsjNacdhSkUj0nP16z/fXWIaq25yesic
 FPUaI5eIm8tl+jkJBblDemcM9zddB+Yu8dDsAjGN0696kRsWRkBjL2utgp3e6fk0fz3La2
 aeZWOm0YG7hFFKDK0HqiD28wSGC4cLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-HM7khv5fPF2jmzTNcH83-Q-1; Wed, 18 Nov 2020 11:14:46 -0500
X-MC-Unique: HM7khv5fPF2jmzTNcH83-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99FDB10B9CA3;
 Wed, 18 Nov 2020 16:14:44 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF07960636;
 Wed, 18 Nov 2020 16:14:23 +0000 (UTC)
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
To: Peter Xu <peterx@redhat.com>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com> <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
 <20201118152311.GB29639@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
Date: Wed, 18 Nov 2020 17:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201118152311.GB29639@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 18.11.20 16:23, Peter Xu wrote:
> David,
> 
> On Wed, Nov 18, 2020 at 02:04:00PM +0100, David Hildenbrand wrote:
>> On 20.10.20 22:44, Peter Xu wrote:
>>> On Tue, Oct 20, 2020 at 10:01:12PM +0200, David Hildenbrand wrote:
>>>> Thanks ... but I have an AMD system. Will try to find out how to get
>>>> that running with AMD :)
>>>
>>> May still start with trying intel-iommu first. :) I think it should work for
>>> amd hosts too.
>>>
>>> Just another FYI - Wei is working on amd-iommu for vfio [1], but it's still
>>> during review.
>>>
>>> [1] https://lore.kernel.org/qemu-devel/20201002145907.1294353-1-wei.huang2@amd.com/
>>>
>>
>> I'm trying to get an iommu setup running (without virtio-mem!),
>> but it's a big mess.
>>
>> Essential parts of my QEMU cmdline are:
>>
>> sudo build/qemu-system-x86_64 \
>>      -accel kvm,kernel-irqchip=split \
>>      ...
>>       device pcie-pci-bridge,addr=1e.0,id=pci.1 \
>>      -device vfio-pci,host=0c:00.0,x-vga=on,bus=pci.1,addr=1.0,multifunction=on \
>>      -device vfio-pci,host=0c:00.1,bus=pci.1,addr=1.1 \
>>      -device intel-iommu,caching-mode=on,intremap=on \
> 
> The intel-iommu device needs to be created before the rest of devices.  I
> forgot the reason behind, should be related to how the device address spaces
> are created.  This rule should apply to all the rest of vIOMMUs, afaiu.
> 
> Libvirt guarantees that ordering when VT-d enabled, though when using qemu
> cmdline indeed that's hard to identify from the first glance... iirc we tried
> to fix this, but I forgot the details, it's just not trivial.
> 
> I noticed that this ordering constraint is also missing in the qemu wiki page
> of vt-d, so I updated there too, hopefully..
> 
> https://wiki.qemu.org/Features/VT-d#Command_Line_Example
> 

That did the trick! Thanks!!!

virtio-mem + vfio + iommu seems to work. More testing to be done.

However, malicious guests can play nasty tricks like

a) Unplugging plugged virtio-mem blocks while they are mapped via an
    IOMMU

1. Guest: map memory location X located on a virtio-mem device inside a
    plugged block into the IOMMU
    -> QEMU IOMMU notifier: create vfio DMA mapping
    -> VFIO pins memory of unplugged blocks (populating memory)
2. Guest: Request to unplug memory location X via virtio-mem device
    -> QEMU virtio-mem: discards the memory.
    -> VFIO still has the memory pinned

We consume more memory than intended. In case virtio-memory would get 
replugged and used, we would have an inconsistency. IOMMU device resets/ 
fix it (whereby all VFIO mappings are removed via the IOMMU notifier).


b) Mapping unplugged virtio-mem blocks via an IOMMU

1. Guest: map memory location X located on a virtio-mem device inside an
    unplugged block
    -> QEMU IOMMU notifier: create vfio DMA mapping
    -> VFIO pins memory of unplugged blocks (populating memory)

Memory that's supposed to be discarded now consumes memory. This is 
similar to a malicious guest simply writing to unplugged memory blocks 
(to be tackled with "protection of unplugged memory" in the future) - 
however memory will also get pinned.


To prohibit b) from happening, we would have to disallow creating the 
VFIO mapping (fairly easy).

To prohibit a), there would have to be some notification to IOMMU 
implementations to unmap/refresh whenever an IOMMU entry still points at 
memory that is getting discarded (and the VM is doing something it's not 
supposed to do).


>> As soon as I enable "intel_iommu=on" in my guest kernel, graphics
>> stop working (random mess on graphics output) and I get
>>    vfio-pci 0000:0c:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0023 address=0xff924000 flags=0x0000]
>> in the hypervisor, along with other nice messages.
>>
>> I can spot no vfio DMA mappings coming from an iommu, just as if the
>> guest wouldn't even try to setup the iommu.
>>
>> I tried with
>> 1. AMD Radeon RX Vega 56
>> 2. Nvidia GT220
>> resulting in similar issues.
>>
>> I also tried with "-device amd-iommu" with other issues
>> (guest won't even boot up). Are my graphics card missing some support or
>> is there a fundamental flaw in my setup?
> 
> I guess amd-iommu won't work if without Wei Huang's series applied.

Oh, okay - I spotted it in QEMU and thought this was already working :)

-- 
Thanks,

David / dhildenb


