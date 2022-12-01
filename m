Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB8963EA1A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dbd-0008E5-Uu; Thu, 01 Dec 2022 02:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0dbc-0008Bt-00
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:03:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0dbZ-0003hF-VQ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669878195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKcftxYIr7sV7s3qaakQYih8yQE6iuksA7kUkMTPs80=;
 b=IQVnwtr9xzjEQBE4Em3VnPW9233QRdc0zH/2X78LI4+s23wmcfiwneO8siOYsqbizjokXd
 TGxvGsi3pJOIYhsnP7CGOeYSzDlt1N+YQaGT/oa6iCKjPW2HOZnPvg5o+9s4fS3FzqCCAX
 incH83FQLpPV9iGITZKwsjvRGhW2nUs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-25mrxrc5NJ-V6A3pIgLlsw-1; Thu, 01 Dec 2022 02:03:14 -0500
X-MC-Unique: 25mrxrc5NJ-V6A3pIgLlsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso2118838wms.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TKcftxYIr7sV7s3qaakQYih8yQE6iuksA7kUkMTPs80=;
 b=v0fAq0qxzZNjyfuKwp1W1zN+B9WZr3cdOUYyZ0fT5z3si6tDp7KZw94zvatsJQaDqD
 OynYji87qfZiSiDR9//d1Y/+3IbUMzRkt5RcOPdyDYD7lkcMsQ09LfVqQQpjvehiCsKO
 71ekBjC6cjF9i0hIDJryH1wuzdEbv8EEUEd+NLHe73EpH/svgsXzMh//yIAwXQVaGp5T
 WdgposYh1QVzmJbOlClAj2VPH80UNdsAi7nKm7js0StQ5OB+Ftgi80cRUw15J8652vLP
 PEaNuM/POmogdO9MGWOHzKjxhcuhdO2E7JpmXLODzgAm/9Cxx4xkRs44mV6gMRvvrpek
 HFVw==
X-Gm-Message-State: ANoB5pnv5cR6tqgGX9pDMbhUIFfH7vsxTETyw/3n1CdaQ26qLAeez294
 /Qp+Qub/LbZ/atqWzBFqalu1Kq6/BIdj/SiqHX5Cha1giTiKqiPD5bQPR8Y31KQQMG1cWjayEMw
 75/yKrYHXK1AKl4o=
X-Received: by 2002:a5d:4710:0:b0:242:1e83:9c17 with SMTP id
 y16-20020a5d4710000000b002421e839c17mr9157848wrq.437.1669878192141; 
 Wed, 30 Nov 2022 23:03:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Fwvxs7FIH67I9h174J21IGuRzgLkARcu/hxa9QQAyZR9tu2wJN+aJoNabqvFfSxXqjp2NDg==
X-Received: by 2002:a5d:4710:0:b0:242:1e83:9c17 with SMTP id
 y16-20020a5d4710000000b002421e839c17mr9157829wrq.437.1669878191668; 
 Wed, 30 Nov 2022 23:03:11 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c359100b003c6b9749505sm8295498wmq.30.2022.11.30.23.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:03:11 -0800 (PST)
Date: Thu, 1 Dec 2022 02:03:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?B?6Zu357+U?= <leixiang@kylinos.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?B?6LCi5piO?= <xieming@kylinos.cn>,
 =?utf-8?B?5pu+6amw?= <zengchi@kylinos.cn>
Subject: Re: =?utf-8?B?5Zue5aSNOiBSZTogW1JFU0VORCBQ?=
 =?utf-8?Q?ATCH=5D_virtio-pci?= =?utf-8?Q?=3A?= fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Message-ID: <20221201020219-mutt-send-email-mst@kernel.org>
