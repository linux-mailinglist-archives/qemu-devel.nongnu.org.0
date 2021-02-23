Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B8322E8F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:17:35 +0100 (CET)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaNS-0002yS-ME
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEaIW-0006r9-PW
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEaIT-0007dD-BU
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096744;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhwiwkreM19H55eQuA8oFcGhbBa9TZVlAiZpy+p1j2k=;
 b=bWxH+vDM/CiR+ZFcKqQxf7vMLc2CmdhGp4zTVXgM60Kz8ydousloZnT3jLYg7OZhuC2qVJ
 F6NZZMYu0Xd8GvZoDR8NKAfIIB2VpXHS/4iJA8BCgUqSBAMwjhZqWgRfLBnPgWEmX/RWzY
 wAMD6gmClV6zuYPgc2VTwTKLclbtLbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-U-JMOFb6Nki9AKUzKoM_yA-1; Tue, 23 Feb 2021 11:12:09 -0500
X-MC-Unique: U-JMOFb6Nki9AKUzKoM_yA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 015C0189F1AD;
 Tue, 23 Feb 2021 16:08:04 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0115D5C675;
 Tue, 23 Feb 2021 16:08:02 +0000 (UTC)
Date: Tue, 23 Feb 2021 16:07:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
Message-ID: <YDUoX0DZz6jcxjVy@redhat.com>
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 03:43:48PM +0000, Peter Maydell wrote:
> On Tue, 23 Feb 2021 at 15:03, Christian Ehrhardt
> <christian.ehrhardt@canonical.com> wrote:
> >
> > glib2.0 introduced a change in 2.67.3 and later which triggers an
> > issue [1] for anyone including it's headers in a "extern C" context
> > which a few files in disas/* do. An example of such an include chain
> > and error look like:
> >
> > ../../disas/arm-a64.cc
> > In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
> >                  from /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h:9,
> >                  from /usr/include/glib-2.0/glib/gtypes.h:32,
> >                  from /usr/include/glib-2.0/glib/galloca.h:32,
> >                  from /usr/include/glib-2.0/glib.h:30,
> >                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/glib-compat.h:32,
> >                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/qemu/osdep.h:126,
> >                  from ../../disas/arm-a64.cc:21:
> > /usr/include/c++/10/type_traits:56:3: error: template with C linkage
> >    56 |   template<typename _Tp, _Tp __v>
> >       |   ^~~~~~~~
> > ../../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
> >    20 | extern "C" {
> >       | ^~~~~~~~~~
> >
> > To fix that move the include of osdep.h out of that section. It was added
> > already as C++ fixup by e78490c44: "disas/arm-a64.cc: Include osdep.h first".
> >
> > [1]: https://gitlab.gnome.org/GNOME/glib/-/issues/2331
> 
> I'm not convinced by this as a fix, though I'm happy to be corrected
> by somebody with a fuller understanding of C++. glib.h may be supposed
> to work as a C++ header, but osdep.h as a whole is definitely a C header,
> so I think it ought to be inside 'extern C'; and it has to be
> the first header included; and it happens to want to include glib.h.
> 
> Fixing glib.h seems like it would be nicer, assuming they haven't
> already shipped this breakage. Failing that, does it work to do:

This was raised in Fedora and upstream GLib already

https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1935
https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/J3P4TRHLWNDIKXF76OLYZNAPTABCZ3U5/#7LXFUDBBBIT23FE44QJYWX3I7U4EHW6M

The key comment there is this one:

  "Note that wrapping the header include in an extern declaration violates 
   C++ standard requirements.  ("A translation unit shall include a header 
   only outside of any declaration or definition", [using.headers]/3)"

IOW, if we need to make osdep.h safe to use from C++, then we
need to put the 'extern "C" { ... }'  bit in osdep.h itself,
not in the things which include it.

> 
> /*
>  * glib.h expects to be included as a C++ header if we're
>  * building a C++ file, but osdep.h and thus glib-compat.h are
>  * C headers and should be inside an "extern C" block.
>  */
> #ifdef __cplusplus
> extern "C++" {
> #include <glib.h>
> #if defined(G_OS_UNIX)
> #include <glib-unix.h>
> #endif
> }
> 
> in include/glib-compat.h ?

That'd be even worse.

We need to make headers that need to be used from C++ code follow
the pattern:

    #include <foo1>
    #include <foo2>
    #include <foo3>
    ...all other includs..

    extern "C" {
        ..
        only the declarations, no #includes
	...
    };



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


