Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911C600E21
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:49:50 +0200 (CEST)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOcu-0006C9-Vs
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okOS7-0004fj-Dd
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okOS4-0007Y4-BM
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666006715;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WqFBwSmexc3IXlzQ3qfBG17jP659PL1Hvij3DwekiiI=;
 b=bA7rPiZJSu09B3BiKqwpiS6ASSAGSFIROt/v/lobaTAyaMwl12C1LdyYSEfrySeuNsqX1X
 457Dc4qp37GLdd0L5dbrR3GlW5EltyhbIEqIBJ/tZTAuFyGCUMJYTytXanyU9HTmkZxg5A
 3+NbHD1oTLtDnb0wayNRvgq6+BquZzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-39wSXnyJPViCvfbrx6HCbQ-1; Mon, 17 Oct 2022 07:38:34 -0400
X-MC-Unique: 39wSXnyJPViCvfbrx6HCbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 035A6185A7A3;
 Mon, 17 Oct 2022 11:38:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA303414A815;
 Mon, 17 Oct 2022 11:38:32 +0000 (UTC)
Date: Mon, 17 Oct 2022 12:38:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y00+tsrBs2m2CH6R@redhat.com>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 01:06:00PM +0530, manish.mishra wrote:
> Hi Daniel,
> 
> I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.
> 
> 1. Earlier i was thinking, on destination side as of now for default
> and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION
> so may be we can decide mapping based on that. But then that does not
> work for newly added post copy preempt channel as it does not send
> any MAGIC number. Also even for multiFD just MAGIC number does not
> tell which multifd channel number is it, even though as per my thinking
> it does not matter. So MAGIC number should be good for indentifying
> default vs multiFD channel?

Yep, you don't need to know more than the MAGIC value.

In migration_io_process_incoming, we need to use MSG_PEEK to look at
the first 4 bytes pendingon the wire. If those bytes are 'QEVM' that's
the primary channel, if those bytes are big endian 0x11223344, that's
a multifd channel.  Using MSG_PEEK aviods need to modify thue later
code that actually reads this data.

The challenge is how long to wait with the MSG_PEEK. If we do it
in a blocking mode, its fine for main channel and multifd, but
IIUC for the post-copy pre-empt channel we'd be waiting for
something that will never arrive.

Having suggested MSG_PEEK though, this may well not work if the
channel has TLS present. In fact it almost definitely won't work.

To cope with TLS migration_io_process_incoming would need to
actually read the data off the wire, and later methods be
taught to skip reading the magic.

> 2. For post-copy preempt may be we can initiate this channel only
> after we have received a request from remote e.g. remote page fault.
> This to me looks safest considering post-copy recorvery case too.
> I can not think of any depedency on post copy preempt channel which
> requires it to be initialised very early. May be Peter can confirm
> this.

I guess that could work

> 3. Another thing we can do is to have 2-way handshake on every
> channel creation with some additional metadata, this to me looks
> like cleanest approach and durable, i understand that can break
> migration to/from old qemu, but then that can come as migration
> capability?

The benefit of (1) is that the fix can be deployed for all existing
QEMU releases by backporting it.  (3) will meanwhile need mgmt app
updates to make it work, which is much more work to deploy.

We really shoulud have had a more formal handshake, and I've described
ways to achieve this in the past, but it is quite alot of work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


