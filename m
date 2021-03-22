Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B434430A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:51:33 +0100 (CET)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOK1q-0005be-Kg
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1lOK0W-00055K-Uj; Mon, 22 Mar 2021 08:50:08 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1lOK0U-0003ST-GI; Mon, 22 Mar 2021 08:50:08 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 77382462C2;
 Mon, 22 Mar 2021 13:44:28 +0100 (CET)
Date: Mon, 22 Mar 2021 13:44:20 +0100
From: Fabian =?iso-8859-1?q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
Subject: Re: Fwd: [PATCH 0/2] block/raw: implemented persistent dirty bitmap
 and ability to dump bitmap content via qapi
To: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Patrik =?iso-8859-2?q?Janou=B9ek?= <pj@patrikjanousek.cz>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
 <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
 <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
In-Reply-To: <a779e20f-4720-3762-fa3d-d15f4980c0fb@patrikjanousek.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1616416414.3jwa7o8xvx.astroid@nora.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=f.gruenbichler@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: lmatejka@kiv.zcu.cz, Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On March 22, 2021 12:27 pm, Patrik Janou=C5=A1ek wrote:
> On 3/22/21 11:48 AM, Max Reitz wrote:
>> Hi,
>>
>> On 20.03.21 11:01, Patrik Janou=C5=A1ek wrote:
>>> I'm sorry, but I forgot to add you to the cc, so I'm forwarding the
>>> patch to you additionally. I don't want to spam the mailing list
>>> unnecessarily.
>>
>> I think it=E2=80=99s better to still CC the list.=C2=A0 It=E2=80=99s so =
full of mail, one
>> more won=E2=80=99t hurt. :)
>>
>> (Re-adding qemu-block and qemu-devel, because the discussion belongs
>> on the list(s).)
>>
>>> -------- Forwarded Message --------
>>> Subject:=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 0/2] block/raw: implemented per=
sistent dirty
>>> bitmap and ability to dump bitmap content via qapi
>>> Date:=C2=A0=C2=A0=C2=A0=C2=A0 Sat, 20 Mar 2021 10:32:33 +0100
>>> From:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanousek.c=
z>
>>> To:=C2=A0=C2=A0=C2=A0=C2=A0 qemu-devel@nongnu.org
>>> CC:=C2=A0=C2=A0=C2=A0=C2=A0 Patrik Janou=C5=A1ek <pj@patrikjanousek.cz>=
, lmatejka@kiv.zcu.cz
>>>
>>>
>>>
>>> Currently, QEMU doesn't support persistent dirty bitmaps for raw format
>>> and also dirty bitmaps are for internal use only, and cannot be accesse=
d
>>> using third-party applications. These facts are very limiting
>>> in case someone would like to develop their own backup tool becaouse
>>> without access to the dirty bitmap it would be possible to implement
>>> only full backups. And without persistent dirty bitmaps, it wouldn't
>>> be possible to keep track of changed data after QEMU is restarted. And
>>> this is exactly what I do as a part of my bachelor thesis. I've
>>> developed a tool that is able to create incremental backups of drives
>>> in raw format that are LVM volumes (ability to create snapshot is
>>> required).
>>
>> Similarly to what Vladimir has said already, the thing is that
>> conceptually I can see no difference between having a raw image with
>> the bitmaps stored in some other file, i.e.:
>>
>> =C2=A0 { "driver": "raw",
>> =C2=A0=C2=A0=C2=A0 "dirty-bitmaps": [ {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.bitmap",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "persistent": true
>> =C2=A0=C2=A0=C2=A0 } ],
>> =C2=A0=C2=A0=C2=A0 "file": {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
>> =C2=A0=C2=A0=C2=A0 } }
>>
>> And having a qcow2 image with the raw data stored in some other file,
>> i.e.:
>>
>> =C2=A0 { "driver": "qcow2",
>> =C2=A0=C2=A0=C2=A0 "file": {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "sdc1.metadata"
>> =C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0 "data-file": {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "driver": "file",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "filename": "/dev/sdc1"
>> =C2=A0=C2=A0=C2=A0 } }
>>
>> (Where sdc1.metadata is a qcow2 file created with
>> =E2=80=9Cdata-file=3D/dev/sdc1,data-file-raw=3Don=E2=80=9D.)
>>
>> To use persistent bitmaps with raw images, you need to add metadata
>> (namely, the bitmaps).=C2=A0 Why not store that metadata in a qcow2 file=
?
>>
>> Max
>=20
> So if I understand it correctly. I can configure dirty bitmaps in the
> latest version of QEMU to be persistently stored in some other file.
> Because even Proxmox Backup Server can't perform an incremental backup
> after restarting QEMU, and that means something to me. I think they
> would implement it if it was that simple.

the main reason we haven't implemented something like that (yet) is not=20
that it is technically difficult, but that we have no way to safeguard=20
against external manipulation of the (raw) image:

- VM is running, backup happens, bitmap represents the delta since this=20
  backup
- VM is stopped
- user/admin does something to VM disk image, believing such an action=20
  is safe because VM is not running
- VM is started again - bitmap does not contain the manual changes
- VM is running, backup happens, backup is inconsistent with actual data=20
  stored in image

because of persistence, this error is now carried forward indefinitely=20
(it might self-correct at some point if all the invalid stuff has been=20
dirtied by the guest).

while it is of course possible to argue that this is entirely the user's=20
fault, it looks like it's the backup software/hypervisor's fault (no=20
indication anything is wrong, backup data is bogus).

it might happen at some point as opt-in feature with all the warnings=20
associated with potentially dangerous features, but for now we are okay=20
with just carrying the bitmap as long as the VM instance is running=20
(including migrations), and having to re-read and chunk/hash the disks=20
for fresh instances. the latter is expensive, but less expensive than=20
having to explain to users why their backups are bogus.

>=20
> Could you please send me simple example on how to configure (via command
> line args) one raw format drive that can store dirty bitmaps
> persistently in other qcow2 file? I may be missing something, but I
> thought QEMU couldn't do it, because Proxmox community wants this
> feature for a long time.
>=20
> Patrik
>=20
>=20
>=20
>=20
>=20
>=20
=


