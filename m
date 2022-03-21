Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774A4E2207
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:19:45 +0100 (CET)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDGS-0002Gt-FR
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:19:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nWDEc-0000xs-Sw
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:17:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nWDEZ-0002fZ-TH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647850666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkAGbenbh4vyXPzJdSyrjEiyIJQ5avPPdOGROpt6BqY=;
 b=Zr7tWS47ZQBH+UA6UEQdJwqEvCyjebVRIPS4nhQcpQMNPRqLZarkaw+HPWLn0TT+r8BcgH
 BMPMNq/EatJsKSvk8+fEzVwqoCJ/tCEfJIze6ExtYyxw7de8TzXoKTwgr/7XTRs1E67t8V
 uZ9ZmlqumLVj8w/Z6pfEkjd8sMAxYgI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-gi86Kuj-OmatNFrCz16KzA-1; Mon, 21 Mar 2022 04:17:42 -0400
X-MC-Unique: gi86Kuj-OmatNFrCz16KzA-1
Received: by mail-qk1-f197.google.com with SMTP id
 i2-20020a05620a248200b0067b51fa1269so9338917qkn.19
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 01:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UkAGbenbh4vyXPzJdSyrjEiyIJQ5avPPdOGROpt6BqY=;
 b=WkdDJPUKMO/4fT0NqxwuRsqRx1sZZ0H+IlqmeWuydT42bYoETG3d6/oWmbnVDh1QeL
 p8YbrDvRi9V9gg+YGLl5QwkHMrepvnwpW6e6PyFctxhCA79LhPkeJKnGYHVlWAE2nuVZ
 PgEKi8HiXrFsgVDnfL8jmyHrnRQw1FphN89e4ulh38SEgh+ccxo2KOuXCfp34WQRP1WL
 l1LB99Zf+SAsBpO5bjJ4HkfLDKjLoDTYXTkGbCylE4ZGenbAG0/L2DG7La/WupoP0iyb
 IK27Yi6XnvwTa1F88A7VZrCrNc5gIzQbO9W8MZUGdg2A+9P07lVUhSf0iCPNn5LWnsrx
 cq0Q==
X-Gm-Message-State: AOAM530m/mQdm1gGki1SgQ+oq1kGkrEIKbKntcSVlqr5bTRCZE1RYAHN
 Xuc8fnYYQFzy0hvHnRiZco8lBDmj2zKcw8rs4u2BI1SYpDmSoFFHXkHnT7Ypg8HY/ov/EbdQ6+b
 FIXFF2I1cCe6S65M=
X-Received: by 2002:a05:620a:4592:b0:67d:8ed9:8c37 with SMTP id
 bp18-20020a05620a459200b0067d8ed98c37mr12165869qkb.150.1647850661548; 
 Mon, 21 Mar 2022 01:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlLbeQs2XfeQQrLGNNWyTs9/uu1z6uL1DuTLR11a9dNinK0p/b/vjbT4lhJvrj5Rw+UzVZRw==
X-Received: by 2002:a05:620a:4592:b0:67d:8ed9:8c37 with SMTP id
 bp18-20020a05620a459200b0067d8ed98c37mr12165863qkb.150.1647850661251; 
 Mon, 21 Mar 2022 01:17:41 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-114.business.telecomitalia.it.
 [87.12.25.114]) by smtp.gmail.com with ESMTPSA id
 u17-20020ac858d1000000b002e1cdbb50besm11159306qta.78.2022.03.21.01.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 01:17:40 -0700 (PDT)
Date: Mon, 21 Mar 2022 09:17:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Message-ID: <20220321081735.qupwljukz6owcnuz@sgarzare-redhat>
References: <20220317162638.41192-1-sgarzare@redhat.com>
 <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
 <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
 <CAOi1vP8Y-_LkuTaH6BCLiUhAUcBBbu-3scpM5d5gwz+xxvkYCw@mail.gmail.com>
 <CAOi1vP8aqApM5ubScq1M=uiAuA=N0eSChjP9uoWg7as0-RFcbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8aqApM5ubScq1M=uiAuA=N0eSChjP9uoWg7as0-RFcbg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 19, 2022 at 02:23:18PM +0100, Ilya Dryomov wrote:
