Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8E16BB62
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 08:57:18 +0100 (CET)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6V5h-00025F-D9
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 02:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1j6V4u-0001eC-RP
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j6V4s-0001KG-II
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:56:28 -0500
Received: from mail.ispras.ru ([83.149.199.45]:44672)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1j6V4s-0001JX-6M
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:56:26 -0500
Received: from mail.ispras.ru (localhost [127.0.0.1])
 by mail.ispras.ru (Postfix) with ESMTPSA id C054BC0101;
 Tue, 25 Feb 2020 10:56:22 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Tue, 25 Feb 2020 10:56:22 +0300
From: dovgaluk <dovgaluk@ispras.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: Race condition in overlayed qcow2?
In-Reply-To: <b408733f-a0d7-62ab-8862-8d70d7148e5f@virtuozzo.com>
References: <2fb9fb4840d5aa92a716487f83ceb36c@ispras.ru>
 <0afe41fc-cc09-5682-a667-574c44fd6da3@virtuozzo.com>
 <5891b48a131321be62a4a311253da44c@ispras.ru>
 <af246719-910b-1394-2f18-b88e3daa9c81@virtuozzo.com>
 <0cbd2c7a-44e1-272f-9995-1ff7e2fb9e36@virtuozzo.com>
 <b3405d429e42bdf03177db1b8f7531ee@ispras.ru>
 <b5811027-388a-98db-fe73-93230b5e29ae@virtuozzo.com>
 <5fe1747e6e7b818d93fd9a7fd0434bed@ispras.ru>
 <99ed3129-9460-dbad-0441-95bad08d5636@virtuozzo.com>
 <796f18ec7246b8d07ac5d6bb59dca71f@ispras.ru>
 <b408733f-a0d7-62ab-8862-8d70d7148e5f@virtuozzo.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <ac41c395f09a4101b7403e4116beba6a@ispras.ru>
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2020-02-25 10=
:27:
> 25.02.2020 8:58, dovgaluk wrote:
>> Vladimir Sementsov-Ogievskiy =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2020-02-21=
 16:23:
>>> 21.02.2020 15:35, dovgaluk wrote:
>>>> Vladimir Sementsov-Ogievskiy =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2020-02-=
21 13:09:
>>>>> 21.02.2020 12:49, dovgaluk wrote:
>>>>>> Vladimir Sementsov-Ogievskiy =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 2020-0=
2-20 12:36:
>>>>>=20
>>>>> So, preadv in file-posix.c returns different results for the same
>>>>> offset, for file which is always opened in RO mode? Sounds=20
>>>>> impossible
>>>>> :)
>>>>=20
>>>> True.
>>>> Maybe my logging is wrong?
>>>>=20
>>>> static ssize_t
>>>> qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t=20
>>>> offset)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ssize_t res =3D preadv(fd, iov, nr_iov, off=
set);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("preadv %x %"PRIx64"\n", fd, (uint=
64_t)offset);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t sum =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int cnt =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0 ; i < nr_iov ; ++i) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int j;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0 ; j < =
(int)iov[i].iov_len ; ++j)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sum +=3D ((uint8_t*)iov[i].iov_base)[j];
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ++cnt;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 qemu_log("size: %x sum: %x\n", cnt, sum);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 assert(cnt =3D=3D res);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 return res;
>>>> }
>>>>=20
>>>=20
>>> Hmm, I don't see any issues here..
>>>=20
>>> Are you absolutely sure, that all these reads are from backing file,
>>> which is read-only and never changed (may be by other processes)?
>>=20
>> Yes, I made a copy and compared the files with binwalk.
>>=20
>>> 2. guest modifies buffers during operation (you can catch it if
>>> allocate personal buffer for preadv, than calculate checksum, then
>>> memcpy to guest buffer)
>>=20
>> I added the following to the qemu_preadv:
>>=20
>>  =C2=A0=C2=A0=C2=A0 // do it again
>>  =C2=A0=C2=A0=C2=A0 unsigned char *buf =3D g_malloc(cnt);
>>  =C2=A0=C2=A0=C2=A0 struct iovec v =3D {buf, cnt};
>>  =C2=A0=C2=A0=C2=A0 res =3D preadv(fd, &v, 1, offset);
>>  =C2=A0=C2=A0=C2=A0 assert(cnt =3D=3D res);
>>  =C2=A0=C2=A0=C2=A0 uint32_t sum2 =3D 0;
>>  =C2=A0=C2=A0=C2=A0 for (i =3D 0 ; i < cnt ; ++i)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sum2 +=3D buf[i];
>>  =C2=A0=C2=A0=C2=A0 g_free(buf);
>>  =C2=A0=C2=A0=C2=A0 qemu_log("--- sum2 =3D %x\n", sum2);
>>  =C2=A0=C2=A0=C2=A0 assert(sum2 =3D=3D sum);
>>=20
>> These two reads give different results.
>> But who can modify the buffer while qcow2 workers filling it with data=
=20
>> from the disk?
>>=20
>=20
> As far as I know, it's guest's buffer, and guest may modify it during
> the operation. So, it may be winxp :)

True, but normally the guest won't do it.

But I noticed that DMA operation which causes the problems has the=20
following set of the buffers:
dma read sg size 20000 offset: c000fe00
--- sg: base: 2eb1000 len: 1000
--- sg: base: 3000000 len: 1000
--- sg: base: 2eb2000 len: 3000
--- sg: base: 3000000 len: 1000
--- sg: base: 2eb5000 len: b000
--- sg: base: 3040000 len: 1000
--- sg: base: 2f41000 len: 3000
--- sg: base: 3000000 len: 1000
--- sg: base: 2f44000 len: 4000
--- sg: base: 3000000 len: 1000
--- sg: base: 2f48000 len: 2000
--- sg: base: 3000000 len: 1000
--- sg: base: 3000000 len: 1000
--- sg: base: 3000000 len: 1000


It means that one DMA transaction performs multiple reads into the same=20
address.
And no races is possible, when there is only one qcow2 worker.
When there are many of them - they can fill this buffer simultaneously.

Pavel Dovgalyuk

