Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2F4E4429
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:24:15 +0100 (CET)
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhIs-0003Qp-PC
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:24:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWhHZ-0002iP-BD
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWhHV-00069u-QK
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647966166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/2D5ZJmNcMZBnzSjBjae4pYaBDescjwlgz94tp40fs=;
 b=Y2drygRBjoMYsgOELaY3cYzyuhbUm0jNB+/6KU96yd52FZlSzf7mLaATNy8S5ao5NrbjO9
 RiZjelbMPZCmcBnIWFRNTATZyKdJA5Seq0QGCMfwrQ9jMr2u3XibgAquqZfFIUT5ilmkmg
 LGhX3XOt26sBt98cvRrAHiRH582MTlQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-7bjSQaCsNvy34gozaYwCtA-1; Tue, 22 Mar 2022 12:22:45 -0400
X-MC-Unique: 7bjSQaCsNvy34gozaYwCtA-1
Received: by mail-wr1-f69.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3856577wro.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k/2D5ZJmNcMZBnzSjBjae4pYaBDescjwlgz94tp40fs=;
 b=G1RPsFIKRpzJc7yrhNkXDcbdePIV/dX3LHHRtIlUEXzbo/HxI+TtUIORRxkIO6LsAK
 F0Yrss4IkQCh0GUusrCm/E5NorXhqHAuOcWOWq38Cup8MVFRRB5Hs1I9PMwq/4ZixdGj
 Ssnr1wl4yt2vxW1gYLYrlZrCzhbs/NAUhxVZ4h/EhA/e9Eo3DTuapAxcnH4R4vVmKH5I
 e7BxntowrxL5ugFkLbHr3y78FJiw/3Xiqz5u7nep4guovV4scbTeTd489EaL+Bb2GJy4
 nUfcA2F6QyHdDKZPQK4anT+qusmbJrdZ3M8LtKzvBQTM9OxbigpfkAyZuFxm0pZ5NCdY
 50tA==
X-Gm-Message-State: AOAM533KzqEieUcnb2Eq1LANwrjmnuiYmWVZUJps0zy0gJQelYA+7R9e
 m5SQn2R9AAL4QYlk3ech+Hb8GCzYRxReeDlfvkIz5zQL8K2jix1cWCf9aji9G+ZhZhmUs7HvdI/
 nYjWLhrKjNtjOZoE=
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr4611148wmk.147.1647966163869; 
 Tue, 22 Mar 2022 09:22:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJDuweJGWX1hSOOE+Js7GyM6NNG7eD0bjP7wPsCwr0e06JVUndli1X62VvRiPa8q9kUEXaiQ==
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr4611117wmk.147.1647966163546; 
 Tue, 22 Mar 2022 09:22:43 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm16168192wre.22.2022.03.22.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:22:42 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:22:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 12/13] hw/virtio/vhost-user: don't suppress F_CONFIG
 when supported
Message-ID: <20220322121434-mutt-send-email-mst@kernel.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-13-alex.bennee@linaro.org>
 <20220322095720-mutt-send-email-mst@kernel.org>
 <87o81y567r.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87o81y567r.fsf@linaro.org>
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
 viresh.kumar@linaro.org, felipe@nutanix.com, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 03:54:32PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Mon, Mar 21, 2022 at 03:30:36PM +0000, Alex Bennée wrote:
> >> Previously we would silently suppress VHOST_USER_PROTOCOL_F_CONFIG
> >> during the protocol negotiation if the QEMU stub hadn't implemented
> >> the vhost_dev_config_notifier. However this isn't the only way we can
> >> handle config messages, the existing vdc->get/set_config can do this
> >> as well.
> >
> > Could you give an example where the problem is encountered please?
> 
> Well I only came across it when I realised by rpmb implementation wasn't
> sending config updates to the vhost-user daemon because it only
> implemented set/get_config methods.
> 
> I think vhost-user-scsi suffers from this but I'm not able to test it as
> it's not clear how to do it. The vhost-user-scsi daemon want to attach
> to real SCSI devices rather than a file for the block device. I guess I
> need to somehow add "fake" scsi nodes to my host system which SCSI
> commands can be passed to?
> 
> When was the last time vhost-user-scsi was tested with anything?

It's for passthrough mostly, yes. I think you can use tcm_loop
on top of loopback on top of a file. Didn't try myself.

> >> Lightly re-factor the code to check for both potential methods and
> >> instead of silently squashing the feature error out. It is unlikely
> >> that a vhost-user backend expecting to handle CONFIG messages will
> >> behave correctly if they never get sent.
> >
> > Hmm but are you sure? Most devices work mostly fine without CONFIG
> > messages, there's a chance a backend set this flag just in case
> > without much thought ...
> 
> But that would be a bug right? Certainly a mismatch if something really
> does want to see config messages. Again RPMB needs this because it's the
> vhost-user daemon that knows the size of the device.


