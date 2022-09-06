Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FE5AEEBB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:28:20 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVaUt-0003ff-Nu
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oVaQV-0007ZJ-6e
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:23:47 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:48739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oVaQS-0005J0-7z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:23:46 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-5Aq_gheiPIKcTwEZxs6hFw-1; Tue, 06 Sep 2022 11:23:32 -0400
X-MC-Unique: 5Aq_gheiPIKcTwEZxs6hFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4486101E167;
 Tue,  6 Sep 2022 15:23:31 +0000 (UTC)
Received: from bahia (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD869C15BB3;
 Tue,  6 Sep 2022 15:23:30 +0000 (UTC)
Date: Tue, 6 Sep 2022 17:23:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Linus Heckemann <git@sphalerite.org>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH] 9pfs: use GHashTable for fid table
Message-ID: <20220906172328.009be444@bahia>
In-Reply-To: <20220905150300.3794196-1-git@sphalerite.org>
References: <20220903150327.2780127-1-git@sphalerite.org>
 <20220905150300.3794196-1-git@sphalerite.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Linus,

Some more comments below.

On Mon,  5 Sep 2022 17:03:00 +0200
Linus Heckemann <git@sphalerite.org> wrote:

> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for every open,
> stat, read, write, etc operation.
> 
> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.
> 
> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> ---
>  hw/9pfs/9p.c | 130 +++++++++++++++++++++++++++------------------------
>  hw/9pfs/9p.h |   2 +-
>  2 files changed, 69 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..fb4b7fe852 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -282,33 +282,31 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU *pdu, int32_t fid)
>      V9fsFidState *f;
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
> @@ -317,12 +315,9 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
>  {
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
>      }
>      f = g_new0(V9fsFidState, 1);
>      f->fid = fid;
> @@ -333,7 +328,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
>       * reclaim won't close the file descriptor
>       */
>      f->flags |= FID_REFERENCED;
> -    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> +    g_hash_table_insert(s->fids, GINT_TO_POINTER(fid), f);
>  
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -424,12 +419,10 @@ static V9fsFidState *clunk_fid(V9fsState *s, int32_t fid)
>  {
>      V9fsFidState *fidp;
>  
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->fid == fid) {
> -            QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> -            fidp->clunked = true;
> -            return fidp;
> -        }
> +    if (g_hash_table_steal_extended(s->fids, GINT_TO_POINTER(fid),
> +                                    NULL, (gpointer *) &fidp)) {
> +        fidp->clunked = true;
> +        return fidp;
>      }
>      return NULL;
>  }
> @@ -439,10 +432,15 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>      int reclaim_count = 0;
>      V9fsState *s = pdu->s;
>      V9fsFidState *f;
> +    GHashTableIter iter;
> +    gpointer fid;
> +
> +    g_hash_table_iter_init(&iter, s->fids);
> +
>      QSLIST_HEAD(, V9fsFidState) reclaim_list =
>          QSLIST_HEAD_INITIALIZER(reclaim_list);
>  
> -    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &f)) {
>          /*
>           * Unlink fids cannot be reclaimed. Check
>           * for them and skip them. Also skip fids
> @@ -518,12 +516,11 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>  {
>      int err;
>      V9fsState *s = pdu->s;
> -    V9fsFidState *fidp, *fidp_next;
> +    V9fsFidState *fidp;
> +    gpointer fid;
> +    GHashTableIter iter;
>  
> -    fidp = QSIMPLEQ_FIRST(&s->fid_list);
> -    if (!fidp) {
> -        return 0;
> -    }
> +    g_hash_table_iter_init(&iter, s->fids);
>  

Using this external iterator API instead of the embedded QSIMPLEQ entry
definitely simplifies logic. Thanks !

>      /*
>       * v9fs_reopen_fid() can yield : a reference on the fid must be held
> @@ -534,7 +531,13 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>       * iteration after we could get a reference on the next fid. Start with
>       * the first one.
>       */

The comment above should be adapted to the new situation : no need
to do anything special with the next fid since we're not getting
a pointer to it before calling the "We're done with this fid" put_fid()
on the current fid.

> -    for (fidp->ref++; fidp; fidp = fidp_next) {
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
> +        /*
> +         * Ensure the fid survives a potential clunk request during
> +         * put_fid() below and v9fs_reopen_fid() in the next iteration.

With the new logic, this should just be:

Ensure the fid survives a potential clunk request during v9fs_reopen_fid().

> +         */
> +        fidp->ref++;
> +
>          if (fidp->path.size == path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
>              /* Mark the fid non reclaimable. */
> @@ -548,16 +551,6 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>              }
>          }
>  
> -        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> -
> -        if (fidp_next) {
> -            /*
> -             * Ensure the next fid survives a potential clunk request during
> -             * put_fid() below and v9fs_reopen_fid() in the next iteration.
> -             */
> -            fidp_next->ref++;
> -        }
> -
>          /* We're done with this fid */
>          put_fid(pdu, fidp);
>      }
> @@ -569,19 +562,21 @@ static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
>  {
>      V9fsState *s = pdu->s;
>      V9fsFidState *fidp;
> +    gpointer fid;
> +    GHashTableIter iter;
> +
> +    g_hash_table_iter_init(&iter, s->fids);
>  
>      /* Free all fids */
> -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> -        /* Get fid */
> -        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
>          fidp->ref++;
>  
>          /* Clunk fid */
> -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);

