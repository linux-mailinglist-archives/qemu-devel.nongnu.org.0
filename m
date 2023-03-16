Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69726BD5C3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqWa-0002NH-Cp; Thu, 16 Mar 2023 12:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcqWY-0002N8-L7
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:32:18 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcqWW-00031s-CH
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:32:18 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2131662pjg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678984335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BR5cYteMHMyVXMkWJhzVdgdo1pWwkQMpOSUA94gptRg=;
 b=iqEAA3LXKFqQuwu0wD/yb4NFIGtRVRR2BiLfnykmk/5aqrehXhjngE799UE3wQREee
 kHolmyB27KvV/EuBwRISSaYwyd5TA+C83zprf/gkzdwQ/JjVVrHk9MsuCJ/50zXegCRF
 pypWP8U/+oANN30dLORxKH4HtJ/JeNlThdaQ7BED/CJyp2PEYnJliHMuH0yBSRO8RitX
 jlT4y5tqL0gMt3+aFGNnT+cGqymoGxwySlzkkzpefxqHKGyqLEP5jC6y1oo0YyH4HB2v
 DpHKfQakd8cx4ONrMGgzsBQvdSMDVOKl2oUT5+am/CxcB5b9x45Ph8XOaUtEHxiPThrs
 PGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678984335;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BR5cYteMHMyVXMkWJhzVdgdo1pWwkQMpOSUA94gptRg=;
 b=CP74lnDfU5+RIYFmmuFQOiMrPTGWq1Aho838LHccB2pOaauG4aIhNYoL7hIq797G/x
 Uov/TXA+UCRVVJvvkCVXOHrqpFSW7hGyl489d9/tcFMgjJzOKDZL69dAuTCPaRUW6gWl
 ELoZyx2J3aDbI8r+6/QCE8XEqF6nwxwAS7Qzi9LJKHBKUb7ud17aVu+Oc244rEuIduSJ
 UWXrINsqPGEwUClJIBp9C7owdWkXD6vS3zB5Rw7qWtpUoeZeDRkW3WIUslnnxd907glG
 0PbXoOjiMZm5oGZRHjum30MiXIGh+EafgAAkdcVSy5VO3o50DdCcUrBndlAcbA4LZQ91
 OraA==
X-Gm-Message-State: AO0yUKX4Z9ukLaSKbGVXOfa2i8ubYApnkWySsIkUIlFfKiLteJ3V16A+
 RPbzJ2+eftdTvsqUvOLKG97W+Q==
X-Google-Smtp-Source: AK7set+k9uIeLemOttYSNJaaxZTLn7HIq4ISUw2tn3p+WVjFgk3nAzbDzguxxHWIz2c1jdIHTebp3g==
X-Received: by 2002:a17:90a:158f:b0:237:3f83:61f3 with SMTP id
 m15-20020a17090a158f00b002373f8361f3mr5000840pja.16.1678984334884; 
 Thu, 16 Mar 2023 09:32:14 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a17090a8a8a00b00230b8431323sm3477621pjn.30.2023.03.16.09.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:32:14 -0700 (PDT)
Message-ID: <1c3d5711-bae8-5f63-04e5-4f0ffb92f8ce@daynix.com>
Date: Fri, 17 Mar 2023 01:32:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v2] memory: Prevent recursive memory access
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230316122430.10529-1-akihiko.odaki@daynix.com>
 <20230316161551.syvpnl5czkn4nbv2@mozz.bu.edu>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230316161551.syvpnl5czkn4nbv2@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/03/17 1:15, Alexander Bulekov wrote:
> On 230316 2124, Akihiko Odaki wrote:
>> A guest may request ask a memory-mapped device to perform DMA. If the
>> address specified for DMA is the device performing DMA, it will create
>> recursion. It is very unlikely that device implementations are prepared
>> for such an abnormal access, which can result in unpredictable behavior.
>>
>> In particular, such a recursion breaks e1000e, a network device. If
>> the device is configured to write the received packet to the register
>> to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
>> This causes use-after-free since the Rx logic is not re-entrant.
>>
>> As there should be no valid reason to perform recursive memory access,
>> check for recursion before accessing memory-mapped device.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Hi Akihiko,
> I think the spirit of this is similar to the fix I proposed here:
> https://lore.kernel.org/qemu-devel/20230313082417.827484-1-alxndr@bu.edu/
> 
> My version also addresses the following case, which we have found
> instances of:
> Device Foo Bottom Half -> DMA write to Device Foo Memory Region
> 
> That said, the patch is held up on some corner cases and it seems it
> will not make it into 8.0. I guess we can add #1543 to the list of
> issues in https://gitlab.com/qemu-project/qemu/-/issues/556

The e1000e bug is certainly covered by your fix. It is nice that it also 
covers the case of DMA from bottom half. I hope it will land soon in the 
next version.

Regards,
Akihiko Odaki

