Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2022D5168
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 04:34:11 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knCiY-0005ED-HF
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 22:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1knCgL-0004k2-Sn
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 22:31:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1knCgI-0002Vn-3D
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 22:31:53 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Crzw50cGSz15YYm;
 Thu, 10 Dec 2020 11:31:01 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 11:31:23 +0800
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
To: zhukeqian <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <620cef3d-ad21-f57e-507f-80064284e94e@huawei.com>
Date: Thu, 10 Dec 2020 11:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/10 10:53, zhukeqian wrote:
> 
> 
> On 2020/12/10 10:08, Peter Xu wrote:
>> Keqian,
>>
>> On Thu, Dec 10, 2020 at 09:46:06AM +0800, zhukeqian wrote:
>>> Hi,
>>>
>>> I see that if start or size is not PAGE aligned, it also clears areas
>>> which beyond caller's expectation, so do we also need to consider this?

Ah, I really don't anticipate this to happen but ... The question is
what's the expectation of the caller if a non-PAGE aligned @start is
given. Should we clear dirty state for the page which covers the
unaligned @start? Or just skip it?

>>
>> Could you elaborate?
>>
>> If start_delta != 0, kvm_log_clear_one_slot() should already go the slow path.
>>
>> Thanks,
>>
> 
> Hi Peter,
> 
> start_delta /= psize;
> 
> If start is not PAGE aligned, then start_delta is not PAGE aligned.
> so I think the above code will implicitly extend our start to be PAGE aligned.
> 
> I suggest that we should shrink the start and (start + size) to be PAGE aligned
> at beginning of this function.

I don't object to do so (though haven't checked the code carefully).
I also don't think there is much we can do given that the caller
doesn't care about which *exact pages* to clear.


Thanks,
Zenghui

