Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F240B77A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:07:49 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDmW-00065w-OI
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQDgh-0003Vt-Im
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQDge-0006YM-MA
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631646102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3heY051q07zVckQ7lf7EgqUxAIKCrprez5iRiUNNdQ=;
 b=XQ5jMB2z+p1uhVLK8sqL1uYjUbHANdnJGXW1W2ZPalDKpaG+or/rs2OxMPmiLYS+DpiAB+
 6VgSoqh4b2JcmuklMw2kZXR9acouAzi2lSkB6Zfg5aPrYgxYcC77F4QXVEjAsE4k/Qpeni
 CpqsOJLBNEfqVHuc/BT4o2vMM7cJRpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-YWNt6o4TNaOyI3g0r-xmcQ-1; Tue, 14 Sep 2021 15:01:39 -0400
X-MC-Unique: YWNt6o4TNaOyI3g0r-xmcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8655C835DE1;
 Tue, 14 Sep 2021 19:01:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17B7560CC6;
 Tue, 14 Sep 2021 19:01:38 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:01:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210914190136.u6aacvcuzxvppxjl@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: kwolf@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 05:40:59PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 13.09.2021 18:19, Richard W.M. Jones wrote:
> > $ rm -f /tmp/sock /tmp/pid
> > $ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
> > $ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
> > $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
> > qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> > $ killall qemu-nbd
> > 
> > nbdsh is abruptly dropping the NBD connection here which is a valid
> > way to close the connection.  It seems unnecessary to print an error
> > in this case so this commit suppresses it.
> > 
> > Note that if you call the nbdsh h.shutdown() method then the message
> > was not printed:
> > 
> > $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
> 
> My personal opinion, is that this warning doesn't hurt in general. I think in production tools should gracefully shutdown any connection, and abrupt shutdown is a sign of something wrong - i.e., worth warning.
> 
> Shouldn't nbdsh do graceful shutdown by default?

nbdsh exposes the ability to do graceful shutdown, but does not force
it (it is up to the client software using nbdsh whether it calls the
right APIs for a graceful shutdown).

We might consider a new API (which we'd then expose via a new
command-line option to nbdsh) that requests that libnbd try harder to
send NBD_OPT_ABORT or NBD_CMD_DISC prior to closing, but it would
still be something that end users would have to opt into using, and
not something we can turn on by default.

> > +++ b/nbd/server.c
> > @@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
> >           ret = nbd_handle_request(client, &request, req->data, &local_err);
> >       }
> >       if (ret < 0) {
> > -        error_prepend(&local_err, "Failed to send reply: ");
> > +        if (errno != EPIPE) {
> 
> Both nbd_handle_request() and nbd_send_generic_reply() declares that they return -errno on failure in communication with client. I think, you should use ret here: if (ret != -EPIPE). It's safer: who knows, does errno really set on all error paths of called functions? If not, we may see here errno of some another previous operation.

Correct - 'errno' is indeterminate at this point; the correct check is
if (-ret != EPIPE).  I can make that tweak while taking this patch, if
we decide it is worthwhile.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


