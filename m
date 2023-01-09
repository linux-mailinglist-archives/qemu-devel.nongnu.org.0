Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E69662386
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpoJ-0006JB-FH; Mon, 09 Jan 2023 05:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEpo8-0006HF-0i
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:55:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEpo4-0006XY-C3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673261707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVBE+IuqwZnF+5tE/fL1MY1A1/voaRav78vzK3NlZXc=;
 b=Ix0E9tMpvQJ4ZGpsZI5NqNl8NpHk09uNxYm39+7aZSbqvZhQ1KQQ8bi0i28n6RIOguoBSz
 T4ih/pI83AhbwbL6dv3dD3v8wsGWAJQeIhK6NM12ZQ42IR365fBUxqd9URIxKLfg/+se0f
 BH1hNNIWnRQcwsH0fef2dlSiFJriayk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-Ab34KN2cOR2ZO9BbZdy3Hg-1; Mon, 09 Jan 2023 05:55:06 -0500
X-MC-Unique: Ab34KN2cOR2ZO9BbZdy3Hg-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so4583386wmb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVBE+IuqwZnF+5tE/fL1MY1A1/voaRav78vzK3NlZXc=;
 b=SFhqZ0D+omaGuIkBMlpfpGrnpHsBX+wZxNMJvuIw4iIMaUOlXzzg2m8kKSPxFUibON
 3/mbsv+K9qdeC7rHIzKtoJnsi7NFtSQopCtDl+rJ0xc0pfhsyJQ9OdUsbF4k+BHmkP80
 7BD2p7qYATA79NxgP+ZdO4QvoCqgBWA7NlhAUV+CijEmLwoSnp2VAicSsdUSc5qIRph3
 isTo0cWUygjv7Gue/bRFB/yAak/mF71ceJx/FQ35zC+ikB6j2gY+CXsXT2nhSXO4jtBs
 DqV9HnMrI15fgeYY009hNL4GiQmCngD2EVn//he9EUwJfqwN8WUTvOQKnTo5yEkpvwFq
 vN1Q==
X-Gm-Message-State: AFqh2ko9i55N/JEcmkJCYKRyajQOR9p8A+J542pN393a2fGUjK6kAzIY
 KGKrIFEyLmQCEpUU8OyDjt9znXJslouyIM89zH3AAsmW+O671BZSgKMJCDJS+ED3l7KbX+aIh8P
 08u4BWWsmnsgM+hw=
X-Received: by 2002:a5d:6447:0:b0:2bb:9f31:3568 with SMTP id
 d7-20020a5d6447000000b002bb9f313568mr4393076wrw.69.1673261705090; 
 Mon, 09 Jan 2023 02:55:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXslIUiruW2v135hD/b6vLHCJtiBt6tQqaalVBnb9jN0jrbLjBG91cA9QSZXf9n6cb3HTU9hxg==
X-Received: by 2002:a5d:6447:0:b0:2bb:9f31:3568 with SMTP id
 d7-20020a5d6447000000b002bb9f313568mr4393059wrw.69.1673261704791; 
 Mon, 09 Jan 2023 02:55:04 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 v12-20020a5d6b0c000000b002366553eca7sm8204744wrw.83.2023.01.09.02.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:55:03 -0800 (PST)
Date: Mon, 9 Jan 2023 05:55:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Message-ID: <20230109054633-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
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

On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
> Hi,
> 
> it seems this patch breaks vhost-user with DPDK.
> 
> See https://bugzilla.redhat.com/show_bug.cgi?id=2155173
> 
> it seems QEMU doesn't receive the expected commands sequence:
> 
> Received unexpected msg type. Expected 22 received 40
> Fail to update device iotlb
> Received unexpected msg type. Expected 40 received 22
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 1 ring restore failed: -71: Protocol error (71)
> Received unexpected msg type. Expected 22 received 11
> Fail to update device iotlb
> Received unexpected msg type. Expected 11 received 22
> vhost VQ 0 ring restore failed: -71: Protocol error (71)
> unable to start vhost net: 71: falling back on userspace virtio
> 
> It receives VHOST_USER_GET_STATUS (40) when it expects VHOST_USER_IOTLB_MSG (22)
> and VHOST_USER_IOTLB_MSG when it expects VHOST_USER_GET_STATUS.
> and VHOST_USER_GET_VRING_BASE (11) when it expect VHOST_USER_GET_STATUS and so on.
> 
> Any idea?
> 
> Thanks,
> Laurent


So I am guessing it's coming from:

    if (msg.hdr.request != request) {
        error_report("Received unexpected msg type. Expected %d received %d",
                     request, msg.hdr.request); 
        return -EPROTO;  
    }       

in process_message_reply and/or in vhost_user_get_u64.


