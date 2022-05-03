Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9151808F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:04:18 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloS9-0006kI-3c
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlnpT-0008F8-S4
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:24:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlnpR-0001kx-6S
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651566256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/Mtho1oVybH+9H1ZAFr6JjtxHPJPvVM95bXhPXWmzQ=;
 b=Ykg/rQh3e+1DssEIacgaFVzZfVOdvhtWywsTYbbEbAx+qH3zPoI1pMK4jHhXGL+vFNcrAg
 h6SPelpxDLZydBzfibmG0QAjF2tQCrCqymmuLdgSKRK9Sq8Q0okHQ+sSWNAOsKRkyn7Lpk
 l+6rT4tfqD/lxeeahcMkfdQ3fAMS3t4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-moPcC0xxNWap4OMNd0mYJg-1; Tue, 03 May 2022 04:24:13 -0400
X-MC-Unique: moPcC0xxNWap4OMNd0mYJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C7288339A3;
 Tue,  3 May 2022 08:24:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64403C27EBC;
 Tue,  3 May 2022 08:24:11 +0000 (UTC)
Date: Tue, 3 May 2022 10:24:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YnDmqfMfzl9JRC+H@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
 <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
 <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
 <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
 <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.05.2022 um 10:02 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> Am 30/04/2022 um 07:17 schrieb Stefan Hajnoczi:
> > On Thu, Apr 28, 2022 at 11:56:09PM +0200, Emanuele Giuseppe Esposito wrote:
> >>
> >>
> >> Am 28/04/2022 um 12:45 schrieb Stefan Hajnoczi:
> >>> On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito wrote:
> >>>>
> >>>>
> >>>> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
> >>>>> Luckly, most of the cases where we recursively go through a graph are
> >>>>> the BlockDriverState callback functions in block_int-common.h
> >>>>> In order to understand what to protect, I categorized the callbacks in
> >>>>> block_int-common.h depending on the type of function that calls them:
> >>>>>
> >>>>> 1) If the caller is a generated_co_wrapper, this function must be
> >>>>>    protected by rdlock. The reason is that generated_co_wrapper create
> >>>>>    coroutines that run in the given bs AioContext, so it doesn't matter
> >>>>>    if we are running in the main loop or not, the coroutine might run
> >>>>>    in an iothread.
> >>>>> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() macro,
> >>>>>    then the function is safe. The main loop is the writer and thus won't
> >>>>>    read and write at the same time.
> >>>>> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
> >>>>>    macro, then we need to check the callers and see case-by-case if the
> >>>>>    caller is in the main loop, if it needs to take the lock, or delegate
> >>>>>    this duty to its caller (to reduce the places where to take it).
> >>>>>
> >>>>> I used the vrc script (https://github.com/bonzini/vrc) to get help finding
> >>>>> all the callers of a callback. Using its filter function, I can
> >>>>> omit all functions protected by the added lock to avoid having duplicates
> >>>>> when querying for new callbacks.
> >>>>
> >>>> I was wondering, if a function is in category (3) and runs in an
> >>>> Iothread but the function itself is not (currently) recursive, meaning
> >>>> it doesn't really traverse the graph or calls someone that traverses it,
> >>>> should I add the rdlock anyways or not?
> >>>>
> >>>> Example: bdrv_co_drain_end
> >>>>
> >>>> Pros:
> >>>>    + Covers if in future a new recursive callback for a new/existing
> >>>>      BlockDriver is implemented.
> >>>>    + Covers also the case where I or someone missed the recursive part.
> >>>>
> >>>> Cons:
> >>>>    - Potentially introducing an unnecessary critical section.
> >>>>
> >>>> What do you think?
> >>>
> >>> ->bdrv_co_drain_end() is a callback function. Do you mean whether its
> >>> caller, bdrv_drain_invoke_entry(), should take the rdlock around
> >>> ->bdrv_co_drain_end()?
> >>
> >> Yes. The problem is that the coroutine is created in bs AioContext, so
> >> it might be in an iothread.
> >>
> >>>
> >>> Going up further in the call chain (and maybe switching threads),
> >>> bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
> >>> it needs protection. If the caller of bdrv_do_drained_end() holds then
> >>> rdlock then I think none of the child functions (including
> >>> ->bdrv_co_drain_end()) need to take it explicitly.
> >>
> >> Regarding bdrv_do_drained_end and similar, they are either running in
> >> the main loop (or they will be, if coming from a coroutine) or in the
> >> iothread running the AioContext of the bs involved.
> >>
> >> I think that most of the drains except for mirror.c are coming from main
> >> loop. I protected mirror.c in patch 8, even though right now I am not
> >> really sure that what I did is necessary, since the bh will be scheduled
> >> in the main loop.
> >>
> >> Therefore we don't really need locks around drains.
> > 
> > Are you saying rdlock isn't necessary in the main loop because nothing
> > can take the wrlock while our code is executing in the main loop?
> 
> Yes, that's the idea.
> If I am not mistaken (and I hope I am not), only the main loop currently
> modifies/is allowed to modify the graph.

Aren't you completely ignoring coroutines in this? What would a
coroutine do that requires the graph not to change across a yield?

(It's not easily possible to protect this today, and I think this was
the source of some bugs in the past. But if we introduce some proper
locking, I would expect it to solve this.)

Kevin


