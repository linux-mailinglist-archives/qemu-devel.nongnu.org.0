Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A385AC5D3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 20:08:10 +0200 (CEST)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUu2T-0002KJ-6u
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 14:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oUu1R-0000uF-FM
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 14:07:05 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oUu1P-0001Ur-0V
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 14:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=akPOUdP49DtuWB+KyOvhEQj4lrQ0czNWKAgXxEi0EaM=; b=bnCyWCZqs/IwkKGcIlvltYuLc8
 nMxJo3QEblgZKZXDL0iAmLWU+ANnUipDIa6unYkEBg248CCv+yHBizDJqO6/k0Ihz2X7sHc/ZIeoV
 NzpyluY2TZmDYWHUTEL7RTDL13CujID/kYJXzumMtiYUepap5Fqn5OrRPQhTnsDnzDs1JhQvQCvVO
 nLaiQ/VPvfcYfz6J9cz3sVCprZvcwnyu6RJCe/vyk3UDYoDbmwyPyy1qyEIOHz0Gw3EdOKbf8j9hK
 riWZ4KHNDJOoMo+PCJ+lfQ3nd0P25vlJsN/e7xLAb84gcscEiCUyNBGSJCoJs1Am18dupfdfhIKDC
 MMZwo3RR66Z4BXNQMFNbPgZbbIvhTsnXVuFMbFsCWVuhxJvZTmQzhoyiFf1e+xLMEsyvOiHXdqU31
 uE4gHVOOyxuKnKaCdM+on0PMQRFk2l/kTCOeR6ehHIeJ9iSwSv+KUtDG+K8NpfhETyLZe5w8SlCTf
 9GgbnUrpfTlLCvBqNYn4O94eiRkww1pGBVhrJEv2jgb/hZqxzhVxVoq1tgfSFj+dAP+lTIFo5HqoY
 3hRbw43uf79/LOo3xwXyIeD2bzwkm1DE+RJemrymaFyKJYeGTtrFp04m9mnjyLZWrsHQ88OpQp5PM
 NoTnN7DQGjeEkZGhUSbmCGhwa/BurQU93xFhvy9Ms=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH] 9pfs: use GHashMap for fid table
Date: Sun, 04 Sep 2022 20:06:57 +0200
Message-ID: <2843062.aF7IraYCKC@silver>
In-Reply-To: <20220903150327.2780127-1-git@sphalerite.org>
References: <20220903150327.2780127-1-git@sphalerite.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Samstag, 3. September 2022 17:03:27 CEST Linus Heckemann wrote:
> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for nearly every
> open, stat, read, write, etc operation.

Oh yes, I had this on my TODO list for a long time. Thanks for the effort 
Linus!

> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.

Wow, even more than I expected. Nice!

I have a feeling that this will also fix the massive slow downs that were seen 
after running for a long time. Because I think that slow down was because a 
large amount of fids were accumulated over time, where this O(n) issue hurts 
more noticably.

Some remarks below ...

> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> ---
>  hw/9pfs/9p.c | 130 +++++++++++++++++++++++++++------------------------
>  hw/9pfs/9p.h |   2 +-
>  2 files changed, 69 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..ff466afe39 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -282,33 +282,31 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU
> *pdu, int32_t fid) V9fsFidState *f;
>      V9fsState *s = pdu->s;
> 
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> -        BUG_ON(f->clunked);
> -        if (f->fid == fid) {
> -            /*
> -             * Update the fid ref upfront so that
> -             * we don't get reclaimed when we yield
> -             * in open later.
> -             */
> -            f->ref++;
> -            /*
> -             * check whether we need to reopen the
> -             * file. We might have closed the fd
> -             * while trying to free up some file
> -             * descriptors.
> -             */
> -            err = v9fs_reopen_fid(pdu, f);
> -            if (err < 0) {
> -                f->ref--;
> -                return NULL;
> -            }
> -            /*
> -             * Mark the fid as referenced so that the LRU
> -             * reclaim won't close the file descriptor
> -             */
> -            f->flags |= FID_REFERENCED;
> -            return f;
> +    f = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (f) {
> +        /*
> +         * Update the fid ref upfront so that
> +         * we don't get reclaimed when we yield
> +         * in open later.
> +         */
> +        f->ref++;
> +        /*
> +         * check whether we need to reopen the
> +         * file. We might have closed the fd
> +         * while trying to free up some file
> +         * descriptors.
> +         */
> +        err = v9fs_reopen_fid(pdu, f);
> +        if (err < 0) {
> +            f->ref--;
> +            return NULL;
>          }
> +        /*
> +         * Mark the fid as referenced so that the LRU
> +         * reclaim won't close the file descriptor
> +         */
> +        f->flags |= FID_REFERENCED;
> +        return f;
>      }
>      return NULL;
>  }
> @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *f;
> 
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    if (g_hash_table_contains(s->fids, GINT_TO_POINTER(fid))) {
>          /* If fid is already there return NULL */
> -        BUG_ON(f->clunked);
> -        if (f->fid == fid) {
> -            return NULL;
> -        }
> +        return NULL;

Probably retaining BUG_ON(f->clunked) here?

>      }
>      f = g_new0(V9fsFidState, 1);
>      f->fid = fid;
> @@ -333,7 +328,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) * reclaim won't close the file descriptor
>       */
>      f->flags |= FID_REFERENCED;
> -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
> 
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -424,12 +419,11 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t
> fid) {
>      V9fsFidState *fidp;
> 
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->fid == fid) {
> -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> -            fidp->clunked = true;
> -            return fidp;
> -        }
> +    fidp = g_hash_table_lookup(s->fids, GINT_TO_POINTER(fid));
> +    if (fidp) {
> +        g_hash_table_remove(s->fids, GINT_TO_POINTER(fid));
> +        fidp->clunked = true;
> +        return fidp;

We can't get rid of the double lookup here, can we? Surprisingly I don't find 
a lookup function on the iterator based API.

>      }
>      return NULL;
>  }
> @@ -439,10 +433,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>      int reclaim_count = 0;
>      V9fsState *s = pdu->s;
>      V9fsFidState *f;
> +
> +    GHashTableIter iter;
> +    gpointer fid;
> +    g_hash_table_iter_init(&iter, s->fids);
> +
>      QSLIST_HEAD(, V9fsFidState) reclaim_list =
>          QSLIST_HEAD_INITIALIZER(reclaim_list);
> 
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &f)) {
>          /*
>           * Unlink fids cannot be reclaimed. Check
>           * for them and skip them. Also skip fids
> @@ -518,12 +517,12 @@ static int coroutine_fn
> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) {
>      int err;
>      V9fsState *s = pdu->s;
> -    V9fsFidState *fidp, *fidp_next;
> +    V9fsFidState *fidp;
> +    gpointer fid;
> +
> +    GHashTableIter iter;
> +    g_hash_table_iter_init(&iter, s->fids);
> 
> -    fidp = QSIMPLEQ_FIRST(&s->fid_list);
> -    if (!fidp) {
> -        return 0;
> -    }
> 
>      /*
>       * v9fs_reopen_fid() can yield : a reference on the fid must be held
> @@ -534,7 +533,13 @@ static int coroutine_fn
> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) * iteration after we
> could get a reference on the next fid. Start with * the first one.
>       */
> -    for (fidp->ref++; fidp; fidp = fidp_next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &fidp)) {

Too bad that there's apparently no macro based g_hash_table_foreach(), that 
would have made the code a bit cleaner and shorter than using an iterator 
while loop, but OK.

Best regards,
Christian Schoenebeck

> +        /*
> +         * Ensure the fid survives a potential clunk request during
> +         * put_fid() below and v9fs_reopen_fid() in the next iteration.
> +         */
> +        fidp->ref++;
> +
>          if (fidp->path.size == path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
>              /* Mark the fid non reclaimable. */
> @@ -548,16 +553,6 @@ static int coroutine_fn
> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) }
>          }
> 
> -        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> -
> -        if (fidp_next) {
> -            /*
> -             * Ensure the next fid survives a potential clunk request
> during -             * put_fid() below and v9fs_reopen_fid() in the next
> iteration. -             */
> -            fidp_next->ref++;
> -        }
> -
>          /* We're done with this fid */
>          put_fid(pdu, fidp);
>      }
> @@ -570,18 +565,20 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>      V9fsState *s = pdu->s;
>      V9fsFidState *fidp;
> 
> +    gpointer fid;
> +    GHashTableIter iter;
> +    g_hash_table_iter_init(&iter, s->fids);
> +
>      /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &fidp)) {
>          fidp->ref++;
> 
>          /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
>          fidp->clunked = true;
> 
>          put_fid(pdu, fidp);
>      }
> +    g_hash_table_remove_all(s->fids);
>  }
> 
>  #define P9_QID_TYPE_DIR         0x80
> @@ -3206,6 +3203,9 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, V9fsState *s = pdu->s;
>      V9fsFidState *dirfidp = NULL;
> 
> +    GHashTableIter iter;
> +    gpointer fid;
> +
>      v9fs_path_init(&new_path);
>      if (newdirfid != -1) {
>          dirfidp = get_fid(pdu, newdirfid);
> @@ -3238,11 +3238,13 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU
> *pdu, V9fsFidState *fidp, if (err < 0) {
>          goto out;
>      }
> +
>      /*
>       * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &tfidp)) {
>          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &new_path,
> strlen(fidp->path.data)); @@ -3321,6 +3323,9 @@ static int coroutine_fn
> v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir, V9fsState *s = pdu->s;
>      int err;
> 
> +    GHashTableIter iter;
> +    gpointer fid;
> +
>      v9fs_path_init(&oldpath);
>      v9fs_path_init(&newpath);
>      err = v9fs_co_name_to_path(pdu, olddir, old_name->data, &oldpath);
> @@ -3336,7 +3341,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU
> *pdu, V9fsPath *olddir, * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (void **) &tfidp)) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4232,7 @@ int v9fs_device_realize_common(V9fsState *s, const
> V9fsTransport *t, s->ctx.fmode = fse->fmode;
>      s->ctx.dmode = fse->dmode;
> 
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids = g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
> 
>      if (s->ops->init(&s->ctx, errp) < 0) {
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 994f952600..10fd2076c2 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -339,7 +339,7 @@ typedef struct {
>  struct V9fsState {
>      QLIST_HEAD(, V9fsPDU) free_list;
>      QLIST_HEAD(, V9fsPDU) active_list;
> -    QSIMPLEQ_HEAD(, V9fsFidState) fid_list;
> +    GHashTable *fids;
>      FileOperations *ops;
>      FsContext ctx;
>      char *tag;



