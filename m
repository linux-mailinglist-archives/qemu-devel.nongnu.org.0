Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2119E214907
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 00:19:58 +0200 (CEST)
Received: from localhost ([::1]:52074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrqVo-0002EJ-V5
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 18:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrqUz-0001kv-2n; Sat, 04 Jul 2020 18:19:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrqUw-00051y-VV; Sat, 04 Jul 2020 18:19:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id f2so8672403wrp.7;
 Sat, 04 Jul 2020 15:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KC62DkERR09rcGBxS6XRkIe9GC4PZTgpnyp2SaNfAtY=;
 b=BldKxee71ZMJ3//NUOKSzXfLMFEkRTJLM2n14zBGPyxt9sns6gZ39gTy2Hhba1uBRS
 kbrX7Mwtp3ntD5JADc9XC9i0GKIY38Tkv/+HFjvtoHUc4rnMCYkcvvnOy0Srv2ehwgrP
 xByOChNRRAMrR3M/yV7oHcaEWLqF4LSI5/cNpsx3IRTsKMafYcMIForw9r6UISDkbi2U
 oaynhw0Rri8OeuY4nwOIPT7fw1DfLpdZZZ1hIBINMk9YCgj8P7PtZpoAJWRh30HYFqG1
 99nF3gnhSNufGx0ScVeVMm79IJK9GZtre9NwnIB3yTHtdNHqePtYvNKCNHcr0rRYK43z
 /63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KC62DkERR09rcGBxS6XRkIe9GC4PZTgpnyp2SaNfAtY=;
 b=S5yMe18Wx9MqPLNKl79G1FJJfaKhUtVMgI8aZmztZt4bnxye2kFu/P7LMZLtpAnMtq
 e7FWQBLojHaGad+w/ZuUG5dyXFPlIqqo2gDEMHbVDImt81ZlzzF/9lrrgAs924QIYMg9
 PWz3imiACHh6ThDumfhxl0ms79hzHlmIgiYbphASD6bj0xQ5y0K0OicoFfXv5leG5Tq+
 I3GCJikcoV7rx0pDzKDku7Y7XoxwrtGuoZGoVbv08OWkwa25WmTCvkpHwWD36ABprVBx
 ghez2rLnx4T5mAPO2TsNlZsLI5yZmVzF86Q2jG6KNGEhUy2PLcdasUr3GxtV/sU23h1Q
 k/pg==
X-Gm-Message-State: AOAM530pIQq8mJikdPRu2XHjLzQSFtb7A/ocgsGhgvWK9jxOphmlkGhX
 2AQe/bGhrObj4U2c0DSPaKU=
X-Google-Smtp-Source: ABdhPJxmJ9SNv/DYkRzZzWQZ3xrnhLffdQKQeyQhvmNwRw2YOFRntiZLnt+xMXuKHwGdRM9YunCREQ==
X-Received: by 2002:adf:e684:: with SMTP id r4mr42408398wrm.68.1593901140856; 
 Sat, 04 Jul 2020 15:19:00 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v15sm248922wmh.24.2020.07.04.15.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 15:19:00 -0700 (PDT)
Subject: Re: [PATCH v7 09/17] hw/sd/sdcard: Special case the -ENOMEDIUM error
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200630133912.9428-1-f4bug@amsat.org>
 <20200630133912.9428-10-f4bug@amsat.org>
 <CAFEAcA_dhbr6cjK40H0=e39sD2r8ERTZYrY5nhJtx81Rk+RmUg@mail.gmail.com>
 <2c77e134-4762-89b2-b60d-aabde740f25f@amsat.org>
 <2a6b8801-038e-d67c-6d96-a3df526c44a0@amsat.org>
 <c016b643-3f5b-9064-3d86-639ec1497e88@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ef59cd7-c137-9d0d-135f-c8a9ae3d8d0a@amsat.org>
Date: Sun, 5 Jul 2020 00:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c016b643-3f5b-9064-3d86-639ec1497e88@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Cedric Le Goater <clg@fr.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/20 12:10 AM, Philippe Mathieu-Daudé wrote:
> On 7/4/20 1:42 AM, Philippe Mathieu-Daudé wrote:
>> On 7/3/20 5:16 PM, Philippe Mathieu-Daudé wrote:
>>> On 7/3/20 3:23 PM, Peter Maydell wrote:
>>>> On Tue, 30 Jun 2020 at 14:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>
>>>>> As we have no interest in the underlying block geometry,
>>>>> directly call blk_getlength(). We have to care about machines
>>>>> creating SD card with not drive attached (probably incorrect
>>>>> API use). Simply emit a warning when such Frankenstein cards
>>>>> of zero size are reset.
>>>>
>>>> Which machines create SD cards without a backing block device?
>>>
>>> The Aspeed machines:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg718116.html
> 
> Also all boards using:
> 
> hw/sd/milkymist-memcard.c:278:    /* FIXME use a qdev drive property
> instead of drive_get_next() */
> hw/sd/pl181.c:506:    /* FIXME use a qdev drive property instead of
> drive_get_next() */
> hw/sd/ssi-sd.c:253:    /* FIXME use a qdev drive property instead of
> drive_get_next() */
> 
> I.e.:
> 
> static void pl181_realize(DeviceState *dev, Error **errp)
> {
>     PL181State *s = PL181(dev);
>     DriveInfo *dinfo;
> 
>     /* FIXME use a qdev drive property instead of drive_get_next() */
>     dinfo = drive_get_next(IF_SD);
>     s->card = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false);
>     if (s->card == NULL) {
>         error_setg(errp, "sd_init failed");
>     }
> }

