Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454415E5FBF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:22:09 +0200 (CEST)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJLM-0005ZL-2p
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obJ6y-0007Ui-3q
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:07:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obJ6t-0007Fm-R7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:07:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v3-20020a1cac03000000b003b4fd0fe6c0so978731wme.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=uczRyCAm3jxNp8UeNAadlhN7Zc63BlbZfM3Mr9D7fow=;
 b=GP9MGz7iGKzBPvs2vnEIOasg7rg91x0bFk0hIN2u02PL5DEGHqAH4ilKQXJMZ47gfJ
 3MH9LT6LXjx1ih4GrxcFnTVAgtJl495t+RVSfiheW6oXTGNQsB70Pk5PfSTsspCKEv/4
 i7R8nJ74H0D9mdu4//2hPEPXoqUsOHsbkU5YUSJPDivVsiG92lF8/LnsbjNH4fLltaDX
 WTw15+oiu5nK51tXk83f3OjYaC2DjJpKm2HuOPBdAZQJUQzET9Xp2iBhEDjtZYxO9WuV
 ZP5DSSlpzGRDUBQewbb4+vAa7MVWPLfCQsJVC8taptbeGxAEg0qVpmmRR4ri4Wqon+Jq
 brHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=uczRyCAm3jxNp8UeNAadlhN7Zc63BlbZfM3Mr9D7fow=;
 b=tTA7dnh+LuYHo1C1eueDgA/tIneDUpUFglp/ETGFwO/b7RgUR231X9yLyU7gQ5UJ4r
 w1DJdTF7fqqNJRnduTgodOXqeHrUtCluqutMng/5u/W3rmi4EaGq+7z250P1J3fILQIN
 IvSMyw3gQRLd5cvdOoDhzIgaV1D9LVFQCn2X4LdBhqSYsH5TGifXBSQdvref0kt/mM65
 qRrV6csO6EvdFFTRBlj3+g1Vb/kt5nIj2FT9skzY/7AdCSY/1z+XwmFy2W5zXqXPNVHw
 Jqz1QGmpZSMa1a+Mqq08tPhdTAbenM/KevtD7eCXvHPhM57t5Gyqulc+9/D2W/BP02El
 CAoQ==
X-Gm-Message-State: ACrzQf2l3Hsh4HGOG8BCn8whOddwauqQhfyMZNY7iz7k26xyt7Tp9TB6
 nHWeuj1q7oxnuqsiI7sM3/9Ts7jOBKnjWg==
X-Google-Smtp-Source: AMsMyM5jcTd3zu/+fYvzLuUTlgFjCuuZ5YOhxE2DNZrceANKKi5MilMUpJZmBBSP0IpOa5uANI88MQ==
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr1730436wmq.47.1663841229834; 
 Thu, 22 Sep 2022 03:07:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bh18-20020a05600c3d1200b003a604a29a34sm5552240wmb.35.2022.09.22.03.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:07:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E3E81FFB7;
 Thu, 22 Sep 2022 11:07:08 +0100 (BST)
References: <20220921060026.392164-1-chenh@yusur.tech>
 <87mtas60x8.fsf@linaro.org>
 <20220921152402-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: chenh <chenh@yusur.tech>, raphael.norwitz@nutanix.com,
 jasowang@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, houyl@yusur.tech, zy@yusur.tech, lulu@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Date: Thu, 22 Sep 2022 11:02:56 +0100
In-reply-to: <20220921152402-mutt-send-email-mst@kernel.org>
Message-ID: <87a66r67uc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Sep 21, 2022 at 07:23:12PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> chenh <chenh@yusur.tech> writes:
>>=20
>> > From: Hao Chen <chenh@yusur.tech>
>> >
>> > When use dpdk-vdpa tests vdpa device. You need to specify the mac addr=
ess to
>> > start the virtual machine through libvirt or qemu, but now, the libvir=
t or
>> > qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_=
net_get_config
>> > to get the mac address of the vdpa hardware without manual configurati=
on.
>> >
>> > v1->v2:
>> > Only copy ETH_ALEN data of netcfg for some vdpa device such as
>> > NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
>> > We only need the mac address and don't care about the status field.
>> >
>> > Signed-off-by: Hao Chen <chenh@yusur.tech>
>> > ---
>> >  hw/block/vhost-user-blk.c |  1 -
>> >  hw/net/virtio-net.c       |  7 +++++++
>> >  hw/virtio/vhost-user.c    | 19 -------------------
>> >  3 files changed, 7 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>> > index 9117222456..5dca4eab09 100644
>> > --- a/hw/block/vhost-user-blk.c
>> > +++ b/hw/block/vhost-user-blk.c
>> > @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev=
, Error **errp)
>> >=20=20
>> >      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>> >=20=20
>> > -    s->vhost_user.supports_config =3D true;
>>=20
>> <snip>
>>=20
>> NACK from me. The supports_config flag is there for a reason.
>
>
> Alex please, do not send NACKs. If you feel compelled to stress
> your point, provide extra justification instead. Thanks!

OK I was objecting to ripping out the common vhost-user code which was
implemented as a fix for behaviour found while attempting to upstream:

  Subject: [PATCH  v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
  Date: Tue,  2 Aug 2022 10:49:48 +0100
  Message-Id: <20220802095010.3330793-1-alex.bennee@linaro.org>

I vhost-user-blk wants to suppress its use of vhost-user config messages
I guess that should be a control option but it sounds like a buggy
back-end.

>
>> >=20=20
>> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> > index bd24741be8..8b01078249 100644
>> > --- a/hw/virtio/vhost-user.c
>> > +++ b/hw/virtio/vhost-user.c
>> > @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_=
dev *dev, void *opaque,
>> >      }
>> >=20=20
>> >      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES))=
 {
>> > -        bool supports_f_config =3D vus->supports_config ||
>> > -            (dev->config_ops && dev->config_ops->vhost_dev_config_not=
ifier);
>> >          uint64_t protocol_features;
>> >=20=20
>> >          dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEAT=
URES;
>> > @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost=
_dev *dev, void *opaque,
>> >           */
>> >          protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
>> >=20=20
>> > -        if (supports_f_config) {
>> > -            if (!virtio_has_feature(protocol_features,
>> > -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
>> > -                error_setg(errp, "vhost-user device expecting "
>> > -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhos=
t-user backend does "
>> > -                           "not support it.");
>> > -                return -EPROTO;
>> > -            }
>> > -        } else {
>> > -            if (virtio_has_feature(protocol_features,
>> > -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
>> > -                warn_reportf_err(*errp, "vhost-user backend supports "
>> > -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QE=
MU does not.");
>> > -                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_=
F_CONFIG);
>> > -            }
>> > -        }
>> > -
>> >          /* final set of protocol features */
>> >          dev->protocol_features =3D protocol_features;
>> >          err =3D vhost_user_set_protocol_features(dev, dev->protocol_f=
eatures);
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

