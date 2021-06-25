Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF93B3AB0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 04:03:08 +0200 (CEST)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwbBT-0004sD-Cp
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 22:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lwbAS-0004AN-KH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:02:04 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lwbAO-0000Ue-So
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:02:04 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GB0Xg0tXFzZm7x;
 Fri, 25 Jun 2021 09:58:43 +0800 (CST)
Received: from dggema724-chm.china.huawei.com (10.3.20.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 25 Jun 2021 10:01:45 +0800
Received: from dggema768-chm.china.huawei.com (10.1.198.210) by
 dggema724-chm.china.huawei.com (10.3.20.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 25 Jun 2021 10:01:44 +0800
Received: from dggema768-chm.china.huawei.com ([10.9.48.81]) by
 dggema768-chm.china.huawei.com ([10.9.48.81]) with mapi id 15.01.2176.012;
 Fri, 25 Jun 2021 10:01:45 +0800
From: "linfeng (M)" <linfeng23@huawei.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [v3] migration: fix the memory overwriting risk in add_to_iovec
Thread-Topic: [v3] migration: fix the memory overwriting risk in add_to_iovec
Thread-Index: AQHXZ9I73sKI0YIevkuIU95SXY6uhKsjACAAgAD48DA=
Date: Fri, 25 Jun 2021 02:01:44 +0000
Message-ID: <a007baade93a409ca580fab42d6d74b3@huawei.com>
References: <20210622111549.490-1-linfeng23@huawei.com>
 <20210623015104.218-1-linfeng23@huawei.com> <YNTV3lpfl4R8JQBi@work-vm>
In-Reply-To: <YNTV3lpfl4R8JQBi@work-vm>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.151.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=linfeng23@huawei.com;
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
Cc: "Wangxin \(Alexander\)" <wangxinxin.wang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert(mailto:dgilbert@redhat.com) wrote:
> * Lin Feng (linfeng23@huawei.com) wrote:
> > From: Feng Lin <linfeng23@huawei.com>
> >
> > When testing migration, a Segmentation fault qemu core is generated.
> > 0  error_free (err=3D0x1)
> > 1  0x00007f8b862df647 in qemu_fclose (f=3Df@entry=3D0x55e06c247640)
> > 2  0x00007f8b8516d59a in migrate_fd_cleanup (s=3Ds@entry=3D0x55e06c0e1e=
f0)
> > 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=3D0x55e06c0e1ef0=
)
> > 4  0x00007f8b8626a47f in aio_bh_poll (ctx=3Dctx@entry=3D0x55e06b5a16d0)
> > 5  0x00007f8b8626e71f in aio_dispatch (ctx=3D0x55e06b5a16d0)
> > 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=3D<optimized out>, ca=
llback=3D<optimized out>,
> user_data=3D<optimized out>)
> > 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> > 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> > 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=3D<optimized o=
ut>)
> > 10 0x00007f8b8626cffd in main_loop_wait (nonblocking=3Dnonblocking@entr=
y=3D0)
> > 11 0x00007f8b862ef01f in main_loop ()
> > Using gdb print the struct QEMUFile f =3D {
> >   ...,
> >   iovcnt =3D 65, last_error =3D 21984,
> >   last_error_obj =3D 0x1, shutdown =3D true
> > }
> > Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
> > struct QEMUFile {
> >     ...;
> >     struct iovec iov[MAX_IOV_SIZE];
> >     unsigned int iovcnt;
> >     int last_error;
> >     Error *last_error_obj;
> >     bool shutdown;
> > };
> > iovcnt and last_error is overwrited by add_to_iovec().
> > Right now, add_to_iovec() increase iovcnt before check the limit.
> > And it seems that add_to_iovec() assumes that iovcnt will set to zero
> > in qemu_fflush(). But qemu_fflush() will directly return when f->shutdo=
wn
> > is true.
> >
> > The situation may occur when libvirtd restart during migration, after
> > f->shutdown is set, before calling qemu_file_set_error() in
> > qemu_file_shutdown().
> >
> > So the safiest way is checking the iovcnt before increasing it.
> >
> > Signed-off-by: Feng Lin <linfeng23@huawei.com>
> > ---
> >  migration/qemu-file.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index d6e03dbc0e..f6486cf7bc 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -416,6 +416,9 @@ static int add_to_iovec(QEMUFile *f, const uint8_t =
*buf, size_t size,
> >      {
> >          f->iov[f->iovcnt - 1].iov_len +=3D size;
> >      } else {
> > +        if (f->iovcnt >=3D MAX_IOV_SIZE) {
> > +            goto fflush;
> > +        }
>=20
> Why call qemu_fflush in this case?
> If I understand what you're saying, then we only get to here if a
> previous qemu_fflush has failed, so this should fail as well?
Yes, that's what I mean.

>=20
> How about, something like:
>     if (f->iovcnt >=3D MAX_IOV_SIZE) {
>         /* Should only happen if a previous fflush failed */
>         assert(f->shutdown || !qemu_file_is_writeable(f));
>         return 1;
>     }
>=20
> ?
At first, I'm just thinking that overwriting requires qemu_fflush to reset =
iovcnt and do not consider
the possibility of packet loss caused by other exceptions. It makes more se=
nse to make an assertion
here. Thank you for your suggestions.
>=20
> Dave
>=20
> >          if (may_free) {
> >              set_bit(f->iovcnt, f->may_free);
> >          }
> > @@ -423,12 +426,12 @@ static int add_to_iovec(QEMUFile *f, const uint8_=
t *buf, size_t size,
> >          f->iov[f->iovcnt++].iov_len =3D size;
> >      }
> >
> > -    if (f->iovcnt >=3D MAX_IOV_SIZE) {
> > -        qemu_fflush(f);
> > -        return 1;
> > +    if (f->iovcnt < MAX_IOV_SIZE) {
> > +        return 0;
> >      }
> > -
> > -    return 0;
> > +fflush:
> > +    qemu_fflush(f);
> > +    return 1;
> >  }
> >
> >  static void add_buf_to_iovec(QEMUFile *f, size_t len)
> > --
> > 2.23.0
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


