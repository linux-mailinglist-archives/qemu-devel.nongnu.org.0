Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE13B9A7B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 03:18:39 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz7pG-0000w8-8y
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 21:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lz7oI-00005j-IR
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 21:17:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linfeng23@huawei.com>)
 id 1lz7oC-0007ix-Ni
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 21:17:38 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GGHCh5RnRz76HF;
 Fri,  2 Jul 2021 09:13:52 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 09:17:15 +0800
Received: from dggema768-chm.china.huawei.com (10.1.198.210) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 2 Jul 2021 09:17:15 +0800
Received: from dggema768-chm.china.huawei.com ([10.9.48.81]) by
 dggema768-chm.china.huawei.com ([10.9.48.81]) with mapi id 15.01.2176.012;
 Fri, 2 Jul 2021 09:17:15 +0800
From: "linfeng (M)" <linfeng23@huawei.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [v4] migration: fix the memory overwriting risk in add_to_iovec
Thread-Topic: [v4] migration: fix the memory overwriting risk in add_to_iovec
Thread-Index: AQHXaYpyOXJYCy95pE6k5GCCe/R5FKssSkkAgAEzawCAAJKwQA==
Date: Fri, 2 Jul 2021 01:17:15 +0000
Message-ID: <5f1fb1932dd84d42afba844346b6594a@huawei.com>
References: <20210623015104.218-1-linfeng23@huawei.com>
 <20210625062138.1899-1-linfeng23@huawei.com> <YNyjsmZU2gRGe0K3@work-vm>
 <YN2llAABbktuLCUu@work-vm>
In-Reply-To: <YN2llAABbktuLCUu@work-vm>
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


* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_io=
vec
>=20
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > * Lin Feng (linfeng23@huawei.com) wrote:
> > > From: Feng Lin <linfeng23@huawei.com>
> > >
> > > When testing migration, a Segmentation fault qemu core is generated.
> > > 0  error_free (err=3D0x1)
> > > 1  0x00007f8b862df647 in qemu_fclose (f=3Df@entry=3D0x55e06c247640)
> > > 2  0x00007f8b8516d59a in migrate_fd_cleanup
> > > (s=3Ds@entry=3D0x55e06c0e1ef0)
> > > 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh
> > > (opaque=3D0x55e06c0e1ef0)
> > > 4  0x00007f8b8626a47f in aio_bh_poll (ctx=3Dctx@entry=3D0x55e06b5a16d=
0)
> > > 5  0x00007f8b8626e71f in aio_dispatch (ctx=3D0x55e06b5a16d0)
> > > 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=3D<optimized out>,
> > > callback=3D<optimized out>, user_data=3D<optimized out>)
> > > 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> > > 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> > > 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=3D<optimized
> > > out>)
> > > 10 0x00007f8b8626cffd in main_loop_wait
> > > (nonblocking=3Dnonblocking@entry=3D0)
> > > 11 0x00007f8b862ef01f in main_loop () Using gdb print the struct
> > > QEMUFile f =3D {
> > >   ...,
> > >   iovcnt =3D 65, last_error =3D 21984,
> > >   last_error_obj =3D 0x1, shutdown =3D true } Well iovcnt is overflow=
,
> > > because the max size of MAX_IOV_SIZE is 64.
> > > struct QEMUFile {
> > >     ...;
> > >     struct iovec iov[MAX_IOV_SIZE];
> > >     unsigned int iovcnt;
> > >     int last_error;
> > >     Error *last_error_obj;
> > >     bool shutdown;
> > > };
> > > iovcnt and last_error is overwrited by add_to_iovec().
> > > Right now, add_to_iovec() increase iovcnt before check the limit.
> > > And it seems that add_to_iovec() assumes that iovcnt will set to
> > > zero in qemu_fflush(). But qemu_fflush() will directly return when
> > > f->shutdown is true.
> > >
> > > The situation may occur when libvirtd restart during migration,
> > > after
> > > f->shutdown is set, before calling qemu_file_set_error() in
> > > qemu_file_shutdown().
> > >
> > > So the safiest way is checking the iovcnt before increasing it.
> > >
> > > Signed-off-by: Feng Lin <linfeng23@huawei.com>
> >
> > Queued
>=20
> Hmm this didn't actually build because that function is actually misnamed=
 'qemu_file_is_writable' (no e!);
> I've fixed that, but can you just reconfirm that you've tested this fixes=
 your original problem?
Sorry for that rookie mistake. I have tested it again with gdb-fault inject=
ion. It can fix my original problem.
Thanks for helping me complete my first qemu patch submission. Really helpe=
d a lot.
>=20
> Dave
>=20
> > > ---
> > >  migration/qemu-file.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c index
> > > d6e03dbc0e..6879615197 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8=
_t *buf, size_t size,
> > >      {
> > >          f->iov[f->iovcnt - 1].iov_len +=3D size;
> > >      } else {
> > > +        if (f->iovcnt >=3D MAX_IOV_SIZE) {
> > > +            /* Should only happen if a previous fflush failed */
> > > +            assert(f->shutdown || !qemu_file_is_writeable(f));
> > > +            return 1;
> > > +        }
> > >          if (may_free) {
> > >              set_bit(f->iovcnt, f->may_free);
> > >          }
> > > --
> > > 2.23.0
> > >
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


