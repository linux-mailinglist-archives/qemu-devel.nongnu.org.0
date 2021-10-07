Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7B4251B8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:06:33 +0200 (CEST)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYREO-0004PD-S5
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR9D-0001Y8-Pf
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR99-0005Wr-I9
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7iG1UaCoRCicHddKhyThZv/CeQ+GpQGfxwHHQsF/og=;
 b=brBxyE/aKGOZ8LmMtTZh/om7mq/7a7450RFThD87YNT/lLZ8aEJlEfJAKW1Z3n0fdHBP53
 3vuFabobTovM9klRhYEXyzWRxAE9T5ftvD0g5rw6R4BpgioKR3VQtqElu4vPCptcSz8Nx8
 QuaZP1SYaitfAfO/HgHS8RmrqDvWiU4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-3JoQj-dINY2IXfV2vljDqQ-1; Thu, 07 Oct 2021 07:01:05 -0400
X-MC-Unique: 3JoQj-dINY2IXfV2vljDqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so4372923wrd.8
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x7iG1UaCoRCicHddKhyThZv/CeQ+GpQGfxwHHQsF/og=;
 b=lfpKmuD1SQzLAw3Flecl3B75Cu30K2BTQCsyK2K7L9YeL+1+8SbNLMMRXdxlO9INNc
 E22Ayd0HeU/IrYO9xaTJDfYltcZUhLB5Zn6tTpmP8DnBvilQAGdCfWUOt+h/fr27IhL0
 X5+Z4CCJrfMiBYc3YA+aTitF71RUu8Ca4SdnTyHAI7P3CT/X/t/lSl5dQHOSQK3D/yDF
 YrHWqrGqTNBaB/ZVHzsKsU2n3T8GVKrZo8zzfD4jWKcOm5XxNpGrZ4goQupLhl3kHlaH
 1YcuL8/iluTSaH9qIW92f2V30F8Bgo39OfeBSBMmYknnsreEw8QbIDPPQTCkLxQaHBoN
 yCyQ==
X-Gm-Message-State: AOAM532WbQfMnZedFoAyWybIJuXOQcS7Q0dtfhlQvY933oA0Vz+fvhMA
 VAmADQVmZgCFqw1kQxXZFWItEJBH2Zl73Um0kJMEFSNNalkADILoueMHeTid+R7xixP8FCsrFvo
 kOUPrsqeg9xCZhBA=
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr11670248wmq.158.1633604464407; 
 Thu, 07 Oct 2021 04:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7/glcljHXumljuI4fXM8rfQCUooU3lmCqTMvxkJbLp5hzQow6iewzVj7Ix/qVizGT/YNPzw==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr11670215wmq.158.1633604464128; 
 Thu, 07 Oct 2021 04:01:04 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id p3sm10685134wrs.10.2021.10.07.04.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:01:03 -0700 (PDT)
Message-ID: <3b7a39e2-079f-0d01-2f51-612fcc823b8a@redhat.com>
Date: Thu, 7 Oct 2021 13:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <871r4yf9eh.fsf@linaro.org> <0ae79bf2-4e97-07b6-2197-9b264d07f86c@redhat.com>
 <9b4ea846-5178-387f-cd0b-cd6e4ebcab7f@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <9b4ea846-5178-387f-cd0b-cd6e4ebcab7f@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 12:12, Damien Hedde wrote:
> 
> 
> On 10/7/21 09:54, Philippe Mathieu-Daudé wrote:
>> On 10/6/21 17:40, Alex Bennée wrote:
>>>
>>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>>
>>>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>>>> Right now, we cannot load some binary file if it is bigger than the
>>>>>> machine's ram size. This limitation only occurs when loading a
>>>>>> binary file: we can load a corresponding elf file without this
>>>>>> limitation.
>>>>>>
>>>>>> This is an issue for machines that have small ram or do not use the
>>>>>> ram_size feature at all.
>>>>>>
>>>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>>>> to access `current_machine`.
>>>>>>
>>>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>>> ---
>>>>>>
>>>>>> Hi Alistair,
>>>>>>
>>>>>> I found this while experimenting with a ram_size=0 machine.
>>>>
>>>>
>>>>
>>>>> Where are you loading your file?
>>>>>
>>>>
>>>> In a rom.
>>>>
>>>> The loader does not check at all that we are loading to the machine's
>>>> ram. It just check the size for the raw binary file format.
>>>
>>> It does beg the question of why you don't just construct your ROM file
>>> with the image in place there? Is this just a development convenience?
>>
>> generic-loader is designed from a CPU perspective, it uses the CPU AS
>> to load the image.
>>
>> If your image is in ROM, I'm not sure this is the correct API. I'd try
>> to do this without considering any CPU in the picture. The rom_add_*()
>> API might be more appropriate.
>>
>> My 2 cents anyway...
>>
> 
> I was looking for a user way of loading data in a memory-mapped area so
> I cannot use rom_add_*().
> I though the loader goal was to load something to any memory. But maybe
> I am mistaken.

I don't think you are mistaken, you likely found a design limitation
with this device, which isn't as generic as it aims to be.


