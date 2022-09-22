Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C85E6028
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:46:51 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJjG-0007nx-BA
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obIwl-0000sV-L7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:56:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obIwj-0006d8-B9
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663840600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/qvRhsn/UpkmN5nPhvw6BSP9Y5PSitoCUzTzNqt70I=;
 b=HRPGZva0D0J8JAVJ7etaewt2D4csKNyyTu5du3y1TsoRtDH1crPp8826+9wasbwFOVqLp8
 VCJix4JHJW3vAxeADr2Ryb/jYosJD7rWeny4N9QtzvGF1iPz/fgZYk7CjW+rPEpco/aM9+
 rMb7LRpnyDHgcn+F6PzMmYIYs6YYKfg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-2bdDW5KWMvOI3_8pOeEYAA-1; Thu, 22 Sep 2022 05:56:39 -0400
X-MC-Unique: 2bdDW5KWMvOI3_8pOeEYAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h20-20020adfaa94000000b0022af8c26b72so3058611wrc.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 02:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=B/qvRhsn/UpkmN5nPhvw6BSP9Y5PSitoCUzTzNqt70I=;
 b=sQa8dQNX8vXBFEoPzmhgqDWV7qI49avz2ZFqj9VHzOnMLaU7Ypf4LAV06LoNi7CNf/
 eD/3ty1zUHLhrEzcQfNYbJ+T7g+3PzfUF5ZxKYzlnNRv5ar8WFUZndCew5qLSNVxHr2O
 FtkRt/S97F5vsWuuWqMM7bOD+Wcaif5uWiqin1+xiiGXJzaGFqCIoKsd+aHIKT92aQr+
 vx4bEoedh9nLt1k0eXCTuPc+MHsimt66UIDPgPtiEd81i2+YRiHgWmnXf7f5+ZzEAmay
 7znJKUMgyGZvivI3gYzKIqLktqGhury114Qa5DRzttTXTodymix64yuwX6AcjceL4NW3
 ZvOA==
X-Gm-Message-State: ACrzQf20UYN1pvdsfylTWSIUWYUv4Jytj7D/Rq5WvYurPwinAL/tM+qJ
 CoxiBS3nJ32F0jiiSGmkcATx4Gt6N0wsLs4Xl81mH1l0A5GD2Lz/Tamrh+TRMDKNRsSPiOh4bRn
 UyI+f38MrgaA8pns=
X-Received: by 2002:a05:6000:186f:b0:228:e1ab:673 with SMTP id
 d15-20020a056000186f00b00228e1ab0673mr1486130wri.324.1663840597942; 
 Thu, 22 Sep 2022 02:56:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bkPwYDYZ54t8V24iXl2485Jlo9APV7l5AqmBcc7z2wNkPBAzpB0oJCN8W2/pIMOddoEZXJQ==
X-Received: by 2002:a05:6000:186f:b0:228:e1ab:673 with SMTP id
 d15-20020a056000186f00b00228e1ab0673mr1486113wri.324.1663840597720; 
 Thu, 22 Sep 2022 02:56:37 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d5281000000b002287d99b455sm4621133wrv.15.2022.09.22.02.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 02:56:36 -0700 (PDT)
Date: Thu, 22 Sep 2022 05:56:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "houyl@yusur.tech" <houyl@yusur.tech>, "zy@yusur.tech" <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>, Hao Chen <chenh@yusur.tech>
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Message-ID: <20220922055531-mutt-send-email-mst@kernel.org>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Sep 22, 2022 at 09:34:41AM +0800, Jason Wang wrote:
> On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
> <raphael.norwitz@nutanix.com> wrote:
> >
> > If I read your response on the other thread correctly, this change is intended
> >
> > to prioritize the MAC address exposed by DPDK over the one provided by the
> >
> > QEMU command line? Sounds reasonable in principle, but I would get confirmation
> >
> > from vDPA/vhost-net maintainers.
> 
> I think the best way is to (and it seems easier)
> 
> 1) have the management layer to make sure the mac came from cli
> matches the underlayer vDPA
> 2) having a sanity check and fail the device initialization if they don't match
> 
> Thanks

