Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBBF36D091
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 04:35:40 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lba39-0005D6-Rk
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 22:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZzm-0003me-GS
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbZzg-0005R5-KV
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 22:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619577123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acAmSzJ1O4o6SX09L1cdmnep9WmJ7HOkpBZMclBJwdw=;
 b=SawoFcMDNE4EkNdtDmTg1X85k43aQoOi13ZuKoQXT4Araa+5SjxB78NuEIyhj0dDpk6f5l
 r9+MTyesv4V91zjixPKzgS3YTrYy3UVP7+Ddb8IIojvLraeAjwvqBE/Zqj+mnOV98jo5wB
 JpBsqoC5xcD58hm8pembVbphyaLWw+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-q_58X0N3MUijp3UV_QEI5w-1; Tue, 27 Apr 2021 22:32:01 -0400
X-MC-Unique: q_58X0N3MUijp3UV_QEI5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D45C801F98;
 Wed, 28 Apr 2021 02:32:00 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-131.pek2.redhat.com
 [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6003060C05;
 Wed, 28 Apr 2021 02:31:54 +0000 (UTC)
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com> <YIfRAKDvfZyOWrEL@work-vm>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
Date: Wed, 28 Apr 2021 10:31:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIfRAKDvfZyOWrEL@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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


在 2021/4/27 下午4:53, Dr. David Alan Gilbert 写道:
> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>>
>> On 4/22/21 11:01 PM, Jason Wang wrote:
>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>> This is inspired by the discussion with Jason on below patchset.
>>>>
>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>>>
>>>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>>>
>>>> Initially, I was going to add new option to "info pci". However, as the
>>>> number of entries is not determined and the output of MSI-X table is much
>>>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>>>> adds interface for only HMP.
>>>>
>>>> The patch is tagged with RFC because I am looking for suggestions on:
>>>>
>>>> 1. Is it fine to add new "info msix <dev>" command?
>>>
>>> I wonder the reason for not simply reusing "info pci"?
>> The "info pci" will show PCI data for all devices and it does not accept any
>> argument to print for a specific device.
>>
>> In addition, the "info pci" relies on qmp_query_pci(), where this patch will not
>> implement the interface for QMP considering the number of MSI-X entries is not
>> determined.
>>
>> Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
>> will have about 600+ lines of output.
>  From an HMP perspective I'm happy, so:
>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> but since I don't know much about MSI I'd like to see Jason's reply.


I think we'd better have more information, e.g the device can optionally 
report how the MSI-X vector is used.

Virtio-pci could be the first user for this.


>
> Adding an optional option to 'info pci' to limit to one device would be easy
> though; that bit is probably easier than adding a new command.


One interesting point is that MSI could be extended for other bus, (e.g 
MMIO). So "info msi" should be better I guess.


> Figuring out the QMP representation of your entries might be harder -
> and if this is strictly for debug, probably not worth it?


I think so.

Thanks


>
> Dave
>
>
>> Dongli Zhang
>>
>>>
>>>> 2. Is there any issue with output format?
>>>
>>> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
>>>
>>>
>>>> 3. Is it fine to add only for HMP, but not QMP?
>>>
>>> I think so.
>>>
>>> Thanks
>>>
>>>
>>>> Thank you very much!
>>>>
>>>> Dongli Zhang
>>>>
>>>>
>>>>


