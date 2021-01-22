Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBD3003DA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:11:30 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wDo-0001nU-3v
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l2wCG-0001MY-KO
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:09:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:53783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l2wCE-0004Qk-K1
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=chcVLrU1zFYBwfEZZAzcbL9hI6q23TqDAbYW31uoL3o=; b=fgUv97jgV6GJXPTb48F/9/Gj9V
 gbeIH+bPvzGFnbb6hJyv9T+jFPUwB1JLam7UGrsOOwVP34Jo36uSeJFGeHvpVxZAyz4ItmEA5xirB
 MWQ8bpGRVSRYrtpB99S2sm4jRyNr1UBiOQmi8O3FQAo40KRWDbiPYOevOr8IxGGGK3US6PdwUJsLj
 BLNJE+MJnkVG5eON0Q054UREinCVIL7zCL4SLoH0+DNJMJ7HmBDY7jNb4qP3tLXiX+Wmlwmt2clpl
 +QcZWT841Cq+FkLSdMUqU8qsjLepiEtmSGy6/WZnMkf7r7N49pi9Em7Xp4sWOQtLXWwa4KqMdQwKQ
 QTl+OHkQBzHPazBqqWSfwRUew51puGozwoSRC/MEbDBJMY4J6H8NxJO9QOr9tLTY5pM8nM6Qd3a9p
 BtaQje9UaUUO3kcReYVnK0p+vi68lr7Un+t6qU7wBbTvdagAXLhSlD0fwxucv0I9RXzJx8rUzo3J0
 e9igr59stVpvvN1R252OsFOPQ0xV4PFFlfNobvGdWJIpqbRic8rss0QKIY/IiPhOyxmjiGL6BHX8R
 qdtW1VHlMuS7BENEuLJBtMLgSLTQ/2zuDXJ3wIT3bTBhna8hs0OHMHnRqI1YLn5wt7pV+9fn309js
 gmg2jTM/W4EIeIee+mevEJwV4zgSW9dV8RSHCqdyg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] 9pfs: Improve unreclaim loop
Date: Fri, 22 Jan 2021 14:09:12 +0100
Message-ID: <1671508.b1m4HzQG7Z@silver>
In-Reply-To: <20210121181510.1459390-1-groug@kaod.org>
References: <20210121181510.1459390-1-groug@kaod.org>
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

On Donnerstag, 21. Januar 2021 19:15:10 CET Greg Kurz wrote:
> If a fid was actually re-opened by v9fs_reopen_fid(), we re-traverse the
> fid list from the head in case some other request created a fid that
> needs to be marked unreclaimable as well (ie. the client opened a new

That's "i.e.". Not a big deal so ...

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> handle on the path that is being unlinked). This is suboptimal since
> most if not all fids that require it have likely been taken care of
> already.
> 
> This is mostly the result of new fids being added to the head of the
> list. Since the list is now a QSIMPLEQ, add new fids at the end instead
> to avoid the need to rewind. Take a reference on the fid to ensure it
> doesn't go away during v9fs_reopen_fid() and that it can be safely
> passed to QSIMPLEQ_NEXT() afterwards. Since the associated put_fid()
> can also yield, same is done with the next fid. So the logic here is
> to get a reference on a fid and only put it back during the next
> iteration after we could get a reference on the next fid.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - fix typos in changelog
>     - drop bogus assert()
> ---
>  hw/9pfs/9p.c | 46 ++++++++++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index b65f320e6518..3864d014b43c 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -311,7 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) * reclaim won't close the file descriptor
>       */
>      f->flags |= FID_REFERENCED;
> -    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
> +    QSIMPLEQ_INSERT_TAIL(&s->fid_list, f, next);
> 
>      v9fs_readdir_init(s->proto_version, &f->fs.dir);
>      v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
> @@ -497,32 +497,50 @@ static int coroutine_fn
> v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path) {
>      int err;
>      V9fsState *s = pdu->s;
> -    V9fsFidState *fidp;
> +    V9fsFidState *fidp, *fidp_next;
> 
> -again:
> -    QSIMPLEQ_FOREACH(fidp, &s->fid_list, next) {
> -        if (fidp->path.size != path->size) {
> -            continue;
> -        }
> -        if (!memcmp(fidp->path.data, path->data, path->size)) {
> +    fidp = QSIMPLEQ_FIRST(&s->fid_list);
> +    if (!fidp) {
> +        return 0;
> +    }
> +
> +    /*
> +     * v9fs_reopen_fid() can yield : a reference on the fid must be held
> +     * to ensure its pointer remains valid and we can safely pass it to
> +     * QSIMPLEQ_NEXT(). The corresponding put_fid() can also yield so
> +     * we must keep a reference on the next fid as well. So the logic here
> +     * is to get a reference on a fid and only put it back during the next
> +     * iteration after we could get a reference on the next fid. Start with
> +     * the first one.
> +     */
> +    for (fidp->ref++; fidp; fidp = fidp_next) {
> +        if (fidp->path.size == path->size &&
> +            !memcmp(fidp->path.data, path->data, path->size)) {
>              /* Mark the fid non reclaimable. */
>              fidp->flags |= FID_NON_RECLAIMABLE;
> 
>              /* reopen the file/dir if already closed */
>              err = v9fs_reopen_fid(pdu, fidp);
>              if (err < 0) {
> +                put_fid(pdu, fidp);
>                  return err;
>              }
> +        }
> +
> +        fidp_next = QSIMPLEQ_NEXT(fidp, next);
> +
> +        if (fidp_next) {
>              /*
> -             * Go back to head of fid list because
> -             * the list could have got updated when
> -             * switched to the worker thread
> +             * Ensure the next fid survives a potential clunk request
> during +             * put_fid() below and v9fs_reopen_fid() in the next
> iteration. */
> -            if (err == 0) {
> -                goto again;
> -            }
> +            fidp_next->ref++;
>          }
> +
> +        /* We're done with this fid */
> +        put_fid(pdu, fidp);
>      }
> +
>      return 0;
>  }




