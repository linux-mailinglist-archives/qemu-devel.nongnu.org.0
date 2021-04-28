Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A992436D1D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 07:57:15 +0200 (CEST)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdCE-0003xF-ED
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 01:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbdB8-0003WN-LF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbdB4-00073Q-Iu
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619589358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AR3jHJ/sExRco1cYv+OP7+KalJq3WrRTcrLTTSrVjQ=;
 b=ZU4ZoumYZrWfLri6WoUYdJwdT3Z28ZwKW8/JHnU32NcDh+xHlO8SKT9xCrnxV760HE5MdC
 hmgfk7/+AQIedNSFFxjRAF+WQnmvzVXuFqlL8AiOZM5fu3O3xUVwjgUUfE4QHrOhYlBXV6
 SGMdNeJlKTeKHBtYKlJfv3mB0cx+yOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-uRQfMTCgPJGjdv59EW6uVw-1; Wed, 28 Apr 2021 01:55:55 -0400
X-MC-Unique: uRQfMTCgPJGjdv59EW6uVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01E3803622;
 Wed, 28 Apr 2021 05:55:54 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-59.pek2.redhat.com
 [10.72.13.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 945E560CC6;
 Wed, 28 Apr 2021 05:55:48 +0000 (UTC)
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: Dongli Zhang <dongli.zhang@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com> <YIfRAKDvfZyOWrEL@work-vm>
 <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
 <3e4cfcf2-c4b9-028a-4d06-22b1e9a23455@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <279945e6-4bd0-2157-1973-6e44ce97b359@redhat.com>
Date: Wed, 28 Apr 2021 13:55:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3e4cfcf2-c4b9-028a-4d06-22b1e9a23455@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/28 下午1:10, Dongli Zhang 写道:
> Hi Jason,
>
> On 4/27/21 7:31 PM, Jason Wang wrote:
>> 在 2021/4/27 下午4:53, Dr. David Alan Gilbert 写道:
>>> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>>>> On 4/22/21 11:01 PM, Jason Wang wrote:
>>>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>>>> This is inspired by the discussion with Jason on below patchset.
>>>>>>
>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>>>>>
>>>>>>
>>>>>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>>>>>
>>>>>> Initially, I was going to add new option to "info pci". However, as the
>>>>>> number of entries is not determined and the output of MSI-X table is much
>>>>>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>>>>>> adds interface for only HMP.
>>>>>>
>>>>>> The patch is tagged with RFC because I am looking for suggestions on:
>>>>>>
>>>>>> 1. Is it fine to add new "info msix <dev>" command?
>>>>> I wonder the reason for not simply reusing "info pci"?
>>>> The "info pci" will show PCI data for all devices and it does not accept any
>>>> argument to print for a specific device.
>>>>
>>>> In addition, the "info pci" relies on qmp_query_pci(), where this patch will not
>>>> implement the interface for QMP considering the number of MSI-X entries is not
>>>> determined.
>>>>
>>>> Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
>>>> will have about 600+ lines of output.
>>>   From an HMP perspective I'm happy, so:
>>>
>>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>
>>> but since I don't know much about MSI I'd like to see Jason's reply.
>>
>> I think we'd better have more information, e.g the device can optionally report
>> how the MSI-X vector is used.
>>
>> Virtio-pci could be the first user for this.
> As discussed in another thread, you were talking about to print MSIMessage.
>
> However, I prefer to print the raw data as I think the user of this interface
> should be able to understand it as MSI-X messages.
>
> For instance, below is the data printed by "info msix".


Just to clarify, I meant e.g for virtio-pci device, we can let it to 
print the mapping between vq and msix vectors:

vq[0].msix_vector = 0
vq[1].msix_vector = 1
config.msix_vector = 2
...

But this could be added on top if you wish.

Does this make sense?

Thanks


>
> 0xfee01004 0x00000000 0x00000022 0x00000000
> 0xfee02004 0x00000000 0x00000023 0x00000000
> 0xfee01004 0x00000000 0x00000023 0x00000000
> 0xfee01004 0x00000000 0x00000021 0x00000000
> 0xfee02004 0x00000000 0x00000022 0x00000000
> 0x00000000 0x00000000 0x00000000 0x00000001
> 0x00000000 0x00000000 0x00000000 0x00000001
>
> The 1st column is Message Lower Address.
>
> The 2nd column is Message Upper Address.
>
> The 3rd column is Message Data.
>
> The 4th column is Vector Control.
>
> In my opinion, this is equivalent to MSIMessage.
>
> 26 struct MSIMessage {
> 27     uint64_t address; --> column 1 and 2
> 28     uint32_t data;    --> column 3
> 29 };
>
>
> We use the similar way to read from Linux OS, e,g., given the address of MSI-X
> cap, here is how we read from OS side.
>
> # busybox devmem 0xc1001000 32
> 0xFEE00000
> # busybox devmem 0xc1001004 32
> 0x00000000
> # busybox devmem 0xc1001008 32
> 0x00004049
> # busybox devmem 0xc100100c 32
> 0x00000000
>
> Thank you very much!
>
> Dongli Zhang
>
>>
>>> Adding an optional option to 'info pci' to limit to one device would be easy
>>> though; that bit is probably easier than adding a new command.
>>
>> One interesting point is that MSI could be extended for other bus, (e.g MMIO).
>> So "info msi" should be better I guess.
>>
>>
>>> Figuring out the QMP representation of your entries might be harder -
>>> and if this is strictly for debug, probably not worth it?
>>
>> I think so.
>>
>> Thanks
>>
>>
>>> Dave
>>>
>>>
>>>> Dongli Zhang
>>>>
>>>>>> 2. Is there any issue with output format?
>>>>> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
>>>>>
>>>>>
>>>>>> 3. Is it fine to add only for HMP, but not QMP?
>>>>> I think so.
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> Thank you very much!
>>>>>>
>>>>>> Dongli Zhang
>>>>>>
>>>>>>
>>>>>>


