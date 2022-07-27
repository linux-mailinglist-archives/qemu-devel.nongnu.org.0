Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20805581F50
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 06:53:53 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZ3P-0002If-Oq
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 00:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ16-0000oj-7N
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZ10-0008WR-7h
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 00:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658897480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtlTACsMImUJt4pPBtvGyZTAbrtgoD3J/DrBzM57qZE=;
 b=J0YSl35q2+ZSBM9Emtrn7SMtuwL2kusSwT/I/rLY3PDCgQ4+oWzKCJC6d3ZVUqpdQh8yXT
 f1RKCyy7duAGCZ3wJnG39Wzvu1xMbZIat25+d7aMylor5T+OSOvkvwF8kTm8BOvoRV3IHc
 gLORsq4i/7sRwx1SHGF0oCO6EJrhPE8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-klYlorcoPIe7Q_alVb9FGA-1; Wed, 27 Jul 2022 00:51:18 -0400
X-MC-Unique: klYlorcoPIe7Q_alVb9FGA-1
Received: by mail-lf1-f72.google.com with SMTP id
 k25-20020a195619000000b00489e6a6527eso4892510lfb.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 21:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JtlTACsMImUJt4pPBtvGyZTAbrtgoD3J/DrBzM57qZE=;
 b=7oDqTlNc/siMGvLfGEVIFWC4H10CthQ4YvWsPncPN50nYSKz1ukhm9iAK8SnRjukpf
 7SUzwCvhG6WnfbfcX0zDeriHJ91NPaKkftFeMr8l2Sn8wiz8TSQi8DNZru6jlccQlXLS
 2UNsaCbcuJEdx5J97boiqc6wvukE2prZC7veKLDXASTwl8yL1Tu/o8/GSJ7RyC7hz/ve
 2d56nvNFHgUKWzFXC4VIpHyU9k8KGyuu+cXT6w81qxSvqPk/qgMyRrUB3XQMLGgz5Gc1
 fAK6xlv6rRZ5lRcdtjN+PRy6/149XJYnk/ojoa2qz4xUrwPTyrk0qyjY3lCCLww37cnv
 JaVg==
X-Gm-Message-State: AJIora/kdLVvfksQn2Frr4XfO3b5xgBvn18iVH5pUItHxXL02zz9izB4
 TVy8vZPtitm8zqz2ESmi1hNvaWE54ZzSMfvLl++DOpQMPL43NLB+2wmJrVqmi03SSjoM3+lN7px
 j1wAVO1ynNXka6RNAd99bg7rAIGjDplw=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr7128494lfa.124.1658897476937; 
 Tue, 26 Jul 2022 21:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKyscZW/ND7lN9NJLQJeNwAsrKkkxpy684N4Epts+RO8CJYT85W6O+0v0vPhu6XB+UrXuNahNms8gZV5PSm/E=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr7128485lfa.124.1658897476356; Tue, 26
 Jul 2022 21:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <46deff7d44ad806a4bfb9235e57b0d37d8cfa95c.1658141552.git.kangjie.xu@linux.alibaba.com>
 <3fd4d288-8db7-41f4-7e8b-0a8ef44c936f@redhat.com>
 <1b0f4eed-7925-949d-678a-f929c6baddda@linux.alibaba.com>
