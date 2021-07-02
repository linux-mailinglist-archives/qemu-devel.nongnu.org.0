Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3A3BA281
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:06:50 +0200 (CEST)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKkj-0002TK-MZ
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lzKjb-00016q-6v
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:05:39 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lzKjY-0006Kw-Qc
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4OgiP2Wh+1vt3WNZHD4g14Pd2NaVW/t8CznpXJjeleo=; b=Rx6dYS6POvf+X3BvXAg6r+sprd
 Tzo5/LEF9i7CId1jWWNX72jKrQWKHHow0t80MKJ44lR4zXMCPeA1eheOl1Uyj2Kj/vL71m5l2qHSD
 01tWxQFKNVNM/nKPJ2GyS0P6XpxrLOecp6iNKoY3gJe3TY1SP8Z8nPB9udpVxL7lhJSRGFV6rznit
 F2gAvtM2O5bjjRBvkgyjpEA48VpkZzsxZxe1/R6sGyZLyhm1EDFZDYkb8zv3dSpqmx/fpqH6Izf7J
 4DZd8uXbDMA5HzygfA3sEkRM1vu4MXh3AiWbiH1xTN3ddfDmgSumBqX5S3X3JkfFt/fSQdMzvttqD
 8MJCm4C7y328/Vn3r/FXprxHNPweM4/B+y9dCqAxq/snupwq6SuE6owlHREFYd+45xHs+lpm50CvN
 9+fgLa+HkxN3rUhxGVS8b6vhSqfWPYGWTWNVKVWcNV040ZURNJISrVO0j7o/VzjR6Z93WpqA5gISm
 bRI/00QSqc+4bvtkJxbzra4ruf2gpS92va7EY9hY9QAL3hv+7lwMuIbbbYOVekc1dcFwWIJqrV/ed
 VeyM/bs5amTGu5o80VInjQ/PIK2rhOptdz1jHg5qlpQ/e9Sfg3XSp+EBvfD2rr+NkEEuKrzWC9f7Z
 GxCGIFK5LrjzKX0EFcLRT6yl/ugQWPgsypgcDWIwI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 7/7] 9pfs: reduce latency of Twalk
Date: Fri, 02 Jul 2021 17:05:32 +0200
Message-ID: <16093217.on2isagWAK@silver>
In-Reply-To: <20210702163656.2b6a8975@bahia.lan>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
 <1a6701674afc4f08d40396e3aa2631e18a4dbb33.1622821729.git.qemu_oss@crudebyte.com>
 <20210702163656.2b6a8975@bahia.lan>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 2. Juli 2021 16:36:56 CEST Greg Kurz wrote:
