Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77855B5F99
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:52:05 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXnbH-0006qM-P1
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXnV6-0002cY-Ix; Mon, 12 Sep 2022 13:45:40 -0400
Received: from mout.gmx.net ([212.227.17.22]:42303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXnV0-0000Rh-KS; Mon, 12 Sep 2022 13:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663004725;
 bh=CJmlWkKOGGomoxisFI5Njv5kA/iCmI7IRtEezeli8Hs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=iDsoawsjzC2BjYs7+WZDslgtY9hVeHQ96VhTpHXzm/MQw6KmtDPbT3WheBtXaMe/L
 xIrLztQ3Oho4CXknSN/Cf1gJErtjfZDFQoZUnWcLYLWg46Le+n20Uu8pBTw3dM9hq7
 Eb+FGQiZAdvwQsefUEw5pFKj0dq7cvUhbsl00B4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([94.223.115.42]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1pSSoA3Odu-014kcz; Mon, 12
 Sep 2022 19:45:24 +0200
Message-ID: <8bb22c23-23b2-8c2c-12e7-24a2f299445c@gmx.de>
Date: Mon, 12 Sep 2022 19:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
 <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
 <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
 <CAFEAcA-9RD_Lxypgm1yM6T_R=SS=LD9JPQbD5SFek4_wrCnKhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
In-Reply-To: <CAFEAcA-9RD_Lxypgm1yM6T_R=SS=LD9JPQbD5SFek4_wrCnKhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a0g0P/4uC7ZVVfQk7sM9ykP+LWyVmKSEr3TyPbtTsBHvdcoZ57+
 L4cRsv9QigOSJ2q3AguJtBkcYJ7y3aKOec39lRPmXhCnYpC7jx6922tewm3vmSrhwUImsin
 32YRk1nErD2joCMTcS2TXG2lZYy8sJiKLxOi7BTPlOJPjOt31OVE0vGXdwaJ17wyOaXjb3S
 ICe3bWjAXS24YgMLPDMHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SpOZd0YWR0U=:fA16gpmfAN2eb//BE449k4
 xIa9YPVrwZZNlQnewUnntxjNdOB4PyVfLYKQuyj6sVbR4ASXwkzgayMVwge88TgG4BXTitfn4
 tGEXUoqqMVb82+kiXegMdcsKKQmLZKkv40p/z7onE3jsHPzAVl7zsSXMzXfx3H06HZBtkuVJ/
 rpF+tP9Nf9QVsSgocaQG7Jaysd5MKBKD86a7e7oySEUFPaA0Ubd8gwW4PZaMUuT4IdZ5dzI0h
 RkKP5TiUHfcmVm42SyKvnbWUFMBuUFaXbrXDd8xEv9SJO/9NCi3AhHlBA0h4fjb+Gn5k5vo1i
 OjLe6UP79gGYvSrzBt9JGYJVcg3YtrMk+pA4JlgjJ+XSC7+42KfhdnzIuLv7BTXPHhG30TxRD
 d5Ot+H8/Ww58QaQbaYFTjrDHWgZLZWRCDJvvMBcqe+52p3+jAiBvRroJ4cLXYqq6Mx6uOkt4+
 +9EqfsHICQGzLyLG0QDLZZ+ZSfzI7G5lVxWbOMjMhdlWgwaf1k1YI33syD8GVM533Uv6I3TV4
 HvTEEw62zxtNhunHUIgV1LVkx1HH7jshUnY3JurVofMxCds68wUs4QIxDBwmZGQL3KQgjakXB
 lENZvE7OTTjQX+JdQweh6cVjhSWhL0ju+Sde5PQzTtmept40NRVWgbWHUAT33S3X2OECKEkIR
 HIu3zOL70eWys3T8ZBDEXmN2VfxJDQgh7+qFtHJ75fL9bUqlI64JrYi0fE1FmKrrZBeKOW4qk
 8MibYcYAXP7TqrRKz22YNulvUr7qzciv1NAA4d8OIOqXrjH26LRNq1dtS0ZD9ik8IuX0OISf0
 cq8sxdOLHtek//PKXJlhQPUWvhg/nBRz/W6ZwYTP/jEysMsQvFSHOTFjEqtgqtUOQzq7oGJww
 aec1txyqdP/IR9xWMCYrRgpIcnK+/sMKGZi0Mcn2rRthOAtvS0Vij162u7b0cYRCHlU2HH8KZ
 cPejynZINQHKoMfDI941SAbqxyCjckc0uYZOYSIXOJYSJ/FryZ6qGJi4J53GStbtKcC4LnXdB
 Gl4Dtd38xIamFJ4fsSLl3NRzxFAm9GxjeK40EInmjRCiO6Pqo8Pwys5b9KVoQaBPW4WoOIr8b
 yZlPngzyHhnqpvALPXYKiK79KiBtTWZ32jGQijq53xjaFIfzXCmBM0MGycw8Eoo788iuaRRtX
 AGlqWH5+Gr62B+0kOVDJ+Kt4W6
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.153, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 11.09.22 um 20:27 schrieb Peter Maydell:
> On Sun, 11 Sept 2022 at 18:14, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>
>> Am 08.09.22 um 23:11 schrieb Peter Maydell:
>>> On Thu, 8 Sept 2022 at 18:43, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>>>
>>>> Detect mouse reset via RTS or DTR line:
>>>> Don't send or process anything while in reset.
>>>> When coming out of reset, send ID sequence first thing.
>>>> This allows msmouse to be detected by common mouse drivers.
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>>>> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>>>
>>> How does this work across migration? There doesn't seem
>>> to be anything that handles migration of the existing
>>> state inside the MouseChardev either, though...
>
>> can you please explain in more detail what you don't understand and wha=
t
>> you mean by "migration"?
>
> Migration is when the state of the whole VM is copied from
> one host to another, or, equivalently, when it is saved to
> the disk image with 'savevm' to be restarted later. For this
> to work all the guest-changeable state in the whole VM (all
> device registers, internal state, etc) has to be saved so
> it can be reloaded on the destination. My question is basically
> how this new state in mouse->tiocm, and more generally how
> the existing other state fields in that struct, are saved
> and loaded during the migration process. I know how this
> works for device models, but I'm not sure how chardevs
> figure into it. (Perhaps the answer is "this shouldn't be
> a chardev at all" ???)
>
> thanks
> -- PMM

Hi,

thanks for adding some context. Good question.
Unfortunately I don't know the device and migration code much, so I
can't really say anything about this. I guess(!) it should be enough to
save/load contents of struct MouseChardev. No idea if and how this can
be done though.
Also since saving/loading device state wasn't supported in the msmouse
code to begin with, for me this is a new feature and out of scope for
this patch set.
The result of this missing feature might be that mouse buttons are
detected as not pressed and mouse movement data is lost after migration.


Regards

