Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF486A9725
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4Le-0005NA-Dw; Fri, 03 Mar 2023 07:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY4LX-0005Mw-4b
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:17:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pY4LU-0005yP-Rp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677845827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WIIoV7rKSvMTlAkvUUfgNrG1KGxizg7annGLPQSMT8c=;
 b=C7GwWNNNPO0Hzfh3ZGl3UCjLRZDiggO/Dr18+HGkr2eInWSdfEdw+ebG9zjiQ5XZsvKa5U
 HW1pg9VRGBmDOjawCGAYuh6TxKX4Awlhmdsn3QBa2Zcu2xo8FSuv2BaQZ7dG7SvV2CLwmL
 UCgn7+6QsIyyEpr4afnveOqiEKLKGjI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-6u3iVkAYMym_JxTVabVUSg-1; Fri, 03 Mar 2023 07:17:06 -0500
X-MC-Unique: 6u3iVkAYMym_JxTVabVUSg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so860708wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677845825;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIIoV7rKSvMTlAkvUUfgNrG1KGxizg7annGLPQSMT8c=;
 b=HAueBxNSDjEu10Ak7WJpMvamtlXCQrnIeV9vF0haZH7AeIHpMeOtGc0klXOX84mYiu
 lbJ00k26XCe8yoMs+0mf02LJ7zT3CW1FCEWR/7849knjXWlEFUVuZHGaDfCuywShFLS7
 +fEPBy2QSkvB7FEC78k4S6F/K9Y+oGvI6Ly9x5Qpw6x07NDjp88CaDariudUqUyUHdq/
 QN2G3QKK1ihU+lXJWfL9bZa+a0VbX+/PhsBZ5hPRvwFyxb2i1BnZkgJq5QgtZd3ZdizN
 MgAwoaLY+NrQPd5H0MSKIObU4d0RB3ghKpBVufQEr7w8ClBb0FgxrTGQKjLXAt81FDNP
 43Kw==
X-Gm-Message-State: AO0yUKU6k2uFCSq7pV5gdmVf3XUW1R7nZJZnPEfyGDW9wP3SOBnm/LOj
 SiGsSiSxgI5rvfijzIZ94w/Y3v7Tn8zLovcbale1bMLHnMrbXfiGgx9FY75kxa6d2t8++Q5CWqw
 lFddnWnoxGrIJdzM=
X-Received: by 2002:a05:600c:3153:b0:3eb:2708:86ca with SMTP id
 h19-20020a05600c315300b003eb270886camr1495772wmo.28.1677845825518; 
 Fri, 03 Mar 2023 04:17:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+MbFFwZknJbCPR/htGec1n+z4jQpQ87lWfocKqS57qfGVrbbOdhYST7dzisPeSjFJRuKF42A==
X-Received: by 2002:a05:600c:3153:b0:3eb:2708:86ca with SMTP id
 h19-20020a05600c315300b003eb270886camr1495757wmo.28.1677845825195; 
 Fri, 03 Mar 2023 04:17:05 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1ccc06000000b003e118684d56sm5817345wmb.45.2023.03.03.04.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:17:04 -0800 (PST)
Date: Fri, 3 Mar 2023 07:17:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gautam Dawar <gautam.dawar@amd.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 linux-net-drivers@amd.com, harpreet.anand@amd.com,
 tanuj.kamde@amd.com, koushik.dutta@amd.com
Subject: Re: [PATCH] vdpa: fix emulated guest announce feature status handling
Message-ID: <20230303071555-mutt-send-email-mst@kernel.org>
References: <20230303115810.7482-1-gautam.dawar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303115810.7482-1-gautam.dawar@amd.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 03, 2023 at 05:28:10PM +0530, Gautam Dawar wrote:
> Guest announce capability is emulated by qemu in the .avail_handler
> shadow virtqueue operation. It updates the status to success in
> `*s->status` but incorrectly fetches the command execution
> status from local variable `status` later in call to iov_from_buf().
> As `status` is initialized to VIRTIO_NET_ERR, it results in a
> warning "Failed to ack link announce" in virtio_net driver's
> virtnet_ack_link_announce() function after VM Live Migration.
> Also, I noticed an invalid check in vhost_vdpa_net_handle_ctrl_avail()
> that reports an error because status is not updated in call to
> virtio_net_handle_ctrl_iov():
> 
>     virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
>     if (status != VIRTIO_NET_OK) {
>         error_report("Bad CVQ processing in model");
>     }
> Adding an optional OUT status parameter to virtio_net_handle_ctrl_iov()
> would help resolving this issue and also send the correct status
> value to the virtio-net driver.
> 
> Signed-off-by: Gautam Dawar <gautam.dawar@amd.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

Jason your tree right?

> ---
>  hw/net/virtio-net.c            | 9 +++++++--
>  include/hw/virtio/virtio-net.h | 3 ++-
>  net/vhost-vdpa.c               | 3 +--
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..36a75592da 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1503,7 +1503,8 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
>  size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>                                    const struct iovec *in_sg, unsigned in_num,
>                                    const struct iovec *out_sg,
> -                                  unsigned out_num)
> +                                  unsigned out_num,
> +				  virtio_net_ctrl_ack *status_out)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
>      struct virtio_net_ctrl_hdr ctrl;
> @@ -1514,6 +1515,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>      if (iov_size(in_sg, in_num) < sizeof(status) ||
>          iov_size(out_sg, out_num) < sizeof(ctrl)) {
>          virtio_error(vdev, "virtio-net ctrl missing headers");
> +	if (status_out)
> +		*status_out = status;
>          return 0;
>      }
>  
> @@ -1540,6 +1543,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>      assert(s == sizeof(status));
>  
>      g_free(iov2);
> +    if (status_out)
> +	    *status_out = status;
>      return sizeof(status);
>  }
>  
> @@ -1555,7 +1560,7 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>          }
>  
>          written = virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem->in_num,
> -                                             elem->out_sg, elem->out_num);
> +                                             elem->out_sg, elem->out_num, NULL);
>          if (written > 0) {
>              virtqueue_push(vq, elem, written);
>              virtio_notify(vdev, vq);
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index ef234ffe7e..da76cc414d 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -224,7 +224,8 @@ struct VirtIONet {
>  size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>                                    const struct iovec *in_sg, unsigned in_num,
>                                    const struct iovec *out_sg,
> -                                  unsigned out_num);
> +                                  unsigned out_num,
> +				  virtio_net_ctrl_ack *status);
>  void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>                                     const char *type);
>  
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index de5ed8ff22..c72b338633 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -638,8 +638,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>          return VIRTIO_NET_ERR;
>      }
>  
> -    status = VIRTIO_NET_ERR;
> -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1, &status);
>      if (status != VIRTIO_NET_OK) {
>          error_report("Bad CVQ processing in model");
>      }
> -- 
> 2.30.1


