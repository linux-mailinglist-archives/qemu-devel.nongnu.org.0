Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953238C608
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:55:01 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3k3-0001j1-Kg
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk3jK-00013R-2N
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk3jG-00086z-51
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621598048;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qc7qsc4odTFlLYE5qM8R8vmwFkdyFpMJVyld7atWzzU=;
 b=CVQf1lIfz3phXnDjAwmbEjgmAsLgFML0G3sb4r/I+8cbuvycxKjOsQOjujpzVeuNqpAxdJ
 NWiAYhA5N2CwkjVuqyguvmAGa3vep/J6VAlLCmfpBeryzvpdyl+SJJ06mzOQy5n+aath37
 TT/ZCtdNARZT4nN03iYdgzKboxZkF/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-O8GTS0L-OqmHacTJ7ImSqg-1; Fri, 21 May 2021 07:53:57 -0400
X-MC-Unique: O8GTS0L-OqmHacTJ7ImSqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7342180FD65;
 Fri, 21 May 2021 11:53:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1533010013C1;
 Fri, 21 May 2021 11:53:43 +0000 (UTC)
Date: Fri, 21 May 2021 12:53:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
Message-ID: <YKefRcVrr9Gtehlk@redhat.com>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 01:02:51PM +0200, Thomas Huth wrote:
> On 21/05/2021 12.50, Daniel P. Berrangé wrote:
> > On Fri, May 21, 2021 at 12:48:21PM +0200, Thomas Huth wrote:
> > > On 20/05/2021 13.27, Philippe Mathieu-Daudé wrote:
> > > > +Stefan/Daniel
> > > > 
> > > > On 5/20/21 10:02 AM, Thomas Huth wrote:
> > > > > On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
> > > > > > If a runner has ccache installed, use it and display statistics
> > > > > > at the end of the build.
> > > > > > 
> > > > > > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > > > ---
> > > > > >     .gitlab-ci.d/buildtest-template.yml | 5 +++++
> > > > > >     1 file changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/.gitlab-ci.d/buildtest-template.yml
> > > > > > b/.gitlab-ci.d/buildtest-template.yml
> > > > > > index f284d7a0eec..a625c697d3b 100644
> > > > > > --- a/.gitlab-ci.d/buildtest-template.yml
> > > > > > +++ b/.gitlab-ci.d/buildtest-template.yml
> > > > > > @@ -6,13 +6,18 @@
> > > > > >           then
> > > > > >             JOBS=$(sysctl -n hw.ncpu)
> > > > > >             MAKE=gmake
> > > > > > +        PATH=/usr/local/libexec/ccache:$PATH
> > > > > >             ;
> > > > > >           else
> > > > > >             JOBS=$(expr $(nproc) + 1)
> > > > > >             MAKE=make
> > > > > > +        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
> > > > > 
> > > > > That does not make sense for the shared runners yet. We first need
> > > > > something to enable the caching there - see my series "Use ccache in the
> > > > > gitlab-CI" from April (which is currently stalled unfortunately).
> > > > 
> > > > TL;DR: I don't think we should restrict our templates to shared runners.
> > > 
> > > I'm certainly not voting for restricting ourselves to only use shared
> > > runners here - but my concern is that this actually *slows* down the shared
> > > runners even more! (sorry, I should have elaborated on that in my previous
> > > mail already)
> > > 
> > > When I was experimenting with ccache in the shared runners, I saw that the
> > > jobs are running even slower with ccache enabled as long as the cache is not
> > > populated yet. You only get a speedup afterwards. So if you add this now
> > > without also adding the possibility to store the cache persistently, the
> > > shared runners will try to populate the cache each time just to throw away
> > > the results afterwards again. Thus all the shared runners only get slower
> > > without any real benefit here.
> > > 
> > > Thus we either need to get ccache working properly for the shared runners
> > > first, or you have to think of a different way of enabling ccache for the
> > > non-shared runners, so that it does not affect the shared runners
> > > negatively.
> > 
> > Is there anything functional holding up your previous full cccache support
> > series from last month ? Or is it just lack of reviews ?
> 
> It's basically the problems mentioned in the cover letter and Stefan's
> comment here:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html

I'm not sure I understand why Stefan thinks gitlab's caching doesn't
benefit ccache. We add ccache for libvirt GitLab CI, and AFAIR it
sped up our builds significantly.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


