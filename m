Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20BF344003
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:40:08 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIul-0001Rv-NM
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOIro-0000Vb-DY; Mon, 22 Mar 2021 07:37:04 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:39999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOIrl-0004F9-Fd; Mon, 22 Mar 2021 07:37:04 -0400
Received: from email.seznam.cz
 by email-smtpc17a.ng.seznam.cz (email-smtpc17a.ng.seznam.cz [10.23.18.18])
 id 2151a144415e86f62762ea53; Mon, 22 Mar 2021 12:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616413016;
 bh=wcEMflGBIbxigMBhbkIDLHV5QWt5WjEYwf9rT+0GDU8=;
 h=Received:To:Cc:References:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=RzE+gFCTkGu/UphyeU3WlGONvQ7Y8qGQp2F3XU2hbXfgro1wna6DU9fXq9Oylaeyn
 39wSLhYeAYKPqqBhn3/qat99D48WVbG5jjxeL73zEWyShLXLNePUghMbnlW5AL8ulT
 Z2G9EMX5JDZ59LXiJ/Ww0RriRoiPWUuS/j1wBlzg=
Received: from [IPv6:2a01:510:d502:b200:c1b:ad27:bde0:341a]
 (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay5.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Mon, 22 Mar 2021 12:36:53 +0100 (CET)  
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu block <qemu-block@nongnu.org>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
 <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
 <4848c5a4-b301-a8d7-b21b-b59ebbeb12c7@patrikjanousek.cz>
 <c65eddbd-d29f-207a-2295-7176a9e65fae@virtuozzo.com>
 <f44119a0-e1fe-862c-4dfc-78cbf50ae83d@virtuozzo.com>
From: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
Message-ID: <c4e59b6c-2c42-c106-8855-ceccdb481447@patrikjanousek.cz>
Date: Mon, 22 Mar 2021 12:36:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f44119a0-e1fe-862c-4dfc-78cbf50ae83d@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/22/21 12:18 PM, Vladimir Sementsov-Ogievskiy wrote:
> 22.03.2021 13:46, Vladimir Sementsov-Ogievskiy wrote:
>> 22.03.2021 13:18, Patrik Janou=C5=A1ek wrote:
>>> On 3/22/21 9:41 AM, Vladimir Sementsov-Ogievskiy wrote:
>>>> 20.03.2021 12:32, Patrik Janou=C5=A1ek wrote:
>>>>> Current implementation of dirty bitmaps for raw format is very
>>>>> limited, because those bitmaps cannot be persistent. Basically it
>>>>> makes sense, because the raw format doesn't have space where could
>>>>> be dirty bitmap stored when QEMU is offline. This patch solves it
>>>>> by storing content of every dirty bitmap in separate file on the
>>>>> host filesystem.
>>>>>
>>>>> However, this only solves one part of the problem. We also have to
>>>>> store information about the existence of the dirty bitmap. This is
>>>>> solved by adding custom options, that stores all required metadata
>>>>> about dirty bitmap (filename where is the bitmap stored on the
>>>>> host filesystem, granularity, persistence, etc.).
>>>>>
>>>>> Signed-off-by: Patrik Janou=C5=A1ek<pj@patrikjanousek.cz>
>>>>
>>>>
>>>> Hmm. Did you considered other ways? Honestly, I don't see a reason f=
or
>>>> yet another storing format for bitmaps.
>>>>
>>>> The task could be simply solved with existing features:
>>>>
>>>> 1. We have extenal-data-file feature in qcow2 (read
>>>> docs/interop/qcow2.txt). With this thing enabled, qcow2 file contain=
s
>>>> only metadata (persistent bitmaps for example) and data is stored in=

>>>> separate sequential raw file. I think you should start from it.
>>>
>>> I didn't know about that feature. I'll look at it.
>>>
>>> In case I use NBD to access the bitmap context and qcow2 as a solutio=
n
>>> for persistent layer. Would the patch be acceptable? This is
>>> significant
>>> change to my solution and I don't have enought time for it at the
>>> moment
>>> (mainly due to other parts of my bachelor's thesis). I just want to
>>> know
>>> if this kind of feature is interesting to you and its implementation =
is
>>> worth my time.
>>
>> Honestly, at this point I think it doesn't. If existing features
>> satisfy your use-case, no reason to increase complexity of file-posix
>> driver and QAPI.
>>
>
> It's unpleasant to say this, keeping in mind that that's your first
> submission :(
>
> I can still recommend in a connection with your bachelor's thesis to
> look at the videos at kvm-forum youtube channel, searching for backup:
>
> =C2=A0
> https://www.youtube.com/channel/UCRCSQmAOh7yzgheq-emy1xA/search?query=3D=
backup
>
> You'll get a lot of information about current developments of external
> backup API.
>
> Also note, that there is (or there will be ?) libvirt Backup API,
> which includes an API for external backup. I don't know the current
> status of it, but if your project is based on libvirt, it's better to
> use libvirt backup API instead of using qemu directly. About Libvirt
> Backup API it's better to ask Eric Blake (adding him to CC).
Unfortunately, my solution is based on Proxmox so I can't use libvirt's
features. I know that a beta version of Proxmox Backup Server has been
released and it would be much better to improve their solution, but they
did it too late so I couldn't change assignment of my bachelor's thesis.


