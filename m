Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCD40B33A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:37:14 +0200 (CEST)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAUj-0005BZ-OU
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQ9nA-0005LO-Ph
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQ9n5-0001tx-SC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631631125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyjjglx3RnrC5CzQunCAg3CWJLlEZFUYItPoDzNBKMc=;
 b=PSZbp/U5Dk3W4vEfGFLRm1PLcujOvwbexI3oiDYsEhShqGGIx8oye1UprtIvt47+ry1Djz
 DFViDUu/vHNDF+/eeguXyRjaO8/3sZVxH/1k1Cksl93TgLIYSmjLHPb0PNaHvXwKkNF2qz
 GHGdbR+UYmE6Zsh87How88X2xlJZ2Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-dFBM6DAZMCmHeoJ9NS9Ohg-1; Tue, 14 Sep 2021 10:52:02 -0400
X-MC-Unique: dFBM6DAZMCmHeoJ9NS9Ohg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEB4802934;
 Tue, 14 Sep 2021 14:52:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29C665D9CA;
 Tue, 14 Sep 2021 14:52:00 +0000 (UTC)
Date: Tue, 14 Sep 2021 15:52:00 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210914145200.GJ26415@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 05:40:59PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 13.09.2021 18:19, Richard W.M. Jones wrote:
> >$ rm -f /tmp/sock /tmp/pid
> >$ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> >$ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> >$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> >qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> >$ killall qemu-nbd
> >
> >nbdsh is abruptly dropping the NBD connection here which is a valid
> >way to close the connection.  It seems unnecessary to print an error
> >in this case so this commit suppresses it.
> >
> >Note that if you call the nbdsh h.shutdown() method then the message
> >was not printed:
> >
> >$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
>
> My personal opinion, is that this warning doesn't hurt in general. I
> think in production tools should gracefully shutdown any connection,
> and abrupt shutdown is a sign of something wrong - i.e., worth
> warning.
>
> Shouldn't nbdsh do graceful shutdown by default?

On the client side the only difference is that nbd_shutdown sends
NBD_CMD_DISC to the server (versus simply closing the socket).  On the
server side when the server receives NBD_CMD_DISC it must complete any
in-flight requests, but there's no requirement for the server to
commit anything to disk.  IOW you can still lose data even though you
took the time to disconnect.

So I don't think there's any reason for libnbd to always gracefully
shut down (especially in this case where there are no in-flight
requests), and anyway it would break ABI to make that change and slow
down the client in cases when there's nothing to clean up.

> >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> >---
> >  nbd/server.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/nbd/server.c b/nbd/server.c
> >index 3927f7789d..e0a43802b2 100644
> >--- a/nbd/server.c
> >+++ b/nbd/server.c
> >@@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
> >          ret = nbd_handle_request(client, &request, req->data, &local_err);
> >      }
> >      if (ret < 0) {
> >-        error_prepend(&local_err, "Failed to send reply: ");
> >+        if (errno != EPIPE) {
>
> Both nbd_handle_request() and nbd_send_generic_reply() declares that
> they return -errno on failure in communication with client. I think,
> you should use ret here: if (ret != -EPIPE). It's safer: who knows,
> does errno really set on all error paths of called functions? If
> not, we may see here errno of some another previous operation.

Should we set errno = 0 earlier in nbd_trip()?  I don't really know
how coroutines in qemu interact with thread-local variables though.

Rich.

> >+            error_prepend(&local_err, "Failed to send reply: ");
> >+        } else {
> >+            error_free(local_err);
> >+            local_err = NULL;
> >+        }
> >          goto disconnect;
> >      }
> >
> 
> 
> -- 
> Best regards,
> Vladimir

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


