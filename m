Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D8A4E3FFF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:03:28 +0100 (CET)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWf6d-0003rE-9e
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:03:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWf5U-0001Ry-8h
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWf5R-0001eX-F2
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647957732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbLXttatpBT8og1yzev8mN+c8PPg3CnPldtlnB+3FnU=;
 b=KrwZEQlsuz4RMjQVe3jPXn4jY8TdhgjREhlRrfd0avvTS15Pw7ONMLoGj8IZ4RQHe8K3hh
 lrzLGeCpabAaW/xuGKJ/7yAOFtc3/3HWIA37CTzTBOvMKz3jYQyKep1DNF6Ae0DfK2QtP2
 FmVVWk4lM5uLMgL0AX8SsJxVFbKnQI4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-JWhihut2MuaCKqMlD0bGwg-1; Tue, 22 Mar 2022 10:02:10 -0400
X-MC-Unique: JWhihut2MuaCKqMlD0bGwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b0038cb92d58dcso50118wms.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HbLXttatpBT8og1yzev8mN+c8PPg3CnPldtlnB+3FnU=;
 b=HSpSFvpZ0GBQXOtQhEXynSJ/XK4xrfhXeae/39ar7qcymby7sYRLdd93zkeYuRm7wL
 hnO8YLRRwE91RDV7gMqDWzwFpqywA2N+iVGNQKqeWdd/mEb0HEyPrJXLyRgVLN31/VWv
 LRsiLyd3PHitqV/u2DQz24PE68w+B3gNTGl2q00FF5+maUFOr2k8D58BjlTpA6sljFC+
 htRg9x27p/5YmN+cS/BZR2eR7jyZc5SH9JfDtX97+DnXG2kKVhEJyt1hDAvZnJijBT7+
 R+El7CAmfWi5x1b7eg1N9XAJ4WrEPutmt6tMqaIG4bGkM6ZaZ3Resp82zxQQByKbCprJ
 ZoVA==
X-Gm-Message-State: AOAM532OlnY6or0V1VI1oHG8Osfke6vuumdDZ/dq1iJZ6OW7xm75zfxl
 9XlgZFlWng6WPhk8wfZM4Dgz/i3K/iUfhvrpRrt+xAiD8IE49ujgl8Yu9zhKgxvchbW2DpltS7D
 bLs1vEdPZDfk6+Fs=
X-Received: by 2002:a05:6000:1549:b0:203:f11a:ac4c with SMTP id
 9-20020a056000154900b00203f11aac4cmr18875002wry.233.1647957729464; 
 Tue, 22 Mar 2022 07:02:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjYu1g0tEipFayZMKlO56xN6rKUaWs8j/NaRQcKPJ0XzVfXBG63g4lC4C3kiJreIm+TdbxkQ==
X-Received: by 2002:a05:6000:1549:b0:203:f11a:ac4c with SMTP id
 9-20020a056000154900b00203f11aac4cmr18874960wry.233.1647957729157; 
 Tue, 22 Mar 2022 07:02:09 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm1880416wri.111.2022.03.22.07.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 07:02:08 -0700 (PDT)
Date: Tue, 22 Mar 2022 10:02:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 12/13] hw/virtio/vhost-user: don't suppress F_CONFIG
 when supported
Message-ID: <20220322095720-mutt-send-email-mst@kernel.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-13-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220321153037.3622127-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, slp@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 03:30:36PM +0000, Alex Bennée wrote:
> Previously we would silently suppress VHOST_USER_PROTOCOL_F_CONFIG
> during the protocol negotiation if the QEMU stub hadn't implemented
> the vhost_dev_config_notifier. However this isn't the only way we can
> handle config messages, the existing vdc->get/set_config can do this
> as well.


Could you give an example where the problem is encountered please?

> Lightly re-factor the code to check for both potential methods and
> instead of silently squashing the feature error out. It is unlikely
> that a vhost-user backend expecting to handle CONFIG messages will
> behave correctly if they never get sent.

Hmm but are you sure? Most devices work mostly fine without CONFIG
messages, there's a chance a backend set this flag just in case
without much thought ...

> Fixes: 1c3e5a2617 ("vhost-user: back SET/GET_CONFIG requests with a protocol feature")

I'm not sure whether something is broken or this is a cleanup patch.
Fixes tag means "if you have 1c3e5a2617 you should pick this patch", so
cleanups don't need a fixes: tag.


> Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
>   - we can't check for get_config/set_config as the stack squashed vdev
>   - use vhost-user-state to transmit this
> ---
>  include/hw/virtio/vhost-user.h |  1 +
>  hw/scsi/vhost-user-scsi.c      |  1 +
>  hw/virtio/vhost-user.c         | 46 ++++++++++++++++++++++++----------
>  3 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> index e44a41bb70..6e0e8a71a3 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -22,6 +22,7 @@ typedef struct VhostUserState {
>      CharBackend *chr;
>      VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
>      int memory_slots;
> +    bool supports_config;
>  } VhostUserState;
>  
>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 1b2f7eed98..9be21d07ee 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -121,6 +121,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
>      vsc->dev.backend_features = 0;
>      vqs = vsc->dev.vqs;
>  
> +    s->vhost_user.supports_config = true;
>      ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index b27b8c56e2..6ce082861b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1949,14 +1949,15 @@ static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
>  static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>                                     Error **errp)
>  {
> -    uint64_t features, protocol_features, ram_slots;
> +    uint64_t features, ram_slots;
>      struct vhost_user *u;
> +    VhostUserState *vus = (VhostUserState *) opaque;
>      int err;
>  
>      assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER);
>  
>      u = g_new0(struct vhost_user, 1);
> -    u->user = opaque;
> +    u->user = vus;
>      u->dev = dev;
>      dev->opaque = u;
>  
> @@ -1967,6 +1968,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>      }
>  
>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> +        bool supports_f_config = vus->supports_config ||
> +            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> +        uint64_t protocol_features;
> +
>          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>  
>          err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
> @@ -1976,19 +1981,34 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>              return -EPROTO;
>          }
>  
> -        dev->protocol_features =
> -            protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
> -
> -        if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
> -            /* Don't acknowledge CONFIG feature if device doesn't support it */
> -            dev->protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> -        } else if (!(protocol_features &
> -                    (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
> -            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
> -                       "but backend does not support it.");
> -            return -EINVAL;
> +        /*
> +         * We will use all the protocol features we support - although
> +         * we suppress F_CONFIG if we know QEMUs internal code can not support
> +         * it.
> +         */
> +        protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> +
> +        if (supports_f_config) {
> +            if (!virtio_has_feature(protocol_features,
> +                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> +                error_setg(errp, "vhost-user device %s expecting "
> +                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> +                           "not support it.", dev->vdev->name);
> +                return -EPROTO;
> +            }
> +        } else {
> +            if (virtio_has_feature(protocol_features,
> +                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> +                warn_reportf_err(*errp, "vhost-user backend supports "
> +                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
> +                                 "device %s but QEMU does not.",
> +                                 dev->vdev->name);
> +                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> +            }
>          }
>  
> +        /* final set of protocol features */
> +        dev->protocol_features = protocol_features;
>          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
>          if (err < 0) {
>              error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
> -- 
> 2.30.2


