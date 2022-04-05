Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948AB4F3710
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:14:31 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjx0-00015w-80
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbjvB-0000Ey-CB
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nbjv7-0006Xw-OT
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649167952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JvSUdB+HijdelEhAOUJP9jfhoKeNTo6m/ThuXN7JJQ=;
 b=VKPu0YMOksZAF1pCk60kRhR+T4bbBlnw0BU95giYqFydl1rEFvOCBFELTm9RAIvl4she59
 zK8njoKpivbNuzMG2ZGLDNmY+90BLniKZgoocaJ5bT86UAE8XRFOXWjAlzVM3hPVjKvaxA
 X4zbXSRkutkzmC5bjXiUUTC8CvacHFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-hWlVrh0tNe6_fmDouoprag-1; Tue, 05 Apr 2022 10:12:29 -0400
X-MC-Unique: hWlVrh0tNe6_fmDouoprag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D136F899EC5;
 Tue,  5 Apr 2022 14:12:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2B4C28108;
 Tue,  5 Apr 2022 14:12:23 +0000 (UTC)
Date: Tue, 5 Apr 2022 16:12:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
Message-ID: <YkxORjbgM0tzFD02@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <2ee69a0b-8270-d9b3-9ddb-d31b5f5de82b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2ee69a0b-8270-d9b3-9ddb-d31b5f5de82b@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eesposit@redhat.com, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.04.2022 um 13:47 hat Hanna Reitz geschrieben:
> On 05.04.22 12:14, Kevin Wolf wrote:
> > Am 24.03.2022 um 13:57 hat Hanna Reitz geschrieben:
> > > When the stream block job cuts out the nodes between top and base in
> > > stream_prepare(), it does not drain the subtree manually; it fetches the
> > > base node, and tries to insert it as the top node's backing node with
> > > bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
> > > the actual base node might change (because the base node is actually not
> > > part of the stream job) before the old base node passed to
> > > bdrv_set_backing_hd() is installed.
> > > 
> > > This has two implications:
> > > 
> > > First, the stream job does not keep a strong reference to the base node.
> > > Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
> > > because some other block job is drained to finish), we will get a
> > > use-after-free.  We should keep a strong reference to that node.
> > > 
> > > Second, even with such a strong reference, the problem remains that the
> > > base node might change before bdrv_set_backing_hd() actually runs and as
> > > a result the wrong base node is installed.
> > > 
> > > Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
> > > case, which has five nodes, and simultaneously streams from the middle
> > > node to the top node, and commits the middle node down to the base node.
> > > As it is, this will sometimes crash, namely when we encounter the
> > > above-described use-after-free.
> > > 
> > > Taking a strong reference to the base node, we no longer get a crash,
> > > but the resuling block graph is less than ideal: The expected result is
> > > obviously that all middle nodes are cut out and the base node is the
> > > immediate backing child of the top node.  However, if stream_prepare()
> > > takes a strong reference to its base node (the middle node), and then
> > > the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
> > > that middle node, the stream job will just reinstall it again.
> > > 
> > > Therefore, we need to keep the whole subtree drained in
> > > stream_prepare()
> > That doesn't sound right. I think in reality it's "if we take the really
> > big hammer and drain the whole subtree, then the bit that we really need
> > usually happens to be covered, too".
> > 
> > When you have a long backing chain and merge the two topmost overlays
> > with streaming, then it's none of the stream job's business whether
> > there is I/O going on for the base image way down the chain. Subtree
> > drains do much more than they should in this case.
> 
> Yes, see the discussion I had with Vladimir.  He convinced me that this
> can’t be an indefinite solution, but that we need locking for graph changes
> that’s separate from draining, because (1) those are different things, and
> (2) changing the graph should influence I/O as little as possible.
> 
> I found this the best solution to fix a known case of a use-after-free for
> 7.1, though.

I'm not arguing against a short-term band-aid solution (I assume you
mean for 7.0?) as long as we agree that this is what it is. The commit
message just sounded as if this were the right solution rather than a
hack, so I wanted to make the point.

