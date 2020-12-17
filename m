Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244092DD1E3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:08:56 +0100 (CET)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpt1b-0004lI-58
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpszE-0002yf-Qr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpszC-0003AV-Jt
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HoEHYiafdJ3VFjwGMLtUd6Ab5KECP7FSkHqJfsBmj5k=;
 b=JKBfVhoNM4L/TAWUtQyrtpsiPy4IviCWlRzrWkpeksm+qIXJZ3yk2qWhhV7/P5QAYVO7XG
 v/XH02uG8ODB0+fA3JfNmCAXsU19qWYGKTdlVn+UulJFii26b8zp3+bpuDAhdubW1jCfTJ
 gMrYIWnzKqVF/sTRh1Yh8q677QGd1Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-y7LRLn09PFaB_IwleJrLMQ-1; Thu, 17 Dec 2020 08:06:20 -0500
X-MC-Unique: y7LRLn09PFaB_IwleJrLMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9081835DE9;
 Thu, 17 Dec 2020 13:06:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C431B469;
 Thu, 17 Dec 2020 13:06:03 +0000 (UTC)
Date: Thu, 17 Dec 2020 14:06:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201217130602.GB12328@merkur.fritz.box>
References: <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
 <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.12.2020 um 13:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.12.2020 13:58, Kevin Wolf wrote:
> > Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
> > > On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
> > > > Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
> > > > > On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> > > > > > Anyway, trying to reconstruct the block graph with BdrvChild pointers
> > > > > > annotated at the edges:
> > > > > > 
> > > > > > BlockBackend
> > > > > >        |
> > > > > >        v
> > > > > >    backup-top ------------------------+
> > > > > >        |   |                          |
> > > > > >        |   +-----------------------+  |
> > > > > >        |            0x5655068b8510 |  | 0x565505e3c450
> > > > > >        |                           |  |
> > > > > >        | 0x565505e42090            |  |
> > > > > >        v                           |  |
> > > > > >      qcow2 ---------------------+  |  |
> > > > > >        |                        |  |  |
> > > > > >        | 0x565505e52060         |  |  | ??? [1]
> > > > > >        |                        |  |  |  |
> > > > > >        v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
> > > > > >      file                       v  v  v  v
> > > > > >                               qcow2 (backing)
> > > > > >                                      |
> > > > > >                                      | 0x565505e41d20
> > > > > >                                      v
> > > > > >                                    file
> > > > > > 
> > > > > > [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
> > > > > >      BdrvChild directly owned by the backup job.
> > > > > > 
> > > > > > > So it seems this is happening:
> > > > > > > 
> > > > > > > backup-top (5e48030) <---------| (5)
> > > > > > >     |    |                      |
> > > > > > >     |    | (6) ------------> qcow2 (5fbf660)
> > > > > > >     |                           ^    |
> > > > > > >     |                       (3) |    | (4)
> > > > > > >     |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> > > > > > >     |
> > > > > > >     |-> (2) file (5e52060)
> > > > > > > 
> > > > > > > backup-top (5e48030), the BDS that was passed as argument in the first
> > > > > > > bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
> > > > > > > is processing its parents, and the latter is also re-entered when the
> > > > > > > first one starts processing its children again.
> > > > > > 
> > > > > > Yes, but look at the BdrvChild pointers, it is through different edges
> > > > > > that we come back to the same node. No BdrvChild is used twice.
> > > > > > 
> > > > > > If backup-top had added all of its children to the ignore list before
> > > > > > calling into the overlay qcow2, the backing qcow2 wouldn't eventually
> > > > > > have called back into backup-top.
> > > > > 
> > > > > I've tested a patch that first adds every child to the ignore list,
> > > > > and then processes those that weren't there before, as you suggested
> > > > > on a previous email. With that, the offending qcow2 is not re-entered,
> > > > > so we avoid the crash, but backup-top is still entered twice:
> > > > 
> > > > I think we also need to every parent to the ignore list before calling
> > > > callbacks, though it doesn't look like this is the problem you're
> > > > currently seeing.
> > > 
> > > I agree.
> > > 
> > > > > bs=0x560db0e3b030 (backup-top) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing children
> > > > > bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e2f450 (child->bs=0x560db0fb2660)
> > > > > bs=0x560db0fb2660 (qcow2) enter
> > > > > bs=0x560db0fb2660 (qcow2) processing children
> > > > > bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db0e34d20 (child->bs=0x560db1bb3c00)
> > > > > bs=0x560db1bb3c00 (file) enter
> > > > > bs=0x560db1bb3c00 (file) processing children
> > > > > bs=0x560db1bb3c00 (file) processing parents
> > > > > bs=0x560db1bb3c00 (file) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db16964d0 (child->bs=0x560db0e50420)
> > > > > bs=0x560db0e50420 (qcow2) enter
> > > > > bs=0x560db0e50420 (qcow2) processing children
> > > > > bs=0x560db0e50420 (qcow2) calling bsaci child=0x560db0e34ea0 (child->bs=0x560db0e45060)
> > > > > bs=0x560db0e45060 (file) enter
> > > > > bs=0x560db0e45060 (file) processing children
> > > > > bs=0x560db0e45060 (file) processing parents
> > > > > bs=0x560db0e45060 (file) processing itself
> > > > > bs=0x560db0e50420 (qcow2) processing parents
> > > > > bs=0x560db0e50420 (qcow2) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) processing parents
> > > > > bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1672860
> > > > > bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1b14a20
> > > > > bs=0x560db0e3b030 (backup-top) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing children
> > > > > bs=0x560db0e3b030 (backup-top) processing parents
> > > > > bs=0x560db0e3b030 (backup-top) calling set_aio_ctx child=0x560db0e332d0
> > > > > bs=0x560db0e3b030 (backup-top) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) processing itself
> > > > > bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e35090 (child->bs=0x560db0e50420)
> > > > > bs=0x560db0e50420 (qcow2) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing parents
> > > > > bs=0x560db0e3b030 (backup-top) processing itself
> > > > > 
> > > > > I see that "blk_do_set_aio_context()" passes "blk->root" to
> > > > > "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
> > > > > so I'm not sure what's happening here. Is backup-top is referenced
> > > > > from two different BdrvChild or is "blk->root" not pointing to
> > > > > backup-top's BDS?
> > > > 
> > > > The second time that backup-top is entered, it is not as the BDS of
> > > > blk->root, but as the parent node of the overlay qcow2. Which is
> > > > interesting, because last time it was still the backing qcow2, so the
> > > > change did have _some_ effect.
> > > > 
> > > > The part that I don't understand is why you still get the line with
> > > > child=0x560db1b14a20, because when you add all children to the ignore
> > > > list first, that should have been put into the ignore list as one of the
> > > > first things in the whole process (when backup-top was first entered).
> > > > 
> > > > Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
> > > > but isn't actually present in backup-top's bs->children?
> > > 
> > > Exactly, that line corresponds to this chunk of code:
> > > 
> > > <---- begin ---->
> > >      QLIST_FOREACH(child, &bs->parents, next_parent) {
> > >          if (g_slist_find(*ignore, child)) {
> > >              continue;
> > >          }
> > >          assert(child->klass->set_aio_ctx);
> > >          *ignore = g_slist_prepend(*ignore, child);
> > >          fprintf(stderr, "bs=%p (%s) calling set_aio_ctx child=%p\n", bs, bs->drv->format_name, child);
> > >          child->klass->set_aio_ctx(child, new_context, ignore);
> > >      }
> > > <---- end ---->
> > > 
> > > Do you think it's safe to re-enter backup-top, or should we look for a
> > > way to avoid this?
> > 
> > I think it should be avoided, but I don't understand why putting all
> > children of backup-top into the ignore list doesn't already avoid it. If
> > backup-top is in the parents list of qcow2, then qcow2 should be in the
> > children list of backup-top and therefore the BdrvChild should already
> > be in the ignore list.
> > 
> > The only way I can explain this is that backup-top and qcow2 have
> > different ideas about which BdrvChild objects exist that connect them.
> > Or that the graph changes between both places, but I don't see how that
> > could happen in bdrv_set_aio_context_ignore().
> > 
> 
> bdrv_set_aio_context_ignore() do bdrv_drained_begin().. As I reported
> recently, nothing prevents some job finish and do graph modification
> during some another drained section. It may be the case.

Good point, this might be the same bug then.

If everything worked correctly, a job completion could only happen on
the outer bdrv_set_aio_context_ignore(). But after that, we are already
in a drain section, so the job should be quiesced and a second drain
shouldn't cause any additional graph changes.

I would have to go back to the other discussion, but I think it was
related to block jobs that are already in the completion process and
keep moving forward even though they are supposed to be quiesced.

If I remember correctly, actually pausing them at this point looked
difficult. Maybe what we should then do is letting .drained_poll return
true until they have actually fully completed?

Ah, but was this something that would deadlock because the job
completion callbacks use drain sections themselves?

> If backup-top involved, I can suppose that graph modification is in
> backup_clean, when we remove the filter.. Who is making
> set_aio_context in the issue? I mean, what is the backtrace of
> bdrv_set_aio_context_ignore()?

Sergio, can you provide the backtrace and also test if the theory with a
job completion in the middle of the process is what you actually hit?

Kevin


