Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08105531576
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:17:29 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCcS-0002tx-58
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntCWJ-0005Lp-AR
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntCWE-0005kc-Kc
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653329461;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2uaAAAyF3YHotv2Rl1QHtWhhDeweS3QWT0adBtwP0g=;
 b=HYEciNJzlRgA/DPUmO1f2utiQnZjmhIid4p17CNgE8OJ/pA+dsfSiyCK/b+Yz3A8b0zxpW
 +45pDE/l2eIXrQBs6yGrCUL0apxs3TIT9IgGLNTygWrNDEb94XdcR/DCWm4WgtJAtb9B40
 u/gBCqNc0aCUjRxVer16wp3FWRyWLJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-5hgxdv0TP7GDz_tbRQBsoQ-1; Mon, 23 May 2022 14:10:58 -0400
X-MC-Unique: 5hgxdv0TP7GDz_tbRQBsoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03DAB8015BA;
 Mon, 23 May 2022 18:10:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1F1400E115;
 Mon, 23 May 2022 18:10:56 +0000 (UTC)
Date: Mon, 23 May 2022 19:10:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
Message-ID: <YovOLpiqvMQagD0f@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
 <YouBGRfgzlsGi99n@redhat.com>
 <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
 <YovKuQ6GZ79Ad9b0@redhat.com>
 <CAJ+F1CK9ta=5XKfuH+ec6EOM3kdFmfzf5QZz=bdSquwQxbKW6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK9ta=5XKfuH+ec6EOM3kdFmfzf5QZz=bdSquwQxbKW6g@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 23, 2022 at 08:02:45PM +0200, Marc-André Lureau wrote:
> Hi
> 
> On Mon, May 23, 2022 at 7:56 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-André Lureau wrote:
> > > Hi
> > >
> > > On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrangé <berrange@redhat.com>
> > > wrote:
> > >
> > > > On Fri, May 13, 2022 at 08:08:11PM +0200, marcandre.lureau@redhat.com
> > > > wrote:
> > > > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > >
> > > > > Used in the next patch, to simplify qga code.
> > > > >
> > > > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > > ---
> > > > >  include/qemu/osdep.h |  1 +
> > > > >  util/osdep.c         | 10 ++++++++--
> > > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > > index 67cc465416..64f51cfb7a 100644
> > > > > --- a/include/qemu/osdep.h
> > > > > +++ b/include/qemu/osdep.h
> > > > > @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
> > > > >   */
> > > > >  int qemu_open_old(const char *name, int flags, ...);
> > > > >  int qemu_open(const char *name, int flags, Error **errp);
> > > > > +int qemu_open_cloexec(const char *name, int flags, mode_t mode,
> > Error
> > > > **errp);
> > > >
> > > > I don't think we should be exporting this - it is just a variant of the
> > > > 'qemu_open_old' method that we wanted callers to stop using in favour
> > > > of explicitly deciding between 'qemu_open' and 'qemu_create'.
> > > >
> > >
> > >
> > > qemu_open() has "/dev/fdset" handling, which qemu-ga and other tools
> > don't
> > > need.
> >
> > Right, but exporting this as 'qemu_open_cloexec' is going to mislead
> > people into thinking it is a better version of 'qemu_open'. This will
> > cause us to loose support for /dev/fdset in places where we actually
> > need it.
> >
> 
> > It is pretty harmless to have /dev/fdset there, even if the tool does
> > not need it - that's been the case with many QEMU tools for many years.
> > If we think it is actually a real problem though, we should just have
> > a way to toggle it on/off from the existing APIs.
> >
> >
> It's a bit problematic to make qemu-ga standalone, and have a common shared
> subproject/library.
> 
> Maybe introduce a callback for QEMU/QMP "/dev/fdset" handling ? any better
> idea ?

If we want to make qemu-ga standalone, then IMHO we should be
aggressively switching it to use as many GLib APIs as possible,
eliminating its reliance on any of QEMU's home-grown portability
functions. All the 'FILE *' / 'open' scenarios could be replaced
with GIO's GFile/GInputStream/GOutputStream for example.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


