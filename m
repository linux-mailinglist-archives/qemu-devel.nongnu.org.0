Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4C6A9A14
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:00:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6sa-0005i7-1x; Fri, 03 Mar 2023 09:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY6sN-0005gR-Sw
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY6sL-0000B4-UA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677855551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAq+fFFmDt0CkjXiAUWO259iK81GQpOipdczOctdXtQ=;
 b=Kyp1GvLhIUZur2gH/HdTRL4S2ES7RX81/Ke8gxOxUW/UXcnyrV9jM+meIMg7ADXGJpEGBN
 lNu589EpW9rgEw4QRS87FiWjbZ2w49HWRT39Z8ropeem/iUiVZvJYuhjVRVmF3DNWnsnWg
 hdoqK4aymzM7I/NxRoM6iBmAwD2Aujc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-YFRT3CE6OnebamSWEsXtfQ-1; Fri, 03 Mar 2023 09:59:10 -0500
X-MC-Unique: YFRT3CE6OnebamSWEsXtfQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-536bbaa701aso26791427b3.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:59:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677855550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAq+fFFmDt0CkjXiAUWO259iK81GQpOipdczOctdXtQ=;
 b=G7m4KB0b7/wLpa1vmBCfkjLQYwrITQzjD0WHrhfwdyMqpY+RqvRv9TjwP7D3ELvoI7
 HiiAMuMGKniEG67Nznxrkg6hJIXu0YnmAPJhuDKFi/+HUueymE9qjXSBpN9h3kbfxSW0
 QR1rIYdRfgRKdELUScSoSTKShKTmaWthNwEO+m7WpqxbzWgKPcxfJjtZ8qH4GIuNckow
 XDweVOW99Y7qq70MYuR/3YxEZ3z0K5+sh/gi7dnjcQ6Tu5Uy/dmmPr/mWHlvq9gF69gv
 rkBOVGCehISCDpJ65P1Dn98MYZKHijVFdUlzuQT3WVKV3yb9aijOGuVH7A2a8Wl5Q+2U
 Q/Vg==
X-Gm-Message-State: AO0yUKV53kZt07Zv6D4JCZy0r8BG1s4RlNcYzK+BbSAzAR/PE58uyQ1w
 FguBS1hh8nrC9h17nfGpyokfkNraNzd+/cGIb7m6AtABRPBsvcQoL8i1eRcQbo2SOJZ7OMyURgj
 5H+rWcj6vNb2UYMt6VK8kdOe+k9j29mk=
X-Received: by 2002:a81:4521:0:b0:53c:70a4:bca2 with SMTP id
 s33-20020a814521000000b0053c70a4bca2mr1172111ywa.6.1677855548419; 
 Fri, 03 Mar 2023 06:59:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9ofglATmLerJi9qzEvVgyA2cRdiPNpsKthtY5OJl/g6nyBF5HhypTguYagwHzWJdW6a/nDQyHRuFVuaKf4N4I=
X-Received: by 2002:a81:4521:0:b0:53c:70a4:bca2 with SMTP id
 s33-20020a814521000000b0053c70a4bca2mr1172084ywa.6.1677855547940; Fri, 03 Mar
 2023 06:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20230303115810.7482-1-gautam.dawar@amd.com>
In-Reply-To: <20230303115810.7482-1-gautam.dawar@amd.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 15:58:32 +0100
Message-ID: <CAJaqyWcK8CPmrVckC+29QEfmAWNZpSNBmptOfGs=qvGnOiUjJg@mail.gmail.com>
Subject: Re: [PATCH] vdpa: fix emulated guest announce feature status handling
To: Gautam Dawar <gautam.dawar@amd.com>
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org, 
 linux-net-drivers@amd.com, harpreet.anand@amd.com, tanuj.kamde@amd.com, 
 koushik.dutta@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Mar 3, 2023 at 12:58 PM Gautam Dawar <gautam.dawar@amd.com> wrote:
>
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

status should be updated through &in. It is declared as:
const struct iovec in = {
        .iov_base = &status,
        .iov_len = sizeof(status),
    };

And it should be filled at the end of virtio_net_handle_ctrl_iov with a call to:
    s = iov_from_buf(in_sg, in_num, 0, &status, sizeof(status));

How do you obtain different values? Maybe const optimizations is
invalid and the compiler thinks virtio_net_handle_ctrl_iov will never
change status?

Thanks!

>     virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
>     if (status != VIRTIO_NET_OK) {
>         error_report("Bad CVQ processing in model");
>     }
> Adding an optional OUT status parameter to virtio_net_handle_ctrl_iov()
> would help resolving this issue and also send the correct status
> value to the virtio-net driver.
>
> Signed-off-by: Gautam Dawar <gautam.dawar@amd.com>
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
> +                                 virtio_net_ctrl_ack *status_out)
>  {
>      VirtIONet *n = VIRTIO_NET(vdev);
>      struct virtio_net_ctrl_hdr ctrl;
> @@ -1514,6 +1515,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>      if (iov_size(in_sg, in_num) < sizeof(status) ||
>          iov_size(out_sg, out_num) < sizeof(ctrl)) {
>          virtio_error(vdev, "virtio-net ctrl missing headers");
> +       if (status_out)
> +               *status_out = status;
>          return 0;
>      }
>
> @@ -1540,6 +1543,8 @@ size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>      assert(s == sizeof(status));
>
>      g_free(iov2);
> +    if (status_out)
> +           *status_out = status;
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
> +                                 virtio_net_ctrl_ack *status);
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
>


