Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5077624A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otCn0-0004Pm-1j; Thu, 10 Nov 2022 14:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otCmr-0004P5-Cm
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otCmp-0003Ql-5P
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668106826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PLha6kM/KzjJ4sMffTB88OPyK/yTLC8PSAFRhGemrY=;
 b=ExrCgaJyeUi/J4GKExqRcW/MoJsD1EBsDk9rnZxoS7sxtEXYmPzMkM3SliXMgbGAyKR69R
 hXphR2MM4ou7eOuhDrRnKwFK4ZsplUMMjEeER6BemeT3XE0RZfGhnnJG+4VqYB6GP5nYfF
 +jwpyzlFF+GN3EPKiB5HV+h0qw+SwUQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-L0DLMSpdPk-61AABDHjJfA-1; Thu, 10 Nov 2022 14:00:21 -0500
X-MC-Unique: L0DLMSpdPk-61AABDHjJfA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r4-20020adfbb04000000b00236639438e9so615804wrg.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PLha6kM/KzjJ4sMffTB88OPyK/yTLC8PSAFRhGemrY=;
 b=OBURz/jCJ3/gS3fWU8ltIE8pOdHudcWHOghbJFZN9ZZcHNBC9ES4ArQz4AamtBF0z7
 MYssdYCLC7runYUO24w1WdlN11Iz1/kQb30Lk9wlu7wRxCp3jhcgVwqPe7c/l9rJuKgA
 Y7wPMo6rlbqXEFfhzpC02Vq2AHTIItNcqaP4GIptvem1VEEdsdxaECVsCSIywCGEL4Cv
 itEWltKvF8gK5aZPRlvVeC+aXxhkURGldkrOgBkhd1iv/7jmUYUavoq/IK5GD9zaz2R0
 fOShvyoY3bjR7hg58Y9ZfINf0eaYfXLb/WNew4NJErzKbhuJI2fwEWnFI32lEkesYSQf
 bw0A==
X-Gm-Message-State: ACrzQf1XlmkSVrmNFRtNtfuJOv1Y+vrLT01RybYU82mHUXQT7QPAZrJF
 SCi8E2K+SZ0VV3xTVg0D9na5QvKuo+sBbeCGkDouUPb7z3/M+P+arN2GWOSo/mI4kLLXh0niJRA
 9AerBSrhbRDH+OmY=
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr44278886wrd.336.1668106820194; 
 Thu, 10 Nov 2022 11:00:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5K/2EnKnAoVzMmNsl6/8uGdILysoXuYhmZC9llB4JbFv6gZo7Ho5kSvi0eOu2EyPD4d6Hy/Q==
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr44278873wrd.336.1668106819978; 
 Thu, 10 Nov 2022 11:00:19 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600003c900b0022e6178bd84sm16827527wrg.8.2022.11.10.11.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 11:00:19 -0800 (PST)
Date: Thu, 10 Nov 2022 14:00:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
Message-ID: <20221110135637-mutt-send-email-mst@kernel.org>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Oct 30, 2022 at 09:52:39PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Save the acked_features once it be configured by guest
> virtio driver so it can't miss any features.
> 
> Note that this patch also change the features saving logic
> in chr_closed_bh, which originally backup features no matter
> whether the features are 0 or not, but now do it only if
> features aren't 0.

I'm not sure how is this change even related to what we
are trying to do (fix a bug). Explain here?



> As to reset acked_features to 0 if needed, Qemu always
> keeping the backup acked_features up-to-date, and save the
> acked_features after virtio_net_set_features in advance,
> including reset acked_features to 0, so the behavior is
> also covered.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  hw/net/vhost_net.c      | 9 +++++++++
>  hw/net/virtio-net.c     | 5 +++++
>  include/net/vhost_net.h | 2 ++
>  net/vhost-user.c        | 6 +-----
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b9..2bffc27 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -141,6 +141,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
>      return net->dev.acked_features;
>  }
>  
> +void vhost_net_save_acked_features(NetClientState *nc)
> +{
> +    if (nc->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
> +        return;
> +    }
> +
> +    vhost_user_save_acked_features(nc, false);
> +}
> +
>  static int vhost_net_get_fd(NetClientState *backend)
>  {
>      switch (backend->info->type) {
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index e9f696b..5f8f788 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -924,6 +924,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>              continue;
>          }
>          vhost_net_ack_features(get_vhost_net(nc->peer), features);
> +        /*
> +         * keep acked_features in NetVhostUserState up-to-date so it
> +         * can't miss any features configured by guest virtio driver.
> +         */
> +        vhost_net_save_acked_features(nc->peer);
>      }
>  
>      if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913..3a5579b 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
>  
>  uint64_t vhost_net_get_acked_features(VHostNetState *net);
>  
> +void vhost_net_save_acked_features(NetClientState *nc);
> +
>  int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>  
>  #endif
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 74f349c..c512cc9 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -258,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>      s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>  
>      for (i = queues -1; i >= 0; i--) {
> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> -
> -        if (s->vhost_net) {
> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> -        }
> +        vhost_user_save_acked_features(ncs[i], false);
>      }
>  
>      qmp_set_link(name, false, &err);


Split this last chunk into a patch of its own?

> -- 
> 1.8.3.1


