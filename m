Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517402FB99C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:37:01 +0100 (CET)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s7w-0004uJ-CS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1s5W-0003K2-Ds
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:34:30 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1s5T-0003q5-CW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:34:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 7410523015D;
 Tue, 19 Jan 2021 15:34:14 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 19 Jan
 2021 15:34:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00587674bee-0403-4f7c-9cef-486855d552fa,
 9B6877A1159CEF26E29E5BE572491BB707B5295E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 19 Jan 2021 15:34:07 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/3] 9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ
Message-ID: <20210119153407.208c4df7@bahia.lan>
In-Reply-To: <1901754.QplClEOiAT@silver>
References: <20210118142300.801516-1-groug@kaod.org>
 <20210118142300.801516-3-groug@kaod.org>
 <1901754.QplClEOiAT@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 183a8c02-b859-4cef-b35f-b6cc33b5f71f
X-Ovh-Tracer-Id: 17142389033884096922
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduvdeijefgheehtdefledvleelkefgleffheekhfegueejgfeukeduheekgfdvvdenucffohhmrghinheptgdqfhgrqhdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
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

On Tue, 19 Jan 2021 14:31:26 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 18. Januar 2021 15:22:59 CET Greg Kurz wrote:
> > The fid_list is currently open-coded. This doesn't seem to serve any
> > purpose that cannot be met with QEMU's generic lists. Let's go for a
> > QSIMPLEQ : this will allow to add new fids at the end of the list and
> > to improve the logic in v9fs_mark_fids_unreclaim().
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> In general LGTM hence:
> 
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> Some comments below ...
> 
> > ---
> >  hw/9pfs/9p.c | 41 ++++++++++++++++++-----------------------
> >  hw/9pfs/9p.h |  4 ++--
> >  2 files changed, 20 insertions(+), 25 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 37c3379b7462..b65f320e6518 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -260,7 +260,7 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu,
> > int32_t fid) V9fsFidState *f;
> >      V9fsState *s = pdu->s;
> > 
> > -    for (f = s->fid_list; f; f = f->next) {
> > +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> >          BUG_ON(f->clunked);
> >          if (f->fid == fid) {
> >              /*
> > @@ -295,7 +295,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > fid) {
> >      V9fsFidState *f;
> > 
> > -    for (f = s->fid_list; f; f = f->next) {
> > +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> >          /* If fid is already there return NULL */
> >          BUG_ON(f->clunked);
> >          if (f->fid == fid) {
> > @@ -311,8 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > fid) * reclaim won't close the file descriptor
> >       */
> >      f->flags |= FID_REFERENCED;
> > -    f->next = s->fid_list;
> > -    s->fid_list = f;
> > +    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
> 
> Not related to this series, but I wonder why queue.h wraps everything into:
> 
> do {
> 	...
> } while (0);
> 

Note, this is do { ... } while (0) *without* the trailing semi-colon, which
is the corner stone of this trick.

> No comment about it in git history. Looks like a leftover of its initial 
> import from 2009.
> 

This is the usual way to define multi-statement macros. More details here:

http://c-faq.com/cpp/multistmt.html

> >      v9fs_readdir_init(s->proto_version, &f->fs.dir);
> >      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> > @@ -401,20 +400,16 @@ static int coroutine_fn put_fid(V9fsPDU *pdu,
> > V9fsFidState *fidp)
> > 
> >  static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
> >  {
> > -    V9fsFidState **fidpp, *fidp;
> > +    V9fsFidState *fidp;
> > 
> > -    for (fidpp = &s->fid_list; *fidpp; fidpp = &(*fidpp)->next) {
> > -        if ((*fidpp)->fid == fid) {
> > -            break;
> > +    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> > +        if (fidp->fid == fid) {
> > +            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > +            fidp->clunked = true;
> > +            return fidp;
> >          }
> >      }
> > -    if (*fidpp == NULL) {
> > -        return NULL;
> > -    }
> > -    fidp = *fidpp;
> > -    *fidpp = fidp->next;
> > -    fidp->clunked = true;
> > -    return fidp;
> > +    return NULL;
> >  }
> 
> Good cleanup there!
> 

Thanks !

> >  void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
> > @@ -423,7 +418,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
> >      V9fsState *s = pdu->s;
> >      V9fsFidState *f, *reclaim_list = NULL;
> > 
> > -    for (f = s->fid_list; f; f = f->next) {
> > +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> >          /*
> >           * Unlink fids cannot be reclaimed. Check
> >           * for them and skip them. Also skip fids
> > @@ -505,7 +500,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU
> > *pdu, V9fsPath *path) V9fsFidState *fidp;
> > 
> >  again:
> > -    for (fidp = s->fid_list; fidp; fidp = fidp->next) {
> > +    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> >          if (fidp->path.size != path->size) {
> >              continue;
> >          }
> > @@ -537,13 +532,13 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
> >      V9fsFidState *fidp;
> > 
> >      /* Free all fids */
> > -    while (s->fid_list) {
> > +    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> >          /* Get fid */
> > -        fidp = s->fid_list;
> > +        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> >          fidp->ref++;
> > 
> >          /* Clunk fid */
> > -        s->fid_list = fidp->next;
> > +        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> >          fidp->clunked = true;
> > 
> >          put_fid(pdu, fidp);
> > @@ -3121,7 +3116,7 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> > *pdu, V9fsFidState *fidp, * Fixup fid's pointing to the old name to
> >       * start pointing to the new name
> >       */
> > -    for (tfidp = s->fid_list; tfidp; tfidp = tfidp->next) {
> > +    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> >          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
> >              /* replace the name */
> >              v9fs_fix_path(&tfidp->path, &new_path,
> > strlen(fidp->path.data)); @@ -3215,7 +3210,7 @@ static int coroutine_fn
> > v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, * Fixup fid's pointing
> > to the old name to
> >       * start pointing to the new name
> >       */
> > -    for (tfidp = s->fid_list; tfidp; tfidp = tfidp->next) {
> > +    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> >          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
> >              /* replace the name */
> >              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> > @@ -4081,7 +4076,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> > V9fsTransport *t, s->ctx.fmode = fse->fmode;
> >      s->ctx.dmode = fse->dmode;
> > 
> > -    s->fid_list = NULL;
> > +    QSIMPLEQ_INIT(&s->fid_list);
> >      qemu_co_rwlock_init(&s->rename_lock);
> > 
> >      if (s->ops->init(&s->ctx, errp) < 0) {
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index 93656323d1d7..85fb6930b0ca 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -280,7 +280,7 @@ struct V9fsFidState {
> >      uid_t uid;
> >      int ref;
> >      bool clunked;
> > -    V9fsFidState *next;
> > +    QSIMPLEQ_ENTRY(V9fsFidState) next;
> >      V9fsFidState *rclm_lst;
> >  };
> 
> Is there a reason for not migrating 'rclm_lst' as well?
> 

Yeah. I did consider doing so at first but these were
too many changes. Also, the fid list and the reclaim
list have quite different needs, that each deserve its
own patch.

> Anyway, if you decide to do that as well, then it would IMO be fine with a 
> separate patch later on, not worth making it more complicated with a v2 just 
> for that.

Yes, I already have a patch to convert the reclaim list to QSLIST.
I'll post it later as it is merely cosmetic, while this series
changes the behavior.

> > @@ -339,7 +339,7 @@ typedef struct {
> >  struct V9fsState {
> >      QLIST_HEAD(, V9fsPDU) free_list;
> >      QLIST_HEAD(, V9fsPDU) active_list;
> > -    V9fsFidState *fid_list;
> > +    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
> 
> Not an issue for this series, but I wonder whether that macro's first argument 
> shouldn't simply be dropped in queue.h, because there are only 2 occurences in 
> the entire QEMU code base using it. It looks like nobody really needs it.
> 

A similar macro exist for the other list types as well, with some more
users. If we go for such a change, I think this should stay consistent
accros list types. All users should hence be audited first.

> >      FileOperations *ops;
> >      FsContext ctx;
> >      char *tag;
> 
> Best regards,
> Christian Schoenebeck
> 
> 


