Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8854E354
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:21:02 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFjB-0000cA-Fh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1heFfv-0007gJ-Aq
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1heFfs-0002Ip-8g
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:17:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1heFfg-0001rL-QD; Fri, 21 Jun 2019 05:17:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 11CE83082E23;
 Fri, 21 Jun 2019 09:17:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-40.ams2.redhat.com
 [10.36.117.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1940604CF;
 Fri, 21 Jun 2019 09:16:57 +0000 (UTC)
Date: Fri, 21 Jun 2019 11:16:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
Message-ID: <20190621091656.GA9744@localhost.localdomain>
References: <20181205122326.26625-1-dplotnikov@virtuozzo.com>
 <20181207122647.GE5119@linux.fritz.box>
 <bb51b8f9-a3a4-90e6-2f69-57e90ccd623a@virtuozzo.com>
 <20181212122457.GB5415@linux.fritz.box>
 <d0d2cab4-2157-1f9f-3bc9-a70f28a211b0@virtuozzo.com>
 <20181213122039.GC5427@linux.fritz.box>
 <f2fcbcc2-5e0f-053d-f4c7-fe0f5f6092f0@virtuozzo.com>
 <20190313160412.GF5167@linux.fritz.box>
 <101bbf98-0456-5022-e117-fd6f693a8786@virtuozzo.com>
 <20190409100142.GC6610@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409100142.GC6610@localhost.localdomain>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 09:17:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] blk: postpone request
 execution on a context protected with "drained section"
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "keith.busch@intel.com" <keith.busch@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.04.2019 um 12:01 hat Kevin Wolf geschrieben:
> Am 02.04.2019 um 10:35 hat Denis Plotnikov geschrieben:
> > On 13.03.2019 19:04, Kevin Wolf wrote:
> > > Am 14.12.2018 um 12:54 hat Denis Plotnikov geschrieben:
> > >> On 13.12.2018 15:20, Kevin Wolf wrote:
> > >>> Am 13.12.2018 um 12:07 hat Denis Plotnikov geschrieben:
> > >>>> Sounds it should be so, but it doesn't work that way and that's why:
> > >>>> when doing mirror we may resume postponed coroutines too early when the
> > >>>> underlying bs is protected from writing at and thus we encounter the
> > >>>> assert on a write request execution at bdrv_co_write_req_prepare when
> > >>>> resuming the postponed coroutines.
> > >>>>
> > >>>> The thing is that the bs is protected for writing before execution of
> > >>>> bdrv_replace_node at mirror_exit_common and bdrv_replace_node calls
> > >>>> bdrv_replace_child_noperm which, in turn, calls child->role->drained_end
> > >>>> where one of the callbacks is blk_root_drained_end which check
> > >>>> if(--blk->quiesce_counter == 0) and runs the postponed requests
> > >>>> (coroutines) if the coundition is true.
> > >>>
> > >>> Hm, so something is messed up with the drain sections in the mirror
> > >>> driver. We have:
> > >>>
> > >>>       bdrv_drained_begin(target_bs);
> > >>>       bdrv_replace_node(to_replace, target_bs, &local_err);
> > >>>       bdrv_drained_end(target_bs);
> > >>>
> > >>> Obviously, the intention was to keep the BlockBackend drained during
> > >>> bdrv_replace_node(). So how could blk->quiesce_counter ever get to 0
> > >>> inside bdrv_replace_node() when target_bs is drained?
> > >>>
> > >>> Looking at bdrv_replace_child_noperm(), it seems that the function has
> > >>> a bug: Even if old_bs and new_bs are both drained, the quiesce_counter
> > >>> for the parent reaches 0 for a moment because we call .drained_end for
> > >>> the old child first and .drained_begin for the new one later.
> > >>>
> > >>> So it seems the fix would be to reverse the order and first call
> > >>> .drained_begin for the new child and then .drained_end for the old
> > >>> child. Sounds like a good new testcase for tests/test-bdrv-drain.c, too.
> > >> Yes, it's true, but it's not enough...
> > > 
> > > Did you ever implement the changes suggested so far, so that we could
> > > continue from there? Or should I try and come up with something myself?
> > 
> > Sorry for the late reply...
> > Yes, I did ...
> 
> If there are more question or problems, can you post the patches in
> their current shape (as an RFC) or a git URL so I can play with it a
> bit? If you could include a failing test case, too, that would be ideal.

Denis? Please?

We really should get this fixed and I would be willing to lend a hand,
but if you keep your patches secret, I can't really do so and would have
to duplicate your work.

Also, please see my old answer from April below for the last problem you
had with implementing the correct approach.

Kevin

