Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F07B624860
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otBLK-00038E-Mx; Thu, 10 Nov 2022 12:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otBLI-00037m-MH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otBLG-0002Ds-Lp
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668101273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5+bfPcValHvaDaREUNZxAn32ziRsfqaXpoS2N5vChy4=;
 b=PWd/ge7gnpRGzMlGal1WYy5cB4Wf2FobLI2ziM6/Y+bvMAunXXHcsZ54Y6XZ4ySWE6a51s
 53aaYVQXzXZtUamE7RIoh/xWKJx7jQr+wkyOS3bB2qACQP7tM7atDZhZXCxnxPs/6CXtlr
 wviYruZNsvHbGinBhZjCxiKSXdJW/tE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-dXnOlwi9PbiBxsMu6aOZwA-1; Thu, 10 Nov 2022 12:27:50 -0500
X-MC-Unique: dXnOlwi9PbiBxsMu6aOZwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9BD23C025C0;
 Thu, 10 Nov 2022 17:27:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2A940C83DD;
 Thu, 10 Nov 2022 17:27:48 +0000 (UTC)
Date: Thu, 10 Nov 2022 18:27:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 08/13] stream: Replace subtree drain with a single node
 drain
Message-ID: <Y200ktGQEUKHjZgW@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-9-kwolf@redhat.com>
 <f44e394a-e447-dae1-5ee8-c5b1a34f6db8@yandex-team.ru>
 <Y2zPYbwEAqbg68KJ@redhat.com>
 <ad3b4250-a0e3-10fa-aea4-4e98a6e10ac5@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3b4250-a0e3-10fa-aea4-4e98a6e10ac5@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 10.11.2022 um 12:25 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/10/22 13:16, Kevin Wolf wrote:
> > Am 09.11.2022 um 17:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > On 11/8/22 15:37, Kevin Wolf wrote:
> > > > The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
> > > > graph changes between finding the base node and changing the block graph
> > > > as necessary on completion of the image streaming job.
> > > > 
> > > > The block graph could change between these two points because
> > > > bdrv_set_backing_hd() first drains the parent node, which involved
> > > > polling and can do anything.
> > > > 
> > > > Subtree draining was an imperfect way to make this less likely (because
> > > > with it, fewer callbacks are called during this window). Everyone agreed
> > > > that it's not really the right solution, and it was only committed as a
> > > > stopgap solution.
> > > > 
> > > > This replaces the subtree drain with a solution that simply drains the
> > > > parent node before we try to find the base node, and then call a version
> > > > of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
> > > > parent node is already drained.
> > > > 
> > > > This way, any graph changes caused by draining happen before we start
> > > > looking at the graph and things stay consistent between finding the base
> > > > node and changing the graph.
> > > > 
> > > > Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> > > [..]
> > > 
> > > >        base = bdrv_filter_or_cow_bs(s->above_base);
> > > > -    if (base) {
> > > > -        bdrv_ref(base);
> > > > -    }
> > > > -
> > > >        unfiltered_base = bdrv_skip_filters(base);
> > > >        if (bdrv_cow_child(unfiltered_bs)) {
> > > > @@ -82,7 +85,7 @@ static int stream_prepare(Job *job)
> > > >                }
> > > >            }
> > > > -        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
> > > > +        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
> > > >            ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
> > > If we have yield points / polls during bdrv_set_backing_hd_drained()
> > > and bdrv_change_backing_file(), it's still bad and another
> > > graph-modifying operation may interleave. But b1e1af394d9 reports only
> > > polling in bdrv_set_backing_hd(), so I think it's OK to not care about
> > > other cases.
> > At this point in the series, bdrv_replace_child_noperm() can indeed
> > still poll. I'm not sure how bad it is, but at this point we're already
> > reconfiguring the graph with two specific nodes and somehow this poll
> > hasn't caused problems in the past. Anyway, at the end of the series,
> > there isn't be any polling left in bdrv_set_backing_hd_drained(), as far
> > as I can tell.
> > 
> > bdrv_change_backing_file() will certainly poll because it does I/O to
> > the image file. However, the change to the graph is completed at that
> > point, so I don't think it's a problem. Do you think it would be worth
> > putting a comment before bdrv_change_backing_file() that mentions that
> > the graph may change again from here on, but we've completed the graph
> > change?
> > 
> 
> Comment won't hurt. I think theoretically that's possible that we
> 
> 1. change the graph
> 2. yield in bdrv_change_backing_file
> 3. switch to another graph-modifying operation, change backing file and do another bdrv_change_backing_file()
> 4. return to bdrv_change_backing_file() of [2] and write wrong backing file to metadata
> 
> And the only solution for such things that I can imagine is a kind of
> global graph-modifying lock, which should be held around the whole
> graph modifying operation, including writing metadata.

Actually, I don't think this is the case. The problem that you get here
is just that we haven't really defined what happens when you get two
concurrent .bdrv_change_backing_file requests. To solve this, you don't
need to lock the whole graph, you just need to order the updates at the
block driver level instead of doing them in parallel, so that we know
that the last .bdrv_change_backing_file call wins. I think taking
s->lock in qcow2 would already achieve this (but still lock more than is
strictly necessary).

> Probably, we shouldn't care until we have real bug reports of it.
> Actually I hope that the only user who start stream and commit jobs in
> parallel on same backing-chain is our iotests :)

Yes, it sounds very theoretical. :-)

Kevin


