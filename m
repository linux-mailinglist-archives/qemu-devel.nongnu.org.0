Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76175B31FC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:43:20 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZbb-0002hn-Bt
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWZWw-0008Vb-RR
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWZWt-0007jH-QM
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662712706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j11WjbQNNKhtDekz51S+uLyTwwWCmVPjwdFaQikWouI=;
 b=IYQXXLiRqWSgNqXPn5SLhdUCK66QrOJ2GUaURBkaMyj6qrNh1K4bI0wZFUJDi/qUaSrKwl
 TH70axCL3RsNXuWWVo7M2yYsEZlPp4U2fMg/+LNEn/cg4k5NLHImJ4ccvmjoslZKJUrlw8
 TkkhDd9cn09iBQMIQ+LjkhO8aZ8tGVg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-VKKdwadqMBmTvEMoSdqZlA-1; Fri, 09 Sep 2022 04:38:25 -0400
X-MC-Unique: VKKdwadqMBmTvEMoSdqZlA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r128-20020a1c4486000000b003b3f017f259so523662wma.3
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=j11WjbQNNKhtDekz51S+uLyTwwWCmVPjwdFaQikWouI=;
 b=C7/DwYyi84F0AWpPbgNl3fi8vySYHid47lOxNmoO74TQvztmDQdydNx7UzC9/s3LZY
 FIDAOuwF5lXcX8UV59gEPdoFeje603JFMeI2zJExf02dURthxA7Mpotv2ND8WDkLGf1q
 TkOGTasYOxDfX/uWkHQF1AynryU+I/FWgTqoJhLUYzt3tZrQwsXS6nQPputlYDGz34AL
 kgFarvIpI8ZlEvFSVfrEcdIRa7enkVIwIbQV/ZYi18p9qpUlgeM0kG4nH0ihI6MJaL1D
 r6/7JFgJlDoVK3qNtMmeCtgoTzLaU6lWGtHevH4gavTeDsOs3S4kjIbgV54DtNh7o3ec
 LVLQ==
X-Gm-Message-State: ACgBeo1R82w2jtyva+3xjImZOmV7V03Q2izXtop9wG01VIzD5nd22E1G
 ZvbtuHUAlTijoT1zIKR29twDrNzXlNGy4vpRsMi8pN1ce9Xz5UIceAEH3meR+wrPQMeOYXFcYSQ
 CgMCspO2bA05ktSI=
X-Received: by 2002:a05:6000:1863:b0:220:6d5f:deb5 with SMTP id
 d3-20020a056000186300b002206d5fdeb5mr7178532wri.470.1662712704110; 
 Fri, 09 Sep 2022 01:38:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48qyUv/v18IZSiOh587XsnXG1CoVeuiS6eGAk5T+6qA+4sbCSnQ/a/bBW7gVJ03lY1tX8ngA==
X-Received: by 2002:a05:6000:1863:b0:220:6d5f:deb5 with SMTP id
 d3-20020a056000186300b002206d5fdeb5mr7178522wri.470.1662712703841; 
 Fri, 09 Sep 2022 01:38:23 -0700 (PDT)
Received: from redhat.com ([2.52.4.6]) by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003a601707174sm1498601wmb.33.2022.09.09.01.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 01:38:23 -0700 (PDT)
Date: Fri, 9 Sep 2022 04:38:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Message-ID: <20220909043707-mutt-send-email-mst@kernel.org>
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 09, 2022 at 10:01:16AM +0200, Eugenio Perez Martin wrote:
> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Wed, Sep 7, 2022 at 12:36 AM Eugenio Pérez <eperezma@redhat.com> wrote:
> > > >
> > > > To have enabled vlans at device startup may happen in the destination of
> > > > a live migration, so this configuration must be restored.
> > > >
> > > > At this moment the code is not accessible, since SVQ refuses to start if
> > > > vlan feature is exposed by the device.
> > > >
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 4bc3fd01a8..ecbfd08eb9 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
> > > >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > > >      BIT_ULL(VIRTIO_NET_F_STANDBY);
> > > >
> > > > +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
> > > > +
> > > >  VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> > > >  {
> > > >      VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> > > > @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > > >      return *s->status != VIRTIO_NET_OK;
> > > >  }
> > > >
> > > > +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
> > > > +                                           const VirtIONet *n,
> > > > +                                           uint16_t vid)
> > > > +{
> > > > +    ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_VLAN,
> > > > +                                                  VIRTIO_NET_CTRL_VLAN_ADD,
> > > > +                                                  &vid, sizeof(vid));
> > > > +    if (unlikely(dev_written < 0)) {
> > > > +        return dev_written;
> > > > +    }
> > > > +
> > > > +    if (unlikely(*s->status != VIRTIO_NET_OK)) {
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
> > > > +                                    const VirtIONet *n)
> > > > +{
> > > > +    uint64_t features = n->parent_obj.guest_features;
> > > > +
> > > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    for (int i = 0; i < MAX_VLAN >> 5; i++) {
> > > > +        for (int j = 0; n->vlans[i] && j <= 0x1f; j++) {
> > > > +            if (n->vlans[i] & (1U << j)) {
> > > > +                int r = vhost_vdpa_net_load_single_vlan(s, n, (i << 5) + j);
> > >
> > > This seems to cause a lot of latency if the driver has a lot of vlans.
> > >
> > > I wonder if it's simply to let all vlan traffic go by disabling
> > > CTRL_VLAN feature at vDPA layer.
> >
> 
> The guest will not be able to recover that vlan configuration.
> 
> > Another idea is to extend the spec to allow us to accept a bitmap of
> > the vlan ids via a single command, then we will be fine.
> >
> 
> I'm not sure if adding more ways to configure something is the answer,
> but I'd be ok to implement it.
> 
> Another idea is to allow the sending of many CVQ commands in parallel.
> It shouldn't be very hard to achieve using exposed buffers as ring
> buffers, and it will short down the start of the devices with many
> features.

This would seem like a reasonable second step.  A first step would be to
measure the overhead to make sure there's actually a need to optimize
this.


> Thanks!
> 
> > Thanks
> >
> > >
> > > Thanks
> > >
> > > > +                if (unlikely(r != 0)) {
> > > > +                    return r;
> > > > +                }
> > > > +            }
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > >  static int vhost_vdpa_net_load(NetClientState *nc)
> > > >  {
> > > >      VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> > > > @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
> > > >      if (unlikely(r)) {
> > > >          return r;
> > > >      }
> > > > -
> > > > -    return 0;
> > > > +    return vhost_vdpa_net_load_vlan(s, n);
> > > >  }
> > > >
> > > >  static NetClientInfo net_vhost_vdpa_cvq_info = {
> > > > --
> > > > 2.31.1
> > > >
> >


