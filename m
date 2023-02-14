Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A658D696A68
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyb2-0000jH-05; Tue, 14 Feb 2023 11:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRyaz-0000iO-Bp
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pRyaw-00049a-TI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676393754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGbsREZhZiAsIzsO6ewk6agd7UkfdsPdox+8GtKKuGc=;
 b=EqI1Nivn0OVFtRYPezTPQCZIkMMeACeR/Qy09eSf5tRF574yJQN3RGLyrBOQfkm+fLmdo9
 dVuqGPhRF1k3quv6IqCFsr/H9mEIdjQfn/3ZWoAiE+oH+MZ2Pj+in5/Tz3c1iACXpq9VwH
 3ybd5dEVAWOUOUtEObIc6i8PUWWVQV4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-cYtBBiGROSmsSo11bVKhrQ-1; Tue, 14 Feb 2023 11:55:53 -0500
X-MC-Unique: cYtBBiGROSmsSo11bVKhrQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so9867581qkb.23
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676393752;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zGbsREZhZiAsIzsO6ewk6agd7UkfdsPdox+8GtKKuGc=;
 b=ntG7ptgO6DF+SNKzzwkWfHlC71LgiSqOvL9SmwAuhl1fH2CWIzGaB/fi27JmTbqFGO
 gSi8bWIbqCxGU/eWQ1xVSSWtlpTWgiqk158+DyCP1G8dNtKV9AyVwoJOSt1HfCuBgJmW
 WsADGaKy6LsbwaMC6p1TZ6lKYdE77HwTy3f8bA8eZdKNbR9tpj42E+Bj1v/dnfccfRbb
 ZLgi/M1YAegmooLw5KteaC8VYRMDEiBtOKTORooaYCJG/csMOQjUrQK/C5zWiHltoRoK
 bRKh09C36Y7Lzvd1yhpTmn85hot8wlm3CeXv5dNhVoVG+P+iqqZ23r3HzlLkJSNqiVDq
 pTkg==
X-Gm-Message-State: AO0yUKW50jvsAq/NTy7HAV0xOkoYIryHiydR7UT5GE/MeVze66EtSb0/
 bWcRWi/O5bdojboy5xNpZ/4fOtGZ11BnqjKmyDEdRLVoTjy9IJ3Ly8o27FaCBfZl1TUisitP0xy
 4wa0bWOtAdN93Gj8=
X-Received: by 2002:a0c:8f02:0:b0:56e:89b9:9a92 with SMTP id
 z2-20020a0c8f02000000b0056e89b99a92mr4857512qvd.0.1676393752441; 
 Tue, 14 Feb 2023 08:55:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8fzbwkkQwF+rXrOLDOVTJ5nW6CCuLdkGSxtZNo7+W4jbOs1whdIEKR/1oE2AgK8su4AS47yA==
X-Received: by 2002:a0c:8f02:0:b0:56e:89b9:9a92 with SMTP id
 z2-20020a0c8f02000000b0056e89b99a92mr4857469qvd.0.1676393752031; 
 Tue, 14 Feb 2023 08:55:52 -0800 (PST)