In-Reply-To: <1b0f4eed-7925-949d-678a-f929c6baddda@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 12:51:05 +0800
Message-ID: <CACGkMEsQ6aW-ihHoiioD5M6acVwQ2vgW97XJ0BoQxVtc3JnNVw@mail.gmail.com>
Subject: Re: [PATCH 09/16] vhost-user: enable/disable a single vring
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, hengqi@linux.alibaba.com, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 1:27 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/26 12:07, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >> Implement the vhost_set_single_vring_enable, which is to enable or
> >> disable a single vring.
> >>
> >> The parameter wait_for_reply is added to help for some cases such as
> >> vq reset.
> >>
> >> Meanwhile, vhost_user_set_vring_enable() is refactored.
> >>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >>   hw/virtio/vhost-user.c | 55 ++++++++++++++++++++++++++++++++++++----=
--
> >>   1 file changed, 48 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >> index 75b8df21a4..5a80a415f0 100644
> >> --- a/hw/virtio/vhost-user.c
> >> +++ b/hw/virtio/vhost-user.c
> >> @@ -267,6 +267,8 @@ struct scrub_regions {
> >>       int fd_idx;
> >>   };
> >>   +static int enforce_reply(struct vhost_dev *dev, const VhostUserMsg
> >> *msg);
> >> +
> >>   static bool ioeventfd_enabled(void)
> >>   {
> >>       return !kvm_enabled() || kvm_eventfds_enabled();
> >> @@ -1198,6 +1200,49 @@ static int vhost_user_set_vring_base(struct
> >> vhost_dev *dev,
> >>       return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
> >>   }
> >>   +
> >> +static int vhost_user_set_single_vring_enable(struct vhost_dev *dev,
> >> +                                              int index,
> >> +                                              int enable,
> >> +                                              bool wait_for_reply)
> >> +{
> >> +    int ret;
> >> +
> >> +    if (index < dev->vq_index || index >=3D dev->vq_index + dev->nvqs=
) {
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    struct vhost_vring_state state =3D {
> >> +        .index =3D index,
> >> +        .num   =3D enable,
> >> +    };
> >> +
> >> +    VhostUserMsg msg =3D {
> >> +        .hdr.request =3D VHOST_USER_SET_VRING_ENABLE,
> >> +        .hdr.flags =3D VHOST_USER_VERSION,
> >> +        .payload.state =3D state,
> >> +        .hdr.size =3D sizeof(msg.payload.state),
> >> +    };
> >> +
> >> +    bool reply_supported =3D virtio_has_feature(dev->protocol_feature=
s,
> >> + VHOST_USER_PROTOCOL_F_REPLY_ACK);
> >> +
> >> +    if (reply_supported && wait_for_reply) {
> >> +        msg.hdr.flags |=3D VHOST_USER_NEED_REPLY_MASK;
> >> +    }
> >
> >
> > Do we need to fail if !realy_supported && wait_for_reply?
> >
> > Thanks
> >
> >
> I guess you mean "should we fail if VHOST_USER_PROTOCOL_F_REPLY_ACK
> feature is not supported?".
>
> The implementation here is similar to that in vhost_user_set_vring_addr()=
.
>
> If this feature is not supported, it will call enforce_reply(), then
> call vhost_user_get_features() to get a reply.

Ok, so you meant we can then fallback to VHOST_USER_GET_FEATURES? I
wonder how robust is this, e.g is the bakcend required to process
vhost-user request in order?

Thanks

>
> Since the messages will be processed sequentailly in DPDK, success of
> enforce_reply() means the previous message VHOST_USER_SET_VRING_ENABLE
> has been processed.
>
> Thanks
>
> >
> >> +
> >> +    ret =3D vhost_user_write(dev, &msg, NULL, 0);
> >> +    if (ret < 0) {
> >> +        return ret;
> >> +    }
> >> +
> >> +    if (wait_for_reply) {
> >> +        return enforce_reply(dev, &msg);
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static int vhost_user_set_vring_enable(struct vhost_dev *dev, int
> >> enable)
> >>   {
> >>       int i;
> >> @@ -1207,13 +1252,8 @@ static int vhost_user_set_vring_enable(struct
> >> vhost_dev *dev, int enable)
> >>       }
> >>         for (i =3D 0; i < dev->nvqs; ++i) {
> >> -        int ret;
> >> -        struct vhost_vring_state state =3D {
> >> -            .index =3D dev->vq_index + i,
> >> -            .num   =3D enable,
> >> -        };
> >> -
> >> -        ret =3D vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE,
> >> &state);
> >> +        int ret =3D vhost_user_set_single_vring_enable(dev,
> >> dev->vq_index + i,
> >> +                                                     enable, false);
> >>           if (ret < 0) {
> >>               /*
> >>                * Restoring the previous state is likely infeasible,
> >> as well as
> >> @@ -2627,6 +2667,7 @@ const VhostOps user_ops =3D {
> >>           .vhost_set_owner =3D vhost_user_set_owner,
> >>           .vhost_reset_device =3D vhost_user_reset_device,
> >>           .vhost_get_vq_index =3D vhost_user_get_vq_index,
> >> +        .vhost_set_single_vring_enable =3D
> >> vhost_user_set_single_vring_enable,
> >>           .vhost_set_vring_enable =3D vhost_user_set_vring_enable,
> >>           .vhost_requires_shm_log =3D vhost_user_requires_shm_log,
> >>           .vhost_migration_done =3D vhost_user_migration_done,
>


