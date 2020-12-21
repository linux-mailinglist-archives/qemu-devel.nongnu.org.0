Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A482DF989
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 08:39:27 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krFmv-0003YS-VS
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 02:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krFlk-00030D-1M; Mon, 21 Dec 2020 02:38:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1krFld-0000Dj-7W; Mon, 21 Dec 2020 02:38:11 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Czrrw5jl4z7J1m;
 Mon, 21 Dec 2020 15:37:04 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 15:37:36 +0800
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
 <20201217100501.GE4338@stefanha-x1.localdomain>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <7306ed10-871a-58ab-06d4-daa1efc5c9a7@huawei.com>
Date: Mon, 21 Dec 2020 15:37:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201217100501.GE4338@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam
 Zheng <famz@redhat.com>, kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/17 18:05, Stefan Hajnoczi wrote:
> On Mon, Nov 30, 2020 at 09:11:03PM +0800, Keqian Zhu wrote:
>> @@ -1839,15 +1841,26 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>>          new_blocks = g_malloc(sizeof(*new_blocks) +
>>                                sizeof(new_blocks->blocks[0]) * new_num_blocks);
>>  
>> -        if (old_num_blocks) {
>> +        if (cpy_num_blocks) {
>>              memcpy(new_blocks->blocks, old_blocks->blocks,
>> -                   old_num_blocks * sizeof(old_blocks->blocks[0]));
>> +                   cpy_num_blocks * sizeof(old_blocks->blocks[0]));
>>          }
>>  
>> -        for (j = old_num_blocks; j < new_num_blocks; j++) {
>> -            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>> +        if (extend) {
>> +            for (j = cpy_num_blocks; j < new_num_blocks; j++) {
>> +                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
>> +            }
>> +        } else {
>> +            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
>> +                /* We are safe to free it, for that it is out-of-use */
>> +                g_free(old_blocks->blocks[j]);
> 
> This looks unsafe because this code uses Read Copy Update (RCU):
> 
>   old_blocks = qatomic_rcu_read(&ram_list.dirty_memory[i]);
> 
> Other threads may still be accessing old_blocks so we cannot modify it
> immediately. Changes need to be deferred until the next RCU period.
> g_free_rcu() needs to be used to do this.
> 
Hi Stefan,

You are right. I was thinking about the VM life cycle before. We shrink the dirty_memory
when we are removing unused ramblock. However we can not rely on this.

I also notice that "Organization into blocks allows dirty memory to grow (but not shrink)
under RCU". Why "but not shrink"? Any thoughts?

[...]
 * Organization into blocks allows dirty memory to grow (but not shrink) under
 * RCU.  When adding new RAMBlocks requires the dirty memory to grow, a new
 * DirtyMemoryBlocks array is allocated with pointers to existing blocks kept
 * the same.  Other threads can safely access existing blocks while dirty
 * memory is being grown.  When no threads are using the old DirtyMemoryBlocks
 * anymore it is freed by RCU (but the underlying blocks stay because they are
 * pointed to from the new DirtyMemoryBlocks).
 */
#define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
typedef struct {
    struct rcu_head rcu;
    unsigned long *blocks[];
} DirtyMemoryBlocks;
[...]

Thanks,
Keqian


