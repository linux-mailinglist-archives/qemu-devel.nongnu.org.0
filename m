Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A23338C3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:33:10 +0100 (CET)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvDJ-0000HZ-M5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJvAe-0007Vf-M3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJvAc-0007VV-KC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615368621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w8D0xMHs3rc1NThb9Ss4gYcN4EfOcIT8vjB0dmp4sXA=;
 b=Y4FrkuUcmbI88uW4CNYb6bms3LhtMOPrs5pZAtnNzQo4yR6m07X/aeTDHtHrOb/y55rUGi
 CvM2F0R6cDEofMfpH6mFkd6q61eOfb1Miq1iLNnzEQ22p2WekmW3bbzvAG3ip31+Tz66kx
 BtONFcXE2b8j5/Y6kjJFYrhJykJb4m4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-iPQLa7W0PZ261yqLOk6kiw-1; Wed, 10 Mar 2021 04:30:18 -0500
X-MC-Unique: iPQLa7W0PZ261yqLOk6kiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4521005D4C;
 Wed, 10 Mar 2021 09:30:17 +0000 (UTC)
Received: from redhat.com (ovpn-115-24.ams2.redhat.com [10.36.115.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3741037EB0;
 Wed, 10 Mar 2021 09:30:02 +0000 (UTC)
Date: Wed, 10 Mar 2021 09:29:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH] coroutine: add libucontext as external library
Message-ID: <YEiRlrCo40oQlNih@redhat.com>
References: <20210309032637.41778-1-j@getutm.app>
 <YEeWimKd1QVd176N@stefanha-x1.localdomain>
 <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
 <CA+E+eSAdKg2_8KNnM89v5XWf8=RJ+gi4HzgyySOYEROtYxU6rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAdKg2_8KNnM89v5XWf8=RJ+gi4HzgyySOYEROtYxU6rw@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 01:21:29PM -0800, Joelle van Dyne wrote:
> On Tue, Mar 9, 2021 at 10:24 AM Joelle van Dyne <j@getutm.app> wrote:
> >
> > On Tue, Mar 9, 2021 at 7:38 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> > > > iOS does not support ucontext natively for aarch64 and the sigaltstack is
> > > > also unsupported (even worse, it fails silently, see:
> > > > https://openradar.appspot.com/13002712 )
> > > >
> > > > As a workaround we include a library implementation of ucontext and add it
> > > > as a build option.
> > > >
> > > > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > > > ---
> > > >  configure                 | 21 ++++++++++++++++++---
> > > >  meson.build               | 12 +++++++++++-
> > > >  util/coroutine-ucontext.c |  9 +++++++++
> > > >  .gitmodules               |  3 +++
> > > >  MAINTAINERS               |  6 ++++++
> > > >  meson_options.txt         |  2 ++
> > > >  subprojects/libucontext   |  1 +
> > > >  7 files changed, 50 insertions(+), 4 deletions(-)
> > > >  create mode 160000 subprojects/libucontext
> > > >
> > > > diff --git a/configure b/configure
> > > > index 34fccaa2ba..5f225894a9 100755
> > > > --- a/configure
> > > > +++ b/configure
> > > > @@ -1773,7 +1773,7 @@ Advanced options (experts only):
> > > >    --oss-lib                path to OSS library
> > > >    --cpu=CPU                Build for host CPU [$cpu]
> > > >    --with-coroutine=BACKEND coroutine backend. Supported options:
> > > > -                           ucontext, sigaltstack, windows
> > > > +                           ucontext, libucontext, sigaltstack, windows
> > >
> > > This approach mixes the concept of the coroutine backend (ucontext,
> > > sigaltstack, etc) with the optional libucontext library dependency.
> > >
> > > libucontext is not a coroutine backend. The patch had to introduce
> > > $coroutine_impl in addition to $coroutine in order to work around this.
> > > Let's avoid combining these two independent concepts into
> > > --with-coroutine=.
> > >
> > > I suggest treating libucontext as an optional library dependency in
> > > ./configure with explicit --enable-libucontext/--disable-libucontext
> > > options. Most of the time neither option will be provided by the user
> > > and ./configure should automatically decide whether libucontext is
> > > needed or not.
> > >
> > > > +case $coroutine in
> > > > +libucontext)
> > > > +  git_submodules="${git_submodules} subprojects/libucontext"
> > > > +  mkdir -p libucontext
> > >
> > > Why is this mkdir necessary?
> >
> > That is a typo, will fix.
> >
> > Thanks to all the feedback in this thread. I will shelve this patchset
> > for now and see if it's possible to fix ucontext on Darwin. Or if we
> > go with gcoroutine that would work as well. Either way it seems like
> > this isn't ready yet.
> >
> > -j
> 
> The following is enough to get ucontext working on macOS 11 (Apple
> seems to have fixed it when they added ARM64 support for M1 Macs).
> However, ucontext still does not work (no symbols) on iOS so there's
> not much point in switching from sigaltstack.
> 
> -j
> 
> diff --git a/configure b/configure
> index a2736ecf16..042f4e87a5 100755
> --- a/configure
> +++ b/configure
> @@ -774,7 +774,8 @@ Darwin)
>    audio_possible_drivers="coreaudio sdl"
>    # Disable attempts to use ObjectiveC features in os/object.h since they
>    # won't work when we're compiling with gcc as a C compiler.
> -  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
> +  # _XOPEN_SOURCE and _DARWIN_C_SOURCE needed for ucontext
> +  QEMU_CFLAGS="-D_XOPEN_SOURCE=500 -D_DARWIN_C_SOURCE
> -DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
>  ;;
>  SunOS)
>    solaris="yes"
> @@ -4486,17 +4487,15 @@ fi
>  # specific one.
> 
>  ucontext_works=no
> -if test "$darwin" != "yes"; then
> -  cat > $TMPC << EOF
> +cat > $TMPC << EOF
>  #include <ucontext.h>
>  #ifdef __stub_makecontext
>  #error Ignoring glibc stub makecontext which will always fail
>  #endif
>  int main(void) { makecontext(0, 0, 0); return 0; }
>  EOF
> -  if compile_prog "" "" ; then
> -    ucontext_works=yes
> -  fi
> +if compile_prog "" "" ; then
> +  ucontext_works=yes
>  fi
> 
>  if test "$coroutine" = ""; then

I have tried doing this before, and while it was enough for the compile
to succeed, I found that tests failed / hung when running the macOS CI
jobs.  Did you actually try running tests with this change directly,
and/or under Cirrus CI ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


