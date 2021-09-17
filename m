Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363AC40FDAF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:14:55 +0200 (CEST)
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGVo-0007KG-Lx
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRGNG-0006gC-Qt
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRGND-0008Hh-Du
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631894758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvzp8P3XATmhYONZ3PdriO3DohQDw4owhazrOVsVRVE=;
 b=QVLjRh28O6ogBgKcfdu3rmAJk4bdOGJvZFRyPR38q9ZF17p22QDp9YBnPt1XauYsjx16i/
 ly5yzF6esvdiB/kEocYdIK/S8/4Wu0UMwFRxkbGxmxZlsXkj67cOkwcbjiOIzQoU0pDWOB
 j35kbH6p8wzcKGZYjW5kt/IYBIQ4+mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-PZkWTHf-MOas3bgPHoXTwQ-1; Fri, 17 Sep 2021 12:05:55 -0400
X-MC-Unique: PZkWTHf-MOas3bgPHoXTwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E24E1084681;
 Fri, 17 Sep 2021 16:05:54 +0000 (UTC)
Received: from redhat.com (ovpn-113-101.phx2.redhat.com [10.3.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AB06D000;
 Fri, 17 Sep 2021 16:05:51 +0000 (UTC)
Date: Fri, 17 Sep 2021 11:05:50 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210917160550.ck2yeogaafsbx6jv@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
 <20210914163232.GN26415@redhat.com>
 <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
 <20210915090025.GP26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915090025.GP26415@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 10:00:25AM +0100, Richard W.M. Jones wrote:
> > >I would say the spec is at best contradictory, but if you read other
> > >parts of the spec, then it's pretty clear that we're allowed to drop
> > >the connection whenever we like.  This section says as much:
> > >
> > >https://github.com/NetworkBlockDevice/nbd/blob/5805b25ad3da96e7c0b3160cda51ea19eb518d5b/doc/proto.md#terminating-the-transmission-phase
> > 
> > Hmm, that was exactly the section I read and quoted :)
> > 
> > >
> > >   There are two methods of terminating the transmission phase:
> > >   ...
> > >   "The client or the server drops the TCP session (in which case it
> > >   SHOULD shut down the TLS session first). This is referred to as
> > >   'initiating a hard disconnect'."
> > 
> > Right. Here the method is defined, no word that client can do it at any time.
> 
> I don't read this as a definition.
> 
> But we should probably clarify the spec to note that dropping the
> connection is fine, because it is - no one has made any argument so
> far that there's an actual reason to waste time on NBD_CMD_DISC.
> 
> Rich.
> 
> > Next, in same section:
> > 
> >    Either side MAY initiate a hard disconnect if it detects a violation by the other party of a mandatory condition within this document.
> > 
> > Next
> >    The client MAY issue a soft disconnect at any time
> > 
> > And finally:
> > 
> >    The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances.

I went and re-read the upstream NBD discussion when this part of the
doc was added...

https://lists.debian.org/nbd/2016/04/msg00420.html
https://lists.debian.org/nbd/2016/04/msg00425.html

The argument back then was that sending CMD_DISC is desirable (clients
want to be nice to the server) but not mandatory (server must be
prepared for clients that aren't nice).  Sending CMD_DISC is what
counts as initiating soft disconnect; terminating abruptly without
CMD_DISC is hard disconnect (servers must not do it without detecting
some other first, but clients doing it when they have nothing further
to send is something we have to live with).

At the time the text was added, there was a question of whether to add
a command NBD_CMD_CLOSE that guaranteed clean server shutdown (the
client had to wait for the server's response):
https://lists.debian.org/nbd/2016/04/msg00236.html

but in the end, it was decided that the semantics of NBD_CMD_DISC were
already good enough for that purpose.  Which in turn means that
clients really do expect servers to gracefully flush things to disk on
NBD_CMD_DISC, and merely disconnecting (a hard shutdown) after
NBD_CMD_FLUSH is a bit riskier than sending a soft shutdown request.

> > 
> > 
> > Or do you mean some other spec section I missed?
> > 
> > >
> > >Anyway we're dropping the TCP connection because sometimes we are just
> > >interrogating an NBD server eg to find out what it supports, and doing
> > >a graceful shutdown is a waste of time and internet.

You're right that it costs another couple of packets, particularly for
things like 'nbdinfo --list', but is it really dominating the time
spent in the normal use of NBD?  Micro-optimizing the shutdown doesn't
have as much payoff as optimizing the speed of NBD_CMD_READ/WRITE.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


