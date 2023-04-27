Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E986F0504
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:29:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prznV-0006I0-Qu; Thu, 27 Apr 2023 07:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prznT-0006Hn-RY
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prznR-0003fw-2Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682594900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+gdklBykihMS2NvfjoFbxWKXiYCowQdDSLZnNE+z+I=;
 b=M8WzMXt+knL8qLk4OLbi4nUskq0xZ1/VQIAokuVzi9/6Srah+E9d8fEoAXIGQAo4GrJ6zw
 +5Jsk1Nn13Nr6w1bOcfWkmc434cJYXZsMJpSbRN82lFi3eHnsxpsny5unIVrrTC8cEz1hQ
 D1bbE3QUGL84rBNKndfJlz0bXiu12sY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-CXBq58uaMr2UlU3twDZkiQ-1; Thu, 27 Apr 2023 07:28:18 -0400
X-MC-Unique: CXBq58uaMr2UlU3twDZkiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E9F688CC44;
 Thu, 27 Apr 2023 11:28:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F702027043;
 Thu, 27 Apr 2023 11:28:17 +0000 (UTC)
Date: Thu, 27 Apr 2023 13:28:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader
 lock
Message-ID: <ZEpcT2MNisoGppOk@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-8-kwolf@redhat.com>
 <nuzeche33pyoj55mjo6qnv4qay5l4gk34ka2pom3tsdjle5drv@5sgcju7s7z7q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nuzeche33pyoj55mjo6qnv4qay5l4gk34ka2pom3tsdjle5drv@5sgcju7s7z7q>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 25.04.2023 um 22:36 hat Eric Blake geschrieben:
> On Tue, Apr 25, 2023 at 07:31:45PM +0200, Kevin Wolf wrote:
> > GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
> > reader lock for the graph, so the correct annotation for them to use is
> > TSA_ASSERT_SHARED rather than TSA_ASSERT.
> 
> The comments at the start of graph-lock.h state that there is only 1
> writer (main loop, under BQL), and all others are readers (coroutines
> in varous AioContext) - but that's regarding the main BdrvGraphRWlock.

I think much of that comment is actually unrelated to BdrvGraphRWlock
(which tracks lock/unlock operations of a single thread), but to graph
locking in general.

> I guess my confusion is over the act of writing the graph (only in the
> main loop) and using TSA annotations to check for safety.  Am I
> correct that the reason graph_lockable_auto_lock() only needs a
> TSA_ASSERT_SHARED locking is that it is only reachable from the other
> threads (and not the main loop thread itself) to check that we are
> indeed in a point where we aren't contending with the main loop's
> writable lock?

TSA_ASSERT_SHARED is not a precondition requirement, but a postcondition
assertion. That is, callers of the function can assume that they hold
the lock after this function returns.

This should really be TSA_ACQUIRE_SHARED for graph_lockable_auto_lock(),
but as the comment above it states, this is impossible because TSA
doesn't understand unlocking via the cleanup attribute.

"shared" and "exclusive" in TSA map to "reader" and "writer" lock of a
RWLock. So since we're only taking a reader lock in this function, we
can only assert that the caller now holds a shared lock (which allows
you to call GRAPH_RDLOCK functions), but not an exclusive one like the
code previously suggested (this would allow you to call GRAPH_WRLOCK
functions).

I'm not sure if this fully addresses your confusion yet. Feel free to
ask if there are more unclear parts.

Kevin


