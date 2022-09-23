Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAEC5E7448
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:42:52 +0200 (CEST)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obcOh-0004As-Lu
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obc2F-0001eN-ML
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obc2A-0007gg-4L
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663913969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCzb7c+tyTlkHkLa4TGmfweIIl8/TjIZuUgOftkCKh0=;
 b=cR8NXf9QrUVPg2e/7sr5xV5l/CkyrLNNJjaEa2lOHghsBXXXFz+eyioGGNXRN+nTV5FEjM
 pk2+NIgRHjA/1Z9xzJVvgMm7P54tKKUDClW6rx+hA1pS9LCO9BMqskEjhr7Be5ZbF6Sj/5
 rOV7+PRcFiyEPgY8ehlq3Dz5yHUAMX8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-AUfGTBmfOwa1HmUfA_jkyw-1; Fri, 23 Sep 2022 02:19:28 -0400
X-MC-Unique: AUfGTBmfOwa1HmUfA_jkyw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so8082279edd.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MCzb7c+tyTlkHkLa4TGmfweIIl8/TjIZuUgOftkCKh0=;
 b=yU/r48lW1WtNCGp6sKHC3A/gabEIlq8IVynU3NjV6GU4aRSwpn34G99xOa/z4wa3Al
 NRCS/zrXKqF+fl9AhOOhyliSPT0d4JRrJx1p9bIVmZT4VWzqaNhB67oRQn2fEAW9Q0D/
 agid09KjcuFZNnsG/DbsQZiJnFKaYTKq0ilCH5Mkf/g+aZdBvDEN0OH2/rXnqdRsY2Hu
 yji5wFkVCEzvf8WNmtZEnPMkXr+Lz5eySFu1WP61JDmsuvujIuRukfyrj8Eb7Qndw1us
 wawtDLYWEg3GKPEeqItiUHuKEMjq2/cz/NuY8W+0HTQ1rGuDdyWHuqLCV1UjJUTdBJhv
 BuTw==
X-Gm-Message-State: ACrzQf1TK3G6LfqEOpc+/zOm2p9s5lDXp2zt2aS3a2rhMwQu3/A2N5Zn
 PosRnr9H2Dc7SNIKU16EbJAJKH2y37+hvPT/r5STW9sXYFI6fpZjidwR8az47purwxoAzLlc1uR
 c7FeMI3WlQR0N/tc=
X-Received: by 2002:a17:906:9bce:b0:770:2600:2cef with SMTP id
 de14-20020a1709069bce00b0077026002cefmr5463903ejc.611.1663913966580; 
 Thu, 22 Sep 2022 23:19:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5AYzGXbnoHGySeHW+poTud1qoybIfDgNJdZ6TLrqCn0u8whzIEQm9xdNdkeofAVB3pRoMeSg==
X-Received: by 2002:a17:906:9bce:b0:770:2600:2cef with SMTP id
 de14-20020a1709069bce00b0077026002cefmr5463888ejc.611.1663913966242; 
 Thu, 22 Sep 2022 23:19:26 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 p13-20020a056402044d00b00456d2721d93sm95421edw.64.2022.09.22.23.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 23:19:25 -0700 (PDT)
Date: Fri, 23 Sep 2022 02:19:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "houyl@yusur.tech" <houyl@yusur.tech>,
 "raphael.norwitz" <raphael.norwitz@nutanix.com>,
 kwolf <kwolf@redhat.com>, hreitz <hreitz@redhat.com>,
 qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, zy <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>,
 =?utf-8?B?6ZmI5rWp?= <chenh@yusur.tech>
Subject: Re: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa
 device's mac address automatically
Message-ID: <20220923020312-mutt-send-email-mst@kernel.org>
References: <20220921060026.392164-1-chenh@yusur.tech>
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
 <2022092311532239888519@yusur.tech>
 <CACGkMEvbwrRWYxDpxYYmU3u9E-Z4TSnRdsuD4XUB_ft4+2=Nqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEvbwrRWYxDpxYYmU3u9E-Z4TSnRdsuD4XUB_ft4+2=Nqg@mail.gmail.com>
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

On Fri, Sep 23, 2022 at 12:05:40PM +0800, Jason Wang wrote:
> On Fri, Sep 23, 2022 at 11:55 AM houyl@yusur.tech <houyl@yusur.tech> wrote:
> >
> > On Thu, 22 Sep 2022 09:34:41 +0800 Jason Wang<jasowang@redhat.com>  wrote:
> >
> >
> > >On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz
> > ><raphael.norwitz@nutanix.com> wrote:
> > >>
> > >> If I read your response on the other thread correctly, this change is intended
> > >>
> > >> to prioritize the MAC address exposed by DPDK over the one provided by the
> > >>
> > >> QEMU command line? Sounds reasonable in principle, but I would get confirmation
> > >>
> > >> from vDPA/vhost-net maintainers.
> >
> > >I think the best way is to (and it seems easier)
> >
> > >1) have the management layer to make sure the mac came from cli
> > >matches the underlayer vDPA
> >
> >  Agreed, that's no problem.

Actually, if we start failing here, won't it break working designs
in which vhost user does not really have a valid mac?

I am not sure we can start changing things so easily.
Let's add a protocol feature?


