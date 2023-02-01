Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5A68701D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK5U-0002BP-U8; Wed, 01 Feb 2023 15:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK5R-0002BA-Sl
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK5P-0007t2-Nq
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675284726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uO6ofzuz4o4Lyx3KvA0qX66dPP+4KP6mDyJ8XEo21ko=;
 b=Xkf4vB27ADkD9BiDzNz+v9b9HKsYnVRqv5//FhhSITFP07jGY9H1UWeGnTrBAMDTm1zqU0
 dnhTzw7c0EvW4CiPB+yiBjjKQCgD/tbSAUSvngSNBGNnt3MyJ2xyVoz6yBjGsdOAvJLWua
 s8ixIBQgcmxpbkrWnDf5FQFx896JEy4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-T-aZyehdMweMT-Jfo0gozQ-1; Wed, 01 Feb 2023 15:52:05 -0500
X-MC-Unique: T-aZyehdMweMT-Jfo0gozQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l5-20020a1ced05000000b003db300f2e1cso1569873wmh.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uO6ofzuz4o4Lyx3KvA0qX66dPP+4KP6mDyJ8XEo21ko=;
 b=j+iUS8h+beHgm2H1UcHiTR3ElMFlpQQxNFImhksvexN8TphNNrpCH1K4b89vCyIXg/
 Y3Q6qrdHTfeWumys9NYWXQ+z4+6ruw9HO3xbdsz8B9RU7d82GZGvsrou+/xO2Q81HJRI
 58365Vkbe1HVBddU8biPkxyVxd7izBmX/fMpM6bzBv9FY+p1frK1NwDZmFxgGyj+B920
 KgQabq2MvNnqj7Sf52W/PIneVbR7NI0NV4LQZl7AMRXzBuOLJtyVW6+PnBrqyruOTP7E
 bNwpIl9pRjIz8zdu4IeO6QbtzSgewYw7hd6iFiPVndFEo61SJO4vnc8cukTw/BBAILn/
 WUvA==
X-Gm-Message-State: AO0yUKWCngZXs7F7Xl9S+1WhkVp5ukU37EWtUwebPATdH9w+Ia/ILCvJ
 zq5CzdDT9Y5tGfdNv9pTH7/ISNUc1Lvo2ssENiXk7zjgiAXYFA1zc0Q/R1Z2mbMrDMOZskGs44u
 LpF3xkkndyYjfvIA=
X-Received: by 2002:a05:6000:102:b0:2bf:abce:ba26 with SMTP id
 o2-20020a056000010200b002bfabceba26mr3549175wrx.71.1675284724115; 
 Wed, 01 Feb 2023 12:52:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+7Xj+qzJXQ6OAo/d2Ac4V1fv3muH5Zoegzj3y1kcguPiLFUghdOYAljzg4BMWpE74Ir5YfVA==
X-Received: by 2002:a05:6000:102:b0:2bf:abce:ba26 with SMTP id
 o2-20020a056000010200b002bfabceba26mr3549159wrx.71.1675284723789; 
 Wed, 01 Feb 2023 12:52:03 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b002bfae3f6802sm18039406wrr.58.2023.02.01.12.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:52:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org,  Bin Meng <bin.meng@windriver.com>,  "Dr. David
 Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 2/2] hw/sd: skip double power-up in
 sd_vmstate_pre_load()
In-Reply-To: <1ddbd1ec-6419-3b73-b913-c0584e041ffe@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 13:38:17
 +0100")
References: <20230120120133.666993-1-dbarboza@ventanamicro.com>
 <20230120120133.666993-3-dbarboza@ventanamicro.com>
 <1ddbd1ec-6419-3b73-b913-c0584e041ffe@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 21:52:02 +0100
Message-ID: <87cz6tun0t.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> +David / Juan / Peter for migration and timers.
>
> On 20/1/23 13:01, Daniel Henrique Barboza wrote:
>> At this moment any migration with the RISC-V sifive_u machine
>> fails with the following error:
>> qemu-system-riscv64: ../hw/sd/sd.c:297: sd_ocr_powerup: Assertion
>> `!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)' failed.
>> The assert was introduced by dd26eb43337a ("hw/sd: model a power-up
>> delay, as a workaround for an EDK2 bug"). It introduced a delayed timer
>> of 0.5ms to power up the card after the first ACMD41 command. The assert
>> prevents the card from being turned on twice.
>> When migrating a machine that uses a sd card, e.g. RISC-V sifive_u,
>> the
>> card is turned on during machine_init() in both source and destination
>> hosts. When the migration stream finishes in the destination, the
>> pre_load() hook will attempt to turn on the card before loading its
>> vmstate. The assert() is always going to hit because the card was
>> already on.
>> Change sd_vmstate_pre_load() to check first if the sd card is turned
>> on
>> before executing a sd_ocr_powerup() and triggering the assert.
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

I have no idea about sd or orc O:-)

>> ---
>>   hw/sd/sd.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index bd88c1a8f0..4add719643 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -664,11 +664,19 @@ static int sd_vmstate_pre_load(void *opaque)
>>   {
>>       SDState *sd =3D opaque;
>>   -    /* If the OCR state is not included (prior versions, or not
>> +    /*
>> +     * If the OCR state is not included (prior versions, or not
>>        * needed), then the OCR must be set as powered up. If the OCR sta=
te
>>        * is included, this will be replaced by the state restore.
>> +     *
>> +     * However, there's a chance that the board will powerup the SD
>> +     * before reaching INMIGRATE state in the destination host.
>> +     * Powering up the SD again in this case will cause an assert
>> +     * inside sd_ocr_powerup(). Skip sd_ocr_powerup() in this case.
>>        */
>> -    sd_ocr_powerup(sd);
>> +    if (!sd_card_powered_up(sd)) {
>> +        sd_ocr_powerup(sd);
>> +    }
>>         return 0;
>>   }

But I agree with David.

You probably should not powerup the machine on the destination host.
But I don't know if that function touches any state of other devices or
if it don't matter at all.


