Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F84345202
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:48:33 +0100 (CET)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSPJ-000899-Fp
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOSMr-00071a-Is; Mon, 22 Mar 2021 17:45:45 -0400
Received: from mxe1.seznam.cz ([2a02:598:a::78:34]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lOSMh-0001l9-Uq; Mon, 22 Mar 2021 17:45:41 -0400
Received: from email.seznam.cz
 by email-smtpc3b.ko.seznam.cz (email-smtpc3b.ko.seznam.cz [10.53.13.75])
 id 1dbe46b17db161031b8d0da6; Mon, 22 Mar 2021 22:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616449529;
 bh=IXPNuv3QYGeFFtm37bGAqnvVR4w/wUyRkmn/g0WswPU=;
 h=Received:To:Cc:References:From:Subject:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=xqa5gO7RyWmLDeejODBfYCvqHVBByRdCPeY4dYR/tW/CQQ/xakmbPhZhdjjsQ4amg
 zHeY7vSMSrzMVA5NGMGUm1YRrGUuIR8bK6aImwomfKF2nO9eq0Gf7M00xXHbr42Dx8
 K3nZaWxWiLLuR6kjPwsgcFW9q3VgoIUv3yY017TU=
Received: from [IPv6:2a01:510:d502:b200:c1b:ad27:bde0:341a]
 (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay4.ko.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Mon, 22 Mar 2021 22:45:26 +0100 (CET)  
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
 <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
 <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
 <9f434671-005a-3b84-c6e0-c44e98984189@redhat.com>
From: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>
Subject: Re: Fwd: [PATCH 0/2] block/raw: implemented persistent dirty bitmap
 and ability to dump bitmap content via qapi
Message-ID: <85c9634e-73b0-2f8f-58f9-dd2cacac9851@patrikjanousek.cz>
Date: Mon, 22 Mar 2021 22:45:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9f434671-005a-3b84-c6e0-c44e98984189@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: cs
Received-SPF: pass client-ip=2a02:598:a::78:34;
 envelope-from=pj@patrikjanousek.cz; helo=mxe1.seznam.cz
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

On 3/22/21 1:06 PM, Max Reitz wrote:
> On 22.03.21 12:27, Patrik Janou=C5=A1ek wrote:
>> On 3/22/21 11:48 AM, Max Reitz wrote:
>>> Hi,
>>>
>>> On 20.03.21 11:01, Patrik Janou=C5=A1ek wrote:
>>>> I'm sorry, but I forgot to add you to the cc, so I'm forwarding the
>>>> patch to you additionally. I don't want to spam the mailing list
>>>> unnecessarily.
>>>
>>> I think it=E2=80=99s better to still CC the list.=C2=A0 It=E2=80=99s =
so full of mail, one
>>> more won=E2=80=99t hurt. :)
>>>
>>> (Re-adding qemu-block and qemu-devel, because the discussion belongs
>>> on the list(s).)
>>>
>>>> -------- Forwarded Message --------
>>>> Subject:=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 0/2] block/raw: implemented =
persistent dirty
>>>> bitmap and ability to dump bitmap content via qapi
>>>> Date:=C2=A0=C2=A0=C2=A0=C2=A0 Sat, 20 Mar 2021 10:32:33 +0100
>>>> From:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanouse=
k.cz>
>>>> To:=C2=A0=C2=A0=C2=A0=C2=A0 qemu-devel@nongnu.org
>>>> CC:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanousek.=
cz>, lmatejka@kiv.zcu.cz
>>>>
>>>>
>>>>
>>>> Currently, QEMU doesn't support persistent dirty bitmaps for raw
>>>> format
>>>> and also dirty bitmaps are for internal use only, and cannot be
>>>> accessed
>>>> using third-party applications. These facts are very limiting
>>>> in case someone would like to develop their own backup tool becaouse=

>>>> without access to the dirty bitmap it would be possible to implement=

>>>> only full backups. And without persistent dirty bitmaps, it wouldn't=

>>>> be possible to keep track of changed data after QEMU is restarted. A=
nd
>>>> this is exactly what I do as a part of my bachelor thesis. I've
>>>> developed a tool that is able to create incremental backups of drive=
s
>>>> in raw format that are LVM volumes (ability to create snapshot is
>>>> required).
>>>
>>> Similarly to what Vladimir has said already, the thing is that
>>> conceptually I can see no difference between having a raw image with
>>> the bitmaps stored in some other file, i.e.:
>>>
>>> =C2=A0=C2=A0 { "driver": "raw",
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "dirty-bitmaps": [ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.bitmap",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "persistent": true
>>> =C2=A0=C2=A0=C2=A0=C2=A0 } ],
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "file": {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
>>> =C2=A0=C2=A0=C2=A0=C2=A0 } }
>>>
>>> And having a qcow2 image with the raw data stored in some other file,=

