Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883C1484EF0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 08:58:52 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n51C7-0003Jk-3h
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 02:58:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n518N-0002R6-3c
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:54:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5184-0005Gz-Oz
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641369269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QxMEVJonztUwF3i85VwcxqfvmFfjyKrZQaN8nHpJTos=;
 b=GoOgy4p8QkRm2ThDM+t+5K5pWfT/35ViGa7WlxICh+mxpjstBVEDY24mZTc9re9HHeiKh+
 aHG3QX+r5sn+6c56JKZZOmzdqd03283HGZFOvzxJnU09LaHbb74fxbO93Sh38oP4VCw20m
 QzHstUh/fjWSqKqp0Y3wB37ffnf9w8o=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-36ImvD3NNcaObLJO2BIUHQ-1; Wed, 05 Jan 2022 02:54:25 -0500
X-MC-Unique: 36ImvD3NNcaObLJO2BIUHQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 bq6-20020a056512150600b0041bf41f5437so9068203lfb.17
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 23:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxMEVJonztUwF3i85VwcxqfvmFfjyKrZQaN8nHpJTos=;
 b=MHZPcvAA2SQeAf3b4zEOSXTEcdHG+3SO+Uu3/aJmQ0BTj1tE1EC4XNg/6VYvdG4Kas
 iCKDX34z+Pz2fDTOujdPfBV813Jb9XgmoihXGQienxNzDWWxie5826FKqEY/VKoVIdQt
 5QLwZCBzFuVs2qsd1+HQ/6AQqpfKWdKRbnw9unUIERh3F+66CGs5ipzp3syXG86uHlB9
 JIZeZO7Z1mQpQGSW2DHhA+zcLgQ+Tuiepxe6uJtVsS1jlqhr6BdZr75R21iLnq0MS8IQ
 +rDlwl4ziVBIHCGsgRtrTexKF0ng4dKeSWg4auAzFBoCfzLeI0u4MKSCgULWVFh91XEO
 UgLg==
X-Gm-Message-State: AOAM531WCZBBo2owbAghFWe9EWgNGiFK9k45HzT3cGFxVoIw5ayA3nIX
 0yfnVNfT4Y+AF7iRdKCryXSqcYejfrAQZjCQQOJ6ql1qEWUTWDnZB2UV88dKX3Jn8kgaPyGr+6n
 dxY2dHe5naC+vEU871+P4TiIfB7NcGt0=
X-Received: by 2002:a2e:8543:: with SMTP id u3mr38071293ljj.307.1641369264274; 
 Tue, 04 Jan 2022 23:54:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykk+7a77/blKt4Mtf/pxRrO4i+Do9eCM+Tz66ACV0WpWKbBVH+C2m3rP47bLEDCiObRt+963rTm8zLYf3MGDc=
X-Received: by 2002:a2e:8543:: with SMTP id u3mr38071271ljj.307.1641369263995; 
 Tue, 04 Jan 2022 23:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220105020008-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 15:54:13 +0800
Message-ID: <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
> > On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > >
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > To support generic vdpa deivce, we need add the following ioctls:
> > > - GET_VECTORS_NUM: the count of vectors that supported
> >
> > Does this mean MSI vectors? If yes, it looks like a layer violation:
> > vhost is transport independent.
>
> Well *guest* needs to know how many vectors device supports.
> I don't think there's a way around that. Do you?

We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
simply assume #vqs + 1?

> Otherwise guests will at best be suboptimal.
>
> >  And it reveals device implementation
> > details which block (cross vendor) migration.
> >
> > Thanks
>
> Not necessarily, userspace can hide this from guest if it
> wants to, just validate.

If we can hide it at vhost/uAPI level, it would be even better?

Thanks

>
>
> > > - GET_CONFIG_SIZE: the size of the virtio config space
> > > - GET_VQS_NUM: the count of virtqueues that exported
> > >
> > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > ---
> > >  linux-headers/linux/vhost.h | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > > index c998860d7b..c5edd75d15 100644
> > > --- a/linux-headers/linux/vhost.h
> > > +++ b/linux-headers/linux/vhost.h
> > > @@ -150,4 +150,14 @@
> > >  /* Get the valid iova range */
> > >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> > >                                              struct vhost_vdpa_iova_range)
> > > +
> > > +/* Get the number of vectors */
> > > +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> > > +
> > > +/* Get the virtio config size */
> > > +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> > > +
> > > +/* Get the number of virtqueues */
> > > +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> > > +
> > >  #endif
> > > --
> > > 2.23.0
> > >
>


