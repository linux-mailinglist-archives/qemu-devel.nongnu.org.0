Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3668DE08
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQxC-000171-KB; Tue, 07 Feb 2023 11:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPQx8-000155-Gx
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:36:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPQx6-0000Er-Kk
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:36:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A6903745720;
 Tue,  7 Feb 2023 17:33:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 64C06745712; Tue,  7 Feb 2023 17:33:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 639877456E3;
 Tue,  7 Feb 2023 17:33:43 +0100 (CET)
Date: Tue, 7 Feb 2023 17:33:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
cc: philmd@linaro.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
In-Reply-To: <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
Message-ID: <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023, BALATON Zoltan wrote:
> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>> Currently -d guest_errors enables logging of different invalid actions
>> by the guest such as misusing hardware, accessing missing features or
>> invalid memory areas. The memory access logging can be quite verbose
>> which obscures the other messages enabled by this debug switch so
>> separate it by adding a new -d memaccess option to make it possible to
>> control it independently of other guest error logs.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Ping? Could somebody review and pick it up please?

Ping?

Regards,
BALATON Zoltan

>> ---
>> include/qemu/log.h | 1 +
>> softmmu/memory.c   | 6 +++---
>> softmmu/physmem.c  | 2 +-
>> util/log.c         | 2 ++
>> 4 files changed, 7 insertions(+), 4 deletions(-)
>> 
>> diff --git a/include/qemu/log.h b/include/qemu/log.h
>> index c5643d8dd5..4bf0a65a85 100644
>> --- a/include/qemu/log.h
>> +++ b/include/qemu/log.h
>> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>> /* LOG_STRACE is used for user-mode strace logging. */
>> #define LOG_STRACE         (1 << 19)
>> #define LOG_PER_THREAD     (1 << 20)
>> +#define LOG_MEM_ACCESS     (1 << 21)
>> 
>> /* Lock/unlock output. */
>> 
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 9d64efca26..0a9fa67d32 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1379,7 +1379,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>> {
>>     if (mr->ops->valid.accepts
>>         && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, 
>> attrs)) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" 
>> HWADDR_PRIX
>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>                       ", size %u, region '%s', reason: rejected\n",
>>                       is_write ? "write" : "read",
>>                       addr, size, memory_region_name(mr));
>> @@ -1387,7 +1387,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>     }
>>
>>     if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" 
>> HWADDR_PRIX
>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>                       ", size %u, region '%s', reason: unaligned\n",
>>                       is_write ? "write" : "read",
>>                       addr, size, memory_region_name(mr));
>> @@ -1401,7 +1401,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>
>>     if (size > mr->ops->valid.max_access_size
>>         || size < mr->ops->valid.min_access_size) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" 
>> HWADDR_PRIX
>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>                       ", size %u, region '%s', reason: invalid size "
>>                       "(min:%u max:%u)\n",
>>                       is_write ? "write" : "read",
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index bf585e45a8..bca679ee01 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -2792,7 +2792,7 @@ static bool flatview_access_allowed(MemoryRegion *mr, 
>> MemTxAttrs attrs,
>>     if (memory_region_is_ram(mr)) {
>>         return true;
>>     }
>> -    qemu_log_mask(LOG_GUEST_ERROR,
>> +    qemu_log_mask(LOG_MEM_ACCESS,
>>                   "Invalid access to non-RAM device at "
>>                   "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
>>                   "region '%s'\n", addr, len, memory_region_name(mr));
>> diff --git a/util/log.c b/util/log.c
>> index 7837ff9917..a3c097f320 100644
>> --- a/util/log.c
>> +++ b/util/log.c
>> @@ -495,6 +495,8 @@ const QEMULogItem qemu_log_items[] = {
>>       "log every user-mode syscall, its input, and its result" },
>>     { LOG_PER_THREAD, "tid",
>>       "open a separate log file per thread; filename must contain '%d'" },
>> +    { LOG_MEM_ACCESS, "memaccess",
>> +      "log invalid memory accesses" },
>>     { 0, NULL, NULL },
>> };
>> 
>> 
>
>

