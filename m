Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB761F0EF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 11:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzWW-00086u-Lq; Mon, 07 Nov 2022 05:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1orzWU-00081p-5R
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1orzWP-0005k6-Nk
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 05:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667817507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhuF12lV+mUyvGtAvgO7lb9WvW4elXI9RP3QYvMse1s=;
 b=AY+NjpX/fNJDz9ldFDyePdNMnkr87q0Avqd1gNBOrkpcL1I2T8vxYjE+XoAem0t2Cuhn6K
 flsobVa9Atrt0j9upISItvG23yDp0kBBN+r8eiBlnDLBX8mva6Mv/8YM7J30tTkeXHSSln
 FO6MiyeenRgm77YBOfkRYBi9n7e5vFM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-y5HL5fRQNVajiI3ApUhv6Q-1; Mon, 07 Nov 2022 05:38:23 -0500
X-MC-Unique: y5HL5fRQNVajiI3ApUhv6Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk31-20020a1709077f9f00b00791a3e02c80so6190306ejc.21
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 02:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zhuF12lV+mUyvGtAvgO7lb9WvW4elXI9RP3QYvMse1s=;
 b=Xi4sMsw4R/76ueny41B1ASHHX/GUIqpbNtJ1nj6qEQ8UfpmAxdhUD7ZixQoIbHmEsP
 R9EB/4j3NN6ZtE/9xF12ydD9IRltkbG4AQPxPZ5YRFs3d2Cb7p/rVd4Pq/Hrj1eRDvwr
 eBivUZ2Q8mGbPa1Q/0NwaXN++gktnL9FQYnLrZwVfrnMgkh/OVzvbvK7hEPs9OAR/iLw
 Dw05AI0xpgKqohRKNS+1IB26EDwm4RyjmO91pNkeYqM7Ebcg0JNUer9DR4DsOdDU6tKD
 dXGBD/NT61hQZSAlswNpt26DcQSR/gwfeqz3r9p23R3zpRWGnhUTZQtcZ8oMxZ21IgId
 CcRw==
X-Gm-Message-State: ANoB5pmrDYdPbtJI/6rIAwhvGd6VdN/RhR71isNaw4/RFKpWj7j2QyFE
 YAbTTJM44QOlKYx4073JmVmGQDkRBvQrvpKhRV9BV+5lDkpL9yPfpfklxPyAqA8U8++54dsIT7g
 J3Dhb5QkvzMYmWKY=
X-Received: by 2002:a17:907:c086:b0:7ae:566e:3eba with SMTP id
 st6-20020a170907c08600b007ae566e3ebamr9487594ejc.470.1667817501811; 
 Mon, 07 Nov 2022 02:38:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4f56Pt+55PutYazPGG2PzRq6tcp6ImMuw4Enc4LEWWNbLJdsAH8jSNYuPr8nwFXj788/ZoXw==
X-Received: by 2002:a17:907:c086:b0:7ae:566e:3eba with SMTP id
 st6-20020a170907c08600b007ae566e3ebamr9487571ejc.470.1667817501530; 
 Mon, 07 Nov 2022 02:38:21 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 et10-20020a056402378a00b0045c47b2a800sm3922183edb.67.2022.11.07.02.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 02:38:21 -0800 (PST)
Message-ID: <6f280bd0-1e56-9615-6b0b-8ee97d48fcc6@redhat.com>
Date: Mon, 7 Nov 2022 11:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] qemu-img: Speed up checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-4-nsoffer@redhat.com>
 <d8bfb034-74ce-9092-a75a-0548cfcd2fcc@redhat.com>
 <CAMRbyytwEW-kMmZ7eBpEuU-Ka=O+DsbjuwykQAsLo5N3kjwWBw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAMRbyytwEW-kMmZ7eBpEuU-Ka=O+DsbjuwykQAsLo5N3kjwWBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30.10.22 18:38, Nir Soffer wrote:
> On Wed, Oct 26, 2022 at 4:54 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 01.09.22 16:32, Nir Soffer wrote:
>     > Add coroutine based loop inspired by `qemu-img convert` design.
>     >
>     > Changes compared to `qemu-img convert`:
>     >
>     > - State for the entire image is kept in ImgChecksumState
>     >
>     > - State for single worker coroutine is kept in ImgChecksumworker.
>     >
>     > - "Writes" are always in-order, ensured using a queue.
>     >
>     > - Calling block status once per image extent, when the current
>     extent is
>     >    consumed by the workers.
>     >
>     > - Using 1m buffer size - testings shows that this gives best read
>     >    performance both with buffered and direct I/O.
>
>     Why does patch 1 then choose to use 2 MB?
>
>
> The first patch uses sync I/O, and in this case 2 MB is a little faster.

Interesting.

