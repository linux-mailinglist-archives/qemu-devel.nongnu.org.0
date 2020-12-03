Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AE2CD00D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 08:06:35 +0100 (CET)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkihF-0000J7-PZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 02:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkifV-0008DD-Oi; Thu, 03 Dec 2020 02:04:45 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkifQ-0004XD-OR; Thu, 03 Dec 2020 02:04:45 -0500
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Cmmz9041dz4yKH;
 Thu,  3 Dec 2020 15:04:05 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Thu, 3 Dec 2020 15:04:22 +0800
From: ganqixin <ganqixin@huawei.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: RE: [PATCH 4/4] block/iscsi.c: Use lock guard macros
Thread-Topic: [PATCH 4/4] block/iscsi.c: Use lock guard macros
Thread-Index: AQHWtykaqwPMBkMa/UuL7yyVFfFct6njQ2QAgAHQoSA=
Date: Thu, 3 Dec 2020 07:04:22 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065DF620@DGGEMI525-MBS.china.huawei.com>
References: <20201109154327.325675-1-ganqixin@huawei.com>
 <20201109154327.325675-5-ganqixin@huawei.com>
 <20201202111142.GC16765@merkur.fritz.box>
In-Reply-To: <20201202111142.GC16765@merkur.fritz.box>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=ganqixin@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "dnbrdsky@gmail.com" <dnbrdsky@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Kevin Wolf [mailto:kwolf@redhat.com]
> Sent: Wednesday, December 2, 2020 7:12 PM
> To: ganqixin <ganqixin@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org;
> pbonzini@redhat.com; mreitz@redhat.com; stefanha@redhat.com;
> dnbrdsky@gmail.com; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
> Subject: Re: [PATCH 4/4] block/iscsi.c: Use lock guard macros
>=20
> Am 09.11.2020 um 16:43 hat Gan Qixin geschrieben:
> > Replace manual lock()/unlock() calls with lock guard macros
> > (QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/iscsi.c.
> >
> > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > ---
> >  block/iscsi.c | 28 +++++++++++++---------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> >
> > diff --git a/block/iscsi.c b/block/iscsi.c index
> > e30a7e3606..f5f657b582 100644
> > --- a/block/iscsi.c
> > +++ b/block/iscsi.c
> > @@ -322,7 +322,7 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
> >      IscsiAIOCB *acb =3D (IscsiAIOCB *)blockacb;
> >      IscsiLun *iscsilun =3D acb->iscsilun;
> >
> > -    qemu_mutex_lock(&iscsilun->mutex);
> > +    QEMU_LOCK_GUARD(&iscsilun->mutex);
> >
> >      /* If it was cancelled or completed already, our work is done here=
 */
> >      if (acb->cancelled || acb->status !=3D -EINPROGRESS) {
>            qemu_mutex_unlock(&iscsilun->mutex);
>            return;
>        }
>=20
> I don't think this qemu_mutex_unlock() is right any more now.

You are right, I ignored this qemu_mutex_unlock(). I will correct it and re=
submit. :)

Thanks,
Gan Qixin

>=20
> Kevin


