Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D213E323B02
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:06:54 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEs0L-0004jF-IN
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lErxq-0003eH-56
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lErxm-0006Xc-UR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614164653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdrzGPK0IDaUpBRsHfmAoB3a0ahKPbH2B3s92OBPHHw=;
 b=HZJrLV1GPpTy2Mv7MRPuiQjlUGVNK6nLlgD/5piGIiIGsQMYBKHziRtDiUZ84j1BRGTmWW
 hqaIyRLZKqPpEfj7uj1hoNWFq5GuTg+TjSud5Ko5AO/5aASyeXJLHG5bOegWkz61Jz0sBa
 fa8r5b1UwV8LZ2dDoU9ItUo9ENTfIdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-8LzUy3bnPsuUFjdp-_kViw-1; Wed, 24 Feb 2021 06:04:06 -0500
X-MC-Unique: 8LzUy3bnPsuUFjdp-_kViw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D989835E29;
 Wed, 24 Feb 2021 11:04:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E9006F971;
 Wed, 24 Feb 2021 11:04:03 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:04:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
Message-ID: <YDYyoeFU4jQBN/8v@redhat.com>
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
 <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Feb 24, 2021 at 08:38:30AM +0100, Christian Ehrhardt wrote:
> On Tue, Feb 23, 2021 at 5:12 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Feb 23, 2021 at 03:43:48PM +0000, Peter Maydell wrote:
> > > On Tue, 23 Feb 2021 at 15:03, Christian Ehrhardt
> > > <christian.ehrhardt@canonical.com> wrote:
> >
> > We need to make headers that need to be used from C++ code follow
> > the pattern:
> >
> >     #include <foo1>
> >     #include <foo2>
> >     #include <foo3>
> >     ...all other includs..
> >
> >     extern "C" {
> >         ..
> >         only the declarations, no #includes
> >         ...
> >     };
> 
> While I can follow the words and always awesome explanations by Daniel,
> I must admit that I'm a bit lost at what a v2 of this could look like.
> 
> osdep.h as of today unfortunately isn't as trivial as 1. include 2.
> declarations.
> There are late includes deep in cascading ifdef's and we all know that "just
> moving includes around for the above fix to work in an easy way" in headers
> will likely (maybe even silently) break things.
> 
> So I wonder is this going to become a massive patch either moving a lot or
> adding many extern C declarations all over the place in osdep-h? Or did I
> just fail to see that there is an obviously better approach to this?

I don't think it will need reordering osdep.h.

Most of the #include are system headers, which should already be
protected by 'extern "C"' themselves if needed.


So from osdep.h I think something like this is likely sufficient:

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..7a1d83a8b6 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -126,6 +126,7 @@ extern int daemon(int, int);
 #include "glib-compat.h"
 #include "qemu/typedefs.h"
 
+extern "C" {
 /*
  * For mingw, as of v6.0.0, the function implementing the assert macro is
  * not marked as noreturn, so the compiler cannot delete code following an
@@ -722,4 +723,6 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+}
+
 #endif


We'll also need to them protect any local headers we use before this point.

$ grep #include ../../../include/qemu/osdep.h  | grep -v '<'
#include "config-host.h"
#include CONFIG_TARGET
#include "exec/poison.h"
#include "qemu/compiler.h"
#include "sysemu/os-win32.h"
#include "sysemu/os-posix.h"
#include "glib-compat.h"
#include "qemu/typedefs.h"

and transitively through that list, but I think there's no too many
more there.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