>On Sat, Mar 19, 2022 at 1:40 PM Ilya Dryomov <idryomov@gmail.com> wrote:
>>
>> On Fri, Mar 18, 2022 at 9:25 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >
>> > On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>> > >
>> > >
>> > >> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>> > >>
>> > >> ﻿Commit d24f80234b ("block/rbd: increase dynamically the image size")
>> > >> added a workaround to support growing images (eg. qcow2), resizing
>> > >> the image before write operations that exceed the current size.
>> > >>
>> > >> We recently added support for write zeroes and without the
>> > >> workaround we can have problems with qcow2.
>> > >>
>> > >> So let's move the resize into qemu_rbd_start_co() and do it when
>> > >> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>> > >>
>> > >> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>> > >> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>> > >> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > >> ---
>> > >> block/rbd.c | 26 ++++++++++++++------------
>> > >> 1 file changed, 14 insertions(+), 12 deletions(-)
>> > >>
>> > >> diff --git a/block/rbd.c b/block/rbd.c
>> > >> index 8f183eba2a..6caf35cbba 100644
>> > >> --- a/block/rbd.c
>> > >> +++ b/block/rbd.c
>> > >> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>> > >>
>> > >>     assert(!qiov || qiov->size == bytes);
>> > >>
>> > >> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>> > >> +        /*
>> > >> +         * RBD APIs don't allow us to write more than actual size, so in order
>> > >> +         * to support growing images, we resize the image before write
>> > >> +         * operations that exceed the current size.
>> > >> +         */
>> > >> +        if (offset + bytes > s->image_size) {
>> > >> +            int r = qemu_rbd_resize(bs, offset + bytes);
>> > >> +            if (r < 0) {
>> > >> +                return r;
>> > >> +            }
>> > >> +        }
>> > >> +    }
>> > >> +
>> > >>     r = rbd_aio_create_completion(&task,
>> > >>                                   (rbd_callback_t) qemu_rbd_completion_cb, &c);
>> > >>     if (r < 0) {
>> > >> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>> > >>                                  int64_t bytes, QEMUIOVector *qiov,
>> > >>                                  BdrvRequestFlags flags)
>> > >> {
>> > >> -    BDRVRBDState *s = bs->opaque;
>> > >> -    /*
>> > >> -     * RBD APIs don't allow us to write more than actual size, so in order
>> > >> -     * to support growing images, we resize the image before write
>> > >> -     * operations that exceed the current size.
>> > >> -     */
>> > >> -    if (offset + bytes > s->image_size) {
>> > >> -        int r = qemu_rbd_resize(bs, offset + bytes);
>> > >> -        if (r < 0) {
>> > >> -            return r;
>> > >> -        }
>> > >> -    }
>> > >>     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>> > >> }
>> > >>
>> > >> --
>> > >> 2.35.1
>> > >>
>> > >
>> > >Do we really have a use case for growing rbd images?
>> >
>> > The use case is to have a qcow2 image on rbd.
>> > I don't think it's very common, but some people use it and here [1] we
>> > had a little discussion about features that could be interesting (e.g.
>> > persistent dirty bitmaps for incremental backup).
>>
>> RBD supports that natively (object-map and fast-diff image features).
>> The granularity is higher than a typical QCOW2 granularity (64K vs 4M)
>> but I have never heard of that being a concern.
>
>Sorry, I meant to say lower (more coarse grained) above.
>
>RBD's default object size is 4M and that is the granularity at which
>dirtiness is typically tracked.  It is possible to ask for a byte-level
>incremental diff but it is obviously slow.

I didn't know that, thanks for letting me know!

Stefano


