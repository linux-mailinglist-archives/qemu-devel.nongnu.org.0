Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46936FF490
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:37:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7PL-0007Uh-JR; Thu, 11 May 2023 10:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1px7PH-0007UM-Et
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:36:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1px7PD-0001gq-J9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:36:35 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QHDvh6r5Lz6D8sm;
 Thu, 11 May 2023 22:35:28 +0800 (CST)
Received: from localhost (10.199.58.101) by lhrpeml500004.china.huawei.com
 (7.191.163.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 11 May
 2023 15:36:13 +0100
Date: Thu, 11 May 2023 17:36:08 +0300
To: Juan Quintela <quintela@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>, 
 Leonardo Bras <leobras@redhat.com>, Chuan Zheng <zhengchuan@huawei.com>,
 Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH 1/3] migration: Teach dirtyrate about
 qemu_target_page_size()
Message-ID: <ZFz9WK8QM+GJkrnv@DESKTOP-0LHM7NF.china.huawei.com>
References: <20230511092239.14607-1-quintela@redhat.com>
 <20230511092239.14607-2-quintela@redhat.com>
 <80a9bfb8-c99c-7b78-fac0-867f68779f21@linaro.org>
 <87fs833tc7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fs833tc7.fsf@secure.mitica>
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  <gudkov.andrei@huawei.com>
From: gudkov.andrei--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 11, 2023 at 03:12:24PM +0200, Juan Quintela wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
> > On 5/11/23 10:22, Juan Quintela wrote:
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>   migration/dirtyrate.c | 11 ++++++-----
> >>   1 file changed, 6 insertions(+), 5 deletions(-)
> >> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> >> index 180ba38c7a..9aa092738c 100644
> >> --- a/migration/dirtyrate.c
> >> +++ b/migration/dirtyrate.c
> >> @@ -17,6 +17,7 @@
> >>   #include "cpu.h"
> >>   #include "exec/ramblock.h"
> >>   #include "exec/ram_addr.h"
> >> +#include "exec/target_page.h"
> >>   #include "qemu/rcu_queue.h"
> >>   #include "qemu/main-loop.h"
> >>   #include "qapi/qapi-commands-migration.h"
> >> @@ -78,7 +79,7 @@ static int64_t do_calculate_dirtyrate(DirtyPageRecord dirty_pages,
> >>       uint64_t increased_dirty_pages =
> >>           dirty_pages.end_pages - dirty_pages.start_pages;
> >>   -    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE)
> >> >> 20;
> >> +    memory_size_MB = (increased_dirty_pages * qemu_target_page_size()) >> 20;
> >
> > See the recent cleanups for dirtylimit_dirty_ring_full_time, folding
> > multiply+shift into subtract+shift.
> 
> I reviewed it and I had already forgotten!!
> 
> >>         return memory_size_MB * 1000 / calc_time_ms;
> >>   }
> >> @@ -291,8 +292,8 @@ static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> >>       DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
> >>       DirtyStat.page_sampling.total_sample_count += info->sample_pages_count;
> >>       /* size of total pages in MB */
> >> -    DirtyStat.page_sampling.total_block_mem_MB += (info->ramblock_pages *
> >> -                                                   TARGET_PAGE_SIZE) >> 20;
> >> +    DirtyStat.page_sampling.total_block_mem_MB +=
> >> +        (info->ramblock_pages * qemu_target_page_size()) >> 20;
> >
> > And a third copy?
> > Can we abstract this somewhere?
> 
> I ended with this:
> 
> /* Convert target pages to MiB (2**20). */
> size_t qemu_target_pages_to_MiB(size_t pages)
> {
>     int page_bits = TARGET_PAGE_BITS;
> 
>     /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
>     g_assert(page_bits < 20);
> 
>     return pages >> (20 - page_bits);
> }
> 
> But only found 3 users, the one that you did and this two.

In fact, there is no need to convert VM size into MB inside update_dirtyrate_stat().
The unit of total_block_mem_MB can be changed to pages (or bytes).
This will leave update_dirtyrate() as the only user of the proposed function.

> 
> Will resend the series on top of this.
> 
> Thanks, Juan.

