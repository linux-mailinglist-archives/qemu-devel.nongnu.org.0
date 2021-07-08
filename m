Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1333BF9DB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:09:30 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SqP-0008EI-C9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Slx-0004vt-Bp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Slu-0004ZJ-Bb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625745889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRS4/eLeI02J0YzCX+YyQVmb+bnc1QjFvJ5yqczr/lM=;
 b=Xfu6zAfgRSbBUrcyMLh43MVxp8V996VoNoQ59BGKINzoE5StLyiB8QvZGIbfu+RgNGhZdA
 WyxZgYkMwlVZIod3oAIwXbbqHjeJWgJyTENe7TaekORRItOIKzvZVrmiFtg+Jj/YKspqSA
 yyFmGYsyLjORLNz253sYeMjt52Spi/A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-3JaK1wpSN2eVckNu3oAZdg-1; Thu, 08 Jul 2021 08:04:48 -0400
X-MC-Unique: 3JaK1wpSN2eVckNu3oAZdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p9-20020a7bcc890000b02902190142995dso444325wma.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NRS4/eLeI02J0YzCX+YyQVmb+bnc1QjFvJ5yqczr/lM=;
 b=l0mPAHjZ8icOcjnKr0QYkNbV8uVmQbt/tgWFOfieV/so0yylVDj6ztk0IRE8AvhP1N
 pSRdJTgIf5Q2nSEL+qNOLyZuQib3VUVMvb5W1dwvNClVb79wWpiD/npVviTWwm3uBrT0
 chrnG9qVmMia2zgrYOVi6YXyXa23iBX+qBlNXT8L6KzIvuNODFro6UoiHIjxO9Yu1ayX
 02dWEmVXAy/VNqJxVLUE0BLkFh1Xv368PVtHt74h4vbr6tIpri+7tNGikQbD6ndg7IYr
 ouCMOlibIpw0c1R9FJqUwZQ6JNiQE7V3CFuLcpqUwVqFniEdgCdQ369M153TjMkZYI1l
 lifw==
X-Gm-Message-State: AOAM531eRIFSskMfpnvb8Wi69vaeFBcq9MZkvg0oa+e/Oi7b5LyvC5tI
 pkObui126g+khWaniFNeUcf96KDVFX05hlFafSPowgaWHe1ePCC2HHyw4WS0moRBsA5kFyzBoDj
 WYNiQu6Sr1yjIf88=
X-Received: by 2002:a5d:6984:: with SMTP id g4mr3413939wru.381.1625745887443; 
 Thu, 08 Jul 2021 05:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT2c61ZBMUe+7VQv78vMZSoddC9NS2gdgiQcLJ1k+4X2kPMtF4M4298RMm+w/AGL8e1JEX+Q==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr3413918wru.381.1625745887267; 
 Thu, 08 Jul 2021 05:04:47 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id n12sm2118480wmq.5.2021.07.08.05.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:04:46 -0700 (PDT)
Date: Thu, 8 Jul 2021 08:04:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Message-ID: <20210708080209-mutt-send-email-mst@kernel.org>
References: <20210708082840.12428-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210708082840.12428-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 11:28:40AM +0300, Denis Plotnikov wrote:
> On vhost-user-blk migration, qemu normally sends a number of commands
> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
> data logging.
> The issue is that qemu doesn't wait for reply from the vhost daemon
> for these commands which may result in races between qemu expectation
> of logging starting and actual login starting in vhost daemon.
> 
> The race can appear as follows: on migration setup, qemu enables dirty page
> logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
> vhost-user-blk daemon immediately and the daemon needs some time to turn the
> logging on internally. If qemu doesn't wait for reply, after sending the
> command, qemu may start migrate memory pages to a destination. At this time,
> the logging may not be actually turned on in the daemon but some guest pages,
> which the daemon is about to write to, may have already been transferred
> without logging to the destination. Since the logging wasn't turned on,
> those pages won't be transferred again as dirty. So we may end up with
> corrupted data on the destination.
> The same scenario is applicable for "used ring" data logging, which is
> turned on with VHOST_USER_SET_VRING_ADDR command.
> 
> To resolve this issue, this patch makes qemu wait for the commands result
> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/virtio/vhost-user.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe04526..15b5fac67cf3 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>          .hdr.size = sizeof(msg.payload.addr),
>      };
>  
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +    if (reply_supported) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +    }
> +
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
>      }
>  
> +    if (reply_supported) {
> +        return process_message_reply(dev, &msg);
> +    }
> +
>      return 0;
>  }
>  

Same - can we limit this to when logging is being enabled?

> @@ -1288,7 +1298,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>      return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>  }
>  
> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
> +                              bool need_reply)
>  {
>      VhostUserMsg msg = {
>          .hdr.request = request,
> @@ -1297,23 +1308,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>          .hdr.size = sizeof(msg.payload.u64),
>      };
>  
> +    if (need_reply) {
> +        bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +        if (reply_supported) {
> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +        }
> +    }
> +
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
>      }
>  
> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> +        return process_message_reply(dev, &msg);
> +    }
> +
>      return 0;
>  }
>  
>  static int vhost_user_set_features(struct vhost_dev *dev,
>                                     uint64_t features)
>  {
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> +                              true);
>  }
>  

Same here. In fact, 

>  static int vhost_user_set_protocol_features(struct vhost_dev *dev,
>                                              uint64_t features)
>  {
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
> +                              false);
>  }
>  
>  static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
> -- 
> 2.25.1


