Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEA6BF83D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 07:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdPhQ-00031o-OK; Sat, 18 Mar 2023 02:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdPh7-000308-LE
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 02:05:38 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdPh5-0005ao-0L
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 02:05:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so7429450pjp.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679119529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bnkYWVD6KHJVndNjBEYuBge2ZTEEmmRCp+k1GGFqPpY=;
 b=P+cFTGZoi2TXEEptZg2EPpc/iY8tC7/Dqj9+6/XK+HlAk5CDATEQTIQwwBHO3cuRW3
 C8jC8fZHcEVXam/Fvh6RrVa00TrK5fqZnUyWSPNZndT4VQ6DHEsqDIkW38RCCo7SKx5i
 UvJRxA1XC/NYRQwhZmWfZnCGD50xfmQe+nzTx0XNb4sdoBXxRmSrCXqM+XzncArI1ijB
 YulNsOriq7neJ73H1j2fwcmpVmR9I+D/5dzOgCVpfY5W/2np7VVw+Ca/KILmPJBKjqbP
 IzdvbaGcKkhfUJYTdIFdB+ViPXGZeGv2jig2XvTmglu7kr4bxwvXDYtjdGUPv6Ly+dpW
 PU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679119529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bnkYWVD6KHJVndNjBEYuBge2ZTEEmmRCp+k1GGFqPpY=;
 b=YxZ5EMCl8n1JieUsbg0mJU/zSTKmVrV8RJS01gK9G3ixOVdSQxQqVSnnijC7BzPA+d
 jQBR7Fn6BsWKuqKP6st6mV+hV23xRDiB+12UKvW43czn/jiVRNhej3hfFUUlXneG9roo
 0/fKkTFntJRrRo6g9Iqt+osvO8M1ln0o2nF+E8HDASqx7sio2nil4kJhRwlR9Oa3+6iC
 fxJpGqu/QR5YF/cYZV4F80caENZlK07ED0at4PDDAXdv+WM5YnMGqv5piYouIAYBUH0C
 tAshx4cPuIICIOQVYNsba8NtZ9gCUQZjHLAFlOMwhKxWkQUzfsv0DHCd4/rCNOZghLeg
 /Yxw==
X-Gm-Message-State: AO0yUKWSFAqDnHw59Ouv8z+oyBBzJH7Bn1Rurfh9cDFSty1fxlkjFmXa
 AKXZnHz9spHZ7LYi47s2oyWLrw==
X-Google-Smtp-Source: AK7set97lBXA8+F3L99vqoCSHJF6c5iE0Aug1WFHbClMqqyZTCoYgn7dqTjed60dAyTmCijvC7JlIw==
X-Received: by 2002:a17:902:e749:b0:1a0:45f6:d7ce with SMTP id
 p9-20020a170902e74900b001a045f6d7cemr10956185plf.32.1679119529270; 
 Fri, 17 Mar 2023 23:05:29 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a170902934700b001994a0f3380sm2445610plp.265.2023.03.17.23.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 23:05:28 -0700 (PDT)
Message-ID: <29d71180-b9b3-e670-f25c-978d4d0b5491@daynix.com>
Date: Sat, 18 Mar 2023 15:05:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v3] memory: Prevent recursive memory access
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230316162044.31607-1-akihiko.odaki@daynix.com>
 <03a56c04-8afd-d4eb-b117-34698eb19484@kaod.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <03a56c04-8afd-d4eb-b117-34698eb19484@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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

On 2023/03/18 1:25, Cédric Le Goater wrote:
> Hello,
> 
> On 3/16/23 17:20, Akihiko Odaki wrote:
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
>> ---
>> V1 -> V2: Marked the variable thread-local. Introduced linked list.
>>
>>   softmmu/memory.c | 81 ++++++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 64 insertions(+), 17 deletions(-)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 4699ba55ec..6be33a9e3e 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -61,6 +61,15 @@ struct AddrRange {
>>       Int128 size;
>>   };
>> +typedef struct AccessedRegion AccessedRegion;
>> +
>> +struct AccessedRegion {
>> +    const Object *owner;
>> +    const AccessedRegion *next;
>> +};
>> +
>> +static __thread const AccessedRegion *accessed_region;
>> +
>>   static AddrRange addrrange_make(Int128 start, Int128 size)
>>   {
>>       return (AddrRange) { start, size };
>> @@ -1394,6 +1403,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>           return false;
>>       }
>> +    for (const AccessedRegion *ar = accessed_region; ar; ar = 
>> ar->next) {
>> +        if (ar->owner == mr->owner) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" 
>> HWADDR_PRIX
>> +                          ", size %u, region '%s', reason: recursive 
>> access\n",
>> +                          is_write ? "write" : "read",
>> +                          addr, size, memory_region_name(mr));
>> +            return false;
>> +        }
>> +    }
>> +
>>       /* Treat zero as compatibility all valid */
>>       if (!mr->ops->valid.max_access_size) {
>>           return true;
>> @@ -1413,6 +1432,29 @@ bool memory_region_access_valid(MemoryRegion *mr,
>>       return true;
>>   }
>> +static bool memory_region_access_start(MemoryRegion *mr,
>> +                                       hwaddr addr,
>> +                                       unsigned size,
>> +                                       bool is_write,
>> +                                       MemTxAttrs attrs,
>> +                                       AccessedRegion *ar)
>> +{
>> +    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
>> +        return false;
>> +    }
>> +
>> +    ar->owner = mr->owner;
>> +    ar->next = accessed_region;
>> +    accessed_region = ar->next;
> 
> Isn't 'accessed_region' always NULL ?
> 
>> +
>> +    return true;
>> +}
>> +
>> +static void memory_region_access_end(void)
>> +{
>> +    accessed_region = accessed_region->next;
>> +}
> and so, this is a segv.
> 
> Thanks,
> 
> C.

It was intended to be: accessed_region = ar;

Anyway, I'm no longer pushing this forward as there is a better alternative:
https://lore.kernel.org/qemu-devel/20230313082417.827484-1-alxndr@bu.edu/

This can detect a re-entrancy problem involving bottom half API, and 
disable the check where re-entrancy is allowed.

Regards,
Akihiko Odaki

