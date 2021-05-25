Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F772390A58
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:10:43 +0200 (CEST)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldNy-0008Tb-61
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lldMX-0007br-JX; Tue, 25 May 2021 16:09:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:53607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lldMV-0004KC-FT; Tue, 25 May 2021 16:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1621973345;
 bh=1febhZsu8fCeVBvhlseXfGl5zuwM76KRNZAMbBzroCY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=OY5KAwvY/IFMhzi4B2CvLsuZka4kOw/pH7C5Jnk7wHVtxI77pGQwt+Nry2vzfbE83
 Fh6DzC6+D7icTTDWNMxQI33GkHYig6b1vzq2bPu4pJDVQ903/3yNC6jeLo34rkM95+
 STJJgwS069NmhXBEMg8tzKmAylmBt1zsZWlIeBSY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.159.17]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1lZZ4H0HvQ-00C8Rb; Tue, 25
 May 2021 22:09:05 +0200
Subject: Re: [PATCH] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <YKwLOP/IAGG1u7em@ls3530>
 <ecce5f13-f7e8-03d9-0604-6643af60acf3@amsat.org>
From: Helge Deller <deller@gmx.de>
Message-ID: <28fc1ed3-fe20-3e09-6a75-f9ca64ae71ab@gmx.de>
Date: Tue, 25 May 2021 22:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ecce5f13-f7e8-03d9-0604-6643af60acf3@amsat.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZP9Jp8SNPU4EZM9HzJeHlgZXUbz+uu44V5n5D7TWWuPd23QXLBn
 V+Ue3ZyaE/TzHeze61aD4Z02G0j/ONWuDwgKRIXmN6DOGxKfx6N6GPLTwp/u+ygyeNzdn4r
 WuKj3WQr38c07Abav6evokWpqJgFsTk/MfUKr/fsP4rWWYMQSXhVQAXpo1wBbePYYaDULBu
 yFOyf2lkCblfD413qHpGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TP8TlPNWG+E=:8UbOBHEIxLVQG/neMVWFtQ
 //Wub63O3u+fpqs9MmUtXGUL8v3KieMB7Y3qlfapFkIgi7+I+NUb8GhAuQz5W9+r3oVr5qPnW
 +0ga/XZqk5rNw6alyys8/EGrtl9MU3NSOzxvwh7jQfnhHroEV7IKO7bSr4aQyi8CdVZ50ngqv
 O7wB2PWtS4iwWmPVtMKS5mPngCZtjL/O7/NhdY+iw1HoZdu8ZXaENtkjh/on7ehJzyrA/GN2c
 jOnYG1uprr/7ZiWAhzm8lqHVmRQBnV9TOBdCbr/IymhdECICWYA66mCSfgyt/KY8jJ+2gv41V
 9MxKNjcJu0p6pvDKcJS4+zNX5dxP5+TliDILJBLRDbByDbBSnEMOntnBPisMmEHria0AMJraq
 3mZnI9P7PKkT7mjSn6CID71ia0DUPvjlXrIkYKovRn+P0xliIBQygLSKuUjgcKvrXga8AEoQu
 JFHopOk8nMwy0QIN+IoKC11uOtQmVS5vuR8brUJA1yPuFCUD5BB8z6fxSUVgzCt1UzDxRabH6
 VpMCzhzNjnM0yW8BvNcgnrnGRvLEXK1XZVlZj8Sri9llXkZ8Vaqd699Ovya2EdS3e+zxFmNf0
 srodpH7Bwcp/i2yNELXihrkZbPsXvJrvQ1JAsZC5itWyjoS1B7Tzdd/I1hFXjtzhJwI0wa2qG
 cOsJSrO7FbEmKD/szT4TmnuNLLy9UUscwIsvqM3rfMGR1Od30kqjOb0HoQc621+4N8hsBstV4
 R9kApaO6Rgd+gRClE+jz8+zXQzh1xvMwNcEubc6d5zodVxyeazY7of+48rqcjgwd6lmyJ0SOS
 K6EHXPWZM1LeMbTi8fL30GD3NTwv7tcRxy4xfqN47/OVJXovrc/+F7VrpTBk8xh9wNXXsf9X9
 k4ubIpOPAM4ZeLDmszQtdh6uaPKbYHB7XJeQLp8ng3LMDxi9hF4svm6hYakRcxm10ZUlYaE9t
 hLuxtm/RwYY0tNfKffvCcSSsxxknvTujvT2VOYanLYWqld6LpwvduZc2C8a/AcRKc1bNOKJlV
 lgz9ljDM60K7s8kRzYyUhhiSMc809OP+mxIIuagd7LpoGSj8HOxRvl9BzfJ7PIr8NOYx3XsB5
 mMt+r5IZVAnyRyRR5F+Q+QY7IVZjpFQqfwZMnjbtp4BlufsKUOqGFt7AQiHe2ijz8oA1rpS83
 I+yzivLau1l8K7fJvmQjPdSpra6XsE2xxeTo0KlRVqlTeO8W5naAaSubUzicBUVbfW8TA=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 5:53 AM, Philippe Mathieu-Daud=E9 wrote:
> Hi Helge,

Hi Plilippe,

> On 5/24/21 10:23 PM, Helge Deller wrote:
>> The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the loca=
l screen
>> menu is closed. This bug was introduced by commit c7050f3f167b
>> ("hw/display/artist: Refactor x/y coordination extraction") which conve=
rted the
>> coordinate extraction in artist_vram_read() to use the ADDR_TO_X and AD=
DR_TO_Y
>> macros, but forgot to right-shift the address by 2 as it was done befor=
e.
>
> OK, but there is a similar issue in artist_vram_write(), right?

Similar code: Yes.
Issue: Maybe.
I applied the same patch in artist_vram_write() and it didn't showed any
negative (or positive) effects.
So, I'll resend my patch with artist_vram_write() adjusted as well.

Thanks!
Helge


>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extr=
action")
>> Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Sven Schnelle <svens@stackframe.org>
>> Cc: qemu-stable@nongnu.org
>>
>> diff --git a/hw/display/artist.c b/hw/display/artist.c
>> index ed0e637f25..34efd3a565 100644
>> --- a/hw/display/artist.c
>> +++ b/hw/display/artist.c
>> @@ -1233,8 +1233,8 @@ static uint64_t artist_vram_read(void *opaque, hw=
addr addr, unsigned size)
>>           return 0;
>>       }
>>
>> -    posy =3D ADDR_TO_Y(addr);
>> -    posx =3D ADDR_TO_X(addr);
>> +    posy =3D ADDR_TO_Y(addr >> 2);
>> +    posx =3D ADDR_TO_X(addr >> 2);
>>
>>       if (posy > buf->height || posx > buf->width) {
>>           return 0;
>>


