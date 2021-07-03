Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B363BA922
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 17:06:03 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzhDW-0006m3-TQ
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 11:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhBz-0004gn-1k
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:04:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzhBw-0003iY-8G
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 11:04:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id f14so15855861wrs.6
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mtoVpCN/CKXv9MqETdz56QCO3EYs0sZeRBFr3oBXE5o=;
 b=nLR5Z1JBRkYjsRj6SjKehUs3XPwPurjvAgp7n3tzAzNUhI5hM+t7GZsHewdUgYPsXh
 /7qUtUurJtRrRMeHQSx/Z5XyAx3FoVXqjHRPsfXkSKn4JZGHdVqNfvDFnwZ3UyUGe5eJ
 MuXCOmEMPB/wusnbVOIwDUqYZZOTUw881aDC3iATaVc9dvjpVCf/AYU8GHREwojT4iUL
 t2LuS9+39pJ8LnqBUK3vOM2ofGc6mveFKjujhnBw+VijjHJzF6vPa7t2JX6FyIFx9Wou
 xvu7fuQwE472/zYqC+4UpgifdUcw5+2pkiaV+pEpPs2T2NVcyQAA/YYX2tB2ms9Kmg0g
 xfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mtoVpCN/CKXv9MqETdz56QCO3EYs0sZeRBFr3oBXE5o=;
 b=Xmvd8wUAEQzFgbS23fsq1+ghPegBB0B6I9jybFHEaKNExKvUJ/hLjDO3+A+SCGjlZB
 ixrQp3lRv10co9MCYS9fGLdvpUx2C1Z7kvWCeUK0JnAfTy2IwdTLIKacb5TPp19E5kFk
 SrwyTd6HwvCeaXGL+m3V4Mg+Z0xhPVmzqhXnkVuuUnrKiSoWJq06EqXgAJ760dFitujl
 gIS43k+b1wp38kKIgL8R/LZ7xcVttqNirpRk8G5R8/g6Tk0LKfz723HTbQEuEqCrreRa
 taiaoBVYq+2WzqSF+3/n9w3mYD7gP+8jGjZIUUZ8GJygTq+Lkfg9P6ZAFf6ETG3bcUd8
 FX9Q==
X-Gm-Message-State: AOAM531CGgSFhTFcvGgZ4zmgCfJq7uE9zYwWpB2jGRjWy5TtZfLUcpev
 +pLzzkEv7KKVwsTEbgY+ZY4=
X-Google-Smtp-Source: ABdhPJzLU8kjxn0kSl+fz3NlvIExsPWAUHJ4+EISF+ji//EwQ50WZk3KLQIwrQ4vgoRrpyEU6ymODw==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr5661125wri.252.1625324662779; 
 Sat, 03 Jul 2021 08:04:22 -0700 (PDT)
Received: from [192.168.43.238] (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id r3sm3970190wrz.89.2021.07.03.08.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 08:04:22 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
 <218f0930-e860-bcca-c5b4-8d807f7ab760@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14d03fcc-8a8a-acea-a6bb-9c8816bbde5c@amsat.org>
Date: Sat, 3 Jul 2021 17:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <218f0930-e860-bcca-c5b4-8d807f7ab760@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 5:00 PM, Mark Cave-Ayland wrote:
> On 03/07/2021 15:19, Philippe Mathieu-Daudé wrote:
> 
>> Instead of accessing N registers via a single address_space API
>> call using a temporary buffer (stored in the device state) and
>> updating each register, move the address_space call in the
>> register put/get. The load/store and word size checks are moved
>> to put/get too. This simplifies a bit, making the code easier
>> to read.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/net/dp8393x.c | 157 ++++++++++++++++++-----------------------------
>>   1 file changed, 60 insertions(+), 97 deletions(-)
>>
>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>> index bbe241ef9db..db9cfd786f5 100644
>> --- a/hw/net/dp8393x.c
>> +++ b/hw/net/dp8393x.c
>> @@ -162,7 +162,6 @@ struct dp8393xState {
>>         /* Temporaries */
>>       uint8_t tx_buffer[0x10000];
>> -    uint16_t data[12];
>>       int loopback_packet;
>>         /* Memory access */

> This seems like a nice tidy-up. I'll need a bit of time to give some
> more R-b and T-b tags since MacOS is running on a very diverged branch,
> so I'll need to pick through and update the changes to run across all my
> test images accordingly.

No hurry.

> With this patch is it now possible to remove s->data completely?

First line remove it ;) (It was not part of the migration stream).

