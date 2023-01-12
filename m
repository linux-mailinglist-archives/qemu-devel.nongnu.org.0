Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A320E667C4C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:13:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG189-0001vQ-Bk; Thu, 12 Jan 2023 12:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG183-0001uk-7K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pG180-0006BT-Vn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673543556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shRvgpIudX9zu3EGQmG274uZPMLW+cmOsMrYY1LpR2g=;
 b=Pov+x3QUjIb6m8d/T7dPm2E7y7WO/aa7huLsr80eqB/ZIuz8waOpG19f9FIrRJhcqWVH/Z
 FCxL0ULiZyduSTmrrAD0UxVEYSasnM/THWcB6DEaXyi7fEXuxew0sK3JHUv+oQBT8TvWmX
 iUHoerwYWRelJuoYuNKRtJFre4zlQyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-8d6U0eWZOdOT5E872Cqx1g-1; Thu, 12 Jan 2023 12:12:31 -0500
X-MC-Unique: 8d6U0eWZOdOT5E872Cqx1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B18058030CB;
 Thu, 12 Jan 2023 17:12:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF75D1121314;
 Thu, 12 Jan 2023 17:12:29 +0000 (UTC)
Date: Thu, 12 Jan 2023 17:12:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Or Ozeri <oro@il.ibm.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dannyh@il.ibm.com
Subject: Re: [PATCH v4 1/3] block/rbd: encryption nit fixes
Message-ID: <Y8A/e1o0R9sdCMeq@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-2-oro@il.ibm.com>
 <Y7/+d3Zr9ncvCZuV@redhat.com>
 <CAOi1vP8viVkV=asKs0RVq6bxc-9-sxCxF0aNjxFecEnLxuw=yg@mail.gmail.com>
 <Y8AdVTH+sYI0pNnF@redhat.com>
 <CAOi1vP8rR2g8fkFhkDs_dyOzPiechsYS9Q8Xen2Z21reBUO3vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOi1vP8rR2g8fkFhkDs_dyOzPiechsYS9Q8Xen2Z21reBUO3vw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 06:07:58PM +0100, Ilya Dryomov wrote:
> On Thu, Jan 12, 2023 at 3:46 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jan 12, 2023 at 03:26:56PM +0100, Ilya Dryomov wrote:
> > > On Thu, Jan 12, 2023 at 1:35 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Sun, Nov 20, 2022 at 04:28:34AM -0600, Or Ozeri wrote:
> > > > > Add const modifier to passphrases,
> > > > > and remove redundant stack variable passphrase_len.
> > > > >
> > > > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > > > ---
> > > > >  block/rbd.c | 24 ++++++++++--------------
> > > > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > > > >
> > > > > diff --git a/block/rbd.c b/block/rbd.c
> > > > > index f826410f40..e575105e6d 100644
> > > > > --- a/block/rbd.c
> > > > > +++ b/block/rbd.c
> > > > > @@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
> > > > >  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > > > >  static int qemu_rbd_convert_luks_options(
> > > > >          RbdEncryptionOptionsLUKSBase *luks_opts,
> > > > > -        char **passphrase,
> > > > > +        const char **passphrase,
> > > > >          size_t *passphrase_len,
> > > > >          Error **errp)
> > > > >  {
> > > > > @@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
> > > > >  static int qemu_rbd_convert_luks_create_options(
> > > > >          RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> > > > >          rbd_encryption_algorithm_t *alg,
> > > > > -        char **passphrase,
> > > > > +        const char **passphrase,
> > > > >          size_t *passphrase_len,
> > > > >          Error **errp)
> > > > >  {
> > > > > @@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
> > > > >                                        Error **errp)
> > > > >  {
> > > > >      int r = 0;
> > > > > -    g_autofree char *passphrase = NULL;
> > > > > -    size_t passphrase_len;
> > > > > +    g_autofree const char *passphrase = NULL;
> > > >
> > > > This looks wierd.  If it is as const string, why are
> > > > we free'ing it ?  Either want g_autofree, or const,
> > > > but not both.
> > >
> > > Just curious, is it a requirement imposed by g_autofree?  Otherwise
> > > pointer constness and pointee lifetime are completely orthogonal and
> > > freeing (or, in this case, wanting to auto-free) an object referred to
> > > by a const pointer seems perfectly fine to me.
> >
> > Free'ing a const point is not OK
> >
> > $ cat c.c
> > #include <stdlib.h>
> > void bar(const char *foo) {
> >     free(foo);
> > }
> >
> > $ gcc -Wall -c c.c
> > c.c: In function ‘bar’:
> > c.c:5:10: warning: passing argument 1 of ‘free’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> >     5 |     free(foo);
> >       |          ^~~
> > In file included from c.c:2:
> > /usr/include/stdlib.h:568:25: note: expected ‘void *’ but argument is of type ‘const char *’
> >   568 | extern void free (void *__ptr) __THROW;
> >       |                   ~~~~~~^~~~~
> >
> > The g_autofree happens to end up hiding this warning, because the const
> > annotation isn't propagated to the registere callback, but that doesn't
> > mean we should do that.
> >
> > When a programmer sees a variable annotated const, they expect that
> > either someone else is responsible for free'ing it, or that the data
> > is statically initialized or stack allocated and thus doesn't need
> > free'ing.  So g_autofree + const is just wrong.
> 
> FWIW many believe that this specification of free() was a mistake and
> that it should have been specified to take const void *.  Some projects
> actually went ahead and fixed that: kfree() and friends in the Linux
> kernel take const void *, for example.  C++ delete operator works on
> const pointers as well -- because object creation and destruction is
> fundamentally independent of modification.

I'd really not like that as IMHO seeing the 'const' gives an important
hint to developers as to who is responsible for the releasing the pointer

> But this is more of a philosophical thing...  I asked about g_autofree
> because a quick grep revealed a bunch of g_autofree const char * locals
> in the tree.  Or would probably prefer to just drop const here ;)

IMHO those existing cases are all bugs that we should fix, along with
adding a rule to checkpatch.pl to detect this mistake.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


