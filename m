Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C527C3DF119
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:09:34 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw2v-0003ns-Dj
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAvz3-0008AI-UK
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAvz2-00045X-AG
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CElbPASGX7bdoRSks7xbjow+EdDeWChu+Mv5aJUBwkA=;
 b=WiMEm7Y2Q2wkjHcKm+PcyR4M8ujddJsooJjD/7YEgiOOgB4LFCSqr1a18LJXOCcu+Zv10w
 q6cNAe3KmOCBRJ5PtPbBurHEPDrH99Sj97/JffOnMLam448/jsCbEymLfEp9Yj7nG3cwKB
 tFCxzdMofXEUtwoYBJQf6zVUHUpi59s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-5fFipsNlM2Gi24Yu_bgJMw-1; Tue, 03 Aug 2021 11:05:30 -0400
X-MC-Unique: 5fFipsNlM2Gi24Yu_bgJMw-1
Received: by mail-ed1-f71.google.com with SMTP id
 d12-20020a50fe8c0000b02903a4b519b413so10600186edt.9
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CElbPASGX7bdoRSks7xbjow+EdDeWChu+Mv5aJUBwkA=;
 b=FaKKVw9EMc7N8PyILo7xfujyBpEWRX/lc1DcEi3ZumlIuXAkftbOq+zKCCPmWaN3QR
 z2UX64MY3hCBFPxEndpxznnwJihydLYZxinpjupAonUO9LiqlRwTbRdrN8cBAolvyJpT
 DCVVpJEqUVgT9PeHKJ7PihwLespBKFPPKEwWIZaynio8cSfpoIhSnpT6yWVdCclIHZKU
 mGWmq+EOKg8r9pNljDJXTuT5WSpqQnYSj99W3axF9a7927fJ7p8IQTpqHX45BLAxDxaA
 pXEpOHH2Ng08lis5dnkPyHykDlBKilkR5gdiDcZOpk7CTGdEvwWyudaOM74O9nygyV0q
 nnNw==
X-Gm-Message-State: AOAM530h2IKFU7tJzwqPtpa9KHpnRMP53R6gPczDh69Yjy76+fIfOfPD
 riWiUXe26660vZfi85jaX1RxBrlBrQxV+9ScJ+OE8mgazHYGa2xcpgojJtCANXtPf0mCZ1/T1Ea
 lLBE+ZLPm3M728Ss=
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr15726713edz.199.1628003128775; 
 Tue, 03 Aug 2021 08:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz74OIqpXWIdUNgW55sYbhNdzld36v3bQP9wgiTL+CvasnXc8bXJMHPOYnxSNuWtgDGCU6BLw==
X-Received: by 2002:a05:6402:95c:: with SMTP id
 h28mr15726678edz.199.1628003128530; 
 Tue, 03 Aug 2021 08:05:28 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id bd24sm8185025edb.56.2021.08.03.08.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:05:27 -0700 (PDT)
Date: Tue, 3 Aug 2021 11:05:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v2] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Message-ID: <20210803105909-mutt-send-email-mst@kernel.org>
References: <20210719142138.24543-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210719142138.24543-1-den-plotnikov@yandex-team.ru>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Jul 19, 2021 at 05:21:38PM +0300, Denis Plotnikov wrote:
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
> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
> logging is enabled.
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
> v1 -> v2:
>   * send reply only when logging is enabled [mst]
> 
> v0 -> v1:
>   * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
>   
>  hw/virtio/vhost-user.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe04526..133588b3961e 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1095,6 +1095,11 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
>      return 0;
>  }
>  
> +static bool log_enabled(uint64_t features)
> +{
> +    return !!(features & (0x1ULL << VHOST_F_LOG_ALL));
> +}
> +
>  static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>                                       struct vhost_vring_addr *addr)
>  {
> @@ -1105,10 +1110,21 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
>          .hdr.size = sizeof(msg.payload.addr),
>      };
>  
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +
> +    if (reply_supported && log_enabled(msg.hdr.flags)) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
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

OK this is good, but the problem is that we then still have a race
if VHOST_USER_PROTOCOL_F_REPLY_ACK is not set. Bummer.

Let's send VHOST_USER_GET_FEATURES in this case to flush out outstanding
messages?

  
> @@ -1288,7 +1304,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>      return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>  }
>  
> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
> +                              bool need_reply)
>  {
>      VhostUserMsg msg = {
>          .hdr.request = request,
> @@ -1297,23 +1314,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
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
> +                              log_enabled(features));
>  }
>  
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


