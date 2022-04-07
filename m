Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D344F70F2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 03:22:05 +0200 (CEST)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncGqY-0005gR-6K
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 21:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ncGoU-0004OT-D2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 21:19:54 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ncGoR-0006wt-V2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 21:19:54 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KYk2s1RtRzBs4f;
 Thu,  7 Apr 2022 09:15:33 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Apr 2022 09:19:44 +0800
Subject: Re: [PATCH] hw/vfio/common: Fix a small boundary issue of a trace
To: Damien Hedde <damien.hedde@greensocs.com>, <alex.williamson@redhat.com>
References: <1649232889-191210-1-git-send-email-chenxiang66@hisilicon.com>
 <9c87f0c0-8b04-759f-fb87-9b983965e354@greensocs.com>
CC: <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Message-ID: <4f8081d3-d06a-b613-88a3-d5f358690cd6@hisilicon.com>
Date: Thu, 7 Apr 2022 09:19:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <9c87f0c0-8b04-759f-fb87-9b983965e354@greensocs.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>

Hi Damien,


在 2022/4/6 23:22, Damien Hedde 写道:
>
>
> On 4/6/22 10:14, chenxiang via wrote:
>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>
>> Right now the trace of vfio_region_sparse_mmap_entry is as follows:
>> vfio_region_sparse_mmap_entry sparse entry 0 [0x1000 - 0x9000]
>> Actually the range it wants to show is [0x1000 - 0x8fff]，so fix it.
>>
>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>> ---
>>   hw/vfio/common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 080046e3f5..0b3808caf8 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1546,7 +1546,7 @@ static int 
>> vfio_setup_region_sparse_mmaps(VFIORegion *region,
>>       for (i = 0, j = 0; i < sparse->nr_areas; i++) {
>>           trace_vfio_region_sparse_mmap_entry(i, 
>> sparse->areas[i].offset,
>> sparse->areas[i].offset +
>> - sparse->areas[i].size);
>> + sparse->areas[i].size - 1);
>>             if (sparse->areas[i].size) {
>>               region->mmaps[j].offset = sparse->areas[i].offset;
>
> If the size if zero, the trace will be weird with an underflow if 
> offset is zero as well.

Yes, that's a issue.

> Maybe just change the trace by inverting the right bracket ?
> eg: [0x1000 - 0x9000[
> Or don't trace in that case ? (but I am not maintainer of this, so 
> maybe that does not make sense).

But it uses [offset, offset + size - 1] in other places such as 
trace_vfio_region_region_mmap()/trace_vfio_subregion_unmap()/trace_vfio_region_mmap_fault() 
in vfio code.
Maybe it is better to move this trace to the brace of "if 
(sparse->areas[i].size)" which ensures size != 0.

>
> -- 
> Damien
> .
>


