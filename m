Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162269636B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:23:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRuKM-0005zZ-5Y; Tue, 14 Feb 2023 07:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRuKJ-0005yn-7i
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRuKH-0006u8-5M
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676377344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OkiePdrU83PoEJrmg5321mcNiGkmyCK4LW+88e5/LuY=;
 b=GKbw7Srt9lFrTCGZxX/qHLuSzzVvnbEdl/uqMlx6T7I1HJvxmw1zPRhVsDuirFMZgqdJPv
 BiKpPJYzmpb9NdibkhYKnArI+VWkBmNza7uDFg7mEihAbeXH/u8TUILQinPxRIGCWhEd1c
 G85aL+U1LKoeT/NhV3IfxsdJKo32BhY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-WSGC-YrTPUapLhzD2z_6zA-1; Tue, 14 Feb 2023 07:22:23 -0500
X-MC-Unique: WSGC-YrTPUapLhzD2z_6zA-1
Received: by mail-yb1-f198.google.com with SMTP id
 f187-20020a251fc4000000b0087f69905709so15699700ybf.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OkiePdrU83PoEJrmg5321mcNiGkmyCK4LW+88e5/LuY=;
 b=GAzmCPmOx8FxAWeTMrD7669RD5GFtcg4GTNeOXEK1xqYrvLVVWKpwv2ovfkv77YnSF
 /aD/F7ZLJ0pyE8BQUTx/QNkZUY4KPJ65rN5vH8BT/TK8Im1Sa6hcLcAbLmyN+HrGKvxp
 +CqXyID15FYCKl3hoBm+juLlYj947AiLpCvJpffojBut3mTxzZk7kQcQv0cKsaCZyNj3
 JPYswgODtzNuvl3liWNRJZtPZ4LYa7nqh8FgvmF9gHOZ/f2u/8FGMpz0z/FTMcSCv5lx
 l3SyOuWdLBiFJN9hhYOVrSxUwLsqra7WdbIC30O9h608aC04KHT6NNKBDl7HDRsZ7Z9F
 E0bg==
X-Gm-Message-State: AO0yUKXauMXZz8vve0lUKGM8Bx4Y0pExIJ4uu9nqHJul2urYk5NnMTVg
 JiDcMwD5ew1ZQePTgYJphWtMnKWjjU90KqN809EAtqOlZsTHAsxAmzJ51lgaYotmViZFIrRr7dY
 FC2XOTgjaS81o7virGXyF9WvC1nCJVQo=
X-Received: by 2002:a81:93c1:0:b0:52b:4acb:a983 with SMTP id
 k184-20020a8193c1000000b0052b4acba983mr180961ywg.27.1676377342601; 
 Tue, 14 Feb 2023 04:22:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+RYZ6fTUk8XWG54j+QEEsbrXu/J6ietrtA6+fZBR0lKNaeGIKZTXJ7CCdEL9/P6Mg6gvz8LGe6ZHOGtarta/c=
X-Received: by 2002:a81:93c1:0:b0:52b:4acb:a983 with SMTP id
 k184-20020a8193c1000000b0052b4acba983mr180955ywg.27.1676377342323; Tue, 14
 Feb 2023 04:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20230214105156.316586-1-sgarzare@redhat.com>
 <Y+t24h3RrnCg8mYl@redhat.com>
In-Reply-To: <Y+t24h3RrnCg8mYl@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 14 Feb 2023 13:22:10 +0100
Message-ID: <CAGxU2F5qfudx7yQDvhrPkr8iHv9J01cYFm8eJT0iH6OKgyTGpg@mail.gmail.com>
Subject: Re: [PATCH] block: temporarily hold the new AioContext of bs_top in
 bdrv_append()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Aihua Liang <aliang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 12:56 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 14.02.2023 um 11:51 hat Stefano Garzarella geschrieben:
> > bdrv_append() is called with bs_top AioContext held, but
> > bdrv_attach_child_noperm() could change the AioContext of bs_top.
> >
> > bdrv_replace_node_noperm() calls bdrv_drained_begin() starting from
> > commit 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()").
> > bdrv_drained_begin() can call BDRV_POLL_WHILE that assumes the new lock
> > is taken, so let's temporarily hold the new AioContext to prevent QEMU
> > from failing in BDRV_POLL_WHILE when it tries to release the wrong
> > AioContext.
> >
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2168209
> > Reported-by: Aihua Liang <aliang@redhat.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > I'm not sure whether to use the following Fixes tag. That commit added the
> > calls to bdrv_drained_begin() in bdrv_replace_node_noperm(), but maybe the
> > problem was pre-existing.
> >
> > Fixes: 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()")
> >
> > Note: a local reproducer is attached in the BZ, it is based on the Aihua Liang
> > report and it hits the issue with a 20% ratio.
> > ---
> >  block.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/block.c b/block.c
> > index aa9062f2c1..0e2bc11e0b 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -5266,6 +5266,8 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
> >   * child.
> >   *
> >   * This function does not create any image files.
> > + *
> > + * The caller must hold the AioContext lock for @bs_top.
> >   */
> >  int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
> >                  Error **errp)
> > @@ -5273,11 +5275,14 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
> >      int ret;
> >      BdrvChild *child;
> >      Transaction *tran = tran_new();
> > +    AioContext *old_context, *new_context;
> >
> >      GLOBAL_STATE_CODE();
> >
> >      assert(!bs_new->backing);
> >
> > +    old_context = bdrv_get_aio_context(bs_top);
> > +
> >      child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
> >                                       &child_of_bds, bdrv_backing_role(bs_new),
> >                                       tran, errp);
> > @@ -5286,11 +5291,29 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
> >          goto out;
> >      }
> >
> > +    /*
> > +     * bdrv_attach_child_noperm could change the AioContext of bs_top.
> > +     * bdrv_replace_node_noperm calls bdrv_drained_begin, so let's temporarily
> > +     * hold the new AioContext, since bdrv_drained_begin calls BDRV_POLL_WHILE
> > +     * that assumes the new lock is taken.
> > +     */
> > +    new_context = bdrv_get_aio_context(bs_top);
> > +
> > +    if (old_context != new_context) {
> > +        aio_context_release(old_context);
> > +        aio_context_acquire(new_context);
> > +    }
> > +
> >      ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
> >      if (ret < 0) {
> >          goto out;
>
> If we take the error path, we return with new_context locked instead of
> old_context now.

Grr, I'm blind...

>
> >      }
> >
> > +    if (old_context != new_context) {
> > +        aio_context_release(new_context);
> > +        aio_context_acquire(old_context);
> > +    }
> > +
> >      ret = bdrv_refresh_perms(bs_new, tran, errp);
> >  out:
> >      tran_finalize(tran, ret);
>
> Strictly speaking, don't we need to hold the lock across
> tran_finalize(), too? It completes the bdrv_replace_node_noperm() call
> you covered above.

Right!

>
> Maybe bdrv_refresh_perms() and bdrv_refresh_limits(), too, in fact. We
> never clearly defined which functions need the lock and which don't, so
> hard to tell.

Okay, so to be on the safe side, I'll switch them back just before return.

> It's really time to get rid of it.

How could one disagree? :-)

What about the Fixes tag? Should I include it?

Thanks,
Stefano


