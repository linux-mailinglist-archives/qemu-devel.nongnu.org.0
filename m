Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859B33233B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:40:52 +0100 (CET)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZnH-00013L-Km
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZfK-0002H5-2I
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZfH-0008CA-8s
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyUZNQe56qQ0ktupEIL2zPKRaaVLrQkmIgWjNkFJcfQ=;
 b=FoJ2fYs5TEX2j36krIv9T6s7Cg7CHQyecVpZcsHlhjMyxX9hlpjhVGxVKO8isdEs8ZxCoY
 KSMlto5wea6vrwg5hyj5hOYDN1r8EJmVeli8T/9veWN1gqQTzOi+tJfb75X1tmb6CtaLEi
 93mWlYmkgDWlAvgltMGiuZoSjhwdNkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-QTm8G_FaPYOJrYObN9YZjQ-1; Tue, 09 Mar 2021 05:32:31 -0500
X-MC-Unique: QTm8G_FaPYOJrYObN9YZjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20BEE108BD06;
 Tue,  9 Mar 2021 10:32:30 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F85519709;
 Tue,  9 Mar 2021 10:32:24 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:32:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] coroutine: add libucontext as external library
Message-ID: <YEdOttxH4X3+gf+I@redhat.com>
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
 <CAFEAcA__kgr8=g1X87RAaMax9zs00mefCvqrfH4TzfU6oTaowA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA__kgr8=g1X87RAaMax9zs00mefCvqrfH4TzfU6oTaowA@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 10:20:07AM +0000, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 09:59, Joelle van Dyne <j@getutm.app> wrote:
> >
> > On Tue, Mar 9, 2021 at 1:36 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > The README here:
> > >
> > >   https://github.com/kaniini/libucontext
> > >
> > > indicates that it is intentionally limiting what registers it saves
> > > and restores, explicitly excluding FPU.
> > >
> > > Peter & Paolo expressed concern about this, indicating FPU reg support
> > > was a requirement for QEMU:
> > >
> > >    https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05525.html
> > >
> > Does it make a difference if this is provided as an option and not as
> > a replacement? Would it make sense to add some warning at configure
> > time? Right now none of the concurrency backends are supported on iOS
> > and it's possible support will go away on macOS as well in the future.
> > QEMU would not be able to run at all.
> 
> We don't currently support iOS; if we add it we definitely don't
> want to add it as a "we know this has buggy coroutine support"
> target, because that's a path to weird hard-to-diagnose bugs.

If we consider the biggest coroutine user is the block layer, then
"hard to diagnose bugs" may easily translate to "hard to disagnose
data corruption of your guest disks", which is even worse.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


