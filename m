Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78D1F8C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 05:19:54 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkff6-0004AC-Ph
	for lists+qemu-devel@lfdr.de; Sun, 14 Jun 2020 23:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jkfeE-0003cY-FG; Sun, 14 Jun 2020 23:18:58 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41470 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jkfeC-0004sF-Ge; Sun, 14 Jun 2020 23:18:58 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B9AA485A7CB47FF9F78A;
 Mon, 15 Jun 2020 11:18:45 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 15 Jun 2020 11:18:35 +0800
Subject: Re: [PATCH] migration: Count new_dirty instead of real_dirty
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, <jianjay.zhou@huawei.com>
References: <20200601040250.38324-1-zhukeqian1@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <3205abb1-8e47-fc19-1213-ead621711291@huawei.com>
Date: Mon, 15 Jun 2020 11:18:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200601040250.38324-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/14 23:18:47
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
Cc: wanghaibin.wang@huawei.com, Chao Fan <fanc.fnst@cn.fujitsu.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo and Jian Zhou,

Do you have any suggestion on this patch?

Thanks,
Keqian

On 2020/6/1 12:02, Keqian Zhu wrote:
> DIRTY_LOG_INITIALLY_ALL_SET feature is on the queue. This fixs the
> dirty rate calculation for this feature. After introducing this
> feature, real_dirty_pages is equal to total memory size at begining.
> This causing wrong dirty rate and false positive throttling.
> 
> BTW, real dirty rate is not suitable and not very accurate.
> 
> 1. For not suitable: We mainly concern on the relationship between
>    dirty rate and network bandwidth. Net increasement of dirty pages
>    makes more sense.
> 2. For not very accurate: With manual dirty log clear, some dirty pages
>    will be cleared during each peroid, our "real dirty rate" is less
>    than real "real dirty rate".
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  include/exec/ram_addr.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 5e59a3d8d7..af9677e291 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -443,7 +443,7 @@ static inline
>  uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                                                 ram_addr_t start,
>                                                 ram_addr_t length,
> -                                               uint64_t *real_dirty_pages)
> +                                               uint64_t *accu_dirty_pages)
>  {
>      ram_addr_t addr;
>      unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
> @@ -469,7 +469,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>              if (src[idx][offset]) {
>                  unsigned long bits = atomic_xchg(&src[idx][offset], 0);
>                  unsigned long new_dirty;
> -                *real_dirty_pages += ctpopl(bits);
>                  new_dirty = ~dest[k];
>                  dest[k] |= bits;
>                  new_dirty &= bits;
> @@ -502,7 +501,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>                          start + addr + offset,
>                          TARGET_PAGE_SIZE,
>                          DIRTY_MEMORY_MIGRATION)) {
> -                *real_dirty_pages += 1;
>                  long k = (start + addr) >> TARGET_PAGE_BITS;
>                  if (!test_and_set_bit(k, dest)) {
>                      num_dirty++;
> @@ -511,6 +509,7 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>          }
>      }
>  
> +    *accu_dirty_pages += num_dirty;
>      return num_dirty;
>  }
>  #endif
> 

