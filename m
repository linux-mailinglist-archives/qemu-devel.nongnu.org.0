Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B71D5F70
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 11:54:21 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJx3U-0003ZU-Ed
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 05:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iJx2P-0002zU-Iz
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iJx2O-0007UA-Al
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:53:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iJx2O-0007Sf-2T
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:53:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8180D307CDC0;
 Mon, 14 Oct 2019 09:53:10 +0000 (UTC)
Received: from [10.36.116.28] (ovpn-116-28.ams2.redhat.com [10.36.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1515DA2C;
 Mon, 14 Oct 2019 09:53:09 +0000 (UTC)
Subject: Re: [Bug 1847232] [NEW] qemu TCG in s390x mode issue with calculating
 HASH
To: Ivan Warren <ivan@vmfacility.fr>, Cornelia Huck <cohuck@redhat.com>,
 Bug 1847232 <1847232@bugs.launchpad.net>
References: <157053356610.22354.6751604707489617887.malonedeb@gac.canonical.com>
 <20191008141135.11f5a065.cohuck@redhat.com>
 <61ce859f-0817-0eba-7eb8-2c16b3e73889@redhat.com>
 <7a661e58-72df-94bc-4712-f306ce5ee7c6@vmfacility.fr>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8ada8acb-d2ce-a09d-6c9a-b758360edcb2@redhat.com>
Date: Mon, 14 Oct 2019 11:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <7a661e58-72df-94bc-4712-f306ce5ee7c6@vmfacility.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 14 Oct 2019 09:53:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.10.19 16:11, Ivan Warren wrote:
>=20
> On 10/8/2019 3:35 PM, David Hildenbrand wrote:
>> On 08.10.19 14:11, Cornelia Huck wrote:
>>> On Tue, 08 Oct 2019 11:19:25 -0000
>>> Ivan Warren via <qemu-devel@nongnu.org> wrote:
>>>
>>>> Public bug reported:
>>>>
>>>> When using go on s390x on Debian x64 (buster) (host) and debian s390=
x
>>>> (sid) (guest) I run into the following problem :
>>>>
>>>> The following occurs while trying to build a custom project :
>>>>
>>>> go: github.com/FactomProject/basen@v0.0.0-20150613233007-fe3947df716=
e:
>>>> Get
>>>> https://proxy.golang.org/github.com/%21factom%21project/basen/@v/v0.=
0.0-20150613233007-fe3947df716e.mod:
>>>> local error: tls: bad record MAC
>>>>
>>>> Doing a git bisect I find that this problem only occurs on and after
>>>> commit 08ef92d556c584c7faf594ff3af46df456276e1b
>>>>
>>>> Before that commit, all works fine. Past this commit, build always
>>>> fails.
>>> What version are you using? Current master?
>>>
>>> Can you please share your command line?
>>>
>>>> Without any proof, It looks like a hash calculation bug related to u=
sing
>>>> z/Arch vector facilities...
>>> Not an unreasonable guess, cc:ing David in case he has seen that befo=
re.
>>>
>> Can you reproduce with "-cpu qemu,vx=3Doff" added to the QEMU command
>> line? Could be some fallout from vector instruction support. Currently
>> ill, will have a look when I'm feeling better.
>=20
> Reposted with a reply all... (sorry for the duplicates)
>=20
> So it does !
>=20
>=20
> My qemu command line is now (forget the odd funny networking things..)
>=20
> qemu-system-s390x \
>   =C2=A0=C2=A0=C2=A0 -drive
> file=3DDEB002.IMG.NEW,discard=3Dunmap,cache=3Dwriteback,id=3Ddrive-0,if=
=3Dnone \
>   =C2=A0=C2=A0=C2=A0 -device virtio-scsi-ccw,id=3Dvirtio-scsi-0 \
>   =C2=A0=C2=A0=C2=A0 -device scsi-hd,id=3Dscsi-hd-0,drive=3Ddrive-0 \
>   =C2=A0=C2=A0=C2=A0 -m 8G \
>   =C2=A0=C2=A0=C2=A0 -net nic,macaddr=3D52:54:00:00:00:02 \
>   =C2=A0=C2=A0=C2=A0 -net tap,ifname=3Dtaparm,script=3Dno \
>   =C2=A0=C2=A0=C2=A0 -nographic -accel tcg,thread=3Dmulti \
>   =C2=A0=C2=A0=C2=A0 -monitor unix:ms,server,nowait \
>   =C2=A0=C2=A0=C2=A0 -cpu qemu,vx=3Doff \=C2=A0 ##### THAT WAS ADDED as=
 instructed - without it
> everything goes kaput !
>   =C2=A0=C2=A0=C2=A0 -smp 12
>=20
> And using the latest bleeding edge qemu from github, my build works (th=
e
> problem goes away).
>=20
> So the z/Arch vector instructions may have a glitch is a venue to
> consider.. Probably one that couldn't be screened through conventional
> methods.
>=20
> I'm not that versed into z/Arch vector instruction, but if there
> anything I can help with, I will !

I'll have to reproduce, can you outline the steps needed to trigger=20
this? (never had to build a go project before #luckyme ( ;) )). It looks=20
like https://github.com/FactomProject/basen is getting pulled in from=20
some other project?

Thanks!


--=20

Thanks,

David / dhildenb

