Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65312FB663
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:34:39 +0100 (CET)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1r9a-0007wn-O1
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1r7n-0006fA-W8
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:32:51 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1r7l-00029x-M0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=0Wm70B1hwNmI/KdaRpI5iQ6gXd1z0v9Ds+j2aJBty3k=; b=lDRAuyQk0a0Q9aK2ppDJ/LenWX
 /p0r4VUBV6zGP+LW7zqpaqzAcBKmnz0az5K7yI5uHO6bjHDwpCcg6bBtNFd4Oq2sUtWxob3lP75mL
 5q/WkoFKF9Ecz8ovdATc+3WLmqv5MgtTBOmkUcZR9OUwpuQ8RenVNexXRXeIDGSI40/46SQq/hG37
 vq8Y6sRG/kp09MIrqF9IT16SvHzDEfukJjLib7nGFZMgB9kRGkBn7KF+NZkIbDsTCIqVbaS0x+SOw
 Nugim12AXfMyfDws8XoUD3aJpm05mh9cozOa6e3jod6eXdpJPW2N5XuTanzE1Z+0jsw10kYdIcZtl
 EsXtk1u5NnzfeNQihr1CNwwECeX3JyZBDu2/FSNoBKubBaP3iZ5IC/sinUr3e2/L7Hjd27DfM1aFG
 xLaZaFgwjQke9xTj9z07X13MS7yS1dsBijLhm/AfwGSREZjsOupLJRDrGI8CVFh8TJ2LWs2n11tZZ
 MoYstjbUJ+81QOFzTzhpbcVYkNPzaEZfrzjoLxxBV3TMRfVV+ahPD+i303o0IrIybap4t3HWXa/yf
 I9ja2g56Gxyqv+RDhHufl70A/z3zGzT66UtAKeAJk1ksURWPTkWQI3PVnx/NGZAtHFhJE1+7c/oOA
 fcrkzO0Ac+Kbyy+LfsNaoix1UeeupKmy99pCDvqGU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] 9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ
Date: Tue, 19 Jan 2021 14:31:26 +0100
Message-ID: <1901754.QplClEOiAT@silver>
In-Reply-To: <20210118142300.801516-3-groug@kaod.org>
References: <20210118142300.801516-1-groug@kaod.org>
 <20210118142300.801516-3-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 18. Januar 2021 15:22:59 CET Greg Kurz wrote:
> The fid_list is currently open-coded. This doesn't seem to serve any
> purpose that cannot be met with QEMU's generic lists. Let's go for a
> QSIMPLEQ : this will allow to add new fids at the end of the list and
> to improve the logic in v9fs_mark_fids_unreclaim().
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

In general LGTM hence:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Some comments below ...