> 
> Thanks
> -Alex
> 
>> ---
>>   softmmu/memory.c | 79 +++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 62 insertions(+), 17 deletions(-)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 4699ba55ec..19c60ee1f0 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -50,6 +50,10 @@ static QTAILQ_HEAD(, AddressSpace) address_spaces
>>   
>>   static GHashTable *flat_views;
>>   
>> +static const Object **accessed_region_owners;
>> +static size_t accessed_region_owners_capacity;
>> +static size_t accessed_region_owners_num;
>> +
>>   typedef struct AddrRange AddrRange;
>>   
>>   /*
>> @@ -1394,6 +1398,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>           return false;
>>       }
>>   
>> +    for (size_t i = 0; i < accessed_region_owners_num; i++) {
>> +        if (accessed_region_owners[i] == mr->owner) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
>> +                          ", size %u, region '%s', reason: recursive access\n",
>> +                          is_write ? "write" : "read",
>> +                          addr, size, memory_region_name(mr));
>> +            return false;
>> +        }
>> +    }
>> +
>>       /* Treat zero as compatibility all valid */
>>       if (!mr->ops->valid.max_access_size) {
>>           return true;
>> @@ -1413,6 +1427,34 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>       return true;
>>   }
>>   
>> +static bool memory_region_access_start(MemoryRegion *mr,
>> +                                       hwaddr addr,
>> +                                       unsigned size,
>> +                                       bool is_write,
>> +                                       MemTxAttrs attrs)
>> +{
>> +    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
>> +        return false;
>> +    }
>> +
>> +    accessed_region_owners_num++;
>> +    if (accessed_region_owners_num > accessed_region_owners_capacity) {
>> +        accessed_region_owners_capacity = accessed_region_owners_num;
>> +        accessed_region_owners = g_realloc_n(accessed_region_owners,
>> +                                             accessed_region_owners_capacity,
>> +                                             sizeof(*accessed_region_owners));
>> +    }
>> +
>> +    accessed_region_owners[accessed_region_owners_num - 1] = mr->owner;
>> +
>> +    return true;
>> +}
>> +
>> +static void memory_region_access_end(void)
>> +{
>> +    accessed_region_owners_num--;
>> +}
>> +
>>   static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
>>                                                   hwaddr addr,
>>                                                   uint64_t *pval,
>> @@ -1450,12 +1492,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>>                                              mr->alias_offset + addr,
>>                                              pval, op, attrs);
>>       }
>> -    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>> +    if (!memory_region_access_start(mr, addr, size, false, attrs)) {
>>           *pval = unassigned_mem_read(mr, addr, size);
>>           return MEMTX_DECODE_ERROR;
>>       }
>>   
>>       r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
>> +    memory_region_access_end();
>>       adjust_endianness(mr, pval, op);
>>       return r;
>>   }
>> @@ -1493,13 +1536,14 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>>                                            MemTxAttrs attrs)
>>   {
>>       unsigned size = memop_size(op);
>> +    MemTxResult result;
>>   
>>       if (mr->alias) {
>>           return memory_region_dispatch_write(mr->alias,
>>                                               mr->alias_offset + addr,
>>                                               data, op, attrs);
>>       }
>> -    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>> +    if (!memory_region_access_start(mr, addr, size, true, attrs)) {
>>           unassigned_mem_write(mr, addr, data, size);
>>           return MEMTX_DECODE_ERROR;
>>       }
>> @@ -1508,23 +1552,24 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>>   
>>       if ((!kvm_eventfds_enabled()) &&
>>           memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)) {
>> -        return MEMTX_OK;
>> -    }
>> -
>> -    if (mr->ops->write) {
>> -        return access_with_adjusted_size(addr, &data, size,
>> -                                         mr->ops->impl.min_access_size,
>> -                                         mr->ops->impl.max_access_size,
>> -                                         memory_region_write_accessor, mr,
>> -                                         attrs);
>> +        result = MEMTX_OK;
>> +    } else if (mr->ops->write) {
>> +        result = access_with_adjusted_size(addr, &data, size,
>> +                                           mr->ops->impl.min_access_size,
>> +                                           mr->ops->impl.max_access_size,
>> +                                           memory_region_write_accessor, mr,
>> +                                           attrs);
>>       } else {
>> -        return
>> -            access_with_adjusted_size(addr, &data, size,
>> -                                      mr->ops->impl.min_access_size,
>> -                                      mr->ops->impl.max_access_size,
>> -                                      memory_region_write_with_attrs_accessor,
>> -                                      mr, attrs);
>> +        result = access_with_adjusted_size(addr, &data, size,
>> +                                           mr->ops->impl.min_access_size,
>> +                                           mr->ops->impl.max_access_size,
>> +                                           memory_region_write_with_attrs_accessor,
>> +                                           mr, attrs);
>>       }
>> +
>> +    memory_region_access_end();
>> +
>> +    return result;
>>   }
>>   
>>   void memory_region_init_io(MemoryRegion *mr,
>> -- 
>> 2.39.2
>>

