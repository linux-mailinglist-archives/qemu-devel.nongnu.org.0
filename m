Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95051323E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:39:22 +0100 (CET)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuNt-0001Il-IJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu10-0004cM-5S
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0u-00065d-Sx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+FTUVgtevUm3ZXqV4u2x7HqY28mZNn3uCqw18VSBuDk=;
 b=RpcIDVOS+FeKeV9gnFTDHF3StxtYD4OllM7OCwuneLONgaEBKdiTTY4Ck5CLCeDeHqWdNb
 JtOv1+fw+cGXuuImqVQcE9wNWgIQrDI7Bp+lo88nLH0apEr5NN8e3rFBrZjAFp7EjoggDz
 rsTw0O8tTR37RaNem/DwacDo55Sokho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-pwnE1If8Ot6HCb9LoCxiGA-1; Wed, 24 Feb 2021 08:15:32 -0500
X-MC-Unique: pwnE1If8Ot6HCb9LoCxiGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03DC518B9E80;
 Wed, 24 Feb 2021 13:15:31 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D1519725;
 Wed, 24 Feb 2021 13:15:29 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:15:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
Message-ID: <YDZRbkiRzDgtKvXu@redhat.com>
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
 <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
 <YDYyoeFU4jQBN/8v@redhat.com>
 <CAFEAcA8DvXVxRvB0ZtQh3j5Y=34DOC1CzUY1LkuMB5WCJKthmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8DvXVxRvB0ZtQh3j5Y=34DOC1CzUY1LkuMB5WCJKthmg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Wed, Feb 24, 2021 at 01:07:33PM +0000, Peter Maydell wrote:
> On Wed, 24 Feb 2021 at 11:04, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > So from osdep.h I think something like this is likely sufficient:
> >
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index ba15be9c56..7a1d83a8b6 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -126,6 +126,7 @@ extern int daemon(int, int);
> >  #include "glib-compat.h"
> >  #include "qemu/typedefs.h"
> >
> > +extern "C" {
> 
> Needs to be protected by #ifdef so it's only relevant for the
> C++ compiler, right?
> 
> >  /*
> >   * For mingw, as of v6.0.0, the function implementing the assert macro is
> >   * not marked as noreturn, so the compiler cannot delete code following an
> > @@ -722,4 +723,6 @@ static inline int platform_does_not_support_system(const char *command)
> >  }
> >  #endif /* !HAVE_SYSTEM_FUNCTION */
> >
> > +}
> > +
> >  #endif
> >
> >
> > We'll also need to them protect any local headers we use before this point.
> >
> > $ grep #include ../../../include/qemu/osdep.h  | grep -v '<'
> > #include "config-host.h"
> > #include CONFIG_TARGET
> > #include "exec/poison.h"
> > #include "qemu/compiler.h"
> > #include "sysemu/os-win32.h"
> > #include "sysemu/os-posix.h"
> > #include "glib-compat.h"
> > #include "qemu/typedefs.h"
> >
> > and transitively through that list, but I think there's no too many
> > more there.
> 
> Is there anything we can do to make the compiler complain if we
> get this wrong? Otherwise it seems likely that we'll end up
> accidentally putting things inside or outside 'extern "C"'
> declarations when they shouldn't be, as we make future changes
> to our headers.

There's nothing easy I know of to highlight this.  It is more the kind
of thing checkpatch would have to look at - complain if there is
anything which isn't a  preprocessor include directive or comment
before the 'extern'.

> (The other approach would be to try to get rid of the
> C++ in the codebase. We could probably say 'drop vixl
> and always use capstone', for instance.)

Yeah, getting rid of C++ would probably be the sanest solution long
term.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


