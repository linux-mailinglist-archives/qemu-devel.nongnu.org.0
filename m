Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A018260D9A2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 05:22:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onWuJ-0005Di-Sp; Tue, 25 Oct 2022 23:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onWuH-00059z-Hr
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 23:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1onWuC-0002Qg-TN
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 23:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666754195;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3l4D8tpeyvgvykNGoNvE+DmHvVyYEmo2rrSE2Z9CdY=;
 b=JkCLIUMNRARQcGraTEHSI2Rfqy42JQi857UQGFLCpnaLzYh3gnRuOIzuZkjVQD9mn2/Cix
 okED6IrQHyXTo9HLAMpGZtZfFt01riSOKzhX4OwURpm0s5cUagN26HuEI3/m6GIFO8aLnB
 QfXZnpBFTJx6ee7IKCGKLzHvoym0OTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-k5B9_VN3PgGh4Ril-gjEjQ-1; Tue, 25 Oct 2022 23:16:31 -0400
X-MC-Unique: k5B9_VN3PgGh4Ril-gjEjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAB5F8582B9;
 Wed, 26 Oct 2022 03:16:30 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B52E223177;
 Wed, 26 Oct 2022 03:16:27 +0000 (UTC)
Subject: Re: [PATCH v6 6/7] hw/arm/virt: Add 'compact-highmem' property
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-7-gshan@redhat.com> <877d0ofb4w.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <16245599-d0a6-fbe8-7a0d-26ce77fa977e@redhat.com>
Date: Wed, 26 Oct 2022 11:16:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <877d0ofb4w.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Connie,

On 10/25/22 6:30 PM, Cornelia Huck wrote:
> On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:
> 
>> After the improvement to high memory region address assignment is
>> applied, the memory layout can be changed, introducing possible
>> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
>> is disabled or enabled when the optimization is applied or not, with
>> the following configuration. The configuration is only achievable by
>> modifying the source code until more properties are added to allow
>> users selectively disable those high memory regions.
>>
>>    pa_bits              = 40;
>>    vms->highmem_redists = false;
>>    vms->highmem_ecam    = false;
>>    vms->highmem_mmio    = true;
>>
>>    # qemu-system-aarch64 -accel kvm -cpu host    \
>>      -machine virt-7.2,compact-highmem={on, off} \
>>      -m 4G,maxmem=511G -monitor stdio
>>
>>    Region             compact-highmem=off         compact-highmem=on
>>    ----------------------------------------------------------------
>>    MEM                [1GB         512GB]        [1GB         512GB]
>>    HIGH_GIC_REDISTS2  [512GB       512GB+64MB]   [disabled]
>>    HIGH_PCIE_ECAM     [512GB+256MB 512GB+512MB]  [disabled]
>>    HIGH_PCIE_MMIO     [disabled]                 [512GB       1TB]
>>
>> In order to keep backwords compatibility, we need to disable the
>> optimization on machine, which is virt-7.1 or ealier than it. It
>> means the optimization is enabled by default from virt-7.2. Besides,
>> 'compact-highmem' property is added so that the optimization can be
>> explicitly enabled or disabled on all machine types by users.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
>> ---
>>   docs/system/arm/virt.rst |  4 ++++
>>   hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++++
>>   include/hw/arm/virt.h    |  1 +
>>   3 files changed, 37 insertions(+)
>>
> 
> (...)
> 
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 4896f600b4..11b5685432 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -174,6 +174,12 @@ static const MemMapEntry base_memmap[] = {
>>    * Note the extended_memmap is sized so that it eventually also includes the
>>    * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>>    * index of base_memmap).
>> + *
>> + * The memory map for these Highmem IO Regions can be in legacy or compact
>> + * layout, depending on 'compact-highmem' property. With legacy layout, the
>> + * PA space for one specific region is always reserved, even the region has
> 
> s/even/even if/
> 

Thanks, it will be improved as suggested in next respin (v7).

>> + * been disabled or doesn't fit into the PA space. However, the PA space for
>> + * the region won't be reserved in these circumstances with compact layout.
>>    */
>>   static MemMapEntry extended_memmap[] = {
>>       /* Additional 64 MB redist region (can contain up to 512 redistributors) */
> 

Thanks,
Gavin