I think I agree, we should not overwrite user supplied arguments.
I think the case where we might want to get the mac from VDPA
and use it is when it's been assigned randomly as opposed to coming from cli.


> >
> >
> >
> > That said the way you’re hacking the vhost-user code breaks a valuable check for
> >
> > bad vhost-user-blk backends. I would suggest finding another implementation which
> >
> > does not regress functionality for other device types.
> >
> >
> >
> >
> >
> > >From: Hao Chen <chenh@yusur.tech>
> >
> > >
> >
> > >When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
> >
> > >start the virtual machine through libvirt or qemu, but now, the libvirt or
> >
> > >qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
> >
> > >to get the mac address of the vdpa hardware without manual configuration.
> >
> > >
> >
> > >v1->v2:
> >
> > >Only copy ETH_ALEN data of netcfg for some vdpa device such as
> >
> > >NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> >
> > >We only need the mac address and don't care about the status field.
> >
> > >
> >
> > >Signed-off-by: Hao Chen <chenh@yusur.tech>
> >
> > >---
> >
> > > hw/block/vhost-user-blk.c |  1 -
> >
> > > hw/net/virtio-net.c       |  7 +++++++
> >
> > > hw/virtio/vhost-user.c    | 19 -------------------
> >
> > > 3 files changed, 7 insertions(+), 20 deletions(-)
> >
> > >
> >
> > >diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >
> > >index 9117222456..5dca4eab09 100644
> >
> > >--- a/hw/block/vhost-user-blk.c
> >
> > >+++ b/hw/block/vhost-user-blk.c
> >
> > >@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
> >
> > >
> >
> > >     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> >
> > >
> >
> > >-    s->vhost_user.supports_config = true;
> >
> > >     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
> >
> > >                          errp);
> >
> > >     if (ret < 0) {
> >
> > >diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >
> > >index dd0d056fde..90405083b1 100644
> >
> > >--- a/hw/net/virtio-net.c
> >
> > >+++ b/hw/net/virtio-net.c
> >
> > >@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >
> > >             }
> >
> > >             memcpy(config, &netcfg, n->config_size);
> >
> > >         }
> >
> > >+    } else if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> >
> > >+        ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> >
> > >+                                   n->config_size);
> >
> > >+        if (ret != -1) {
> >
> > >+               /* Automatically obtain the mac address of the vdpa device
> >
> > >+                * when using the dpdk vdpa */
> >
> > >+                memcpy(config, &netcfg, ETH_ALEN);
> >
> > >     }
> >
> > > }
> >
> > >
> >
> > >diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> >
> > >index bd24741be8..8b01078249 100644
> >
> > >--- a/hw/virtio/vhost-user.c
> >
> > >+++ b/hw/virtio/vhost-user.c
> >
> > >@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >
> > >     }
> >
> > >
> >
> > >     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> >
> > >-        bool supports_f_config = vus->supports_config ||
> >
> > >-            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> >
> > >         uint64_t protocol_features;
> >
> > >
> >
> > >         dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> >
> > >@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> >
> > >          */
> >
> > >         protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> >
> > >
> >
> > >-        if (supports_f_config) {
> >
> > >-            if (!virtio_has_feature(protocol_features,
> >
> > >-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> >
> > >-                error_setg(errp, "vhost-user device expecting "
> >
> > >-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> >
> > >-                           "not support it.");
> >
> > >-                return -EPROTO;
> >
> > >-            }
> >
> > >-        } else {
> >
> > >-            if (virtio_has_feature(protocol_features,
> >
> > >-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> >
> > >-                warn_reportf_err(*errp, "vhost-user backend supports "
> >
> > >-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> >
> > >-                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> >
> > >-            }
> >
> > >-        }
> >
> > >-
> >
> > >         /* final set of protocol features */
> >
> > >         dev->protocol_features = protocol_features;
> >
> > >         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> >
> > >--
> >
> > >2.27.0
> >
> > >
> >
> >


