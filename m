Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AD6A57AC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWy3n-0006FN-5F; Tue, 28 Feb 2023 06:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWy3h-00065d-5Z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWy3f-0002ED-84
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677583330;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMEe0AjyG5QqSR9Z6IIAHTUTsT/to9t8pTarEWQl/+0=;
 b=TxL1NvFgRFaHH0F9irf2MZ98P2wQ95yf0H2nb/N63WpIUPmqYFj04V+emd0CpBzK5q53IC
 8e/jqcqMjGp2rMpAIf+NPI1vfWmMy7Sh4iIAQsn8ldNlKtJQ6coHcsqk0l8izur856qsiP
 oJ4RQZc2N0OINTcoBRQqvRWetzm8pvA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-HoHMiwnYOpWNUOzCeqSHdA-1; Tue, 28 Feb 2023 06:22:05 -0500
X-MC-Unique: HoHMiwnYOpWNUOzCeqSHdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7272101A55E;
 Tue, 28 Feb 2023 11:22:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ACAC492B12;
 Tue, 28 Feb 2023 11:22:03 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:22:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: "John Berberian, Jr" <jeb.study@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
Message-ID: <Y/3j2OWh2l0e5/4q@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Jan 31, 2023 at 02:01:07PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Jan 17, 2023 at 9:07 PM John Berberian, Jr <jeb.study@gmail.com> wrote:
> >
> > Apologies for the late response, I was traveling most of yesterday.
> >
> > On 1/16/23 4:22 AM, Daniel P. Berrangé wrote:
> > > When we introduce a new QAPI format for migration args though, I've
> > > suggested we drop support for passing exec via shell, and require an
> > > explicit argv[] array:
> > >
> > >    https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg01434.html
> > >
> > > For Windows since we don't have back compat to worry about, we
> > > can avoid passing via cmd.exe from the start.
> >
> > I think we should keep the behavior the same on all platforms. If such a
> > change is to occur, it should happen at the same time on Windows and
> > Unix-like systems. Platform-dependent ifdefs should be used to overcome
> > platform-specific differences (e.g. the location of the shell), rather
> > than give one platform entirely different functionality - otherwise we
> > introduce needless confusion when someone accustomed to Linux tries to
> > use an exec migration on Windows and it doesn't work the same way at all.
> 
> I agree with Daniel, we should make the migrate/exec command take an
> argv[] (not run through the shell) and deprecate support for "exec:.."
> in QMP. The "exec:..." form support could later be moved to HMP...

Note, I was *not* arguing in favour of deprecating 'exec:' support,
only that we should prefer argv[] to bypass use of shell, because
shell introducing massive scope for unintended consquences possibly
with security implications.

> Tbh, allowing fork/exec from QEMU is not a great thing in the first
> place (although with GSpawn using posix_spawn on modern systems, that
> should help.. and win32 has a different API).
> 
> Instead, QMP/HMP clients could handle consumer process creation, and
> passing FDs via 'getfd,' and using the migrate 'fd:fdname' form (that
> is not really possible on win32 today, but I am adding support for
> importing sockets in a series on the list. This should do the job now
> that win32 supports unix sockets. We could also add support for pipes
> for older windows, and other kind of handles too). I admit this is not
> as convenient as the current "exec:cmdline" form... I don't know
> whether we have enough motivation to push those changes... I see it
> fitting with the goal to make HMP a human-friendly QMP client though.

We could make the same argument against supporting the other
migration protocols too, because all can be handled by merely
passing in a pre-opened FD from outside. That is not very
friendly though, even for QMP clients. I think it is sensible
to have an exec: protocol in general as long as we bypass shell.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


