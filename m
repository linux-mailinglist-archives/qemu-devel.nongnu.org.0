Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2584EDE7B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:14:41 +0200 (CEST)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxRZ-0001A4-3N
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:14:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nZxQJ-0000Sc-1K; Thu, 31 Mar 2022 12:13:23 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:44996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1nZxQE-00089r-UX; Thu, 31 Mar 2022 12:13:20 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 00D612E08A6;
 Thu, 31 Mar 2022 19:13:13 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 xO7hJ8nQrn-DCJm4CpN; Thu, 31 Mar 2022 19:13:12 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1648743192; bh=YJhbT6gf05fyZPSr5uqf3CCJFBFfkGrCaAHsGluvZO8=;
 h=In-Reply-To:From:Cc:To:Subject:Message-ID:References:Date;
 b=JRt9oYGfaBXwUns2Eki0D/evz0fhGQO7UH+OBLonKOe8mTuKJFnER2NaLkzhSaBif
 inJC96vGudhV9knihT0qkClVNQeq2c+Yf163h1+3cmij0/v0eN17d+P+VthCBjIKLD
 STD26j4lzn70uO+o0J4tdDGBdsjBfQPaIZ7r6vx0=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
Received: from [IPV6:2a02:6b8:0:107:3e85:844d:5b1d:60a]
 (dynamic-red3.dhcp.yndx.net [2a02:6b8:0:107:3e85:844d:5b1d:60a])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Dt6odZ3o09-DCKS819K; Thu, 31 Mar 2022 19:13:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <cbbc0453-62d2-b8b6-f9ef-6323f39b9560@yandex-team.com>
Date: Thu, 31 Mar 2022 19:14:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] softmmu/physmem: fix dirty memory bitmap memleak
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <20220325154013.16809-1-arbn@yandex-team.com>
 <20220325154013.16809-2-arbn@yandex-team.com> <YkSuxObygiiPbXfo@xz-m1.local>
From: Andrey Ryabinin <arbn@yandex-team.com>
In-Reply-To: <YkSuxObygiiPbXfo@xz-m1.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163; envelope-from=arbn@yandex-team.com;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/22 22:25, Peter Xu wrote:
> On Fri, Mar 25, 2022 at 06:40:13PM +0300, Andrey Ryabinin wrote:
>> The sequence of ram_block_add()/qemu_ram_free()/ram_block_add()
>> function calls leads to leaking some memory.
>>
>> ram_block_add() calls dirty_memory_extend() to allocate bitmap blocks
>> for new memory. These blocks only grow but never shrink. So the
>> qemu_ram_free() restores RAM size back to it's original stat but
>> doesn't touch dirty memory bitmaps.
>>
>> After qemu_ram_free() there is no way of knowing that we have
>> allocated dirty memory bitmaps beyond current RAM size.
>> So the next ram_block_add() will call dirty_memory_extend() again to
>> to allocate new bitmaps and rewrite pointers to bitmaps left after
>> the first ram_block_add()/dirty_memory_extend() calls.
>>
>> Rework dirty_memory_extend() to be able to shrink dirty maps,
>> also rename it to dirty_memory_resize(). And fix the leak by
>> shrinking dirty memory maps on qemu_ram_free() if needed.
>>
>> Fixes: 5b82b703b69a ("memory: RCU ram_list.dirty_memory[] for safe RAM hotplug")
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
>> ---
>>  include/exec/ramlist.h |  2 ++
>>  softmmu/physmem.c      | 38 ++++++++++++++++++++++++++++++++------
>>  2 files changed, 34 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
>> index 2ad2a81acc..019e238e7c 100644
>> --- a/include/exec/ramlist.h
>> +++ b/include/exec/ramlist.h
>> @@ -41,6 +41,8 @@ typedef struct RAMBlockNotifier RAMBlockNotifier;
>>  #define DIRTY_MEMORY_BLOCK_SIZE ((ram_addr_t)256 * 1024 * 8)
>>  typedef struct {
>>      struct rcu_head rcu;
>> +    unsigned int nr_blocks;
>> +    unsigned int nr_blocks_inuse;
>>      unsigned long *blocks[];
>>  } DirtyMemoryBlocks;
> 
> The problem looks valid, but can we avoid introducing these variables at
> all?
> 
> IIUC what we miss here is the proper releasing of dirty blocks when ram is
> released.  IMHO as long as we properly release the extra dirty memory
> blocks in qemu_ram_free(), then last_ram_page() will reflect the existing
> dirty memory block size.  That looks simpler if I'm correct..
> 

ram_list.dirty_memory is RCU protected which means we can't free it immediately.
Freeing must be delayed until the end of RCU grace period.
One way to do it is using rcu callback, like in this patch. That why we need these
variables - to pass the information into rcu callback.

Another way is using synchronize_rcu() before freeing the memory. In that case
the variables won't be needed. But it's expensive.
Also I'm not sure if using synchronize_rcu() under a mutex lock is a good idea.
Perhaps it will needed somehow to rework dirty_memory_resize() to move synchronize_rcu() and freeing
outside of mutex_lock()/unlock() section.

> Side question: both of the patches are not regression introduced in this
> release, right?  So they are targeting for the next release?
> 

Right, these bugs are old. I'm not familiar with qemu release schedule/procedure,
so whatever release is more appropriate.

