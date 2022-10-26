Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5E60DEFB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 12:45:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ondsg-0005ys-EE; Wed, 26 Oct 2022 06:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ondsd-0005cA-BK
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ondsa-0001lb-Bw
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 06:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666781003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9k+8cBp1fQl2hHOg7uTHp11xM0wx0S9pwXlPKgCUs9o=;
 b=bUvr2XXaa2hXHmehjbieed9WIJfYW4v/JmvhsvVouVXRo20n/LhoRJrDoN7tZd8w0Bmqqi
 U7jFWs6mOedLJGVUUGcCscikpl3p7f9Y5GWOTea/Mnf9BDCjureWtWF7i5imYbSTgjVlz7
 Mx33QWhXjRLJISsAPtt184K/j0CCNVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-yfsVrXbxMgiRfmIpwPhJ9Q-1; Wed, 26 Oct 2022 06:43:17 -0400
X-MC-Unique: yfsVrXbxMgiRfmIpwPhJ9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48739811E84;
 Wed, 26 Oct 2022 10:43:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC3E1415117;
 Wed, 26 Oct 2022 10:43:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
Subject: Re: [PATCH v6 5/7] hw/arm/virt: Improve high memory region address
 assignment
In-Reply-To: <581dc823-1b6c-3a24-3532-af0938c3dec2@redhat.com>
Organization: Red Hat GmbH
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-6-gshan@redhat.com>
 <42375c62-c9d4-3276-2ce6-04ee0c9222f7@redhat.com>
 <581dc823-1b6c-3a24-3532-af0938c3dec2@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 26 Oct 2022 12:43:15 +0200
Message-ID: <87tu3qsw58.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 26 2022, Gavin Shan <gshan@redhat.com> wrote:

> Hi Eric,
>
> On 10/26/22 12:29 AM, Eric Auger wrote:
>> On 10/24/22 05:54, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>
>>> (1) One specific high memory region is likely to be disabled by
>>>      code by toggling vms->highmem_{redists, ecam, mmio}.
>>>
>>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>      'virt-2.12' or ealier than it.
>>>
>>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>      on 32-bits system.
>>>
>>> (4) One specific high memory region is disabled when it breaks the
>>>      PA space limit.
>>>
>>> The current implementation of virt_set_{memmap, high_memmap}() isn't
>>> optimized because the high memory region's PA space is always reserved,
>>> regardless of whatever the actual state in the corresponding
>>> vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
>>> 'vms->highest_gpa' are always increased for case (1), (2) and (3).
>>> It's unnecessary since the assigned PA space for the disabled high
>>> memory region won't be used afterwards.
>>>
>>> Improve the address assignment for those three high memory region by
>>> skipping the address assignment for one specific high memory region if
>>> it has been disabled in case (1), (2) and (3). The memory layout may
>>> be changed after the improvement is applied, which leads to potential
>>> migration breakage. So 'vms->highmem_compact' is added to control if
>>> the improvement should be applied. For now, 'vms->highmem_compact' is
>>> set to false, meaning that we don't have memory layout change until it
>>> becomes configurable through property 'compact-highmem' in next patch.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> the code has quite changed since Connie's R-b
>
> Right. Connie, could you please check if the changes make sense to you
> and I can regain your R-B? :)

My R-b still holds.

>
>>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>>> ---
>>>   hw/arm/virt.c         | 15 ++++++++++-----
>>>   include/hw/arm/virt.h |  1 +
>>>   2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index ee98a8a3b6..4896f600b4 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>>>           vms->memmap[i].size = region_size;
>>>   
>>>           /*
>>> -         * Check each device to see if they fit in the PA space,
>>> -         * moving highest_gpa as we go.
>>> +         * Check each device to see if it fits in the PA space,
>>> +         * moving highest_gpa as we go. For compatibility, move
>>> +         * highest_gpa for disabled fitting devices as well, if
>>> +         * the compact layout has been disabled.
>>>            *
>>>            * For each device that doesn't fit, disable it.
>>>            */
>>>           fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>>> -        if (fits) {
>>> -            vms->highest_gpa = region_base + region_size - 1;
>>> +        *region_enabled &= fits;
>>> +        if (vms->highmem_compact && !*region_enabled) {
>>> +            continue;
>>>           }
>>>   
>>> -        *region_enabled &= fits;
>>>           base = region_base + region_size;
>>> +        if (fits) {
>>> +            vms->highest_gpa = region_base + region_size - 1;
>> 
>> vms->highest_gpa = base - 1;
>> 
>
> It's personal taste actually. I was thinking of using 'base - 1', but
> 'region_base + region_size - 1' looks more like a direct way. I don't
> have strong sense though and lets use 'base - 1' in next respin.

I don't really have a preference for one or the other.


