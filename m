Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1A24502F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:59:14 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZhh-0000Ty-HO
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmZgJ-0007TX-Gf
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmZgH-0004fL-0n
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636973863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhWZqrI4Te9nPt/v3moByjyMhqBdAn3rxmGHqaPsCCE=;
 b=LxaXFpYuHBRAZJkktFXTklTQyH6LBKL7J7Hqe8rBwjRhDFdTUbHJrbBWX4Kkt4u0CoBwfJ
 /L4b12A49bSgC9ZKdxM3B6qbJuGNWpkc3J+wUHnlhJ2+oIE47Ow2YPdO3ftcadOFMOaFvP
 em0BNIzEFErH4Pa2BYiPNLo0Y9DMygs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-RWTUnP5GMfKPDbKRXfKAEQ-1; Mon, 15 Nov 2021 05:57:40 -0500
X-MC-Unique: RWTUnP5GMfKPDbKRXfKAEQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 w14-20020adfbace000000b001884bf6e902so3403115wrg.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KhWZqrI4Te9nPt/v3moByjyMhqBdAn3rxmGHqaPsCCE=;
 b=2giF/AawOwBq5IT1CGLP+HkYH0sRjFajXEfirYxjuxRTdI6sI7I44gN6k1TxFK/Nug
 rMQ3HGFdVKqyh9RlVKeMjr9R0MGQmyyqmtY2XeU3GJmtLiDe8tksR/aR7Qyt4x7tf/kI
 mQ1DzT02qhqBKr3LoZ1iShB3QJKX9gr9PPRgh9qVCZiUbKA8mJBhesU5yOqsHj+SVOBW
 P1/lV+Js63oqJN/VpAwlCyQ6mrdW5HDK7/ns3cVoJvP2SKJX0noYDyHxqjm2yAewa3E9
 g/8E5t4W1Gn0J9QWn7Lkik0uuBDwM9UiACh73NUr7glli55ZMF7d5lV2ztVIPQ6aDNvT
 ndYg==
X-Gm-Message-State: AOAM532jnHYWAJRfjBSQ7pacW/WJodosisWmHfPxTYbivzxJw6Py60n6
 8Jij7AG7yB8KpOHEdXCOBs5XeLFeGz1KeNKJQbLvKK7oDThsRWxCMB8aA153zZ3KBvXulys40aZ
 uHo+QlhsbS6crNqw=
X-Received: by 2002:a5d:5186:: with SMTP id k6mr46923006wrv.146.1636973859327; 
 Mon, 15 Nov 2021 02:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx11rRXGsUV/MgtKUeVsCUULwhQYzjv/GPqyIBkWQPGvdsKhG9Gx/hzSfYGCkA1ItK3wXgpLQ==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr46922975wrv.146.1636973859146; 
 Mon, 15 Nov 2021 02:57:39 -0800 (PST)
Received: from redhat.com ([2.55.156.154])
 by smtp.gmail.com with ESMTPSA id d7sm13786955wrw.87.2021.11.15.02.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 02:57:38 -0800 (PST)
Date: Mon, 15 Nov 2021 05:57:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: yadong.qi@intel.com
Subject: Re: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Message-ID: <20211115055630-mutt-send-email-mst@kernel.org>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211115045200.3567293-3-yadong.qi@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 luhai.chen@intel.com, qemu-devel@nongnu.org, kai.z.wang@intel.com,
 hreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 12:52:00PM +0800, yadong.qi@intel.com wrote:
> From: Yadong Qi <yadong.qi@intel.com>
> 
> Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
> Add new virtio command: VIRTIO_BLK_T_SECDISCARD.
> 
> This feature is disabled by default, it will check the backend
> bs->open_flags & BDRV_O_SECDISCARD, enable it if BDRV_O_SECDISCARD
> is supported.
> 
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
>  hw/block/virtio-blk.c                       | 26 +++++++++++++++++----
>  include/standard-headers/linux/virtio_blk.h |  4 ++++


Any changes to standard headers need to go to linux and virtio TC.