You could just call g_hash_table_iter_remove(&iter) here (it is
safe according to the glib documentation [1]) and...

>          fidp->clunked = true;
>  
>          put_fid(pdu, fidp);
>      }
> +    g_hash_table_remove_all(s->fids);

... avoid the extra loop, but no big deal.

Rest looks ok. Please re-post and add:

Reviewed-by: Greg Kurz <groug@kaod.org>

Don't forget to put a v3 in the subject and provide the list of changes
since v2 below the '---' terminator of the commit message (see [2] for
an example). You might want to try out 'git publish' [3], a marvelous
tool that helps a lot with the tedious process of posting versionned
patch series.

Cheers,

--
Greg

[1] https://developer-old.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-iter-remove
[2] https://patchwork.ozlabs.org/project/qemu-devel/patch/20210121181510.1459390-1-groug@kaod.org/
[3] https://github.com/stefanha/git-publish

>  }
>  
>  #define P9_QID_TYPE_DIR         0x80
> @@ -3205,6 +3200,8 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
>      V9fsFidState *tfidp;
>      V9fsState *s = pdu->s;
>      V9fsFidState *dirfidp = NULL;
> +    GHashTableIter iter;
> +    gpointer fid;
>  
>      v9fs_path_init(&new_path);
>      if (newdirfid != -1) {
> @@ -3238,11 +3235,13 @@ static int coroutine_fn v9fs_complete_rename(V9fsPDU *pdu, V9fsFidState *fidp,
>      if (err < 0) {
>          goto out;
>      }
> +
>      /*
>       * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&fidp->path, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &new_path, strlen(fidp->path.data));
> @@ -3320,6 +3319,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
>      V9fsPath oldpath, newpath;
>      V9fsState *s = pdu->s;
>      int err;
> +    GHashTableIter iter;
> +    gpointer fid;
>  
>      v9fs_path_init(&oldpath);
>      v9fs_path_init(&newpath);
> @@ -3336,7 +3337,8 @@ static int coroutine_fn v9fs_fix_fid_paths(V9fsPDU *pdu, V9fsPath *olddir,
>       * Fixup fid's pointing to the old name to
>       * start pointing to the new name
>       */
> -    QSIMPLEQ_FOREACH(tfidp, &s->fid_list, next) {
> +    g_hash_table_iter_init(&iter, s->fids);
> +    while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &tfidp)) {
>          if (v9fs_path_is_ancestor(&oldpath, &tfidp->path)) {
>              /* replace the name */
>              v9fs_fix_path(&tfidp->path, &newpath, strlen(oldpath.data));
> @@ -4226,7 +4228,7 @@ int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
>      s->ctx.fmode = fse->fmode;
>      s->ctx.dmode = fse->dmode;
>  
> -    QSIMPLEQ_INIT(&s->fid_list);
> +    s->fids = g_hash_table_new(NULL, NULL);
>      qemu_co_rwlock_init(&s->rename_lock);
>  
>      if (s->ops->init(&s->ctx, errp) < 0) {
> @@ -4286,6 +4288,10 @@ void v9fs_device_unrealize_common(V9fsState *s)
>      if (s->ctx.fst) {
>          fsdev_throttle_cleanup(s->ctx.fst);
>      }
> +    if (s->fids) {
> +        g_hash_table_destroy(s->fids);
> +        s->fids = NULL;
> +    }
>      g_free(s->tag);
>      qp_table_destroy(&s->qpd_table);
>      qp_table_destroy(&s->qpp_table);
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