>>> i.e.:
>>>
>>> =C2=A0=C2=A0 { "driver": "qcow2",
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "file": {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.metadata"
>>> =C2=A0=C2=A0=C2=A0=C2=A0 },
>>> =C2=A0=C2=A0=C2=A0=C2=A0 "data-file": {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
>>> =C2=A0=C2=A0=C2=A0=C2=A0 } }
>>>
>>> (Where sdc1.metadata is a qcow2 file created with
>>> =E2=80=9Cdata-file=3D/dev/sdc1,data-file-raw=3Don=E2=80=9D.)
>>>
>>> To use persistent bitmaps with raw images, you need to add metadata
>>> (namely, the bitmaps).=C2=A0 Why not store that metadata in a qcow2 f=
ile?
>>>
>>> Max
>>
>> So if I understand it correctly. I can configure dirty bitmaps in the
>> latest version of QEMU to be persistently stored in some other file.
>> Because even Proxmox Backup Server can't perform an incremental backup=

>> after restarting QEMU, and that means something to me. I think they
>> would implement it if it was that simple.
>>
>> Could you please send me simple example on how to configure (via comma=
nd
>> line args) one raw format drive that can store dirty bitmaps
>> persistently in other qcow2 file? I may be missing something, but I
>> thought QEMU couldn't do it, because Proxmox community wants this
>> feature for a long time.
>
> One trouble is that if you use qemu-img create to create the qcow2
> image, it will always create an empty image, and so if use pass
> data_file to it, it will empty the existing raw image:
>
> $ cp ~/tmp/arch.iso raw.img # Just some Arch Linux ISO
>
> $ qemu-img create \
> =C2=A0=C2=A0=C2=A0 -f qcow2 \
> =C2=A0=C2=A0=C2=A0 -o data_file=3Draw.img,data_file_raw=3Don,preallocat=
ion=3Dmetadata \
> =C2=A0=C2=A0=C2=A0 metadata.qcow2 \
> =C2=A0=C2=A0=C2=A0 $(stat -c '%s' raw.img)
> Formatting 'metadata.qcow2', fmt=3Dqcow2 cluster_size=3D65536
> preallocation=3Dmetadata compression_type=3Dzlib size=3D687865856
> data_file=3Draw.img data_file_raw=3Don lazy_refcounts=3Doff refcount_bi=
ts=3D16
>
> (If you check raw.img at this point, you=E2=80=99ll find that it=E2=80=99=
s empty, so
> you need to copy it from the source again:)
>
> $ cp ~/tmp/arch.iso raw.img
>
> Now if you use metadata.qcow2, the image data will actually all be
> stored in raw.img.
>
>
> To get around the =E2=80=9Ccreating metadata.qcow2 clears raw.img=E2=80=
=9D problem,
> you can either create a temporary empty image of the same size as
> raw.img that you pass to qemu-img create, and then you use qemu-img
> amend to change the data-file pointer (which will not overwrite the
> new data-file=E2=80=99s contents):
>
> $ qemu-img create -f raw tmp.raw $(stat -c '%s' raw.img)
>
> $ qemu-img create \
> =C2=A0=C2=A0=C2=A0 -f qcow2 \
> =C2=A0=C2=A0=C2=A0 -o data_file=3Dtmp.img,data_file_raw=3Don,preallocat=
ion=3Dmetadata \
> =C2=A0=C2=A0=C2=A0 metadata.qcow2 \
> =C2=A0=C2=A0=C2=A0 $(stat -c '%s' raw.img)
> Formatting 'metadata.qcow2', fmt=3Dqcow2 cluster_size=3D65536
> preallocation=3Dmetadata compression_type=3Dzlib size=3D687865856
> data_file=3Dtmp.img data_file_raw=3Don lazy_refcounts=3Doff refcount_bi=
ts=3D16
>
> $ qemu-img amend -o data_file=3Draw.img metadata.qcow2
>
> $ rm tmp.img
>
>
> Or you use the blockdev-create job to create the qcow2 image (because
> contrary to qemu-img create, that will not clear the data file):
>
> $ touch metadata.qcow2
>
> (Note that in the following QMP communication, what I sent and what
> qemu replies is mixed.=C2=A0 Everything that begins with '{ "execute"' =
is
> from me, everything else from qemu.=C2=A0 The number 687865856 is the s=
ize
> of raw.img in bytes.)
>
> $ qemu-system-x86_64 -qmp stdio \
> =C2=A0=C2=A0=C2=A0 -blockdev \
> =C2=A0=C2=A0=C2=A0 '{ "node-name": "metadata-file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "metadata.qcow2" }' \
> =C2=A0=C2=A0=C2=A0 -blockdev \
> =C2=A0=C2=A0=C2=A0 '{ "node-name": "data-file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "raw.img" }'
> {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1, "major": 5},
> "package": "qemu-5.1.0-9.fc33"}, "capabilities": ["oob"]}}
>
> { "execute": "qmp_capabilities" }
> {"return": {}}
>
> { "execute": "blockdev-create",
> =C2=A0 "arguments": {
> =C2=A0=C2=A0=C2=A0 "job-id": "create",
> =C2=A0=C2=A0=C2=A0 "options": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "qcow2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "file": "metadata-file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data-file": "data-file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data-file-raw": true,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "preallocation": "metadata",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "size": 687865856
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0 }
> }
> {"timestamp": {"seconds": 1616414002, "microseconds": 836899},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id":
> "create"}}
> {"timestamp": {"seconds": 1616414002, "microseconds": 837076},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
> "create"}}
> {"return": {}}
> {"timestamp": {"seconds": 1616414002, "microseconds": 870997},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id":
> "create"}}
> {"timestamp": {"seconds": 1616414002, "microseconds": 871099},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id":
> "create"}}
> {"timestamp": {"seconds": 1616414002, "microseconds": 871185},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id":
> "create"}}
>
> { "execute": "job-dismiss", "arguments": { "id": "create" } }
> {"timestamp": {"seconds": 1616414022, "microseconds": 202880},
> "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"=
}}
> {"return": {}}
>
> { "execute": "quit" }
> {"return": {}}
> {"timestamp": {"seconds": 1616414028, "microseconds": 56457}, "event":
> "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>
>
> In any case, in the end you get a metadata.qcow2 that holds the
> metadata and points to raw.img for its data.=C2=A0 So you can use it li=
ke
> this:
>
> $ qemu-system-x86_64 -enable-kvm -m 512 \
> =C2=A0=C2=A0=C2=A0 -blockdev \
> =C2=A0=C2=A0=C2=A0 '{ "node-name": "node0",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "qcow2",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "file": {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "metadata.=
qcow2"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } }' \
> =C2=A0=C2=A0=C2=A0 -device ide-cd,drive=3Dnode0 \
> =C2=A0=C2=A0=C2=A0 -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 0, "minor": 1, "major": 5},
> "package": "qemu-5.1.0-9.fc33"}, "capabilities": ["oob"]}}
>
> { "execute": "qmp_capabilities" }
> {"return": {}}
>
> { "execute": "block-dirty-bitmap-add",
> =C2=A0 "arguments": {
> =C2=A0=C2=A0=C2=A0 "node": "node0",
> =C2=A0=C2=A0=C2=A0 "name": "bmap0",
> =C2=A0=C2=A0=C2=A0 "persistent": true
> =C2=A0 }
> }
> {"return": {}}
>
> { "execute": "quit" }
> {"return": {}}
> {"timestamp": {"seconds": 1616414627, "microseconds": 928250},
> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"=
}}
>
> $ qemu-img info metadata.qcow2
> image: metadata.qcow2
> file format: qcow2
> virtual size: 656 MiB (687865856 bytes)
> disk size: 452 KiB
> cluster_size: 65536
> Format specific information:
> =C2=A0=C2=A0=C2=A0 compat: 1.1
> =C2=A0=C2=A0=C2=A0 compression type: zlib
> =C2=A0=C2=A0=C2=A0 lazy refcounts: false
> =C2=A0=C2=A0=C2=A0 bitmaps:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [0]:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flag=
s:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 [0]: auto
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name=
: bmap0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gran=
ularity: 65536
> =C2=A0=C2=A0=C2=A0 refcount bits: 16
> =C2=A0=C2=A0=C2=A0 data file: raw.img
> =C2=A0=C2=A0=C2=A0 data file raw: true
> =C2=A0=C2=A0=C2=A0 corrupt: false
>
> So the bitmap is now in metadata.qcow2, and as the disk size
> indicates, all the data is still in raw.img.
>
>
> I hope the above helps you.=C2=A0 Sorry if it=E2=80=99s confusing, espe=
cially the
> first part where I=E2=80=99m like =E2=80=9CThe obvious way to create me=
tadata.qcow2
> will delete your data, so here are two alternatives that are weird but
> do what you want.=E2=80=9D
>
> Max

Thank you for exhausting answer. I would also like to thank others for
their comments. I will try to rethink the developed solution and
consider its modifications. Maybe in the future I'll come up with
something you might like.

Regards,
Patrik



