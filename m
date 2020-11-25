Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C544A2C4552
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 17:35:29 +0100 (CET)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khxlQ-0001c8-TJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 11:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khxjr-0001CY-Hq
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khxjp-00021O-7i
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 11:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606322027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3U8pmaKt4lJ0TUmcRv7D+TlHvS6mr8h/y2dW8+PK5Y=;
 b=JD7l9yJ7ZUgoj3iEmPgayFXgJB/Ve59eZZfKqaBCyqkoGCp83R8uSyzgPFayWcko6DTqXM
 Ko8WAaUkPGeX3OGp+N1on6f7EC/0O5YS+m5Yo/pMDV/BYcttIMT9SFedfUh5wdq8kYKtK+
 lEzVoN8quQpuq0nR6NbhD4LO7LYL1Ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-LZvGJ_euOX2K_ZDtgAVraA-1; Wed, 25 Nov 2020 11:33:43 -0500
X-MC-Unique: LZvGJ_euOX2K_ZDtgAVraA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F08387504C;
 Wed, 25 Nov 2020 16:33:28 +0000 (UTC)
Received: from [10.36.112.131] (ovpn-112-131.ams2.redhat.com [10.36.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E872D19814;
 Wed, 25 Nov 2020 16:32:45 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
 <20201125145659.00004b3e@Huawei.com>
 <b83a1914-16ae-4f1a-318f-59920ecf17e2@redhat.com>
 <7c635948-b78c-c28f-f170-dc9291af4fac@redhat.com>
 <20201125161148.00005f6e@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2b69a10f-4c8b-d903-2980-5ac02b0b329b@redhat.com>
Date: Wed, 25 Nov 2020 17:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125161148.00005f6e@Huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.11.20 17:11, Jonathan Cameron wrote:
> On Wed, 25 Nov 2020 16:54:53 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>>>>>>
>>>>>> 64k guest on 4k host with 512MiB block size seems fine.
>>>>>>
>>>>>> If there are any places anyone thinks need particular poking I'd appreciate a hint :)    
>>>>>
>>>>> If things seem to work for now, that's great :) Thanks!
>>>>>  
>>>> Cool.  I'll run a few more comprehensive tests then send out the
>>>> trivial patch to enable the kernel option + v2 of the qemu support.  
>>>
>>> Perfect, thanks!  
>>
>> Oh, btw, I have no idea what the state of vfio-pci + QEMU on arm64 is.
>> In case it's supposed to work, you could give
>>
>> https://lkml.kernel.org/r/20201119153918.120976-1-david@redhat.com
>>
>> to see what we're missing.
> 
> vfio-pci works in general (and we use it a lot), so sure I'll give
> this a test run.

Cool.

In case you get it to run, please test with both "online_kernel" and
"online_movable" in the guest, and small boot memory (e.g., 2 GiB).

For example, on x86-64 I got my vfio-pci provided GPUs to consume
virtio-mem memory easily when starting with 2-4 GiB boot memory and
using "online_kernel". (I verified that when not creating the mappings,
IO errors can be observed and graphics are messed up).

-- 
Thanks,

David / dhildenb


