Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870344501F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:04:10 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYqP-0001Ki-DD
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:04:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mmYnG-0007W8-Th
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:00:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mmYn1-0005aT-AF
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636970437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aS1YLIBNNa0zGcJuCAp0XowPdpeiHM/ZzvNCtqV0tgc=;
 b=IG2Pok08NKbwqjHbuh4ajbCPUTlEI4jpDK8nXA/PjUSLeJ0efnAoMq6+qPHQnbC7b/rZ3Y
 eO7Y+3eWVYEka/UIreJE0sylTf3uQ0zYYJqiLrlIX1CQRkSo+qtTC0L5OV7I61rPeCct+R
 hCcz6eDSw8pYob/lpULEERI9OTxA8xg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-fK1vFeJdPcK5LnwT3g14-g-1; Mon, 15 Nov 2021 05:00:36 -0500
X-MC-Unique: fK1vFeJdPcK5LnwT3g14-g-1
Received: by mail-ed1-f70.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so1075438edx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aS1YLIBNNa0zGcJuCAp0XowPdpeiHM/ZzvNCtqV0tgc=;
 b=Sz76nVLRZ+XBp5Dq/3CRa6Rfj8trOk2P8QLdgwwjiA/6qyFKcktRPc+vT3c2RA0Kng
 uc4mGISAzuh0wVAKnTjtSa7rSs4IzttxKJvy6Db7Rb/WH9zBTYP8h7Xy5PfA40j2OIcB
 c+7He/qyyjo6kkvyJ8jjIHO1ljoP+2LWEiMo06JssVs0YkBrWDw1JaxGLFaHIVkJukIE
 0bEeNN03+ZXlo7bSKUIOJbgVRS53dZAjCxDM6Kj6I6EW/pkmByNUR8WUAZ1LYf886pCI
 QHGrNOyXw4eFPb6LgxSEPOv7pFIlSimJvrhT4vFk2YORHITxH9s65/p+LhURbYFGufuD
 GKVg==
X-Gm-Message-State: AOAM530U0QpT7YbUTKjGsYpvDV6JSsW4qCtzzaOHUua0vvqAdcKQRs7N
 lezeDlwLFpnp7JJsH/82fU1l54EqQoiKC8tcgoBk6soaaVGfEgzPBq+k0n/pIu8F61EctPD+j80
 39YSUltHgwsDSwes=
X-Received: by 2002:a50:fb09:: with SMTP id d9mr19131357edq.283.1636970434974; 
 Mon, 15 Nov 2021 02:00:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIYDo0HnwORDkA7e6HJUlkYSsCnQGMfPCbAszG0X8iu8kYwAuhluGwUqNQaKApYAi0S6Ovow==
X-Received: by 2002:a50:fb09:: with SMTP id d9mr19131328edq.283.1636970434816; 
 Mon, 15 Nov 2021 02:00:34 -0800 (PST)
Received: from steredhat (host-87-10-72-39.retail.telecomitalia.it.
 [87.10.72.39])
 by smtp.gmail.com with ESMTPSA id k9sm7099513edo.87.2021.11.15.02.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 02:00:34 -0800 (PST)
Date: Mon, 15 Nov 2021 11:00:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: yadong.qi@intel.com
Subject: Re: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Message-ID: <20211115100031.x2qmoi7f5e2rrtbl@steredhat>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211115045200.3567293-3-yadong.qi@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org, mst@redhat.com,
 luhai.chen@intel.com, qemu-devel@nongnu.org, kai.z.wang@intel.com,
 hreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 12:52:00PM +0800, yadong.qi@intel.com wrote:
>From: Yadong Qi <yadong.qi@intel.com>
>
>Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
>Add new virtio command: VIRTIO_BLK_T_SECDISCARD.

Has a proposal been sent out yet to virtio-comment mailing list for 
discussing these specification changes?

>
>This feature is disabled by default, it will check the backend
>bs->open_flags & BDRV_O_SECDISCARD, enable it if BDRV_O_SECDISCARD
>is supported.
>
>Signed-off-by: Yadong Qi <yadong.qi@intel.com>
>---
> hw/block/virtio-blk.c                       | 26 +++++++++++++++++----
> include/standard-headers/linux/virtio_blk.h |  4 ++++
> 2 files changed, 26 insertions(+), 4 deletions(-)
>
>diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>index dbc4c5a3cd..7bc3484521 100644
>--- a/hw/block/virtio-blk.c
>+++ b/hw/block/virtio-blk.c
>@@ -536,7 +536,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
> }
>
> static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
>-    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes)
>+    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes,
>+    bool is_secdiscard)

Since the function now handles 3 commands, I'm thinking if it's better 
to pass the command directly and then make a switch instead of using 2 
booleans.

> {
>     VirtIOBlock *s = req->dev;
>     VirtIODevice *vdev = VIRTIO_DEVICE(s);
>@@ -577,8 +578,8 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
>         goto err;
>     }
>
>+    int blk_aio_flags = 0;

Maybe better to move it to the beginning of the function.

>     if (is_write_zeroes) { /* VIRTIO_BLK_T_WRITE_ZEROES */
>-        int blk_aio_flags = 0;
>
>         if (flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
>             blk_aio_flags |= BDRV_REQ_MAY_UNMAP;
>@@ -600,7 +601,12 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
>             goto err;
>         }
>
>-        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes, 0,
>+        if (is_secdiscard) {
>+            blk_aio_flags |= BDRV_REQ_SECDISCARD;
>+        }
>+
>+        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes,
>+                         blk_aio_flags,
>                          virtio_blk_discard_write_zeroes_complete, req);
>     }
>
>@@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>     unsigned out_num = req->elem.out_num;
>     VirtIOBlock *s = req->dev;
>     VirtIODevice *vdev = VIRTIO_DEVICE(s);
>+    bool is_secdiscard = false;
>
>     if (req->elem.out_num < 1 || req->elem.in_num < 1) {
>         virtio_error(vdev, "virtio-blk missing headers");
>@@ -722,6 +729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>      * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
>      * so we must mask it for these requests, then we will check if it is set.
>      */
>+    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
>+        is_secdiscard = true;
>+        __attribute__((fallthrough));

We can use QEMU_FALLTHROUGH here.

>     case VIRTIO_BLK_T_DISCARD & ~VIRTIO_BLK_T_OUT:
>     case VIRTIO_BLK_T_WRITE_ZEROES & ~VIRTIO_BLK_T_OUT:
>     {
>@@ -752,7 +762,8 @@ static int virtio_blk_handle_request(VirtIOBlockReq 
>*req, MultiReqBuffer *mrb)
>         }
>
>         err_status = virtio_blk_handle_discard_write_zeroes(req, &dwz_hdr,
>-                                                            is_write_zeroes);
>+                                                            is_write_zeroes,
>+                                                            is_secdiscard);
>         if (err_status != VIRTIO_BLK_S_OK) {
>             virtio_blk_req_complete(req, err_status);
>             virtio_blk_free_request(req);
>@@ -1201,6 +1212,11 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
>         return;
>     }
>
>+    if (blk_get_flags(conf->conf.blk) & BDRV_O_SECDISCARD)
>+        virtio_add_feature(&s->host_features, 
>VIRTIO_BLK_F_SECDISCARD);
>+    else
>+        virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_SECDISCARD);
>+

IIUC here we set or not the feature if BDRV_O_SECDISCARD is set.

Should we keep it disabled if "secdiscard" is false? (e.g. to avoid 
migration problems)

Otherwise what is the purpose of the "secdiscard" property?

Thanks,
Stefano


