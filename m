Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69146B30A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 03:14:23 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnYWT-0002ju-O1
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 21:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYWH-0002Li-5B
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:14:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnYWE-0007Z3-15
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:14:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:18119)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnYWD-0007Xa-P4
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 21:14:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 18:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="167818064"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jul 2019 18:14:02 -0700
Date: Wed, 17 Jul 2019 09:13:37 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190717011337.GA14233@richard>
References: <20190430034412.12935-1-richardw.yang@linux.intel.com>
 <20190430034412.12935-3-richardw.yang@linux.intel.com>
 <20190514142108.GG2753@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514142108.GG2753@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH 2/3] migration/ram.c: start of
 cpu_physical_memory_sync_dirty_bitmap is always 0
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: pbonzini@redhat.com, quintela@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 14, 2019 at 03:21:08PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> Since start of cpu_physical_memory_sync_dirty_bitmap is always 0, we can
>> remove this parameter and simplify the calculation a bit.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>So I think you're right it's currently unused; however, lets ask
>Paolo: Do we need to keep this parameter for flexiblity?
>

Hey, Paolo

Do you have some spare time to give some insight?

>Dave
>
>> ---
>>  include/exec/ram_addr.h | 15 ++++++---------
>>  migration/ram.c         |  2 +-
>>  2 files changed, 7 insertions(+), 10 deletions(-)
>> 
>> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
>> index 9ecd911c3e..3dfb2d52fb 100644
>> --- a/include/exec/ram_addr.h
>> +++ b/include/exec/ram_addr.h
>> @@ -409,18 +409,16 @@ static inline void cpu_physical_memory_clear_dirty_range(ram_addr_t start,
>>  
>>  static inline
>>  uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>> -                                               ram_addr_t start,
>>                                                 ram_addr_t length,
>>                                                 uint64_t *real_dirty_pages)
>>  {
>>      ram_addr_t addr;
>> -    unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
>> +    unsigned long word = BIT_WORD(rb->offset >> TARGET_PAGE_BITS);
>>      uint64_t num_dirty = 0;
>>      unsigned long *dest = rb->bmap;
>>  
>> -    /* start address and length is aligned at the start of a word? */
>> -    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) ==
>> -         (start + rb->offset) &&
>> +    /* offset and length is aligned at the start of a word? */
>> +    if (((word * BITS_PER_LONG) << TARGET_PAGE_BITS) == (rb->offset) &&
>>          !(length & ((BITS_PER_LONG << TARGET_PAGE_BITS) - 1))) {
>>          int k;
>>          int nr = BITS_TO_LONGS(length >> TARGET_PAGE_BITS);
>> @@ -428,14 +426,13 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>>          unsigned long idx = (word * BITS_PER_LONG) / DIRTY_MEMORY_BLOCK_SIZE;
>>          unsigned long offset = BIT_WORD((word * BITS_PER_LONG) %
>>                                          DIRTY_MEMORY_BLOCK_SIZE);
>> -        unsigned long page = BIT_WORD(start >> TARGET_PAGE_BITS);
>>  
>>          rcu_read_lock();
>>  
>>          src = atomic_rcu_read(
>>                  &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
>>  
>> -        for (k = page; k < page + nr; k++) {
>> +        for (k = 0; k < nr; k++) {
>>              if (src[idx][offset]) {
>>                  unsigned long bits = atomic_xchg(&src[idx][offset], 0);
>>                  unsigned long new_dirty;
>> @@ -458,11 +455,11 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
>>  
>>          for (addr = 0; addr < length; addr += TARGET_PAGE_SIZE) {
>>              if (cpu_physical_memory_test_and_clear_dirty(
>> -                        start + addr + offset,
>> +                        addr + offset,
>>                          TARGET_PAGE_SIZE,
>>                          DIRTY_MEMORY_MIGRATION)) {
>>                  *real_dirty_pages += 1;
>> -                long k = (start + addr) >> TARGET_PAGE_BITS;
>> +                long k = addr >> TARGET_PAGE_BITS;
>>                  if (!test_and_set_bit(k, dest)) {
>>                      num_dirty++;
>>                  }
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 9948b2d021..1def8122e9 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1646,7 +1646,7 @@ static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
>>                                          ram_addr_t length)
>>  {
>>      rs->migration_dirty_pages +=
>> -        cpu_physical_memory_sync_dirty_bitmap(rb, 0, length,
>> +        cpu_physical_memory_sync_dirty_bitmap(rb, length,
>>                                                &rs->num_dirty_pages_period);
>>  }
>>  
>> -- 
>> 2.19.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