Doh I was pretty sure this series was merged:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg514645.html

Time to respin I guess, addressing your comment...
https://www.mail-archive.com/qemu-devel@nongnu.org/msg515866.html

> 
>>>
>>>> I have a feeling that also the monitor "change" and "eject"
>>>> commands can remove the backing block device from the SD card
>>>> object.
>>>
>>> This is what I wanted to talk about on IRC. This seems wrong to me,
>>> we should eject the card and destroy it, and recreate a new card
>>> when plugging in another backing block device.
>>>
>>> Keep the reparenting on the bus layer, not on the card.
>>
>> I was wrong, the current code is correct:
>>
>> void sdbus_reparent_card(SDBus *from, SDBus *to)
>> {
>>     SDState *card = get_card(from);
>>     SDCardClass *sc;
>>     bool readonly;
>>
>>     /* We directly reparent the card object rather than implementing this
>>      * as a hotpluggable connection because we don't want to expose SD cards
>>      * to users as being hotpluggable, and we can get away with it in this
>>      * limited use case. This could perhaps be implemented more cleanly in
>>      * future by adding support to the hotplug infrastructure for "device
>>      * can be hotplugged only via code, not by user".
>>      */
>>
>>     if (!card) {
>>         return;
>>     }
>>
>>     sc = SD_CARD_GET_CLASS(card);
>>     readonly = sc->get_readonly(card);
>>
>>     sdbus_set_inserted(from, false);
>>     qdev_set_parent_bus(DEVICE(card), &to->qbus);
>>     sdbus_set_inserted(to, true);
>>     sdbus_set_readonly(to, readonly);
>> }
>>
>> What I don't understand is why create a sdcard with no block backend.
>>
>> Maybe this is old code before the null-co block backend existed? I
>> haven't checked the git history yet.
>>
>> I'll try to restrict sdcard with only block backend and see if
>> something break (I doubt) at least it simplifies the code.
>> But I need to update the Aspeed machines first.
>>
>> The problem when not using block backend, is the size is 0,
>> so the next patch abort in sd_reset() due to:
>>
>>   static uint64_t sd_addr_to_wpnum(SDState *sd, uint64_t addr)
>>   {
>>       assert(addr < sd->size);
>>
> 
> 

