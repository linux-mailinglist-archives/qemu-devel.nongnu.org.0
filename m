Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38A6EE91E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:37:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPOk-0007zW-RQ; Tue, 25 Apr 2023 16:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPOg-0007vz-8s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:36:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPOZ-0002vL-TN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682454970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pTCBuEf0qmvfjnSqR3orYqZmVEosIrXyQEutMoq0LVo=;
 b=N9JRvZ2CFwzylLaGjZajF8yDh3xooE6eSumtx7JfFcccOmZSH0vUOHolZ918VifLj4OkOf
 T5mu3QIozfAFg5CZlsBb/iXXpSD7NEv2cdDhxviG2nesoJBYEymzdyBBJQvtVbuYJ0pEg6
 5tF06vSFXVQbM/KcXBlfIHbtDUASTLo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-UXB0h6NXMbO_5coiI0tmng-1; Tue, 25 Apr 2023 16:36:06 -0400
X-MC-Unique: UXB0h6NXMbO_5coiI0tmng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E2E886466;
 Tue, 25 Apr 2023 20:36:06 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F05BE2027043;
 Tue, 25 Apr 2023 20:36:04 +0000 (UTC)
Date: Tue, 25 Apr 2023 15:36:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader
 lock
Message-ID: <nuzeche33pyoj55mjo6qnv4qay5l4gk34ka2pom3tsdjle5drv@5sgcju7s7z7q>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-8-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-8-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 07:31:45PM +0200, Kevin Wolf wrote:
> GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
> reader lock for the graph, so the correct annotation for them to use is
> TSA_ASSERT_SHARED rather than TSA_ASSERT.

The comments at the start of graph-lock.h state that there is only 1
writer (main loop, under BQL), and all others are readers (coroutines
in varous AioContext) - but that's regarding the main BdrvGraphRWlock.
I guess my confusion is over the act of writing the graph (only in the
main loop) and using TSA annotations to check for safety.  Am I
correct that the reason graph_lockable_auto_lock() only needs a
TSA_ASSERT_SHARED locking is that it is only reachable from the other
threads (and not the main loop thread itself) to check that we are
indeed in a point where we aren't contending with the main loop's
writable lock?

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/graph-lock.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
> index 7ef391fab3..adaa3ed089 100644
> --- a/include/block/graph-lock.h
> +++ b/include/block/graph-lock.h
> @@ -210,7 +210,7 @@ typedef struct GraphLockable { } GraphLockable;
>   * unlocked. TSA_ASSERT() makes sure that the following calls know that we
>   * hold the lock while unlocking is left unchecked.
>   */
> -static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
> +static inline GraphLockable * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
>  graph_lockable_auto_lock(GraphLockable *x)
>  {
>      bdrv_graph_co_rdlock();

But the act of grabbing a rdlock is definitely a SHARED not EXCLUSIVE
action, so I think I agree with your changing of the annotation, even
if the commit message could be slightly improved.

Assuming I've sorted out my own confusion on the various lock
terminoligies,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


