Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CD6F0811
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:17:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3MF-0000Fw-7c; Thu, 27 Apr 2023 11:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3M9-0000FX-UD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3M7-0007Qu-TK
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682608581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qQsmmGJPrBlCzfarimSPChgsyl/YCcc9VdYkc40OuXo=;
 b=OHMirtuRZUnXaTeMYBQU6dA5BzW7Nzq0BDew8bW66iCYKgbmdyYqwaSJ8z6dzp9VL4xiHa
 Lw61qz8hLMof+LdNnUSVGdEEE4PUuKEuynEXBuKuXRqtghifBodk60SLpzJmYHkwg5QH0V
 MVmP5wIp4umbBOEIAAZu/jxHoaTFEH8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-ybN7Uj5JNIiaL5i6QfuonQ-1; Thu, 27 Apr 2023 11:16:09 -0400
X-MC-Unique: ybN7Uj5JNIiaL5i6QfuonQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1735832D0E;
 Thu, 27 Apr 2023 15:15:46 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1760FC16024;
 Thu, 27 Apr 2023 15:15:46 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:15:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader
 lock
Message-ID: <ziyo3ztbom35gnak4kahdlllx6nqushhrsvr7is6k6sldfmh2k@tl7zrjejo5ep>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-8-kwolf@redhat.com>
 <nuzeche33pyoj55mjo6qnv4qay5l4gk34ka2pom3tsdjle5drv@5sgcju7s7z7q>
 <ZEpcT2MNisoGppOk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEpcT2MNisoGppOk@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 27, 2023 at 01:28:15PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 22:36 hat Eric Blake geschrieben:
> > On Tue, Apr 25, 2023 at 07:31:45PM +0200, Kevin Wolf wrote:
> > > GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
> > > reader lock for the graph, so the correct annotation for them to use is
> > > TSA_ASSERT_SHARED rather than TSA_ASSERT.
> > 
> > The comments at the start of graph-lock.h state that there is only 1
> > writer (main loop, under BQL), and all others are readers (coroutines
> > in varous AioContext) - but that's regarding the main BdrvGraphRWlock.
> 
> I think much of that comment is actually unrelated to BdrvGraphRWlock
> (which tracks lock/unlock operations of a single thread), but to graph
> locking in general.

Yeah, I ended up at the same point - writing the graph vs. grabbing a
reader/writer lock as a writer are not the same thing, so the comments
at the start of the file are unrelated to the TSA annotations.

> 
> > I guess my confusion is over the act of writing the graph (only in the
> > main loop) and using TSA annotations to check for safety.  Am I
> > correct that the reason graph_lockable_auto_lock() only needs a
> > TSA_ASSERT_SHARED locking is that it is only reachable from the other
> > threads (and not the main loop thread itself) to check that we are
> > indeed in a point where we aren't contending with the main loop's
> > writable lock?
> 
> TSA_ASSERT_SHARED is not a precondition requirement, but a postcondition
> assertion. That is, callers of the function can assume that they hold
> the lock after this function returns.
> 
> This should really be TSA_ACQUIRE_SHARED for graph_lockable_auto_lock(),
> but as the comment above it states, this is impossible because TSA
> doesn't understand unlocking via the cleanup attribute.

clang has really dropped the ball on their cleanup attribute handling;
it's been a known issue for years now, and could make their static
checking so much more powerful if we didn't have to keep working
around it.

> 
> "shared" and "exclusive" in TSA map to "reader" and "writer" lock of a
> RWLock. So since we're only taking a reader lock in this function, we
> can only assert that the caller now holds a shared lock (which allows
> you to call GRAPH_RDLOCK functions), but not an exclusive one like the
> code previously suggested (this would allow you to call GRAPH_WRLOCK
> functions).
> 
> I'm not sure if this fully addresses your confusion yet. Feel free to
> ask if there are more unclear parts.

At this point, I don't have any wording suggestions, and appreciate
your responses confirming what I arrived at on my own, so my R-b still
stands.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


