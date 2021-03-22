Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF7343FC4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:30:49 +0100 (CET)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIlk-0003XC-3p
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOIj5-0001Q2-OD; Mon, 22 Mar 2021 07:28:03 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:33209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOIj2-00077G-T5; Mon, 22 Mar 2021 07:28:03 -0400
Received: from email.seznam.cz
 by email-smtpc23b.ng.seznam.cz (email-smtpc23b.ng.seznam.cz [10.23.18.31])
 id 1aaf2c807aa00b321c9c6797; Mon, 22 Mar 2021 12:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616412476;
 bh=2yyRxzRDnP2K9N3+Gp9YPVxFGg8fBlfFRVJyGZLv4Cg=;
 h=Received:To:Cc:References:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=FtNo/b9q/A5S0mDswAk4d1xUJsjlgm8jMBjVHqKMCY1sLSy1CMVisnUFYINpd9Zy9
 dRDLnrJ/njKMdMexQp518wez3pvmZ0ajtYWr3eBQ/hj5Q451m7sZC2m7tpiKaQXFlW
 tWuLTCTfiuGrTz/zxrEpNlJ+mANaehlENt1bmcV4=
Received: from [IPv6:2a01:510:d502:b200:c1b:ad27:bde0:341a]
 (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay13.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Mon, 22 Mar 2021 12:27:52 +0100 (CET)  
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
 <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
From: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>
Subject: Re: Fwd: [PATCH 0/2] block/raw: implemented persistent dirty bitmap
 and ability to dump bitmap content via qapi
Message-ID: <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
Date: Mon, 22 Mar 2021 12:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 11:48 AM, Max Reitz wrote:
> Hi,
>
> On 20.03.21 11:01, Patrik Janou=C5=A1ek wrote:
>> I'm sorry, but I forgot to add you to the cc, so I'm forwarding the
>> patch to you additionally. I don't want to spam the mailing list
>> unnecessarily.
>
> I think it=E2=80=99s better to still CC the list.=C2=A0 It=E2=80=99s so=
 full of mail, one
> more won=E2=80=99t hurt. :)
>
> (Re-adding qemu-block and qemu-devel, because the discussion belongs
> on the list(s).)
>
>> -------- Forwarded Message --------
>> Subject:=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 0/2] block/raw: implemented pe=
rsistent dirty
>> bitmap and ability to dump bitmap content via qapi
>> Date:=C2=A0=C2=A0=C2=A0=C2=A0 Sat, 20 Mar 2021 10:32:33 +0100
>> From:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanousek.=
cz>
>> To:=C2=A0=C2=A0=C2=A0=C2=A0 qemu-devel@nongnu.org
>> CC:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanousek.cz=
>, lmatejka@kiv.zcu.cz
>>
>>
>>
>> Currently, QEMU doesn't support persistent dirty bitmaps for raw forma=
t
>> and also dirty bitmaps are for internal use only, and cannot be access=
ed
>> using third-party applications. These facts are very limiting
>> in case someone would like to develop their own backup tool becaouse
>> without access to the dirty bitmap it would be possible to implement
>> only full backups. And without persistent dirty bitmaps, it wouldn't
>> be possible to keep track of changed data after QEMU is restarted. And=

>> this is exactly what I do as a part of my bachelor thesis. I've
>> developed a tool that is able to create incremental backups of drives
>> in raw format that are LVM volumes (ability to create snapshot is
>> required).
>
> Similarly to what Vladimir has said already, the thing is that
> conceptually I can see no difference between having a raw image with
> the bitmaps stored in some other file, i.e.:
>
> =C2=A0 { "driver": "raw",
> =C2=A0=C2=A0=C2=A0 "dirty-bitmaps": [ {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.bitmap",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "persistent": true
> =C2=A0=C2=A0=C2=A0 } ],
> =C2=A0=C2=A0=C2=A0 "file": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
> =C2=A0=C2=A0=C2=A0 } }
>
> And having a qcow2 image with the raw data stored in some other file,
> i.e.:
>
> =C2=A0 { "driver": "qcow2",
> =C2=A0=C2=A0=C2=A0 "file": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.metadata"
> =C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0 "data-file": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
> =C2=A0=C2=A0=C2=A0 } }
>
> (Where sdc1.metadata is a qcow2 file created with
> =E2=80=9Cdata-file=3D/dev/sdc1,data-file-raw=3Don=E2=80=9D.)
>
> To use persistent bitmaps with raw images, you need to add metadata
> (namely, the bitmaps).=C2=A0 Why not store that metadata in a qcow2 fil=
e?
>
> Max

So if I understand it correctly. I can configure dirty bitmaps in the
latest version of QEMU to be persistently stored in some other file.
Because even Proxmox Backup Server can't perform an incremental backup
after restarting QEMU, and that means something to me. I think they
would implement it if it was that simple.

Could you please send me simple example on how to configure (via command
line args) one raw format drive that can store dirty bitmaps
persistently in other qcow2 file? I may be missing something, but I
thought QEMU couldn't do it, because Proxmox community wants this
feature for a long time.

Patrik




