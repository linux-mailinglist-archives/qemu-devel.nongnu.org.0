Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D00680BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMS5l-00045a-Q6; Mon, 30 Jan 2023 06:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS5h-00045H-QP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS5f-00066J-QF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXS/1Nc3sqFNU5udRdTu6Um/2EcXLRmFrAGn9Eb9OMg=;
 b=Tspn3ppqnjkoHZKRPi6a2QoPiq3377EIgMB1lDLkGilbNAjGAbsyvhffuaVU/F4PGP/alH
 HyiJcjgzHbHC49JTp8EOoO33Drb/Qx0pVYx5i8+N+Bzi/9aPzUhOII9f6m4WT7hF54W2cU
 kcXeDxSdyU2+HyVNzdYhxHacSOO0tJM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-WxybzHqmNeaUZEBoLNwlng-1; Mon, 30 Jan 2023 06:12:44 -0500
X-MC-Unique: WxybzHqmNeaUZEBoLNwlng-1
Received: by mail-ed1-f72.google.com with SMTP id
 o21-20020aa7dd55000000b004a245f58006so1746585edw.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 03:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXS/1Nc3sqFNU5udRdTu6Um/2EcXLRmFrAGn9Eb9OMg=;
 b=UoC3QVhPvqx4xEvhSm2PyZnJw6OGcYvwYTtJaGf7wXrlsjBfyiXDCoL3DWciypYaQ2
 h4A0UGkHXX72Q1LJB5qVJxe5b0jE3Th40WnU2MfYVw/tO+ccdeqcHCzMPOtcuXYkLKUE
 XmDkkA2KiFDHnvQTaFrdz7X3JDjQl2Q/HZbHr3rFGUdRoD0iG9yC9tWT+FKiAfrSZo6d
 DwxxQuwQoDswd5cnUUxuKI2qfMVK94a6p7SymWIscQC4PhZiPG4zeT1eGh6GmmxygeSi
 ZFUoJh32zL4POEmeObEkI5ZbD5TO6/BNQHPb5608kDdae+6pte5jayMOsi1f2nKY2bMl
 +ZcQ==
X-Gm-Message-State: AO0yUKXeQSfOr6LiNmCVHMbQqP8yu4JE3hQs2uBQDbzzWnDLomvIYLG8
 HJGbALoEuxv9Y8i57ATpPd1NVo5azanTRjPI0Jh7F+Ha6769aqrGsJNjZFHBBUWrFNw9TT1FuL6
 vXGrRm4/GlRUcY6I=
X-Received: by 2002:a17:906:f296:b0:87b:7c1e:7d58 with SMTP id
 gu22-20020a170906f29600b0087b7c1e7d58mr14059742ejb.53.1675077163847; 
 Mon, 30 Jan 2023 03:12:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8LL+PP7dt+gTFy2RdMTgQLDpP+FmmL3CnlGLJ77YG5+sOXX7aeB6SxGOrZC04jJNKqm/XAXg==
X-Received: by 2002:a17:906:f296:b0:87b:7c1e:7d58 with SMTP id
 gu22-20020a170906f29600b0087b7c1e7d58mr14059734ejb.53.1675077163638; 
 Mon, 30 Jan 2023 03:12:43 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056402510f00b0049f2109e4ffsm6661895edd.50.2023.01.30.03.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:12:43 -0800 (PST)
Date: Mon, 30 Jan 2023 06:12:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, stephen@networkplumber.org,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
Subject: Re: [PATCH 3/3] vhost-user: Adopt new backend naming
Message-ID: <20230130061121-mutt-send-email-mst@kernel.org>
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
 <20230130104548.13262-4-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130104548.13262-4-maxime.coquelin@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

On Mon, Jan 30, 2023 at 11:45:48AM +0100, Maxime Coquelin wrote:
> In order to get rid of harmful language, the Vhost-user
> specification changed features and requests naming from
> _SLAVE_ to _BACKEND_.

"features and requests naming" ->
"feature and request naming" (a reduced relative drops plurals generally), or
"naming of features and requests"

let's drop "to get rid of the remaining harmful language" 
as don't get rid of it.  consistency is sufficient motivation.


