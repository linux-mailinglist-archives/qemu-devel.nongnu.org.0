Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFF3CFB0F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:46:24 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q4l-0007I0-P8
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5q3e-0006OO-FY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5q3c-0005cG-O5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+GtEclaWbL5+VIU0xv0SknMWZ3EmtsrHIfX2bhoQdI=;
 b=FQPsQwnj2FOYeC928zdilhVCIkDiD1wekpd3fDrTKqI4+ofZbnvo8DKXrU4CZ5lDg8BmEt
 FCSdJPdPV8Tz3ppNJDulxR1foWM5K8Yzx1j+8exIPy/ZVzclhrW5s5m/r1tUS36WuOoQYE
 93oYws8ROkUGfLed28oYfilfTNmEN4k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-DJBYztXdNVyxSUzDgxIV-A-1; Tue, 20 Jul 2021 09:45:10 -0400
X-MC-Unique: DJBYztXdNVyxSUzDgxIV-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 r6-20020a0560000146b0290150e4a5e7e0so2673888wrx.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=s+GtEclaWbL5+VIU0xv0SknMWZ3EmtsrHIfX2bhoQdI=;
 b=lEWeAZhufKj947zQCcwZqz/9lWkqvqbQS91TPoIOergtWG1+L+wCHEjVUTuFqitcN5
 U4cKUIN8WuksuykqvJi8MuYK3s+pjfCz9V2Gl5a8RK8nYb3efKlPKm8AoUwo9d7ELLsm
 lldwzl7VATCUlY3e/HVc0q0QIgOv05km/xE6y10G7nqhBMoYI7h6jFJr4AS3Rg5CbCZx
 5eEEwsqtHdsYoUTa5Kg4JjJL/Pzkc3VVmYwD2yk0rtPEEfGHH1+f9jLJaJU5BG6E1ILn
 VYjPWJcXhkAq99AYQ6EA9BIWlblAB6K3T3vw476qG14/WBlIlmt6CzIejQC8Tu/9fdpU
 iuTA==
X-Gm-Message-State: AOAM5309qYmOUMy1jb64t6o+eMe0GPtVdFixTvbKmk9tXKn2L4RrktY3
 /UeU93u7d+OJfYgyWODjKaIFNJKVJqmiynsZiVSvUHdUaTDDweBhMEVjzbMaTl/a2ykcd0Nt3lA
 ROrJuPipW+1HOY80=
X-Received: by 2002:a05:600c:ad6:: with SMTP id
 c22mr37938452wmr.149.1626788709244; 
 Tue, 20 Jul 2021 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe5Jhje+E+FQoj7hIY9hxyBmypGOjLITSeVSsJvRudaKWr1jFCyzDNFoI9xtgAEOecDQxDCA==
X-Received: by 2002:a05:600c:ad6:: with SMTP id
 c22mr37938421wmr.149.1626788708984; 
 Tue, 20 Jul 2021 06:45:08 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id s17sm24348509wrv.2.2021.07.20.06.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:45:08 -0700 (PDT)
Subject: Re: [PATCH resend v2 2/5] softmmu/memory_mapping: reuse
 qemu_get_guest_simple_memory_mapping()
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-3-david@redhat.com>
 <d06fe923-2223-df86-ada8-aadf002a39cf@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3e9f2f66-f706-8f59-e672-1f6935f14756@redhat.com>
Date: Tue, 20 Jul 2021 15:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d06fe923-2223-df86-ada8-aadf002a39cf@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 15:37, Stefan Berger wrote:
> 
> On 7/20/21 9:03 AM, David Hildenbrand wrote:
>> Let's reuse qemu_get_guest_simple_memory_mapping(), which does exactly
>> what we want.
>>
>> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Alex Williamson <alex.williamson@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Claudio Fontana <cfontana@suse.de>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Laurent Vivier <lvivier@redhat.com>
>> Cc: Stefan Berger <stefanb@linux.ibm.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    softmmu/memory_mapping.c | 8 +-------
>>    1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
>> index e7af276546..d63f896b30 100644
>> --- a/softmmu/memory_mapping.c
>> +++ b/softmmu/memory_mapping.c
>> @@ -288,8 +288,6 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
>>                                       Error **errp)
>>    {
>>        CPUState *cpu, *first_paging_enabled_cpu;
>> -    GuestPhysBlock *block;
>> -    ram_addr_t offset, length;
>>    
>>        first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
>>        if (first_paging_enabled_cpu) {
>> @@ -309,11 +307,7 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
>>         * If the guest doesn't use paging, the virtual address is equal to physical
>>         * address.
>>         */
>> -    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
>> -        offset = block->target_start;
>> -        length = block->target_end - block->target_start;
>> -        create_new_memory_mapping(list, offset, offset, length);
>> -    }
>> +    qemu_get_guest_simple_memory_mapping(list, guest_phys_blocks);
>>    }
> 
> I thought I'd find a 1:1 replacement for the above here:
> 
> void qemu_get_guest_simple_memory_mapping(MemoryMappingList *list,
>                                      const GuestPhysBlockList
> *guest_phys_blocks)
> {
>       GuestPhysBlock *block;
> 
>       QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
>           create_new_memory_mapping(list, block->target_start, 0,
>                                     block->target_end - block->target_start);
>       }
> }
> 
> But this is calling create_new_memory_mapping() with a different 3rd
> parameter:   0 vs. offset.

Oh, thanks for noticing! Will drop this patch then -- thanks!


-- 
Thanks,

David / dhildenb