Could you pls clarify how do you create a config that's broken with RPMB?

> >> Fixes: 1c3e5a2617 ("vhost-user: back SET/GET_CONFIG requests with a protocol feature")
> >
> > I'm not sure whether something is broken or this is a cleanup patch.
> > Fixes tag means "if you have 1c3e5a2617 you should pick this patch", so
> > cleanups don't need a fixes: tag.
> 
> No I think it's broken, we just didn't notice because as you say most
> devices don't need to care.

I was mostly asking about the fixes tag.  If no existing user cares then
it's best to avoid the fixes tag, it's a hint for backporters which
versions need the patch.


> >
> >
> >> Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> 
> >> ---
> >>   - we can't check for get_config/set_config as the stack squashed vdev
> >>   - use vhost-user-state to transmit this
> >> ---
> >>  include/hw/virtio/vhost-user.h |  1 +
> >>  hw/scsi/vhost-user-scsi.c      |  1 +
> >>  hw/virtio/vhost-user.c         | 46 ++++++++++++++++++++++++----------
> >>  3 files changed, 35 insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> >> index e44a41bb70..6e0e8a71a3 100644
> >> --- a/include/hw/virtio/vhost-user.h
> >> +++ b/include/hw/virtio/vhost-user.h
> >> @@ -22,6 +22,7 @@ typedef struct VhostUserState {
> >>      CharBackend *chr;
> >>      VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >>      int memory_slots;
> >> +    bool supports_config;
> >>  } VhostUserState;
> >>  
> >>  bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
> >> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> >> index 1b2f7eed98..9be21d07ee 100644
> >> --- a/hw/scsi/vhost-user-scsi.c
> >> +++ b/hw/scsi/vhost-user-scsi.c
> >> @@ -121,6 +121,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
> >>      vsc->dev.backend_features = 0;
> >>      vqs = vsc->dev.vqs;
> >>  
> >> +    s->vhost_user.supports_config = true;
> >>      ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
> >>                           VHOST_BACKEND_TYPE_USER, 0, errp);
> >>      if (ret < 0) {
> >> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >> index b27b8c56e2..6ce082861b 100644
> >> --- a/hw/virtio/vhost-user.c
> >> +++ b/hw/virtio/vhost-user.c
> >> @@ -1949,14 +1949,15 @@ static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
> >>  static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >>                                     Error **errp)
> >>  {
> >> -    uint64_t features, protocol_features, ram_slots;
> >> +    uint64_t features, ram_slots;
> >>      struct vhost_user *u;
> >> +    VhostUserState *vus = (VhostUserState *) opaque;
> >>      int err;
> >>  
> >>      assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER);
> >>  
> >>      u = g_new0(struct vhost_user, 1);
> >> -    u->user = opaque;
> >> +    u->user = vus;
> >>      u->dev = dev;
> >>      dev->opaque = u;
> >>  
> >> @@ -1967,6 +1968,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >>      }
> >>  
> >>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> >> +        bool supports_f_config = vus->supports_config ||
> >> +            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> >> +        uint64_t protocol_features;
> >> +
> >>          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> >>  
> >>          err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
> >> @@ -1976,19 +1981,34 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >>              return -EPROTO;
> >>          }
> >>  
> >> -        dev->protocol_features =
> >> -            protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
> >> -
> >> -        if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
> >> -            /* Don't acknowledge CONFIG feature if device doesn't support it */
> >> -            dev->protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> >> -        } else if (!(protocol_features &
> >> -                    (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
> >> -            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
> >> -                       "but backend does not support it.");
> >> -            return -EINVAL;
> >> +        /*
> >> +         * We will use all the protocol features we support - although
> >> +         * we suppress F_CONFIG if we know QEMUs internal code can not support
> >> +         * it.
> >> +         */
> >> +        protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> >> +
> >> +        if (supports_f_config) {
> >> +            if (!virtio_has_feature(protocol_features,
> >> +                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> >> +                error_setg(errp, "vhost-user device %s expecting "
> >> +                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> >> +                           "not support it.", dev->vdev->name);
> >> +                return -EPROTO;
> >> +            }
> >> +        } else {
> >> +            if (virtio_has_feature(protocol_features,
> >> +                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> >> +                warn_reportf_err(*errp, "vhost-user backend supports "
> >> +                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
> >> +                                 "device %s but QEMU does not.",
> >> +                                 dev->vdev->name);
> >> +                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> >> +            }
> >>          }
> >>  
> >> +        /* final set of protocol features */
> >> +        dev->protocol_features = protocol_features;
> >>          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> >>          if (err < 0) {
> >>              error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
> >> -- 
> >> 2.30.2
> 
> 
> -- 
> Alex Bennée


