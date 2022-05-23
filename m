Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A153155D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:57:48 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCJO-0004a8-Mw
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntCHz-0003sH-U1
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntCHx-0003S6-HU
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653328576;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIgf2Vi6/Ajyh/qUNXBjB3DzDQCEtKpl5AlZkZhsUOI=;
 b=P0xHl74RQV2Dpq2go5ySAzQgpeQphMRmNv5V3OZl794+kc5vlCiRzY7FVPciWcPbXLOri1
 zf9WHeqDvJ0t5+H8oPPfn6ANITcr93iQI9JmuItSYY6KwL9dfGCIF8swuniKEgKRzIeRD8
 /CTuYuabO2LR2mfGYq10TkNg8D6BVUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-HY3G-P0FMdGGMDw8LZ3GXg-1; Mon, 23 May 2022 13:56:13 -0400
X-MC-Unique: HY3G-P0FMdGGMDw8LZ3GXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B053817A60;
 Mon, 23 May 2022 17:56:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E91697AD8;
 Mon, 23 May 2022 17:56:11 +0000 (UTC)
Date: Mon, 23 May 2022 18:56:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
Message-ID: <YovKuQ6GZ79Ad9b0@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
 <YouBGRfgzlsGi99n@redhat.com>
 <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKV0U8g9NCpX6LvE6HTVLdNv-RkHxLeaAU2PjeRKVT6fw@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, May 23, 2022 at 07:30:42PM +0200, Marc-André Lureau wrote:
> Hi
> 
> On Mon, May 23, 2022 at 2:43 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Fri, May 13, 2022 at 08:08:11PM +0200, marcandre.lureau@redhat.com
> > wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Used in the next patch, to simplify qga code.
> > >
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  include/qemu/osdep.h |  1 +
> > >  util/osdep.c         | 10 ++++++++--
> > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > index 67cc465416..64f51cfb7a 100644
> > > --- a/include/qemu/osdep.h
> > > +++ b/include/qemu/osdep.h
> > > @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
> > >   */
> > >  int qemu_open_old(const char *name, int flags, ...);
> > >  int qemu_open(const char *name, int flags, Error **errp);
> > > +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error
> > **errp);
> >
> > I don't think we should be exporting this - it is just a variant of the
> > 'qemu_open_old' method that we wanted callers to stop using in favour
> > of explicitly deciding between 'qemu_open' and 'qemu_create'.
> >
> 
> 
> qemu_open() has "/dev/fdset" handling, which qemu-ga and other tools don't
> need.

Right, but exporting this as 'qemu_open_cloexec' is going to mislead
people into thinking it is a better version of 'qemu_open'. This will
cause us to loose support for /dev/fdset in places where we actually
need it.

It is pretty harmless to have /dev/fdset there, even if the tool does
not need it - that's been the case with many QEMU tools for many years.
If we think it is actually a real problem though, we should just have
a way to toggle it on/off from the existing APIs.

eg put  'bool allow_fdset = true"   in softmmu/vl.c, and
'bool allow_fdset = false' in stubs/open.c, and then make
qemu_open_internal conditionalize itself on this global 
variable, so only the system emulators get fdset support
activated.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


