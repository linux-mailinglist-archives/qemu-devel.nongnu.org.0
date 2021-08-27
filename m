Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14D3F9F27
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:48:17 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgtf-0005xt-MQ
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJgqo-000314-GX
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJgql-0006wS-8c
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630089909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yae1btNwPqa7alHViHwU/a5ie4LWcyPhrZvu/9sD4kc=;
 b=WD7MtoIRktI93lFnf7T+SAdniRb9gT0DKkq66bcYl4o0xfatWlyL19fIRIgPAoFm9EmeJf
 ZyU42OOiIOq0eJOlCSbXbR5qsmMHNCtfGQKR9eaPyG43gbAquB2DwRLt2zENQJ6/lVdPg5
 MzkwsTE+x/lg0kxAPnL0Xz3OhGDn3vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-jJPhINGINP-Cu_2eSj5WTA-1; Fri, 27 Aug 2021 14:45:06 -0400
X-MC-Unique: jJPhINGINP-Cu_2eSj5WTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3811082921;
 Fri, 27 Aug 2021 18:45:05 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C107E5FC22;
 Fri, 27 Aug 2021 18:45:04 +0000 (UTC)
Date: Fri, 27 Aug 2021 13:45:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] nbd/server: Advertise MULTI_CONN for shared writable
 exports
Message-ID: <20210827184503.m3lbpz56qs6mpjla@redhat.com>
References: <20210827150916.532260-1-eblake@redhat.com>
 <81fc3d16-b357-5a8c-45f2-682ddf253590@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <81fc3d16-b357-5a8c-45f2-682ddf253590@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 rjones@redhat.com, nsoffer@redhat.com, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 07:58:10PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 27.08.2021 18:09, Eric Blake wrote:
> > According to the NBD spec, a server advertising
> > NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> > not see any cache inconsistencies: when properly separated by a single
> > flush, actions performed by one client will be visible to another
> > client, regardless of which client did the flush.  We satisfy these
> > conditions in qemu because our block layer serializes any overlapping
> > operations (see bdrv_find_conflicting_request and friends)
> 
> Not any. We serialize only write operations not aligned to request_alignment of bs (see bdrv_make_request_serialising() call in bdrv_co_pwritev_part). So, actually most of overlapping operations remain overlapping. And that's correct: it's not a Qemu work to resolve overlapping requests. We resolve them only when we are responsible for appearing of intersection: when we align requests up.

I welcome improvements on the wording.  Maybe what I should be
emphasizing is that even when there are overlapping requests, qemu
itself is multiplexing all of those requests through a single
interface into the backend, without any caching on qemu's part, and
relying on the consistency of the flush operation into that backend.

From a parallelism perspective, in file-posix.c, we don't distiguish
between two pwrite() syscalls made (potentially out-of-order) by a
single BDS client in two coroutines, from two pwrite() syscalls made
by two separate BDS clients.  Either way, those two syscalls may both
be asynchronous, but both go through a single interface into the
kernel's view of the underlying filesystem or block device.  And we
implement flush via fdatasync(), which the kernel already has some
pretty strong guarantees on cross-thread consistency.

But I am less certain of whether we are guaranteed cross-consistency
like that for all protocol drivers.  Is there any block driver (most
likely a networked one) where we have situations such that even though
we are using the same API for all asynchronous access within the qemu
coroutines, under the hood those APIs can end up diverging on their
destinations such as due to network round-robin effects, and result in
us seeing cache-inconsistent views?  That is, can we ever encounter
this:

-> read()
  -> kicks off networked storage call that resolves to host X
    -> host X caches the read
  <- reply
-> write()
  -> kicks off networked storage call that resolves to host Y
    -> host Y updates the file system
  <- reply
-> flush()
  -> kicks off networked storage call that resolves to host Y
    -> host Y starts flushing, but replies early
  <- reply
-> read()
  -> kicks off networked storage call that resolves to host X
    -> host X does not see effects of Y's flush yet, returns stale data

If we can encounter that, then in those situations we must not
advertise MULTI_CONN.  But I'm confident that file-posix.c does not
have that problem, and even if another driver did have that problem
(where our single API access can result in cache-inconsistent views
over the protocol, rather than flush really being effective to all
further API access to that driver), you'd think we'd be aware of it.
However, if we DO know of a place where that is the case, then now is
the time to design our QAPI control over whether to advertise NBD's
MULTI_CONN bit based on whether the block layer can warn us about a
particular block layer NOT being safe.

But unless we come up with such a scenario, maybe all I need here is
better wording to put in the commit message to state why we think we
ARE safe in advertising MULTI_CONN.  Remember, the NBD flag only has
an impact in relation to how strong flush calls are (it is NOT
required that overlapping write requests have any particular behavior
- that's always been up to the client to be careful with that, and
qemu need not go out of its way to prevent client stupidity with
overlapping writes), but rather that actions with a reply completed
prior to FLUSH are then visible to actions started after the reply to
FLUSH.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


