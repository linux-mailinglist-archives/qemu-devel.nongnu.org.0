Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD63B6E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:12:55 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly7vS-0001e6-RL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly7uA-0000wH-4I
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ly7u8-0002dz-9f
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624950690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCzcrBEMhtae1uIRFIRIwb7UduC+zPk9RQSuONyeDeU=;
 b=Redj6vd/PZvU/VitNn9TA9/HfQWBxWOm634Fyxw7/CTeEDbQpoH98v927BcHgfNSHldAYU
 g3j1JurKd9k+gRPFVQpK/7TCY1set5VIGP0iqtYdg1ooTccRblyxV154v8AM6kOj1DjYOt
 Q8yooMyPQfsrxeDgGsldrqr5bUqWz/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-LVta5VXmMzKqgVS92fk8_g-1; Tue, 29 Jun 2021 03:11:29 -0400
X-MC-Unique: LVta5VXmMzKqgVS92fk8_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so809132wru.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 00:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dCzcrBEMhtae1uIRFIRIwb7UduC+zPk9RQSuONyeDeU=;
 b=mN3LrETxPX4r3tIxC3wGCgwEQWfAaOJJQjqnRC8yN+JNFTYfsp0GeRUvAZPWOIwMxl
 tZDTyeiB/2FyJjhFJQCrGRH3DQT8i0XQJ5oU5tzlkMRVbftJ3mtejMjSCpgwenjJQ8mj
 SDQNpxDhZcNqyCxTBevPhz6rlm0yGaLsJMvK+IL34NHwA/WsAW5OfDDr+Ar0ETVhTjCg
 MOa+8ED2b2Z4Z8hwsGhTERJS/wc70DMM8fvF8W2BsNsMOiqV7G7hE9eXDeRI1pZWTTli
 3Dimu+JRroKGlP5H0ngUdMNXrr03B9AI9tgVFBMCz6BmX8GJdLLmmvd5vmL5YcuOO+Fi
 ju5w==
X-Gm-Message-State: AOAM532aXEKie2gr7LxrdE0X7KM8+T8ZE8xDGRud0dgxj6tCainHszO4
 yqd4KiqTHN1ZN+uPxu1NUJLArb/7aU5OtEVPKCMAsVsKRuewqT56djNNYFdQuYOTnUWEU47dowh
 /6RwSI0PJpXga63Q=
X-Received: by 2002:a5d:564c:: with SMTP id j12mr32122828wrw.37.1624950688250; 
 Tue, 29 Jun 2021 00:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAYKGaupwV++6q5L5NnrhYIoq2ImdVSohMhoJyq/Etw6IErBQxGNFJx+YoAem1zZomiTigOA==
X-Received: by 2002:a5d:564c:: with SMTP id j12mr32122803wrw.37.1624950688020; 
 Tue, 29 Jun 2021 00:11:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l5sm1742131wmq.9.2021.06.29.00.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:11:27 -0700 (PDT)
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
To: Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
 <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
 <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
 <f6eb39fe-50bd-5fae-99a3-11abd2141fea@amd.com>
 <fd154b04-847a-efbd-7ae6-abc54630ac8f@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0fcb8bf0-f149-e0e6-5dde-8c21df96887c@redhat.com>
Date: Tue, 29 Jun 2021 09:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd154b04-847a-efbd-7ae6-abc54630ac8f@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 7:56 AM, Dov Murik wrote:
> On 29/06/2021 1:03, Tom Lendacky wrote:
>> On 6/22/21 7:58 AM, Dov Murik wrote:
>>> +cc: Tom Lendacky
>>>
>>> On 22/06/2021 15:47, Philippe Mathieu-Daudé wrote:
>>>> On 6/22/21 2:44 PM, Dov Murik wrote:
>>>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>> ---
>>>>>  hw/i386/pc_sysfw.c | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>>>>> index 6ce37a2b05..e8d20cb83f 100644
>>>>> --- a/hw/i386/pc_sysfw.c
>>>>> +++ b/hw/i386/pc_sysfw.c
>>>>> @@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>>>>      ovmf_table += tot_len;
>>>>>  }
>>>>>  
>>>>> +/**
>>>>> + * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
>>>>> + * reset vector GUIDed table.
>>>>> + *
>>>>> + * @entry: GUID string of the entry to lookup
>>>>> + * @data: Filled with a pointer to the entry's value (if not NULL)
>>>>> + * @data_len: Filled with the length of the entry's value (if not NULL). Pass
>>>>> + *            NULL here if the length of data is known.
>>>>> + *
>>>>> + * Note that this function must be called after the OVMF table was found and
>>>>> + * copied by pc_system_parse_ovmf_flash().
>>>>
>>>> What about replacing this comment by:
>>>>
>>>>   assert(ovmf_table && ovmf_table_len);
>>>>
>>>
>>> I think this will break things: in target/i386/sev.c we have SEV-ES code
>>> that calls pc_system_ovmf_table_find() and can deal with the case when
>>> there's no OVMF table.  An assert will break it.
>>
>> Right, what would be best is to differentiate between an OVMF table that
>> isn't present in the flash vs the fact that pc_system_parse_ovmf_flash()
>> wasn't called, asserting only on the latter.
>>
> 
> [+cc James who wrote this code]
> 
> 
> Thanks Tom; I agree.  To achieve that, we need one of these:
> 
> (a) add a 'static bool ovmf_table_parsed' which will be set to true at
> the beginning of pc_system_parse_ovmf_flash(). Then, at the beginning of
> pc_system_ovmf_table_find add: assert(ovmf_table_parsed).
> 
> (b) (ab)use our existing ovmf_table_len static variable: initialize it
> to -1 (meaning that we haven't parsed the OVMF flash yet). When looking
> for the table set it to 0 (meaning that OVMF table doesn't exist or is
> invalid). When a proper table is found and copied to ovmf_table, then
> set it to the real length (>= 0). At the beginning of
> pc_system_ovmf_table_find add: assert(ovmf_table_len != -1). (this -1
> can be #define OVMF_FLASH_NOT_PARSED -1).
> 
> 
> Phil, Tom, James: which do you prefer? other options? Rust enum? ;-)

Since we are discussing code that should not be called, I don't have
strong preference as long as we keep the code easy to review :)

With that in mind, (a) seems simpler.

Regards,

Phil.


