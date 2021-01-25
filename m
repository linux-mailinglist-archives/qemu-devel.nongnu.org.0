Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0806302340
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:33:39 +0100 (CET)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3yFe-0003Ul-3W
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3yEc-00033r-2K
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:32:34 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3yEZ-0004xJ-16
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:32:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c127so10079893wmf.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=++i17oIjHkT53vZM5bfpLCjiZYqmYyTlgnXE5bSc6gA=;
 b=eCfMLaqyEfGnu2Cqr0nnvcs8pNfBMCX5LvWKcsOgvphWstzCifpnfCC4Wwm9fqTa56
 4KvGL9XR00cmKAJTXzMarx4tOJUsB4UZzD2keGL32fZJrpftzHRRTOnNBZeQK4xmX9gG
 TsNErwofHUGlfJceeiGtf1Fx7MxM7QQ0VIuPHb8+JIjVdYvREkTkCTXjRzij/rV0So8d
 hqmCJFRbBxOXquYRvCe4fwf3gGQhxZ8EhVlW1cxcQFW65Rd6zTBmWsnFUzYo+Z0tfo1z
 iCNFAo0RbytAMXATeXk2juIQBJffBCr/IacuoCceJNKengkBiBQ3tj8igpuEyiCUIKHO
 Y5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=++i17oIjHkT53vZM5bfpLCjiZYqmYyTlgnXE5bSc6gA=;
 b=KwsW6knbV6NNkTPCi7bc9RrkZbt8DPAIzSSe51DN5L5m66caglaapAG/qwZFP3y9kk
 Ry2vtdqHw+WYiaI45uy1q398ZZb5VNgCN+MGv09t4hIR1xoiireJvEw4UM6BQPHermuJ
 ZmCpZAJUZ2VOojIctbbsY8as4nF9/Ud6nLOsFQT29OLwSQtFvi8EDjV4ro6P+Q0Dy08b
 XBcHhQ01OfgxJpZ2JzEDcxFs2cMBobMkKtLeNfcafYO+Lkw4exYfZpOvOxvHFCuIHH1j
 xoI1CQw52QtyR1RHfj+/Ec/Tcu1FiuKOmWVZOXPP1DEmp5xv408G7oVSc+DE9+itJkTN
 0+Gw==
X-Gm-Message-State: AOAM532WVmSyw5qTqgOGba1AP+DMFwv7qkCkBuCmGiADnBDnGil4dKgb
 f2J7ORHNCk+UAgbPar+3kJS2aA==
X-Google-Smtp-Source: ABdhPJyfMrxXFaXQ7ROw8PYoruFxCF/pcT4WkmaWdD7nIcm8t5+1gIINYNAV4VAam3/Qk7iM2YQCSQ==
X-Received: by 2002:a1c:5454:: with SMTP id p20mr1123037wmi.128.1611567148447; 
 Mon, 25 Jan 2021 01:32:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u16sm21916866wrn.68.2021.01.25.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 01:32:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1940D1FF7E;
 Mon, 25 Jan 2021 09:32:26 +0000 (GMT)
References: <20210121025439.1120405-1-richard.henderson@linaro.org>
 <521603eb-205f-9659-25f9-d72bb2eec01f@vivier.eu>
 <92ffa9ea-1013-db7c-554e-2bab1564a9f4@vivier.eu>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] tcg: Increase the static number of temporaries
