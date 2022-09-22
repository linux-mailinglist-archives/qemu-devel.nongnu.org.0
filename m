Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24535E5FDA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:28:14 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJRF-0001sw-L9
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJIo-0003C4-RF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJIl-0003kb-EC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663841966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHQw8WD9blMLBiL5TDGppFr6cgt4+9OoSkxGbFVX5Ng=;
 b=frQip+mfWxsBwXDmRdkzAatidVOj/9scK1Bh3qxUKFj7lnagOpVESLSX9V+yLgxMW6AOuS
 pXNSEWK98zti7rFuDu4qOZY/9gcebnAhHv6/dB6w+ZJubXQeDzvmlRX2TTx0OX/oR76A08
 zZTFCA9EhqCwPj5yyFnyNiA248XW4MA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-KTHIu401MG6fPpwd44QuGg-1; Thu, 22 Sep 2022 06:19:25 -0400
X-MC-Unique: KTHIu401MG6fPpwd44QuGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b003b4fca0e80cso1759169wme.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YHQw8WD9blMLBiL5TDGppFr6cgt4+9OoSkxGbFVX5Ng=;
 b=i8VHT0+w7cGG20sqZWZ+ivh2hP9NC4ODRlWvPg494HoXvejeAk1BTgcl3XEcOgymRi
 TgWuYOvevTIc2fq2n0AWFBAGsSGxI+QkLJgBENQuqce4MsVlwyn4YMPM+SlAARUIfT3o
 oWjccNmiIYHOqKhRqSd1m/cJ5tkA4uIvbbs1SWNJOr6z/ztAqWtU/rk3TKEfL2I49PNp
 n25nvtSGRcW/WFbx7Yfk0ehtCC1aI9rnAfqZ53aWWGMcmzDQXMVZu3dfw/Bh++dhIWa8
 5RNEL2p/mwN1Z4pCehEYepVNPbkqZ+dPw0HYEhGpbdyRoNbV7IXdjYaWHxtEqjzWEpSh
 1mwQ==
X-Gm-Message-State: ACrzQf2A0kZcwrSQM8wdYYg9sy7B7nckPsNHbL/8NKs3XioqiFv/253N
 66Lon2UXx6BpG6Vvse6e3qkU9SA8DQlKaEd5efWpGyqGTcdbaL/ODTThfsvYx7AYSvjV3mliJF/
 08mJir4iP8cszzBk=
X-Received: by 2002:a5d:5b18:0:b0:22a:fb91:3d6b with SMTP id
 bx24-20020a5d5b18000000b0022afb913d6bmr1608154wrb.56.1663841963565; 
 Thu, 22 Sep 2022 03:19:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vTPFjJHDH8HIYi5/NickfFl+QyTGgN+OXmk+1ubfSTF+8DBoyJE9m2PLE4VGusSP3ZNfEyA==
X-Received: by 2002:a5d:5b18:0:b0:22a:fb91:3d6b with SMTP id
 bx24-20020a5d5b18000000b0022afb913d6bmr1608138wrb.56.1663841963254; 
 Thu, 22 Sep 2022 03:19:23 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4b9200b003b486027c8asm5177391wmp.20.2022.09.22.03.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:19:22 -0700 (PDT)
Date: Thu, 22 Sep 2022 06:19:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: chenh <chenh@yusur.tech>, raphael.norwitz@nutanix.com,
 jasowang@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, houyl@yusur.tech, zy@yusur.tech,
 lulu@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Message-ID: <20220922061828-mutt-send-email-mst@kernel.org>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <87mtas60x8.fsf@linaro.org>
 <20220921152402-mutt-send-email-mst@kernel.org>
 <87a66r67uc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a66r67uc.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 22, 2022 at 11:02:56AM +0100, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Sep 21, 2022 at 07:23:12PM +0100, Alex Bennée wrote:
> >> 
> >> chenh <chenh@yusur.tech> writes:
> >> 
> >> > From: Hao Chen <chenh@yusur.tech>
> >> >
> >> > When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
> >> > start the virtual machine through libvirt or qemu, but now, the libvirt or
> >> > qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
> >> > to get the mac address of the vdpa hardware without manual configuration.
> >> >
> >> > v1->v2:
> >> > Only copy ETH_ALEN data of netcfg for some vdpa device such as
> >> > NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> >> > We only need the mac address and don't care about the status field.
> >> >
> >> > Signed-off-by: Hao Chen <chenh@yusur.tech>
> >> > ---
> >> >  hw/block/vhost-user-blk.c |  1 -
> >> >  hw/net/virtio-net.c       |  7 +++++++
> >> >  hw/virtio/vhost-user.c    | 19 -------------------
> >> >  3 files changed, 7 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >> > index 9117222456..5dca4eab09 100644
> >> > --- a/hw/block/vhost-user-blk.c
> >> > +++ b/hw/block/vhost-user-blk.c
> >> > @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
> >> >  
> >> >      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> >> >  
> >> > -    s->vhost_user.supports_config = true;
> >> 
> >> <snip>
> >> 
> >> NACK from me. The supports_config flag is there for a reason.
> >
> >
> > Alex please, do not send NACKs. If you feel compelled to stress
> > your point, provide extra justification instead. Thanks!
> 
> OK I was objecting to ripping out the common vhost-user code which was
> implemented as a fix for behaviour found while attempting to upstream:
> 
>   Subject: [PATCH  v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
>   Date: Tue,  2 Aug 2022 10:49:48 +0100
>   Message-Id: <20220802095010.3330793-1-alex.bennee@linaro.org>
> 
> I vhost-user-blk wants to suppress its use of vhost-user config messages
> I guess that should be a control option but it sounds like a buggy
> back-end.

Thanks for the review!

> >
> >> >  
> >> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >> > index bd24741be8..8b01078249 100644
> >> > --- a/hw/virtio/vhost-user.c
> >> > +++ b/hw/virtio/vhost-user.c
> >> > @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >> >      }
> >> >  
> >> >      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> >> > -        bool supports_f_config = vus->supports_config ||
> >> > -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> >> >          uint64_t protocol_features;
> >> >  
> >> >          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> >> > @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >> >           */
> >> >          protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> >> >  
> >> > -        if (supports_f_config) {
> >> > -            if (!virtio_has_feature(protocol_features,
> >> > -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> >> > -                error_setg(errp, "vhost-user device expecting "
> >> > -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> >> > -                           "not support it.");
> >> > -                return -EPROTO;
> >> > -            }
> >> > -        } else {
> >> > -            if (virtio_has_feature(protocol_features,
> >> > -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> >> > -                warn_reportf_err(*errp, "vhost-user backend supports "
> >> > -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> >> > -                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> >> > -            }
> >> > -        }
> >> > -
> >> >          /* final set of protocol features */
> >> >          dev->protocol_features = protocol_features;
> >> >          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> 
> 
> -- 
> Alex Bennée