> On Fri, 4 Jun 2021 17:38:31 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > As with previous performance optimization on Treaddir handling;
> > reduce the overall latency, i.e. overall time spent on processing
> > a Twalk request by reducing the amount of thread hops between the
> > 9p server's main thread and fs worker thread(s).
> > 
> > In fact this patch even reduces the thread hops for Twalk handling
> > to its theoritical minimum of exactly 2 thread hops:
> > 
> > main thread -> fs worker thread -> main thread
> > 
> > This is achieved by doing all the required fs driver tasks altogether
> > in a single v9fs_co_run_in_worker({ ... }); code block.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 89 +++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 70 insertions(+), 19 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 7be07f2d68..2815257f42 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1705,9 +1705,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >      int name_idx;
> >      V9fsQID *qids = NULL;
> >      int i, err = 0;
> > 
> > -    V9fsPath dpath, path;
> > +    V9fsPath dpath, path, *pathes = NULL;
> > 
> >      uint16_t nwnames;
> > 
> > -    struct stat stbuf;
> > +    struct stat stbuf, fidst, *stbufs = NULL;
> > 
> >      size_t offset = 7;
> >      int32_t fid, newfid;
> >      V9fsString *wnames = NULL;
> > 
> > @@ -1733,6 +1733,8 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >      if (nwnames) {
> >      
> >          wnames = g_new0(V9fsString, nwnames);
> >          qids   = g_new0(V9fsQID, nwnames);
> > 
> > +        stbufs = g_new0(struct stat, nwnames);
> > +        pathes = g_new0(V9fsPath, nwnames);
> > 
> >          for (i = 0; i < nwnames; i++) {
> >          
> >              err = pdu_unmarshal(pdu, offset, "s", &wnames[i]);
> >              if (err < 0) {
> > 
> > @@ -1753,39 +1755,85 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >      v9fs_path_init(&dpath);
> >      v9fs_path_init(&path);
> > 
> > +    /*
> > +     * Both dpath and path initially point to fidp.
> > +     * Needed to handle request with nwnames == 0
> > +     */
> > +    v9fs_path_copy(&dpath, &fidp->path);
> > +    v9fs_path_copy(&path, &fidp->path);
> > 
> > -    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
> > +    /*
> > +     * To keep latency (i.e. overall execution time for processing this
> > +     * Twalk client request) as small as possible, run all the required
> > fs
> > +     * driver code altogether inside the following block.
> > +     */
> > +    v9fs_co_run_in_worker({
> > +        if (v9fs_request_cancelled(pdu)) {
> > +            err = -EINTR;
> > +            break;
> > +        }
> > +        err = s->ops->lstat(&s->ctx, &dpath, &fidst);
> > +        if (err < 0) {
> > +            err = -errno;
> > +            break;
> > +        }
> > +        stbuf = fidst;
> > +        for (name_idx = 0; name_idx < nwnames; name_idx++) {
> > +            if (v9fs_request_cancelled(pdu)) {
> > +                err = -EINTR;
> > +                break;
> > +            }
> > +            if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > +                strcmp("..", wnames[name_idx].data))
> > +            {
> > +                err = s->ops->name_to_path(&s->ctx, &dpath,
> > +                                        wnames[name_idx].data, &path);
> 
> It seems you could pass &pathes[name_idx] instead of &path and...
> 
> > +                if (err < 0) {
> > +                    err = -errno;
> > +                    break;
> > +                }
> > +                if (v9fs_request_cancelled(pdu)) {
> > +                    err = -EINTR;
> > +                    break;
> > +                }
> > +                err = s->ops->lstat(&s->ctx, &path, &stbuf);
> > +                if (err < 0) {
> > +                    err = -errno;
> > +                    break;
> > +                }
> > +                stbufs[name_idx] = stbuf;
> > +                v9fs_path_copy(&dpath, &path);
> > +                v9fs_path_copy(&pathes[name_idx], &path);
> 
> ... avoid a copy.

It's been a while since I did this, but looks like you are right.

> Also, I believe the path -> dpath could be avoided as well in
> the existing code, but this is a separate cleanup.
> 
> > +            }
> > +        }
> > +    });
> > +    /*
> > +     * Handle all the rest of this Twalk request on main thread ...
> > +     */
> > 
> >      if (err < 0) {
> >      
> >          goto out;
> >      
> >      }
> > 
> > -    err = stat_to_qid(pdu, &stbuf, &qid);
> > +
> > +    err = stat_to_qid(pdu, &fidst, &qid);
> > 
> >      if (err < 0) {
> >      
> >          goto out;
> >      
> >      }
> > 
> > +    stbuf = fidst;
> > 
> > -    /*
> > -     * Both dpath and path initially poin to fidp.
> > -     * Needed to handle request with nwnames == 0
> > -     */
> > +    /* reset dpath and path */
> > 
> >      v9fs_path_copy(&dpath, &fidp->path);
> >      v9fs_path_copy(&path, &fidp->path);
> > 
> > +
> > 
> >      for (name_idx = 0; name_idx < nwnames; name_idx++) {
> >      
> >          if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
> > 
> > -            strcmp("..", wnames[name_idx].data)) {
> > -            err = v9fs_co_name_to_path(pdu, &dpath,
> > wnames[name_idx].data,
> > -                                       &path);
> > -            if (err < 0) {
> > -                goto out;
> > -            }
> > -
> > -            err = v9fs_co_lstat(pdu, &path, &stbuf);
> > -            if (err < 0) {
> > -                goto out;
> > -            }
> > +            strcmp("..", wnames[name_idx].data))
> > +        {
> > +            stbuf = stbufs[name_idx];
> > 
> >              err = stat_to_qid(pdu, &stbuf, &qid);
> >              if (err < 0) {
> >              
> >                  goto out;
> >              
> >              }
> > 
> > +            v9fs_path_copy(&path, &pathes[name_idx]);
> > 
> >              v9fs_path_copy(&dpath, &path);
> >          
> >          }
> >          memcpy(&qids[name_idx], &qid, sizeof(qid));
> > 
> > @@ -1821,9 +1869,12 @@ out_nofid:
> >      if (nwnames && nwnames <= P9_MAXWELEM) {
> >      
> >          for (name_idx = 0; name_idx < nwnames; name_idx++) {
> >          
> >              v9fs_string_free(&wnames[name_idx]);
> > 
> > +            v9fs_path_free(&pathes[name_idx]);
> > 
> >          }
> >          g_free(wnames);
> >          g_free(qids);
> > 
> > +        g_free(stbufs);
> > +        g_free(pathes);
> 
> All of these guys should be converted to g_autofree. Separate cleanup
> again.

Definitely agreed on that.

> v9fs_walk() was already a bit hairy and the diffstat definitely
> doesn't improve things... this being said, the change makes sense
> and I haven't spotted anything wrong, so:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Improvements could be to :
> - track the previous path with a V9fsPath * instead of copying
> - have a separate path for the nwnames == 0 case
> 
> >      }
> >  
> >  }

Yeah, there is a lot more to do on v9fs_walk(), both cleanup, as well as the 
previously (couple weeks ago) mentioned protocol fix (i.e. Twalk should only 
reply Rerror if there is an error on the very first path element).

If you don't mind, I queue this patch as is for now and prepare a PR for the 
current 9p patches in my queue in order to bring them into the soft freeze 
deadline.

Thanks for looking at this Greg, I appreciate it!

Best regards,
Christian Schoenebeck