> > >> In mirror_exit_common() we actively manipulate with block driver states.
> > >> When we replaced a node in the snippet you showed we can't allow the
> > >> postponed coroutines to run because the block tree isn't ready to
> > >> receive the requests yet.
> > >> To be ready, we need to insert a proper block driver state to the block
> > >> backend which is done here
> > >>
> > >>       blk_remove_bs(bjob->blk);
> > >>       blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
> > >>       blk_insert_bs(bjob->blk, mirror_top_bs, &error_abort); << << << <<
> > >>
> > >>       bs_opaque->job = NULL;
> > >>
> > >>       bdrv_drained_end(src);
> > > 
> > > Did you actually encounter a bug here or is this just theory? bjob->blk
> > > is the BlockBackend of the job and isn't in use at this point any more.
> > > We only insert the old node in it again because block_job_free() must
> > > set bs->job = NULL, and it gets bs with blk_bs(bjob->blk).
> > > 
> > > So if there is an actual bug here, I don't understand it yet.
> > And did encounter the bug that I described above.
> > When a postponed coroutine resumes it fails on assert:
> > 
> > bdrv_co_write_req_prepare: Assertion `child->perm & BLK_PERM_WRITE' failed
> > 
> > That's why it happens: we have the mirror filter bds in blk root which 
> > receives all the requests. On mirror completion we call 
> > mirror_exit_common to finish mirroring. To finish mirroring we need to 
> > remove the mirror filter from the graph and set mirror file blk root.
> > We call block_job_complete. Assume the ide request has came after the 
> > completion calling and has been postponed because blk->quiesce_counter 
> > is not 0.
> 
> Just to avoid confusion, there are two BlockBackends here. Lets call the
> one attached to the IDE device the ide_blk, and the one owned by the
> block job job_blk.
> 
> > block_job_complete does mirror_exit_common which drops the permissions.
> > 
> >      /* We don't access the source any more. Dropping any WRITE/RESIZE is
> >       * required before it could become a backing file of target_bs. */
> >      bdrv_child_try_set_perm(mirror_top_bs->backing, 0, BLK_PERM_ALL,
> >                              &error_abort);
> 
> Hm... This permission change is questionable (it temporarily drops the
> file locks of the backing chain), but as long as we don't get new
> requests to mirror_top_bs, it should be okay. As the attached parents
> are drained, no requests should be made to mirror_top_bs until it is
> removed from the graph.
> 
> > then, it replaces the source with the target
> > 
> >          /* The mirror job has no requests in flight any more, but we 
> > need to
> >           * drain potential other users of the BDS before changing the 
> > graph. */
> > 
> >          // here, target_bs has no parents and doesn't begin to draing
> > 
> >          bdrv_drained_begin(target_bs);
> > 
> >          // after execution of the function below
> >          // target bs has mirror_top_bs->backing as a parent
> > 
> >          bdrv_replace_node(to_replace, target_bs, &local_err);
> 
> Right, and both ide_blk and job_blk point to the subtree with target_bs
> in it. They are both still drained because target_bs is drained.
> 
> src is also still drained, but it doesn't have parents any more. It is
> only kept alive because of the explicit bdrv_ref() at the start of the
> function.
> 
> >          // now target_bs has source's blk as a parent
> >          // the following call sets blk->quiesce_counter to 0
> >          // and executes the postponed coroutine on blk with
> >          // mirror filter set which eventually does writing
> >          // on mirror_top_bs->backing child which has no writing
> >          // (and reading) permissions
> > 
> >          bdrv_drained_end(target_bs);
> > 
> > 
> > Does it make thing more clear?
> 
> Yes, I see the problem now. So we accidentally end the drained section
> before mirror_top_bs is actually removed from the chain.
> 
> How about the following then? It should make sure that requests can't
> run before the whole graph change is completed.
> 
> Kevin
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index ff15cfb197..8e197779ec 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -643,6 +643,11 @@ static int mirror_exit_common(Job *job)
>      bdrv_ref(mirror_top_bs);
>      bdrv_ref(target_bs);
> 
> +    /* The mirror job has no requests in flight any more, but we need to
> +     * drain potential other users of the BDS before changing the graph. */
> +    assert(s->in_drain);
> +    bdrv_drained_begin(target_bs);
> +
>      /* Remove target parent that still uses BLK_PERM_WRITE/RESIZE before
>       * inserting target_bs at s->to_replace, where we might not be able to get
>       * these permissions.
> @@ -682,12 +687,7 @@ static int mirror_exit_common(Job *job)
>              bdrv_reopen_set_read_only(target_bs, ro, NULL);
>          }
> 
> -        /* The mirror job has no requests in flight any more, but we need to
> -         * drain potential other users of the BDS before changing the graph. */
> -        assert(s->in_drain);
> -        bdrv_drained_begin(target_bs);
>          bdrv_replace_node(to_replace, target_bs, &local_err);
> -        bdrv_drained_end(target_bs);
>          if (local_err) {
>              error_report_err(local_err);
>              ret = -EPERM;
> @@ -722,6 +722,7 @@ static int mirror_exit_common(Job *job)
> 
>      bs_opaque->job = NULL;
> 
> +    bdrv_drained_end(target_bs);
>      bdrv_drained_end(src);
>      s->in_drain = false;
>      bdrv_unref(mirror_top_bs);
> 

