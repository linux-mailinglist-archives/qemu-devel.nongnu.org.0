Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6A3E42F5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:36:22 +0200 (CEST)
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1hl-0002uZ-On
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mD1fj-0000Dz-3I
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mD1fg-0008OB-TD
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628501651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xtW/iqNMAcgsnQ0jt12lsfLMOAPBFlPLWDadS/F40pY=;
 b=e5UEZdCPycgiInShNE7h+pns00VPY5DttV4i+Nb6rlW8gHgIBe+q4SeF2jlVRLCs/KqBpp
 4p3VAUjafZFi2td6nZfIuCgVSoE0l4IHaA43Uo2cbNBP/VV+sjmDGmz5eVpcSChCGnn0DT
 r6mxeb8zJdk6XWQ0dvnv5hdQx3ey5qs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Cm-tzD9FNNSzghmCkWWbuA-1; Mon, 09 Aug 2021 05:34:10 -0400
X-MC-Unique: Cm-tzD9FNNSzghmCkWWbuA-1
Received: by mail-ed1-f72.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so2577619edr.16
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xtW/iqNMAcgsnQ0jt12lsfLMOAPBFlPLWDadS/F40pY=;
 b=G09qEM5MHEC90hBrZkMFUiYFJvRZDCm9Uw1qtPN5ODvZe+99KKnrqonwwn9160zKCe
 SRMBCmi3AFLF6XDJP3ziHY4u/JCYhFUj+Xy95TXYddtXkGDCzDo/hfQazi0aaZE+NYf0
 MgTu/UDUlrbRL16iod1pEiNygzsIYyriIFu3ECrbKaatp9zdifpS/CQY0WQ2wdJb03xY
 TfiAqI3YfufJZKTwK+SllxPwq3G/ClUuHPoJmvCQxYti/DJ/xEpLIpC1qUdQpltHPVVM
 GTtD64WuW7rlZq1VETGMq9j/cB3pqnzl8t6emwXj3duBXX/MUaFtVWypKs0MvFKlFx7y
 UiVQ==
X-Gm-Message-State: AOAM533hkkMgcpwh05gkMGgV/jo29ss2252V2t7IItGSIfwx8fGGCKQT
 EGMCmiEuNPi6hvS5SCdjWHzymiWkjqnrmvfr45yeCHn/6n1rQSyff79FrwbghGN3hNU99JaOx8g
 wZA1wIzL4GWTqlHs=
X-Received: by 2002:a17:906:d04b:: with SMTP id
 bo11mr21886335ejb.513.1628501649523; 
 Mon, 09 Aug 2021 02:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Wo3vnu8NE0Aj2LI4vxWGbbLyplEyveXuWD2EKiUFYq/Q98od3cFc+RNLHJn9UZylPUvi+A==
X-Received: by 2002:a17:906:d04b:: with SMTP id
 bo11mr21886316ejb.513.1628501649284; 
 Mon, 09 Aug 2021 02:34:09 -0700 (PDT)
Received: from redhat.com ([2.55.145.148])
 by smtp.gmail.com with ESMTPSA id c28sm5696222ejc.102.2021.08.09.02.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:34:08 -0700 (PDT)
Date: Mon, 9 Aug 2021 05:34:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v3] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Message-ID: <20210809051757-mutt-send-email-mst@kernel.org>
References: <20210809090330.86304-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210809090330.86304-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Looks good. Some cosmetics:

On Mon, Aug 09, 2021 at 12:03:30PM +0300, Denis Plotnikov wrote:
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

start migrating

> the logging may not be actually turned on in the daemon but some guest pages,
> which the daemon is about to write to, may have already been transferred
> without logging to the destination. Since the logging wasn't turned on,
> those pages won't be transferred again as dirty. So we may end up with
> corrupted data on the destination.
> The same scenario is applicable for "used ring" data logging, which is
> turned on with VHOST_USER_SET_VRING_ADDR command.
> 
> To resolve this issue, this patch makes qemu wait for the commands result

command result

> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and logging enabled.

typo

> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> 
> ---
> v2 -> v3:
>   * send VHOST_USER_GET_FEATURES to flush out outstanding messages [mst]
> 
> v1 -> v2:
>   * send reply only when logging is enabled [mst]
> 
> v0 -> v1:
>   * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
> ---
>  hw/virtio/vhost-user.c | 130 ++++++++++++++++++++++++++++-------------
>  1 file changed, 89 insertions(+), 41 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe04526..18f685df549f 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1095,23 +1095,6 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
>      return 0;
>  }
>  
> -static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> -                                     struct vhost_vring_addr *addr)
> -{
> -    VhostUserMsg msg = {
> -        .hdr.request = VHOST_USER_SET_VRING_ADDR,
> -        .hdr.flags = VHOST_USER_VERSION,
> -        .payload.addr = *addr,
> -        .hdr.size = sizeof(msg.payload.addr),
> -    };
> -
> -    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
>  static int vhost_user_set_vring_endian(struct vhost_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
> @@ -1288,72 +1271,137 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
>      return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
>  }
>  
> -static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
> +
> +static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
>  {
>      VhostUserMsg msg = {
>          .hdr.request = request,
>          .hdr.flags = VHOST_USER_VERSION,
> -        .payload.u64 = u64,
> -        .hdr.size = sizeof(msg.payload.u64),
>      };
>  
> +    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
> +        return 0;
> +    }
> +
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
>      }
>  
> +    if (vhost_user_read(dev, &msg) < 0) {
> +        return -1;
> +    }
> +
> +    if (msg.hdr.request != request) {
> +        error_report("Received unexpected msg type. Expected %d received %d",
> +                     request, msg.hdr.request);
> +        return -1;
> +    }
> +
> +    if (msg.hdr.size != sizeof(msg.payload.u64)) {
> +        error_report("Received bad msg size.");
> +        return -1;
> +    }
> +
> +    *u64 = msg.payload.u64;
> +
>      return 0;
>  }
>  
> -static int vhost_user_set_features(struct vhost_dev *dev,
> -                                   uint64_t features)
> +static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
>  {
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
> +    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
>  }
>  
> -static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> -                                            uint64_t features)
> +static int enforce_reply(struct vhost_dev *dev)
>  {
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
> +   /*
> +    * we need a reply but can't get it from some command directly,

> +    * so send the command which must send a reply
> to make sure
> +    * the command we sent before is actually completed.


better:

We need to wait for a reply but the backend does not
support replies for the command we just sent.
Send VHOST_USER_GET_FEATURES which makes all backends
send a reply.


> +    */
> +    uint64_t dummy;

add an empty line here pls.

> +    return vhost_user_get_features(dev, &dummy);
>  }
>  
> -static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
> +static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> +                                     struct vhost_vring_addr *addr)
>  {
>      VhostUserMsg msg = {
> -        .hdr.request = request,
> +        .hdr.request = VHOST_USER_SET_VRING_ADDR,
>          .hdr.flags = VHOST_USER_VERSION,
> +        .payload.addr = *addr,
> +        .hdr.size = sizeof(msg.payload.addr),
>      };
>  
> -    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
> -        return 0;
> +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +
> +    /* we need a reply anyway if logging is enabled */

better:

wait for a reply if logging is enabled to make sure backend is actually logging changes.

> +    bool need_reply = !!(addr->flags & (1 << VHOST_VRING_F_LOG));


Do we really need !! here? We are converting to bool here.

> +
> +    if (reply_supported && need_reply) {
> +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
>      }
>  
>      if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
>      }
>  
> -    if (vhost_user_read(dev, &msg) < 0) {
> -        return -1;
> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> +        return process_message_reply(dev, &msg);
> +    } else if (need_reply) {
> +        return enforce_reply(dev);
>      }

This logic is repeated in two places. How about moving the call
to process_message_reply into enforce_reply?


>  
> -    if (msg.hdr.request != request) {
> -        error_report("Received unexpected msg type. Expected %d received %d",
> -                     request, msg.hdr.request);
> -        return -1;
> +    return 0;
> +}
> +
> +static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
> +                              bool need_reply)

I think a better name would be "wait_for_reply": it's less about
needing the reply it's more about the wait.

> +{
> +    VhostUserMsg msg = {
> +        .hdr.request = request,
> +        .hdr.flags = VHOST_USER_VERSION,
> +        .payload.u64 = u64,
> +        .hdr.size = sizeof(msg.payload.u64),
> +    };
> +
> +    if (need_reply) {
> +        bool reply_supported = virtio_has_feature(dev->protocol_features,
> +                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
> +        if (reply_supported) {
> +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> +        }
>      }
>  
> -    if (msg.hdr.size != sizeof(msg.payload.u64)) {
> -        error_report("Received bad msg size.");
> +    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
>          return -1;
>      }
>  
> -    *u64 = msg.payload.u64;
> +    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> +        return process_message_reply(dev, &msg);
> +    } else if (need_reply) {
> +        return enforce_reply(dev);
> +    }
>  
>      return 0;
>  }
>  
> -static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
> +static int vhost_user_set_features(struct vhost_dev *dev,
> +                                   uint64_t features)
>  {
> -    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
> +    /* we need a reply anyway if logging is enabled */

better:

wait for a reply if logging is enabled to make sure backend is actually logging changes.


> +    bool log_enabled = !!(features & (0x1ULL << VHOST_F_LOG_ALL));


Do we need !! here?

> +
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> +                              log_enabled);
> +}
> +
> +static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> +                                            uint64_t features)
> +{
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
> +                              false);
>  }
>  
>  static int vhost_user_set_owner(struct vhost_dev *dev)
> -- 
> 2.25.1


