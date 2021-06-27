Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23883B5503
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 21:31:20 +0200 (CEST)
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxaUw-0005S6-PR
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 15:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lxaTT-0004XF-Ne; Sun, 27 Jun 2021 15:29:47 -0400
Received: from kerio.kamp.de ([195.62.97.192]:49201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lxaTR-0006Zk-BM; Sun, 27 Jun 2021 15:29:47 -0400
X-Footer: a2FtcC5kZQ==
Received: from [192.168.178.98] ([79.201.210.135])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Sun, 27 Jun 2021 21:29:29 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
Date: Sun, 27 Jun 2021 21:29:32 +0200
Message-Id: <4B3051D6-3D41-4216-9C58-066C85B233A4@kamp.de>
References: <CAOi1vP8Hp8zHuG0_xB7g8X1sBPAw=oZ4np65--UqBavB4YAXAQ@mail.gmail.com>
In-Reply-To: <CAOi1vP8Hp8zHuG0_xB7g8X1sBPAw=oZ4np65--UqBavB4YAXAQ@mail.gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>
X-Mailer: iPhone Mail (18D70)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com,
 "=?utf-8?Q? Daniel_P._Berrang=C3=A9 ?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 26.06.2021 um 17:57 schrieb Ilya Dryomov <idryomov@gmail.com>:
>=20
> =EF=BB=BFOn Mon, Jun 21, 2021 at 10:49 AM Peter Lieven <pl@kamp.de> wrote:=

>>=20
>>> Am 18.06.21 um 12:34 schrieb Ilya Dryomov:
>>> On Fri, Jun 18, 2021 at 11:00 AM Peter Lieven <pl@kamp.de> wrote:
>>>> Am 16.06.21 um 14:34 schrieb Ilya Dryomov:
>>>>> On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>>>> ---
>>>>>>  block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
>>>>>>  1 file changed, 36 insertions(+), 1 deletion(-)
>>>>>>=20
>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>> index 0d8612a988..ee13f08a74 100644
>>>>>> --- a/block/rbd.c
>>>>>> +++ b/block/rbd.c
>>>>>> @@ -63,7 +63,8 @@ typedef enum {
>>>>>>      RBD_AIO_READ,
>>>>>>      RBD_AIO_WRITE,
>>>>>>      RBD_AIO_DISCARD,
>>>>>> -    RBD_AIO_FLUSH
>>>>>> +    RBD_AIO_FLUSH,
>>>>>> +    RBD_AIO_WRITE_ZEROES
>>>>>>  } RBDAIOCmd;
>>>>>>=20
>>>>>>  typedef struct BDRVRBDState {
>>>>>> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, Q=
Dict *options, int flags,
>>>>>>          }
>>>>>>      }
>>>>>>=20
>>>>>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>>>>>> +    bs->supported_zero_flags =3D BDRV_REQ_MAY_UNMAP;
>>>>> I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
>>>>> does not really have a notion of non-efficient explicit zeroing.
>>>>=20
>>>> This is only true if thick provisioning is supported which is in Octopu=
s onwards, right?
>>> Since Pacific, I think.
>>>=20
>>>> So it would only be correct to set this if thick provisioning is suppor=
ted otherwise we could
>>>>=20
>>>> fail with ENOTSUP and then qemu emulates the zeroing with plain writes.=

>>> I actually had a question about that.  Why are you returning ENOTSUP
>>> in case BDRV_REQ_MAY_UNMAP is not specified and that can't be fulfilled
>>> because librbd is too old for RBD_WRITE_ZEROES_FLAG_THICK_PROVISION?
>>>=20
>>> My understanding has always been that BDRV_REQ_MAY_UNMAP is just
>>> a hint.  Deallocating if BDRV_REQ_MAY_UNMAP is specified is not nice
>>> but should be perfectly acceptable.  It is certainly better than
>>> returning ENOTSUP, particularly if ENOTSUP causes Qemu to do plain
>>> zeroing.
>>=20
>>=20
>> I think this was introduced to support different provisioning modes. If B=
DRV_REQ_MAY_UNMAP is not set
>>=20
>> the caller of bdrv_write_zeroes expects that the driver does thick provis=
ioning. If the driver cannot handle that (efficiently)
>>=20
>> qemu does a plain zero write.
>>=20
>>=20
>> I am still not fully understanding the meaning of the BDRV_REQ_NO_FALLBAC=
K flag. The original commit states that it was introduced for qemu-img to ef=
ficiently
>>=20
>> zero out the target and avoid the slow fallback. When I last worked on qe=
mu-img convert I remember that there was a call to zero out the target if bd=
rv_has_zero_init
>>=20
>> is not 1. It seems hat meanwhile a target_is_zero cmdline switch for qemu=
-img convert was added to let the user assert that a preexisting target is z=
ero.
>>=20
>> Maybe someone can help here if it would be right to set BDRV_REQ_NO_FALLB=
ACK for rbd in either of the 2 cases (thick provisioning is support or not)?=

>=20
> Since no one spoke up I think we should
>=20
> a) remove the BDRV_REQ_MAY_UNMAP check in qemu_rbd_co_pwrite_zeroes()
>   and as a consequence always unmap if librbd is too old
>=20
>   It's not clear what qemu's expectation is but in general Write
>   Zeroes is allowed to unmap.  The only guarantee is that subsequent
>   reads return zeroes, everything else is a hint.  This is how it is
>   specified in the kernel and in the NVMe spec.
>=20
>   In particular, block/nvme.c implements it as follows:
>=20
>   if (flags & BDRV_REQ_MAY_UNMAP) {
>       cdw12 |=3D (1 << 25);
>   }
>=20
>   This sets the Deallocate bit.  But if it's not set, the device may
>   still deallocate:
>=20
>   """
>   If the Deallocate bit (CDW12.DEAC) is set to '1' in a Write Zeroes
>   command, and the namespace supports clearing all bytes to 0h in the
>   values read (e.g., bits 2:0 in the DLFEAT field are set to 001b)
>   from a deallocated logical block and its metadata (excluding
>   protection information), then for each specified logical block, the
>   controller:
>   - should deallocate that logical block;
>=20
>   ...
>=20
>   If the Deallocate bit is cleared to '0' in a Write Zeroes command,
>   and the namespace supports clearing all bytes to 0h in the values
>   read (e.g., bits 2:0 in the DLFEAT field are set to 001b) from
>   a deallocated logical block and its metadata (excluding protection
>   information), then, for each specified logical block, the
>   controller:
>   - may deallocate that logical block;
>   """
>=20
>   https://nvmexpress.org/wp-content/uploads/NVM-Express-NVM-Command-Set-Sp=
ecification-2021.06.02-Ratified-1.pdf
>=20
> b) set BDRV_REQ_NO_FALLBACK in supported_zero_flags
>=20
>   Again, it's not clear what qemu expects here, but without it we end
>   up in a ridiculous situation where specifying the "don't allow slow
>   fallback" switch immediately fails all efficient zeroing requests on
>   a device where Write Zeroes is always efficient:
>=20
>   $ qemu-io -c 'help write' | grep -- '-[zun]'
>    -n, -- with -z, don't allow slow fallback
>    -u, -- with -z, allow unmapping
>    -z, -- write zeroes using blk_co_pwrite_zeroes
>=20
>   $ qemu-io -f rbd -c 'write -z -u -n 0 1M' rbd:foo/bar
>   write failed: Operation not supported

Agreed,
I will try to send a V4 early this week.

Peter



