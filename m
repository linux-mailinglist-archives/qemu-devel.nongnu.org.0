Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F92D6D29
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:17:48 +0100 (CET)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knX47-00086d-RJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knWzx-0006Qg-5X
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:13:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knWzu-0002jq-EO
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:13:28 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsXnx4gDczM1jh;
 Fri, 11 Dec 2020 09:12:37 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 09:13:10 +0800
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
To: Peter Xu <peterx@redhat.com>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
 <20201210145006.GD3211@xz-x1>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <2607b4cd-524c-2360-6261-224736861fc4@huawei.com>
Date: Fri, 11 Dec 2020 09:13:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201210145006.GD3211@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/10 22:50, Peter Xu wrote:
> On Thu, Dec 10, 2020 at 10:53:23AM +0800, zhukeqian wrote:
>>
>>
>> On 2020/12/10 10:08, Peter Xu wrote:
>>> Keqian,
>>>
>>> On Thu, Dec 10, 2020 at 09:46:06AM +0800, zhukeqian wrote:
>>>> Hi,
>>>>
>>>> I see that if start or size is not PAGE aligned, it also clears areas
>>>> which beyond caller's expectation, so do we also need to consider this?
>>>
>>> Could you elaborate?
>>>
>>> If start_delta != 0, kvm_log_clear_one_slot() should already go the slow path.
>>>
>>> Thanks,
>>>
>>
>> Hi Peter,
>>
>> start_delta /= psize;
>>
>> If start is not PAGE aligned, then start_delta is not PAGE aligned.
>> so I think the above code will implicitly extend our start to be PAGE aligned.
>>
>> I suggest that we should shrink the start and (start + size) to be PAGE aligned
>> at beginning of this function.
> 
> Callers should be with TARGET_PAGE_SIZE aligned on the size, so at least x86_64
> should be pretty safe since host/guest page sizes match.
> 
> Though indeed I must confess I don't know how it worked in general when host
> page size != target page size, at least for migration.  For example, I believe
> kvm dirty logging is host page size based, though migration should be migrating
> pages in guest page size granule when it spots a dirty bit set.
> 
Hi,

Indeed, we handle target_page_size aligned @start and @size in general. Maybe we'd better
add explicit function comments about alignment requirement, and explicit alignment assert
on @start and @size?

Keqian.

