Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBB5B5FBD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 20:02:08 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXnl0-0001O6-G3
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 14:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXne1-0002AS-WA; Mon, 12 Sep 2022 13:54:54 -0400
Received: from mout.gmx.net ([212.227.17.22]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXndz-0001a7-V1; Mon, 12 Sep 2022 13:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663005287;
 bh=ou/v3LV0/8+IePB+vNSzfFqALzBLXajYp4dHQsk5brM=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=l4IUlRMYBUBuCv78gzPCqT6qPOWM+SVFM1HxGD9fnKnFUdIIv7TtbtnAL8GwkHdph
 G0sehDRu71HTzQWkzLZ7fvRl0U63ZR6fA7fNx7fhqRYoRMEBckzPULB7ADkE58mxMD
 SSrx6+Jm/DYOJHVW2Q9ElaWa1N/wI8hNt5B/09Rw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([94.223.115.42]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1od0Ic0eMv-00COfh; Mon, 12
 Sep 2022 19:54:47 +0200
Message-ID: <c9a4a495-c16d-f274-8cbc-b2c314c50618@gmx.de>
Date: Mon, 12 Sep 2022 19:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
Content-Language: de-DE
From: Arwed Meyer <arwed.meyer@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
 <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
 <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
 <CAFEAcA-9RD_Lxypgm1yM6T_R=SS=LD9JPQbD5SFek4_wrCnKhg@mail.gmail.com>
 <8bb22c23-23b2-8c2c-12e7-24a2f299445c@gmx.de>
In-Reply-To: <8bb22c23-23b2-8c2c-12e7-24a2f299445c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W4OlpilaCyCUYYDqfno4NRHy7Hm3Us/tBlVpNQ910goRXD3GESt
 NjMwf5IYqUWn80XXEw6QgMJ4Jnfl43UIF9vcRzxtBaD7xAVzaLm+311cpIVi+ZTTJPzjqNr
 nBEr4YW0Y79QcZDT1YeCEiiKfdCcDxw1JJHeIhw/5MVh+DRKPhOFSxtruJp5VugIThua8ee
 H+YcWZv9sQeAsOMU+t3Gg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vwCbTYdN6q0=:ZRJAIQs3DnJ02Tp1erOYVi
 ETWjm5yrKCwfxnH6QBo4sV+xMv2nZblLYFnconV/8j0PUlUOgeaqlp6tZSjKcJPd88rZ00KIY
 JFQMHeDE3FpSjom3fQMNDW/X7T6ShPsfo/CBiqmK+2MBawXCyjHfyRD8jVGPeNG6y4/dm5kFg
 8h0Z9YawGELH1FU0oNHLsGtY7NpyMhCuoij5XFoNDz2Yz9K3pG0JRauvRXv6FN1hXb8enJ7Cg
 uXLr9IwsgiydNKhABiMtk8HJksOfU5246Gr1rnJx2QRdb2B5lueUOKMGyZuJKSZYt60KVKN6k
 75ySEHRbNseTzPRQz7H4wuP4E2g++nLMYkCU4u0v2PHjwzEbpC38VEEcYkI6u5ETe3vukmlq1
 4uIsjKZNryDHh9h7rxZIcV6MwZNwQN+guZO8qZK7+w8cbVZZ1F75+H6cJf2T75u9uX/ofFnvO
 bP1VFOQPG8Q6fJouc0L57V/9Gzew4akbuy6KnjjRVW+xQvo0tpHVjbFQTE9rm34/RrZmLdiRs
 pEDmryaXvSPD4sJJn/4oTfhmWR+OhV3aRIyFEAuTwUVZM2ctnkE4Twzj1GPsz2wWYAwxZX0zw
 fZSWLjzBLrG3v4cwJG3nZ48ocEuhlPqlKU1YJK7+Aj1FMPke+hE6jce5+9wdGA9v1SNCHLr3D
 CmpMb2AOJ7Lts9st2B8FYM5W8sPBixIO51wKhP1Uz5TWQIOcjJa2IhQvD0S916+2Ux5ziRgMp
 OwU0/QAx8a5yPuKchffRMflREv2dfhVj6GNUb/l+k+gDhY2VnWjI70nySmzn75XtPd7zEXEuf
 WvGN3Mb3lRX/YgGXGJK90GaLJJ2F2vxMiAZvvad7N73LZVa4e2cSBACTvHgLVkkpNhIqV0rse
 2VPdiRW7ZD0qELeLTEYH8QPdi2nNaJ0xU3jT+rW15n0zztP+rKrhBNmuOtS50btgzgU9wW3jI
 TWY1HCSWJ72JPhiZRqzKyYlfx9Ox8yDgAR7oel/Qf9kLiiaEhx8kvAgwCnxgYHjwRTeypStJn
 Xy3FF6+6cr4D/mCrMCTAS7SF/XOQaDm/a/6dyrq1SO1LWadG7Z4Vqr8nB+M8CfAhOoAsrGj2o
 BJN9pcRPZVkBzcERDOGS5nv5ItJmnD8j0EbIev87CeAs9TgNu2/pbELLArBIEOf4U7/7dDI9b
 DYJLViqP3kuDABBeopcoduhZWx
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 12.09.22 um 19:45 schrieb Arwed Meyer:
> Am 11.09.22 um 20:27 schrieb Peter Maydell:
>> On Sun, 11 Sept 2022 at 18:14, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>>
>>> Am 08.09.22 um 23:11 schrieb Peter Maydell:
>>>> On Thu, 8 Sept 2022 at 18:43, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>>>>
>>>>> Detect mouse reset via RTS or DTR line:
>>>>> Don't send or process anything while in reset.
>>>>> When coming out of reset, send ID sequence first thing.
>>>>> This allows msmouse to be detected by common mouse drivers.
>>>>>
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>>>>> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>>>>
>>>> How does this work across migration? There doesn't seem
>>>> to be anything that handles migration of the existing
>>>> state inside the MouseChardev either, though...
>>
>>> can you please explain in more detail what you don't understand and wh=
at
>>> you mean by "migration"?
>>
>> Migration is when the state of the whole VM is copied from
>> one host to another, or, equivalently, when it is saved to
>> the disk image with 'savevm' to be restarted later. For this
>> to work all the guest-changeable state in the whole VM (all
>> device registers, internal state, etc) has to be saved so
>> it can be reloaded on the destination. My question is basically
>> how this new state in mouse->tiocm, and more generally how
>> the existing other state fields in that struct, are saved
>> and loaded during the migration process. I know how this
>> works for device models, but I'm not sure how chardevs
>> figure into it. (Perhaps the answer is "this shouldn't be
>> a chardev at all" ???)
>>
>> thanks
>> -- PMM
>
> Hi,
>
> thanks for adding some context. Good question.
> Unfortunately I don't know the device and migration code much, so I
> can't really say anything about this. I guess(!) it should be enough to
> save/load contents of struct MouseChardev. No idea if and how this can
> be done though.
> Also since saving/loading device state wasn't supported in the msmouse
> code to begin with, for me this is a new feature and out of scope for
> this patch set.
> The result of this missing feature might be that mouse buttons are
> detected as not pressed and mouse movement data is lost after migration.
>
>
> Regards

... more specific regarding to mouse->tiocm:
Since it is initialized to 0, the device is put to reset after restoring
state/migrating and won't react. You'd probably have to reload the
client's mouse driver to get the mouse up and running again.


Regards

