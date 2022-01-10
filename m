Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF414489B34
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:22:34 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vZB-0008TE-Lr
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6vVx-0006SF-QL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6vVu-0004ft-Jm
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641824347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=heBZU/6OsXWOuVZuLzkmvWha0vJcKds5G6+h2kvpUgg=;
 b=fatZxFad5esX2WsYmylwerY222DXEhbIytcDPcH9Z7AefSa/g5IE+C0Vxecm92rb9I617/
 qGH6vVBHdhgcvBvJr8r7bnzOngnLQiKdBAaaIXuy7uSLoSvBA8jpV0YeOUw7EAuKCzj0Wa
 SlhV/fJzeO9h0vemTZjcHnc5Bf8JTUo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-rFnty3AnP7e8yybXhW7NeQ-1; Mon, 10 Jan 2022 09:19:04 -0500
X-MC-Unique: rFnty3AnP7e8yybXhW7NeQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kc15-20020a056214410f00b004152196c16eso9205996qvb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=heBZU/6OsXWOuVZuLzkmvWha0vJcKds5G6+h2kvpUgg=;
 b=q/xxT/MSaGPpz1ARaZySdKtUS2HQOv2Cci8g7kZp+QKYP229qWE4sFyugXdorWGaFJ
 gEDKmXsq9f5BYkL0dVR/z60iUxA9ZI72KlvGC1yGmPVid3pvKQclSkMLMBDc5qefVoJn
 lY8flcOw7XlvmHFmCLALfUkTWiF/88o/Ktyhz7bKG3DBGxDMvZUyFgpueAb/kuTjXxGt
 hLvGoXEhoW31YfKsdeyrS75XsVsWkVjzKrOKvvgSwtPOOscUBnBPZRFM6W5xT4DVZQVa
 /TJm/4xXlMCRYLXAEcroJ29Qtp8l4yEIkHFHs7z/H5wqeqHEZ3LJCPDFJ6jDXXR5Zsbe
 pmSg==
X-Gm-Message-State: AOAM531kfWK3bb+FtouniHVzldOceYtSp0GM4GN6RrYQ13CPkARrz8rN
 8K0ZMhgCRibNOvlBxCWD9ptZHP8KNjukrCpLwelu1Pd8iFIdjTISLOp+iJ2QBi4m74JIdm/VxMC
 sffEcjqKKPDjeAgQ=
X-Received: by 2002:a37:3ce:: with SMTP id 197mr53099797qkd.727.1641824343669; 
 Mon, 10 Jan 2022 06:19:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGLXGuetT7z5/1bps0GeZRkUYp9KkzT/4aIZBRvYul1lQWyyYttjdFDp4zRwDzktAtMb7BnQ==
X-Received: by 2002:a37:3ce:: with SMTP id 197mr53099781qkd.727.1641824343455; 
 Mon, 10 Jan 2022 06:19:03 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id y9sm4337026qkj.82.2022.01.10.06.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:19:02 -0800 (PST)
Date: Mon, 10 Jan 2022 15:18:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
Message-ID: <20220110141854.6wqqfyrsjyehcxqp@steredhat>
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20220110114154.3774072-3-pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com, idryomov@gmail.com,
 idryomov@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 12:41:54PM +0100, Peter Lieven wrote:
>librbd had a bug until early 2022 that affected all versions of ceph that
>supported fast-diff. This bug results in reporting of incorrect offsets
>if the offset parameter to rbd_diff_iterate2 is not object aligned.
>Work around this bug by rounding down the offset to object boundaries.
>
>Fixes: https://tracker.ceph.com/issues/53784
>Cc: qemu-stable@nongnu.org
>Signed-off-by: Peter Lieven <pl@kamp.de>
>---
> block/rbd.c | 17 ++++++++++++++++-
> 1 file changed, 16 insertions(+), 1 deletion(-)
>
>diff --git a/block/rbd.c b/block/rbd.c
>index 5e9dc91d81..260cb9f4b4 100644
>--- a/block/rbd.c
>+++ b/block/rbd.c
>@@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>     int status, r;
>     RBDDiffIterateReq req = { .offs = offset };
>     uint64_t features, flags;
>+    int64_t head;
>
>     assert(offset + bytes <= s->image_size);
>
>@@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>         return status;
>     }
>
>+    /*
>+     * librbd had a bug until early 2022 that affected all versions of ceph that
>+     * supported fast-diff. This bug results in reporting of incorrect offsets
>+     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
>+     * Work around this bug by rounding down the offset to object boundaries.
>+     *
>+     * See: https://tracker.ceph.com/issues/53784
>+     */
>+    head = offset & (s->object_size - 1);
>+    offset -= head;
>+    req.offs -= head;
>+    bytes += head;
>+
>     r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>                           qemu_rbd_diff_iterate_cb, &req);
>     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
>@@ -1379,7 +1393,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>     }
>
>-    *pnum = req.bytes;
>+    assert(req.bytes > head);
>+    *pnum = req.bytes - head;
>     return status;
> }

Thanks for the workaround!

I just tested this patch for the issue reported in this BZ [1] and the 
test now works correctly!

Tested-by: Stefano Garzarella <sgarzare@redhat.com>

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2034791


