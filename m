Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A13BA119
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:17:43 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJ38-0002kY-NT
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lzJ10-0000be-Bu; Fri, 02 Jul 2021 09:15:30 -0400
Received: from kerio.kamp.de ([195.62.97.192]:56800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lzJ0u-0004cF-CU; Fri, 02 Jul 2021 09:15:29 -0400
X-Footer: a2FtcC5kZQ==
Received: from [192.168.178.98] ([79.201.210.135])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Fri, 2 Jul 2021 15:15:14 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V4 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Date: Fri, 2 Jul 2021 15:15:12 +0200
Message-Id: <372DED73-2021-4E8C-A4A3-9F88A679774E@kamp.de>
References: <CAOi1vP_vYeMf+J2SkBef5VFcHMq++sBmDN_ffPWh0Wz8vtBHhg@mail.gmail.com>
In-Reply-To: <CAOi1vP_vYeMf+J2SkBef5VFcHMq++sBmDN_ffPWh0Wz8vtBHhg@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "=?utf-8?Q? Daniel_P._Berrang=C3=A9 ?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 02.07.2021 um 14:46 schrieb Ilya Dryomov <idryomov@gmail.com>:
>=20
> =EF=BB=BFOn Fri, Jul 2, 2021 at 11:09 AM Peter Lieven <pl@kamp.de> wrote:
>>=20
>> this series migrates the qemu rbd driver from the old aio emulation
>> to native coroutines and adds write zeroes support which is important
>> for block operations.
>>=20
>> To achive this we first bump the librbd requirement to the already
>> outdated luminous release of ceph to get rid of some wrappers and
>> ifdef'ry in the code.
>>=20
>> V4->V4:
>> - this patch is now rebased on top of current master
>> - Patch 1: just mention librbd, tweak version numbers [Ilya]
>> - Patch 3: use rbd_get_size instead of rbd_stat [Ilya]
>> - Patch 4: retain comment about using a BH in the callback [Ilya]
>> - Patch 5: set BDRV_REQ_NO_FALLBACK and silently ignore BDRV_REQ_MAY_UNMA=
P [Ilya]
>>=20
>> V2->V3:
>> - this patch is now rebased on top of current master
>> - Patch 1: only use cc.links and not cc.run to not break
>>   cross-compiling. [Kevin]
>>   Since Qemu 6.1 its okay to rely on librbd >=3D 12.x since RHEL-7
>>   support was dropped [Daniel]
>> - Patch 4: dropped
>> - Patch 5: store BDS in RBDTask and use bdrv_get_aio_context() [Kevin]
>>=20
>> V1->V2:
>> - this patch is now rebased on top of current master with Paolos
>>   upcoming fixes for the meson.build script included:
>>    - meson: accept either shared or static libraries if --disable-static
>>    - meson: honor --enable-rbd if cc.links test fails
>> - Patch 1: adjusted to meson.build script
>> - Patch 2: unchanged
>> - Patch 3: new patch
>> - Patch 4: do not implement empty detach_aio_context callback [Jason]
>> - Patch 5: - fix aio completion cleanup in error case [Jason]
>>            - return error codes from librbd
>> - Patch 6: - add support for thick provisioning [Jason]
>>            - do not set write zeroes alignment
>> - Patch 7: new patch
>>=20
>> Peter Lieven (6):
>>  block/rbd: bump librbd requirement to luminous release
>>  block/rbd: store object_size in BDRVRBDState
>>  block/rbd: update s->image_size in qemu_rbd_getlength
>>  block/rbd: migrate from aio to coroutines
>>  block/rbd: add write zeroes support
>>  block/rbd: drop qemu_rbd_refresh_limits
>>=20
>> block/rbd.c | 406 ++++++++++++++++------------------------------------
>> meson.build |   7 +-
>> 2 files changed, 128 insertions(+), 285 deletions(-)
>>=20
>> --
>> 2.17.1
>>=20
>>=20
>=20
> Looks good to me!
>=20
> Kevin picked up Or's encryption patch, so there are a few simple
> conflicts with https://repo.or.cz/qemu/kevin.git block now.  Do you
> want to rebase on top of Kevin's block branch and repost with
> "Based-on: <20210627114635.39326-1-oro@il.ibm.com>" or some such in
> the cover letter or should I?
>=20

Please do, i am already ooo and off for vacation. I wasn=E2=80=99t aware of a=
 conflict in Kevin=E2=80=99s git repo, sorry.

Peter

> Thanks,
>=20
>                Ilya



