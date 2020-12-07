Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632492D1683
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:41:51 +0100 (CET)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJaA-0001U4-Fu
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJYp-0000Ww-SD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmJYn-0008CB-TS
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8a008QTy2tMLSDVNhZPhYQ57UrVFTV5hQjWSzq7DO2w=;
 b=iqcL9VNHjfF+srbGRM7zKMdEySibiZ/KDoBT/5PAEjuv5TSHH/LSnBSYzmiVuf2VuxxNff
 lhKLYQaS2KV9ABPS2X8NDk6u0NkRuQfbbYOM8HlstQ1s5PCUSEXmgeYNPTiQReNy/s2bAK
 wHFVok+mocvwibaqWWqP+uMw5lM33EQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-x7vr0NlXMYq9G-Njj7v6tA-1; Mon, 07 Dec 2020 11:40:23 -0500
X-MC-Unique: x7vr0NlXMYq9G-Njj7v6tA-1
Received: by mail-ed1-f70.google.com with SMTP id e11so5117031edn.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8a008QTy2tMLSDVNhZPhYQ57UrVFTV5hQjWSzq7DO2w=;
 b=kD/vuvgvIw3GmYb0vH8cXpamJnUWCQjYUIU4r+laZ9hOjzzQcWOdznpy5Lp1C0rPKQ
 9WemXlxK1IpACZq75LWrXmCZ+9svb5v28AWNU/ot4M3P8glGq+mQv8e7aVguy4SJBGqI
 BjKQrZH3cSOKdzHfKoi/WrAmGbwA9j8HW2HI5+gIXPusdojto+1S8EK2yRqHnuv3JjGC
 H7UqmtUHNM8iD61hBYEaDNRUDS2favmeHIW6Nd4FqzEvrjaWw0CtOR6ZP7FjCMEiTGg1
 7jzaXWyp/1fq/dJZAIr3+z5cjZA/u2nMVE51lFqVuVFB/A6+Jn5MHLuYH7mjilu657kr
 Ahrg==
X-Gm-Message-State: AOAM533xGmKedsW5ynR423kum26otgPmXo1XUOi90T57PAKbxxRXYzBQ
 UfzdOm2Fc8OO+7wclstqT8mPzEBFLO+R/RrKTmVTw61slWfKT9vkWCFYLUVcebvnMI+KqEvBX0f
 8Zykh7XXaLNUmbQJb9AdeciCGQfzqHFjoNZHri9Oya8NoX5hthQWXe2EnbEU6if0j4vc=
X-Received: by 2002:a50:f404:: with SMTP id r4mr20797304edm.62.1607359221953; 
 Mon, 07 Dec 2020 08:40:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0cCEd/2zHQFALfQaKKXu8eMACc+RZXG+8vLDaYVW/lC0Cx1yMuuRUxTDr5LDSJP/CIAWYwQ==
X-Received: by 2002:a50:f404:: with SMTP id r4mr20797281edm.62.1607359221605; 
 Mon, 07 Dec 2020 08:40:21 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id ef11sm366107ejb.15.2020.12.07.08.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 08:40:20 -0800 (PST)
Subject: Re: [PATCH 13/15] memory: allow creating MemoryRegions before
 accelerators
To: Igor Mammedov <imammedo@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-14-pbonzini@redhat.com>
 <20201207173843.4cc85ead@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6ad0a3e8-f5e5-616d-8ad7-5a1e3fce4ab4@redhat.com>
Date: Mon, 7 Dec 2020 17:40:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207173843.4cc85ead@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 17:38, Igor Mammedov wrote:
> On Wed,  2 Dec 2020 03:18:52 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Compute the DIRTY_MEMORY_CODE bit in memory_region_get_dirty_log_mask
>> instead of memory_region_init_*.  This makes it possible to allocate
>> memory backend objects at any time.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   softmmu/memory.c | 12 ++++++------
>>   softmmu/vl.c     |  6 +-----
>>   2 files changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 11ca94d037..89a4723fe5 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1548,7 +1548,6 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
>>       mr->terminates = true;
>>       mr->destructor = memory_region_destructor_ram;
>>       mr->ram_block = qemu_ram_alloc(size, share, mr, &err);
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>>       if (err) {
>>           mr->size = int128_zero();
>>           object_unparent(OBJECT(mr));
>> @@ -1573,7 +1572,6 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
>>       mr->destructor = memory_region_destructor_ram;
>>       mr->ram_block = qemu_ram_alloc_resizeable(size, max_size, resized,
>>                                                 mr, &err);
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>>       if (err) {
>>           mr->size = int128_zero();
>>           object_unparent(OBJECT(mr));
>> @@ -1598,7 +1596,6 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>>       mr->destructor = memory_region_destructor_ram;
>>       mr->align = align;
>>       mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>>       if (err) {
>>           mr->size = int128_zero();
>>           object_unparent(OBJECT(mr));
>> @@ -1622,7 +1619,6 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>>       mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
>>                                              share ? RAM_SHARED : 0,
>>                                              fd, &err);
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>>       if (err) {
>>           mr->size = int128_zero();
>>           object_unparent(OBJECT(mr));
>> @@ -1641,7 +1637,6 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
>>       mr->ram = true;
>>       mr->terminates = true;
>>       mr->destructor = memory_region_destructor_ram;
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>>   
>>       /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
>>       assert(ptr != NULL);
>> @@ -1661,7 +1656,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion *mr,
>>       mr->ops = &ram_device_mem_ops;
>>       mr->opaque = mr;
>>       mr->destructor = memory_region_destructor_ram;
>> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>> +
>>       /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
>>       assert(ptr != NULL);
>>       mr->ram_block = qemu_ram_alloc_from_ptr(size, ptr, mr, &error_fatal);
>> @@ -1819,6 +1814,11 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>>                                memory_region_is_iommu(mr))) {
>>           mask |= (1 << DIRTY_MEMORY_MIGRATION);
>>       }
>> +
>> +    if (tcg_enabled() && rb) {
>> +        /* TCG only cares about dirty memory logging for RAM, not IOMMU.  */
>> +        mask |= (1 << DIRTY_MEMORY_CODE);
>> +    }
>>       return mask;
>>   }
> 
> Is following also necessary?:
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 11ca94d037..f1de42e50f 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2033,7 +2033,8 @@ void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>       }
>   
>       memory_region_transaction_begin();
> -    mr->dirty_log_mask = (mr->dirty_log_mask & ~mask) | (log * mask);
> +    mr->dirty_log_mask = (memory_region_get_dirty_log_mask(mr) & ~mask) |
> +                         (log * mask);
>       memory_region_update_pending |= mr->enabled;
>       memory_region_transaction_commit();
>   }

No, 1 << DIRTY_MEMORY_CODE moves altogether from mr->dirty_log_mask to 
being only in the return value of memory_region_get_dirty_log_mask.

Paolo

>>   
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 0f63d80472..023c16245b 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1715,11 +1715,7 @@ static bool object_create_early(const char *type, QemuOpts *opts)
>>           return false;
>>       }
>>   
>> -    /* Memory allocation by backends needs to be done
>> -     * after configure_accelerator() (due to the tcg_enabled()
>> -     * checks at memory_region_init_*()).
>> -     *
>> -     * Also, allocation of large amounts of memory may delay
>> +    /* Allocation of large amounts of memory may delay
>>        * chardev initialization for too long, and trigger timeouts
>>        * on software that waits for a monitor socket to be created
>>        * (e.g. libvirt).
> 


