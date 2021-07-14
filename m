Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B83C8851
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:02:28 +0200 (CEST)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3hL8-0003yo-82
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m3hIV-00024R-35
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:59:43 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:35399
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m3hIS-00055j-IZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:59:42 -0400
HMM_SOURCE_IP: 172.18.0.218:36710.538761388
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.19?logid-4cc22a249b6445738f2c2d94f1840e6b
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 9D4DD28008E;
 Wed, 14 Jul 2021 23:59:26 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 4cc22a249b6445738f2c2d94f1840e6b for
 zhengchuan@huawei.com; Wed Jul 14 23:59:27 2021
X-Transaction-ID: 4cc22a249b6445738f2c2d94f1840e6b
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH 0/4] support dirtyrate measurement with dirty bitmap
To: Peter Xu <peterx@redhat.com>
References: <cover.1624768443.git.huangy81@chinatelecom.cn>
 <YOiTYBITq1px8r1S@t490s>
 <5ad1b7ce-1fb0-c551-8fe3-ed6fd3fab37c@chinatelecom.cn>
 <YO3RVarYG8WftETj@t490s>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <3f502e03-e299-1675-eb24-5d5566336895@chinatelecom.cn>
Date: Wed, 14 Jul 2021 23:59:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO3RVarYG8WftETj@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



在 2021/7/14 1:45, Peter Xu 写道:
> On Sun, Jul 11, 2021 at 11:27:13PM +0800, Hyman Huang wrote:
>>> IMHO we can directly do the calculation when synchronizing the dirty bits in
>>> below functions:
>>>
>>>           cpu_physical_memory_set_dirty_range
>>>           cpu_physical_memory_set_dirty_lebitmap
>>>           cpu_physical_memory_sync_dirty_bitmap
>>>
>>> Maybe we can define a global statistics for that?
>> uhhh... Do you mean that we can reuse the DIRTY_MEMORY_MIGRATION dirty bits
>> to stat the new dirty pages number and just define the global var to count
>> the increased dirty pages during the calculation time?
> 
> I think I misguided you.. Sorry :)
never mind, the other version of the implementation is what your said, 
i'll post later.
> 
> cpu_physical_memory_sync_dirty_bitmap() should not really be in the list above,
> as it's fetching the bitmap in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION].
> 
> If you see the other two functions, they all apply dirty bits upon the same
> bitmap (actually ram_list.dirty_memory[*] instead of migration-only).  It's
> used by e.g. memory region log_sync() to deliver lower level dirty bits to
> upper, e.g., see kvm's log_sync[_global]() and kvm_slot_sync_dirty_pages().
> 
> Using cpu_physical_memory_sync_dirty_bitmap() is not a good idea to me (which I
> saw you used in your latest version), as it could affect migration.  See its
> only caller now at ramblock_sync_dirty_bitmap(): when migration calls it, it'll
> start to count less than it should for rs->migration_dirty_pages.
> 
> So what I wanted to suggest is we do some general counting in both
> cpu_physical_memory_set_dirty_range and cpu_physical_memory_set_dirty_lebitmap.
> Then to sync for dirty rate measuring, we use memory_global_dirty_log_sync().
> That'll sync all dirty bits e.g. in kernel to ram_list.dirty_memory[*], along
> which we do the accounting.
> 
> Would that work?
yes, this works.
> 

