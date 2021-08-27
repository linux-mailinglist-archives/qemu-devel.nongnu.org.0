Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D073F9E76
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgCM-00022p-07
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJg3o-0006OV-PC
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJg3j-0007B2-AG
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630086869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XNA10+6o7qcO/NQl2WQZmKwW1HjmUa+vQWxVNdLAwgs=;
 b=XcRJn1lZtGkLGzUGTF7DBrMM5wlTs4MLk9W0nvUOls8RfyvLl/k73Q9gCnlE2ZfZEJrDnr
 SXssmBDmigTrfs2NJ8xnc2JUM6uJr4dfUO2PBOTk4dTmVUXE6FUyBdPXcOLqmGD+icvUt+
 /zuLN1VpyVyPaX1rRErVMHQPPe3dWAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-hOf3ChbCPR2lVgHSbRPeqw-1; Fri, 27 Aug 2021 13:54:25 -0400
X-MC-Unique: hOf3ChbCPR2lVgHSbRPeqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7340EEC1A0;
 Fri, 27 Aug 2021 17:54:24 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A685C608BA;
 Fri, 27 Aug 2021 17:54:23 +0000 (UTC)
Date: Fri, 27 Aug 2021 12:54:22 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
Message-ID: <20210827175422.hqmnnouod66qwwuh@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
 <20210827164810.GO26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210827164810.GO26415@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 05:48:10PM +0100, Richard W.M. Jones wrote:
> On Fri, Aug 27, 2021 at 10:09:16AM -0500, Eric Blake wrote:
> > +# Parallel client connections are easier with libnbd than qemu-io:
> > +if ! (nbdsh --version) >/dev/null 2>&1; then
> 
> I'm curious why the parentheses are needed here?

Habit - some earlier Bourne shells would leak an error message if
nbdsh was not found unless you guarantee that stderr is redirected
first by using the subshell (or maybe that's what happen when you do
feature tests of a shell builtin, rather than an external app).  But
since this test uses bash, you're right that it's not necessary in
this instance, so I'll simplify.

> 
> > +export nbd_unix_socket
> > +nbdsh -c '
> > +import os
> > +sock = os.getenv("nbd_unix_socket")
> > +h = []
> > +
> > +for i in range(3):
> > +  h.append(nbd.NBD())
> > +  h[i].connect_unix(sock)
> > +  assert h[i].can_multi_conn()
> > +
> > +buf1 = h[0].pread(1024 * 1024, 0)
> > +if buf1 != b"\x01" * 1024 * 1024:
> > +  print("Unexpected initial read")
> > +buf2 = b"\x03" * 1024 * 1024
> > +h[1].pwrite(buf2, 0)                   #1
> > +h[2].flush()
> > +buf1 = h[0].pread(1024 * 1024, 0)
> > +if buf1 == buf2:
> > +  print("Flush appears to be consistent across connections")
> 
> The test is ... simple.
> 
> Would it be a better test if the statement at line #1 above was
> h.aio_pwrite instead, so the operation is only started?  This would
> depend on some assumptions inside libnbd: That the h[1] socket is
> immediately writable and that libnbd's statement will write before
> returning, which are likely to be true, but perhaps you could do
> something with parsing libnbd debug statements to check that the state
> machine has started the write.

The rules on consistent operations are tricky - it is not enough that
the client started the request in order, but that the server processed
things in order.  Even though you can have two clients in one process
and enough happens-between code in that you are sure that client A
sent NBD_CMD_WRITE prior to client B sending NBD_CMD_FLUSH, you do NOT
have enough power over TCP to prove that the server did not receive
client B's request first, unless you ALSO ensure that client A waited
for the server's response to the NBD_CMD_WRITE.  Similarly for client
C sending NBD_CMD_READ prior to client B getting the server's response
to NBD_CMD_FLUSH.  As soon as out-of-order request processing can
happen (which is more likely when you have parallel sockets), you can
only guarantee the cross-client consistency if you can also guarantee
which replies were received prior to sending a given request.  Using
asynch I/O does not provide those guarantees; the only reliable way to
test cross-client consistency is with synchronous commands.

Hmm - I should probably tweak the qemu-nbd command to set an explicit
cache mode (if it accidentally settles on cache=writethrough, that
defeats the point of an independent client's flush impacting all other
clients, since the client doing the write will also be flushing).

> 
> Another idea would be to make the write at line #1 be very large, so
> that perhaps the qemu block layer would split it up.  After the flush
> you would read the beginning and end bytes of the written part to
> approximate a check that the whole write has been flushed so parts of
> it are not hanging around in the cache of the first connection.
> 
> Anyway the patch as written seems fine to me so:
> 
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