References: <qhe0uqhslh-qhgkqdbw92@nsmail7.0.0--kylin--1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qhe0uqhslh-qhgkqdbw92@nsmail7.0.0--kylin--1>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 01, 2022 at 09:40:42AM +0800, 雷翔 wrote:
> As we found, it will cause guest os crash when reboot guest os. because in
> 'virtio_pci_set_guest_notifiers' function, if it failed to set guest notifier,
> the error handler did not release the 'proxy->vector_irqfd' which already
> alloced. when reboot guest os, into 'virtio_pci_set_guest_notifiers' function
> again, it will jump into  'msix_unset_vector_notifiers' function, this function
> will check device notifier hooks, cause hooks were null, it will cause a assert
> error, then the guest os crash down.
> 
> We put the error message in our test below:
> 
> 2022-07-29 07:49:46.591+0000: Domain id=30 is tainted: host-cpu char device
> redirected to /dev/pts/4 (label charserial0)
> 2022-07-29T07:49:48.319622Z qemu-4.1: nvqs:1,pci_dev name:virtio-blk-pci
> 2022-07-29T07:49:57.974985Z qemu-4.1: nvqs:1,pci_dev name:virtio-blk-pci
> 2022-07-29T07:50:01.834092Z qemu-4.1: nvqs:2,pci_dev name:virtio-net-pci
> 2022-07-29T07:50:01.834207Z qemu-4.1: Error binding guest notifier: 11
> 2022-07-29T07:50:01.834218Z qemu-4.1: unable to start vhost net: 11: falling
> back on userspace virtio
> 2022-07-29T07:50:01.865367Z qemu-4.1: nvqs:1,pci_dev name:virtio-blk-pci
> 2022-07-29T07:50:01.865506Z qemu-4.1: virtio-blk failed to set guest notifier
> (-11), ensure -accel kvm is set.
> 2022-07-29T07:50:01.865518Z qemu-4.1: virtio_bus_start_ioeventfd: failed.
> Fallback to userspace (slower).
> 2022-07-29T07:50:02.005930Z qemu-4.1: nvqs:3,pci_dev name:virtio-scsi-pci
> 2022-07-29T07:50:02.006079Z qemu-4.1: virtio-scsi: Failed to set guest
> notifiers (-11), ensure -accel kvm is set.
> 2022-07-29T07:50:02.006091Z qemu-4.1: virtio_bus_start_ioeventfd: failed.
> Fallback to userspace (slower).
> 2022-07-29T07:52:44.108820Z qemu-4.1: nvqs:1,pci_dev name:virtio-blk-pci
> 2022-07-29T07:52:52.886792Z qemu-4.1: nvqs:1,pci_dev name:virtio-blk-pci
> qemu-4.1: hw/pci/msix.c:612: msix_unset_vector_notifiers: Assertion `dev->
> msix_vector_use_notifier && dev->msix_vector_release_notifier' failed.
> 2022-07-29 07:52:53.377+0000: shutting down, reason=crashed
> 
> 
> 
> 


Thanks! My question is, does this also reproduce with qemu 7.1
or is the problem new in 7.2?

> 
> 
> ----
> 
>  
> 
> 
> 
> 
> 主　题：Re: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
> virtio_pci_set_guest_notifiers
> 日　期：2022-11-30 14:59
> 发件人：Michael S. Tsirkin
> 收件人：雷翔;
> 
> On Wed, Nov 30, 2022 at 01:56:11PM +0800, leixiang wrote:
> > proxy->vector_irqfd did not free when set guest notifier failed.
> >
> > Signed-off-by: Lei Xiang
> > Tested-by: Zeng Chi
> > Suggested-by: Xie Ming
> 
> Thanks a lot! Fixes tag? When was the leak introduced?
> 
> > ---
> > hw/virtio/virtio-pci.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index c6b47a9c..4862f83b 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -1038,6 +1038,12 @@ assign_error:
> > while (--n >= 0) {
> > virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
> > }
> > +
> > + g_free(proxy->vector_irqfd);
> > + proxy->vector_irqfd = NULL;
> > +
> > return r;
> > }
> >
> > --
> >
> >
> > No virus found
> > Checked by Hillstone Network AntiVirus
> 


