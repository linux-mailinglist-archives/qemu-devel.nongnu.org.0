Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528823D8D3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3cNu-0001li-Is
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k3cMN-0000SL-LB
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 05:38:51 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1k3cML-0007na-4m
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 05:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ij/+GvsB497yyQi1Pz8tUwkhXItzqNXDNnjtaFIVfqs=; b=N38p95EvnpQ6I9+x6susVQpu1X
 PRqUvpavVZSADsJ9rfsvLnBVxfHb82S3nJSHbARKLAmOi5RGaPGrQxoa8VHhqAqxttG5ObBV2TInM
 rWztJW4mujk6islM8Ufq3feLoeOy0Dx2zRBmWs7yCNh0yfnUdQVKsZr0sN98Jn5sOQm5froeDtTwY
 LV5L84RvO45Qv19HHDqzbGwMSnZNAcx12vvxHG2zBuuID4z6i4LQzLk7ltCqAAyK0n8Qwwk/iq8pb
 URAqX/h2tt4uZ9QRDviIN38/SGn7GWNi0leuGpgg+q8Bc6Ufux/inrPHeWam6pGnje1ZZhTnTaqsb
 KM61Qa8Q==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v8 4/7] 9pfs: add new function v9fs_co_readdir_many()
Date: Thu, 06 Aug 2020 11:38:43 +0200
Message-ID: <3328213.rmLSzsAABv@silver>
In-Reply-To: <3580376.WKbgaEJolQ@silver>
References: <cover.1596012787.git.qemu_oss@crudebyte.com>
 <73dc827a12ef577ae7e644dcf34a5c0e443ab42f.1596012787.git.qemu_oss@crudebyte.com>
 <3580376.WKbgaEJolQ@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 05:38:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Donnerstag, 30. Juli 2020 12:08:33 CEST Christian Schoenebeck wrote:
> > @@ -52,6 +56,167 @@ int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu,
> > V9fsFidState *fidp, return err;
> > 
> >  }
> > 
> > +/*
> > + * This is solely executed on a background IO thread.
> > + *
> > + * See v9fs_co_readdir_many() (as its only user) below for details.
> > + */
> > +static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
> > +                           struct V9fsDirEnt **entries, off_t offset,
> > +                           int32_t maxsize, bool dostat)
> > +{
> > +    V9fsState *s = pdu->s;
> > +    V9fsString name;
> > +    int len, err = 0;
> > +    int32_t size = 0;
> > +    off_t saved_dir_pos;
> > +    struct dirent *dent;
> > +    struct V9fsDirEnt *e = NULL;
> > +    V9fsPath path;
> > +    struct stat stbuf;
> > +
> > +    *entries = NULL;
> > +    v9fs_path_init(&path);
> > +
> > +    /*
> > +     * TODO: Here should be a warn_report_once() if lock failed.
> > +     *
> > +     * With a good 9p client we should not get into concurrency here,
> > +     * because a good client would not use the same fid for concurrent
> > +     * requests. We do the lock here for safety reasons though. However
> > +     * the client would then suffer performance issues, so better log
> > that
> > +     * issue here.
> > +     */
> > +    v9fs_readdir_lock(&fidp->fs.dir);
> > +
> > +    /* seek directory to requested initial position */
> > +    if (offset == 0) {
> > +        s->ops->rewinddir(&s->ctx, &fidp->fs);
> > +    } else {
> > +        s->ops->seekdir(&s->ctx, &fidp->fs, offset);
> > +    }
> > +
> > +    /* save the directory position */
> > +    saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> > +    if (saved_dir_pos < 0) {
> > +        err = saved_dir_pos;
> > +        goto out;
> > +    }
> > +
> > +    while (true) {
> 
> To address your concern about aborting a readdir request, one could add
> here:
> 
>         if (v9fs_request_cancelled(pdu)) {
>             err = -EINTR;
>             break;
>         }
> 
> That's a minimal invasive change, so it would be Ok to add it to this patch
> already, or at any time later as a separate patch in future, as you like.

I've applied this change now, as well as the minor comment change in patch 3 
and pushed this overall patch set onto my queue:

https://github.com/cschoenebeck/qemu/commits/master

My plan is to send a PR once 5.1 is released (in presumably ~1-2 weeks), 
unless I hear back from you on anything else on this patch set.

Best regards
Christian Schoenebeck



