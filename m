Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92166339C4C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 06:53:11 +0100 (CET)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKxD4-0004FG-D4
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 00:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKxBo-00039q-8D; Sat, 13 Mar 2021 00:51:52 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKxBl-0006eH-Ef; Sat, 13 Mar 2021 00:51:51 -0500
Received: by mail-il1-x134.google.com with SMTP id e7so4599788ile.7;
 Fri, 12 Mar 2021 21:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auD6mtorRmt9cKdxfEDOUviaVFaTrcptz9J0biXmmlE=;
 b=uNaH/gZQT7cbZ2nvkaODSp5TMrAk10YzcH4dZ6G4bHm2DxuWs50P0YQW+AjRdhPw3Z
 1XsdLl3son7doWTj8j9Zu51qrkOjIHiqCQ1n6lh4W9NwcvWBWnSZPuwUqr3nubdOFDOP
 xyw/wpcYdPyQyqlvq+n8E56nKNZbEE9PzCqfSixDuncmUYAvibV6I2nHqa1h3C2dOW79
 NnIviIaoDbOdsKbch/YiprKOd20jp7cqsAqEIY0bOmH3cihzoLJ6ckpcEJ+bFtGOxmnb
 Pk/23p4r61XeSmy6GyJPSgRdh0ytV6zWlepWehCuG1emLXOvdcA2ynjxvnmCkylvsJ61
 VhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auD6mtorRmt9cKdxfEDOUviaVFaTrcptz9J0biXmmlE=;
 b=LtmPbTDKAbM97EeC4MbiUEgfS04oocScYzwITvci3U2KszeJjFfeszuLicRkP3SWII
 nT/5qmWaXtcSxbXeR01Ma85dhD5w9d6+liItOY0ELZ8TFSuR5GtTwaWBE4m02Rv4dECE
 W4ugzqRu1EwGbIyiDfkd4UW7DY1Jcj2apMO0kbhvz9Wm4PDuXio43zaRydNvofPOZqBC
 KRySi/a1Ck3FpAd8NdxIcj4abTXKPU99LP98DTlHqXeUG9ejLDlGH2c8VhindeqbnTSe
 LwL6OistkUekiBfRFqIA8LaEhW91R6Hqoqd7rq+6qRe0NU9bsomC+LxwWfiPqPCDk7tT
 Mr/A==
X-Gm-Message-State: AOAM531Hszy4N+lA61WD1r+uklh0uf9W4LBv44i7Ib2XfoRJKGX+HgIP
 tvOPGTkF5BA4ojxZwD5pogRJUarTC4GMMuCU3vM=
X-Google-Smtp-Source: ABdhPJza+4gOBBsfu5FW5+kY2+6a7qaAAvy+9fZqMTwY2oiXm11JPwhA3ZueDAAsnXfXjJnJPpJmk9/aGPUCvST86sM=
X-Received: by 2002:a92:ce89:: with SMTP id r9mr4999854ilo.191.1615614707850; 
 Fri, 12 Mar 2021 21:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-3-ma.mandourr@gmail.com>
 <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
In-Reply-To: <d74ef980-ad9b-8a97-0bc8-1ecc60a28c65@virtuozzo.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sat, 13 Mar 2021 07:51:35 +0200
Message-ID: <CAD-LL6jwuO2Wm06eTjhims2DgRA5yT4z1poOGqd8mXs968vc8A@mail.gmail.com>
Subject: Re: [PATCH 2/9] block: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: multipart/alternative; boundary="000000000000c1615905bd649cbd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 "open list:CURL" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c1615905bd649cbd
Content-Type: text/plain; charset="UTF-8"

Thank you for the fast review and I'm sorry for the silly and obvious style
errors. Unfortunately I did not notice the section on using the checkpatch
script in the Contributing page on the wiki before committing. But I assure
you that such errors will not occur again.

