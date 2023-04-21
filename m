Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5226EA345
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:40:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjV4-0007Mm-C4; Fri, 21 Apr 2023 01:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppjUy-0007MV-CV
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppjUw-0004TB-3X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682055591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a44l6hTEdflS+C4yNr+KJLVyFAATik9ivkjWBIP+qYc=;
 b=clNqlhgrI6thqEON1KOCLMnMsgFE2Fjp8Vl8QBU5EtzZ77QcsuI8NVv7KUI3Tg+vXmOVmc
 sxsOFxCHADeS6DoAvPKlmcdnm/7xNVFegIFc4BrJqQvCHTn4s41kwjUG3SBq86q3tYN8e/
 Hx+XawYAmIg25kZo42kT26hS+09qBeI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-YUxefSwMOBuMYKJZB2G54A-1; Fri, 21 Apr 2023 01:39:49 -0400
X-MC-Unique: YUxefSwMOBuMYKJZB2G54A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1754de18cso8096185e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682055588; x=1684647588;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a44l6hTEdflS+C4yNr+KJLVyFAATik9ivkjWBIP+qYc=;
 b=Zto1ONmk/2RjSeZRzTTHp+JGLhlri8fgz2n4p3fhQhj/v313OrYUdBMMVLYW4TKiwl
 AvGMkqPMYLfl+FF7mAGTM5QWaNlsvf80HuqgIGIyJJbd2t+tszFbMtWfcfiLmQ85pJ09
 zTSlXEwSogl0vtmIZY8RLcaAg5zoed1tLlWvDzhz7wY3DIXia/C9W7glEnb9rmpoI/gg
 a4yMS4Ziu6pxTgy23KuqYozkBZkD7W8rmKebhc8f74N3BDwk6KIGagKOUb9o9el2rM3g
 SzdlPU/08g+2uKyCcmCOSo0Sx5v1MfNO+CQ6QDvfpYnZbKBOwQlY/GBH/0bf6IyxmsJ0
 3a6w==
X-Gm-Message-State: AAQBX9dFQFIk56IBm2881dRVC/mSlDLWZK6Z2pQmgHkC80Oq6rKtVwy7
 d/fT6LNh8uCH3KZnc2xqllq6zy/eIBS1aXX3WPwllzW7Bm0aHVESsu810J0spz84oAhCVf/TZNB
 nZOWR30LzRYg7FpulWPrfDQ30qy0c
X-Received: by 2002:a7b:ca4a:0:b0:3f1:72ec:4015 with SMTP id
 m10-20020a7bca4a000000b003f172ec4015mr850713wml.13.1682055588014; 
 Thu, 20 Apr 2023 22:39:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCromz1rJc7KmYxcuyi7q1zAoxFjK53pNdbRbp9Dglb9og4uPjHLK1jtt+q2HOAGk4Fpwhog==
X-Received: by 2002:a7b:ca4a:0:b0:3f1:72ec:4015 with SMTP id
 m10-20020a7bca4a000000b003f172ec4015mr850702wml.13.1682055587685; 
 Thu, 20 Apr 2023 22:39:47 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003ee5fa61f45sm7248502wmq.3.2023.04.20.22.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:39:47 -0700 (PDT)
Date: Fri, 21 Apr 2023 01:39:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
Message-ID: <20230421013936-mutt-send-email-mst@kernel.org>
References: <20230420130706.541219-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420130706.541219-1-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 20, 2023 at 09:07:06AM -0400, Stefan Hajnoczi wrote:
> Setting the VIRTIO Device Status Field to 0 resets the device. The
> device's state is lost, including the vring configuration.
> 
> vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
> risks confusion about the lifetime of the vhost-user state (e.g. vring
> last_avail_idx) across VIRTIO device reset.
> 
> Eugenio Pérez <eperezma@redhat.com> adjusted the order for vhost-vdpa.c
> in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
> and in that commit description suggested doing the same for vhost-user
> in the future.
> 
> Go ahead and adjust vhost-user.c now. I ran various online code searches
> to identify vhost-user backends implementing SET_STATUS. It seems only
> DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
> confirmed that it is safe to make this change.


Fixes tag?

> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..2d40b1b3e7 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2677,10 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>                                            VIRTIO_CONFIG_S_DRIVER |
>                                            VIRTIO_CONFIG_S_DRIVER_OK);
>      } else {
> -        return vhost_user_set_status(dev, 0);
> +        return 0;
>      }
>  }
>  
> +static void vhost_user_reset_status(struct vhost_dev *dev)
> +{
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return;
> +    }
> +
> +    vhost_user_set_status(dev, 0);
> +}
> +
>  const VhostOps user_ops = {
>          .backend_type = VHOST_BACKEND_TYPE_USER,
>          .vhost_backend_init = vhost_user_backend_init,
> @@ -2716,4 +2726,5 @@ const VhostOps user_ops = {
>          .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>          .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
>          .vhost_dev_start = vhost_user_dev_start,
> +        .vhost_reset_status = vhost_user_reset_status,
>  };
> -- 
> 2.39.2


