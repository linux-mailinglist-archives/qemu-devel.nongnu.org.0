Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2C51D45B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 11:27:53 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmuFb-0004H6-V3
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 05:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmuDF-0003Ob-3C
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:25:25 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nmuDD-0001bA-5c
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:25:24 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so4558728ote.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tbi2iTIDAr0JWaEoEcZvwMoUEhzTD2dj1MA75pXBL8M=;
 b=PxzQEhlxTVR/Z56PMze6DumXVIB1zuB1hW5ENCEApUQKU3pLqKYo9Ge0KX3SkVHNND
 61iQ7e9yXRMbZlTz7RkEzXJxjhq748/utwXI6Eej7XfVhJNWA6OAW0y3706bseZaqkmg
 uf1Fem8+vOB1GdHdKLd82IxE8DbfRi6hdIeeEARBl543E9Qh/LPcHu6txbgemP6sSGsn
 xArFj+zEU2XiDxxHvloN/N+s7MmvxGGvrPv+NDlE/cJ2w+2Gspluo0HeRCCMcJP4+wxX
 ToGDJBJ76AN52V4Y22OcMA8r7+oC5G4LQ9vG+q0Og44YNqZQSeOJ4diKNzzJznox2MWX
 Ha6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tbi2iTIDAr0JWaEoEcZvwMoUEhzTD2dj1MA75pXBL8M=;
 b=W+fYoDZqzZhfrSOHPIDKB+vJn+wf8gkGTIqPktP0mX93ZxfJ1K30igG6xjiaUGz5VA
 lWIgmEqm3sqLnUGR9TzrlfjpnX9nb/jF46EDAa93nfCkhlM0LyumE8wptp7ltCHsfqO7
 xyT1/OoWTTTw1BhsYNg8HJeyZySY/P1g33avyEvgOjZSSSrLfnbVFq8hN9EVhrrlHjNe
 YyFhSQUyU9HEnneZkNgq8jHW23qNWDGSwkQOSVmc9yOex3pSNxtzH0v2OcUWeGU4ZhWP
 Hmxri/STNOnfASO6leQxo6nz1XySQPR1N6rsdYirG6Lq5R+Xrwz0Phm7cBOZy+TwI1DC
 ZQ/g==
X-Gm-Message-State: AOAM533BHgZ3zdfpCIN2CJ306Ebslkk4cQkgaB9Abe7ReSte89f3I7/W
 fzoV/uNG1MBIRxvGnKx+VYGMVg==
X-Google-Smtp-Source: ABdhPJwMzOzAoNpRH3MIoUjYLGmGJ4dNRBZt8GFMeVJwUaWwDHM2cn5t6mbKSBsYiDKG0hdsFVmbOQ==
X-Received: by 2002:a05:6830:268c:b0:606:4156:e0d8 with SMTP id
 l12-20020a056830268c00b006064156e0d8mr722092otu.187.1651829121264; 
 Fri, 06 May 2022 02:25:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7095000000b0060603221263sm1419486otj.51.2022.05.06.02.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 02:25:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F3991FFB7;
 Fri,  6 May 2022 10:25:17 +0100 (BST)
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
 <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
 <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
 <CAEUhbmVxfbrkw3ZvzOb3gVm-c_5KU_B_UiT42m+bgVQdPPJtLQ@mail.gmail.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Thomas Huth <thuth@redhat.com>, Bin Meng
 <bin.meng@windriver.com>, Alistair Francis <alistair@alistair23.me>, Nick
 Hudson <nick.hudson@gmx.co.uk>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
Date: Fri, 06 May 2022 10:20:45 +0100
In-reply-to: <CAEUhbmVxfbrkw3ZvzOb3gVm-c_5KU_B_UiT42m+bgVQdPPJtLQ@mail.gmail.com>
Message-ID: <87v8ujt3lu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> +more
>
> On Tue, May 3, 2022 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Thu, Apr 28, 2022 at 4:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > +Richard
>> > >
>> > > On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > >
>> > > > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
>> > > > >
>> > > > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wr=
ote:
>> > > > > >
>> > > > > > From: Bin Meng <bin.meng@windriver.com>
>> > > > > >
>> > > > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
>> > > > > >
>> > > > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/inclu=
de/image.h
>> > > > > >
>> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> > > > > > ---
>> > > > > >
>> > > > > > (no changes since v1)
>> > > > > >
>> > > > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++-----=
---------
>> > > > > >  1 file changed, 142 insertions(+), 71 deletions(-)
>> > > > > >
>> > > > >
>> > > > > Ping?
>> > > >
>> > > > Ping?
>> > >
>> > > Richard, is that you to pick up this series?
>> > >
>> >
>> > Ping?
>>
>> Ping? Can you please indicate who is the right person to pick up this
>> series? Thanks.
>>
>
> I pinged several times, but there's radio silence, sigh. Can you
> please let me know who is supposed to pick up this series?

The only file that includes this is hw/core/loader.c so I would assume
that's in Alistair's domain. However it's not well matched by
MAINTAINERS and has only seen periodic updates since it's inclusion in
2007.

Alistair can you take this and update MAINTAINERS so it doesn't fall
through the cracks again?=20


>
> Regards,
> Bin


--=20
Alex Benn=C3=A9e

