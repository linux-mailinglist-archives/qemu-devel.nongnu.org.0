Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE12E2D8F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 08:14:06 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kt3m8-00034P-N6
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 02:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kt3kT-00027w-Em; Sat, 26 Dec 2020 02:12:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kt3kQ-0007aL-I7; Sat, 26 Dec 2020 02:12:21 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D2w3132c3zhwKn;
 Sat, 26 Dec 2020 15:11:25 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 15:11:53 +0800
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
To: Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
 <20201217100501.GE4338@stefanha-x1.localdomain>
 <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <bbfc0b13-0917-6851-e10f-c7001ff9fd22@huawei.com>
Date: Sat, 26 Dec 2020 15:11:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.561,
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
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


[...]

>>> -        for (j = old_num_blocks; j < new_num_blocks; j++) {
>>> -            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>>> +        if (extend) {
>>> +            for (j = cpy_num_blocks; j < new_num_blocks; j++) {
>>> +                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>>> +            }
>>> +        } else {
>>> +            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
>>> +                /* We are safe to free it, for that it is out-of-use */
>>> +                g_free(old_blocks->blocks[j]);
>>
>> This looks unsafe because this code uses Read Copy Update (RCU):
>>
>>   old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
>>
>> Other threads may still be accessing old_blocks so we cannot modify it
>> immediately. Changes need to be deferred until the next RCU period.
>> g_free_rcu() needs to be used to do this.
>>
> Hi Stefan,
> 
> You are right. I was thinking about the VM life cycle before. We shrink the dirty_memory
> when we are removing unused ramblock. However we can not rely on this.
> 
> I also notice that "Organization into blocks allows dirty memory to grow (but not shrink)
> under RCU". Why "but not shrink"? Any thoughts?
Hi,

After my analysis, it's both unsafe to grow or shrink under RCU.

ram_list.blocks and ram_list.dirty_memory[X] are closely related and
both protected by RCU. For the lockless RCU readers, we can't promise they
always see consistent version of the two structures.

For grow, a reader may see un-growed @dirty_memory and growed @blocks, causing out-of-bound access.
For shrink, a reader may see shrinked @dirty_memory and un-shrinked @blocks, causing out-of-bound access too.

I think it's a design problem, RCU can just protect one structure, not two.

Thanks,
Keqian.
> 
> [...]
>  * Organization into blocks allows dirty memory to grow (but not shrink) under
>  * RCU.  When adding new RAMBlocks requires the dirty memory to grow, a new
>  * DirtyMemoryBlocks array is allocated with pointers to existing blocks kept
>  * the same.  Other threads can safely access existing blocks while dirty
>  * memory is being grown.  When no threads are using the old DirtyMemoryBlocks
>  * anymore it is freed by RCU (but the underlying blocks stay because they are
>  * pointed to from the new DirtyMemoryBlocks).
>  */
> #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
> typedef struct {
>     struct rcu_head rcu;
>     unsigned long *blocks[];
> } DirtyMemoryBlocks;
> [...]
> 
> Thanks,
> Keqian
> 
> 
> .
> 

