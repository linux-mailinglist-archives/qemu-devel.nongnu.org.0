Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2885284B2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaEd-0002J9-3D
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqYjP-0008EJ-KK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqYjN-0003mF-K8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652699860;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sYr8NsY2LB/njBqyEBFf3SQxRtfstLuw9U1Z6nnV+5c=;
 b=g7XtE1Nwkbx/52XBd7Hbp+dmNxhOK7pRfvuvxqYfHOTA67kP4+Akri+eabUUgrDRwmW4m6
 qj8Cd3JMAOe2SqGE6pQ2NuWMylU5NO8CVxQQEW/AQvt5YdtgjyngcQabP5DOtw2aCLwsmi
 7vNWPFxH8AW/FCfmLIlaq87r47XaB0M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-5uPTurk-OxCcUczJ0GrHwg-1; Mon, 16 May 2022 07:17:39 -0400
X-MC-Unique: 5uPTurk-OxCcUczJ0GrHwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AC353C02B74;
 Mon, 16 May 2022 11:17:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E143400DFA0;
 Mon, 16 May 2022 11:17:36 +0000 (UTC)
Date: Mon, 16 May 2022 12:17:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Message-ID: <YoIyzi1PRYotgOyC@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-2-leobras@redhat.com>
 <YoIxzC88w+jQlqoG@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YoIxzC88w+jQlqoG@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Mon, May 16, 2022 at 12:13:16PM +0100, Dr. David Alan Gilbert wrote:
> * Leonardo Bras (leobras@redhat.com) wrote:
> > A build error happens in alpine CI when linux/errqueue.h is included
> > in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':
> 
> OK, looks to be same mechanism as other meson tests.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

As of about an hour or so ago, this patch should not be required.

  https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813

> 
> > ===
> > ninja: job failed: [...]
> > In file included from /usr/include/linux/errqueue.h:6,
> >                  from ../io/channel-socket.c:29:
> > /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
> >     7 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> > In file included from /usr/include/liburing.h:19,
> >                  from /builds/user/qemu/include/block/aio.h:18,
> >                  from /builds/user/qemu/include/io/channel.h:26,
> >                  from /builds/user/qemu/include/io/channel-socket.h:24,
> >                  from ../io/channel-socket.c:24:
> > /usr/include/liburing/compat.h:9:8: note: originally defined here
> >     9 | struct __kernel_timespec {
> >       |        ^~~~~~~~~~~~~~~~~
> > ninja: subcommand failed
> > ===
> > 
> > As above error message suggests, 'struct __kernel_timespec' was already
> > defined by liburing/compat.h.
> > 
> > Fix alpine CI by adding test to disable liburing in configure step if a
> > redefinition happens between linux/errqueue.h and liburing/compat.h.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  meson.build | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/meson.build b/meson.build
> > index 9b20dcd143..a996690c9b 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -515,12 +515,23 @@ if not get_option('linux_aio').auto() or have_block
> >                             required: get_option('linux_aio'),
> >                             kwargs: static_kwargs)
> >  endif
> > +
> > +linux_io_uring_test = '''
> > +  #include <liburing.h>
> > +  #include <linux/errqueue.h>
> > +
> > +  int main(void) { return 0; }'''
> > +
> >  linux_io_uring = not_found
> >  if not get_option('linux_io_uring').auto() or have_block
> >    linux_io_uring = dependency('liburing', version: '>=0.3',
> >                                required: get_option('linux_io_uring'),
> >                                method: 'pkg-config', kwargs: static_kwargs)
> > +  if not cc.links(linux_io_uring_test)
> > +    linux_io_uring = not_found
> > +  endif
> >  endif
> > +
> >  libnfs = not_found
> >  if not get_option('libnfs').auto() or have_block
> >    libnfs = dependency('libnfs', version: '>=1.9.3',
> > -- 
> > 2.36.1
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


