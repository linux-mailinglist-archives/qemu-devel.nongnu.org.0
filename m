Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E24CD6B3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:46:42 +0100 (CET)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Cb-0007Jw-PH
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:46:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ8hp-0001Dn-VL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ8hm-0005fF-VC
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=993s2wFTXY8FbiNzACgasSM4KCyMT9EtBODo05Lfsjo=;
 b=BQ1Io7Plb3FzwMGVpqVr9601R4f21+8XbjshqhjY3htSWCzk2qRQ0iR+/9j4kYSleiq5Ts
 EGfhDeUfCXfzwMmPecuvojtdX7S4UP6wVhwCZTVnfhOvkAj7cXsJgB46wLG3/wzLOornV5
 lyUa8iILO7ADsYjlnSmHySKX09WFzj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-328N4c35MHurBYRYNyIJIw-1; Fri, 04 Mar 2022 09:14:47 -0500
X-MC-Unique: 328N4c35MHurBYRYNyIJIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F2471854E27;
 Fri,  4 Mar 2022 14:14:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE277A523;
 Fri,  4 Mar 2022 14:14:24 +0000 (UTC)
Date: Fri, 4 Mar 2022 15:14:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/3] block: Make bdrv_refresh_limits() non-recursive
Message-ID: <YiIevvycAAzQZpmn@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
 <20220216105355.30729-2-hreitz@redhat.com>
 <YiDzOnUmNYy9sABR@redhat.com>
 <597e457f-2e41-8883-0bd0-97ccc49f17b4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <597e457f-2e41-8883-0bd0-97ccc49f17b4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.03.2022 um 13:44 hat Hanna Reitz geschrieben:
> On 03.03.22 17:56, Kevin Wolf wrote:
> > Am 16.02.2022 um 11:53 hat Hanna Reitz geschrieben:
> > > bdrv_refresh_limits() recurses down to the node's children.  That does
> > > not seem necessary: When we refresh limits on some node, and then
> > > recurse down and were to change one of its children's BlockLimits, then
> > > that would mean we noticed the changed limits by pure chance.  The fact
> > > that we refresh the parent's limits has nothing to do with it, so the
> > > reason for the change probably happened before this point in time, and
> > > we should have refreshed the limits then.
> > > 
> > > On the other hand, we do not have infrastructure for noticing that block
> > > limits change after they have been initialized for the first time (this
> > > would require propagating the change upwards to the respective node's
> > > parents), and so evidently we consider this case impossible.
> > I like your optimistic approach, but my interpretation would have been
> > that this is simply a bug. ;-)
> > 
> > blockdev-reopen allows changing options that affect the block limits
> > (most importantly probably request_alignment), so this should be
> > propagated to the parents. I think we'll actually not see failures if we
> > forget to do this, but parents can either advertise excessive alignment
> > requirements or they may run into RMW when accessing the child, so this
> > would only affect performance. This is probably why nobody reported it
> > yet.
> 
> Ah, right, I forgot this for parents of parents...  I thought the
> block limits of a node might change if its children list changes, and
> so we should bdrv_refresh_limits() when that children list changes,
> but forgot that we really do need to propagate this up, right.

I mean the case that you mention is true as well. A few places do call
bdrv_refresh_limits() after changing the graph, but I don't know if it
covers all cases.

> > > If this case is impossible, then we will not need to recurse down in
> > > bdrv_refresh_limits().  Every node's limits are initialized in
> > > bdrv_open_driver(), and are refreshed whenever its children change.
> > > We want to use the childrens' limits to get some initial default, but
> > > we can just take them, we do not need to refresh them.
> > I think even if we need to propagate to the parents, we still don't need
> > to propagate to the children because the children have already been
> > refreshed by whatever changed their options (like bdrv_reopen_commit()).
> > And parent limits don't influence the child limits at all.
> > 
> > So this patch looks good to me, just not the reasoning.
> 
> OK, so, uh, can we just drop these two paragraphs?  (“On the other hand...”
> and “If this case is impossible…”)
> 
> Or we could replace them with a note hinting at the potential bug that would
> need to be fixed, e.g.
> 
> “
> Consequently, we should actually propagate block limits changes upwards,
> not downwards.  That is a separate and pre-existing issue, though, and
> so will not be addressed in this patch.
> ”

Ok, I'm replacing this in my tree.

> Question is, if we at some point do propagate this upwards, won’t this cause
> exactly the same problem that this patch is trying to get around, i.e. that
> we might call bdrv_refresh_limits() on non-drained parent nodes?

Drain also propagates upwards, so at least those callers that drain the
node itself won't have the problem. And the other cases from the commit
messages look like they shouldn't have any parents.

Kevin


