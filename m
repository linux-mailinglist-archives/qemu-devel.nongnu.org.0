Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F196A381A49
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:51:09 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyRQ-0005Rl-0g
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhyFd-00038e-GL; Sat, 15 May 2021 13:38:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhyFZ-0006uf-BX; Sat, 15 May 2021 13:38:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id z130so1294877wmg.2;
 Sat, 15 May 2021 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vousw1dWTiNV6D7JpiA2fwEK0fd2emLobvU8k1bzkvs=;
 b=ADBqQywaOptHd7yt+zB9w4McwEt978q81W1f/BWZUWnaY+Jo8bwkidEjiH94/DUt8l
 AANvixLvDQVPT02AW6lCHVNjque3ANmQhfpiCiLjR8azVwtr7RPQ5/EfZAgh3zFi5U9x
 XWm2Yz/uIH30UHcG1CNqFsqggQlKVVHtIdQ8OHB3yI7+RPDlIaw8coekWyVEPvI/N+E/
 /rrGWlPhNQ1GgN0CYHZs7zBpfESJrgunOlfZs4GBOX8tNcVJDiqXXQEZHoSBKnHMiMSr
 WWPjOWV2cnYIFMVIU6keqy9wyo5x0AbiFP9kNzE1er96QScD61ONVYgsFUTt6SCI1EgI
 hO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vousw1dWTiNV6D7JpiA2fwEK0fd2emLobvU8k1bzkvs=;
 b=AP/Zn2lYZcUwjXZcr3RikduN3xl0kDR76Oeq1ObX376MwBRIKZOtGo9qjVWfUXWXjW
 iuVBkrfQ43PSFHhEc4jbaOraBcqTw13iJJhJx1kLzLtQejJFjF0U0w72VnGU+a4q3wnF
 OiG0Bdo9hn9K2ZiZxysqRjfPTA/yH1ievJmqEK4rhBxy7VO0BZEvDFCv6Nlpl2/5Gu+7
 /ImVxpf6H8wviMXGwiwAPb3BIRqfBooSOr73BQzr5ltv9Gt/fWTtJWJC5AmVeP+oRzBt
 ke/OfasIlIz62lbQjlqGKMVdSRc1rPHX256yw5D/I6M7M6/8t3upcrQBrHm2lTwCFuaO
 4Gqw==
X-Gm-Message-State: AOAM5311AKly8lXwugiLHvUe880jgd5ZQwHM/BWpk0ulBR0LPFh1z8ap
 nOUrxu3lo2viT9eHEQCjYEk=
X-Google-Smtp-Source: ABdhPJxSauUzWib+lGXSrf3nlAhbzsHyWENNWmFe0oKDovn6BuG0eJna8RHV4YSLtxsgUuKy4tc1LQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr56628167wmj.84.1621100331075; 
 Sat, 15 May 2021 10:38:51 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o15sm9957567wru.42.2021.05.15.10.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:38:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
 <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
 <211f4a16-a521-512c-ff52-aabf7a5f13@eik.bme.hu>
 <5d38775e-d2a7-6ae1-2483-8516e8b0c6c3@amsat.org>
 <1ebcddfc-6986-84b4-7264-a6a95e1aa9e4@eik.bme.hu>
 <d806256f-36b3-e012-3087-6dba1b910e8a@amsat.org>
 <bd9a3731-1721-2d66-ddb5-547d6eac65a0@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c3f36b44-ccff-f685-a439-7bb58f4b1d0f@amsat.org>
Date: Sat, 15 May 2021 19:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bd9a3731-1721-2d66-ddb5-547d6eac65a0@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/21 4:37 PM, BALATON Zoltan wrote:
> On Thu, 13 May 2021, Philippe Mathieu-Daudé wrote:
>> On 5/13/21 1:54 PM, BALATON Zoltan wrote:
>>> On Thu, 13 May 2021, Philippe Mathieu-Daudé wrote:
>>>> On 5/11/21 3:09 PM, BALATON Zoltan wrote:
>>>>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Zoltan,
>>>>>>
>>>>>> On 5/11/21 1:28 PM, BALATON Zoltan wrote:
>>>>>>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>>>>>>> The motivation behind this series is to remove the
>>>>>>>> isa_get_irq(NULL) call to simplify the ISA generic model.
>>>>>>>>
>>>>>>>> Since v1:
>>>>>>>> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504
>>>>>>>
>>>>>>> I'll try to have a look at these later but some notes: The pegasos2
>>>>>>> changes are now in master so if this was before that maybe
>>>>>>> rebasing on
>>>>>>> master is now enough.
>>>>>>
>>>>>> This is what this series does, simply rebase on top of your merged
>>>>>> patches.
>>>>>>
>>>>>>> However I wonder if any changes to pegasos2.c is
>>>>>>> needed due to changed init of the chip model or is that only
>>>>>>> affecting
>>>>>>> 82c686b?
>>>>>>
>>>>>> There is no change in 'init' in this series, it is only QOM
>>>>>> boilerplate
>>>>>> code churn, no logical change intended.
>>>>>>
>>>>>>> Please also note that pegasos2 is not enabled by default due to
>>>>>>> needing undistributable firmware ROM so to test it you need to
>>>>>>> enable it
>>>>>>> in default-configs/devices/ppc-softmmu.mak
>>>>>>
>>>>>> I remember you said you were mostly interested in the VT8231, not
>>>>>> the VT82C686. This series only QOM'ify the latter.
>>>>>
>>>>> OK as I said I haven't looked at it in detail.
>>>>>
>>>>>> What is your idea? Send the firmware off-list and explain how
>>>>>> the OS works and how (what) to test?
>>>>>
>>>>> I've already sent you this info:
>>>>>
>>>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html
>>>>
>>>> Well, if you have everything setup, it is easier to test and send
>>>> a Tested-by tag.
>>>
>>> I indend to test it when I'll have some time but I could not get to
>>> it yet.
>>>
>>>>> but I can't write a test case so if you want to automate this and make
>>>>> it part of QEMU tests then some help with that would be appreciated.
>>>>
>>>> You are not the only want wanting that. I'm working on a solution to
>>>> run
>>>> such tests (depending on binary blobs) in your own namespace, but it
>>>> will take me time (doing it in my free time, without help).
>>>
>>> I did not mean to say you should do this urgently, just sent this as a
>>> reminder about how this could be tested in case you forgot because
>>> you've asked about testing.
>>
>> Unrelated to this series, with master (dab59ce0312) I sometime get:
>>
>> Initializing KBD...00000012                               FAILED.
>>
>> and then the mouse isn't working.
>>
>> Sometimes:
>>
>> Initializing KBD...                                       Done.
>>
>> and the mouse is crazy (similar to my host mouse).
>>
>> Anyway, there is smth wrong with patch #2 of this series:
>> "Simplify removing unuseful qemu_allocate_irqs() call".
> 
> As I said before, when I've tried to do it that way first it did not
> work for me so I introduced the indirection which fixed it but I did not
> understand why it was needed or I forgot by now so all I remember is
> that I could not directly connect the irq and needed the local function
> for some reason.

OK, I'll try to figure out what the problem is and come back to you.

Regards,

Phil.

