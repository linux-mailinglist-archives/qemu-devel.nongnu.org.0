Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9C4A3E4C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:44:06 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERM5-0001C5-R0
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:44:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nERE9-0007Ty-Fo
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:35:58 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nERDx-0007iX-OG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:35:43 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-6paJSv4CMKKKVnFDjtO3uw-1; Mon, 31 Jan 2022 02:35:28 -0500
X-MC-Unique: 6paJSv4CMKKKVnFDjtO3uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43DE3801B04;
 Mon, 31 Jan 2022 07:35:27 +0000 (UTC)
Received: from bahia (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21D31F2EB;
 Mon, 31 Jan 2022 07:35:25 +0000 (UTC)
Date: Mon, 31 Jan 2022 08:35:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Message-ID: <20220131083524.4a5d5a8d@bahia>
In-Reply-To: <4981516.0zRxyBk1fS@silver>
References: <20220126171136.672657-1-groug@kaod.org>
 <2336064.2jqZdHoEpY@silver> <4981516.0zRxyBk1fS@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 29 Jan 2022 13:33:59 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 28. Januar 2022 12:49:58 CET Christian Schoenebeck wrote:
> > On Mittwoch, 26. Januar 2022 18:11:36 CET Greg Kurz wrote:
> > > The template pointer in virtio_9p_create_local_test_dir() is leaked.
> > > Add the g_autofree annotation to fix that. While here, convert the
> > > rest of the virtio 9p test code to using g_autofree or g_autoptr
> > > where possible, since this is the preferred approach to avoid potenti=
al
> > > leaks in the future.
> > >=20
> > > Based-on:
> > > <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@cru=
debyt
> > > e
> > > .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >=20
> > >  tests/qtest/libqos/virtio-9p.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> >=20
> > I fear there is something wrong with this patch:
> >=20
> > # Start of local tests
> > # starting QEMU: exec x86_64-softmmu/qemu-system-x86_64 -qtest
> > unix:/tmp/qtest-4234.sock -qtest-log /dev/null -chardev
> > socket,path=3D/tmp/qtest-4234.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=
=3Dcontrol
> > -display none -M pc  -fsdev
> > local,id=3Dfsdev0,path=3D'',security_model=3Dmapped-xattr -device
> > virtio-9p-pci,fsdev=3Dfsdev0,addr=3D04.0,mount_tag=3Dqtest -accel qtest
> > qemu-system-x86_64: -device
> > virtio-9p-pci,fsdev=3Dfsdev0,addr=3D04.0,mount_tag=3Dqtest: cannot init=
ialize
> > fsdev 'fsdev0': failed to open '': No such file or directory Broken pip=
e
> > Aborted
>=20
> Reason ...
>=20
> > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16709b 100=
644
> > > --- a/tests/qtest/libqos/virtio-9p.c
> > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const cha=
r* b)
> > >=20
> > >  void virtio_9p_create_local_test_dir(void)
> > >  {
> > > =20
> > >      struct stat st;
> > >=20
> > > -    char *pwd =3D g_get_current_dir();
> > > -    char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> > > +    g_autofree char *pwd =3D g_get_current_dir();
> > > +    g_autofree char *template =3D concat_path(pwd,
> > > "qtest-9p-local-XXXXXX");
> > >=20
> > >      local_test_path =3D mkdtemp(template);
>=20
> ... mkdtemp() does not allocate a new buffer, it just modifies the charac=
ter=20
> array passed, i.e. the address returned by mkdtemp() equals the address o=
f=20
> variable 'template', and when virtio_9p_create_local_test_dir() scope is =
left,=20
> the global variable 'local_test_path' would then point to freed memory.
>=20

I hate global variables ;-) and the 'Returned result must be freed' comment
in 'concat_path()' is slightly misleading in this respect.

> I would drop g_autofree from template:
>=20
>     char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
>=20
> And if it helps to silence a leak warning (haven't tested), to prepend=20
> g_autofree to the global variable instead:
>=20
> static g_autofree char *local_test_path;
>=20

The way to go is either drop the g_autofree annotation as you're
suggesting, but this would make the comment in 'concat_path()'
even more awkward, or go forward with the glib way and use
g_steal_pointer() which maps exactly to what the code is doing.

> Best regards,
> Christian Schoenebeck
>=20
>=20


