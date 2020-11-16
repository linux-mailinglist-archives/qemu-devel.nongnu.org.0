Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A412B3E64
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 09:18:10 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keZiC-0001S5-OP
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 03:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1keZhA-0000fh-QT; Mon, 16 Nov 2020 03:17:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1keZh8-0005j1-96; Mon, 16 Nov 2020 03:17:04 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZMNn14dWzhb6w;
 Mon, 16 Nov 2020 16:16:41 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 16:16:45 +0800
Subject: Re: [RFC] vfio-pci/migration: Dirty logging of the Memory BAR region?
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
References: <fd18627a-e012-1af8-9d9f-9ae8a1415258@huawei.com>
 <2825e816-9ade-07f9-19e3-ccfd57ffb568@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <8f19cf24-8844-fa9b-a462-a55cf718002e@huawei.com>
Date: Mon, 16 Nov 2020 16:16:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2825e816-9ade-07f9-19e3-ccfd57ffb568@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 03:16:54
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/15 23:03, Paolo Bonzini wrote:
> On 15/11/20 15:31, Zenghui Yu wrote:
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 71951fe4dc..0958db1a08 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>>  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>>  {
>>      uint8_t mask = mr->dirty_log_mask;
>> -    if (global_dirty_log && (mr->ram_block || 
>> memory_region_is_iommu(mr))) {
>> +    RAMBlock *rb = mr->ram_block;
>> +
>> +    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
>> +                             memory_region_is_iommu(mr))) {
>>          mask |= (1 << DIRTY_MEMORY_MIGRATION);
>>      }
>>      return mask;
> 
> Yes, this makes sense.  Please send it as a patch, thanks!

Sure, I'm going to write a commit message for it.  Thanks for your
review.


Zenghui

