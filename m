Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7453187CD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:09:52 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8v1-0007oZ-J5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8sl-0006hr-2X
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:07:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8si-0003em-MZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:07:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o10so5683707wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YqgIiEXH5aT46FSJPaetdxnh/EaBH/66TWyeFKYrfeg=;
 b=G3JYjISpBcF6D5/89IHTO+zOPa8bcdE/hF1OZ4t8X7GJQ7/eTBF06u69KKWVCkyctK
 5IkabAOUJAY5uBzdaajLPDL1z5qN+phsm4MoBXLif++XbY9oDWqNkWWI7pyelTXUOThg
 UYMMfg1VS5fd+KIckMOneKIebMZatUsHEgTQQeKcW6h7nPYpWBZGMLDS55kJmlcK9pbo
 cxCjYIpIsflji0fMtfQhxtFsD5vHfTvbhsTfhPdjsMVUrgeu1DNBujcBNFOgmA0uVWis
 qAM3uZ60owv0pwrOK/EpM6VXYM1xtE4LGepJTUXFjLC4OD7uvoKJmdEs1D0GTfpKIt69
 yF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YqgIiEXH5aT46FSJPaetdxnh/EaBH/66TWyeFKYrfeg=;
 b=B0j0I9ag41vwOCMon0mobjFYt9U7ojc536A3dYrnqXBN8irs+JwEIGo6G6F0mL/ndI
 zj3WdI9swuWWhJVwQpvRZab4AAADfmvYva2NiIgmmggFytAZ1uEJh6a/CTculFH0oV0/
 76wkW3upCudvyKqYo+l9rqS3tO2wGhH8BvOCvSWIi2rQcXggrDfKkdYok7klXJTCyFa7
 uyFPOnJBOIN/cK3kGKI6vMtWrWijlMPPHrfBF0VhweuZraQcVRaygY4LvVHRpn6AwJ+Q
 YcHQ4d0Es1niQngsZWn5pCqpNieA0cQS4kXGsGJ+HLqba0qL7X+/0Wlxlwey/pwY0GbX
 IEXQ==
X-Gm-Message-State: AOAM5333hVv8jahuX/cIgUuzO6N+XsXs/YfcqwKYeR/cf1hjARB/LvUF
 34VUecF4VA+Ld/NUdSkEk7s=
X-Google-Smtp-Source: ABdhPJwYtjseiYJN9w7VCbmW1ARMY8b7wkhuFcWi69MgICkPU86IEJ4CQk+swUUF94JtIGVHYzG8ww==
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr4584390wmc.187.1613038046449; 
 Thu, 11 Feb 2021 02:07:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z6sm8662434wmi.39.2021.02.11.02.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:07:26 -0800 (PST)
Subject: Re: [PATCH v2 10/42] esp: introduce esp_get_stc()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-11-mark.cave-ayland@ilande.co.uk>
 <6e1d5061-422e-797e-f96f-d0e78890fde2@amsat.org>
 <7315a388-e038-7a57-08a2-a2152fa7a6b2@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42c31664-cdda-9aac-ac00-04d731a585d9@amsat.org>
Date: Thu, 11 Feb 2021 11:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7315a388-e038-7a57-08a2-a2152fa7a6b2@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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

On 2/11/21 8:53 AM, Mark Cave-Ayland wrote:
> On 10/02/2021 22:33, Philippe Mathieu-Daudé wrote:
> 
>> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>>> This simplifies reading the STC register value without having to
>>> manually shift
>>> each individual 8-bit value.
>>
>> If possible repeat the subject so the sentence is easier to understand.
> 
> I've always read commit messages as summary followed detail, so I've
> tended to avoid repetition if the context is obvious from the summary (a
> quick glance through my inbox suggest that quite a few authors also do
> the same).

Not because other do it means it is a good practice ;)

I suppose it depends on personal review workflow and email client used
or gitk layout. In the one I use the commit description is displayed
first, so I have to look elsewhere to prepend the patch subject which
is using another font.
I'm using Thunderbird on Fedora and X1 carbon but had to do some config
change in the default config because the font was too small, unreadable,
then I added some 1.5x zoom factor. It always looked ugly. Apparently
checking that again it seems the Fedora I used was not supporting these
now displays well but now it should work OK, but I'm still using this
old config. Well, my bad. Not in mood to reinstall. Forget my comment
about having "atomic" commit descriptions then.

> 
> Perhaps adding in the word "function" would help readability here, e.g.
> "This function simplifies reading the STC register value..."?

Sounds better to me :)

> 
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/scsi/esp.c | 15 ++++++++++++---
>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> 
> ATB,
> 
> Mark.
> 

