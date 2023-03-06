Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91726ABCF4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:33:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ89O-0006IP-Jc; Mon, 06 Mar 2023 05:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZ89H-0006Fi-DA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:32:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZ89F-0006OP-L2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678098772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caxRZT2RRak1LdS1LKDyfrqGicmSIfP/31e0sUqjQCg=;
 b=PHUfWGoeP8qCj18D+lURIT+ToF5Da4POJMIYukZ+qfy2ml9u9RSSAQNM576Z+SHxcC/XDe
 F1hQELek6ohXj/wBZMkrnxamdH3ixb1kpvLKI4Ldsk17XbTHe2gB4sxlU50yI7NMkB29yo
 lDFYnjtvxbQQCrSzB3daC3DwUHJ5xpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-sEalxb0QPiugSSWqukLd8w-1; Mon, 06 Mar 2023 05:32:49 -0500
X-MC-Unique: sEalxb0QPiugSSWqukLd8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D32B3C10C6A;
 Mon,  6 Mar 2023 10:32:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9174640CF8F0;
 Mon,  6 Mar 2023 10:32:47 +0000 (UTC)
Date: Mon, 6 Mar 2023 10:32:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
Message-ID: <ZAXBTCEOYBp5WTo8@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
 <CAMxuvazE-=uUQZ73spaYBC1ZvyucGNiSdqc3FY1Xrp3Uese2jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvazE-=uUQZ73spaYBC1ZvyucGNiSdqc3FY1Xrp3Uese2jQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Mar 06, 2023 at 02:19:25PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 6, 2023 at 2:06 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Mar 02, 2023 at 05:18:44PM +0400, marcandre.lureau@redhat.com
> > wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Hi,
> > >
> > > Meson "wrap" is a mechanism to build dependencies that doesn't rely on
> > git
> > > submodules and integrate external dependencies as subproject()s.
> > >
> > > This offers developpers a simpler way to build QEMU with missing system
> > > dependencies (ex, libslirp in my case), but also simplify the fallback
> > build
> > > definition of dtc/libfdt.
> >
> > Do we actually need this facility though ? We've already determined
> > that every platform we need has libslirp now, and IIUC Thomas determined
> > recently that dtc is also available everywhere we need it to be.
> >
> 
> The main benefit is for developers: you have the source code of
> QEMU-related projects with the source tree. Code navigation, debugging, or
> various build tests are easier (compilation flags, static build etc). You
> don't have to "pollute" your system with (what could be) QEMU-specific
> libraries.

That's pushing developers to use builds of 3rd party libararies
that don't actually match what our users are going to end up
deploying with though.

> > So why would we want to continue to special case these two libraries,
> > out of all the many many many other libraries we also have deps on.
> >
> 
> They are more often updated, or developped with QEMU? For the reasons I
> listed, I would welcome more wrapped subprojects.

I don't think that they actually have more frequent updates that other
libraries. In any case from QEMU's POV it doesn't matter how often upstream
does releases. We're targetting the existing versions available in the OS
and so don't want to use bleeding edge upstream releases.

This also significantly expands our testing matrix. For each library
we have the possiblity that users have the distro version vs the wrapped
version. That is many new combinations users are exposed to, that we are
realistically never going to have the bandwidth to test in CI.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


