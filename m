Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E056058243D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:27:44 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGeGV-0006BY-Dj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGeDA-0004Fq-QP
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGeD7-0003fD-4b
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658917452;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4Xe0ip0xQ/IrxYuHFw5c65OgRHtTs+dQ/Fnbj/6nWo=;
 b=FoqLZY3Ci2MoZX+zly5mwqNspNMM9ghf5Z6Vw1rTvetzfgZUr5/x9iW1mKfiFUZ0pqI4Ah
 hsd+uhkkGq2FaO7wObnNpRBc26cGUB0AJ2A2Abh9cVhxTlhrxHRVlVR0TgCTFEZhEcBWW0
 uhc6G9A+8mHGSWd2kBk9b+vIq+K2EOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-KnkJM6TkMIuqdjQDhLpVXQ-1; Wed, 27 Jul 2022 06:24:08 -0400
X-MC-Unique: KnkJM6TkMIuqdjQDhLpVXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 475B8101A588;
 Wed, 27 Jul 2022 10:24:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 730862166B26;
 Wed, 27 Jul 2022 10:24:04 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:24:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/5] Enable unix socket support on Windows
Message-ID: <YuESQP8hEzJiDc7D@redhat.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <YuD/+ehoLlwvzopk@redhat.com>
 <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Wed, Jul 27, 2022 at 06:15:50PM +0800, Bin Meng wrote:
> On Wed, Jul 27, 2022 at 5:06 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jul 27, 2022 at 03:35:37PM +0800, Bin Meng wrote:
> > > Support for the unix socket has existed both in BSD and Linux for the
> > > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > > the native support for the unix socket has came to Windows. Starting
> > > this build, two Win32 processes can use the AF_UNIX address family
> > > over Winsock API to communicate with each other.
> > >
> > > Introduce a new build time config option CONFIG_AF_UNIX when the build
> > > host has such a capability, and a run-time check afunix_available() for
> > > Windows host in the QEMU sockets util codes.
> > >
> > > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> > >
> > >
> > > Bin Meng (5):
> > >   util/qemu-sockets: Replace the call to close a socket with
> > >     closesocket()
> > >   util/oslib-win32: Add a helper to get the Windows version
> > >   qga/commands-win32: Use os_get_win_version()
> > >   util/qemu-sockets: Enable unix socket support on Windows
> > >   chardev/char-socket: Update AF_UNIX for Windows
> > >
> > >  meson.build               |  6 +++++
> > >  include/sysemu/os-win32.h |  2 ++
> > >  chardev/char-socket.c     |  8 +++++-
> > >  qga/commands-win32.c      | 27 +-------------------
> > >  util/oslib-win32.c        | 15 +++++++++++
> > >  util/qemu-sockets.c       | 52 ++++++++++++++++++++++++++++++++-------
> > >  6 files changed, 74 insertions(+), 36 deletions(-)
> >
> > What about net/socket.c ?
> 
> It looks net/socket.c does not need to adapt.
> 
> > Also there are many tests using AF_UNIX and this doesn't appear to
> > have enablede any of them.  I'd at least exepct to see  the sockets
> > tests-io-channel-socket.c test enabled to prove this functionality
> > is working.
> >
> 
> Enabling qtest to run on Windows is underway but that's a separate
> topic. The qtest itself is using unix socket so as long as we can run
> qtest on Windows, we should be fine.
> I feel this series is independent enough of being a standalone one.

That isn't qtest, that is basic unit tests. I would expect those to
be able to work with this series 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


