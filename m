Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428C3511C2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:18:21 +0200 (CEST)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtT1-0003Ba-Lh
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRtRN-0002YO-Df
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:16:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRtRL-0003Ae-9b
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:16:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j9so1053565wrx.12
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8AvdzUu0nfjpl785PRn7wGCNF0V+8WeLCO4Fzx85K8U=;
 b=BgFU3hOZcBoNQSfEtfUnwXlea2+sxN3gooBdui1pAkmKPzj2/Z0IrkIn3Ajjs+XStv
 /AVQqQb/aFY27ao9+uu6rpADYtJ5YITdAp14a1U/HREtuEPELwc3kHPOyjT5RQdilpKW
 RsEtLUNG/xBMsOBzCk9PcB0VUl1XfalbVw0GHITb6LjEnTQj0EgwndVUQwZyW4nejaam
 s4FsmppnAYiYxOsBNW8aAqXpw2hge+YuxRFnR6eOxAtmQqizn4cqQNyL3fyKn83HL4ya
 Ma0jKEwCSFWC+/OkbdyyQtROqIyUVSBdVI4EktFd+fnk8py7JiwjMoO7I3QBlfSBNl7H
 NELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8AvdzUu0nfjpl785PRn7wGCNF0V+8WeLCO4Fzx85K8U=;
 b=i6NevLRskQTtv2dGk7h6HHnpvqel8RGjuOPqnTeoTUzY5X+Y+j19hPhAOftHfifpYN
 +gxk8zvoR9dXfk3gc+BWsBseAe4ns+IDZILReh1J5ihpxJ7qnpEn4PxZXuDwxq+LCqI6
 IPaHK4NCHX5kE38riv1iOIV65h6+dJmtnYipQSqbe/5pTvPHgtGv+TXNnIQriqcW2QJh
 EuRf6+e6e9x3xBZ6XLYNb/745vAHYB5WgZ+RlGD09LXkrdMlaWgFRiHc6nIp2DkEQktc
 3OtkM8gNKhsdhWxT66esSFlQR/1Vsn/A2F03BTXkOl8+Wj0DQShgtxO0Qu+BhIQ9emLv
 rokA==
X-Gm-Message-State: AOAM533y+G533WCVUXhmptds6WKWMVuU2PCkEWxAVEriCrD96ayaecgR
 9jnW5ZQefDNL+Fk+5ZWY7i0=
X-Google-Smtp-Source: ABdhPJx61eeo6IkfkMlLVbC1naTT7SS01QNX0KEHuGi8AyLTPghyS8WFh2AVBw1CUezrpBlY0c5t2w==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr8254912wru.127.1617268592607; 
 Thu, 01 Apr 2021 02:16:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f4sm9082415wrz.4.2021.04.01.02.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:16:31 -0700 (PDT)
Subject: Re: [PATCH v3 03/11] esp: consolidate esp_cmdfifo_push() into
 esp_fifo_push()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-4-mark.cave-ayland@ilande.co.uk>
 <bc8795c0-4fc6-a923-0458-f2ac0feb590c@amsat.org>
 <0629537e-f168-020b-7252-8e59028c62b3@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ea6f7f62-3e9a-cbcd-4e6d-7c7b791874ed@amsat.org>
Date: Thu, 1 Apr 2021 11:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0629537e-f168-020b-7252-8e59028c62b3@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 10:50 AM, Mark Cave-Ayland wrote:
> On 01/04/2021 09:15, Philippe Mathieu-Daudé wrote:
> 
>> On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
>>> Each FIFO currently has its own push functions with the only
>>> difference being
>>> the capacity check. The original reason for this was that the fifo8
>>> implementation doesn't have a formal API for retrieving the FIFO
>>> capacity,
>>> however there are multiple examples within QEMU where the capacity
>>> field is
>>> accessed directly.
>>
>> So the Fifo8 API is not complete / practical.
> 
> I guess it depends what you consider to be public and private to Fifo8:
> what is arguably missing is something like:
> 
> int fifo8_capacity(Fifo8 *fifo)
> {
>     return fifo->capacity;
> }
> 
> But given that most other users access fifo->capacity directly then I
> might as well do the same and save myself requiring 2 separate
> implementations of esp_fifo_pop_buf() :)

Sorry, I should have been more explicit by precising this was not
a comment directed to your patch, but I was thinking loudly about
the Fifo8 API; and as you mentioned the other models do that so your
kludge is acceptable.
>>> Change esp_fifo_push() to access the FIFO capacity directly and then
>>> consolidate
>>> esp_cmdfifo_push() into esp_fifo_push().
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp.c | 27 ++++++++-------------------
>>>   1 file changed, 8 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>>> index 26fe1dcb9d..16aaf8be93 100644
>>> --- a/hw/scsi/esp.c
>>> +++ b/hw/scsi/esp.c
>>> @@ -98,16 +98,15 @@ void esp_request_cancelled(SCSIRequest *req)
>>>       }
>>>   }
>>>   -static void esp_fifo_push(ESPState *s, uint8_t val)
>>> +static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
>>>   {
>>> -    if (fifo8_num_used(&s->fifo) == ESP_FIFO_SZ) {
>>> +    if (fifo8_num_used(fifo) == fifo->capacity) {
>>>           trace_esp_error_fifo_overrun();
>>>           return;
>>>       }
>>>   -    fifo8_push(&s->fifo, val);
>>> +    fifo8_push(fifo, val);
>>>   }
>>> -
>>
>> Spurious line removal?
> 
> Ooops yes. I'm not too worried about this, but if Paolo has any other
> changes then I can roll this into a v4.

Actually it reappears in patch 05/11 ;)