Received: from x1n ([70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 17-20020ac82091000000b003b960aad697sm11466424qtd.9.2023.02.14.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:55:51 -0800 (PST)
Date: Tue, 14 Feb 2023 11:55:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
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
Message-ID: <Y+u9Efqf+0d0gM8I@x1n>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
 <873578id74.fsf@pond.sub.org>
 <CAJ+F1CL45o4Ro=0TGZU2yOK2nz9OfMX1jCFRKfDxZfXzRbdoRg@mail.gmail.com>
 <Y+uRUyP/xTn6neMk@redhat.com> <871qmsgqs3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qmsgqs3.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Feb 14, 2023 at 05:23:08PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Feb 14, 2023 at 05:36:32PM +0400, Marc-André Lureau wrote:
> >> Hi
> >> 
> >> On Tue, Feb 14, 2023 at 5:34 PM Markus Armbruster <armbru@redhat.com> wrote:
> >> >
> >> > marcandre.lureau@redhat.com writes:
> >> >
> >> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> > >
> >> > > As per comment, presumably to avoid syscall in critical section.
> >> > >
> >> > > Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> >> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> > > ---
> >> > >  monitor/fds.c | 4 +++-
> >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/monitor/fds.c b/monitor/fds.c
> >> > > index 26b39a0ce6..03c5e97c35 100644
> >> > > --- a/monitor/fds.c
> >> > > +++ b/monitor/fds.c
> >> > > @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >> > >          return;
> >> > >      }
> >> > >
> >> > > -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> >> > > +    qemu_mutex_lock(&cur_mon->mon_lock);
> >> > >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> >> > >          if (strcmp(monfd->name, fdname) != 0) {
> >> > >              continue;
> >> > > @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >> > >
> >> > >          tmp_fd = monfd->fd;
> >> > >          monfd->fd = fd;
> >> > > +        qemu_mutex_unlock(&cur_mon->mon_lock);
> >> > >          /* Make sure close() is outside critical section */
> >> > >          close(tmp_fd);
> >> > >          return;
> >> > > @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >> > >      monfd->fd = fd;
> >> > >
> >> > >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> >> > > +    qemu_mutex_unlock(&cur_mon->mon_lock);
> >> > >  }
> >> > >
> >> > >  void qmp_closefd(const char *fdname, Error **errp)
> >> >
> >> > This confused me.  I think I understand now, but let's double-check.
> >> >
> >> > You're reverting commit 0210c3b39bef08 for qmp_getfd() because it
> >> > extended the criticial section beyond the close(), invalidating the
> >> > comment.  Correct?
> >> 
> >> Correct
> >> 
> >> > Did it actually break anything?
> >> 
> >> Not that I know of (David admitted over IRC that this was not intended)
> >
> > Conceptually the only risk here is that 'close()' blocks for a
> > prolonged period of time, which prevents another thread from
> > acquiring the mutex.
> >
> > First, the chances of close() blocking are incredibly low for
> > socket FDs which have not yet been used to transmit data. It
> > would require a malicious mgmt app to pass an unexpected FD
> > type that could block but that's quite hard, and we consider
> > the QMP client be a trusted entity anyway.
> >
> > As for another thread blocking on the mutex I'm not convinced
> > that'll happen either. The FD set is scoped to the current
> > monitor. Almost certainly the FD is going to be consumed by
> > a later QMP device-add/object-add command, in the same thread.
> > Processing of that later QMP command will be delayed regardless
> > of whether the close is inside or outside the critical section.
> >
> > AFAICT keeping close() oujtside the critical section serves
> > no purpose and we could just stick with the lock guard and
> > delete the comment.
> 
> Makes sense to me.
> 
> There's another one in monitor_add_fd().
> 
> Both are from Peter's commit 9409fc05fe2 "monitor: protect mon->fds with
> mon_lock".  Peter, do you remember why you took the trouble to keep
> close() outside the critical section?  I know it's been a while...

IIRC the whole purpose of keeping close() out of the mutex section was to
make sure the mutex won't take for too long in any possible way since the
mutex will be held too in the monitor iothread (which will service the
out-of-band commands), at that time we figured the close() has a chance of
getting blocked (even if unlikely!).

So to me it still makes sense to keep the close() out of the mutex section,
unless the monitor code changed in the past few years on that, and sorry in
advance if I didn't really follow what's happening..

What's the major beneift if we move it into the critical section?  We can
use the lock guard, but IMHO that's for making programming convenient only,
we should not pay for it if there's an unwanted functional difference.

In this case of close() I think it introduces back the possiblity of having
a very slow close() - I'd bet it happen only if there's a remote socket
connection to the QMP server and with unreliable network, but I really
can't really tell.  I think I used to discuss this with Dave.

I'm wondering whether I should have used a userspace spinlock, that sounds
even more proper for this case, but that's slightly off topic.  It's just
that if the original goal of "trying our best to make sure out-of-band
monitor channels is always responsive" doesn't change, hence IMHO the
comment on the lock should still be valid to me.

Thanks,

-- 
Peter Xu


