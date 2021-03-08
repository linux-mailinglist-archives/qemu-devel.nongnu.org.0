Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89091331044
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:00:52 +0100 (CET)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGRF-0001gj-C3
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJGMh-00052Q-Ke
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJGMb-0003DY-7m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615211759;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhXao7s4LzPsFulZf4A/rFJAKES8LEFUec05327le1s=;
 b=ImyAOF9yfxBKoegnaHxNDJS8Vir6xJyGMcG9/fUY75R0jcofWXgyKccPFZwL1nOswjFCoI
 +8sUaJqoNmX79/rEXDiaTghmGQqEDfHXLjHUAWU015K6FIlYFjrBJFIojn6/D9+XgeAXEq
 04HFZwOr+OcosqTvi0pk3GNe4Sdjj8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-oPT-mIt9P5yqOrgBqSDK8g-1; Mon, 08 Mar 2021 08:55:57 -0500
X-MC-Unique: oPT-mIt9P5yqOrgBqSDK8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A97D1932480;
 Mon,  8 Mar 2021 13:55:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1873C5D6D5;
 Mon,  8 Mar 2021 13:55:54 +0000 (UTC)
Date: Mon, 8 Mar 2021 13:55:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
Message-ID: <YEYs6EgJpg5Xkako@redhat.com>
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
 <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
 <YDYyoeFU4jQBN/8v@redhat.com>
 <CAFEAcA8DvXVxRvB0ZtQh3j5Y=34DOC1CzUY1LkuMB5WCJKthmg@mail.gmail.com>
 <YDZRbkiRzDgtKvXu@redhat.com>
 <CAATJJ0JZ-Je+2UPWjUEenTS9n0K5J-PCqfzSwVZ26NDE3VB1GA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAATJJ0JZ-Je+2UPWjUEenTS9n0K5J-PCqfzSwVZ26NDE3VB1GA@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 02:50:39PM +0100, Christian Ehrhardt wrote:
> On Wed, Feb 24, 2021 at 2:15 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Feb 24, 2021 at 01:07:33PM +0000, Peter Maydell wrote:
> > > On Wed, 24 Feb 2021 at 11:04, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > So from osdep.h I think something like this is likely sufficient:
> > > >
> > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > index ba15be9c56..7a1d83a8b6 100644
> > > > --- a/include/qemu/osdep.h
> > > > +++ b/include/qemu/osdep.h
> > > > @@ -126,6 +126,7 @@ extern int daemon(int, int);
> > > >  #include "glib-compat.h"
> > > >  #include "qemu/typedefs.h"
> > > >
> > > > +extern "C" {
> > >
> > > Needs to be protected by #ifdef so it's only relevant for the
> > > C++ compiler, right?
> > >
> > > >  /*
> > > >   * For mingw, as of v6.0.0, the function implementing the assert macro is
> > > >   * not marked as noreturn, so the compiler cannot delete code following an
> > > > @@ -722,4 +723,6 @@ static inline int platform_does_not_support_system(const char *command)
> > > >  }
> > > >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > > >
> > > > +}
> > > > +
> > > >  #endif
> > > >
> > > >
> > > > We'll also need to them protect any local headers we use before this point.
> > > >
> > > > $ grep #include ../../../include/qemu/osdep.h  | grep -v '<'
> > > > #include "config-host.h"
> > > > #include CONFIG_TARGET
> > > > #include "exec/poison.h"
> > > > #include "qemu/compiler.h"
> > > > #include "sysemu/os-win32.h"
> > > > #include "sysemu/os-posix.h"
> > > > #include "glib-compat.h"
> > > > #include "qemu/typedefs.h"
> > > >
> > > > and transitively through that list, but I think there's no too many
> > > > more there.
> > >
> > > Is there anything we can do to make the compiler complain if we
> > > get this wrong? Otherwise it seems likely that we'll end up
> > > accidentally putting things inside or outside 'extern "C"'
> > > declarations when they shouldn't be, as we make future changes
> > > to our headers.
> >
> > There's nothing easy I know of to highlight this.  It is more the kind
> > of thing checkpatch would have to look at - complain if there is
> > anything which isn't a  preprocessor include directive or comment
> > before the 'extern'.
> >
> > > (The other approach would be to try to get rid of the
> > > C++ in the codebase. We could probably say 'drop vixl
> > > and always use capstone', for instance.)
> >
> > Yeah, getting rid of C++ would probably be the sanest solution long
> > term.
> 
> Just as an input on short-term alternatives,
> in open-vm-tools we've found to follow
> https://developer.gnome.org/glib/stable/glib-Version-Information.html#GLIB-VERSION-MIN-REQUIRED:CAPS
> to be an easy fix for the time being.
> Which in the autoconf magic there was just:
>   +AC_DEFINE(GLIB_VERSION_MIN_REQUIRED, GLIB_VERSION_2_34, [Ignore
> post 2.34 deprecations])
>   +AC_DEFINE(GLIB_VERSION_MAX_ALLOWED, GLIB_VERSION_2_34, [Prevent
> post 2.34 APIs])
> (Or any other/newer version that one would want to select)
> 
> Not sure what would apply to qemu here, but I wanted to let you know
> of the overall concept in regard to this issue.

QEMU already uses these macros but they can't protect against all
scenarios. Principally they avoid you accidentally using a newly
introduced public API.  The scenario in this thread doesn't involve
a new API, so those macros don't help here, you need to actually
compile against the new version to see the problem

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


