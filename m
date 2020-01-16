Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03513DEBA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:24:29 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is70W-0005Tx-Ng
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1is6zV-0004yL-F8
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:23:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1is6zR-0006Se-Gu
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:23:25 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34659
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1is6zR-0006SK-DD
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579188201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPOKoubJ7tUWhy9kB3sEs3tecmhWuQNMntzYfFSZCys=;
 b=Ad717oem4SSB3FbUJ9fDd+dRtWPKVi+GTyBpl7F+Rzu99UkVgS7rryNhhdCO9yFvXUgo+x
 VI9D0epPBfVbzs0Me8J1j4C/ixI+OaeOnpqalWP7oFxZ6shJyovL1Tx4nUjsG8LwFBwOUs
 Z6HBmpobSs+Av1hcJlbRSc9Cz93S5UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-f56oqy6zOT2cAHS96bEvqw-1; Thu, 16 Jan 2020 10:23:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA635800D48;
 Thu, 16 Jan 2020 15:23:16 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-48.ams2.redhat.com [10.36.117.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 657A181202;
 Thu, 16 Jan 2020 15:23:13 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:23:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 4/4] block: Mark 'block_resize' as coroutine
Message-ID: <20200116152312.GI9470@linux.fritz.box>
References: <20200115122326.26393-1-kwolf@redhat.com>
 <20200115122326.26393-5-kwolf@redhat.com>
 <87tv4vzqd7.fsf@dusky.pond.sub.org>
 <20200116101333.GA9470@linux.fritz.box>
 <875zhbtox2.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875zhbtox2.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: f56oqy6zOT2cAHS96bEvqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-block@nongnu.org, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2020 um 16:13 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > Am 16.01.2020 um 10:45 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> > block_resize is safe to run in a coroutine, so use it as an example =
for
> >> > the new 'coroutine': true annotation in the QAPI schema.
> >> >
> >> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >> > Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> >
> >> > diff --git a/blockdev.c b/blockdev.c
> >> > index 8e029e9c01..b5e5d1e072 100644
> >> > --- a/blockdev.c
> >> > +++ b/blockdev.c
> >> > @@ -3161,9 +3161,9 @@ void hmp_drive_del(Monitor *mon, const QDict *=
qdict)
> >> >      aio_context_release(aio_context);
> >> >  }
> >> > =20
> >> > -void qmp_block_resize(bool has_device, const char *device,
> >> > -                      bool has_node_name, const char *node_name,
> >> > -                      int64_t size, Error **errp)
> >> > +void coroutine_fn qmp_block_resize(bool has_device, const char *dev=
ice,
> >> > +                                   bool has_node_name, const char *=
node_name,
> >> > +                                   int64_t size, Error **errp)
> >> >  {
> >> >      Error *local_err =3D NULL;
> >> >      BlockBackend *blk =3D NULL;
> >>=20
> >> Pardon my ignorant question: what exactly makes a function a
> >> coroutine_fn?
> >
> > When Stefan requested adding the coroutine_fn marker, it seemed to make
> > sense to me because the QMP dispatcher will always call it from
> > coroutine context now, and being always run in coroutine context makes =
a
> > function a coroutine_fn.
> >
> > However, it's also called from hmp_block_resize(), so at least for now
> > coroutine_fn is actually wrong.
>=20
> This answers the question when we mark a function a coroutine_fn.  I
> meant to ask what conditions the function itself must satisfy to be
> eligible for this mark.

The requirement is actually not about the function itself, it's about
the callers, as stated above.

But being a coroutine_fn allows the function to call other functions
that only work in coroutine context (other coroutine_fns). In the end
the reason why a function only works in coroutine context is usually
that it (or any other coroutine_fns called by it) could yield, which
obviously doesn't work outside of coroutine contest.

Kevin


