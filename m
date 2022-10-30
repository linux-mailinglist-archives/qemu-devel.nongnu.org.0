Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ECA612C01
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 18:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opCGn-00015s-Iy; Sun, 30 Oct 2022 13:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGb-00013a-MI
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGY-0003ky-IY
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667151512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ejT5hm6Eig/NIugoZ+qE+RfeSD4k+jAH5ibGL9RHEI=;
 b=GQp/HWRH4IjBJtnCOrgAr9W/zmA5btudoPNiJxLNnv9uj2PkUqi7caQmuEVokYrEZBbc39
 c63qvbO3PgnaKqKbr0E7S48F9cmJ3EQPqllkK4wMSU1VhuRkcyLxqB1pA7/ZLBEALR9u7N
 89Fy6pZxxLIAOHnkHCE18sTzb1TBKuw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-YMFJZrx2NWW0mvR3va9hug-1; Sun, 30 Oct 2022 13:38:30 -0400
X-MC-Unique: YMFJZrx2NWW0mvR3va9hug-1
Received: by mail-il1-f199.google.com with SMTP id
 n7-20020a056e02148700b002ffbfe5a9aeso8470153ilk.19
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 10:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ejT5hm6Eig/NIugoZ+qE+RfeSD4k+jAH5ibGL9RHEI=;
 b=7Tfj1YKTXM2t0eoBLVOEeggMtepapNMVtDt2yDxHEzn8rbBSz9YAxpQR73SNC+pFJC
 A0Ia5qeudoIxZjj6mh3bJT9TTMJeZxIuaI7ckgaGTcJ2NikGXZPajDQkaH8fsQfPQpor
 5nmII/f47gCpMfmIWDzbY0K27NNDEklZC6bZGd85zuqdy5MrCUDN+8RJvI+tf/NWnji8
 vQk0MvoGlUU80BUu6Iksp64d40Cq8NTEgEyu/y8eoNDHHZW8QChDbF4GIX20/+oyu4/m
 K5lN9iYke+14VC5RtHoIaATITuILW1YaKerrhlFRMEuYGcwPgQqrIB2XR9XMONZpnc4M
 FAqQ==
X-Gm-Message-State: ACrzQf0bkOgwfjK+pA7zKdybxRe4aONKi1T+V86ANZeNoG0xT+KzUA/n
 8pfnYWU4g/1vUo5ViHS1b6Lo7ZfMyatoJWmqe99lhPKtJrTXqY03DHPTDKJueA0uMExYdGcUShW
 K0opHtHV2ZEul9K/2D8PYSB5l3CHSnFw=
X-Received: by 2002:a05:6e02:1bc7:b0:2fa:876e:95a7 with SMTP id
 x7-20020a056e021bc700b002fa876e95a7mr4803811ilv.240.1667151509767; 
 Sun, 30 Oct 2022 10:38:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gfCjCajg6s3rFe67fd/vDPVRI3Vpkkc/vkU7k9/lupU2dhf7Erz5UmQ7yeUvNlPLa3dZETACtYw1Tgr+hySs=
X-Received: by 2002:a05:6e02:1bc7:b0:2fa:876e:95a7 with SMTP id
 x7-20020a056e021bc700b002fa876e95a7mr4803802ilv.240.1667151509533; Sun, 30
 Oct 2022 10:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-4-nsoffer@redhat.com>
 <d8bfb034-74ce-9092-a75a-0548cfcd2fcc@redhat.com>
In-Reply-To: <d8bfb034-74ce-9092-a75a-0548cfcd2fcc@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 30 Oct 2022 19:38:13 +0200
Message-ID: <CAMRbyytwEW-kMmZ7eBpEuU-Ka=O+DsbjuwykQAsLo5N3kjwWBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] qemu-img: Speed up checksum
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000834e2705ec43f502"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000834e2705ec43f502
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 4:54 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 01.09.22 16:32, Nir Soffer wrote:
> > Add coroutine based loop inspired by `qemu-img convert` design.
> >
> > Changes compared to `qemu-img convert`:
> >
> > - State for the entire image is kept in ImgChecksumState
> >
> > - State for single worker coroutine is kept in ImgChecksumworker.
> >
> > - "Writes" are always in-order, ensured using a queue.
> >
> > - Calling block status once per image extent, when the current extent i=
s
> >    consumed by the workers.
> >
> > - Using 1m buffer size - testings shows that this gives best read
> >    performance both with buffered and direct I/O.
>
> Why does patch 1 then choose to use 2 MB?
>

