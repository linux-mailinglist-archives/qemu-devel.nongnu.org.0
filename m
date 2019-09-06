Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70C4AB696
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 13:04:27 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6C2U-0006D4-Vw
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 07:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i6C1O-0005Lz-Q8
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i6C1M-0005z8-9P
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:03:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i6C1L-0005ux-SE
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:03:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EB08195D830;
 Fri,  6 Sep 2019 11:03:14 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE4A1001B00;
 Fri,  6 Sep 2019 11:03:04 +0000 (UTC)
Date: Fri, 6 Sep 2019 12:03:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190906110301.GW5119@redhat.com>
References: <20190905152136.30637-1-stefanha@redhat.com>
 <20190905174021.GR2700@work-vm>
 <20190906102926.GF5900@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190906102926.GF5900@stefanha-x1.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 06 Sep 2019 11:03:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 0/3] virtiofsd: get/set log level via DBus
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
Cc: virtio-fs@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eryu Guan <eguan@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 06, 2019 at 11:29:26AM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 05, 2019 at 06:40:21PM +0100, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > It is likely that virtiofsd will need to support "management commands" for
> > > reconfiguring it at runtime.  The first use case was proposed by Eryu Guan for
> > > getting/setting the current log level.
> > > 
> > > I promised to try out DBus as the management interface because it has a rich
> > > feature set and is accessible from most programming languages.  It should be
> > > able to support all the use cases we come up with.
> > > 
> > > This patch series is a prototype that implements the get-log-level and
> > > set-log-level management commands via DBus.  Use the new virtiofsctl tool to
> > > talk to a running virtiofsd process:
> > > 
> > >   # dbus-run-session ./virtiofsd ...
> > >   ...
> > >   Using dbus address unix:abstract=/tmp/dbus-H9WBbpjk3O,guid=0be16acefb868e6025a8737f5d7124d2
> > >   # export DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-H9WBbpjk3O,guid=0be16acefb868e6025a8737f5d7124d2
> > >   # ./virtiofsctl set-log-level err
> > > 
> > > Most of the work is done by gdbus-codegen(1).  It generates code for the
> > > org.qemu.Virtiofsd.xml interface definition.  Our code can use the simple
> > > virtiofsd_get/set_log_level() APIs and it will make corresponding DBus calls.
> > > 
> > > I'm pretty happy with this approach because the code is straightforward.  It
> > > hasn't even triggered seccomp failures yet :).
> > 
> > Yes it's less complex than I'd worried.
> > Now, I do think we've got to think about how qemu in general is going to
> > use dbus as people were discussing it, because then we have to think
> > what the security aspects are - do we need to look at some calls only
> > available to some clients etc.
> 
> The approach I took in this patch series is to launch a session bus just
> for this virtiofsd.  The abstract socket unix(7) namespace used by GDBus
> by default does not offer any security.  I think any process on the host
> can connect to it, regardless of uid/gid.

Other users will be able to connect(), but you'll find that the dbus
policy causes their connections to be dropped immediately - even if
they are the root user in fact.

> A path like unix:path=/tmp/foo would allow us to use UNIX Domain Socket
> permissions as the main security mechanism.  I'm not enthusiastic about
> using SELinux or some kind of DBus-specific policy language if we can
> avoid it because it's complex and obscure.

Yep, that just needs you to supply a config file when launching to
specify a desired filesystem path.

I don't think it is an either/or matter - I think we'll  want all
three in general - DAC controls on the socket, and DBus policy and
SELinux policy. DAC controls on the socket alone are not sufficient
if you want to separate each QEMU from each other and they're running
the same UID which is common.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

