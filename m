Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C174E6944C4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:42:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRXDI-00008R-MF; Mon, 13 Feb 2023 06:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRXDG-00007u-DH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRXDE-00036p-Fp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676288495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJeYeAbS9Q2gz28RmZeQRr7tOk/WeMHaAGYfvP32YTU=;
 b=dR1pmNBlSNktM6PKmt3P3FZQ+TonIk7Kl4Ec5mfD2yxTCGi+iNmQ1LngFtZ5xA3uqtiFhE
 bfTTpFuiRUrBLH8jiSjTGSA9Zk93PaCAwNnlYkEHb+M9Xcn/hcHtFfGrsK+SSadeq/vBBF
 6hAE1sSDXkcj6gYNXVsKt9X1vorhATw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-R5s9CpRGOyKot2DChmoyYA-1; Mon, 13 Feb 2023 06:41:33 -0500
X-MC-Unique: R5s9CpRGOyKot2DChmoyYA-1
Received: by mail-qt1-f197.google.com with SMTP id
 j26-20020ac84c9a000000b003b9b7c60108so7247675qtv.16
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FJeYeAbS9Q2gz28RmZeQRr7tOk/WeMHaAGYfvP32YTU=;
 b=wk0FibJ4KWx7etI08kcJe9GJOpUxrUieiiauPlOiT0oC8ns1DtPR9c2bMGvnRr8Bp0
 EuFjDHWRw21qF+GSEyk5NvBuJpMFS4poS3lu9jJH23CWXBf9sf7/UPodAdGt5orzc8T8
 tjoH9yyYyHfgDqDg7A4u1SpLr3lPryMz0dLPaHVdXJSbxczOzAf1NXAjHR16zDBaI5Uj
 Iy8A0vIon/aTeovYHQ9S5bNDX/31EzxGNYv61kS2X3ceLZ4nJ0AWsSuMmet2puG3lNfx
 +ED/j1kQk2SixIrMLKUkvsRT7Nb+baO84XbtwUpxheROBspbMzM4dvu40MWrAUleubw0
 t3Cw==
X-Gm-Message-State: AO0yUKUETeSzwmAAEca3BFw07d4mHuzyuEWEIWfR7LqwCqYubORFEQ2Q
 F+ocZyOzL1NzR0wApXm4oSpCdVtoZDxK12zq4S315MnG3LcnczZ5migsAYA1KuwX/6h3SMaoWkU
 19IUy6PqbZi9mB4M=
X-Received: by 2002:a05:6214:2a4e:b0:535:3000:41ad with SMTP id
 jf14-20020a0562142a4e00b00535300041admr45070122qvb.4.1676288493000; 
 Mon, 13 Feb 2023 03:41:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+7Y1moyyI/gavV2eJfWX881u4oN1SyQqX7MmKD8ZuG7lVechqikRLkLA+lDt8HoV4XQu3dlg==
X-Received: by 2002:a05:6214:2a4e:b0:535:3000:41ad with SMTP id
 jf14-20020a0562142a4e00b00535300041admr45070103qvb.4.1676288492778; 
 Mon, 13 Feb 2023 03:41:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 v2-20020a379302000000b007112aa42c4fsm9429016qkd.135.2023.02.13.03.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:41:32 -0800 (PST)
Message-ID: <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com>
Date: Mon, 13 Feb 2023 12:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Cc: philmd@linaro.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/02/2023 17.33, BALATON Zoltan wrote:
> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>> Currently -d guest_errors enables logging of different invalid actions
>>> by the guest such as misusing hardware, accessing missing features or
>>> invalid memory areas. The memory access logging can be quite verbose
>>> which obscures the other messages enabled by this debug switch so
>>> separate it by adding a new -d memaccess option to make it possible to
>>> control it independently of other guest error logs.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> Ping? Could somebody review and pick it up please?
> 
> Ping?

Patch makes sense to me and looks fine, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>

... I think this should go via one of the "Memory API" maintainers branches? 
Paolo? Peter? David?

  Thomas


>>> ---
>>> include/qemu/log.h | 1 +
>>> softmmu/memory.c   | 6 +++---
>>> softmmu/physmem.c  | 2 +-
>>> util/log.c         | 2 ++
>>> 4 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/qemu/log.h b/include/qemu/log.h
>>> index c5643d8dd5..4bf0a65a85 100644
>>> --- a/include/qemu/log.h
>>> +++ b/include/qemu/log.h
>>> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>>> /* LOG_STRACE is used for user-mode strace logging. */
>>> #define LOG_STRACE         (1 << 19)
>>> #define LOG_PER_THREAD     (1 << 20)
>>> +#define LOG_MEM_ACCESS     (1 << 21)
>>>
>>> /* Lock/unlock output. */
>>>
>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>> index 9d64efca26..0a9fa67d32 100644
>>> --- a/softmmu/memory.c
>>> +++ b/softmmu/memory.c
>>> @@ -1379,7 +1379,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>> {
>>>     if (mr->ops->valid.accepts
>>>         && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, 
>>> attrs)) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
>>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>>                       ", size %u, region '%s', reason: rejected\n",
>>>                       is_write ? "write" : "read",
>>>                       addr, size, memory_region_name(mr));
>>> @@ -1387,7 +1387,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>>     }
>>>
>>>     if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
>>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>>                       ", size %u, region '%s', reason: unaligned\n",
>>>                       is_write ? "write" : "read",
>>>                       addr, size, memory_region_name(mr));
>>> @@ -1401,7 +1401,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>>
>>>     if (size > mr->ops->valid.max_access_size
>>>         || size < mr->ops->valid.min_access_size) {
>>> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
>>> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX
>>>                       ", size %u, region '%s', reason: invalid size "
>>>                       "(min:%u max:%u)\n",
>>>                       is_write ? "write" : "read",
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>> index bf585e45a8..bca679ee01 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -2792,7 +2792,7 @@ static bool flatview_access_allowed(MemoryRegion 
>>> *mr, MemTxAttrs attrs,
>>>     if (memory_region_is_ram(mr)) {
>>>         return true;
>>>     }
>>> -    qemu_log_mask(LOG_GUEST_ERROR,
>>> +    qemu_log_mask(LOG_MEM_ACCESS,
>>>                   "Invalid access to non-RAM device at "
>>>                   "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
>>>                   "region '%s'\n", addr, len, memory_region_name(mr));
>>> diff --git a/util/log.c b/util/log.c
>>> index 7837ff9917..a3c097f320 100644
>>> --- a/util/log.c
>>> +++ b/util/log.c
>>> @@ -495,6 +495,8 @@ const QEMULogItem qemu_log_items[] = {
>>>       "log every user-mode syscall, its input, and its result" },
>>>     { LOG_PER_THREAD, "tid",
>>>       "open a separate log file per thread; filename must contain '%d'" },
>>> +    { LOG_MEM_ACCESS, "memaccess",
>>> +      "log invalid memory accesses" },
>>>     { 0, NULL, NULL },
>>> };