> This patch adopts the new naming convention.
> 
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 30 +++++++++++++++---------------
>  hw/virtio/virtio-qmp.c | 12 ++++++------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d9ce0501b2..9b623ecf4a 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -40,7 +40,7 @@
>  
>  #define VHOST_MEMORY_BASELINE_NREGIONS    8
>  #define VHOST_USER_F_PROTOCOL_FEATURES 30
> -#define VHOST_USER_SLAVE_MAX_FDS     8
> +#define VHOST_USER_BACKEND_MAX_FDS     8
>  
>  /*
>   * Set maximum number of RAM slots supported to
> @@ -71,12 +71,12 @@ enum VhostUserProtocolFeature {
>      VHOST_USER_PROTOCOL_F_RARP = 2,
>      VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
>      VHOST_USER_PROTOCOL_F_NET_MTU = 4,
> -    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
> +    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
>      VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
>      VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
>      VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
>      VHOST_USER_PROTOCOL_F_CONFIG = 9,
> -    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
> +    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
>      VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>      VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>      VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> @@ -110,7 +110,7 @@ typedef enum VhostUserRequest {
>      VHOST_USER_SET_VRING_ENABLE = 18,
>      VHOST_USER_SEND_RARP = 19,
>      VHOST_USER_NET_SET_MTU = 20,
> -    VHOST_USER_SET_SLAVE_REQ_FD = 21,
> +    VHOST_USER_SET_BACKEND_REQ_FD = 21,
>      VHOST_USER_IOTLB_MSG = 22,
>      VHOST_USER_SET_VRING_ENDIAN = 23,
>      VHOST_USER_GET_CONFIG = 24,
> @@ -134,11 +134,11 @@ typedef enum VhostUserRequest {
>  } VhostUserRequest;
>  
>  typedef enum VhostUserSlaveRequest {
> -    VHOST_USER_SLAVE_NONE = 0,
> -    VHOST_USER_SLAVE_IOTLB_MSG = 1,
> -    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
> -    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
> -    VHOST_USER_SLAVE_MAX
> +    VHOST_USER_BACKEND_NONE = 0,
> +    VHOST_USER_BACKEND_IOTLB_MSG = 1,
> +    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
> +    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
> +    VHOST_USER_BACKEND_MAX
>  }  VhostUserSlaveRequest;
>  
>  typedef struct VhostUserMemoryRegion {
> @@ -1722,13 +1722,13 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
>      }
>  
>      switch (hdr.request) {
> -    case VHOST_USER_SLAVE_IOTLB_MSG:
> +    case VHOST_USER_BACKEND_IOTLB_MSG:
>          ret = vhost_backend_handle_iotlb_msg(dev, &payload.iotlb);
>          break;
> -    case VHOST_USER_SLAVE_CONFIG_CHANGE_MSG :
> +    case VHOST_USER_BACKEND_CONFIG_CHANGE_MSG:
>          ret = vhost_user_slave_handle_config_change(dev);
>          break;
> -    case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
> +    case VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG:
>          ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
>                                                            fd ? fd[0] : -1);
>          break;
> @@ -1780,7 +1780,7 @@ fdcleanup:
>  static int vhost_setup_slave_channel(struct vhost_dev *dev)
>  {
>      VhostUserMsg msg = {
> -        .hdr.request = VHOST_USER_SET_SLAVE_REQ_FD,
> +        .hdr.request = VHOST_USER_SET_BACKEND_REQ_FD,
>          .hdr.flags = VHOST_USER_VERSION,
>      };
>      struct vhost_user *u = dev->opaque;
> @@ -1791,7 +1791,7 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
>      QIOChannel *ioc;
>  
>      if (!virtio_has_feature(dev->protocol_features,
> -                            VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
> +                            VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
>          return 0;
>      }
>  
> @@ -2147,7 +2147,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>  
>          if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
>                  !(virtio_has_feature(dev->protocol_features,
> -                    VHOST_USER_PROTOCOL_F_SLAVE_REQ) &&
> +                    VHOST_USER_PROTOCOL_F_BACKEND_REQ) &&
>                   virtio_has_feature(dev->protocol_features,
>                      VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
>              error_setg(errp, "IOMMU support requires reply-ack and "
> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> index e4d4bece2d..b70148aba9 100644
> --- a/hw/virtio/virtio-qmp.c
> +++ b/hw/virtio/virtio-qmp.c
> @@ -42,12 +42,12 @@ enum VhostUserProtocolFeature {
>      VHOST_USER_PROTOCOL_F_RARP = 2,
>      VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
>      VHOST_USER_PROTOCOL_F_NET_MTU = 4,
> -    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
> +    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
>      VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
>      VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
>      VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
>      VHOST_USER_PROTOCOL_F_CONFIG = 9,
> -    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
> +    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
>      VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>      VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>      VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> @@ -101,8 +101,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>              "supported"),
>      FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
>              "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
> -            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_REQ, \
> +            "VHOST_USER_PROTOCOL_F_BACKEND_REQ: Socket fd for back-end initiated "
>              "requests supported"),
>      FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
>              "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
> @@ -116,8 +116,8 @@ static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>      FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
>              "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
>              "device configuration space supported"),
> -    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
> -            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
> +    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD, \
> +            "VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD: Slave fd communication "
>              "channel supported"),
>      FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
>              "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
> -- 
> 2.39.1


