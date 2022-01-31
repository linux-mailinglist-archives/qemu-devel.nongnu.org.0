Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723B4A4AA6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:33:37 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYgS-0001Cx-7p
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEXx1-0006xk-UM
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:46:48 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEXwv-0006UV-Uq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:46:38 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-RInDkDDrN9Wspg1NdjYolQ-1; Mon, 31 Jan 2022 09:44:49 -0500
X-MC-Unique: RInDkDDrN9Wspg1NdjYolQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B865D100C661;
 Mon, 31 Jan 2022 14:44:48 +0000 (UTC)
Received: from bahia (unknown [10.39.196.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8934784A25;
 Mon, 31 Jan 2022 14:44:47 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:44:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: Use g_autofree and g_autoptr where possible
Message-ID: <20220131154408.4b9fab8e@bahia>
In-Reply-To: <8838481.laWMekmXc4@silver>
References: <20220126171136.672657-1-groug@kaod.org>
 <4981516.0zRxyBk1fS@silver> <20220131083524.4a5d5a8d@bahia>
 <8838481.laWMekmXc4@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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

On Mon, 31 Jan 2022 13:37:23 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 31. Januar 2022 08:35:24 CET Greg Kurz wrote:
> > > > > diff --git a/tests/qtest/libqos/virtio-9p.c
> > > > > b/tests/qtest/libqos/virtio-9p.c index ef96ef006adc..0a0d0d16709b
> > > > > 100644
> > > > > --- a/tests/qtest/libqos/virtio-9p.c
> > > > > +++ b/tests/qtest/libqos/virtio-9p.c
> > > > > @@ -40,14 +40,13 @@ static char *concat_path(const char* a, const
> > > > > char* b)
> > > > >=20
> > > > >  void virtio_9p_create_local_test_dir(void)
> > > > >  {
> > > > > =20
> > > > >      struct stat st;
> > > > >=20
> > > > > -    char *pwd =3D g_get_current_dir();
> > > > > -    char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX")=
;
> > > > > +    g_autofree char *pwd =3D g_get_current_dir();
> > > > > +    g_autofree char *template =3D concat_path(pwd,
> > > > > "qtest-9p-local-XXXXXX");
> > > > >=20
> > > > >      local_test_path =3D mkdtemp(template);
> > >=20
> > > ... mkdtemp() does not allocate a new buffer, it just modifies the
> > > character array passed, i.e. the address returned by mkdtemp() equals=
 the
> > > address of variable 'template', and when
> > > virtio_9p_create_local_test_dir() scope is left, the global variable
> > > 'local_test_path' would then point to freed memory.
> > I hate global variables ;-) and the 'Returned result must be freed' com=
ment
> > in 'concat_path()' is slightly misleading in this respect.
>=20
> About the global variable: sure, I am not happy about it either. What I
> disliked even more is that virtio_9p_create_local_test_dir() is called fr=
om a
> constructor, but as I described in [1] I did not find a realiable alterna=
tive.
> If somebody comes up with a working and reliable, clean alternative, very=
 much
> appreciated!
>=20

An alternative might be to create/remove the test directory when
a virtio-9p device is started/destroyed, and keeping the string
under the QVirtio9p structure. The most notable effect would be
to have a new directory for each individual test instead of
all the lifetime of qos-test, but it doesn't hurt. I'll have a look.

> About the concat_path() comment: I don't understand what's supposed to be
> misleading about the comment, concat_path() is just a one-liner utility
> function:
>=20
> /* Concatenates the passed 2 pathes. Returned result must be freed. */
> static char *concat_path(const char* a, const char* b)
> {
>     return g_build_filename(a, b, NULL);
> }
>=20
> So all the comment sais is that the function allocates memory that it doe=
s not
> free on it its own. The called glib function sais this [2]:
>=20
>     "A newly-allocated string that must be freed with g_free()."
>=20
> [1] https://github.com/qemu/qemu/commit/136b7af22774a6f0fb44c9c1b8c088b52=
e2e92ed
> [2] https://docs.gtk.org/glib/func.build_filename.html
>=20

Sure, maybe misleading isn't the right wording, but it certainly
tricked my into adding g_autofree while completely missing the
pointer ended up in a global... :-)

> >=20
> > > I would drop g_autofree from template:
> > >     char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> > >=20
> > > And if it helps to silence a leak warning (haven't tested), to prepen=
d
> > > g_autofree to the global variable instead:
> > >=20
> > > static g_autofree char *local_test_path;
> >=20
> > The way to go is either drop the g_autofree annotation as you're
> > suggesting, but this would make the comment in 'concat_path()'
> > even more awkward, or go forward with the glib way and use
> > g_steal_pointer() which maps exactly to what the code is doing.
>=20
> I am fine either way, as long as the resulting behaviour works.
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


