Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B62C0309
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:12:50 +0100 (CET)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh8q1-0003Cj-KV
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kh8oU-0002J3-4x
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kh8oR-000255-28
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606126269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DD1Hds3pCPHmhCMPUKo7PDNIaMjUvgFOCNc3ZEy2dOI=;
 b=HB4DnFgWZ7xECncBgWZDJg9wfvPC2IS8XJDI8nrHrgiyU6AvYMBttnKngntQOPTTQWlkEA
 +jiJJVr6f22WWs5I0p21RHeIcetqZJBDU++cmwHIwIb6yX+9vx4K5eJa+e/xWwbB81w5hm
 8L71lLhR6sRal+L+occxFZe0ZWKz7dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-7XFX5IP5PRCso5ZzNFCYyg-1; Mon, 23 Nov 2020 05:11:08 -0500
X-MC-Unique: 7XFX5IP5PRCso5ZzNFCYyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE3D1926DA4;
 Mon, 23 Nov 2020 10:11:06 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-153.ams2.redhat.com [10.36.113.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3DD5D6DC;
 Mon, 23 Nov 2020 10:11:00 +0000 (UTC)
Date: Mon, 23 Nov 2020 11:10:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
Message-ID: <20201123101058.GA5317@merkur.fritz.box>
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
 <20201120163627.GD5599@merkur.fritz.box>
 <e72b2129-0e65-5f8f-a90b-baf03757b1c9@virtuozzo.com>
 <20201120172251.GE5599@merkur.fritz.box>
 <6d6b17b9-80d6-aa90-6e1b-f8519ae181cc@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <6d6b17b9-80d6-aa90-6e1b-f8519ae181cc@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berto@igalia.com, qemu-block@nongnu.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.11.2020 um 19:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 20.11.2020 20:22, Kevin Wolf wrote:
> > Am 20.11.2020 um 17:43 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 20.11.2020 19:36, Kevin Wolf wrote:
> > > > Am 20.11.2020 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > Hi all!
> > > > > 
> > > > > As Peter recently noted, iotest 30 accidentally fails.
> > > > > 
> > > > > I found that Qemu crashes due to interleaving of graph-update
> > > > > operations of parallel mirror and stream block-jobs.
> > > > 
> > > > I haven't found the time yet to properly look into this or your other
> > > > thread where you had a similar question, but there is one thing I'm
> > > > wondering: Why can the nested job even make progress and run its
> > > > completion handler?
> > > > 
> > > > When we modify the graph, we should have drained the subtree in
> > > > question, so in theory while one job finishes and modifies the graph,
> > > > there should be no way for the other job to make progress and get
> > > > interleaved - it shouldn't be able to start I/O requests and much less
> > > > to run its completion handler and modify the graph.
> > > > 
> > > > Are we missing drained sections somewhere or do they fail to achieve
> > > > what I think they should achieve?
> > > > 
> > > 
> > > It all looks like both jobs are reached their finish simultaneously.
> > > So, all progress is done in both jobs. And they go concurrently to
> > > completion procedures which interleaves. So, there no more io through
> > > blk, which is restricted by drained sections.
> > 
> > They can't be truly simultaneous because they run in the same thread.
> > During job completion, this is the main thread.
> 
> No, they not truly simultaneous, but completions may interleave
> through nested aio_poll loops.
> 
> > 
> > However as soon as job_is_completed() returns true, it seems we're not
> > pausing the job any more when one of its nodes gets drained.
> > 
> > Possibly also relevant: The job->busy = false in job_exit(). The comment
> > there says it's a lie, but we might deadlock otherwise.
> > 
> > This problem will probably affect other callers, too, which drain a
> > subtree and then resonably expect that nobody will modify the graph
> > until they end the drained section. So I think the problem that we need
> > to address is that jobs run their completion handlers even though they
> > are supposed to be paused by a drain.
> 
> Hmm. I always thought about drained section as about thing that stops
> IO requests, not other operations.. And we do graph modifications in
> drained section to avoid in-flight IO requests during graph
> modification.

Is there any use for an operation that only stops I/O, but doesn't
prevent graph changes?

I always understood it as a request to have exclusive access to a
subtree, so that nobody else would touch it.

> > I'm not saying that your graph modification locks are a bad idea, but
> > they are probably not a complete solution.
> > 
> 
> Hmm. What do you mean? It's of course not complete, as I didn't
> protect every graph modification procedure.. But if we do protect all
> such things and do graph modifications always under this mutex, it
> should work I think.

What I mean is that not only graph modifications can conflict with each
other, but most callers of drain_begin/end will probably not be prepared
for the graph changing under their feet, even if they don't actively
change the graph themselves.

Kevin


