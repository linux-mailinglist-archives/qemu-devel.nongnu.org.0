Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BB4A59BB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:15:38 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqCH-0005e7-O7
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:15:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEq94-0004GD-Av
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:12:18 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:25275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nEq8y-00030V-KB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:12:18 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-77Qx0gwaNo-LirxI6pV5pQ-1; Tue, 01 Feb 2022 05:11:41 -0500
X-MC-Unique: 77Qx0gwaNo-LirxI6pV5pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A75D8143FD;
 Tue,  1 Feb 2022 10:11:40 +0000 (UTC)
Received: from bahia (unknown [10.39.192.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2C61694DE;
 Tue,  1 Feb 2022 10:11:38 +0000 (UTC)
Date: Tue, 1 Feb 2022 11:11:37 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] tests/9pfs: Use g_autofree and g_autoptr where possible
Message-ID: <20220201111137.732325b4@bahia>
In-Reply-To: <2201667.JLq2WqQvVQ@silver>
References: <20220131163930.61521-1-groug@kaod.org> <2201667.JLq2WqQvVQ@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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

On Mon, 31 Jan 2022 18:43:22 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 31. Januar 2022 17:39:30 CET Greg Kurz wrote:
> > It is recommended to use g_autofree or g_autoptr as it reduces
> > the odds of introducing memory leaks in future changes. Let's do
> > that everywhere a glib allocation is performed.
> >=20
> > The virtio_9p_create_local_test_dir() function needs some extra
> > care though : the template pointer is eventually cached into the
> > local_test_path global variable for the duration of the tests and
> > should not be freed. Add the g_autofree annotation but negate it
> > with g_steal_pointer() to make it clear that the pointer ownership
> > is dropped on purpose.
> >=20
> > Based-on:
> > <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crude=
byte
> > .com> Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > v2: - fix crash with local_test_path
> > ---
> >  tests/qtest/libqos/virtio-9p.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio=
-9p.c
> > index ef96ef006adc..f0ffbc583492 100644
> > --- a/tests/qtest/libqos/virtio-9p.c
> > +++ b/tests/qtest/libqos/virtio-9p.c
> > @@ -37,18 +37,22 @@ static char *concat_path(const char* a, const char*=
 b)
> >      return g_build_filename(a, b, NULL);
> >  }
> >=20
> > -void virtio_9p_create_local_test_dir(void)
> > +static char *make_temp_dir(char *template)
> >  {
> > -    struct stat st;
> > -    char *pwd =3D g_get_current_dir();
> > -    char *template =3D concat_path(pwd, "qtest-9p-local-XXXXXX");
> > -
> > -    local_test_path =3D mkdtemp(template);
> > -    if (!local_test_path) {
> > +    char *path =3D mkdtemp(template);
> > +    if (!path) {
> >          g_test_message("mkdtemp('%s') failed: %s", template,
> > strerror(errno)); }
> > -    g_free(pwd);
> > +    return path;
> > +}
> > +
> > +void virtio_9p_create_local_test_dir(void)
> > +{
> > +    g_autofree char *pwd =3D g_get_current_dir();
> > +    g_autofree char *template =3D concat_path(pwd, "qtest-9p-local-XXX=
XXX");
> > +    struct stat st;
> >=20
> > +    local_test_path =3D make_temp_dir(g_steal_pointer(&template));
>=20
> Quite noisy diff and under the bottom line, it does not fix what it origi=
nally=20
> supposed to: addressing the leak of the global variable 'local_test_path'=
.=20
> g_steal_pointer() simply makes the previous g_autofree prefix pointless.
>=20

The g_autofree and g_steal_pointer() dance is just an idiom that
says "I'm not freeing this pointer on purpose, it will be handled
somewhere else". No big deal. I'll split this in two patches : one
for the leak of 'local_test_path' with a clear comment instead of
g_autofree and one for the remaining g_auto* conversions.

> Why not just moving g_autofree from 'template' to the global variable=20
> 'local_test_path' and avoid all that noise?=20
>=20

Because the 'cleanup' attribute cannot be set on a static variable as
documented in GCC:

cleanup (cleanup_function)

    The cleanup attribute runs a function when the variable goes out of
    scope. This attribute can only be applied to auto function scope
    variables; it may not be applied to parameters or variables with
    static storage duration. The function must take one parameter, a
    pointer to a type compatible with the variable. The return value
    of the function (if any) is ignored.=20

and trying to do so produces:

../../tests/qtest/libqos/virtio-9p.c:32:1: error: =E2=80=98cleanup=E2=80=99=
 attribute ignored [-Werror=3Dattributes]
   32 | static g_autofree char *local_test_path;
      | ^~~~~~
cc1: all warnings being treated as errors

The leak of 'local_test_path' can only be addressed with a g_free()
in its last user, i.e. virtio_9p_remove_local_test_dir().

> >      g_assert(local_test_path !=3D NULL);
> >=20
> >      /* ensure test directory exists now ... */
> > @@ -60,12 +64,11 @@ void virtio_9p_create_local_test_dir(void)
> >  void virtio_9p_remove_local_test_dir(void)
> >  {
> >      g_assert(local_test_path !=3D NULL);
> > -    char *cmd =3D g_strdup_printf("rm -fr '%s'\n", local_test_path);
> > +    g_autofree char *cmd =3D g_strdup_printf("rm -fr '%s'\n",
> > local_test_path); int res =3D system(cmd);
> >      if (res < 0) {
> >          /* ignore error, dummy check to prevent compiler error */
> >      }
> > -    g_free(cmd);
> >  }
> >=20
> >  char *virtio_9p_test_path(const char *path)
> > @@ -209,8 +212,8 @@ static void *virtio_9p_pci_create(void *pci_bus,
> > QGuestAllocator *t_alloc, static void regex_replace(GString *haystack,
> > const char *pattern, const char *replace_fmt, ...)
> >  {
> > -    GRegex *regex;
> > -    char *replace, *s;
> > +    g_autoptr(GRegex) regex =3D NULL;
> > +    g_autofree char *replace =3D NULL, *s =3D NULL;
> >      va_list argp;
> >=20
> >      va_start(argp, replace_fmt);
> > @@ -220,9 +223,6 @@ static void regex_replace(GString *haystack, const =
char
> > *pattern, regex =3D g_regex_new(pattern, 0, 0, NULL);
> >      s =3D g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NUL=
L);
> >      g_string_assign(haystack, s);
> > -    g_free(s);
> > -    g_regex_unref(regex);
> > -    g_free(replace);
> >  }
> >=20
> >  void virtio_9p_assign_local_driver(GString *cmd_line, const char *args=
)
>=20
>=20


