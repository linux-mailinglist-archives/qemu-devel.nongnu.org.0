Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2F3BE632
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:12:27 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14Xa-0005Vc-Gs
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m14Vh-0003vN-At
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m14Ve-0006Nw-Gg
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625652623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1WPKt3M4QT0YV642F/7hw6ApqGve7qSZ5u5Xw4tZqds=;
 b=J5drfRFuqgqiQC0eou7MbtIrky7Lk1Xx/UoVdJmZ0MRFx+S8uDkP3HElyUbXOOMe6Dzmjg
 hit5/nve6ZAeal/zFD1AU6PbnA9qGBCrX7es8p4PcQcssEaD6Ou/zh6pg7Skk2KvgTr+ov
 zOjIJxhp016L6btCiAwF9qAs4mp42O0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-ZdZOg4hmPomKvKa2fmiUdA-1; Wed, 07 Jul 2021 06:10:22 -0400
X-MC-Unique: ZdZOg4hmPomKvKa2fmiUdA-1
Received: by mail-ej1-f72.google.com with SMTP id
 d21-20020a1709063455b02904c609ed19f1so348773ejb.11
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 03:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1WPKt3M4QT0YV642F/7hw6ApqGve7qSZ5u5Xw4tZqds=;
 b=qsk6ZNt4FbDED7aikKCBRorJEBCLm5yPVobwUQH2x6Qx909R8IYItdMq4idDYARTRT
 VeNwcmXdaWQ7O8xvAkrXgLTvEiIBLE6oO3ROYv+OtLiEBVaqWODShWumqP0hv9W3YYXB
 t76sg0j5U1bADqToXjjG9CwDyyb3zzYq10GC9+F9Wz5HPvFwxS2Sv0rc+jkDx8HJRnv8
 d6Kax75apCdi8VInz2xMutooVIU7NdQTApLAz33e+8ZVDvy1qoPHY1AKSn2wuDSQW7+f
 dG9BXdtq/mY0TbXWFafWY4w3izxK5AdNkopTHUhNxvlOWXUXvSpkfryceqH2tzInifL3
 +MrA==
X-Gm-Message-State: AOAM533XSeeSgLeaSU9wiMoeDBTAa6dLw9f6Idy4zc2cDBHpRCJUdF7M
 ZoXIdXoqoS0GfxdnpjhNOTbiEcqXigfl3C1LhuIJu2OeL8c6uDxPrg4FoiXvF1h28m1jAHlImVQ
 mzFmMpW+Iz9+ExZU=
X-Received: by 2002:a17:906:c212:: with SMTP id
 d18mr23120340ejz.291.1625652621007; 
 Wed, 07 Jul 2021 03:10:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdkYWBQcy5Qi7RLGsqP5qJZLUtmM5XCyDKZCngpup2OoofxIpCt8ZkBxI8ywnsn/YVyB9ing==
X-Received: by 2002:a17:906:c212:: with SMTP id
 d18mr23120328ejz.291.1625652620788; 
 Wed, 07 Jul 2021 03:10:20 -0700 (PDT)
Received: from redhat.com ([2.55.8.91])
 by smtp.gmail.com with ESMTPSA id cn17sm6067048edb.29.2021.07.07.03.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 03:10:20 -0700 (PDT)
Date: Wed, 7 Jul 2021 06:10:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v0] vhost: make SET_VRING_ADDR, SET_[PROTOCOL_]FEATEURES
 send replies
Message-ID: <20210707060936-mutt-send-email-mst@kernel.org>
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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

On Fri, Jun 25, 2021 at 11:52:10AM +0300, Denis Plotnikov wrote:
> On vhost-user-blk migration, qemu normally sends a number of commands
> to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
> data logging.
> The issue is that qemu doesn't wait for reply from the vhost daemon
> for these commands which may result in races between qemu expectation
> of logging starting and actual login starting in vhost daemon.

Could you be more explicit please? What kind of race have you
observed? Getting a reply slows down the setup considerably and
should not be done lightly.

Thanks!

> To resolve this issue, this patch makes qemu wait for the commands result
> explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
> Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
> command to make the features setting functions work similary.
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ee57abe04526..e47b82adab00 100644
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
> @@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
>          .hdr.size = sizeof(msg.payload.u64),
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
> -- 
> 2.25.1


