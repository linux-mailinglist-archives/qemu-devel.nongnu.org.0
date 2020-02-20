Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB016593E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 09:33:00 +0100 (CET)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4hGU-0005ko-O6
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 03:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4hFY-0005J3-ST
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:32:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4hFU-00008Q-KL
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:32:00 -0500
Received: from mail.ispras.ru ([83.149.199.45]:49872)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j4hFT-00007G-B4
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 03:31:56 -0500
Received: from mail.ispras.ru (localhost [127.0.0.1])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2A40FC0101;
 Thu, 20 Feb 2020 11:31:51 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 20 Feb 2020 11:31:51 +0300
From: dovgaluk <dovgaluk@ispras.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: Race condition in overlayed qcow2?
In-Reply-To: <0afe41fc-cc09-5682-a667-574c44fd6da3@virtuozzo.com>
References: <2fb9fb4840d5aa92a716487f83ceb36c@ispras.ru>
 <0afe41fc-cc09-5682-a667-574c44fd6da3@virtuozzo.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <5891b48a131321be62a4a311253da44c@ispras.ru>
X-Sender: dovgaluk@ispras.ru
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 83.149.199.45
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
Cc: kwolf@redhat.com, dovgaluk@ispras.ru, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2020-02-19 19=
:07:
> 19.02.2020 17:32, dovgaluk wrote:
>> I encountered a problem with record/replay of QEMU execution and=20
>> figured out the following, when
>> QEMU is started with one virtual disk connected to the qcow2 image=20
>> with applied 'snapshot' option.
>>=20
>> The patch d710cf575ad5fb3ab329204620de45bfe50caa53 "block/qcow2:=20
>> introduce parallel subrequest handling in read and write"
>> introduces some kind of race condition, which causes difference in the=
=20
>> data read from the disk.
>>=20
>> I detected this by adding the following code, which logs IO operation=20
>> checksum. And this checksum may be different in different runs of the=20
>> same recorded execution.
>>=20
>> logging in blk_aio_complete function:
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("%"PRId64": blk_a=
io_complete\n",=20
>> replay_get_current_icount());
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QEMUIOVector *qiov =3D acb=
->rwco.iobuf;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qiov && qiov->iov) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 si=
ze_t i, j;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ui=
nt64_t sum =3D 0;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
t count =3D 0;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
r (i =3D 0 ; i < qiov->niov ; ++i) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0 ; j < qiov->iov[i].iov_len ; ++j) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sum +=3D ((uint8_t*)qiov->i=
ov[i].iov_base)[j];
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ++count;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qe=
mu_log("--- iobuf offset %"PRIx64" len %x sum:=20
>> %"PRIx64"\n", acb->rwco.offset, count, sum);
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> I tried to get rid of aio task by patching qcow2_co_preadv_part:
>> ret =3D qcow2_co_preadv_task(bs, ret, cluster_offset, offset, cur_byte=
s,=20
>> qiov, qiov_offset);
>>=20
>> That change fixed a bug, but I have no idea what to debug next to=20
>> figure out the exact reason of the failure.
>>=20
>> Do you have any ideas or hints?
>>=20
>=20
> Hi!
>=20
> Hmm, do mean that read from the disk may return wrong data? It would
> be very bad of course :(
> Could you provide a reproducer, so that I can look at it and debug?

It is just a winxp-32 image. I record the execution and replay it with=20
the following command lines:

qemu-system-i386 -icount shift=3D7,rr=3Drecord,rrfile=3Dreplay.bin -m 512=
M=20
-drive file=3Dxp.qcow2,if=3Dnone,id=3Ddevice-34-file,snapshot -drive=20
driver=3Dblkreplay,if=3Dnone,image=3Ddevice-34-file,id=3Ddevice-34-driver=
=20
-device ide-hd,drive=3Ddevice-34-driver,bus=3Dide.0,id=3Ddevice-34 -net n=
one

qemu-system-i386 -icount shift=3D7,rr=3Dreplay,rrfile=3Dreplay.bin -m 512=
M=20
-drive file=3Dxp.qcow2,if=3Dnone,id=3Ddevice-34-file,snapshot -drive=20
driver=3Dblkreplay,if=3Dnone,image=3Ddevice-34-file,id=3Ddevice-34-driver=
=20
-device ide-hd,drive=3Ddevice-34-driver,bus=3Dide.0,id=3Ddevice-34 -net n=
one

Replay stalls at some moment due to the non-determinism of the execution=20
(probably caused by the wrong data read).

> What is exactly the case? May be you have other parallel aio
> operations to the same region?

As far as I understand, all aio operations, initiated by IDE controller,=20
are performed one-by-one.
I don't see anything else in the logs.

> Ideas to experiment:
>=20
> 1. change QCOW2_MAX_WORKERS to 1 or to 2, will it help?

1 or 2 are ok, and 4 or 8 lead to the failures.

> 2. understand what is the case in code: is it read from one or several
> clusters, is it aligned,
> what is the type of clusters, is encryption in use, compression?

There is no encryption and I thinks compression is not enabled too.
Clusters are read from the temporary overlay:

blk_aio_prwv
blk_aio_read_entry
bdrv_co_preadv_part complete offset: 26300000 qiov_offset: 1c200 len:=20
1e00
bdrv_co_preadv_part complete offset: 24723e00 qiov_offset: 0 len: 1c200
bdrv_co_preadv_part complete offset: c0393e00 qiov_offset: 0 len: 1e000
bdrv_co_preadv_part complete offset: c0393e00 qiov_offset: 0 len: 1e000
bdrv_co_preadv_part complete offset: c0393e00 qiov_offset: 0 len: 1e000


> 3. understand what kind of data corruption. What we read instead of
> correct data? Just garbage, or may be zeroes, or what..

Most bytes are the same, but some are different:

< 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00
< 46 49 4c 45 30 00 03 00 18 d1 33 02 00 00 00 00
< 01 00 01 00 38 00 01 00 68 01 00 00 00 04 00 00
< 00 00 00 00 00 00 00 00 04 00 00 00 9d 0e 00 00
< 02 00 00 00 00 00 00 00 10 00 00 00 60 00 00 00
---
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 04 00
> 46 49 4c 45 30 00 03 00 86 78 35 03 00 00 00 00
> 01 00 01 00 38 00 01 00 60 01 00 00 00 04 00 00
> 00 00 00 00 00 00 00 00 04 00 00 00 a1 0e 00 00
> 04 00 00 00 00 00 00 00 10 00 00 00 60 00 00 00

That is strange. I could think, that it was caused by the bugs in
deterministic CPU execution, but the first difference in logs
occur in READ operation (I dump read/write buffers in blk_aio_complete).

Maybe I missed logging in one of the functions?

> and of course best thing would be creating small reproducer, or test
> in tests/qemu-iotests


Pavel Dovgalyuk

