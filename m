Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9A5F4C6E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 01:09:02 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofr24-00051D-SV
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 19:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofqs9-00049v-0x
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofqs5-0000TR-8t
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664924320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAvJ7rKwF6tY1QiLG+5yCfxP2SOdTKElZJY/Xd3AAlE=;
 b=ZdPQ3DOOivhDjqiYBiNkTkWHPKMQWi0IoDDhCLeoqxymlVmlgMGa8WNbVrC4r7JrCBMtMk
 OUukMlzY2lzTc/Mw40HiymDIwhiCK1zkvfuTC6BKIYfYXLe0Rb9ZXo5xX0UZEXeSTkSSxR
 IrBdKJiZ/qeNdUXh9MRy7xyUOc2bhhs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-7eAn3-MoPqK1QsRXj4XOdA-1; Tue, 04 Oct 2022 18:58:34 -0400
X-MC-Unique: 7eAn3-MoPqK1QsRXj4XOdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E213800C46;
 Tue,  4 Oct 2022 22:58:34 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C57EF7AE5;
 Tue,  4 Oct 2022 22:58:30 +0000 (UTC)
Subject: Re: [PATCH v4 5/6] hw/arm/virt: Improve high memory region address
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-6-gshan@redhat.com> <87bkqroo5f.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e91f3a43-b5c0-7799-08a0-bc06307cee63@redhat.com>
Date: Wed, 5 Oct 2022 06:58:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87bkqroo5f.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Connie,

On 10/4/22 6:53 PM, Cornelia Huck wrote:
> On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:
> 
>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>> are floating on highest RAM address. However, they can be disabled
>> in several cases.
>>
>> (1) One specific high memory region is disabled by developer by
>>      toggling vms->highmem_{redists, ecam, mmio}.
>>
>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>      'virt-2.12' or ealier than it.
>>
>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>      on 32-bits system.
>>
>> (4) One specific high memory region is disabled when it breaks the
>>      PA space limit.
>>
>> The current implementation of virt_set_memmap() isn't comprehensive
>> because the space for one specific high memory region is always
>> reserved from the PA space for case (1), (2) and (3). In the code,
>> 'base' and 'vms->highest_gpa' are always increased for those three
>> cases. It's unnecessary since the assigned space of the disabled
>> high memory region won't be used afterwards.
>>
>> This improves the address assignment for those three high memory
>> region by skipping the address assignment for one specific high
>> memory region if it has been disabled in case (1), (2) and (3).
>> 'vms->high_compact' is false for now, meaning that we don't have
>> any behavior changes until it becomes configurable through property
>> 'compact-highmem' in next patch.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c         | 19 ++++++++++++-------
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 59de7b78b5..4164da49e9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1715,9 +1715,6 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>           region_base = ROUND_UP(base, extended_memmap[i].size);
>>           region_size = extended_memmap[i].size;
>>   
>> -        vms->memmap[i].base = region_base;
>> -        vms->memmap[i].size = region_size;
>> -
>>           /*
>>            * Check each device to see if they fit in the PA space,
>>            * moving highest_gpa as we go.
> 
> Maybe tweak this comment?
> 
> "Check each enabled device to see if they fit in the PA space,
> moving highest_gpa as we go. For compatibility, move highest_gpa
> for disabled fitting devices as well, if the compact layout has
> been disabled."
> 
> (Or would that be overkill?)
> 

It looks overkill to me since the code is simple and clear. However,
comments won't be harmful. I will integrate the proposed comment
in next respin.

Thanks,
Gavin




