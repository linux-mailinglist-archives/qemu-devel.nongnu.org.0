Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD63B69655C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:50:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvgP-0001Rx-S9; Tue, 14 Feb 2023 08:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRvgN-0001Rm-Eu
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRvgL-0002xu-FR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676382555;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9brtpu84zulMSc6Vj1lANxCoTnHU4cXxxwBXyJKHg8o=;
 b=aN2z1iy0pjiWeUHn4kWBQVYeQX1lqWEV3weJYNxB/vg8I3t/6ZktjYP6r8Xc9iFncUtOzQ
 gHAPg+J3zMQvgjXk/r73bca4gOs67XNgUeLLDg5lk4G2Ci7etk//w/NyuZnJyxNEXOFSzC
 kYzlz0WnUedJ903BRv8JQwh+uBcuOGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-ibB-YSU-NlKMjU2qdmb1AQ-1; Tue, 14 Feb 2023 08:49:14 -0500
X-MC-Unique: ibB-YSU-NlKMjU2qdmb1AQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB9D4280604B;
 Tue, 14 Feb 2023 13:49:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E422166B26;
 Tue, 14 Feb 2023 13:49:10 +0000 (UTC)
Date: Tue, 14 Feb 2023 13:49:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
Message-ID: <Y+uRUyP/xTn6neMk@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
 <873578id74.fsf@pond.sub.org>
 <CAJ+F1CL45o4Ro=0TGZU2yOK2nz9OfMX1jCFRKfDxZfXzRbdoRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CL45o4Ro=0TGZU2yOK2nz9OfMX1jCFRKfDxZfXzRbdoRg@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 05:36:32PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Feb 14, 2023 at 5:34 PM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > marcandre.lureau@redhat.com writes:
> >
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > As per comment, presumably to avoid syscall in critical section.
> > >
> > > Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  monitor/fds.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/monitor/fds.c b/monitor/fds.c
> > > index 26b39a0ce6..03c5e97c35 100644
> > > --- a/monitor/fds.c
> > > +++ b/monitor/fds.c
> > > @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > >          return;
> > >      }
> > >
> > > -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> > > +    qemu_mutex_lock(&cur_mon->mon_lock);
> > >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> > >          if (strcmp(monfd->name, fdname) != 0) {
> > >              continue;
> > > @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > >
> > >          tmp_fd = monfd->fd;
> > >          monfd->fd = fd;
> > > +        qemu_mutex_unlock(&cur_mon->mon_lock);
> > >          /* Make sure close() is outside critical section */
> > >          close(tmp_fd);
> > >          return;
> > > @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > >      monfd->fd = fd;
> > >
> > >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > > +    qemu_mutex_unlock(&cur_mon->mon_lock);
> > >  }
> > >
> > >  void qmp_closefd(const char *fdname, Error **errp)
> >
> > This confused me.  I think I understand now, but let's double-check.
> >
> > You're reverting commit 0210c3b39bef08 for qmp_getfd() because it
> > extended the criticial section beyond the close(), invalidating the
> > comment.  Correct?
> 
> Correct
> 
> > Did it actually break anything?
> 
> Not that I know of (David admitted over IRC that this was not intended)

Conceptually the only risk here is that 'close()' blocks for a
prolonged period of time, which prevents another thread from
acquiring the mutex.

First, the chances of close() blocking are incredibly low for
socket FDs which have not yet been used to transmit data. It
would require a malicious mgmt app to pass an unexpected FD
type that could block but that's quite hard, and we consider
the QMP client be a trusted entity anyway.

As for another thread blocking on the mutex I'm not convinced
that'll happen either. The FD set is scoped to the current
monitor. Almost certainly the FD is going to be consumed by
a later QMP device-add/object-add command, in the same thread.
Processing of that later QMP command will be delayed regardless
of whether the close is inside or outside the critical section.

AFAICT keeping close() oujtside the critical section serves
no purpose and we could just stick with the lock guard and
delete the comment.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


