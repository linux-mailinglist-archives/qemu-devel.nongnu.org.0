Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E241D7E2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:36:35 +0200 (CEST)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVtQY-0006hc-9r
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVtNi-0004Xa-PW
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVtNg-0008HE-V2
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 06:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632998015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AP3kxnHqOf21JZkzTaXwpF00WCpGdtMgq70yaIr1v5E=;
 b=i0vWwgSXhZOKuivuiIMfz5bfQvr/f8iASphBsdhtBg3MlSQCrQw51DBz2B2E6h0nLsoWjx
 QMj69fbH5tj7LnNEHfkhup3B2jEhA8PCW6u5Yx3GFNPkujxyUiYt/zEpTlJlvG84WVdWct
 oQVaxQzFzx7Dw2LhPhNdsbZZ70m1QAg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580--OIzHxypMIuFOkWCsMzPag-1; Thu, 30 Sep 2021 06:33:32 -0400
X-MC-Unique: -OIzHxypMIuFOkWCsMzPag-1
Received: by mail-wr1-f71.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so1502833wrv.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 03:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AP3kxnHqOf21JZkzTaXwpF00WCpGdtMgq70yaIr1v5E=;
 b=WOZyn/SqmgzklYf7NWdpNKUtqo2zHWFk9tIVGhlHNH+UBcUbPG/5GyvdszNqOAKksS
 pomUQKQSysIHxyx/n1SRywQtpIxlhdJ0M2qtqRUA+8QBc6DEy/Xs0Tpm8d+qtYigu3Gj
 wv4j6kp2B4Mk7L09ilROvnVQsSCsHOxJSVHxy8qEzGRCaDOA5EbY1JEMH/FVDUUU0LG3
 2sOvFiJ4R3nhqGJ50AltG0LIKWS/gPpD9rQIU3poiqLMAD1Z0QNT7XE3iHetEhoWI/q4
 3yBzuRccsnycQbsZB9gY7ZIU1Xd/N89cBcKctiyiUfKQrTSR3Q8I4AzGSdO4vtupfBeQ
 5x+Q==
X-Gm-Message-State: AOAM532n4pVNqc3HVTR2IogPdIJyQoq5rRBiSO+y1iN6s3Sid9cuTc63
 QStVpcN008NDbMx/WlTk8pFLNXm1Ti5OavecQGSrqVWz/WeQwJBBVHJr6K9Z/zjCLuVLO1wIsEi
 3q7ZH3aV8v++4B6s=
X-Received: by 2002:adf:a29c:: with SMTP id s28mr2111022wra.259.1632998011560; 
 Thu, 30 Sep 2021 03:33:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ6WxfI2ySlUVUdjPQov+DT1xfRoZS388bYQf/kn68pvKydQlw4yiGP1PEqaD4eGZHhE+n0g==
X-Received: by 2002:adf:a29c:: with SMTP id s28mr2110997wra.259.1632998011328; 
 Thu, 30 Sep 2021 03:33:31 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64bb.dip0.t-ipconnect.de. [91.12.100.187])
 by smtp.gmail.com with ESMTPSA id c18sm2557785wmb.27.2021.09.30.03.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 03:33:30 -0700 (PDT)
To: "david.dai" <david.dai@montage-tech.com>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
Date: Thu, 30 Sep 2021 12:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210930094007.GA239054@tianmu-host-sw-01>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.09.21 11:40, david.dai wrote:
> On Wed, Sep 29, 2021 at 11:30:53AM +0200, David Hildenbrand (david@redhat.com) wrote:
>>
>> On 27.09.21 14:28, david.dai wrote:
>>> On Mon, Sep 27, 2021 at 11:07:43AM +0200, David Hildenbrand (david@redhat.com) wrote:
>>>>
>>>> CAUTION: This email originated from outside of the organization. Do not
>>>> click links or open attachments unless you recognize the sender and know the
>>>> content is safe.
>>>>
>>>>
>>>> On 27.09.21 10:27, Stefan Hajnoczi wrote:
>>>>> On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
>>>>>> Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
>>>>>> to VM, so driver in guest can apply host memory in fly without virtualization
>>>>>> management software's help, such as libvirt/manager. The attached memory is
>>>>
>>>> We do have virtio-mem to dynamically attach memory to a VM. It could be
>>>> extended by a mechanism for the VM to request more/less memory, that's
>>>> already a planned feature. But yeah, virito-mem memory is exposed as
>>>> ordinary system RAM, not only via a BAR to mostly be managed by user space
>>>> completely.
>>
>> There is a virtio-pmem spec proposal to expose the memory region via a PCI
>> BAR. We could do something similar for virtio-mem, however, we would have to
>> wire that new model up differently in QEMU (it's no longer a "memory device"
>> like a DIMM then).
>>
>>>>
>>>
>>> I wish virtio-mem can solve our problem, but it is a dynamic allocation mechanism
>>> for system RAM in virtualization. In heterogeneous computing environments, the
>>> attached memory usually comes from computing device, it should be managed separately.
>>> we doesn't hope Linux MM controls it.
>>
>> If that heterogeneous memory would have a dedicated node (which usually is
>> the case IIRC) , and you let it manage by the Linux kernel (dax/kmem), you
>> can bind the memory backend of virtio-mem to that special NUMA node. So all
>> memory managed by that virtio-mem device would come from that heterogeneous
>> memory.
>>
> 
> Yes, CXL type 2, 3 devices expose memory to host as a dedicated node, the node
> is marked as soft_reserved_memory, dax/kmem can take over the node to create a
> dax devcie. This dax device can be regarded as the memory backend of virtio-mem
> 
> I don't sure whether a dax device can be open by multiple VMs or host applications.

virito-mem currently relies on having a single sparse memory region 
(anon mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although 
we can share memory with other processes, sharing with other VMs is not 
intended. Instead of actually mmaping parts dynamically (which can be 
quite expensive), virtio-mem relies on punching holes into the backend 
and dynamically allocating memory/file blocks/... on access.

So the easy way to make it work is:

a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device 
memory getting managed by the buddy on a separate NUMA node.
b) (optional) allocate huge pages on that separate NUMA node.
c) Use ordinary memory-device-ram or memory-device-memfd (for huge 
pages), *bidning* the memory backend to that special NUMA node.

This will dynamically allocate memory from that special NUMA node, 
resulting in the virtio-mem device completely being backed by that 
device memory, being able to dynamically resize the memory allocation.


Exposing an actual devdax to the virtio-mem device, shared by multiple 
VMs isn't really what we want and won't work without major design 
changes. Also, I'm not so sure it's a very clean design: exposing memory 
belonging to other VMs to unrelated QEMU processes. This sounds like a 
serious security hole: if you managed to escalate to the QEMU process 
from inside the VM, you can access unrelated VM memory quite happily. 
You want an abstraction in-between, that makes sure each VM/QEMU process 
only sees private memory: for example, the buddy via dax/kmem.

-- 
Thanks,

David / dhildenb


