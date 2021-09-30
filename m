Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E041DC24
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:19:38 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwuP-0004rm-1w
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVws6-0003KY-P7
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:17:14 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:57915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVws0-00004r-H8
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=CkKJLcIryIDm4j4WYpFtwcXclScHgaGQyS6nNVGYzus=; b=XJPgCcEnkEY7SB253k2c5p1O02
 FJEZdOWfagNwWzaaTKsUaxLOz1DytMm84U35ECOTZui5/anHT/DiM2wdQIdRdkp2r93HQl4MRz+TS
 bybNu8x/bN8C320AihRidhuF0g9hF4zBG+y+n25RykP9yxnHqU5ysSlexGk7q/m46Z7321hE4rgPp
 J/gDP8KsUL5L9VR27Z3G2MptWyvCiFesAeguZzzt2fZKeMWw7lZNUbass9dMkY1N9q2nLTKKYwtN5
 N+QFNyClv27chAIiWWwORwtHdLNxkFP2BWlyW0AKmz3VQWaWZVgWdyVAqcUWk7GZ0Sy/fgNq2HctH
 sUHvZ3thfIUh/SIz4DcG32PafpeD/ekDpvV1zOq3hf3oRMWL0UbphiNgbURQyS6hTdnQ2kTcmNB7l
 +oPUevUXI0OPLFGlqeQxYZuDgwM2AXtP+1CWRcfHuRzY640/QNpOqEWVtDafE1wZxntdJ2bd7EVBo
 28A51VT/SJDJMEJm6LnhuI3eBpiMoSbSOX1ekLQSlQNFCWsf1SbykKkjWO+k575n94sxCAuiSSUze
 CRa+2GrOTP0GsT8b+8zRxsdlg5ZyHN7JTBVLaYA0L4KHzKpYf88rwkLXo3JQqvDPuErJ+cOz2+i/d
 wjLpTBVcYfcTPlSh3NCoVPhsCwTYlWDDUjCG3bLtc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Date: Thu, 30 Sep 2021 16:17:03 +0200
