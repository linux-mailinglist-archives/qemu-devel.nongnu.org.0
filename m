Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411536A5F09
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX54H-0006nc-0L; Tue, 28 Feb 2023 13:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pX54C-0006lv-9t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pX54A-0006zm-Fo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677610268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78Yer/+yLq311EMDicZXSTAEZfxJ6VrPE1nbxZiDul0=;
 b=FrD+QwCEz9eMs6328Gx2hXom9uhv2p3xGk/mgKj04SXwKKpha4xDqbUsvXMZ3b3/ElsM3F
 wep8Su2lQV6pSHNmhTCGI6FqY+kuABz1d5q73ibwISVqThNQ2scnhzCZM29AEHc5H0rF25
 2CEd/VuZsPbQjkQxqZr0fpg/7PpiceE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-Y0NwxwP8N--x-TK87EPrfw-1; Tue, 28 Feb 2023 13:51:07 -0500
X-MC-Unique: Y0NwxwP8N--x-TK87EPrfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so7278810wma.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 10:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78Yer/+yLq311EMDicZXSTAEZfxJ6VrPE1nbxZiDul0=;
 b=dsJQDrcb2IXGv+syaTZUKvdVGIag63byBFxuPG6BHooLMJIrZDdYswzgWU2jQTb80Q
 WBaZdifp68T8D0eLwuxIORVxlnuRA544oLK2TdLXfSf5IidonSrupJ2uwpRRnA0lDeK2
 9BtgnHKQkXXwjMA06QDInBOBMDiCqy/Xbtgfxd/R8tQZ5lj5drgLd9TJD2mWE30M4MWW
 jRmX3QMHrfl6Qlpg5HJZcILFDnF9PB1SEkKlVFBn0rG8ZRk/MoOdGG5LJfO3ebfZh625
 lVPH2TrVuKV/XNSwE3J+W74Ypnj69GVDCi12tQrYX2RSU9TcRo0ShRyJHdFAD7g/0ZLl
 nZsQ==
X-Gm-Message-State: AO0yUKWDD2Bu2OD7On0+bBqDmJcER/HWBQfH26wNdZQr8z3/ZW+h7RVR
 2aSkMa12blivBUlrhC3eIbMjzl/oF3tIyxQn0JkVxHJAD1ixdRmLTCyauQmglf3wkda6DhV6aWS
 w9JlKn8Y0mTW0xCs=
X-Received: by 2002:adf:f512:0:b0:2c5:5ff8:6b02 with SMTP id
 q18-20020adff512000000b002c55ff86b02mr2984581wro.0.1677610266193; 
 Tue, 28 Feb 2023 10:51:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZCplMG2PPNFTWEVcd7hZ0YRQbaOWSCNTtCNNPztIS9SN3f47V/S6ro8gKNbj/J/DCnkN2dQ==
X-Received: by 2002:adf:f512:0:b0:2c5:5ff8:6b02 with SMTP id
 q18-20020adff512000000b002c55ff86b02mr2984565wro.0.1677610265907; 
 Tue, 28 Feb 2023 10:51:05 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003e204fdb160sm16760770wmb.3.2023.02.28.10.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 10:51:05 -0800 (PST)
Date: Tue, 28 Feb 2023 18:51:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
Message-ID: <Y/5NFy3tk+4+aH9H@work-vm>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
 <873578id74.fsf@pond.sub.org>
 <CAJ+F1CL45o4Ro=0TGZU2yOK2nz9OfMX1jCFRKfDxZfXzRbdoRg@mail.gmail.com>
 <Y+uRUyP/xTn6neMk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+uRUyP/xTn6neMk@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Feb 14, 2023 at 05:36:32PM +0400, Marc-André Lureau wrote:
> > Hi
> > 
> > On Tue, Feb 14, 2023 at 5:34 PM Markus Armbruster <armbru@redhat.com> wrote:
> > >
> > > marcandre.lureau@redhat.com writes:
> > >
> > > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > As per comment, presumably to avoid syscall in critical section.
> > > >
> > > > Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> > > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >  monitor/fds.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/monitor/fds.c b/monitor/fds.c
> > > > index 26b39a0ce6..03c5e97c35 100644
> > > > --- a/monitor/fds.c
> > > > +++ b/monitor/fds.c
> > > > @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > > >          return;
> > > >      }
> > > >
> > > > -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> > > > +    qemu_mutex_lock(&cur_mon->mon_lock);
> > > >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> > > >          if (strcmp(monfd->name, fdname) != 0) {
> > > >              continue;
> > > > @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > > >
> > > >          tmp_fd = monfd->fd;
> > > >          monfd->fd = fd;
> > > > +        qemu_mutex_unlock(&cur_mon->mon_lock);
> > > >          /* Make sure close() is outside critical section */
> > > >          close(tmp_fd);
> > > >          return;
> > > > @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> > > >      monfd->fd = fd;
> > > >
> > > >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > > > +    qemu_mutex_unlock(&cur_mon->mon_lock);
> > > >  }
> > > >
> > > >  void qmp_closefd(const char *fdname, Error **errp)
> > >
> > > This confused me.  I think I understand now, but let's double-check.
> > >
> > > You're reverting commit 0210c3b39bef08 for qmp_getfd() because it
> > > extended the criticial section beyond the close(), invalidating the
> > > comment.  Correct?
> > 
> > Correct
> > 
> > > Did it actually break anything?
> > 
> > Not that I know of (David admitted over IRC that this was not intended)
> 
> Conceptually the only risk here is that 'close()' blocks for a
> prolonged period of time, which prevents another thread from
> acquiring the mutex.
> 
> First, the chances of close() blocking are incredibly low for
> socket FDs which have not yet been used to transmit data. It
> would require a malicious mgmt app to pass an unexpected FD
> type that could block but that's quite hard, and we consider
> the QMP client be a trusted entity anyway.

I agree it's unlikely; I'm not sure it actually requires something
malicious though; e.g. a managmeent app that is itself blocked,
a socket connection connection over a dead network etc are the ones
we're worrying about - stuff that's not so much slow
as either deadlocked or taking minutes for recovery/timeout.

Dave

> As for another thread blocking on the mutex I'm not convinced
> that'll happen either. The FD set is scoped to the current
> monitor. Almost certainly the FD is going to be consumed by
> a later QMP device-add/object-add command, in the same thread.
> Processing of that later QMP command will be delayed regardless
> of whether the close is inside or outside the critical section.
> 
> AFAICT keeping close() oujtside the critical section serves
> no purpose and we could just stick with the lock guard and
> delete the comment.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


