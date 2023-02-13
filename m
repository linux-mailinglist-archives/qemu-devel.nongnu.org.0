Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA35694831
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZvY-0002Di-Fj; Mon, 13 Feb 2023 09:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRZvU-0002DT-NY
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:35:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRZvS-0004Qp-E0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:35:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0600174632B;
 Mon, 13 Feb 2023 15:32:45 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BFD7D746324; Mon, 13 Feb 2023 15:32:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BDDD1746346;
 Mon, 13 Feb 2023 15:32:44 +0100 (CET)
Date: Mon, 13 Feb 2023 15:32:44 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
In-Reply-To: <8a2a0ec1-6708-5126-3007-e4112959fd4a@linaro.org>
Message-ID: <ea34690c-473d-6c78-4ced-7c5a9276ee6d@eik.bme.hu>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <8a2a0ec1-6708-5126-3007-e4112959fd4a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-383534146-1676298764=:50223"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-383534146-1676298764=:50223
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 13 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 19/1/23 22:40, BALATON Zoltan wrote:
>> Currently -d guest_errors enables logging of different invalid actions
>> by the guest such as misusing hardware, accessing missing features or
>> invalid memory areas. The memory access logging can be quite verbose
>> which obscures the other messages enabled by this debug switch so
>> separate it by adding a new -d memaccess option to make it possible to
>> control it independently of other guest error logs.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   include/qemu/log.h | 1 +
>>   softmmu/memory.c   | 6 +++---
>>   softmmu/physmem.c  | 2 +-
>>   util/log.c         | 2 ++
>>   4 files changed, 7 insertions(+), 4 deletions(-)
>> 
>> diff --git a/include/qemu/log.h b/include/qemu/log.h
>> index c5643d8dd5..4bf0a65a85 100644
>> --- a/include/qemu/log.h
>> +++ b/include/qemu/log.h
>> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>>   /* LOG_STRACE is used for user-mode strace logging. */
>>   #define LOG_STRACE         (1 << 19)
>>   #define LOG_PER_THREAD     (1 << 20)
>> +#define LOG_MEM_ACCESS     (1 << 21)
>>     /* Lock/unlock output. */
>>   diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 9d64efca26..0a9fa67d32 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1379,7 +1379,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>   {
>>       if (mr->ops->valid.accepts
>>           && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, 
>> attrs)) {
>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" 
>> HWADDR_PRIX
>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>
> Can we use LOG_GUEST_ERROR|LOG_MEM_ACCESS to keep current behavior?

No, the point is that I don't want the current behaviour getting mem 
access logs when I want to see guest error logs as it's littering the 
output and the real guest error logs are then lost in the lot of 
unintresting mem accesses. You can still use -d guest_errors,memaccess for 
the current behaviour if you prefer that but without this patch I have no 
option for the other behaviour I prefer.

Regards,
BALATON Zoltan
--3866299591-383534146-1676298764=:50223--

