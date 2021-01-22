Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F15300525
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:19:37 +0100 (CET)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xHk-00060r-R1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2xEA-0002dS-Cb
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:15:54 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2xE7-0008PN-KJ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:15:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AB82C7E11B48;
 Fri, 22 Jan 2021 15:15:47 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 22 Jan
 2021 15:15:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057c47e932-fcfe-4eda-b74c-cf70b457a404,
 5C4462AA179A775B9E7B1B010AD87AE25185C17B) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 22 Jan 2021 15:15:40 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] 9pfs: Improve unreclaim loop
Message-ID: <20210122151540.00872135@bahia.lan>
In-Reply-To: <1671508.b1m4HzQG7Z@silver>
References: <20210121181510.1459390-1-groug@kaod.org>
 <1671508.b1m4HzQG7Z@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c42949ba-eb31-46b4-a77e-0d60966c0113
X-Ovh-Tracer-Id: 16002133903274580378
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetgffffffggfekgeffteekhffhueelffdvhedvgfdthfeiudetvddulefgveevteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

On Fri, 22 Jan 2021 14:09:12 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 21. Januar 2021 19:15:10 CET Greg Kurz wrote:
> > If a fid was actually re-opened by v9fs_reopen_fid(), we re-traverse the
> > fid list from the head in case some other request created a fid that
> > needs to be marked unreclaimable as well (ie. the client opened a new
> 
> That's "i.e.". Not a big deal so ...
> 

I'll fix this up before pushing.

> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 

Thanks ! I'll post the patch for the reclaim_list conversion shortly.

> > handle on the path that is being unlinked). This is suboptimal since
> > most if not all fids that require it have likely been taken care of
> > already.
> > 
> > This is mostly the result of new fids being added to the head of the
> > list. Since the list is now a QSIMPLEQ, add new fids at the end instead
> > to avoid the need to rewind. Take a reference on the fid to ensure it
> > doesn't go away during v9fs_reopen_fid() and that it can be safely
> > passed to QSIMPLEQ_NEXT() afterwards. Since the associated put_fid()
> > can also yield, same is done with the next fid. So the logic here is
> > to get a reference on a fid and only put it back during the next
> > iteration after we could get a reference on the next fid.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > v2: - fix typos in changelog
> >     - drop bogus assert()
> > ---
> >  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 32 insertions(+), 14 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index b65f320e6518..3864d014b43c 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -311,7 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > fid) * reclaim won't close the file descriptor
> >       */
> >      f->flags |= FID_REFERENCED;
> > -    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
> > +    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> > 
> >      v9fs_readdir_init(s->proto_version, &f->fs.dir);
> >      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> > @@ -497,32 +497,50 @@ static int coroutine_fn
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
> > +    if (!fidp) {
> > +        return 0;
> > +    }
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
> >          }
> > +
> > +        /* We're done with this fid */
> > +        put_fid(pdu, fidp);
> >      }
> > +
> >      return 0;
> >  }
> 
> 
> 


