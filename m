Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826F3DDC6E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 17:28:18 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAZrQ-0000a3-Gz
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 11:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAZqM-0007bE-OV
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAZqL-0004w7-7B
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627918024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLbKxwurF9FJZuQUKbCkIrmwT5iIpIwrt4Au3G1KgSo=;
 b=JuCAuMAyxxoOS8gn8b7EYARCVGxcVHPH/90TnOmBkn9KSGUmKurhkquOtF6luOo+VXzMP5
 P17k+SZezbHJAPTfQkldnWJCTgDHmZ6H8W0/7Y9SgSNK+izzlzGL8DMl7Z8Oha+zJj/qpZ
 xb7kI6eZogOzazmtBzhIAlr/89nUiuc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-dkhiTf2CN32CKNi_ZOZcqw-1; Mon, 02 Aug 2021 11:27:03 -0400
X-MC-Unique: dkhiTf2CN32CKNi_ZOZcqw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o11-20020a5d474b0000b02901533f8ed22cso6576412wrs.22
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 08:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zLbKxwurF9FJZuQUKbCkIrmwT5iIpIwrt4Au3G1KgSo=;
 b=tLgsJ7S8fHxO/ZtterNUs+AOLCl9VbqZF/tDTrklvZ2TRszseKcGKr++bz49lyPSO8
 PkCxH83+Mal2hoPkSYRjsukwhSjdZcKRvROTAbCVs7QOhM3awYkl6EIrQVI8VkYLDKfG
 FvdtfhyuRmmjESlII0H4C/VpuejBlSHEbdr/HXN1xJdn2Cx4XVOEEbi51AJaEl6I3+NA
 FRJtY4g748nyw5Qtsj3c6rCTPG3sZVfHHXdZNj/FCfnNCFMAMfO3PbGgBVZWaKcdlOCt
 E35EQfqVzk2VQiiebt+l0FMCMg2ykkUcF446KCdYIb/9XhZlUzQjunNhac5UaMtadjkL
 J+bg==
X-Gm-Message-State: AOAM533h5rpHdu1/pnHkMJ15OweP5e3uuGhTTlojuGPy/GeTM6M69ipn
 BYBm49TaXW5e5E2KuFedCZs7gWxN7jm3N8ndSkF3YTe3UmJXCDnrZv0sYKslco+1O+fsfemQGxo
 S1Zqhi21o7wQvVcE=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr18983934wri.164.1627918022333; 
 Mon, 02 Aug 2021 08:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxEi7PD+GzgePN/MwRjT+9EHrqzE8h1TxB8vbvM8oIRzsWC74jyO3lIxk4OlbWrTC76orAiQ==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr18983920wri.164.1627918022158; 
 Mon, 02 Aug 2021 08:27:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g198sm362450wme.0.2021.08.02.08.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:27:01 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210802152238.10783-1-david@redhat.com>
 <4fb72846-d3ab-9488-a755-de9c6e4cf47c@redhat.com>
Message-ID: <4ed5c12a-539b-9d5e-eefc-447f0dc7f410@redhat.com>
Date: Mon, 2 Aug 2021 17:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4fb72846-d3ab-9488-a755-de9c6e4cf47c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

6.1 material btw.

On 8/2/21 5:26 PM, Philippe Mathieu-Daudé wrote:
> On 8/2/21 5:22 PM, David Hildenbrand wrote:
>> When adding RAM_NORESERVE, we forgot to remove the old assertion when
>> adding the updated one, most probably when reworking the patches or
>> rebasing. We can easily crash QEMU by adding
>>   -object memory-backend-ram,id=mem0,size=500G,reserve=off
>> to the QEMU cmdline:
>>   qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>>   Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>>   == 0' failed.
> 
> Oops.
> 
>> Fix it by removing the old assertion.
>>
>> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> ---
>>  softmmu/physmem.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 3c1912a1a0..2e18947598 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>>      RAMBlock *new_block;
>>      Error *local_err = NULL;
>>  
>> -    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
>>      assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
>>                            RAM_NORESERVE)) == 0);
>>      assert(!host ^ (ram_flags & RAM_PREALLOC));
>>
> 


