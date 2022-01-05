Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B91484FD7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:14:37 +0100 (CET)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52NQ-0004J2-KP
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:14:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n52Ls-0003Tj-9n
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n52Lq-0006EM-Lk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2eDC+g5uTi4a/Ql9RxECSkrGT/F/fl5fNg17LQ7oFd0=;
 b=JLuRnnMx3MFkrWwFKkBE22ERN5yKzdWL1RRy6veGN0t8qhKNW3SWg9r07JVUFZOMSoC/+M
 SI/Kv32ObPBKY8c55pqorQB9mg6E9YtyTGmEugZo/4WdgZuWDYE5cb3gz3M2SMoSv5Y2MQ
 Pv9VvsAIH3gz0BtZU4iFSB7HpScId7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-bVJT0SDdPMWA-uhU-QRxdg-1; Wed, 05 Jan 2022 04:12:53 -0500
X-MC-Unique: bVJT0SDdPMWA-uhU-QRxdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c4fc200b00346251961beso812321wmq.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2eDC+g5uTi4a/Ql9RxECSkrGT/F/fl5fNg17LQ7oFd0=;
 b=D0V6a5bOCoN1Xlifhgx6rfl0YJJYQSQEIP/RGaEYZlxrLw+AiLvEwSkDmXhFRQ4yyQ
 FwaAWZztYSsIcxMSDQD7HC+do7kQ28WimhbCYQSKkIszbWSrnJQaCX/TIHw5NpYFbJYZ
 VuXyZaEZQQEn3Mhsn+jRyXEUG6tHiVNYAcu5/tQ8HGQTmK6LZkpKdnNOsl3KE50rLDG7
 WIEOcgBz2EReRCbmp0iIyfvjJovfE+R0GG++IO4Xo46D4ym6KUQUXVe9l3/Zaly75NmT
 bW7YRbKBJjYDFynAUy8GO9GxA42qLYI+YpqKQW4uxEz6FGvQ4yEXwfJ52TvXnbmDrnBg
 KhJw==
X-Gm-Message-State: AOAM533WVSNbemi8xyDHH7R8wR8oX6QAGNfaBNMOMf/QGMOz36hEoMXJ
 RbTVvagEihf6bBHh4eH6YcYwo/C96Lxx6bQLIZNNggD5H/6zljhaJ0/t8jMM+WEgq03ZwHzadPO
 tWucN+NvhRAgLAj4=
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr45245762wrr.258.1641373972360; 
 Wed, 05 Jan 2022 01:12:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxphFW8VfFb6YdLVMygNWgWILL5en6X6XazjRRiag0v1q0g3K+w6NAl9ETBD261GjupzKkz2g==
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr45245676wrr.258.1641373971132; 
 Wed, 05 Jan 2022 01:12:51 -0800 (PST)
Received: from redhat.com ([2.55.4.139])
 by smtp.gmail.com with ESMTPSA id a20sm1907117wmb.27.2022.01.05.01.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:12:50 -0800 (PST)
Date: Wed, 5 Jan 2022 04:12:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Message-ID: <20220105030025-mutt-send-email-mst@kernel.org>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 03:54:13PM +0800, Jason Wang wrote:
> On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
> > > On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > > >
> > > > From: Longpeng <longpeng2@huawei.com>
> > > >
> > > > To support generic vdpa deivce, we need add the following ioctls:
> > > > - GET_VECTORS_NUM: the count of vectors that supported
> > >
> > > Does this mean MSI vectors? If yes, it looks like a layer violation:
> > > vhost is transport independent.
> >
> > Well *guest* needs to know how many vectors device supports.
> > I don't think there's a way around that. Do you?
> 
> We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
> simply assume #vqs + 1?

Some hardware may be more limited. E.g. there could be a bunch of vqs
which don't need a dedicated interrupt. Or device could support a single
interrupt shared between VQs.


> > Otherwise guests will at best be suboptimal.
> >
> > >  And it reveals device implementation
> > > details which block (cross vendor) migration.
> > >
> > > Thanks
> >
> > Not necessarily, userspace can hide this from guest if it
> > wants to, just validate.
> 
> If we can hide it at vhost/uAPI level, it would be even better?
> 
> Thanks
> 
> >
> >
> > > > - GET_CONFIG_SIZE: the size of the virtio config space
> > > > - GET_VQS_NUM: the count of virtqueues that exported
> > > >
> > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > ---
> > > >  linux-headers/linux/vhost.h | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > > > index c998860d7b..c5edd75d15 100644
> > > > --- a/linux-headers/linux/vhost.h
> > > > +++ b/linux-headers/linux/vhost.h
> > > > @@ -150,4 +150,14 @@
> > > >  /* Get the valid iova range */
> > > >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> > > >                                              struct vhost_vdpa_iova_range)
> > > > +
> > > > +/* Get the number of vectors */
> > > > +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> > > > +
> > > > +/* Get the virtio config size */
> > > > +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> > > > +
> > > > +/* Get the number of virtqueues */
> > > > +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> > > > +
> > > >  #endif
> > > > --
> > > > 2.23.0
> > > >
> >


