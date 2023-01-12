Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DAD667836
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyr4-0003WB-Ow; Thu, 12 Jan 2023 09:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFyr2-0003VT-Bq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFyr0-0004uY-J0
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673534814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BGtI0aXdllGIufv96JzqFd2Px2/oea15P3R3Uuiukk=;
 b=i5IhuvuGTGehLFUCbhaaINdNzho5M7njaaw4PCSYXHTgwKAHKZJXdc+EQrBUU4sN7oz0qh
 oXXZHLPxszWro7NkcVW8IGplaev1pG2XGZubIluOcGkyImutaF9EHO+gkpPIte/ksp1bYZ
 Hw5v3S5dm2IERRZxikBxmZUmBHCNXg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-5oqyLQrAORyhjx_v1q8Zow-1; Thu, 12 Jan 2023 09:46:48 -0500
X-MC-Unique: 5oqyLQrAORyhjx_v1q8Zow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 539CE1C0515D;
 Thu, 12 Jan 2023 14:46:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D46F2026D68;
 Thu, 12 Jan 2023 14:46:47 +0000 (UTC)
Date: Thu, 12 Jan 2023 14:46:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Or Ozeri <oro@il.ibm.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dannyh@il.ibm.com
Subject: Re: [PATCH v4 1/3] block/rbd: encryption nit fixes
Message-ID: <Y8AdVTH+sYI0pNnF@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-2-oro@il.ibm.com>
 <Y7/+d3Zr9ncvCZuV@redhat.com>
 <CAOi1vP8viVkV=asKs0RVq6bxc-9-sxCxF0aNjxFecEnLxuw=yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOi1vP8viVkV=asKs0RVq6bxc-9-sxCxF0aNjxFecEnLxuw=yg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Jan 12, 2023 at 03:26:56PM +0100, Ilya Dryomov wrote:
> On Thu, Jan 12, 2023 at 1:35 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Sun, Nov 20, 2022 at 04:28:34AM -0600, Or Ozeri wrote:
> > > Add const modifier to passphrases,
> > > and remove redundant stack variable passphrase_len.
> > >
> > > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > > ---
> > >  block/rbd.c | 24 ++++++++++--------------
> > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/block/rbd.c b/block/rbd.c
> > > index f826410f40..e575105e6d 100644
> > > --- a/block/rbd.c
> > > +++ b/block/rbd.c
> > > @@ -330,7 +330,7 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
> > >  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > >  static int qemu_rbd_convert_luks_options(
> > >          RbdEncryptionOptionsLUKSBase *luks_opts,
> > > -        char **passphrase,
> > > +        const char **passphrase,
> > >          size_t *passphrase_len,
> > >          Error **errp)
> > >  {
> > > @@ -341,7 +341,7 @@ static int qemu_rbd_convert_luks_options(
> > >  static int qemu_rbd_convert_luks_create_options(
> > >          RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> > >          rbd_encryption_algorithm_t *alg,
> > > -        char **passphrase,
> > > +        const char **passphrase,
> > >          size_t *passphrase_len,
> > >          Error **errp)
> > >  {
> > > @@ -384,8 +384,7 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
> > >                                        Error **errp)
> > >  {
> > >      int r = 0;
> > > -    g_autofree char *passphrase = NULL;
> > > -    size_t passphrase_len;
> > > +    g_autofree const char *passphrase = NULL;
> >
> > This looks wierd.  If it is as const string, why are
> > we free'ing it ?  Either want g_autofree, or const,
> > but not both.
> 
> Just curious, is it a requirement imposed by g_autofree?  Otherwise
> pointer constness and pointee lifetime are completely orthogonal and
> freeing (or, in this case, wanting to auto-free) an object referred to
> by a const pointer seems perfectly fine to me.

Free'ing a const point is not OK

$ cat c.c
#include <stdlib.h>
void bar(const char *foo) {
    free(foo);
}

$ gcc -Wall -c c.c
c.c: In function ‘bar’:
c.c:5:10: warning: passing argument 1 of ‘free’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
    5 |     free(foo);
      |          ^~~
In file included from c.c:2:
/usr/include/stdlib.h:568:25: note: expected ‘void *’ but argument is of type ‘const char *’
  568 | extern void free (void *__ptr) __THROW;
      |                   ~~~~~~^~~~~


The g_autofree happens to end up hiding this warning, because the const
annotation isn't propagated to the registere callback, but that doesn't
mean we should do that.

When a programmer sees a variable annotated const, they expect that
either someone else is responsible for free'ing it, or that the data
is statically initialized or stack allocated and thus doesn't need
free'ing.  So g_autofree + const is just wrong.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