The first patch uses sync I/O, and in this case 2 MB is a little faster.


> > - Number of coroutines is not configurable. Testing does not show
> >    improvement when using more than 8 coroutines.
> >
> > - Progress include entire image, not only the allocated state.
> >
> > Comparing to the simple read loop shows that this version is up to 4.67
> > times faster when computing a checksum for an image full of zeroes. For
> > real images it is 1.59 times faster with direct I/O, and with buffered
> > I/O there is no difference.
> >
> > Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:
> >
> > | image    | size | i/o       | before         | after          | chang=
e
> |
> >
> |----------|------|-----------|----------------|----------------|--------=
|
> > | zero [1] |   6g | buffered  | 1.600s =C2=B10.014s | 0.342s =C2=B10.01=
6s |  x4.67
> |
> > | zero     |   6g | direct    | 4.684s =C2=B10.093s | 2.211s =C2=B10.00=
9s |  x2.12
> |
> > | real [2] |   6g | buffered  | 1.841s =C2=B10.075s | 1.806s =C2=B10.03=
6s |  x1.02
> |
> > | real     |   6g | direct    | 3.094s =C2=B10.079s | 1.947s =C2=B10.01=
7s |  x1.59
> |
> > | nbd  [3] |   6g | buffered  | 2.455s =C2=B10.183s | 1.808s =C2=B10.01=
6s |  x1.36
> |
> > | nbd      |   6g | direct    | 3.540s =C2=B10.020s | 1.749s =C2=B10.01=
8s |  x2.02
> |
> >
> > [1] raw image full of zeroes
> > [2] raw fedora 35 image with additional random data, 50% full
> > [3] image [2] exported by qemu-nbd via unix socket
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
> >   qemu-img.c | 343 +++++++++++++++++++++++++++++++++++++++++-----------=
-
> >   1 file changed, 270 insertions(+), 73 deletions(-)
>
> Looks good!
>
> Just a couple of style comments below.
>
> > diff --git a/qemu-img.c b/qemu-img.c
> > index 7edcfe4bc8..bfa8e2862f 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -1613,48 +1613,288 @@ out:
> >       qemu_vfree(buf2);
> >       blk_unref(blk2);
> >   out2:
> >       blk_unref(blk1);
> >   out3:
> >       qemu_progress_end();
> >       return ret;
> >   }
> >
> >   #ifdef CONFIG_BLKHASH
> > +
> > +#define CHECKSUM_COROUTINES 8
> > +#define CHECKSUM_BUF_SIZE (1 * MiB)
> > +#define CHECKSUM_ZERO_SIZE MIN(16 * GiB, SIZE_MAX)
> > +
> > +typedef struct ImgChecksumState ImgChecksumState;
> > +
> > +typedef struct ImgChecksumWorker {
> > +    QTAILQ_ENTRY(ImgChecksumWorker) entry;
> > +    ImgChecksumState *state;
> > +    Coroutine *co;
> > +    uint8_t *buf;
> > +
> > +    /* The current chunk. */
> > +    int64_t offset;
> > +    int64_t length;
> > +    bool zero;
> > +
> > +    /* Always true for zero extent, false for data extent. Set to true
> > +     * when reading the chunk completes. */
>
> Qemu codestyle requires /* and */ to be on separate lines for multi-line
> comments (see checkpatch.pl).
>

I'll change that. Do we have a good way to run checkpatch.pl when using
git-publish?

Maybe a way to run checkpatch.pl on all patches generated by git publish
automatically?


> > +    bool ready;
> > +} ImgChecksumWorker;
> > +
> > +struct ImgChecksumState {
> > +    const char *filename;
> > +    BlockBackend *blk;
> > +    BlockDriverState *bs;
> > +    int64_t total_size;
> > +
> > +    /* Current extent, modified in checksum_co_next. */
> > +    int64_t offset;
> > +    int64_t length;
> > +    bool zero;
> > +
> > +    int running_coroutines;
> > +    CoMutex lock;
> > +    ImgChecksumWorker workers[CHECKSUM_COROUTINES];
> > +
> > +    /* Ensure in-order updates. Update are scheduled at the tail of th=
e
> > +     * queue and processed from the head of the queue when a worker is
> > +     * ready. */
>
> Qemu codestyle requires /* and */ to be on separate lines for multi-line
> comments.
>
> > +    QTAILQ_HEAD(, ImgChecksumWorker) update_queue;
> > +
> > +    struct blkhash *hash;
> > +    int ret;
> > +};
>
> [...]
>
> > +static coroutine_fn bool checksum_co_next(ImgChecksumWorker *w)
> > +{
> > +    ImgChecksumState *s =3D w->state;
> > +
> > +    qemu_co_mutex_lock(&s->lock);
> > +
> > +    if (s->offset =3D=3D s->total_size || s->ret !=3D -EINPROGRESS) {
> > +        qemu_co_mutex_unlock(&s->lock);
> > +        return false;
> > +    }
> > +
> > +    if (s->length =3D=3D 0 && checksum_block_status(s)) {
>
> I=E2=80=99d prefer `checksum_block_status(s) < 0` so that it is clear tha=
t
> negative values indicate errors.  Otherwise, based on this code alone,
> it looks to me more like `checksum_block_status()` returned a boolean,
> where `false` would generally indicate an error, which is confusing.
>

Sure, will change.


>
> Same in other places below.
>
> > +        qemu_co_mutex_unlock(&s->lock);
> > +        return false;
> > +    }
>
> [...]
>
> > +/* Enter the next worker coroutine if the worker is ready. */
> > +static void coroutine_fn checksum_co_enter_next(ImgChecksumWorker *w)
> > +{
> > +    ImgChecksumState *s =3D w->state;
> > +    ImgChecksumWorker *next;
> > +
> > +    if (!QTAILQ_EMPTY(&s->update_queue)) {
> > +        next =3D QTAILQ_FIRST(&s->update_queue);
> > +        if (next->ready)
> > +            qemu_coroutine_enter(next->co);
>
> Qemu codestyle requires braces here.
>

Will add in next version.

Before beautifying the first commit, should I squash this commit into it?

The first commit was an attempt to do the simplest possible implementation,
but since this commit looks good (with some style issues), do we really
need the
first one?

Nir

--000000000000834e2705ec43f502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 26, 2022 at 4:54 PM Hanna Rei=
tz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 01.09.22 16:32, Nir Soffer wrote:<br>
&gt; Add coroutine based loop inspired by `qemu-img convert` design.<br>
&gt;<br>
&gt; Changes compared to `qemu-img convert`:<br>
&gt;<br>
&gt; - State for the entire image is kept in ImgChecksumState<br>
&gt;<br>
&gt; - State for single worker coroutine is kept in ImgChecksumworker.<br>
&gt;<br>
&gt; - &quot;Writes&quot; are always in-order, ensured using a queue.<br>
&gt;<br>
&gt; - Calling block status once per image extent, when the current extent =
is<br>
&gt;=C2=A0 =C2=A0 consumed by the workers.<br>
&gt;<br>
&gt; - Using 1m buffer size - testings shows that this gives best read<br>
&gt;=C2=A0 =C2=A0 performance both with buffered and direct I/O.<br>
<br>
Why does patch 1 then choose to use 2 MB?<br></blockquote><div><br></div><d=
iv>The first patch uses sync I/O, and in this case 2 MB is a little faster.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - Number of coroutines is not configurable. Testing does not show<br>
&gt;=C2=A0 =C2=A0 improvement when using more than 8 coroutines.<br>
&gt;<br>
&gt; - Progress include entire image, not only the allocated state.<br>
&gt;<br>
&gt; Comparing to the simple read loop shows that this version is up to 4.6=
7<br>
&gt; times faster when computing a checksum for an image full of zeroes. Fo=
r<br>
&gt; real images it is 1.59 times faster with direct I/O, and with buffered=
<br>
&gt; I/O there is no difference.<br>
&gt;<br>
&gt; Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:<br=
>
&gt;<br>
&gt; | image=C2=A0 =C2=A0 | size | i/o=C2=A0 =C2=A0 =C2=A0 =C2=A0| before=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| after=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | change |<br>
&gt; |----------|------|-----------|----------------|----------------|-----=
---|<br>
&gt; | zero [1] |=C2=A0 =C2=A06g | buffered=C2=A0 | 1.600s =C2=B10.014s | 0=
.342s =C2=B10.016s |=C2=A0 x4.67 |<br>
&gt; | zero=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06g | direct=C2=A0 =C2=A0 | 4.6=
84s =C2=B10.093s | 2.211s =C2=B10.009s |=C2=A0 x2.12 |<br>
&gt; | real [2] |=C2=A0 =C2=A06g | buffered=C2=A0 | 1.841s =C2=B10.075s | 1=
.806s =C2=B10.036s |=C2=A0 x1.02 |<br>
&gt; | real=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06g | direct=C2=A0 =C2=A0 | 3.0=
94s =C2=B10.079s | 1.947s =C2=B10.017s |=C2=A0 x1.59 |<br>
&gt; | nbd=C2=A0 [3] |=C2=A0 =C2=A06g | buffered=C2=A0 | 2.455s =C2=B10.183=
s | 1.808s =C2=B10.016s |=C2=A0 x1.36 |<br>
&gt; | nbd=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06g | direct=C2=A0 =C2=A0 | 3.5=
40s =C2=B10.020s | 1.749s =C2=B10.018s |=C2=A0 x2.02 |<br>
&gt;<br>
&gt; [1] raw image full of zeroes<br>
&gt; [2] raw fedora 35 image with additional random data, 50% full<br>
&gt; [3] image [2] exported by qemu-nbd via unix socket<br>
&gt;<br>
&gt; Signed-off-by: Nir Soffer &lt;<a href=3D"mailto:nsoffer@redhat.com" ta=
rget=3D"_blank">nsoffer@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qemu-img.c | 343 +++++++++++++++++++++++++++++++++++++++++=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 270 insertions(+), 73 deletions(-)<br>
<br>
Looks good!<br>
<br>
Just a couple of style comments below.<br>
<br>
&gt; diff --git a/qemu-img.c b/qemu-img.c<br>
&gt; index 7edcfe4bc8..bfa8e2862f 100644<br>
&gt; --- a/qemu-img.c<br>
&gt; +++ b/qemu-img.c<br>
&gt; @@ -1613,48 +1613,288 @@ out:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_vfree(buf2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_unref(blk2);<br>
&gt;=C2=A0 =C2=A0out2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0blk_unref(blk1);<br>
&gt;=C2=A0 =C2=A0out3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_progress_end();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_BLKHASH<br>
&gt; +<br>
&gt; +#define CHECKSUM_COROUTINES 8<br>
&gt; +#define CHECKSUM_BUF_SIZE (1 * MiB)<br>
&gt; +#define CHECKSUM_ZERO_SIZE MIN(16 * GiB, SIZE_MAX)<br>
&gt; +<br>
&gt; +typedef struct ImgChecksumState ImgChecksumState;<br>
&gt; +<br>
&gt; +typedef struct ImgChecksumWorker {<br>
&gt; +=C2=A0 =C2=A0 QTAILQ_ENTRY(ImgChecksumWorker) entry;<br>
&gt; +=C2=A0 =C2=A0 ImgChecksumState *state;<br>
&gt; +=C2=A0 =C2=A0 Coroutine *co;<br>
&gt; +=C2=A0 =C2=A0 uint8_t *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* The current chunk. */<br>
&gt; +=C2=A0 =C2=A0 int64_t offset;<br>
&gt; +=C2=A0 =C2=A0 int64_t length;<br>
&gt; +=C2=A0 =C2=A0 bool zero;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Always true for zero extent, false for data extent. =
Set to true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* when reading the chunk completes. */<br>
<br>
Qemu codestyle requires /* and */ to be on separate lines for multi-line <b=
r>
comments (see <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a>).<br></blockquote><div><br></div><div>I&#39;ll c=
hange that. Do we have a good way to run=C2=A0<a href=3D"http://checkpatch.=
pl/" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>=C2=A0when using=
</div><div>git-publish?</div><div><br></div><div>Maybe a way to run <a href=
=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> on all patche=
s generated by git publish</div><div>automatically?</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 bool ready;<br>
&gt; +} ImgChecksumWorker;<br>
&gt; +<br>
&gt; +struct ImgChecksumState {<br>
&gt; +=C2=A0 =C2=A0 const char *filename;<br>
&gt; +=C2=A0 =C2=A0 BlockBackend *blk;<br>
&gt; +=C2=A0 =C2=A0 BlockDriverState *bs;<br>
&gt; +=C2=A0 =C2=A0 int64_t total_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Current extent, modified in checksum_co_next. */<br>
&gt; +=C2=A0 =C2=A0 int64_t offset;<br>
&gt; +=C2=A0 =C2=A0 int64_t length;<br>
&gt; +=C2=A0 =C2=A0 bool zero;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 int running_coroutines;<br>
&gt; +=C2=A0 =C2=A0 CoMutex lock;<br>
&gt; +=C2=A0 =C2=A0 ImgChecksumWorker workers[CHECKSUM_COROUTINES];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Ensure in-order updates. Update are scheduled at the=
 tail of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* queue and processed from the head of the queue =
when a worker is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* ready. */<br>
<br>
Qemu codestyle requires /* and */ to be on separate lines for multi-line <b=
r>
comments.<br>
<br>
&gt; +=C2=A0 =C2=A0 QTAILQ_HEAD(, ImgChecksumWorker) update_queue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct blkhash *hash;<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +};<br>
<br>
[...]<br>
<br>
&gt; +static coroutine_fn bool checksum_co_next(ImgChecksumWorker *w)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ImgChecksumState *s =3D w-&gt;state;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_co_mutex_lock(&amp;s-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;offset =3D=3D s-&gt;total_size || s-&gt;ret !=
=3D -EINPROGRESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_co_mutex_unlock(&amp;s-&gt;lock);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;length =3D=3D 0 &amp;&amp; checksum_block_sta=
tus(s)) {<br>
<br>
I=E2=80=99d prefer `checksum_block_status(s) &lt; 0` so that it is clear th=
at <br>
negative values indicate errors.=C2=A0 Otherwise, based on this code alone,=
 <br>
it looks to me more like `checksum_block_status()` returned a boolean, <br>
where `false` would generally indicate an error, which is confusing.<br></b=
lockquote><div><br></div><div>Sure, will change.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Same in other places below.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_co_mutex_unlock(&amp;s-&gt;lock);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
[...]<br>
<br>
&gt; +/* Enter the next worker coroutine if the worker is ready. */<br>
&gt; +static void coroutine_fn checksum_co_enter_next(ImgChecksumWorker *w)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ImgChecksumState *s =3D w-&gt;state;<br>
&gt; +=C2=A0 =C2=A0 ImgChecksumWorker *next;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!QTAILQ_EMPTY(&amp;s-&gt;update_queue)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D QTAILQ_FIRST(&amp;s-&gt;update_q=
ueue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (next-&gt;ready)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_coroutine_enter(next-&=
gt;co);<br>
<br>
Qemu codestyle requires braces here.<br></blockquote><div><br></div><div>Wi=
ll add in next version.</div><div><br></div><div>Before beautifying the fir=
st commit, should I squash this commit into it?</div><div><br></div><div>Th=
e first commit was an attempt to do the simplest possible implementation,</=
div><div>but since this commit looks good (with some style issues), do we r=
eally need the</div><div>first one?</div><div><br></div><div>Nir</div></div=
></div>

--000000000000834e2705ec43f502--


