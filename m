Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297735E53CB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 21:28:33 +0200 (CEST)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob5OY-0001Df-M3
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 15:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ob5LL-0007Rs-6M
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:25:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ob5LH-0006UN-Kp
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663788303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC3mH+bqHeV0UzZAnLkPwQeZ8FCCH00N8E9bllM4Jk0=;
 b=G73F+BNBLmwwUHbFICQcd0PgI2v5h4hU+b9CzMLKmBWGOstldlN5D5blO8O4noeGCzo6uc
 7et5lI5w5CooyoceS1oWH6HWwixZ06jidKP6WHGwIB48aPP9WgWjVuROZLEfztIIGD+M0L
 Bove1E7e+pP5f++H1wxP04envCzyCWs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-XKxLd3oBMYSv6WIs0iS-Lg-1; Wed, 21 Sep 2022 15:25:02 -0400
X-MC-Unique: XKxLd3oBMYSv6WIs0iS-Lg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so8334138wms.5
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 12:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GC3mH+bqHeV0UzZAnLkPwQeZ8FCCH00N8E9bllM4Jk0=;
 b=wa+fs2g0txEvQXGHnSj82KE3r9tkaKhYt0NbuilfdI/0+KJTp0eaUaGJXoWRfkPAKU
 MGYV9bWhQtEmKIKJR9YpNTFcb+A6NiDB3HRQCt+3/+/aprujZAenIElF/cT/yLpKvoYj
 7ScyPt7W78wEhP2lsHlPfUwgsWso7zAvReMtllHfa+nUqZNSZk+0H6zMKxLYn/XukVa5
 oGdHpt4G9HgpnOONKRXw1VJpvlv99Hl0frjTpm4oEonBHjKrk8TkAPXrq4MCnTdq5VT1
 NF+zQzaaaBYU3AQOAEwoc5g3r8K1cG6tHyQl+4bdlgRUplt5hfZpGZScxI4OnknBGQGU
 L+bQ==
X-Gm-Message-State: ACrzQf36sHhX79PQvaM1pES+sYoNKIABBbNTgpLMwkDf2VzPaSBwHH2a
 /V6ilMVF1G179kJLPsCg8LGqgVlBaxATRR0laGpMWNFuPOsqqEX7S12IAGrFRPI3iFNKDs0haht
 tYuoaVyDHiHnR0F4=
X-Received: by 2002:a5d:64a8:0:b0:226:f3f3:9914 with SMTP id
 m8-20020a5d64a8000000b00226f3f39914mr17472013wrp.343.1663788300257; 
 Wed, 21 Sep 2022 12:25:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LzDE13493mMvQqdKMcFBy1WvNYqj9yPjrc2iFYaaeantCm973puqzQnoiXhG8tRHnXoFbaQ==
X-Received: by 2002:a5d:64a8:0:b0:226:f3f3:9914 with SMTP id
 m8-20020a5d64a8000000b00226f3f39914mr17471989wrp.343.1663788299881; 
 Wed, 21 Sep 2022 12:24:59 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5227000000b00228dff8d975sm3178078wra.109.2022.09.21.12.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 12:24:59 -0700 (PDT)
Date: Wed, 21 Sep 2022 15:24:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: chenh <chenh@yusur.tech>, raphael.norwitz@nutanix.com,
 jasowang@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, houyl@yusur.tech, zy@yusur.tech,
 lulu@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Message-ID: <20220921152402-mutt-send-email-mst@kernel.org>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <87mtas60x8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtas60x8.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Sep 21, 2022 at 07:23:12PM +0100, Alex Bennée wrote:
> 
> chenh <chenh@yusur.tech> writes:
> 
> > From: Hao Chen <chenh@yusur.tech>
> >
> > When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
> > start the virtual machine through libvirt or qemu, but now, the libvirt or
> > qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
> > to get the mac address of the vdpa hardware without manual configuration.
> >
> > v1->v2:
> > Only copy ETH_ALEN data of netcfg for some vdpa device such as
> > NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> > We only need the mac address and don't care about the status field.
> >
> > Signed-off-by: Hao Chen <chenh@yusur.tech>
> > ---
> >  hw/block/vhost-user-blk.c |  1 -
> >  hw/net/virtio-net.c       |  7 +++++++
> >  hw/virtio/vhost-user.c    | 19 -------------------
> >  3 files changed, 7 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 9117222456..5dca4eab09 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
> >  
> >      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> >  
> > -    s->vhost_user.supports_config = true;
> 
> <snip>
> 
> NACK from me. The supports_config flag is there for a reason.


Alex please, do not send NACKs. If you feel compelled to stress
your point, provide extra justification instead. Thanks!

> >  
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index bd24741be8..8b01078249 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >      }
> >  
> >      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> > -        bool supports_f_config = vus->supports_config ||
> > -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> >          uint64_t protocol_features;
> >  
> >          dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> > @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >           */
> >          protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> >  
> > -        if (supports_f_config) {
> > -            if (!virtio_has_feature(protocol_features,
> > -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> > -                error_setg(errp, "vhost-user device expecting "
> > -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> > -                           "not support it.");
> > -                return -EPROTO;
> > -            }
> > -        } else {
> > -            if (virtio_has_feature(protocol_features,
> > -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> > -                warn_reportf_err(*errp, "vhost-user backend supports "
> > -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> > -                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> > -            }
> > -        }
> > -
> >          /* final set of protocol features */
> >          dev->protocol_features = protocol_features;
> >          err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> 
> 
> -- 
> Alex Bennée


