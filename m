Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892837F509
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:49:24 +0200 (CEST)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7y7-0006EM-LD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh7vp-0003oU-Jq; Thu, 13 May 2021 05:47:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh7vn-00016P-8c; Thu, 13 May 2021 05:47:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so26289055wrw.8;
 Thu, 13 May 2021 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0dEiuFuYGXnDcMJNa+Obabish7oKVu3rrgiXIk783LQ=;
 b=aybjypKMe2X3dRGzGfKo3n5Ocqecpc8oTZ1ni1Z6Is4ab4Bzek5ibP2Wn61j/z93nu
 r99olkZmK0amKk2Yj48ThRLLeO2EBtKSKk5AcOVZwHSPblC4mS64WRGl76LNECUo00Tz
 LHdLCmWVvTpCDKaGGri8RpKgVw5G4wCtXlm7UVwHuBM+Tdi+Qr2rXHZ++IU5xsNsXR+j
 j/gXVTFp44VDTpon+fuQcBDYcKOkPnv+/eI2Cm8NeYLNY9nJSeOMaWDSjfSC2xKN9ngo
 XEhJ0S7sy1B9VpCMATZPYgx0ozw/bd5lF44kOMsYp0Ii3R5R9RQYRSswnw1NS8KAzA3m
 sU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0dEiuFuYGXnDcMJNa+Obabish7oKVu3rrgiXIk783LQ=;
 b=QGXrrLU8GPoyAddUX+PQtlsqh2fi/YOw4OhVIgqaQDqw0I56g2lT0AX9IRLFv58mI1
 4pF/jDEIZI2YuLJfE3BW0fKALzUqG5km6LAri2XcvPjH13v7SZO2gXEkEr2kAiPZxWAe
 Et9PjYrXbzxWGFIk5MZPGSb/hzxCyPECcBUOPhK22psL4jkmLZ4Pc2W7h2StkOYNQjFb
 ldreo/SsgGhMABIiBE2m/neCH9fzWPKI+MJKCRppuGkulNCvIB72R4eEMNbkfdVtSST0
 RrPoEdXxMyqZ5PZ9PPf2KATieF6d+dp77mXHEefntq49bJ50euIlD662sh7nySEcnoyS
 Ov2g==
X-Gm-Message-State: AOAM532LH+j0vRZgAI9GAdqOBm52/t5gQ3iQCe58Ciu1GzcHsgzWgoRS
 xV+6q9jFXs1MUytYG/azzWY=
X-Google-Smtp-Source: ABdhPJx9kfzqipirBTxxXvJaX/v8Tfo/cR/kC8Izr1sxk5gcWOuTKBbjW2V/HJVKkUMpMlXP/1pgNg==
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr4641447wrw.11.1620899217494; 
 Thu, 13 May 2021 02:46:57 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b10sm2719945wrr.27.2021.05.13.02.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:46:56 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
 <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
 <211f4a16-a521-512c-ff52-aabf7a5f13@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5d38775e-d2a7-6ae1-2483-8516e8b0c6c3@amsat.org>
Date: Thu, 13 May 2021 11:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <211f4a16-a521-512c-ff52-aabf7a5f13@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

On 5/11/21 3:09 PM, BALATON Zoltan wrote:
> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>> Hi Zoltan,
>>
>> On 5/11/21 1:28 PM, BALATON Zoltan wrote:
>>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>>> The motivation behind this series is to remove the
>>>> isa_get_irq(NULL) call to simplify the ISA generic model.
>>>>
>>>> Since v1:
>>>> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504
>>>
>>> I'll try to have a look at these later but some notes: The pegasos2
>>> changes are now in master so if this was before that maybe rebasing on
>>> master is now enough.
>>
>> This is what this series does, simply rebase on top of your merged
>> patches.
>>
>>> However I wonder if any changes to pegasos2.c is
>>> needed due to changed init of the chip model or is that only affecting
>>> 82c686b?
>>
>> There is no change in 'init' in this series, it is only QOM boilerplate
>> code churn, no logical change intended.
>>
>>> Please also note that pegasos2 is not enabled by default due to
>>> needing undistributable firmware ROM so to test it you need to enable it
>>> in default-configs/devices/ppc-softmmu.mak
>>
>> I remember you said you were mostly interested in the VT8231, not
>> the VT82C686. This series only QOM'ify the latter.
> 
> OK as I said I haven't looked at it in detail.
> 
>> What is your idea? Send the firmware off-list and explain how
>> the OS works and how (what) to test?
> 
> I've already sent you this info:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html

Well, if you have everything setup, it is easier to test and send
a Tested-by tag.

> but I can't write a test case so if you want to automate this and make
> it part of QEMU tests then some help with that would be appreciated.

You are not the only want wanting that. I'm working on a solution to run
such tests (depending on binary blobs) in your own namespace, but it
will take me time (doing it in my free time, without help).

> As for the firmware, once Alexey's VOF (Virtual Open Firmware, minimial
> OF emulation in QEMU) is merged I plan to try to use that to make it
> possible to boot some guests with that so no firmware image would be
> needed and pegasos2 could be enabled by default. But for now a firmware
> image is needed as guests expect an OF environment to boot.
> 
> Regards,
> BALATON Zoltan

