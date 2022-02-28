Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB64C7C19
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 22:34:56 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOnfS-00009X-VL
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 16:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOnec-0007vI-JW
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOneY-00059h-Of
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646084036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lris+w6mtpHMhsW/KKX813wfEfvPFKvc0m9HJOx1G3k=;
 b=Vt51/xYKDfvhfYuA5BdShdt1Wt9B3pnD5YOOS66bf0ItOTonmRgAb2zFkJS/jGw6H1Vh05
 JttvJRt2yhHmryuBfcQRis75M56i4vlv2OYRVa7/Z6vI5APqwtNMnzo72HIB8uErL+sQAP
 LuFTQ9qbDSp+64FQn5YnXIn1VVu3xus=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206--KkB1KKiOr6vfqwbt065xA-1; Mon, 28 Feb 2022 16:33:54 -0500
X-MC-Unique: -KkB1KKiOr6vfqwbt065xA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z15-20020a1c4c0f000000b00380d331325aso214413wmf.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 13:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lris+w6mtpHMhsW/KKX813wfEfvPFKvc0m9HJOx1G3k=;
 b=6Arab6+dUHgz429aUHIB3wsRdYH279NIVCTmiKGrte/I79GO1c/iJGLQSz3dJmxvd9
 iAoBbN/mutnn4BnxCVbhATPqUuumwt5hCobkiJbmjxZJnSNvad2ynHBiKC5Y46AAfcEM
 Vn8iqRLglYvaQO5eNVByT253lF7zfNzIQur7Hl6MvFNTGZ1VeT2RsZAE0ybDFaktn+4M
 qYmajbksM5tionzrtO8q4dLXr6X5qXS+rzWp8R6TfIVzqhQk/NnHF7H8eDHwiFaBmtAL
 u0C/l7NWsPPl3+r4RqhkQR13ZWt47irN4ZDqLABF4JT0lb98Rs34iAypn9lUptWPdP7L
 salg==
X-Gm-Message-State: AOAM5300CBBLVKE2V9hGs4/WiLR2j0aq7DFZwKRnm0SyC8ESs+H9yivR
 rc1MURgGdpvcuzryeONf+9pWRD9MNWS+COWOSygMeeeIrPDh6N2J7eIYnjGDGWPmpzPRph+K15g
 /LJTOzGanadM+bbA=
X-Received: by 2002:adf:f389:0:b0:1ef:5f0f:cb83 with SMTP id
 m9-20020adff389000000b001ef5f0fcb83mr13322463wro.26.1646084033681; 
 Mon, 28 Feb 2022 13:33:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3WuUYR4hpy3u40hpEsw9YU8CNKwPrp4GXF+QU91jC/eWsLREF4AtxoNloLaYJ4pm/EkdIHw==
X-Received: by 2002:adf:f389:0:b0:1ef:5f0f:cb83 with SMTP id
 m9-20020adff389000000b001ef5f0fcb83mr13322448wro.26.1646084033425; 
 Mon, 28 Feb 2022 13:33:53 -0800 (PST)
Received: from redhat.com ([2.52.2.9]) by smtp.gmail.com with ESMTPSA id
 g5-20020a5d5545000000b001ed9d3f521csm11564653wrw.113.2022.02.28.13.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 13:33:52 -0800 (PST)
Date: Mon, 28 Feb 2022 16:33:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] hw/virtio: vdpa: Fix leak of host-notifier memory-region
Message-ID: <20220228163335-mutt-send-email-mst@kernel.org>
References: <20220211170259.1388734-1-lvivier@redhat.com>
 <bef192f5-70b0-8412-388d-e4278ca35747@redhat.com>
 <f269cb2f-1be3-4b98-0ba9-02f908ae9d63@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f269cb2f-1be3-4b98-0ba9-02f908ae9d63@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

yes - in the next pull, thanks!

On Mon, Feb 28, 2022 at 07:27:34PM +0100, Laurent Vivier wrote:
> Ping?
> 
> Thanks,
> Laurent
> 
> On 22/02/2022 09:53, Laurent Vivier wrote:
> > Michael,
> > 
> > do you plan to merge this soon?
> > 
> > This is a bugfix for a QEMU coredump.
> > 
> > Thanks,
> > Laurent
> > 
> > On 11/02/2022 18:02, Laurent Vivier wrote:
> > > If call virtio_queue_set_host_notifier_mr fails, should free
> > > host-notifier memory-region.
> > > 
> > > This problem can trigger a coredump with some vDPA drivers (mlx5,
> > > but not with the vdpasim), if we unplug the virtio-net card from
> > > the guest after a stop/start.
> > > 
> > > The same fix has been done for vhost-user:
> > >    1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")
> > > 
> > > Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
> > > Cc: jasowang@redhat.com
> > > Resolves: https://bugzilla.redhat.com/2027208
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > ---
> > >   hw/virtio/vhost-vdpa.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 04ea43704f5d..11f696468dc1 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct
> > > vhost_dev *dev, int queue_index)
> > >       g_free(name);
> > >       if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
> > > +        object_unparent(OBJECT(&n->mr));
> > >           munmap(addr, page_size);
> > >           goto err;
> > >       }
> > 


