Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777753986F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:52:25 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOU4-0002QI-J1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loORU-0007s2-Nh; Wed, 02 Jun 2021 06:49:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loORS-0005Db-SP; Wed, 02 Jun 2021 06:49:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id u24so2317500edy.11;
 Wed, 02 Jun 2021 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/a/QxillmK8IagSazCnhheRahAu5/+NIpmn3/8xaZvI=;
 b=oC0KXUw+O/pKQnjJ3xe7D+gF5VWnNxMF+klRX2zMRyZE+baJxs9HZkcC3INoNhiUNx
 HZRuhvDTyQqWl7P9gOa1hO9WkQqEBjoGJNy4uUFy461SN8z3B2n02d5FY4qz/R095750
 fybHie4c7eRQrRHnZZC3hhO0qZriQgBWJLMwG7PC9b2G0OVwE2VsSprzIXNV9hVooyao
 3iX6iVB+F4kKMp+w5JWkWWQPq9LKbkV1CYYu+mk+2dzVbFDJ7/otlcWxVCWpYNBOrDst
 TlcEof8K36EOgJdx7bSiwNrFVEY6v2L0zlwvFIresj6rNPMmUA+NoNXMqNyizt9CsTsB
 KXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/a/QxillmK8IagSazCnhheRahAu5/+NIpmn3/8xaZvI=;
 b=MZcBMKQ8Oek/yiGh0W5RzlppbLbtRd7FNAhMDCWBkYDL8a/6blqFLffeGXRS7fxNa7
 ewDQZY9RTEQXVF9YHPOnQ0YPHEcMfo6qBEv5p5lrgemfPy64srEL97w/8udmro3Jv0Ss
 sp/v2qopoL5HLfP3Gu+9Ceuff+KcPjscECko5qlZyV7vDojQgB+B/ZfJIFStZeD42mVE
 lbZgnvGrmzGsOsUTv7GsYNdXvGJC2TrwMeN5N3SGI40nz38cL6kFNzUAPRrlm/qa79dQ
 749hcfIipxLO3tZDfIb9z9RXsjmkXIxz+LIcdlmd7zQ4Vmjj2qidQe5zHOaOS+zvfddY
 e10A==
X-Gm-Message-State: AOAM5325SkMeGgh2QAAUzPrJZGiVKxw6qet8U/OgECSzNjRYb+M2S7Kn
 HpR1RZKH5D9udDoQCdrrFxO/OeNVmHuqkQ==
X-Google-Smtp-Source: ABdhPJy1tu5BvlTmtQrmd3uaSKb+votEfqbTPjh4mwj3aHloeDcOI+djB4uNN12JKHC1fmhlOnAkKA==
X-Received: by 2002:a05:6402:1153:: with SMTP id
 g19mr37537064edw.179.1622630980029; 
 Wed, 02 Jun 2021 03:49:40 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l19sm6579900eja.62.2021.06.02.03.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:49:39 -0700 (PDT)
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
Message-ID: <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
Date: Wed, 2 Jun 2021 12:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>> MemoryRegion names is cached on first call to memory_region_name(),
>> so displaying the name is trace events is cheap. Add it for read /
>> write ops.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  softmmu/memory.c     | 12 ++++++++----
>>  softmmu/trace-events |  4 ++--
>>  2 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 874a8fccdee..d4d9ab8828e 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -444,7 +444,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
>>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
>> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
>> +                                     memory_region_name(mr));
>>      }
>>      memory_region_shift_read_access(value, shift, mask, tmp);
>>      return MEMTX_OK;
>> @@ -466,7 +467,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
>>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
>> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
>> +                                     memory_region_name(mr));
>>      }
>>      memory_region_shift_read_access(value, shift, mask, tmp);
>>      return r;
>> @@ -486,7 +488,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
>>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
>> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
>> +                                      memory_region_name(mr));
>>      }
>>      mr->ops->write(mr->opaque, addr, tmp, size);
>>      return MEMTX_OK;
>> @@ -506,7 +509,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
>>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
>> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
>> +                                      memory_region_name(mr));
>>      }
>>      return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
>>  }
>> diff --git a/softmmu/trace-events b/softmmu/trace-events
>> index b80ca042e1f..359fb37cc8d 100644
>> --- a/softmmu/trace-events
>> +++ b/softmmu/trace-events
>> @@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>>  cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>>  
>>  # memory.c
>> -memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>> -memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>> +memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>> +memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>>
> 