> > At the same time they probably do too little, because what you're
> > describing you're protecting against is not I/O, but graph modifications
> > done by callbacks invoked in the AIO_WAIT_WHILE() when replacing the
> > backing file. The callback could be invoked by I/O on an entirely
> > different subgraph (maybe if the other thing is a mirror job)or it
> > could be a BH or anything else really. bdrv_drain_all() would increase
> > your chances, but I'm not sure if even that would be guaranteed to be
> > enough - because it's really another instance of abusing drain for
> > locking, we're not really interested in the _I/O_ of the node.
> 
> The most common instances of graph modification I see are QMP and block jobs
> finishing.  The former will not be deterred by draining, and we do know of
> one instance where that is a problem (see the bdrv_next() discussion). 
> Generally, it isn’t though.  (If it is, this case here won’t be the only
> thing that breaks.)

To be honest, I would be surprised if other things weren't broken if QMP
commands come in with unfortunate timing.

> As for the latter, most block jobs are parents of the nodes they touch
> (stream is one notable exception with how it handles its base, and changing
> that did indeed cause us headache before), and so will at least be paused
> when a drain occurs on a node they touch.  Since pausing doesn’t affect jobs
> that have exited their main loop, there might be some problem with
> concurrent jobs that are also finished but yielding, but I couldn’t find
> such a case.

True, the way that we implement drain in the block job actually means
that they fully pause and therefore can't complete even if they wouldn't
actually access the drained node. The interface isn't really defined to
guarantee this, but the implementation happens to avoid such problems.

> I’m not sure what you’re arguing for, so I can only assume.  Perhaps you’re
> arguing for reverting this patch, which I wouldn’t want to do, because at
> least it fixes the one known use-after-free case. Perhaps you’re arguing
> that we need something better, and then I completely agree.

Definitely more the latter.

Maybe I really just want to hammer home that if you think that subtree
drains are the solution, you should think again, because the cases where
they are the right solution (as opposed to a hack that happens to do the
intended job as a side effect in 99% of cases) are the big exception.

I actually kind of regret introducing them. They were only used in
reopen, and they are kind of correct there because we know that we
_will_ touch every node and can't have concurrent I/O there. They are
still somewhat lazy and individual drains for each node might have been
the better solution.

> > > so that the graph modification it performs is effectively atomic,
> > > i.e. that the base node it fetches is still the base node when
> > > bdrv_set_backing_hd() sets it as the top node's backing node.
> > I think the way to keep graph modifications atomic is avoid polling in
> > the middle. Not even running any callbacks is a lot safer than trying to
> > make sure there can't be undesired callbacks that want to run.
> > 
> > So probably adding drain (or anything else that polls) in
> > bdrv_set_backing_hd() was a bad idea. It could assert that the parent
> > node is drained, but it should be the caller's responsibility to do so.
> > 
> > What streaming completion should look like is probably something like
> > this:
> > 
> >      1. Drain above_base, this also drains all parents up to the top node
> >         (needed because in-flight I/O using an edge that is removed isn't
> >         going to end well)
> > 
> >      2. Without any polling involved:
> >          a. Find base (it can't change without polling)
> >          b. Update top->backing to point to base
> > 
> >      3. End of drain.
> > 
> > You don't have to keep extra references or deal with surprise removals
> > of nodes because the whole thing is atomic when you don't poll. Other
> > threads can't interfere either because graph modification requires the
> > BQL.
> > 
> > There is no reason to keep base drained because its I/O doesn't
> > interfere with the incoming edge that we're changing.
> > 
> > I think all of this is really relevant for Emanuele's work, which
> > involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
> > fully expect that we would see very similar problems, and just stacking
> > drain sections over drain sections that might happen to usually fix
> > things, but aren't guaranteed to, doesn't look like a good solution.
> 
> I don’t disagree.  Well, I agree, actually.  But I don’t know what you’re
> proposing to actually do.  There is active discussion on how block graph
> changes should be handled on Emanuele’s series.

If you think we should keep the discussion there, that's fine with me.
But this seems like a good and relevant example for the problems we need
to keep in mind there.

Kevin


