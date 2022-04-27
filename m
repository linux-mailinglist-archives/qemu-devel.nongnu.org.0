Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C251249E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 23:40:43 +0200 (CEST)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njpOq-0004ww-U6
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 17:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njpNW-000488-MF
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 17:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njpNT-0004Nm-Pz
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 17:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651095553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YF9RH5mXTl4OWSPMavEAWdjq9Hxm8RdPOE3VXnMz4lc=;
 b=OZ8JAiIYU3I4Ndbm6TYcNelXYz2ESB3A84cZ5RD4wTWs+/2OVJcBbiEHSERDz+gLnmm627
 uZrHChpVvyEGbY/8I3WyF0L0ug29OivuBtnrK7ZgeeXnU/bEXvl2qLTNnrXna9b25X9KJB
 aRsJwPZ5cq7RsTRXsKlO28x8OnlxGtM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-COP84vrYPamtr8yBir7aNQ-1; Wed, 27 Apr 2022 17:39:10 -0400
X-MC-Unique: COP84vrYPamtr8yBir7aNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0683185A5BC;
 Wed, 27 Apr 2022 21:39:10 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33506407E1C0;
 Wed, 27 Apr 2022 21:39:09 +0000 (UTC)
Date: Wed, 27 Apr 2022 16:39:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220427213907.arjmq7pxuqdhopvm@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
 <YmlmqSh9QADBm9jp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmlmqSh9QADBm9jp@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, rjones@redhat.com, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 05:52:09PM +0200, Kevin Wolf wrote:
> Am 14.03.2022 um 21:38 hat Eric Blake geschrieben:
> > According to the NBD spec, a server that advertises
> > NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> > not see any cache inconsistencies: when properly separated by a single
> > flush, actions performed by one client will be visible to another
> > client, regardless of which client did the flush.  We satisfy these
> > conditions in qemu when our block layer is backed by the local
> > filesystem (by virtue of the semantics of fdatasync(), and the fact
> > that qemu itself is not buffering writes beyond flushes).  It is
> > harder to state whether we satisfy these conditions for network-based
> > protocols, so the safest course of action is to allow users to opt-in
> > to advertising multi-conn.
> 
> Do you have an example of how this could be unsafe?

Nothing direct.  I tried to turn this on unconditionally in an earlier
version, and we waffled about whether we could prove that network
block backends (such as gluster) provide us the safety that the NBD
spec demands:

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00038.html
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06744.html

> 
> As I understand it, the NBD server has a single BlockBackend and
> therefore is a single client for the backend, be it file-posix or any
> network-based protocol. It doesn't really make a difference for the
> storage from how many different NBD clients the requests are coming.
> 
> I would have expected that cache coherency of the protocol level driver
> would only matter if you had two QEMU processes accessing the same file
> concurrently.

Or a multi-pathed connection to network storage, where one QEMU
process accesses the network device, but those accesses may
round-robin which server they reach, and where any caching at an
individual server may be inconsistent with what is seen on another
server unless flushing is used to force the round-robin access to
synchronize between the multi-path views.

> 
> In fact, I don't think we even need the flush restriction from the NBD
> spec. All clients see the same state (that of the NBD server
> BlockBackend) even without anyone issuing any flush. The flush is only
> needed to make sure that cached data is written to the backing storage
> when writeback caches are involved.
> 
> Please correct me if I'm misunderstanding something here.

Likewise me, if I'm being overly cautious.

I can certainly write a simpler v4 that just always advertises
MULTI_CONN if we allow more than one client, without any knob to
override it; it's just that it is harder to write a commit message
justifying why I think it is safe to do so.

> 
> > We may later tweak defaults to advertise
> > by default when the block layer can confirm that the underlying
> > protocol driver is cache consistent between multiple writers, but for
> > now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> > explicitly start qemu-nbd (new -m command-line option) or
> > qemu-storage-daemon (new qapi field 'multi-conn') with multi-conn
> > advertisement in a known-safe setup where the client end can then
> > benefit from parallel clients.
> > 
> > Note, however, that we don't want to advertise MULTI_CONN when we know
> > that a second client cannot connect (for historical reasons, qemu-nbd
> > defaults to a single connection while nbd-server-add and QMP commands
> > default to unlimited connections; but we already have existing means
> > to let either style of NBD server creation alter those defaults).  The
> > harder part of this patch is setting up an iotest to demonstrate
> > behavior of multiple NBD clients to a single server.  It might be
> > possible with parallel qemu-io processes, but I found it easier to do
> > in python with the help of libnbd, and help from Nir and Vladimir in
> > writing the test.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > Suggested-by: Nir Soffer <nsoffer@redhat.com>
> > Suggested-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> 
> > @@ -709,6 +714,17 @@ int main(int argc, char **argv)
> >                  exit(EXIT_FAILURE);
> >              }
> >              break;
> > +        case 'm':
> > +        {
> > +            Error *err = NULL;
> > +            multi_conn = qapi_enum_parse(&OnOffAuto_lookup, optarg,
> > +                                         ON_OFF_AUTO_AUTO, &err);
> > +            if (err) {
> > +                error_report_err(err);
> > +                exit(EXIT_FAILURE);
> > +            }
> 
> I think this is the same as passing &error_fatal.

Yes, sounds right.

> 
> > +            break;
> > +        }
> >          case 'f':
> >              fmt = optarg;
> >              break;
> > diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/tests/nbd-multiconn
> > new file mode 100755
> > index 000000000000..7d1179b33b05
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/nbd-multiconn
> > @@ -0,0 +1,157 @@
> > +#!/usr/bin/env python3

> > +
> > +import os
> > +from contextlib import contextmanager
> > +import iotests
> > +from iotests import qemu_img_create, qemu_io_silent
> 
> qemu_io_silent() doesn't exist any more, commit 72cfb937 removed it.

Sounds like I need to rebase and post v4 anyways, then.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


