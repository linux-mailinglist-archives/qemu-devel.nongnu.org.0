Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32E4DDF5B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:51:26 +0100 (CET)
Received: from localhost ([::1]:54060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFoz-0007ui-21
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:51:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nVFlZ-0004tE-V9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nVFlY-00032R-7v
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647622071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAoQTmA0z7XQ+e5TGw0bc6AFwDdHMYA4eF5pj3bAc3k=;
 b=i23no15anSzSc/iq6D/8r6KM38uOoEB+UeoqsdV573AiVMOXrFTGSM1TubIQW3TN/YywhO
 Xi8wvuuEzKi9jMyEKpfELpgnJBIqgr/QpxTZx+bRiuqSKwuY8tIgTXgHYubg+tXKiXoNhY
 EkdtcVGSIVkRlZAie9i4lSW/E8CpucM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-bv0-LFyaOsS4cxxJKDTfTQ-1; Fri, 18 Mar 2022 12:47:50 -0400
X-MC-Unique: bv0-LFyaOsS4cxxJKDTfTQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 k1-20020ac85fc1000000b002e1c5930386so6002323qta.3
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kAoQTmA0z7XQ+e5TGw0bc6AFwDdHMYA4eF5pj3bAc3k=;
 b=icD3M703+O1o/A4fMxQLSDR1UzyYmHv7XYhUcfykDNOX3cBh6ytRRRDnA6ItQmP5dW
 wpBSR7BWGB67/Y+nMQ9J3cdj1YC8KOD8PcyYIhpzBdbsGAa4FIq9xrItS2FsH9RnzZbb
 p5PoopPLQTZIozK4ZRbWwmNjSDB6rrvIPbxi9RGxMKCp5mZsT8SoE894Nf9dE4m5bHRc
 4f6ieAyxjqwJz+6OaXRK1CJQ6icvxsFlfAUF/f9FCPyYdrIVeYDTtc3+2OkF8PjPPJ5B
 n/upnVuS8JhkwcIGcd18AaW7L0E7Vsq6pIQPVjMjqXuFehUaNITd2+b4tAOfJWlc0nI3
 7qqA==
X-Gm-Message-State: AOAM532x0XOeU0MzJv4JRwN4tHvHheVFBjrjRZ03/8XtuefLD/3hbrDl
 WtoW7qKDCUG6gPVjwFquksL+e8WP1t5e7Bm4+BNZij9N11e95joTrnGE0Qx9nlLX+zoFXDoV99r
 OA642Gr9f14yomzI=
X-Received: by 2002:ac8:5ac3:0:b0:2e1:e117:b2ed with SMTP id
 d3-20020ac85ac3000000b002e1e117b2edmr8016944qtd.541.1647622069692; 
 Fri, 18 Mar 2022 09:47:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC2fdhfozaGV1UdoHDKDB2XYrKjG4iFjcWVoQYV4a0FB8jR23DsHvg35kWLrca/zOu3AJ8YA==
X-Received: by 2002:ac8:5ac3:0:b0:2e1:e117:b2ed with SMTP id
 d3-20020ac85ac3000000b002e1e117b2edmr8016919qtd.541.1647622069345; 
 Fri, 18 Mar 2022 09:47:49 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-114.business.telecomitalia.it.
 [87.12.25.114]) by smtp.gmail.com with ESMTPSA id
 i17-20020ac85e51000000b002e1cf062ef4sm6102842qtx.45.2022.03.18.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:47:48 -0700 (PDT)
Date: Fri, 18 Mar 2022 17:47:43 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Message-ID: <20220318164743.vgkbcoeok2e4r6pa@sgarzare-redhat>
References: <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
 <AA4AC067-D604-43A4-AE1F-18AA1BFCF90C@kamp.de>
MIME-Version: 1.0
In-Reply-To: <AA4AC067-D604-43A4-AE1F-18AA1BFCF90C@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Ilya Dryomov <idryomov@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:48:18PM +0100, Peter Lieven wrote:
>
>
>> Am 18.03.2022 um 09:25 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>
>> ﻿On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>>
>>>
>>>>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>
>>>> ﻿Commit d24f80234b ("block/rbd: increase dynamically the image size")
>>>> added a workaround to support growing images (eg. qcow2), resizing
>>>> the image before write operations that exceed the current size.
>>>>
>>>> We recently added support for write zeroes and without the
>>>> workaround we can have problems with qcow2.
>>>>
>>>> So let's move the resize into qemu_rbd_start_co() and do it when
>>>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>>
>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>>>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>> ---
>>>> block/rbd.c | 26 ++++++++++++++------------
>>>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index 8f183eba2a..6caf35cbba 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>>>>
>>>>    assert(!qiov || qiov->size == bytes);
>>>>
>>>> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>>>> +        /*
>>>> +         * RBD APIs don't allow us to write more than actual size, so in order
>>>> +         * to support growing images, we resize the image before write
>>>> +         * operations that exceed the current size.
>>>> +         */
>>>> +        if (offset + bytes > s->image_size) {
>>>> +            int r = qemu_rbd_resize(bs, offset + bytes);
>>>> +            if (r < 0) {
>>>> +                return r;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>>    r = rbd_aio_create_completion(&task,
>>>>                                  (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>>>    if (r < 0) {
>>>> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>>>                                 int64_t bytes, QEMUIOVector *qiov,
>>>>                                 BdrvRequestFlags flags)
>>>> {
>>>> -    BDRVRBDState *s = bs->opaque;
>>>> -    /*
>>>> -     * RBD APIs don't allow us to write more than actual size, so in order
>>>> -     * to support growing images, we resize the image before write
>>>> -     * operations that exceed the current size.
>>>> -     */
>>>> -    if (offset + bytes > s->image_size) {
>>>> -        int r = qemu_rbd_resize(bs, offset + bytes);
>>>> -        if (r < 0) {
>>>> -            return r;
>>>> -        }
>>>> -    }
>>>>    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>>>> }
>>>>
>>>> --
>>>> 2.35.1
>>>>
>>>
>>> Do we really have a use case for growing rbd images?
>>
>> The use case is to have a qcow2 image on rbd.
>> I don't think it's very common, but some people use it and here [1] we had a little discussion about features that could be interesting (e.g.  persistent dirty bitmaps for incremental backup).
>>
>> In any case the support is quite simple and does not affect other use cases since we only increase the size when we go beyond the current size.
>>
>> IMHO we can have it in :-)
>>
>
>The QCOW2 alone doesn’t make much sense, but additional metadata might 
>be a use case.

Yep.

>Be aware that the current approach will serialize requests. If there is 
>a real use case, we might think of a better solution.

Good point, but it only happens when we have to resize, so maybe it's 
okay for now, but I agree we could do better ;-)

Thanks,
Stefano