Message-ID: <1957451.zGI8nmc6qn@silver>
In-Reply-To: <YVXDQkKdt0bM/w2G@redhat.com>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <4707830.eRlNOxMu1p@silver> <YVXDQkKdt0bM/w2G@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 30. September 2021 16:01:38 CEST Daniel P. Berrang=E9 wrote:
> On Thu, Sep 30, 2021 at 03:55:36PM +0200, Christian Schoenebeck wrote:
> > On Donnerstag, 30. September 2021 15:31:10 CEST Daniel P. Berrang=E9 wr=
ote:
> > > On Thu, Sep 30, 2021 at 03:20:19PM +0200, Christian Schoenebeck wrote:
> > > > On Mittwoch, 29. September 2021 19:48:38 CEST Daniel P. Berrang=E9=
=20
wrote:
> > > > > On Wed, Sep 29, 2021 at 07:32:39PM +0200, Christian Schoenebeck=20
wrote:
> > > > > > On Dienstag, 28. September 2021 18:41:17 CEST Daniel P. Berrang=
=E9
> >=20
> > wrote:
> > > > > > > On Tue, Sep 28, 2021 at 06:23:23PM +0200, Christian Schoenebe=
ck
> >=20
> > wrote:
> > > > > > > > On Dienstag, 28. September 2021 15:04:36 CEST Daniel P.
> > > > > > > > Berrang=E9
> > > >=20
> > > > wrote:
> > > > > > > > > On Sun, Aug 22, 2021 at 03:16:46PM +0200, Christian
> > > > > > > > > Schoenebeck
> > > >=20
> > > > wrote:
> > > > > > [...]
> > > > > >=20
> > > > > > > The GLib automatic memory support is explicitly designed to be
> > > > > > > extendd
> > > > > > > with support for application specific types. We already do
> > > > > > > exactly
> > > > > > > that
> > > > > > > all over QEMU with many calls to
> > > > > > > G_DEFINE_AUTOPTR_CLEANUP_FUNC(..)
> > > > > > > to
> > > > > > > register functions for free'ing specific types, such that you
> > > > > > > can
> > > > > > > use 'g_autoptr' with them.
> > > > > >=20
> > > > > > Ok, just to make sure that I am not missing something here,
> > > > > > because
> > > > > > really
> > > > > > if there is already something that does the job that I simply
> > > > > > haven't
> > > > > > seen, then I happily drop this QArray code.
> > > > >=20
> > > > > I don't believe there is anything that currently addresses this
> > > > > well.
> > > > >=20
> > > > > > But AFAICS this G_DEFINE_AUTOPTR_CLEANUP_FUNC() & g_autoptr
> > > > > > concept
> > > > > > does
> > > > > > not have any notion of "size" or "amount", right?
> > > > >=20
> > > > > Correct, all it knows is that there's a data type and an associat=
ed
> > > > > free function.
> > > >=20
> > > > Ok, thanks for the clarification.
> > > >=20
> > > > > > So let's say you already have the following type and cleanup
> > > > > > function
> > > > > > in
> > > > > > your existing code:
> > > > > >=20
> > > > > > typedef struct MyScalar {
> > > > > >=20
> > > > > >     int a;
> > > > > >     char *b;
> > > > > >=20
> > > > > > } MyScalar;
> > > > > >=20
> > > > > > void myscalar_free(MayScalar *s) {
> > > > > >=20
> > > > > >     g_free(s->b);
> > > > > >=20
> > > > > > }
> > > > > >=20
> > > > > > Then if you want to use G_DEFINE_AUTOPTR_CLEANUP_FUNC() for an
> > > > > > array
> > > > > > on
> > > > > > that scalar type, then you still would need to *manually* write
> > > > > > additionally a separate type and cleanup function like:
> > > > > >=20
> > > > > > typedef struct MyArray {
> > > > > >=20
> > > > > >     MyScalar *s;
> > > > > >     int n;
> > > > > >=20
> > > > > > };
> > > > > >=20
> > > > > > void myarray_free(MyArray *a) {
> > > > > >=20
> > > > > >     for (int i =3D 0; i < a->n; ++i) {
> > > > > >    =20
> > > > > >         myscalar_free(a->s[i]);
> > > > > >    =20
> > > > > >     }
> > > > > >     g_free(a);
> > > > > >=20
> > > > > > }
> > > > > >=20
> > > > > > Plus you have to manually populate that field 'n' after
> > > > > > allocation.
> > > > > >=20
> > > > > > Am I wrong?
> > > > >=20
> > > > > Yes and no.  You can of course manually write all these stuff
> > > > > as you describe, but since we expect the array wrappers to be
> > > > > needed for more than one type it makes more sense to have
> > > > > that all done via macros.
> > > > >=20
> > > > > Your patch contains a DECLARE_QARRAY_TYPE and DEFINE_QARRAY_TYPE
> > > > > that provide all this reqiured boilerplate code.  The essential
> > > > > difference that I'm suggesting is that the array struct type emit=
ted
> > > > > by the macro is explicitly visible as a concept to calling code s=
uch
> > > > > that it is used directly used with g_autoptr.
> > > >=20
> > > > I got that, but your preferred user pattern was this:
> > > >     DECLARE_QARRAY_TYPE(Foo);
> > > > 	=20
> > > > 	 ...
> > > > 	=20
> > > >     g_autoptr(FooArray) foos =3D foo_array_new(n);
> > > >=20
> > > > I don't see a portable way to do upper-case to lower-case conversion
> > > > with
> > > > the>
> > > >=20
> > > > C preprocessor. So you would end up like this instead:
> > > >     g_autoptr(FooArray) foos =3D Foo_array_new(n);
> > > >=20
> > > > Which does not really fit into common QEMU naming conventions eithe=
r,
> > > > does
> > > > it?
> > >=20
> > > Right, it would need to be a two arg macro:
> > >   DECLARE_QARRAY_TYPE(Foo, foo);
> > >=20
> > > similar to what we do with macros for declaring QOM types becuase of
> > > the same case conversion needs.
> > >=20
> > > > And I can help it, I don't see what's wrong in exposing a regular
> > > > C-array
> > > > to user code. I mean in the Linux kernel for instance it is absolut=
ely
> > > > normal to convert from a compound structure to its parent structure=
=2E I
> > > > don't find anything magical about that and it is simply less code a=
nd
> > > > better readable.
> > >=20
> > > QEMU code is not Linux code. We're following the GLib practices for
> > > automatic memory deallocation, and QOM is also modelled on GLib. The
> > > proposal looks magical from the POV of QEMU's code patterns, as it is
> > > not making use of GLib's g_auto* code.
> >=20
> > Hmm, I start to think whether I should just make it some 9p local utili=
ty
> > code for now instead, e.g. "P9Array" or something.
>=20
> IMHO even if it was private to a subsystem it should still be using the
> standard g_auto functionality for automatically deallocating memory,
> because this is a QEMU wide standard.

There are already things like V9fsString, V9fsPath, ... not introduced by m=
e=20
BTW. There is a whole bunch of stuff that you could argue that it does not=
=20
comply with common project patterns and nobody cared about.

I follow project standards wherever possible. But in this particular case, =
if=20
it does not fit, it simply does not fit. So I will go on making at a local=
=20
type for now and if there is really some need for project wide usage we can=
=20
resume that issue at a later point.

Best regards,
Christian Schoenebeck