>     > - Number of coroutines is not configurable. Testing does not show
>     >    improvement when using more than 8 coroutines.
>     >
>     > - Progress include entire image, not only the allocated state.
>     >
>     > Comparing to the simple read loop shows that this version is up
>     to 4.67
>     > times faster when computing a checksum for an image full of
>     zeroes. For
>     > real images it is 1.59 times faster with direct I/O, and with
>     buffered
>     > I/O there is no difference.
>     >
>     > Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:
>     >
>     > | image    | size | i/o       | before         | after         |
>     change |
>     >
>     |----------|------|-----------|----------------|----------------|--------|
>     > | zero [1] |   6g | buffered  | 1.600s ±0.014s | 0.342s ±0.016s
>     |  x4.67 |
>     > | zero     |   6g | direct    | 4.684s ±0.093s | 2.211s ±0.009s
>     |  x2.12 |
>     > | real [2] |   6g | buffered  | 1.841s ±0.075s | 1.806s ±0.036s
>     |  x1.02 |
>     > | real     |   6g | direct    | 3.094s ±0.079s | 1.947s ±0.017s
>     |  x1.59 |
>     > | nbd  [3] |   6g | buffered  | 2.455s ±0.183s | 1.808s ±0.016s
>     |  x1.36 |
>     > | nbd      |   6g | direct    | 3.540s ±0.020s | 1.749s ±0.018s
>     |  x2.02 |
>     >
>     > [1] raw image full of zeroes
>     > [2] raw fedora 35 image with additional random data, 50% full
>     > [3] image [2] exported by qemu-nbd via unix socket
>     >
>     > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
>     > ---
>     >   qemu-img.c | 343
>     +++++++++++++++++++++++++++++++++++++++++------------
>     >   1 file changed, 270 insertions(+), 73 deletions(-)
>
>     Looks good!
>
>     Just a couple of style comments below.
>
>     > diff --git a/qemu-img.c b/qemu-img.c
>     > index 7edcfe4bc8..bfa8e2862f 100644
>     > --- a/qemu-img.c
>     > +++ b/qemu-img.c
>     > @@ -1613,48 +1613,288 @@ out:
>     >       qemu_vfree(buf2);
>     >       blk_unref(blk2);
>     >   out2:
>     >       blk_unref(blk1);
>     >   out3:
>     >       qemu_progress_end();
>     >       return ret;
>     >   }
>     >
>     >   #ifdef CONFIG_BLKHASH
>     > +
>     > +#define CHECKSUM_COROUTINES 8
>     > +#define CHECKSUM_BUF_SIZE (1 * MiB)
>     > +#define CHECKSUM_ZERO_SIZE MIN(16 * GiB, SIZE_MAX)
>     > +
>     > +typedef struct ImgChecksumState ImgChecksumState;
>     > +
>     > +typedef struct ImgChecksumWorker {
>     > +    QTAILQ_ENTRY(ImgChecksumWorker) entry;
>     > +    ImgChecksumState *state;
>     > +    Coroutine *co;
>     > +    uint8_t *buf;
>     > +
>     > +    /* The current chunk. */
>     > +    int64_t offset;
>     > +    int64_t length;
>     > +    bool zero;
>     > +
>     > +    /* Always true for zero extent, false for data extent. Set
>     to true
>     > +     * when reading the chunk completes. */
>
>     Qemu codestyle requires /* and */ to be on separate lines for
>     multi-line
>     comments (see checkpatch.pl <http://checkpatch.pl>).
>
>
> I'll change that. Do we have a good way to run checkpatch.pl 
> <http://checkpatch.pl/> when using
> git-publish?
>
> Maybe a way to run checkpatch.pl <http://checkpatch.pl> on all patches 
> generated by git publish
> automatically?

I don’t know myself, I don’t use git-publish.  Stefan should know. ;)

>
>     > +    bool ready;
>     > +} ImgChecksumWorker;
>     > +
>     > +struct ImgChecksumState {
>     > +    const char *filename;
>     > +    BlockBackend *blk;
>     > +    BlockDriverState *bs;
>     > +    int64_t total_size;
>     > +
>     > +    /* Current extent, modified in checksum_co_next. */
>     > +    int64_t offset;
>     > +    int64_t length;
>     > +    bool zero;
>     > +
>     > +    int running_coroutines;
>     > +    CoMutex lock;
>     > +    ImgChecksumWorker workers[CHECKSUM_COROUTINES];
>     > +
>     > +    /* Ensure in-order updates. Update are scheduled at the
>     tail of the
>     > +     * queue and processed from the head of the queue when a
>     worker is
>     > +     * ready. */
>
>     Qemu codestyle requires /* and */ to be on separate lines for
>     multi-line
>     comments.
>
>     > +    QTAILQ_HEAD(, ImgChecksumWorker) update_queue;
>     > +
>     > +    struct blkhash *hash;
>     > +    int ret;
>     > +};
>
>     [...]
>
>     > +static coroutine_fn bool checksum_co_next(ImgChecksumWorker *w)
>     > +{
>     > +    ImgChecksumState *s = w->state;
>     > +
>     > +    qemu_co_mutex_lock(&s->lock);
>     > +
>     > +    if (s->offset == s->total_size || s->ret != -EINPROGRESS) {
>     > +        qemu_co_mutex_unlock(&s->lock);
>     > +        return false;
>     > +    }
>     > +
>     > +    if (s->length == 0 && checksum_block_status(s)) {
>
>     I’d prefer `checksum_block_status(s) < 0` so that it is clear that
>     negative values indicate errors.  Otherwise, based on this code
>     alone,
>     it looks to me more like `checksum_block_status()` returned a
>     boolean,
>     where `false` would generally indicate an error, which is confusing.
>
>
> Sure, will change.
>
>
>     Same in other places below.
>
>     > +        qemu_co_mutex_unlock(&s->lock);
>     > +        return false;
>     > +    }
>
>     [...]
>
>     > +/* Enter the next worker coroutine if the worker is ready. */
>     > +static void coroutine_fn
>     checksum_co_enter_next(ImgChecksumWorker *w)
>     > +{
>     > +    ImgChecksumState *s = w->state;
>     > +    ImgChecksumWorker *next;
>     > +
>     > +    if (!QTAILQ_EMPTY(&s->update_queue)) {
>     > +        next = QTAILQ_FIRST(&s->update_queue);
>     > +        if (next->ready)
>     > +            qemu_coroutine_enter(next->co);
>
>     Qemu codestyle requires braces here.
>
>
> Will add in next version.
>
> Before beautifying the first commit, should I squash this commit into it?
>
> The first commit was an attempt to do the simplest possible 
> implementation,
> but since this commit looks good (with some style issues), do we 
> really need the
> first one?

I wouldn’t mind squashing.  Your choice. :)

Hanna


