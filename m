Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F343FD5F6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:53:31 +0200 (CEST)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLzt-0005mD-HW
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLLxt-0003uK-0v
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLLxm-0007Tg-S1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630486276;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bj/3Wq5VSEXYsoUvI2U/b/PpJOmYNwIyy8yOPrYEJ74=;
 b=ORAW+7VuBkix9QkIrwnOn+kStlbpxsVP6u4cYTD4J/4YNJ/GLmJzg3GyjORAKGNlawlNsp
 27a8azKipqTp3Li3FxOeDvdw9IrjzLIvHK+MTX3EVDwdpllhOL6g+el6rdc7WCZaSbYVjV
 17SM0iPq6kwxUk5/+sW7ToPLmh1oAvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-QlsDTV-CPlS1u0Diahe-Iw-1; Wed, 01 Sep 2021 04:51:14 -0400
X-MC-Unique: QlsDTV-CPlS1u0Diahe-Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FED380124F;
 Wed,  1 Sep 2021 08:51:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C441712D49;
 Wed,  1 Sep 2021 08:50:59 +0000 (UTC)
Date: Wed, 1 Sep 2021 09:50:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YS8+8EKboNvsB0zP@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
MIME-Version: 1.0
In-Reply-To: <YS6QmOrN4qr055vR@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 04:27:04PM -0400, Peter Xu wrote:
> On Tue, Aug 31, 2021 at 01:57:33PM +0100, Daniel P. Berrangé wrote:
> > On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
> > > send calls. It does so by avoiding copying user data into kernel buffers.
> > > 
> > > To make it work, three steps are needed:
> > > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > > 3 - Process the socket's error queue, dealing with any error
> > 
> > AFAICT, this is missing the single most critical aspect of MSG_ZEROCOPY.
> > 
> > It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> > from a synchronous call to an asynchronous call.
> > 
> > It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> > until an asynchronous completion notification has been received from
> > the socket error queue. These notifications are not required to
> > arrive in-order, even for a TCP stream, because the kernel hangs on
> > to the buffer if a re-transmit is needed.
> > 
> > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > 
> >   "Page pinning also changes system call semantics. It temporarily 
> >    shares the buffer between process and network stack. Unlike with
> >    copying, the process cannot immediately overwrite the buffer 
> >    after system call return without possibly modifying the data in 
> >    flight. Kernel integrity is not affected, but a buggy program
> >    can possibly corrupt its own data stream."
> > 
> > AFAICT, the design added in this patch does not provide any way
> > to honour these requirements around buffer lifetime.
> > 
> > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > way. The buffer lifetime requirements imply need for an API
> > design that is fundamentally different for asynchronous usage,
> > with a callback to notify when the write has finished/failed.
> 
> Regarding buffer reuse - it indeed has a very deep implication on the buffer
> being available and it's not obvious at all.  Just to mention that the initial
> user of this work will make sure all zero copy buffers will be guest pages only
> (as it's only used in multi-fd), so they should always be there during the
> process.

That is not the case when migration is using TLS, because the buffers
transmitted are the ciphertext buffer, not the plaintext guest page.

> In short, we may just want to at least having a way to make sure all zero
> copied buffers are finished using and they're sent after some function returns
> (e.g., qio_channel_flush()).  That may require us to do some accounting on when
> we called sendmsg(MSG_ZEROCOPY), meanwhile we should need to read out the
> ee_data field within SO_EE_ORIGIN_ZEROCOPY msg when we do recvmsg() for the
> error queue and keep those information somewhere too.
> 
> Some other side notes that reached my mind..
> 
> The qio_channel_writev_full() may not be suitable for async operations, as the
> name "full" implies synchronous to me.  So maybe we can add a new helper for
> zero copy on the channel?

All the APIs that exist today are fundamentally only suitable for sync
operations. Supporting async correctly will definitely a brand new APIs
separate from what exists today.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


