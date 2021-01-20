Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053832FD4DC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:07:17 +0100 (CET)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2G0q-0008DY-2z
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Fyi-0006h2-5i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Fye-0006WW-1e
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ti44yJmjqZwfv+Csv8lPPfVN7p25WjO8e3RGpP5C/Ok=;
 b=HMGZtFBobYBh+oeQJ12tCM3QoqHjDEYG47+0/jL+QlcHdjQwrK2xiIhbRiMld3wDcLWwUB
 raIEHMqTpowjDYeUIbDX5/7icSndLX6teZv2UdPa/fN6Rf2vhLrPzlQ7/o+YAjbhqeUvy5
 Yql33b048z4Gg1Q+qq0eFjgcj3bnRdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-TSvfCqIBOjuR8mQ1Ahy5jg-1; Wed, 20 Jan 2021 11:04:50 -0500
X-MC-Unique: TSvfCqIBOjuR8mQ1Ahy5jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E36D11075646;
 Wed, 20 Jan 2021 16:04:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B41DC5D9D5;
 Wed, 20 Jan 2021 16:04:45 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:04:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
Message-ID: <20210120160442.GK3015589@redhat.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
 <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
 <29cccc86-a450-3326-2d70-f3022e32b5db@redhat.com>
 <ccb47c7c-051d-6df4-9a73-ace9b23b67a2@redhat.com>
 <cfe3b7dd-8a1f-7e49-e576-ebca82ee4d98@redhat.com>
 <3db87f48-b628-8000-a46a-6d07cdf1ccc3@redhat.com>
 <8522c1f5-9476-3596-abf0-7f2d83f8844c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8522c1f5-9476-3596-abf0-7f2d83f8844c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 04:53:26PM +0100, Max Reitz wrote:
> On 20.01.21 15:44, Max Reitz wrote:
> > On 20.01.21 15:34, Max Reitz wrote:
> 
> [...]
> 
> > >  From a glance, it looks to me like two coroutines are created
> > > simultaneously in two threads, and so one thread sets up a special
> > > SIGUSR2 action, then another reverts SIGUSR2 to the default, and
> > > then the first one kills itself with SIGUSR2.
> > > 
> > > Not sure what this has to do with backup, though it is interesting
> > > that backup_loop() runs in two threads.  So perhaps some AioContext
> > > problem.
> > 
> > Oh, 256 runs two backups concurrently.  So it isn’t that interesting,
> > but perhaps part of the problem still.  (I have no idea, still looking.)
> 
> So this is what I found out:
> 
> coroutine-sigaltstack, when creating a new coroutine, sets up a signal
> handler for SIGUSR2, then kills itself with SIGUSR2, then uses the signal
> handler context (with a sigaltstack) for the new coroutine, and then (the
> signal handler returns after a sigsetjmp()) the old SIGUSR2 behavior is
> restored.
> 
> What I fail to understand is how this is thread-safe.  Setting up signal
> handlers is a process-wide action.  When one thread changes what SIGUSR2
> does, this will affect all threads immediately, so when two threads run
> coroutine-sigaltstack’s qemu_coroutine_new() concurrently, and one thread
> reverts to the default action before the other has SIGUSR2’ed itself, that
> later SIGUSR2 will kill the whole process.
> 
> (I suppose it gets even more interesting when one thread has set up the
> sigaltstack, then the other sets up its own sigaltstack, and then both kill
> themselves with SIGUSR2, so both coroutines get the same stack...)
> 
> I have no idea why this has never been hit before, but it makes sense why
> block-copy backup makes it apparent: It creates 64+x coroutines in a very
> short time span, and 256 makes it do so in two threads concurrently (thanks
> to launching two backups in two AioContexts in a transaction).
> 
> So...  Looks to me like a bug in coroutine-sigaltstack.  Not sure what to do
> now, though.  I don’t think we can use block-copy for backup before that
> backend is fixed.  (And that is assuming that it’s indeed
> coroutine-sigaltstack’s fault.)
> 
> I’ll try to add some locking, see what it does, and send a mail concerning
> coroutine-sigaltstack to qemu-devel.

I'm wondering if we should simply remove the sigaltstack impl and use
ucontext on MacOS too.

MacOS has ucontext marked as deprecated by default, seemingly because
this functionality was deprecated by POSIX. The functionality is still
available without deprecation warnings if you set _XOPEN_SOURCE.

IOW, it is trivial to make the ucontext impl work on MacOS simply by
adding

 #define _XOPEN_SOURCE 600

before including ucontext.h in coroutine-ucontext.c, and removing the
restrictions in configure



diff --git a/configure b/configure
index 881af4b6be..a58bdf70f3 100755
--- a/configure
+++ b/configure
@@ -4822,8 +4822,9 @@ fi
 # specific one.
 
 ucontext_works=no
-if test "$darwin" != "yes"; then
+
   cat > $TMPC << EOF
+#define _XOPEN_SOURCE 600
 #include <ucontext.h>
 #ifdef __stub_makecontext
 #error Ignoring glibc stub makecontext which will always fail
@@ -4833,7 +4834,6 @@ EOF
   if compile_prog "" "" ; then
     ucontext_works=yes
   fi
-fi
 
 if test "$coroutine" = ""; then
   if test "$mingw32" = "yes"; then
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 904b375192..9c0a2cf85c 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -22,6 +22,7 @@
 #ifdef _FORTIFY_SOURCE
 #undef _FORTIFY_SOURCE
 #endif
+#define _XOPEN_SOURCE 600
 #include "qemu/osdep.h"
 #include <ucontext.h>
 #include "qemu/coroutine_int.h"



Further more for iOS there was a proposal to add support for using
libucontext, which provides a clean impl of ucontext APIs for x86
and aarch64 hosts.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


