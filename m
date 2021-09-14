Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DCD40B782
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:10:06 +0200 (CEST)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDoj-0000VX-M9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQDlr-00072G-No
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQDlp-00024h-SV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631646421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VaOKUMACtxFxxCr4l0Cmk9t7FvH2n7TDngodxuz6X6A=;
 b=ZQ9B6m3i1xj2G0L4nW6iXjRKceEfQ7zGzl8hPqY0p3apH5SqGM4cG8E1S0pNoLdCLAayBB
 LMPPyzBl5CxigWXQqc9y2WDT+abtigYgh8cjaFX0ko0FDAwotJvzx+uTPn0LxVh9umcsNF
 2dvrvLQurc0lz6sXUO+xWOU9jvac8Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-pVdkDnVEP1mE4L9OjvEhfg-1; Tue, 14 Sep 2021 15:07:00 -0400
X-MC-Unique: pVdkDnVEP1mE4L9OjvEhfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D44800FF4;
 Tue, 14 Sep 2021 19:06:59 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1400C53E08;
 Tue, 14 Sep 2021 19:06:57 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:06:55 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210914190655.m6imyqm3qryczzqe@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914145200.GJ26415@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

[IOn Tue, Sep 14, 2021 at 03:52:00PM +0100, Richard W.M. Jones wrote:
> On Tue, Sep 14, 2021 at 05:40:59PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > 13.09.2021 18:19, Richard W.M. Jones wrote:
> > >$ rm -f /tmp/sock /tmp/pid
> > >$ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> > >$ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> > >$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> > >qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> > >$ killall qemu-nbd
> > >
> > >nbdsh is abruptly dropping the NBD connection here which is a valid
> > >way to close the connection.  It seems unnecessary to print an error
> > >in this case so this commit suppresses it.
> > >
> > >Note that if you call the nbdsh h.shutdown() method then the message
> > >was not printed:
> > >
> > >$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
> >
> > My personal opinion, is that this warning doesn't hurt in general. I
> > think in production tools should gracefully shutdown any connection,
> > and abrupt shutdown is a sign of something wrong - i.e., worth
> > warning.
> >
> > Shouldn't nbdsh do graceful shutdown by default?
> 
> On the client side the only difference is that nbd_shutdown sends
> NBD_CMD_DISC to the server (versus simply closing the socket).  On the
> server side when the server receives NBD_CMD_DISC it must complete any
> in-flight requests, but there's no requirement for the server to
> commit anything to disk.  IOW you can still lose data even though you
> took the time to disconnect.

If you use NBD_CMD_FLUSH as the last command before NBD_CMD_DISC, then
you shouldn't have data loss (but it requires the server to support
flush).  And in general, while a server that does not flush data on
CMD_DISC is compliant, it is poor quality of implementation if it
strands data that easily, for a client that tried hard to exit
gracefully.

> 
> So I don't think there's any reason for libnbd to always gracefully
> shut down (especially in this case where there are no in-flight
> requests), and anyway it would break ABI to make that change and slow
> down the client in cases when there's nothing to clean up.

I agree that we don't want libnbd to always gracefully shut down by
default; end users can already choose a graceful shutdown when they
want.

At the same time, I would not be opposed to improving the libnbd and
nbdkit testsuite usage of libnbd to request graceful shutdown in
places where it is currently getting an abrupt disconnect merely
because we were lazy when writing the test.

> 
> > >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > >---
> > >  nbd/server.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/nbd/server.c b/nbd/server.c
> > >index 3927f7789d..e0a43802b2 100644
> > >--- a/nbd/server.c
> > >+++ b/nbd/server.c
> > >@@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
> > >          ret = nbd_handle_request(client, &request, req->data, &local_err);
> > >      }
> > >      if (ret < 0) {
> > >-        error_prepend(&local_err, "Failed to send reply: ");
> > >+        if (errno != EPIPE) {
> >
> > Both nbd_handle_request() and nbd_send_generic_reply() declares that
> > they return -errno on failure in communication with client. I think,
> > you should use ret here: if (ret != -EPIPE). It's safer: who knows,
> > does errno really set on all error paths of called functions? If
> > not, we may see here errno of some another previous operation.
> 
> Should we set errno = 0 earlier in nbd_trip()?  I don't really know
> how coroutines in qemu interact with thread-local variables though.

No, we don't need to set errno to 0 prior to a call except at points
where we expect errno to be reliable after the call; but nbd_trip()
does not have any guarantees of reliable errno in the first place
(instead, it captured errno into the return value prior to any point
where errno loses its reliability).


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


