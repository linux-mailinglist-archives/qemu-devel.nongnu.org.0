Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF1355075
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:04:52 +0200 (CEST)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTiZn-0008Dq-3j
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTiYF-0007Yy-EX
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:03:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTiY8-0008Mk-3Q
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617703384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zH6Wn8OepDQOpjJzXqayUaUaTBuDolvCmcEssIWrgas=;
 b=OqSaec4yJEWoAV3E3cgxqxECNhbePFYK/SHshYB0/nfMSgqMErZ4HheRr7oqik/9e2CKRl
 H7X/86/D4fnRWoEQ0ZGsmoUyC8H66CJFKPhsKkgXbT2XCNtFCs45Axgn7pK2JLJSJIqFYK
 rz1kEdbFbaK+yW9rU751k69IycyZijU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-QoC7Zm2TNeKz8FeXi2vldA-1; Tue, 06 Apr 2021 06:03:02 -0400
X-MC-Unique: QoC7Zm2TNeKz8FeXi2vldA-1
Received: by mail-wr1-f70.google.com with SMTP id t2so1676732wrr.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 03:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zH6Wn8OepDQOpjJzXqayUaUaTBuDolvCmcEssIWrgas=;
 b=a2JstR1j4CTvBQjmoWiTO0D0G43vqQwXeFGR7S1X5rtrHPRb/KH7EqEmtwEUdwUGIg
 fCGtnwX04B2T3RksEsSDPAzBAzs7/yW17kQCTKoEhCK7VZNajQZj4W99nY2x5CMrcl9s
 73Nwif3CHDhGzNTlDOfO55XxT7U77sky1DvcyddWiIydqvDo/IsIoY7OJzbMC/4rQQzt
 rqhnHnv9rkOQuA2/YuooPfC9RkYeSvY1JvViLd1fTKCLgPs2c2IqNR5bxLYwKd+gLyQd
 XH1OJskzfkS+EIKKHPpE57lXFw9LJX3fRM2eRMSD598rIl1+sJZhZC5MOpU2Wv81eimX
 PDeQ==
X-Gm-Message-State: AOAM530m6uTzCsby/Bd4NmJlNvzhYvuEjO+wpOsFE+cdw6281Zk4K9hw
 eK2TdrZbUZgfH63g/x1mLCIlB0bGbv+kzGaRDg/VoArfCJZnUsQzliu6SeD8kZ8yr3kiet/m9Yy
 6HGa8izKzTu9dr/w=
X-Received: by 2002:a05:600c:228d:: with SMTP id
 13mr3425644wmf.49.1617703381392; 
 Tue, 06 Apr 2021 03:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCyvfjwJyfpH2vFy5NUD4bEIvnMp81mc3URP5MnmJAh/g7xsDENU7oOGWvHCHMTnI8UmNMew==
X-Received: by 2002:a05:600c:228d:: with SMTP id
 13mr3425616wmf.49.1617703381134; 
 Tue, 06 Apr 2021 03:03:01 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id o15sm32346843wra.93.2021.04.06.03.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 03:03:00 -0700 (PDT)
Date: Tue, 6 Apr 2021 06:02:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] hw/virtio: enable ioeventfd configuring for mmio
Message-ID: <20210406054157-mutt-send-email-mst@kernel.org>
References: <161700379211.1135943.8859209566937991305.stgit@pasha-ThinkPad-X280>
 <d5119624-9658-2cbb-e1c7-9e85bd22b532@ispras.ru>
MIME-Version: 1.0
In-Reply-To: <d5119624-9658-2cbb-e1c7-9e85bd22b532@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i tagged it for 6.1
pls remind me after release so it's not lost


On Mon, Apr 05, 2021 at 08:50:31AM +0300, Pavel Dovgalyuk wrote:
> ping
> 
> On 29.03.2021 10:43, Pavel Dovgalyuk wrote:
> > This patch adds ioeventfd flag for virtio-mmio configuration.
> > It allows switching ioeventfd on and off.
> > 
> > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> > ---
> >   hw/virtio/virtio-mmio.c         |   11 ++++++++++-
> >   include/hw/virtio/virtio-mmio.h |    5 +++++
> >   2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 342c918ea7..5952471b38 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -36,7 +36,9 @@
> >   static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
> >   {
> > -    return kvm_eventfds_enabled();
> > +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> > +
> > +    return (proxy->flags & VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD) != 0;
> >   }
> >   static int virtio_mmio_ioeventfd_assign(DeviceState *d,
> > @@ -720,6 +722,8 @@ static Property virtio_mmio_properties[] = {
> >       DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
> >                        format_transport_address, true),
> >       DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
> > +    DEFINE_PROP_BIT("ioeventfd", VirtIOMMIOProxy, flags,
> > +                    VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT, true),
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > @@ -731,6 +735,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
> >       qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS,
> >                           d, NULL);
> >       sysbus_init_irq(sbd, &proxy->irq);
> > +
> > +    if (!kvm_eventfds_enabled()) {
> > +        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
> > +    }
> > +
> >       if (proxy->legacy) {
> >           memory_region_init_io(&proxy->iomem, OBJECT(d),
> >                                 &virtio_legacy_mem_ops, proxy,
> > diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
> > index d4c4c386ab..090f7730e7 100644
> > --- a/include/hw/virtio/virtio-mmio.h
> > +++ b/include/hw/virtio/virtio-mmio.h
> > @@ -49,12 +49,17 @@ typedef struct VirtIOMMIOQueue {
> >       uint32_t used[2];
> >   } VirtIOMMIOQueue;
> > +#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT 1
> > +#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD \
> > +        (1 << VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT)
> > +
> >   struct VirtIOMMIOProxy {
> >       /* Generic */
> >       SysBusDevice parent_obj;
> >       MemoryRegion iomem;
> >       qemu_irq irq;
> >       bool legacy;
> > +    uint32_t flags;
> >       /* Guest accessible state needing migration and reset */
> >       uint32_t host_features_sel;
> >       uint32_t guest_features_sel;
> > 


