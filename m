Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89603C3DAA
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 17:28:48 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2bNv-0003LW-EJ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 11:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m2bMm-0002QH-My
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 11:27:36 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:42553
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m2bMi-0004TG-1j
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 11:27:36 -0400
HMM_SOURCE_IP: 172.18.0.218:34660.1795797879
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.19?logid-305ff820d247411aadc6539d2549557e
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 6908D2800E8;
 Sun, 11 Jul 2021 23:27:15 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 305ff820d247411aadc6539d2549557e for
 zhengchuan@huawei.com; Sun Jul 11 23:27:21 2021
X-Transaction-ID: 305ff820d247411aadc6539d2549557e
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH 0/4] support dirtyrate measurement with dirty bitmap
To: Peter Xu <peterx@redhat.com>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
 <YOiTYBITq1px8r1S@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <5ad1b7ce-1fb0-c551-8fe3-ed6fd3fab37c@chinatelecom.cn>
Date: Sun, 11 Jul 2021 23:27:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOiTYBITq1px8r1S@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.631,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/7/10 2:20, Peter Xu 写道:
> Yong,
> 
> On Sun, Jun 27, 2021 at 01:38:13PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> the dirtyrate measurement implemented by page-sampling originally, it
>> is not accurate in some scenarios, so we have introduced dirty-ring
>> based dirtyrate measurement(maybe it will be merged soon), it fix the
>> accuracy of page-sampling, and more importantly, it is at the
>> granualrity of vcpu.
>>
>> dirty-ring method can be used when dirty-ring enable, as supplementary,
>> we introduce dirty-bitmap method to calculating dirtyrate when dirty log
>> enable, so that we can also get the accurate dirtyrate if needed in the
>> absence of dirty-ring.
>>
>> three things has done to implement the measurement:
>> - introduce a fresh new dirty bits named DIRTY_MEMORY_DIRTY_RATE, which
>>    is used to store dirty bitmap after fetching it from kvm. why we do
>>    not reuse the existing DIRTY_MEMORY_MIGRATION dirty bits is we do not
>>    want to interfere with migration of and let implementation clear, this
>>    is also the reason why dirty_memory be split.
>>
>>    DIRTY_MEMORY_DIRTY_RATE dirty bits will be filled when
>>    memory_global_dirty_log_sync executed if GLOBAL_DIRTY_DIRTY_RATE bit
>>    be set in the global_dirty_tracking flag.
> 
> I'm not 100% sure this is needed.
> 
> Dirty rate measurements do not care about which page is dirtied, it looks like
> an overkill to introduce a new bitmap for it.
indeed, dirty rate measurements only cares about the increased dirty 
pages number during calculation time.
> 
> IMHO we can directly do the calculation when synchronizing the dirty bits in
> below functions:
> 
>          cpu_physical_memory_set_dirty_range
>          cpu_physical_memory_set_dirty_lebitmap
>          cpu_physical_memory_sync_dirty_bitmap
> 
> Maybe we can define a global statistics for that?
uhhh... Do you mean that we can reuse the DIRTY_MEMORY_MIGRATION dirty 
bits to stat the new dirty pages number and just define the global var 
to count the increased dirty pages during the calculation time?
or we still use the bitmap but defined as a global var, instead of dirty 
bits?
> 
>>
>> - introduce kvm_get_manual_dirty_log_protect function so that we can
>>    probe the protect caps of kvm when calculating.
>>
>> - implement dirtyrate measurement with dirty bitmap with following step:
>>    1. start the dirty log.
>>
>>    2. probe the protect cap, if KVM_DIRTY_LOG_INITIALLY_SET enable, skip
>>       skip the 1'R and do the reset page protection manually, since kvm
>>       file bitmap with 1 bits if this cap is enabled.
>>
>>    3. clear the DIRTY_MEMORY_DIRTY_RATE dirty bits, prepare to store
>>       the dirty bitmap.
>>
>>    4. start memory_global_dirty_log_sync and fetch dirty bitmap from kvm
>>
>>    5. reap the DIRTY_MEMORY_DIRTY_RATE dirty bits and do the calculation.
>>
>> this patchset rebases on the commit
>> "migration/dirtyrate: implement dirty-ring dirtyrate calculation",
>> since the above feature has not been merged, so we post this patch
>> for the sake of RFC. ideally, this patshset may be merged after it.
> 
> I gave it a shot with some setup dirty workload, it runs well so far and also I
> do get accurate numbers (200MB/s measured as 201MB/s; 300MB/s measured as
> 301MB/s, and so on).  Looks good to me in general.
> 
> But as I mentioned above I feel like the changeset can be shrinked quite a bit
> if we can drop the extra bitmap; maybe it means we can drop half of the whole
> series.  But it's also possible I missed something, let's see.
> 
> It'll slightly differ from dirty ring in that same page written will always
> only be counted once between two dirty map sync, but that's expected.  Dirty
> ring "sync" more frequently (either ring full, or current 1-sec timeout in the
> reaper), so it re-protects more frequently too.
> 
> I still have some other small comments, I'll go into the patches.
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

