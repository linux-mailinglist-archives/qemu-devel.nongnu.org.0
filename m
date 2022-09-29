Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBC5EF4EA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:03:14 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsFw-0000nX-Fw
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odrc1-0001MF-NY
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1odrbw-0005Xj-1E
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664450506;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJY+4NFs7t1pwwKxiIudV6168j+zy9Sc9KmxI3nJF4A=;
 b=NExBNEdeCU91i9FrTN0Eye5bkT/g3SGyGJj6kYHA8N3WPLPKC3+ZUnzTEntPZwmCivAvmf
 NxRCB3DqxcTAjWYlneshozkTzmGDk6GracdI08yqYXTdHT/gonkaTIRpHZyibcyFeLsJ4i
 IgmqpGaWfESvfJVucscLXok4FQyzX+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-3u83Xd_TOcaou1gDbXyqyg-1; Thu, 29 Sep 2022 07:21:43 -0400
X-MC-Unique: 3u83Xd_TOcaou1gDbXyqyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06F5D803D50;
 Thu, 29 Sep 2022 11:21:43 +0000 (UTC)
Received: from [10.64.54.143] (vpn2-54-143.bne.redhat.com [10.64.54.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2C22084836;
 Thu, 29 Sep 2022 11:21:38 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] hw/arm/virt: Add 'highmem-compact' property
To: Cornelia Huck <cohuck@redhat.com>, eric.auger@redhat.com,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-6-gshan@redhat.com>
 <2e8ace49-b900-de7e-2d81-7bb6c081146e@redhat.com>
 <7656c827-58ce-85c2-87fe-e88206d6f022@redhat.com> <87bkqyeaqw.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <81d12199-16e5-ce03-d146-0905ca8f7f37@redhat.com>
Date: Thu, 29 Sep 2022 21:21:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87bkqyeaqw.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cornelia,

On 9/29/22 8:27 PM, Cornelia Huck wrote:
> On Thu, Sep 29 2022, Gavin Shan <gshan@redhat.com> wrote:
>> On 9/28/22 10:22 PM, Eric Auger wrote:
>>> On 9/22/22 01:13, Gavin Shan wrote:
>>>> After the improvement to high memory region address assignment is
>>>> applied, the memory layout is changed. For example, VIRT_HIGH_PCIE_MMIO
>>> s/the memory layout is changed./the memory layout is changed,
>>> introducing possible migration breakage.
>>
>> Ok, much clearer.
>>
>>>> memory region is enabled when the improvement is applied, but it's
>>>> disabled if the improvement isn't applied.
>>>>
>>>>       pa_bits              = 40;
>>>>       vms->highmem_redists = false;
>>>>       vms->highmem_ecam    = false;
>>>>       vms->highmem_mmio    = true;
>>>>
>>>>       # qemu-system-aarch64 -accel kvm -cpu host \
>>>>         -machine virt-7.2 -m 4G,maxmem=511G      \
>>>>         -monitor stdio
>>>>
>>>> In order to keep backwords compatibility, we need to disable the
>>>> optimization on machines, which is virt-7.1 or ealier than it. It
>>>> means the optimization is enabled by default from virt-7.2. Besides,
>>>> 'highmem-compact' property is added so that the optimization can be
>>> I would rather rename the property into compact-highmem even if the vms
>>> field is name highmem_compact to align with other highmem fields
>>
>> Ok, but I would love to know why. Note that we already have
>> 'highmem=on|off'. 'highmem_compact=on|off' seems consistent
>> to me.
> 
> FWIW, I initially misread 'highmem_compact' as 'highmem_compat' (and had
> to re-read because I got confused). At least to me, 'compact_highmem'
> has less chance of being parsed incorrectly :) (although that is
> probably a personal thing.)
> 

Ok. 'compact-highmem' is also fine to me. I'm really bad at naming :)

>>
>>>> explicitly enabled or disabled on all machine types by users.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    docs/system/arm/virt.rst |  4 ++++
>>>>    hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
>>>>    include/hw/arm/virt.h    |  2 ++
>>>>    3 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>>> index 20442ea2c1..f05ec2253b 100644
>>>> --- a/docs/system/arm/virt.rst
>>>> +++ b/docs/system/arm/virt.rst
>>>> @@ -94,6 +94,10 @@ highmem
>>>>      address space above 32 bits. The default is ``on`` for machine types
>>>>      later than ``virt-2.12``.
>>>>    
>>>> +highmem-compact
>>>> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.
>>>> +  The default is ``on`` for machine types later than ``virt-7.2``
>>> I think you should document what is compact layout versus legacy one,
>>> both in the commit msg and maybe as a comment in a code along with the
>>> comment in hw/arm/virt.c starting with 'Highmem IO Regions: '
>>
>> Ok, I will add this into the commit log in v4. I don't think it's necessary
>> to add duplicate comment in the code. People can check the commit log for
>> details if needed.
> 
> Rather explain it in this file here, maybe? I'd prefer to be able to
> find out what 'compact' means without digging through the commit log.
> 

Ok, lets do as Eric suggested. There are existing comments about
@extended_memmap[] in hw/arm/virt.c. We need to explain the legacy/modern
laoyout and 'compact-highmem' property there.

Thanks,
Gavin