> > >2) having a sanity check and fail the device initialization if they don't match
> >
> > However, one MAC address for integrity check is from the cli, and the other MAC address is from the vDPA device,
> > How to get it?
> 
> VHOST_USER_GET_CONFIG?
> 
> Thanks
> 
> >
> > The current situation is if MAC came from cli don't match the underlayer vDPA, the virtual machine can still start without any hints.
> >
> > Thanks
> >
> >
> > >Thanks
> >
> > >>
> > >>
> > >>
> > >> That said the way you’re hacking the vhost-user code breaks a valuable check for
> > >>
> > >> bad vhost-user-blk backends. I would suggest finding another implementation which
> > >>
> > >> does not regress functionality for other device types.
> > >>
> > >>
> > >>
> > >>
> > >>
> > >> >From: Hao Chen <chenh@yusur.tech>
> > >>
> > >> >
> > >>
> > >> >When use dpdk-vdpa tests vdpa device. You need to specify the mac address to
> > >>
> > >> >start the virtual machine through libvirt or qemu, but now, the libvirt or
> > >>
> > >> >qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_get_config
> > >>
> > >> >to get the mac address of the vdpa hardware without manual configuration.
> > >>
> > >> >
> > >>
> > >> >v1->v2:
> > >>
> > >> >Only copy ETH_ALEN data of netcfg for some vdpa device such as
> > >>
> > >> >NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> > >>
> > >> >We only need the mac address and don't care about the status field.
> > >>
> > >> >
> > >>
> > >> >Signed-off-by: Hao Chen <chenh@yusur.tech>
> > >>
> > >> >---
> > >>
> > >> > hw/block/vhost-user-blk.c |  1 -
> > >>
> > >> > hw/net/virtio-net.c       |  7 +++++++
> > >>
> > >> > hw/virtio/vhost-user.c    | 19 -------------------
> > >>
> > >> > 3 files changed, 7 insertions(+), 20 deletions(-)
> > >>
> > >> >
> > >>
> > >> >diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > >>
> > >> >index 9117222456..5dca4eab09 100644
> > >>
> > >> >--- a/hw/block/vhost-user-blk.c
> > >>
> > >> >+++ b/hw/block/vhost-user-blk.c
> > >>
> > >> >@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
> > >>
> > >> >
> > >>
> > >> >     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> > >>
> > >> >
> > >>
> > >> >-    s->vhost_user.supports_config = true;
> > >>
> > >> >     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
> > >>
> > >> >                          errp);
> > >>
> > >> >     if (ret < 0) {
> > >>
> > >> >diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > >>
> > >> >index dd0d056fde..90405083b1 100644
> > >>
> > >> >--- a/hw/net/virtio-net.c
> > >>
> > >> >+++ b/hw/net/virtio-net.c
> > >>
> > >> >@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> > >>
> > >> >             }
> > >>
> > >> >             memcpy(config, &netcfg, n->config_size);
> > >>
> > >> >         }
> > >>
> > >> >+    } else if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> > >>
> > >> >+        ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> > >>
> > >> >+                                   n->config_size);
> > >>
> > >> >+        if (ret != -1) {
> > >>
> > >> >+               /* Automatically obtain the mac address of the vdpa device
> > >>
> > >> >+                * when using the dpdk vdpa */
> > >>
> > >> >+                memcpy(config, &netcfg, ETH_ALEN);
> > >>
> > >> >     }
> > >>
> > >> > }
> > >>
> > >> >
> > >>
> > >> >diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > >>
> > >> >index bd24741be8..8b01078249 100644
> > >>
> > >> >--- a/hw/virtio/vhost-user.c
> > >>
> > >> >+++ b/hw/virtio/vhost-user.c
> > >>
> > >> >@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> > >>
> > >> >     }
> > >>
> > >> >
> > >>
> > >> >     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> > >>
> > >> >-        bool supports_f_config = vus->supports_config ||
> > >>
> > >> >-            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
> > >>
> > >> >         uint64_t protocol_features;
> > >>
> > >> >
> > >>
> > >> >         dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> > >>
> > >> >@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
> > >>
> > >> >          */
> > >>
> > >> >         protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
> > >>
> > >> >
> > >>
> > >> >-        if (supports_f_config) {
> > >>
> > >> >-            if (!virtio_has_feature(protocol_features,
> > >>
> > >> >-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> > >>
> > >> >-                error_setg(errp, "vhost-user device expecting "
> > >>
> > >> >-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
> > >>
> > >> >-                           "not support it.");
> > >>
> > >> >-                return -EPROTO;
> > >>
> > >> >-            }
> > >>
> > >> >-        } else {
> > >>
> > >> >-            if (virtio_has_feature(protocol_features,
> > >>
> > >> >-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> > >>
> > >> >-                warn_reportf_err(*errp, "vhost-user backend supports "
> > >>
> > >> >-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> > >>
> > >> >-                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
> > >>
> > >> >-            }
> > >>
> > >> >-        }
> > >>
> > >> >-
> > >>
> > >> >         /* final set of protocol features */
> > >>
> > >> >         dev->protocol_features = protocol_features;
> > >>
> > >> >         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
> > >>
> > >> >--
> > >>
> > >> >2.27.0
> > >>
> > >> >
> > >>
> > >>
> >