Date: Mon, 25 Jan 2021 09:31:29 +0000
In-reply-to: <92ffa9ea-1013-db7c-554e-2bab1564a9f4@vivier.eu>
Message-ID: <874kj5nyza.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, alistair23@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 23/01/2021 =C3=A0 17:19, Laurent Vivier a =C3=A9crit :
>> Le 21/01/2021 =C3=A0 03:54, Richard Henderson a =C3=A9crit :
>>> This isn't a total or permanent solution to the problem of running
>>> out of temporaries, but it puts off the issue for a bit.
>>>
>>> Make the assert in tcg_temp_alloc unconditional.  If we do run out
>>> of temps, this can fail much later as a weird SIGSEGV, due to the
>>> buffer overrun of the temp array.
>>>
>>> Remove the inlines from tcg_temp_alloc and tcg_global_alloc.
>>>
>>> Buglink: https://bugs.launchpad.net/bugs/1912065
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>
>>> There are more bugs that need fixing in order to actually make
>>> the dynamic allocation scheme work.  Rather than keep this bug
>>> pending longer, hack around it and make the SEGV an ABRT.
>>>
>>> r~
>>>
>>> ---
>>>  include/tcg/tcg.h | 2 +-
>>>  tcg/tcg.c         | 6 +++---
>>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
>>> index c5a9d65d5f..0187de1352 100644
>>> --- a/include/tcg/tcg.h
>>> +++ b/include/tcg/tcg.h
>>> @@ -275,7 +275,7 @@ typedef struct TCGPool {
>>>=20=20
>>>  #define TCG_POOL_CHUNK_SIZE 32768
>>>=20=20
>>> -#define TCG_MAX_TEMPS 512
>>> +#define TCG_MAX_TEMPS 1024
>>=20
>> This seems not enough, I have:
>>=20
>> ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n < TCG_MAX_=
TEMPS)
>> Bail out! ERROR:.../tcg/tcg.c:1210:tcg_temp_alloc: assertion failed: (n =
< TCG_MAX_TEMPS)
>>=20
>> With my branch m68k-virt (68040 processor with virtio-mmio devices) boot=
ing debian sid.
>
> The cause of the overflow is this sequence:
>
> ----------------
> IN:
> 0xc0f0520c:  movel %a5,%sp@-
> 0xc0f0520e:  lea %pc@(0xc1805000),%a5
> 0xc0f05216:  moveal %sp@(12),%a0
> 0xc0f0521a:  movel %a5@(61a0),%a0@
> 0xc0f05222:  movel %a5@(4fd4),%a0@(180)
> 0xc0f0522c:  movel %a5@(8af4),%a0@(184)
> 0xc0f05236:  movel %a5@(6328),%a0@(188)
> 0xc0f05240:  movel %a5@(2530),%a0@(172)
> 0xc0f0524a:  movel %a5@(61fc),%a0@(176)
> 0xc0f05254:  movel %a5@(5848),%a0@(24)
> 0xc0f0525e:  movel %a5@(d398),%a0@(28)
> 0xc0f05268:  movel %a5@(53ec),%a0@(32)
> 0xc0f05272:  movel %a5@(17774),%a0@(36)
> 0xc0f0527c:  movel %a5@(f748),%a0@(40)
> 0xc0f05286:  movel %a5@(551c),%a0@(44)
> 0xc0f05290:  movel %a5@(36ac),%a0@(4)
> 0xc0f0529a:  movel %a5@(68a0),%a0@(8)
> 0xc0f052a4:  movel %a5@(54c0),%a0@(12)
> 0xc0f052ae:  movel %a5@(4354),%a0@(16)
> 0xc0f052b8:  movel %a5@(5eb0),%a0@(48)
> 0xc0f052c2:  movel %a5@(5ee4),%a0@(52)
> 0xc0f052cc:  movel %a5@(5894),%a0@(68)
> 0xc0f052d6:  movel %a5@(5924),%a0@(72)
> 0xc0f052e0:  movel %a5@(c8fc),%a0@(76)
> 0xc0f052ea:  movel %a5@(3248),%a0@(80)
> 0xc0f052f4:  movel %a5@(bcd0),%a0@(84)
> 0xc0f052fe:  movel %a5@(9a38),%a0@(88)
> 0xc0f05308:  movel %a5@(e2e8),%a0@(92)
> 0xc0f05312:  movel %a5@(dd50),%a0@(96)
> 0xc0f0531c:  movel %a5@(62b0),%a0@(100)
> 0xc0f05326:  movel %a5@(20a0),%a0@(104)
> 0xc0f05330:  movel %a5@(527c),%a0@(108)
> 0xc0f0533a:  movel %a5@(41ec),%a0@(112)
> 0xc0f05344:  movel %a5@(33dc),%a0@(116)
> 0xc0f0534e:  movel %a5@(423c),%a0@(120)
> 0xc0f05358:  movel %a5@(9728),%a0@(124)
> 0xc0f05362:  movel %a5@(3fe4),%a0@(128)
> 0xc0f0536c:  movel %a5@(1018c),%a0@(132)
> 0xc0f05376:  movel %a5@(7b54),%a0@(136)
> 0xc0f05380:  movel %a5@(121e8),%a0@(140)
> 0xc0f0538a:  movel %a5@(550c),%a0@(144)
> 0xc0f05394:  movel %a5@(b4a8),%a0@(148)
> 0xc0f0539e:  movel %a5@(6a20),%a0@(152)
> 0xc0f053a8:  movel %a5@(56e0),%a0@(156)
> 0xc0f053b2:  movel %a5@(10c9c),%a0@(160)
> 0xc0f053bc:  movel %a5@(a4e8),%a0@(164)
> 0xc0f053c6:  movel %a5@(9d58),%a0@(168)
> 0xc0f053d0:  movel %a5@(6e2c),%a0@(224)
> 0xc0f053da:  movel %a5@(4e28),%a0@(228)
> 0xc0f053e4:  movel %a5@(152e0),%a0@(232)
> 0xc0f053ee:  movel %a5@(7e3c),%a0@(236)
> 0xc0f053f8:  movel %a5@(15b10),%a0@(240)
> 0xc0f05402:  movel %a5@(4578),%a0@(244)
> 0xc0f0540c:  movel %a5@(11e98),%a0@(248)
> 0xc0f05416:  movel %a5@(44b8),%a0@(252)
> 0xc0f05420:  movel %a5@(72a0),%a0@(504)
> 0xc0f0542a:  movel %a5@(308c),%a0@(508)
> 0xc0f05434:  movel %a5@(4f40),%a0@(512)
> 0xc0f0543e:  movel %a5@(8c04),%a0@(516)
> 0xc0f05448:  movel %a5@(b328),%a0@(520)
> 0xc0f05452:  movel %a5@(4e40),%a0@(524)
> 0xc0f0545c:  movel %a5@(4954),%a0@(528)
> 0xc0f05466:  movel %a5@(14f48),%a0@(532)
> 0xc0f05470:  movel %a5@(15c2c),%a0@(536)
> 0xc0f0547a:  movel %a5@(4bf0),%a0@(540)
> 0xc0f05484:  movel %a5@(66b4),%a0@(544)
> 0xc0f0548e:  movel %a5@(3768),%a0@(548)
> 0xc0f05498:  movel %a5@(111e4),%a0@(552)
> 0xc0f054a2:  movel %a5@(414c),%a0@(556)
> 0xc0f054ac:  movel %a5@(14eb8),%a0@(560)
> 0xc0f054b6:  movel %a5@(6fec),%a0@(564)
> 0xc0f054c0:  movel %a5@(48c0),%a0@(568)
> 0xc0f054ca:  movel %a5@(4494),%a0@(572)
> 0xc0f054d4:  movel %a5@(7534),%a0@(576)
> 0xc0f054de:  movel %a5@(c1ec),%a0@(580)
> 0xc0f054e8:  movel %a5@(636c),%a0@(584)
> 0xc0f054f2:  movel %a5@(a5a0),%a0@(588)
> 0xc0f054fc:  movel %a5@(8734),%a0@(592)
> 0xc0f05506:  movel %a5@(3f94),%a0@(596)
> 0xc0f05510:  movel %a5@(11910),%a0@(600)
> 0xc0f0551a:  movel %a5@(119e4),%a0@(604)
> 0xc0f05524:  movel %a5@(5efc),%a0@(608)
> 0xc0f0552e:  movel %a5@(284c),%a0@(612)
> 0xc0f05538:  movel %a5@(4b58),%a0@(616)
> 0xc0f05542:  movel %a5@(4084),%a0@(620)
> 0xc0f0554c:  movel %a5@(3f80),%a0@(624)
> 0xc0f05556:  movel %a5@(d990),%a0@(628)
> 0xc0f05560:  movel %a5@(6c30),%a0@(192)
> 0xc0f0556a:  movel %a5@(7350),%a0@(196)
> 0xc0f05574:  movel %a5@(61ec),%a0@(200)
> 0xc0f0557e:  movel %a5@(4840),%a0@(204)
> 0xc0f05588:  movel %a5@(5414),%a0@(208)
> 0xc0f05592:  movel %a5@(3f1c),%a0@(212)
> 0xc0f0559c:  movel %a5@(53cc),%a0@(216)
> 0xc0f055a6:  movel %a5@(3e04),%a0@(220)
> 0xc0f055b0:  movel %a5@(13ae0),%a0@(256)
> 0xc0f055ba:  movel %a5@(902c),%a0@(260)
> 0xc0f055c4:  movel %a5@(1455c),%a0@(264)
> 0xc0f055ce:  movel %a5@(4a80),%a0@(268)
> 0xc0f055d8:  movel %a5@(1cb8),%a0@(272)
> 0xc0f055e2:  movel %a5@(3350),%a0@(276)
> 0xc0f055ec:  movel %a5@(6184),%a0@(280)
> 0xc0f055f6:  movel %a5@(4908),%a0@(284)
> 0xc0f05600:  movel %a5@(609c),%a0@(288)
> 0xc0f0560a:  movel %a5@(a348),%a0@(292)
> 0xc0f05614:  movel %a5@(9dbc),%a0@(296)
> 0xc0f0561e:  movel %a5@(4784),%a0@(300)
> 0xc0f05628:  movel %a5@(16fbc),%a0@(304)
> 0xc0f05632:  movel %a5@(3f78),%a0@(308)
> 0xc0f0563c:  movel %a5@(7128),%a0@(64)
> 0xc0f05646:  movel %a5@(7934),%a0@(20)
> 0xc0f05650:  movel %a5@(15e50),%a0@(56)
> 0xc0f0565a:  movel %a5@(41c4),%a0@(60)
> 0xc0f05664:  movel %a5@(7210),%a0@(312)
> 0xc0f0566e:  movel %a5@(14fc0),%a0@(316)
> 0xc0f05678:  movel %a5@(165f8),%a0@(320)
> 0xc0f05682:  movel %a5@(8e8c),%a0@(324)
> 0xc0f0568c:  movel %a5@(5008),%a0@(328)
> 0xc0f05696:  movel %a5@(66a0),%a0@(332)
> 0xc0f056a0:  movel %a5@(d53c),%a0@(336)
> 0xc0f056aa:  movel %a5@(44f8),%a0@(340)
> 0xc0f056b4:  movel %a5@(1534),%a0@(344)
> 0xc0f056be:  movel %a5@(3554),%a0@(348)
> 0xc0f056c8:  movel %a5@(13af8),%a0@(352)
> 0xc0f056d2:  movel %a5@(7758),%a0@(356)
> 0xc0f056dc:  movel %a5@(3434),%a0@(360)
> 0xc0f056e6:  movel %a5@(25b0),%a0@(364)
> 0xc0f056f0:  movel %a5@(14b68),%a0@(368)
> 0xc0f056fa:  movel %a5@(6a84),%a0@(372)
> 0xc0f05704:  movel %a5@(69bc),%a0@(376)
> 0xc0f0570e:  movel %a5@(2550),%a0@(380)
> 0xc0f05718:  movel %a5@(4438),%a0@(384)
> 0xc0f05722:  movel %a5@(1686c),%a0@(388)
> 0xc0f0572c:  movel %a5@(58ec),%a0@(392)
> 0xc0f05736:  movel %a5@(2610),%a0@(396)
> 0xc0f05740:  movel %a5@(1585c),%a0@(400)
> 0xc0f0574a:  movel %a5@(13468),%a0@(404)
> 0xc0f05754:  movel %a5@(1504),%a0@(408)
> 0xc0f0575e:  movel %a5@(160c),%a0@(412)
> 0xc0f05768:  movel %a5@(42b8),%a0@(416)
> 0xc0f05772:  movel %a5@(139dc),%a0@(420)
> 0xc0f0577c:  movel %a5@(33a4),%a0@(424)
> 0xc0f05786:  movel %a5@(b6cc),%a0@(428)
> 0xc0f05790:  movel %a5@(12cb4),%a0@(432)
> 0xc0f0579a:  movel %a5@(d530),%a0@(448)
> 0xc0f057a4:  movel %a5@(64a0),%a0@(436)
> 0xc0f057ae:  movel %a5@(18b58),%a0@(452)
> 0xc0f057b8:  movel %a5@(4e4c),%a0@(440)
> 0xc0f057c2:  movel %a5@(12b64),%a0@(456)
> 0xc0f057cc:  movel %a5@(8628),%a0@(444)
> 0xc0f057d6:  movel %a5@(11d4c),%a0@(460)
> 0xc0f057e0:  movel %a5@(5890),%a0@(464)
> 0xc0f057ea:  movel %a5@(2248),%a0@(468)
> 0xc0f057f4:  movel %a5@(5cfc),%a0@(472)
> 0xc0f057fe:  movel %a5@(4b74),%a0@(476)
> 0xc0f05808:  movel %a5@(5c24),%a0@(480)
> 0xc0f05812:  movel %a5@(4aa0),%a0@(484)
> 0xc0f0581c:  movel %a5@(16ff0),%a0@(488)
> 0xc0f05826:  movel %a5@(9520),%a0@(492)
> 0xc0f05830:  movel %a5@(110f0),%a0@(496)
> 0xc0f0583a:  movel %a5@(3bb8),%a0@(500)
> 0xc0f05844:  movel %a5@(ceec),%a0@(712)
> 0xc0f0584e:  movel %a5@(470c),%a0@(1100)
> 0xc0f05858:  movel %a5@(5c70),%a0@(632)
> 0xc0f05862:  movel %a5@(8a5c),%a0@(636)
> 0xc0f0586c:  movel %a5@(6098),%a0@(640)
> 0xc0f05876:  movel %a5@(6124),%a0@(644)
> 0xc0f05880:  movel %a5@(11688),%a0@(648)
> 0xc0f0588a:  movel %a5@(4928),%a0@(652)
> 0xc0f05894:  movel %a5@(1214c),%a0@(656)
> 0xc0f0589e:  movel %a5@(559c),%a0@(688)
> 0xc0f058a8:  movel %a5@(12394),%a0@(692)
> 0xc0f058b2:  movel %a5@(47b4),%a0@(696)
> 0xc0f058bc:  movel %a5@(43c0),%a0@(700)
> 0xc0f058c6:  movel %a5@(fc4c),%a0@(704)
> 0xc0f058d0:  movel %a5@(6e44),%a0@(708)
> 0xc0f058da:  movel %a5@(305c),%a0@(660)
> 0xc0f058e4:  movel %a5@(9e68),%a0@(664)
> 0xc0f058ee:  movel %a5@(1636c),%a0@(668)
> 0xc0f058f8:  movel %a5@(2b34),%a0@(672)
> 0xc0f05902:  movel %a5@(bee8),%a0@(676)
> 0xc0f0590c:  movel %a5@(8780),%a0@(680)
> 0xc0f05916:  movel %a5@(a10c),%a0@(684)
> 0xc0f05920:  movel %a5@(2bc4),%a0@(720)
> 0xc0f0592a:  movel %a5@(3888),%a0@(724)
> 0xc0f05934:  movel %a5@(6d3c),%a0@(716)
> 0xc0f0593e:  movel %a5@(804c),%a0@(728)
> 0xc0f05948:  movel %a5@(4584),%a0@(732)
> 0xc0f05952:  movel %a5@(141b4),%a0@(736)
> 0xc0f0595c:  movel %a5@(39a8),%a0@(740)
> 0xc0f05966:  movel %a5@(5324),%a0@(1112)
> 0xc0f05970:  movel %a5@(2b08),%a0@(1116)
> 0xc0f0597a:  movel %a5@(43d0),%a0@(1120)
> 0xc0f05984:  movel %a5@(5270),%a0@(1124)
> 0xc0f0598e:  movel %a5@(2888),%a0@(1128)
> 0xc0f05998:  movel %a5@(ca6c),%a0@(1132)
> 0xc0f059a2:  movel %a5@(854c),%a0@(1136)
> 0xc0f059ac:  movel %a5@(2110),%a0@(1140)
> 0xc0f059b6:  movel %a5@(49c0),%a0@(1144)
> 0xc0f059c0:  movel %a5@(4b40),%a0@(1148)
> 0xc0f059ca:  movel %a5@(ee34),%a0@(1152)
> 0xc0f059d4:  movel %a5@(2ffc),%a0@(1156)
> 0xc0f059de:  movel %a5@(11f14),%a0@(1160)
> 0xc0f059e8:  movel %a5@(4a24),%a0@(1164)
> 0xc0f059f2:  movel %a5@(4124),%a0@(784)
> 0xc0f059fc:  movel %a5@(77e8),%a0@(752)
> 0xc0f05a06:  movel %a5@(2c9c),%a0@(756)
> 0xc0f05a10:  movel %a5@(58f4),%a0@(760)
> 0xc0f05a1a:  movel %a5@(169bc),%a0@(764)
> 0xc0f05a24:  movel %a5@(6680),%a0@(768)
> 0xc0f05a2e:  movel %a5@(11320),%a0@(772)
> 0xc0f05a38:  movel %a5@(2010),%a0@(776)
> 0xc0f05a42:  movel %a5@(40fc),%a0@(780)
> 0xc0f05a4c:  movel %a5@(7884),%a0@(788)
> 0xc0f05a56:  movel %a5@(17c84),%a0@(792)
> 0xc0f05a60:  movel %a5@(78c4),%a0@(796)
> 0xc0f05a6a:  movel %a5@(ba00),%a0@(800)
> 0xc0f05a74:  movel %a5@(2f3c),%a0@(804)
> 0xc0f05a7e:  movel %a5@(2f54),%a0@(808)
> 0xc0f05a88:  movel %a5@(f7a4),%a0@(812)
> 0xc0f05a92:  movel %a5@(2ef4),%a0@(816)
> 0xc0f05a9c:  movel %a5@(3abc),%a0@(820)
> 0xc0f05aa6:  movel %a5@(d8e8),%a0@(824)
> 0xc0f05ab0:  movel %a5@(7d70),%a0@(828)
> 0xc0f05aba:  movel %a5@(2f0c),%a0@(832)
> 0xc0f05ac4:  movel %a5@(67bc),%a0@(836)
> 0xc0f05ace:  movel %a5@(62f8),%a0@(840)
> 0xc0f05ad8:  movel %a5@(475c),%a0@(844)
> 0xc0f05ae2:  movel %a5@(4a78),%a0@(848)
> 0xc0f05aec:  movel %a5@(49b4),%a0@(852)
> 0xc0f05af6:  movel %a5@(4ee4),%a0@(856)
> 0xc0f05b00:  movel %a5@(41e4),%a0@(860)
> 0xc0f05b0a:  movel %a5@(34f4),%a0@(864)
> 0xc0f05b14:  movel %a5@(2f6c),%a0@(868)
> 0xc0f05b1e:  movel %a5@(5688),%a0@(872)
> 0xc0f05b28:  movel %a5@(10cbc),%a0@(876)
> 0xc0f05b32:  movel %a5@(7658),%a0@(880)
> 0xc0f05b3c:  movel %a5@(2d44),%a0@(884)
> 0xc0f05b46:  movel %a5@(5d44),%a0@(888)
> 0xc0f05b50:  movel %a5@(c6f4),%a0@(892)
> 0xc0f05b5a:  movel %a5@(11f34),%a0@(896)
> 0xc0f05b64:  movel %a5@(5378),%a0@(900)
> 0xc0f05b6e:  movel %a5@(2070),%a0@(904)
> 0xc0f05b78:  movel %a5@(2dd4),%a0@(908)
> 0xc0f05b82:  movel %a5@(9ff8),%a0@(912)
> 0xc0f05b8c:  movel %a5@(5e18),%a0@(916)
> 0xc0f05b96:  movel %a5@(5fe4),%a0@(920)
> 0xc0f05ba0:  movel %a5@(4f04),%a0@(924)
> 0xc0f05baa:  movel %a5@(6c24),%a0@(928)
> 0xc0f05bb4:  movel %a5@(6d48),%a0@(932)
> 0xc0f05bbe:  movel %a5@(6da0),%a0@(936)
> 0xc0f05bc8:  movel %a5@(421c),%a0@(940)
> 0xc0f05bd2:  movel %a5@(4794),%a0@(944)
> 0xc0f05bdc:  movel %a5@(5150),%a0@(948)
> 0xc0f05be6:  movel %a5@(590c),%a0@(952)
> 0xc0f05bf0:  movel %a5@(2e1c),%a0@(956)
> 0xc0f05bfa:  movel %a5@(16e34),%a0@(960)
> 0xc0f05c04:  movel %a5@(2e4c),%a0@(964)
> 0xc0f05c0e:  movel %a5@(6934),%a0@(968)
> 0xc0f05c18:  movel %a5@(98dc),%a0@(972)
> 0xc0f05c22:  movel %a5@(9014),%a0@(976)
> 0xc0f05c2c:  movel %a5@(df58),%a0@(980)
> 0xc0f05c36:  movel %a5@(2c54),%a0@(984)
> 0xc0f05c40:  movel %a5@(f644),%a0@(988)
> 0xc0f05c4a:  movel %a5@(6164),%a0@(992)
> 0xc0f05c54:  movel %a5@(7344),%a0@(996)
> 0xc0f05c5e:  movel %a5@(11224),%a0@(1000)
> 0xc0f05c68:  movel %a5@(7df4),%a0@(1004)
> 0xc0f05c72:  movel %a5@(6a14),%a0@(1008)
> 0xc0f05c7c:  movel %a5@(5438),%a0@(1012)
> 0xc0f05c86:  movel %a5@(3c9c),%a0@(1016)
> 0xc0f05c90:  movel %a5@(54a8),%a0@(1020)
> 0xc0f05c9a:  movel %a5@(11388),%a0@(1024)
> 0xc0f05ca4:  movel %a5@(3104),%a0@(1028)
> 0xc0f05cae:  movel %a5@(11408),%a0@(1032)
> 0xc0f05cb8:  movel %a5@(557c),%a0@(1036)
> 0xc0f05cc2:  movel %a5@(a6b4),%a0@(1040)
> 0xc0f05ccc:  movel %a5@(3194),%a0@(1044)
> 0xc0f05cd6:  movel %a5@(11bc4),%a0@(1048)
> 0xc0f05ce0:  movel %a5@(31dc),%a0@(1052)
> 0xc0f05cea:  movel %a5@(6e68),%a0@(1056)
> 0xc0f05cf4:  movel %a5@(10c48),%a0@(1060)
> 0xc0f05cfe:  movel %a5@(c158),%a0@(1064)
> 0xc0f05d08:  movel %a5@(326c),%a0@(1068)
> 0xc0f05d12:  movel %a5@(3bd4),%a0@(1072)
> 0xc0f05d1c:  movel %a5@(a4b8),%a0@(1076)
> 0xc0f05d26:  movel %a5@(a518),%a0@(1080)
> 0xc0f05d30:  movel %a5@(3948),%a0@(1084)
> 0xc0f05d3a:  movel %a5@(4830),%a0@(1088)
> 0xc0f05d44:  movel %a5@(2f24),%a0@(1092)
> 0xc0f05d4e:  movel %a5@(1443c),%a0@(1096)
> 0xc0f05d58:  movel %a5@(5c44),%a0@(1104)
> 0xc0f05d62:  movel %a5@(7234),%a0@(1108)
> 0xc0f05d6c:  movel %a5@(7a24),%a0@(744)
> 0xc0f05d76:  movel %a5@(6fc4),%a0@(748)
> 0xc0f05d80:  movel %a5@(44f0),%a0@(1168)
> 0xc0f05d8a:  movel %a5@(5780),%a0@(1172)
> 0xc0f05d94:  movel %a5@(5d58),%a0@(1176)
> 0xc0f05d9e:  movel %a5@(40cc),%a0@(1180)
> 0xc0f05da8:  movel %a5@(f778),%a0@(1184)
> 0xc0f05db2:  movel %a5@(69a0),%a0@(1188)
> 0xc0f05dbc:  movel %a5@(7b1c),%a0@(1192)
> 0xc0f05dc6:  movel %a5@(f6dc),%a0@(1196)
> 0xc0f05dd0:  movel %a5@(1f3c),%a0@(1200)
> 0xc0f05dda:  movel %a5@(12244),%a0@(1204)
> 0xc0f05de4:  movel %a5@(3b34),%a0@(1208)
> 0xc0f05dee:  movel %a5@(7078),%a0@(1212)
> 0xc0f05df8:  movel %a5@(6088),%a0@(1216)
> 0xc0f05e02:  movel %a5@(5000),%a0@(1220)
> 0xc0f05e0c:  movel %a5@(6ca8),%a0@(1224)
> 0xc0f05e16:  movel %a5@(6ce8),%a0@(1228)
> 0xc0f05e20:  movel %a5@(b888),%a0@(1232)
> 0xc0f05e2a:  movel %a5@(3ea4),%a0@(1236)
> 0xc0f05e34:  movel %a5@(4838),%a0@(1240)
> 0xc0f05e3e:  movel %a5@(5b94),%a0@(1244)
> 0xc0f05e48:  movel %a5@(41f0),%a0@(1248)
> 0xc0f05e52:  movel %a5@(4220),%a0@(1252)
> 0xc0f05e5c:  movel %a5@(1057c),%a0@(1256)
> 0xc0f05e66:  movel %a5@(4280),%a0@(1260)
> 0xc0f05e70:  movel %a5@(42b0),%a0@(1264)
> 0xc0f05e7a:  movel %a5@(892c),%a0@(1268)
> 0xc0f05e84:  movel %a5@(4310),%a0@(1272)
> 0xc0f05e8e:  movel %a5@(7bb4),%a0@(1276)
> 0xc0f05e98:  movel %a5@(5d70),%a0@(1280)
> 0xc0f05ea2:  movel %a5@(43a0),%a0@(1284)
> 0xc0f05eac:  movel %a5@(1425c),%a0@(1288)
> 0xc0f05eb6:  movel %a5@(856c),%a0@(1292)
> 0xc0f05ec0:  movel %a5@(12b44),%a0@(1296)
> 0xc0f05eca:  movel %a5@(586c),%a0@(1300)
> 0xc0f05ed4:  movel %a5@(33ac),%a0@(1304)
> 0xc0f05ede:  movel %a5@(7974),%a0@(1308)
> 0xc0f05ee8:  movel %a5@(6a74),%a0@(1312)
> 0xc0f05ef2:  movel %a5@(157b8),%a0@(1316)
> 0xc0f05efc:  movel %a5@(d3fc),%a0@(1320)
> 0xc0f05f06:  movel %a5@(8430),%a0@(1324)
> 0xc0f05f10:  movel %a5@(31b4),%a0@(1328)
> 0xc0f05f1a:  movel %a5@(70c8),%a0@(1332)
> 0xc0f05f24:  movel %a5@(5404),%a0@(1336)
> 0xc0f05f2e:  movel %a5@(136a0),%a0@(1340)
> 0xc0f05f38:  movel %a5@(243c),%a0@(1344)
> 0xc0f05f42:  movel %a5@(5768),%a0@(1348)
> 0xc0f05f4c:  movel %a5@(23c4),%a0@(1352)
> 0xc0f05f56:  movel %a5@(15058),%a0@(1388)
> 0xc0f05f60:  movel %a5@(5104),%a0@(1392)
> 0xc0f05f6a:  movel %a5@(116f4),%a0@(1356)
> 0xc0f05f74:  movel %a5@(6ac4),%a0@(1360)
> 0xc0f05f7e:  movel %a5@(11448),%a0@(1364)
> 0xc0f05f88:  movel %a5@(3ee0),%a0@(1368)
> 0xc0f05f92:  movel %a5@(3e68),%a0@(1372)
> 0xc0f05f9c:  movel %a5@(16ac),%a0@(1376)
> 0xc0f05fa6:  movel %a5@(677c),%a0@(1380)
> 0xc0f05fb0:  movel %a5@(1664),%a0@(1396)
> 0xc0f05fba:  movel %a5@(13004),%a0@(1384)
> 0xc0f05fc4:  movel %a5@(161c),%a0@(1400)
> 0xc0f05fce:  movel %a5@(9d2c),%a0@(1404)
> 0xc0f05fd8:  movel %a5@(6414),%a0@(1408)

I have to ask what on earth is the compiler trying to achieve here? It
looks like it's doing a static re-order of a bunch of stacked variables.
Is this generated code or a synthetic test case?

--=20
Alex Benn=C3=A9e

