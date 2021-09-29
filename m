Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B142741C1B0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:36:42 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW13-00018X-FW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVVvc-0004VS-Jm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVVvY-0007dk-VZ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632907859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jwu2IOLdS1tVA3n9ciQkUO1Lxacv/Jn7MX0Q5TL3n9Y=;
 b=Vt1WAIIsvFk9ZLIA8T9yGXhlrQicixW0cD9l/VYhMGmkPjyU7KBm6lo0a93Y7DaXWDrdcZ
 kPvZpc0zBTjF7Jqn0fCPQoJJ2vw1EjAi4POU+jwzGpimcIOTe7903WmIJIHVZCQN5t8IyY
 qpc98CdEvLWIGpMlAC43etZXROastPE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-3RTRK8mbMaSsUVTUCMzuAA-1; Wed, 29 Sep 2021 05:30:56 -0400
X-MC-Unique: 3RTRK8mbMaSsUVTUCMzuAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 m1-20020a056000180100b0015e1ec30ac3so415470wrh.8
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Jwu2IOLdS1tVA3n9ciQkUO1Lxacv/Jn7MX0Q5TL3n9Y=;
 b=OhkKMbenReInIQKikt+GUg+PU4lj9fm3ar3OnxxXrBmPDYhyB2dFWCjhcRCo5pkTDv
 I54qw/zjhqIlVKVqFDoVxeROeJ+zLauErL+NlwFviSubZ0L7RFYVyc91cX15tirUrca8
 O5Q/63gbiIWq7scDMhm0R3XzN8LDMj1WutBzs7ouQdnwMxnQ89ulluSdKvWoP8nUVekM
 GDdyawJqYzRZbCYI5EM4zlWIaAnxnnoDypAlgvXqzUqXKPvm32Ej2Yl8jOYk81o8Ephr
 jOkdjgTz2+7P9PdjKtb3WBM86GjWsB75PqYSICyJXMIZ9bjwdhqjv2rjP6U0bRqTt3ta
 jtGA==
X-Gm-Message-State: AOAM532ni/Dl+vkQuaS1CUXiH0uasoaB8vkpjVmjHQU9Pr8OkQ+WgH/L
 /XHfQASRD4vCLieeFdp+wlezO/KD1LrUAqg3kUvgxq5eoHJ8hikerr7Stpa+kJzf71ImTXuFzwg
 nZtvA4RW7Z5dQR0w=
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr5615352wrt.267.1632907855371; 
 Wed, 29 Sep 2021 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk/rHaP70lkFBhezd5ns1iGvcfyXTCGgKwKhWsyM12iaOCv8eAgHxp8un5ihnFvRx6OnZINQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr5615313wrt.267.1632907855042; 
 Wed, 29 Sep 2021 02:30:55 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 w23sm1090934wmi.6.2021.09.29.02.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:30:54 -0700 (PDT)
To: "david.dai" <david.dai@montage-tech.com>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
Date: Wed, 29 Sep 2021 11:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927122848.GB144947@tianmu-host-sw-01>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27.09.21 14:28, david.dai wrote:
> On Mon, Sep 27, 2021 at 11:07:43AM +0200, David Hildenbrand (david@redhat.com) wrote:
>>
>> CAUTION: This email originated from outside of the organization. Do not
>> click links or open attachments unless you recognize the sender and know the
>> content is safe.
>>
>>
>> On 27.09.21 10:27, Stefan Hajnoczi wrote:
>>> On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
>>>> Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
>>>> to VM, so driver in guest can apply host memory in fly without virtualization
>>>> management software's help, such as libvirt/manager. The attached memory is
>>
>> We do have virtio-mem to dynamically attach memory to a VM. It could be
>> extended by a mechanism for the VM to request more/less memory, that's
>> already a planned feature. But yeah, virito-mem memory is exposed as
>> ordinary system RAM, not only via a BAR to mostly be managed by user space
>> completely.

There is a virtio-pmem spec proposal to expose the memory region via a 
PCI BAR. We could do something similar for virtio-mem, however, we would 
have to wire that new model up differently in QEMU (it's no longer a 
"memory device" like a DIMM then).

>>
> 
> I wish virtio-mem can solve our problem, but it is a dynamic allocation mechanism
> for system RAM in virtualization. In heterogeneous computing environments, the
> attached memory usually comes from computing device, it should be managed separately.
> we doesn't hope Linux MM controls it.

If that heterogeneous memory would have a dedicated node (which usually 
is the case IIRC) , and you let it manage by the Linux kernel 
(dax/kmem), you can bind the memory backend of virtio-mem to that 
special NUMA node. So all memory managed by that virtio-mem device would 
come from that heterogeneous memory.

You could then further use a separate NUMA node for that virtio-mem 
device inside the VM. But to the VM it would look like System memory 
with different performance characteristics. That would work fore some 
use cases I guess, but not sure for which not (I assume you can tell :) ).

We could even write an alternative virtio-mem mode, where device manage 
isn't exposed to the buddy but using some different way to user space.

>   
>>>> isolated from System RAM, it can be used in heterogeneous memory management for
>>>> virtualization. Multiple VMs dynamically share same computing device memory
>>>> without memory overcommit.
>>
>> This sounds a lot like MemExpand/MemLego ... am I right that this is the
>> original design? I recall that VMs share a memory region and dynamically
>> agree upon which part of the memory region a VM uses. I further recall that
>> there were malloc() hooks that would dynamically allocate such memory in
>> user space from the shared memory region.
>>
> 
> Thank you for telling me about Memexpand/MemLego, I have carefully read the paper.
> some ideas from it are same as this patch, such as software model and stack, but
> it may have a security risk that whole shared memory is visible to all VMs.

How will you make sure that not all shared memory can be accessed by the 
other VMs? IOW, emulate !shared memory on shared memory?

> -----------------------
>       application
> -----------------------
> memory management driver
> -----------------------
>       pci driver
> -----------------------
>     virtual pci device
> -----------------------
> 
>> I can see some use cases for it, although the shared memory design isn't
>> what you typically want in most VM environments.
>>
> 
> The original design for this patch is to share a computing device among multipile
> VMs. Each VM runs a computing application(for example, OpenCL application)
> Our computing device can support a few applications in parallel. In addition, it
> supports SVM(shared virtual memory) via IOMMU/ATS/PASID/PRI. Device exposes its
> memory to host vis PCIe bar or CXL.mem, host constructs memory pool to uniformly
> manage device memory, then attach device memory to VM via a virtual PCI device.

How exactly is that memory pool created/managed? Simply dax/kmem and 
handling it via the buddy in a special NUMA node.

> but we don't know how much memory should be assigned when creating VM, so we hope
> memory is attached to VM on-demand. driver in guest triggers memory attaching, but
> not outside virtualization management software. so the original requirements are:
> 1> The managed memory comes from device, it should be isolated from system RAM
> 2> The memory can be dynamically attached to VM in fly
> 3> The attached memory supports SVM and DMA operation with IOMMU
> 
> Thank you very much.

Thanks for the info. If virtio-mem is not applicable and cannot be 
modified for this use case, would it make sense to create a new virtio 
device type?


-- 
Thanks,

David / dhildenb


