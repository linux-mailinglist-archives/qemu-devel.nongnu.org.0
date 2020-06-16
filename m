Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4921FAF03
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 13:21:49 +0200 (CEST)
Received: from localhost ([::1]:40324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl9f2-0005GV-5j
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 07:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl9dz-0004RH-Cv; Tue, 16 Jun 2020 07:20:43 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46716 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl9dx-0001RE-B8; Tue, 16 Jun 2020 07:20:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB860E7551F678AD9DF0;
 Tue, 16 Jun 2020 19:20:33 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 19:20:25 +0800
Subject: Re: [PATCH v2] migration: Count new_dirty instead of real_dirty
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200616021059.25984-1-zhukeqian1@huawei.com>
 <20200616093551.GA2790@work-vm>
 <3a45d5a0-3acf-336d-520f-523bf588b551@huawei.com>
 <20200616095846.GA2788@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <05e4535c-b0e8-a0ec-36d6-769fdf5ce3d9@huawei.com>
Date: Tue, 16 Jun 2020 19:20:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200616095846.GA2788@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 05:49:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jianjay.zhou@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2020/6/16 17:58, Dr. David Alan Gilbert wrote:
> * zhukeqian (zhukeqian1@huawei.com) wrote:
>> Hi Dave,
>>
>> On 2020/6/16 17:35, Dr. David Alan Gilbert wrote:
>>> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>>>> real_dirty_pages becomes equal to total ram size after dirty log sync
>>>> in ram_init_bitmaps, the reason is that the bitmap of ramblock is
>>>> initialized to be all set, so old path counts them as "real dirty" at
>>>> beginning.
>>>>
>>>> This causes wrong dirty rate and false positive throttling at the end
>>>> of first ram save iteration.
>>>>
>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>
>>> Since this function already returns num_dirty, why not just change the
>>> caller to increment a counter based off the return value?
>> Yes, that would be better :-) .
>>
>>>
>>> Can you point to the code which is using this value that triggers the
>>> throttle?
>>>
>> In migration_trigger_throttle(), rs->num_dirty_pages_period is used.
>> And it corresponds to real_dirty_pages here.
> 
> OK; so is the problem not the same as the check that's in there for
> blk_mig_bulk_activate - don't we need to do the same trick for ram bulk
> migration (i.e. the first pass).
> 
Sorry that I do not get your idea clearly. Could you give some sample
code?

> Dave
> 
>> Thanks,
>> Keqian
>>
>>> Dave
>>>
>>>
>> [...]
>>>>
>>>>
>>> --
>>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>>
>>> .
>>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> .
> 