On Fri, Mar 12, 2021 at 12:23 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 11.03.2021 06:15, Mahmoud Mandour wrote:
> > Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with
> > lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).
> > This slightly simplifies the code by eliminating calls to
> > qemu_mutex_unlock and eliminates goto paths.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >   block/curl.c |  13 ++--
> >   block/nbd.c  | 188 ++++++++++++++++++++++++---------------------------
>
> Better would be make two separate patches I think.
>
> >   2 files changed, 95 insertions(+), 106 deletions(-)
> >
> > diff --git a/block/curl.c b/block/curl.c
> > index 4ff895df8f..56a217951a 100644
> > --- a/block/curl.c
> > +++ b/block/curl.c
> > @@ -832,12 +832,12 @@ static void curl_setup_preadv(BlockDriverState
> *bs, CURLAIOCB *acb)
> >       uint64_t start = acb->offset;
> >       uint64_t end;
> >
> > -    qemu_mutex_lock(&s->mutex);
> > +    QEMU_LOCK_GUARD(&s->mutex);
> >
> >       // In case we have the requested data already (e.g. read-ahead),
> >       // we can just call the callback and be done.
> >       if (curl_find_buf(s, start, acb->bytes, acb)) {
> > -        goto out;
> > +        return;
> >       }
> >
> >       // No cache found, so let's start a new request
> > @@ -852,7 +852,7 @@ static void curl_setup_preadv(BlockDriverState *bs,
> CURLAIOCB *acb)
> >       if (curl_init_state(s, state) < 0) {
> >           curl_clean_state(state);
> >           acb->ret = -EIO;
> > -        goto out;
> > +        return;
> >       }
> >
> >       acb->start = 0;
> > @@ -867,7 +867,7 @@ static void curl_setup_preadv(BlockDriverState *bs,
> CURLAIOCB *acb)
> >       if (state->buf_len && state->orig_buf == NULL) {
> >           curl_clean_state(state);
> >           acb->ret = -ENOMEM;
> > -        goto out;
> > +        return;
> >       }
> >       state->acb[0] = acb;
> >
> > @@ -880,14 +880,11 @@ static void curl_setup_preadv(BlockDriverState
> *bs, CURLAIOCB *acb)
> >           acb->ret = -EIO;
> >
> >           curl_clean_state(state);
> > -        goto out;
> > +        return;
> >       }
> >
> >       /* Tell curl it needs to kick things off */
> >       curl_multi_socket_action(s->multi, CURL_SOCKET_TIMEOUT, 0,
> &running);
> > -
> > -out:
> > -    qemu_mutex_unlock(&s->mutex);
> >   }
>
> This change is obvious and good.
>
> >
> >   static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
> > diff --git a/block/nbd.c b/block/nbd.c
> > index c26dc5a54f..28ba7aad61 100644
> > --- a/block/nbd.c
> > +++ b/block/nbd.c
> > @@ -407,27 +407,25 @@ static void *connect_thread_func(void *opaque)
> >           thr->sioc = NULL;
> >       }
> >
> > -    qemu_mutex_lock(&thr->mutex);
> > -
> > -    switch (thr->state) {
> > -    case CONNECT_THREAD_RUNNING:
> > -        thr->state = ret < 0 ? CONNECT_THREAD_FAIL :
> CONNECT_THREAD_SUCCESS;
> > -        if (thr->bh_ctx) {
> > -            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func,
> thr->bh_opaque);
> > -
> > -            /* play safe, don't reuse bh_ctx on further connection
> attempts */
> > -            thr->bh_ctx = NULL;
> > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> > +        switch (thr->state) {
> > +        case CONNECT_THREAD_RUNNING:
> > +            thr->state = ret < 0 ? CONNECT_THREAD_FAIL :
> CONNECT_THREAD_SUCCESS;
> > +            if (thr->bh_ctx) {
> > +                aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func,
> thr->bh_opaque);
>
> over-80 line
>
> > +
> > +                /* play safe, don't reuse bh_ctx on further connection
> attempts */
>
> and here
>
> > +                thr->bh_ctx = NULL;
> > +            }
> > +            break;
> > +        case CONNECT_THREAD_RUNNING_DETACHED:
> > +            do_free = true;
> > +            break;
> > +        default:
> > +            abort();
> >           }
> > -        break;
> > -    case CONNECT_THREAD_RUNNING_DETACHED:
> > -        do_free = true;
> > -        break;
> > -    default:
> > -        abort();
> >       }
> >
> > -    qemu_mutex_unlock(&thr->mutex);
> > ->       if (do_free) {
> >           nbd_free_connect_thread(thr);
> >       }
> > @@ -443,36 +441,33 @@ nbd_co_establish_connection(BlockDriverState *bs,
> Error **errp)
> >       BDRVNBDState *s = bs->opaque;
> >       NBDConnectThread *thr = s->connect_thread;
> >
> > -    qemu_mutex_lock(&thr->mutex);
> > -
> > -    switch (thr->state) {
> > -    case CONNECT_THREAD_FAIL:
> > -    case CONNECT_THREAD_NONE:
> > -        error_free(thr->err);
> > -        thr->err = NULL;
> > -        thr->state = CONNECT_THREAD_RUNNING;
> > -        qemu_thread_create(&thread, "nbd-connect",
> > -                           connect_thread_func, thr,
> QEMU_THREAD_DETACHED);
> > -        break;
> > -    case CONNECT_THREAD_SUCCESS:
> > -        /* Previous attempt finally succeeded in background */
> > -        thr->state = CONNECT_THREAD_NONE;
> > -        s->sioc = thr->sioc;
> > -        thr->sioc = NULL;
> > -        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> > -                               nbd_yank, bs);
> > -        qemu_mutex_unlock(&thr->mutex);
> > -        return 0;
> > -    case CONNECT_THREAD_RUNNING:
> > -        /* Already running, will wait */
> > -        break;
> > -    default:
> > -        abort();
> > -    }
> > -
> > -    thr->bh_ctx = qemu_get_current_aio_context();
> > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> > +        switch (thr->state) {
> > +        case CONNECT_THREAD_FAIL:
> > +        case CONNECT_THREAD_NONE:
> > +            error_free(thr->err);
> > +            thr->err = NULL;
> > +            thr->state = CONNECT_THREAD_RUNNING;
> > +            qemu_thread_create(&thread, "nbd-connect",
> > +                               connect_thread_func, thr,
> QEMU_THREAD_DETACHED);
> > +            break;
> > +        case CONNECT_THREAD_SUCCESS:
> > +            /* Previous attempt finally succeeded in background */
> > +            thr->state = CONNECT_THREAD_NONE;
> > +            s->sioc = thr->sioc;
> > +            thr->sioc = NULL;
> > +
> yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> > +                                   nbd_yank, bs);
> > +            return 0;
> > +        case CONNECT_THREAD_RUNNING:
> > +            /* Already running, will wait */
> > +            break;
> > +        default:
> > +            abort();
> > +        }
> >
> > -    qemu_mutex_unlock(&thr->mutex);
> > +        thr->bh_ctx = qemu_get_current_aio_context();
> > +    }
> >
> >
> >       /*
> > @@ -486,46 +481,45 @@ nbd_co_establish_connection(BlockDriverState *bs,
> Error **errp)
> >       s->wait_connect = true;
> >       qemu_coroutine_yield();
> >
> > -    qemu_mutex_lock(&thr->mutex);
> >
> > -    switch (thr->state) {
> > -    case CONNECT_THREAD_SUCCESS:
> > -    case CONNECT_THREAD_FAIL:
> > -        thr->state = CONNECT_THREAD_NONE;
> > -        error_propagate(errp, thr->err);
> > -        thr->err = NULL;
> > -        s->sioc = thr->sioc;
> > -        thr->sioc = NULL;
> > -        if (s->sioc) {
> > -
> yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> > -                                   nbd_yank, bs);
> > -        }
> > -        ret = (s->sioc ? 0 : -1);
> > -        break;
> > -    case CONNECT_THREAD_RUNNING:
> > -    case CONNECT_THREAD_RUNNING_DETACHED:
> > -        /*
> > -         * Obviously, drained section wants to start. Report the
> attempt as
> > -         * failed. Still connect thread is executing in background, and
> its
> > -         * result may be used for next connection attempt.
> > -         */
> > -        ret = -1;
> > -        error_setg(errp, "Connection attempt cancelled by other
> operation");
> > -        break;
> > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> > +        switch (thr->state) {
> > +        case CONNECT_THREAD_SUCCESS:
> > +        case CONNECT_THREAD_FAIL:
> > +            thr->state = CONNECT_THREAD_NONE;
> > +            error_propagate(errp, thr->err);
> > +            thr->err = NULL;
> > +            s->sioc = thr->sioc;
> > +            thr->sioc = NULL;
> > +            if (s->sioc) {
> > +
> yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
> > +                                       nbd_yank, bs);
> > +            }
> > +            ret = (s->sioc ? 0 : -1);
> > +            break;
> > +        case CONNECT_THREAD_RUNNING:
> > +        case CONNECT_THREAD_RUNNING_DETACHED:
> > +            /*
> > +             * Obviously, drained section wants to start. Report the
> attempt as
> > +             * failed. Still connect thread is executing in background,
> and its
> > +             * result may be used for next connection attempt.
> > +             */
> > +            ret = -1;
> > +            error_setg(errp, "Connection attempt cancelled by other
> operation");
> > +            break;
> >
> > -    case CONNECT_THREAD_NONE:
> > -        /*
> > -         * Impossible. We've seen this thread running. So it should be
> > -         * running or at least give some results.
> > -         */
> > -        abort();
> > +        case CONNECT_THREAD_NONE:
> > +            /*
> > +             * Impossible. We've seen this thread running. So it should
> be
> > +             * running or at least give some results.
> > +             */
> > +            abort();
> >
> > -    default:
> > -        abort();
> > +        default:
> > +            abort();
> > +        }
> >       }
> >
> > -    qemu_mutex_unlock(&thr->mutex);
> > -
> >       return ret;
> >   }
> >
> > @@ -546,25 +540,23 @@ static void
> nbd_co_establish_connection_cancel(BlockDriverState *bs,
> >       bool wake = false;
> >       bool do_free = false;
> >
> > -    qemu_mutex_lock(&thr->mutex);
> > -
> > -    if (thr->state == CONNECT_THREAD_RUNNING) {
> > -        /* We can cancel only in running state, when bh is not yet
> scheduled */
> > -        thr->bh_ctx = NULL;
> > -        if (s->wait_connect) {
> > -            s->wait_connect = false;
> > -            wake = true;
> > -        }
> > -        if (detach) {
> > -            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> > -            s->connect_thread = NULL;
> > +    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
> > +        if (thr->state == CONNECT_THREAD_RUNNING) {
> > +            /* We can cancel only in running state, when bh is not yet
> scheduled */
>
> over-80 line
>
> > +            thr->bh_ctx = NULL;
> > +            if (s->wait_connect) {
> > +                s->wait_connect = false;
> > +                wake = true;
> > +            }
> > +            if (detach) {
> > +                thr->state = CONNECT_THREAD_RUNNING_DETACHED;
> > +                s->connect_thread = NULL;
> > +            }
> > +        } else if (detach) {
> > +            do_free = true;
> >           }
> > -    } else if (detach) {
> > -        do_free = true;
> >       }
> >
> > -    qemu_mutex_unlock(&thr->mutex);
> > -
> >       if (do_free) {
> >           nbd_free_connect_thread(thr);
> >           s->connect_thread = NULL;
> >
>
>
> For nbd.c we mostly change simple critical sections
>
> qemu_mutex_lock()
> ...
> qemu_mutex_unlock()
>
> into
>
> WITH_QEMU_LOCK_GUARD() {
> ...
> }
>
> And don't eliminate any gotos.. Hmm. On the first sight increasing nesting
> of the code doesn't make it more beautiful.
> But I understand that context-manager concept is safer than calling
> unlock() by hand, and with nested block the critical section becomes more
> obvious. So, with fixed over-80 lines:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> --
> Best regards,
> Vladimir
>

--000000000000c1615905bd649cbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you for the fast review=C2=A0and I&=
#39;m sorry for the silly and obvious style=C2=A0</div><div dir=3D"ltr">err=
ors. Unfortunately I did not notice the section on using the checkpatch</di=
v><div dir=3D"ltr">script in the Contributing page on the wiki before commi=
tting. But I assure</div><div dir=3D"ltr">you that such errors will not occ=
ur again.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Mar 12, 2021 at 12:23 PM Vladimir Sementsov-Ogievskiy &lt;=
<a href=3D"mailto:vsementsov@virtuozzo.com" target=3D"_blank">vsementsov@vi=
rtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">11.03.2021 06:15, Mahmoud Mandour wrote:<br>
&gt; Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with<br>
&gt; lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).<br>
&gt; This slightly simplifies the code by eliminating calls to<br>
&gt; qemu_mutex_unlock and eliminates goto paths.<br>
&gt; <br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/curl.c |=C2=A0 13 ++--<br>
&gt;=C2=A0 =C2=A0block/nbd.c=C2=A0 | 188 ++++++++++++++++++++++++----------=
-----------------<br>
<br>
Better would be make two separate patches I think.<br>
<br>
&gt;=C2=A0 =C2=A02 files changed, 95 insertions(+), 106 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/curl.c b/block/curl.c<br>
&gt; index 4ff895df8f..56a217951a 100644<br>
&gt; --- a/block/curl.c<br>
&gt; +++ b/block/curl.c<br>
&gt; @@ -832,12 +832,12 @@ static void curl_setup_preadv(BlockDriverState *=
bs, CURLAIOCB *acb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t start =3D acb-&gt;offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t end;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;s-&gt;mutex);<br>
&gt; +=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;s-&gt;mutex);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// In case we have the requested data alread=
y (e.g. read-ahead),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// we can just call the callback and be done=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (curl_find_buf(s, start, acb-&gt;bytes, a=
cb)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// No cache found, so let&#39;s start a new =
request<br>
&gt; @@ -852,7 +852,7 @@ static void curl_setup_preadv(BlockDriverState *bs=
, CURLAIOCB *acb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (curl_init_state(s, state) &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl_clean_state(state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acb-&gt;ret =3D -EIO;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0acb-&gt;start =3D 0;<br>
&gt; @@ -867,7 +867,7 @@ static void curl_setup_preadv(BlockDriverState *bs=
, CURLAIOCB *acb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;buf_len &amp;&amp; state-&gt;o=
rig_buf =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl_clean_state(state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acb-&gt;ret =3D -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;acb[0] =3D acb;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -880,14 +880,11 @@ static void curl_setup_preadv(BlockDriverState *=
bs, CURLAIOCB *acb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0acb-&gt;ret =3D -EIO;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curl_clean_state(state);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Tell curl it needs to kick things off */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0curl_multi_socket_action(s-&gt;multi, CURL_S=
OCKET_TIMEOUT, 0, &amp;running);<br>
&gt; -<br>
&gt; -out:<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;s-&gt;mutex);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
This change is obvious and good.<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int coroutine_fn curl_co_preadv(BlockDriverState *b=
s,<br>
&gt; diff --git a/block/nbd.c b/block/nbd.c<br>
&gt; index c26dc5a54f..28ba7aad61 100644<br>
&gt; --- a/block/nbd.c<br>
&gt; +++ b/block/nbd.c<br>
&gt; @@ -407,27 +407,25 @@ static void *connect_thread_func(void *opaque)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0thr-&gt;sioc =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;thr-&gt;mutex);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D ret &lt; 0 ? CONNECT_TH=
READ_FAIL : CONNECT_THREAD_SUCCESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (thr-&gt;bh_ctx) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(thr=
-&gt;bh_ctx, thr-&gt;bh_func, thr-&gt;bh_opaque);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* play safe, don&#39;t reu=
se bh_ctx on further connection attempts */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;bh_ctx =3D NULL;<br=
>
&gt; +=C2=A0 =C2=A0 WITH_QEMU_LOCK_GUARD(&amp;thr-&gt;mutex) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D ret &lt; =
0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (thr-&gt;bh_ctx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedu=
le_oneshot(thr-&gt;bh_ctx, thr-&gt;bh_func, thr-&gt;bh_opaque);<br>
<br>
over-80 line<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* play safe,=
 don&#39;t reuse bh_ctx on further connection attempts */<br>
<br>
and here<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;bh_ct=
x =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING_DETACHED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_free =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING_DETACHED:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_free =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;thr-&gt;mutex);<br>
&gt; -&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_free) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_free_connect_thread(thr);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -443,36 +441,33 @@ nbd_co_establish_connection(BlockDriverState *bs=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BDRVNBDState *s =3D bs-&gt;opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NBDConnectThread *thr =3D s-&gt;connect_thre=
ad;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;thr-&gt;mutex);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_FAIL:<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_NONE:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(thr-&gt;err);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;err =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_THREAD_RUNNING;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_thread_create(&amp;thread, &quot;nbd=
-connect&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0connect_thread_func, thr, QEMU_THREAD_DETACHED)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_SUCCESS:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Previous attempt finally succeeded in =
background */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_THREAD_NONE;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sioc =3D thr-&gt;sioc;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;sioc =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register_function(BLOCKDEV_YANK_INST=
ANCE(bs-&gt;node_name),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_yank, bs);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock(&amp;thr-&gt;mutex);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Already running, will wait */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 thr-&gt;bh_ctx =3D qemu_get_current_aio_context();<br>
&gt; +=C2=A0 =C2=A0 WITH_QEMU_LOCK_GUARD(&amp;thr-&gt;mutex) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_FAIL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(thr-&gt;err);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_T=
HREAD_RUNNING;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_thread_create(&amp;thr=
ead, &quot;nbd-connect&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connect_thread_func, thr, QEMU_TH=
READ_DETACHED);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_SUCCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Previous attempt finally=
 succeeded in background */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_T=
HREAD_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sioc =3D thr-&gt;sioc=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;sioc =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register_function(BLOC=
KDEV_YANK_INSTANCE(bs-&gt;node_name),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_yank, bs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Already running, will wa=
it */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;thr-&gt;mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;bh_ctx =3D qemu_get_current_aio_c=
ontext();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; @@ -486,46 +481,45 @@ nbd_co_establish_connection(BlockDriverState *bs=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;wait_connect =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_coroutine_yield();<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;thr-&gt;mutex);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_SUCCESS:<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_FAIL:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_THREAD_NONE;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, thr-&gt;err);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;err =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sioc =3D thr-&gt;sioc;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;sioc =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;sioc) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register_function(BLOC=
KDEV_YANK_INSTANCE(bs-&gt;node_name),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_yank, bs);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (s-&gt;sioc ? 0 : -1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING_DETACHED:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Obviously, drained section wants =
to start. Report the attempt as<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* failed. Still connect thread is e=
xecuting in background, and its<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* result may be used for next conne=
ction attempt.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Connection attempt=
 cancelled by other operation&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 WITH_QEMU_LOCK_GUARD(&amp;thr-&gt;mutex) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (thr-&gt;state) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_SUCCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_FAIL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_T=
HREAD_NONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, thr-&=
gt;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sioc =3D thr-&gt;sioc=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;sioc =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;sioc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register=
_function(BLOCKDEV_YANK_INSTANCE(bs-&gt;node_name),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_y=
ank, bs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (s-&gt;sioc ? 0 : -=
1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_RUNNING_DETACHED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Obviously, drained =
section wants to start. Report the attempt as<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* failed. Still conne=
ct thread is executing in background, and its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* result may be used =
for next connection attempt.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Conn=
ection attempt cancelled by other operation&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 case CONNECT_THREAD_NONE:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Impossible. We&#39;ve seen this t=
hread running. So it should be<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* running or at least give some res=
ults.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CONNECT_THREAD_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Impossible. We&#39;=
ve seen this thread running. So it should be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* running or at least=
 give some results.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;thr-&gt;mutex);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -546,25 +540,23 @@ static void nbd_co_establish_connection_cancel(B=
lockDriverState *bs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool wake =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_free =3D false;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_lock(&amp;thr-&gt;mutex);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (thr-&gt;state =3D=3D CONNECT_THREAD_RUNNING) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We can cancel only in running state, w=
hen bh is not yet scheduled */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;bh_ctx =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;wait_connect) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;wait_connect =3D fals=
e;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wake =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (detach) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state =3D CONNECT_T=
HREAD_RUNNING_DETACHED;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;connect_thread =3D NU=
LL;<br>
&gt; +=C2=A0 =C2=A0 WITH_QEMU_LOCK_GUARD(&amp;thr-&gt;mutex) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (thr-&gt;state =3D=3D CONNECT_THREAD_R=
UNNING) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We can cancel only in ru=
nning state, when bh is not yet scheduled */<br>
<br>
over-80 line<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;bh_ctx =3D NULL;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;wait_connect) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;wait_co=
nnect =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wake =3D true=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (detach) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thr-&gt;state=
 =3D CONNECT_THREAD_RUNNING_DETACHED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;connect=
_thread =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (detach) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do_free =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 } else if (detach) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_free =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;thr-&gt;mutex);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (do_free) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nbd_free_connect_thread(thr);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;connect_thread =3D NULL;=
<br>
&gt; <br>
<br>
<br>
For nbd.c we mostly change simple critical sections<br>
<br>
qemu_mutex_lock()<br>
...<br>
qemu_mutex_unlock()<br>
<br>
into<br>
<br>
WITH_QEMU_LOCK_GUARD() {<br>
...<br>
}<br>
<br>
And don&#39;t eliminate any gotos.. Hmm. On the first sight increasing nest=
ing of the code doesn&#39;t make it more beautiful.<br>
But I understand that context-manager concept is safer than calling unlock(=
) by hand, and with nested block the critical section becomes more obvious.=
 So, with fixed over-80 lines:<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
</blockquote></div>
</div>

--000000000000c1615905bd649cbd--

