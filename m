Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46682588635
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 06:14:55 +0200 (CEST)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ5mX-00028y-TX
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 00:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJ5kh-0008RY-V5
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 00:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJ5kc-0008A8-PD
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 00:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659499965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9e4zvPuIttUqGLPX6pNoZvoT/Jgh/kWUsLOjNpK0Bk=;
 b=e/HdRq2u3jeT9aNHq4abAdhnxEt/FPSL+8kQsp3Woh+4p9AMlBpXI5jrvhtmaMeoaktk2A
 /PUnLIPs+Dzq3mpEGSRcLSJ35FqPyUwE7mxRGS0AgiScvOQNChw73o3ugU6BpQI6AqzSYC
 /kO8LLxHPKCvMS5gslD/ENrvSLtk5fU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-y-5OnJEHNKqRicc6EBhQ2w-1; Wed, 03 Aug 2022 00:12:42 -0400
X-MC-Unique: y-5OnJEHNKqRicc6EBhQ2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E278D85A587;
 Wed,  3 Aug 2022 04:12:41 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2B840C1288;
 Wed,  3 Aug 2022 04:12:38 +0000 (UTC)
Subject: Re: [PATCH 2/2] hw/arm/virt: Warn when high memory region is disabled
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-3-gshan@redhat.com>
 <d1011a19-0a3d-62f7-20aa-714fd56a6647@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <e251ff16-bb9c-20d1-e174-12e28684e30b@redhat.com>
Date: Wed, 3 Aug 2022 16:13:19 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d1011a19-0a3d-62f7-20aa-714fd56a6647@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Eric,

On 8/2/22 7:49 PM, Eric Auger wrote:
> On 8/2/22 08:45, Gavin Shan wrote:
>> When one specific high memory region is disabled due to the PA
>> limit, it'd better to warn user about that. The warning messages
>> help to identify the cause in some cases. For example, PCIe device
>> that has large MMIO bar, to be covered by PCIE_MMIO high memory
>> region, won't work properly if PCIE_MMIO high memory region is
>> disabled due to the PA limit.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index bc0cd218f9..c91756e33d 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1691,6 +1691,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>   static void virt_memmap_fits(VirtMachineState *vms, int index,
>>                                bool *enabled, hwaddr *base, int pa_bits)
>>   {
>> +    const char *region_name;
>>       hwaddr size = extended_memmap[index].size;
>>   
>>       /* The region will be disabled if its size isn't given */
>> @@ -1713,6 +1714,23 @@ static void virt_memmap_fits(VirtMachineState *vms, int index,
>>           vms->highest_gpa = *base + size - 1;
>>   
>>   	*base = *base + size;
>> +    } else {
>> +        switch (index) {
>> +        case VIRT_HIGH_GIC_REDIST2:
>> +            region_name = "GIC_REDIST2";
>> +            break;
>> +        case VIRT_HIGH_PCIE_ECAM:
>> +            region_name = "PCIE_ECAM";
>> +            break;
>> +        case VIRT_HIGH_PCIE_MMIO:
>> +            region_name = "PCIE_MMIO";
>> +            break;
>> +        default:
>> +            region_name = "unknown";
>> +        }
> when highmem is turned off I don't think we want those warnings because
> it is obvious that highmem regions are not meant to be used.
> 
> On the other hand I am afraid some users may complain about warnings
> that do not affect them. If you miss high MMIO don't you get a warning
> on guest side?
> 

Yes, there is error message from guest to complain 64-bits PCI BAR can't
be settled. In this regard, I do think the error messages are duplicate
to some extent.

Lets drop this patch in next revision.

>> +
>> +        warn_report("Disabled %s high memory region due to PA limit",
>> +                    region_name);
>>       }
>>   }
>>   

Thanks,
Gavin