>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index dbc4c5a3cd..7bc3484521 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -536,7 +536,8 @@ static bool virtio_blk_sect_range_ok(VirtIOBlock *dev,
>  }
>  
>  static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
> -    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes)
> +    struct virtio_blk_discard_write_zeroes *dwz_hdr, bool is_write_zeroes,
> +    bool is_secdiscard)
>  {
>      VirtIOBlock *s = req->dev;
>      VirtIODevice *vdev = VIRTIO_DEVICE(s);
> @@ -577,8 +578,8 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
>          goto err;
>      }
>  
> +    int blk_aio_flags = 0;
>      if (is_write_zeroes) { /* VIRTIO_BLK_T_WRITE_ZEROES */
> -        int blk_aio_flags = 0;
>  
>          if (flags & VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP) {
>              blk_aio_flags |= BDRV_REQ_MAY_UNMAP;
> @@ -600,7 +601,12 @@ static uint8_t virtio_blk_handle_discard_write_zeroes(VirtIOBlockReq *req,
>              goto err;
>          }
>  
> -        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes, 0,
> +        if (is_secdiscard) {
> +            blk_aio_flags |= BDRV_REQ_SECDISCARD;
> +        }
> +
> +        blk_aio_pdiscard(s->blk, sector << BDRV_SECTOR_BITS, bytes,
> +                         blk_aio_flags,
>                           virtio_blk_discard_write_zeroes_complete, req);
>      }
>  
> @@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>      unsigned out_num = req->elem.out_num;
>      VirtIOBlock *s = req->dev;
>      VirtIODevice *vdev = VIRTIO_DEVICE(s);
> +    bool is_secdiscard = false;
>  
>      if (req->elem.out_num < 1 || req->elem.in_num < 1) {
>          virtio_error(vdev, "virtio-blk missing headers");
> @@ -722,6 +729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch statement,
>       * so we must mask it for these requests, then we will check if it is set.
>       */
> +    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
> +        is_secdiscard = true;
> +        __attribute__((fallthrough));
>      case VIRTIO_BLK_T_DISCARD & ~VIRTIO_BLK_T_OUT:
>      case VIRTIO_BLK_T_WRITE_ZEROES & ~VIRTIO_BLK_T_OUT:
>      {
> @@ -752,7 +762,8 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>          }
>  
>          err_status = virtio_blk_handle_discard_write_zeroes(req, &dwz_hdr,
> -                                                            is_write_zeroes);
> +                                                            is_write_zeroes,
> +                                                            is_secdiscard);
>          if (err_status != VIRTIO_BLK_S_OK) {
>              virtio_blk_req_complete(req, err_status);
>              virtio_blk_free_request(req);
> @@ -1201,6 +1212,11 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (blk_get_flags(conf->conf.blk) & BDRV_O_SECDISCARD)
> +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_SECDISCARD);
> +    else
> +        virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_SECDISCARD);
> +
>      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_WRITE_ZEROES) &&
>          (!conf->max_write_zeroes_sectors ||
>           conf->max_write_zeroes_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> @@ -1307,6 +1323,8 @@ static Property virtio_blk_properties[] = {
>                       conf.report_discard_granularity, true),
>      DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
>                        VIRTIO_BLK_F_WRITE_ZEROES, true),
> +    DEFINE_PROP_BIT64("secdiscard", VirtIOBlock, host_features,
> +                      VIRTIO_BLK_F_SECDISCARD, false),
>      DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
>                         conf.max_discard_sectors, BDRV_REQUEST_MAX_SECTORS),
>      DEFINE_PROP_UINT32("max-write-zeroes-sectors", VirtIOBlock,
> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
> index 2dcc90826a..c55a07840c 100644
> --- a/include/standard-headers/linux/virtio_blk.h
> +++ b/include/standard-headers/linux/virtio_blk.h
> @@ -40,6 +40,7 @@
>  #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
>  #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
>  #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
> +#define VIRTIO_BLK_F_SECDISCARD	15	/* WRITE ZEROES is supported */

Surely not.


>  
>  /* Legacy feature bits */
>  #ifndef VIRTIO_BLK_NO_LEGACY
> @@ -153,6 +154,9 @@ struct virtio_blk_config {
>  /* Write zeroes command */
>  #define VIRTIO_BLK_T_WRITE_ZEROES	13
>  
> +/* Secure discard command */
> +#define VIRTIO_BLK_T_SECDISCARD	14
> +
>  #ifndef VIRTIO_BLK_NO_LEGACY
>  /* Barrier before this op. */
>  #define VIRTIO_BLK_T_BARRIER	0x80000000
> -- 
> 2.25.1


