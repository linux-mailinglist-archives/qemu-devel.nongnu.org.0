Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190AB5EACD8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:44:12 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrDG-0006Yf-Gs
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocqZD-0006RH-Af; Mon, 26 Sep 2022 12:02:51 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocqZA-0002Qr-7p; Mon, 26 Sep 2022 12:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=a2ix3zgAA5289PtHBD159C0Rn3pT02AIGJF4fu1dUGg=; b=BD32m7AfrNcXSGw6VGAlhYHgGv
 uixnUqt+TSr2OmlCtA1KHC8Yuh+Vdh6Qc2TcaqIK3R3X1d82g9PoQHiZxnUs19WtY9VQNK1QtHZoI
 XstIqcjvPotvwSBUWWfUXA8ORBjHUGzETDj3DM//+NvJhNaZqSoyYfjK5inUSHDxWw9ZG+TiDU7k8
 7hWV8Rh19acw0u1doMNakFqfGi8u0lG7H5Ecn9zPhLXYG2OLoY1Zm+j66YbHUJmsQTCEdE2lnJC7w
 Yt/zWxzLXJwnCHyJlNDkIrwuhQKCpEVQ+PdqpWA7Y7253uGl4gsdR/5Tm2KGqy9aDSYn7C749ri67
 tyzO1Zj8KPMr+xoMV4IqCxMGzpoauad6yHU2/Sw2y6GPgyO8DNLFI9F8nORwQ8SwQGJ6GRnrwztOo
 KALMYN/HhKaK7GrEVJogp7IXu2cyRo05Nhi50xBcZt5xTl8jttO6pKdY5YMkUfK/zUq7WsY+oEMFI
 fmdY1jSA1S5xRn6sfrCojwdHhF9NI8+ZasNntrBYamdJG652JruXq6auO5jfrm+uwwBgoCpp/K3zV
 TOFCCz/hrNytOOF7yKqw/sH2nqSXCEALbrVbQcbXty0i4PV9GOLfIAB3F33pPLRyCgIEmi4tivUby
 d29xOp04QsOCaBjbiW+5FtFLb3hNLUdmoBBuOAblA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH 1/1] 9pfs: avoid iterator invalidation in
 v9fs_mark_fids_unreclaim
Date: Mon, 26 Sep 2022 18:02:30 +0200
Message-ID: <1697950.a32zQFXn7i@silver>
In-Reply-To: <20220926124207.1325763-1-git@sphalerite.org>
References: <20220926124207.1325763-1-git@sphalerite.org>
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

On Montag, 26. September 2022 14:42:06 CEST Linus Heckemann wrote:
> Previously, the yielding in v9fs_reopen_fid and put_fid could result
> in other parts of the code modifying the fid table. This would
> invalidate the hash table iterator, causing misbehaviour.
> 
> Now we ensure that we complete the iteration before yielding, so that
> the iterator remains valid throughout the loop, and only reopen the
> fids afterwards.
> ---

Ah, you sent this fix as a separate patch on top. I actually just meant that 
you would take my already queued patch as the latest version (just because I 
had made some minor changes on my end) and adjust that patch further as v4.

Anyway, there are still some things to do here, so maybe you can send your 
patch squashed in the next round ...

> @Christian: I still haven't been able to reproduce the issue that this
> commit is supposed to fix (I tried building KDE too, no problems), so
> it's a bit of a shot in the dark. It certainly still runs and I think it
> should fix the issue, but it would be great if you could test it.

No worries about reproduction, I will definitely test this thoroughly. ;-)

>  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index f4c1e37202..825c39e122 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -522,33 +522,47 @@ static int coroutine_fn
> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) V9fsFidState *fidp;
>      gpointer fid;
>      GHashTableIter iter;
> +    /*
> +     * The most common case is probably that we have exactly one
> +     * fid for the given path, so preallocate exactly one.
> +     */
> +    GArray *to_reopen = g_array_sized_new(FALSE, FALSE,
> sizeof(V9fsFidState*), 1); +    gint i;

Please use `g_autoptr(GArray)` instead of `GArray *`, that avoids the need for 
explicit calls to g_array_free() below.

> 
>      g_hash_table_iter_init(&iter, s->fids);
> 
> +    /*
> +     * We iterate over the fid table looking for the entries we need
> +     * to reopen, and store them in to_reopen. This is because
> +     * reopening them happens asynchronously, allowing the fid table
> +     * to be modified in the meantime, invalidating our iterator.
> +     */
>      while (g_hash_table_iter_next(&iter, &fid, (gpointer *) &fidp)) {
> -        /*
> -         * Ensure the fid survives a potential clunk request during
> -         * v9fs_reopen_fid.
> -         */
> -        fidp->ref++;
> -
>          if (fidp->path.size == path->size &&
>              !memcmp(fidp->path.data, path->data, path->size)) {
> -            /* Mark the fid non reclaimable. */
> -            fidp->flags |= FID_NON_RECLAIMABLE;

Why did you remove that? It should still be marked as FID_NON_RECLAIMABLE, no?

> -
> -            /* reopen the file/dir if already closed */
> -            err = v9fs_reopen_fid(pdu, fidp);
> -            if (err < 0) {
> -                put_fid(pdu, fidp);
> -                return err;
> -            }
> +            /*
> +             * Ensure the fid survives a potential clunk request during
> +             * v9fs_reopen_fid or put_fid.
> +             */
> +            fidp->ref++;

Hmm, bumping the refcount here makes sense, as the 2nd loop may be interrupted 
and the fid otherwise disappear in between, but ...

> +            g_array_append_val(to_reopen, fidp);
>          }
> +    }
> 
> -        /* We're done with this fid */
> +    for (i=0; i < to_reopen->len; i++) {
> +        fidp = g_array_index(to_reopen, V9fsFidState*, i);
> +        /* reopen the file/dir if already closed */
> +        err = v9fs_reopen_fid(pdu, fidp);
> +        if (err < 0) {
> +            put_fid(pdu, fidp);
> +            g_array_free(to_reopen, TRUE);
> +            return err;

... this return would then leak all remainder fids that you have bumped the 
refcount for above already.

> +        }
>          put_fid(pdu, fidp);
>      }
> 
> +    g_array_free(to_reopen, TRUE);
> +

With `g_autoptr(GArray)` you can drop both g_array_free() calls.

>      return 0;
>  }

Also: I noticed that your changes in virtfs_reset() would need the same 2-loop 
hack to avoid hash iterator invalidation, as it would also call put_fid() 
inside the loop and be prone for hash iterator invalidation otherwise.

Best regards,
Christian Schoenebeck