> ---
>  hw/9pfs/9p.c | 41 ++++++++++++++++++-----------------------
>  hw/9pfs/9p.h |  4 ++--
>  2 files changed, 20 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 37c3379b7462..b65f320e6518 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -260,7 +260,7 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu,
> int32_t fid) V9fsFidState *f;
>      V9fsState *s = pdu->s;
> 
> -    for (f = s->fid_list; f; f = f->next) {
> +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
>          BUG_ON(f->clunked);
>          if (f->fid == fid) {
>              /*
> @@ -295,7 +295,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *f;
> 
> -    for (f = s->fid_list; f; f = f->next) {
> +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
>          /* If fid is already there return NULL */
>          BUG_ON(f->clunked);
>          if (f->fid == fid) {
> @@ -311,8 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) * reclaim won't close the file descriptor
>       */
>      f->flags |= FID_REFERENCED;
> -    f->next = s->fid_list;
> -    s->fid_list = f;
> +    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);

Not related to this series, but I wonder why queue.h wraps everything into:

do {
	...
} while (0);

No comment about it in git history. Looks like a leftover of its initial 
import from 2009.

>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -401,20 +400,16 @@ static int coroutine_fn put_fid(V9fsPDU *pdu,
> V9fsFidState *fidp)
> 
>  static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
>  {
> -    V9fsFidState **fidpp, *fidp;
> +    V9fsFidState *fidp;
> 
> -    for (fidpp = &s->fid_list; *fidpp; fidpp = &(*fidpp)->next) {
> -        if ((*fidpp)->fid == fid) {
> -            break;
> +    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> +        if (fidp->fid == fid) {
> +            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> +            fidp->clunked = true;
> +            return fidp;
>          }
>      }
> -    if (*fidpp == NULL) {
> -        return NULL;
> -    }
> -    fidp = *fidpp;
> -    *fidpp = fidp->next;
> -    fidp->clunked = true;
> -    return fidp;
> +    return NULL;
>  }

Good cleanup there!

>  void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
> @@ -423,7 +418,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>      V9fsState *s = pdu->s;
>      V9fsFidState *f, *reclaim_list = NULL;
> 
> -    for (f = s->fid_list; f; f = f->next) {
> +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
>          /*
>           * Unlink fids cannot be reclaimed. Check
>           * for them and skip them. Also skip fids
> @@ -505,7 +500,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU
> *pdu, V9fsPath *path) V9fsFidState *fidp;
> 
>  again:
> -    for (fidp = s->fid_list; fidp; fidp = fidp->next) {
> +    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
>          if (fidp->path.size != path->size) {
>              continue;
>          }
> @@ -537,13 +532,13 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>      V9fsFidState *fidp;
> 
>      /* Free all fids */
> -    while (s->fid_list) {
> +    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
>          /* Get fid */
> -        fidp = s->fid_list;
> +        fidp = QSIMPLEQ_FIRST(&s->fid_list);
>          fidp->ref++;
> 
>          /* Clunk fid */
> -        s->fid_list = fidp->next;
> +        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
>          fidp->clunked = true;
> 
>          put_fid(pdu, fidp);
> @@ -3121,7 +3116,7 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    for (tfidp = s->fid_list; tfidp; tfidp = tfidp->next) {
> +    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
>          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &new_path,
> strlen(fidp->path.data)); @@ -3215,7 +3210,7 @@ static int coroutine_fn
> v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, * Fixup fid's pointing
> to the old name to
>       * start pointing to the new name
>       */
> -    for (tfidp = s->fid_list; tfidp; tfidp = tfidp->next) {
> +    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4081,7 +4076,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> V9fsTransport *t, s->ctx.fmode = fse->fmode;
>      s->ctx.dmode = fse->dmode;
> 
> -    s->fid_list = NULL;
> +    QSIMPLEQ_INIT(&s->fid_list);
>      qemu_co_rwlock_init(&s->rename_lock);
> 
>      if (s->ops->init(&s->ctx, errp) < 0) {
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 93656323d1d7..85fb6930b0ca 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -280,7 +280,7 @@ struct V9fsFidState {
>      uid_t uid;
>      int ref;
>      bool clunked;
> -    V9fsFidState *next;
> +    QSIMPLEQ_ENTRY(V9fsFidState) next;
>      V9fsFidState *rclm_lst;
>  };

Is there a reason for not migrating 'rclm_lst' as well?

Anyway, if you decide to do that as well, then it would IMO be fine with a 
separate patch later on, not worth making it more complicated with a v2 just 
for that.

> @@ -339,7 +339,7 @@ typedef struct {
>  struct V9fsState {
>      QLIST_HEAD(, V9fsPDU) free_list;
>      QLIST_HEAD(, V9fsPDU) active_list;
> -    V9fsFidState *fid_list;
> +    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;

Not an issue for this series, but I wonder whether that macro's first argument 
shouldn't simply be dropped in queue.h, because there are only 2 occurences in 
the entire QEMU code base using it. It looks like nobody really needs it.

>      FileOperations *ops;
>      FsContext ctx;
>      char *tag;

Best regards,
Christian Schoenebeck