> On 11/7/22 23:53, Michael S. Tsirkin wrote:
> > From: Yajun Wu <yajunw@nvidia.com>
> > 
> > The motivation of adding vhost-user vhost_dev_start support is to
> > improve backend configuration speed and reduce live migration VM
> > downtime.
> > 
> > Today VQ configuration is issued one by one. For virtio net with
> > multi-queue support, backend needs to update RSS (Receive side
> > scaling) on every rx queue enable. Updating RSS is time-consuming
> > (typical time like 7ms).
> > 
> > Implement already defined vhost status and message in the vhost
> > specification [1].
> > (a) VHOST_USER_PROTOCOL_F_STATUS
> > (b) VHOST_USER_SET_STATUS
> > (c) VHOST_USER_GET_STATUS
> > 
> > Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
> > device start and reset(0) for device stop.
> > 
> > On reception of the DRIVER_OK message, backend can apply the needed setting
> > only once (instead of incremental) and also utilize parallelism on enabling
> > queues.
> > 
> > This improves QEMU's live migration downtime with vhost user backend
> > implementation by great margin, specially for the large number of VQs of 64
> > from 800 msec to 250 msec.
> > 
> > [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html
> > 
> > Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> > Acked-by: Parav Pandit <parav@nvidia.com>
> > Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Probably easiest to debug from dpdk side.
Does the problem go away if you disable the feature VHOST_USER_PROTOCOL_F_STATUS in dpdk?

> > ---
> >   hw/virtio/vhost-user.c | 74 +++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 73 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index d256ce589b..abe23d4ebe 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -81,6 +81,7 @@ enum VhostUserProtocolFeature {
> >       VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
> >       /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
> >       VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
> > +    VHOST_USER_PROTOCOL_F_STATUS = 16,
> >       VHOST_USER_PROTOCOL_F_MAX
> >   };
> > @@ -126,6 +127,8 @@ typedef enum VhostUserRequest {
> >       VHOST_USER_GET_MAX_MEM_SLOTS = 36,
> >       VHOST_USER_ADD_MEM_REG = 37,
> >       VHOST_USER_REM_MEM_REG = 38,
> > +    VHOST_USER_SET_STATUS = 39,
> > +    VHOST_USER_GET_STATUS = 40,
> >       VHOST_USER_MAX
> >   } VhostUserRequest;
> > @@ -1452,6 +1455,43 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
> >       return 0;
> >   }
> > +static int vhost_user_set_status(struct vhost_dev *dev, uint8_t status)
> > +{
> > +    return vhost_user_set_u64(dev, VHOST_USER_SET_STATUS, status, false);
> > +}
> > +
> > +static int vhost_user_get_status(struct vhost_dev *dev, uint8_t *status)
> > +{
> > +    uint64_t value;
> > +    int ret;
> > +
> > +    ret = vhost_user_get_u64(dev, VHOST_USER_GET_STATUS, &value);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +    *status = value;
> > +
> > +    return 0;
> > +}
> > +
> > +static int vhost_user_add_status(struct vhost_dev *dev, uint8_t status)
> > +{
> > +    uint8_t s;
> > +    int ret;
> > +
> > +    ret = vhost_user_get_status(dev, &s);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    if ((s & status) == status) {
> > +        return 0;
> > +    }
> > +    s |= status;
> > +
> > +    return vhost_user_set_status(dev, s);
> > +}
> > +
> >   static int vhost_user_set_features(struct vhost_dev *dev,
> >                                      uint64_t features)
> >   {
> > @@ -1460,6 +1500,7 @@ static int vhost_user_set_features(struct vhost_dev *dev,
> >        * backend is actually logging changes
> >        */
> >       bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
> > +    int ret;
> >       /*
> >        * We need to include any extra backend only feature bits that
> > @@ -1467,9 +1508,18 @@ static int vhost_user_set_features(struct vhost_dev *dev,
> >        * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
> >        * features.
> >        */
> > -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> > +    ret = vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> >                                 features | dev->backend_features,
> >                                 log_enabled);
> > +
> > +    if (virtio_has_feature(dev->protocol_features,
> > +                           VHOST_USER_PROTOCOL_F_STATUS)) {
> > +        if (!ret) {
> > +            return vhost_user_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> > +        }
> > +    }
> > +
> > +    return ret;
> >   }
> >   static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> > @@ -2620,6 +2670,27 @@ void vhost_user_cleanup(VhostUserState *user)
> >       user->chr = NULL;
> >   }
> > +static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
> > +{
> > +    if (!virtio_has_feature(dev->protocol_features,
> > +                            VHOST_USER_PROTOCOL_F_STATUS)) {
> > +        return 0;
> > +    }
> > +
> > +    /* Set device status only for last queue pair */
> > +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> > +        return 0;
> > +    }
> > +
> > +    if (started) {
> > +        return vhost_user_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > +                                          VIRTIO_CONFIG_S_DRIVER |
> > +                                          VIRTIO_CONFIG_S_DRIVER_OK);
> > +    } else {
> > +        return vhost_user_set_status(dev, 0);
> > +    }
> > +}
> > +
> >   const VhostOps user_ops = {
> >           .backend_type = VHOST_BACKEND_TYPE_USER,
> >           .vhost_backend_init = vhost_user_backend_init,
> > @@ -2654,4 +2725,5 @@ const VhostOps user_ops = {
> >           .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
> >           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
> >           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
> > +        .vhost_dev_start = vhost_user_dev_start,
> >   };


