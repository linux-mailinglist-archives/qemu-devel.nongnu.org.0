Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59648553046
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:56:29 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bYa-0000Gt-90
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3bX3-0007M9-Ol
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3bWz-0001LG-Cr
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655808887;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pVWTtk2Ms6mpuFOeoRA7taO3VZfa1zj3s86N3hVsdRw=;
 b=WEFZzb90kSS3J2gTegy+STfDoBloisIhOba+nitIxEsE1KIz1iocQ41s5yJz6GnBslhaqm
 1Y80P/bh6YHSwuZiqsLjgrSLi8i7/wlK2V2qxASQZq7FZbT0Me5AZFAJqVwym0Rb9ssj/u
 bWmbHgMASx6eaC1ZZZmtpCAzaNUXQPs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-YOpnpJ_RPoyxDyZioNY7_g-1; Tue, 21 Jun 2022 06:54:44 -0400
X-MC-Unique: YOpnpJ_RPoyxDyZioNY7_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610021C0CE60;
 Tue, 21 Jun 2022 10:54:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F25C2811B;
 Tue, 21 Jun 2022 10:54:40 +0000 (UTC)
Date: Tue, 21 Jun 2022 11:54:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 00/11] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <YrGjbf17VdVF/Zj3@redhat.com>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <YrC7U1XH0pGsn5Df@work-vm>
 <92fb6e19-342a-aab6-b610-79e755ac69d3@redhat.com>
 <YrGeCJzWCi+Je9cl@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrGeCJzWCi+Je9cl@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Tue, Jun 21, 2022 at 11:31:36AM +0100, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
> > On 20/06/2022 20:24, Dr. David Alan Gilbert wrote:
> > > * Laurent Vivier (lvivier@redhat.com) wrote:
> > > > "-netdev socket" only supports inet sockets.
> > > > 
> > > > It's not a complex task to add support for unix sockets, but
> > > > the socket netdev parameters are not defined to manage well unix
> > > > socket parameters.
> > > > 
> > > > As discussed in:
> > > > 
> > > >    "socket.c added support for unix domain socket datagram transport"
> > > >    https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> > > > 
> > > > This series adds support of unix socket type using SocketAddress QAPI structure.
> > > > 
> > > > Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> > > > backend but they use the SocketAddress QAPI to provide socket parameters.
> > > > And then they also implement unix sockets (TCP and UDP).
> > > 
> > > Had you considered a -netdev chardev?
> > > 
> > 
> > I think by definition a "chardev" doesn't behave like a "netdev". Moreover
> > "chardev" is already a frontend for several backends (socket, udp, ...),
> > this would mean we use the frontend "chardev" as a backend of a "netdev".
> > More and more layers...
> 
> Yeh definitely more layers; but perhaps avoiding some duplication.
> 
> > And in the case of "-netdev dgram", we can use unix socket and
> > sendto()/recv() while something like "-chardev udp,id=char0 -netdev
> > chardev,chardev=char0,id=net0" doesn't support unix (see
> > qio_channel_socket_dgram_sync()/socket_dgram()) and uses a
> > "connect()/sendmsg()/recv()" (that really changes the behaviour of the
> > backend)
> 
> It was -chardev socket, path=/unix/socket/path    that I was thinking
> of; -chardev socket supports both tcp and unix already.

IMHO we've over-used & abused chardevs in contexts where we really
should not have done. The chardev API is passable when all you need
is a persistent bidirectional channel, but is a really bad fit for
backends wanting to be aware of the dynamic connection oriented
semantics that sockets offer. The hoops we've had to jump through
in places to deal with having chardevs open asynchronously or deal
with automatic chardev re-connection is quite gross.

Chardev in the past was convenient to use, because we were not so
great at doing CLI syntax modelling & implementation, so it was
useful to re-use the chardev code for socket address handling on
the CLI.  We also didn't historically have nice APIs for dealing
with sockets - if you didn't use chardevs, you were stuck with
the raw sockets APIs. With our aim for CLI to be modelled &
implemented with QAPI these days, that benefit of re-using chardevs
for CLI is largely eliminated.  With our QIOChannel APIs, the
benefits of re-using chardevs from an impl POV is also largely
eliminated.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


