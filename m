Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04C2FF079
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:36:43 +0100 (CET)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cwr-00056R-MB
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2cvW-0004GT-5g
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:35:19 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:41333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2cvS-0003sw-JJ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:35:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 75C3A8456DCD;
 Thu, 21 Jan 2021 17:35:00 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 21 Jan
 2021 17:34:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00548179e97-455a-48e7-9b5b-c1a9b48f4bbd,
 A41C5EF03AA0D3A03B7528971392D1AB75695B26) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 21 Jan 2021 17:34:55 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 3/3] 9pfs: Improve unreclaim loop
Message-ID: <20210121173455.45cbe7a7@bahia.lan>
In-Reply-To: <1978739.Uc7ZUDHExb@silver>
References: <20210118142300.801516-1-groug@kaod.org>
 <20210118142300.801516-4-groug@kaod.org>
 <1978739.Uc7ZUDHExb@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 39ed26cd-1bc8-4ffb-940b-d4576170a2d1
X-Ovh-Tracer-Id: 12480600469011929498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 13:50:37 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 18. Januar 2021 15:23:00 CET Greg Kurz wrote:
> > If a fid was actually re-open by v9fs_reopen_fid(), we re-traverse the
> 
> "re-opened"
> 
> > fid list from the head in case some other request created a fid that
> > needs to be marked unreclaimable as well (ie. the client open a new
> 
> "i.e." and either "opens" or "opened"
> 
> > handle on the path that is being unlinked). This is a suboptimal since
> 
> No "a" here: "This is suboptimal since"
> 

Thanks for the careful reading. I'll fix those :)

> > most if not all fids that require it have likely been taken care of
> > already.
> > 
> > This is mostly the result of new fids being added to the head of the
> > list. Since the list is now a QSIMPLEQ, add new fids at the end instead.
> > Take a reference on the fid to ensure it doesn't go away during
> > v9fs_reopen_fid() and that it can be safely passed to QSIMPLEQ_NEXT()
> > afterwards. Since the associated put_fid() can also yield, same is done
> > with the next fid. So the logic here is to get a reference on a fid and
> > only put it back during the next iteration after we could get a reference
> > on the next fid.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/9pfs/9p.c | 44 ++++++++++++++++++++++++++++++--------------
> >  1 file changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index b65f320e6518..b0ab5cf61c1f 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -311,7 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > fid) * reclaim won't close the file descriptor
> >       */
> >      f->flags |= FID_REFERENCED;
> > -    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
> > +    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> 
> I wondered whether that behaviour change could have negative side effects, but 
> I think the reason why they added it to the head of the list was simply 
> because they only had a head pointer (i.e. they would have needed a loop to 
> insert to tail).
> 

That's my thinking as well. And the open-code fid list was there from the
start, while reclaim was only added ~1 year later. Before reclaim, adding
to the head was an obvious choice.

> So yes, I think that change makes sense now with QSIMPLEQ.
> 
> > 
> >      v9fs_readdir_init(s->proto_version, &f->fs.dir);
> >      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> > @@ -497,32 +497,48 @@ static int coroutine_fn
> > v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) {
> >      int err;
> >      V9fsState *s = pdu->s;
> > -    V9fsFidState *fidp;
> > +    V9fsFidState *fidp, *fidp_next;
> > 
> > -again:
> > -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> > -        if (fidp->path.size != path->size) {
> > -            continue;
> > -        }
> > -        if (!memcmp(fidp->path.data, path->data, path->size)) {
> > +    fidp = QSIMPLEQ_FIRST(&s->fid_list);
> > +    assert(fidp);
> 
> And fidp is under regular circumstances always non-null here? The assumption 
> is that there is at least the root fid in the list, which the user should not 
> have permission to unlink, right?
> 

Oops this is a left-over... The assumption was that the client
didn't clunk all fids at the time v9fs_mark_fids_unreclaim() is
called. This is true with v9fs_remove() which gets a fid from
the list and directly calls v9fs_mark_fids_unreclaim(). This isn't
true though for v9fs_unlinkat() which calls v9fs_co_name_to_path()
in between, and thus could potentially yield and let the client
clunk all fids.

Good catch !

> > +
> > +    /*
> > +     * v9fs_reopen_fid() can yield : a reference on the fid must be held
> > +     * to ensure its pointer remains valid and we can safely pass it to
> > +     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
> > +     * we must keep a reference on the next fid as well. So the logic here
> > +     * is to get a reference on a fid and only put it back during the next
> > +     * iteration after we could get a reference on the next fid. Start with
> > +     * the first one.
> > +     */
> > +    for (fidp->ref++; fidp; fidp = fidp_next) {
> > +        if (fidp->path.size == path->size &&
> > +            !memcmp(fidp->path.data, path->data, path->size)) {
> >              /* Mark the fid non reclaimable. */
> >              fidp->flags |= FID_NON_RECLAIMABLE;
> > 
> >              /* reopen the file/dir if already closed */
> >              err = v9fs_reopen_fid(pdu, fidp);
> >              if (err < 0) {
> > +                put_fid(pdu, fidp);
> >                  return err;
> >              }
> > +        }
> > +
> > +        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> > +
> > +        if (fidp_next) {
> >              /*
> > -             * Go back to head of fid list because
> > -             * the list could have got updated when
> > -             * switched to the worker thread
> > +             * Ensure the next fid survives a potential clunk request
> > during +             * put_fid() below and v9fs_reopen_fid() in the next
> > iteration. */
> > -            if (err == 0) {
> > -                goto again;
> > -            }
> > +            fidp_next->ref++;
> 
> Mmm, that works as intended if fidp_next matches the requested path. However 
> if it is not (like it would in the majority of cases) then the loop breaks 
> next and the bumped reference count would never be reverted. Or am I missing 
> something here?
> 

Each iteration of the loop starts with an already referenced fidp.

The loop can only break if:

- v9fs_reopen_fid() fails, in which case put_fid(pdu, fidp) is called
  on the error path above
- end of list is reached, in which case the reference on fidp is
  dropped just like in all previous iterations...

> >          }
> > +
> > +        /* We're done with this fid */
> > +        put_fid(pdu, fidp);

... here.

> >      }
> > +
> >      return 0;
> >  }
> 
> Best regards,
> Christian Schoenebeck
> 
> 


