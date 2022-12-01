Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4163EB20
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0exM-0008Qw-Gm; Thu, 01 Dec 2022 03:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0exI-0008Qc-MN
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0exG-0007vK-Ow
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669883400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FGzl8XMz4a9+PYXeu51Zej4fOYp1LT7SpnlCKdjRzuo=;
 b=anb447aBlfoEFk0Iwy6E6dWccmGr6nc/sZynjOdt+ieQAs7xHOyt10TlC1AbeCEJB9VbUB
 FkT8PGjeUsTo8PLKCWL7WzxjzrtIKC7gbnZ9MAN/OsaBMD3K/+JRr5hjMPDmGU1PVx+JxG
 EjuOLpKZczIWsFKp7REtL7eBFnQjoN0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-w7LPIXK8PI-6Q_uY-nqtIQ-1; Thu, 01 Dec 2022 03:29:58 -0500
X-MC-Unique: w7LPIXK8PI-6Q_uY-nqtIQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 k26-20020a54469a000000b0035ac1417866so763562oic.18
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGzl8XMz4a9+PYXeu51Zej4fOYp1LT7SpnlCKdjRzuo=;
 b=ILweT8y/I8GTC7sc33GpWlP4la7zV9rAcEbkc8HDYEy90YW2EiknMlaiVFTwaAh9Ms
 gx+33kkDZMkvQSg1J9ZD3o9dMfbr2fqLmMxjGSM2El4p5O6j2u0wFnwUTG3T26BxGeTJ
 un5hncwY0OCE4lCMQ/viCzpu2aXYIF/iDFGI2F18PEKi2v4r2dAzY4sJh7zvniW35yKv
 YzpjkjrnWPMGDwoHjd6dXkGgX4XnCxN0oFGuZ3BibgG2Fp5Wx3mZtwrzIDdR/xIwjfjX
 EgIE6R/cr6a419XjVxnwcsnZpQ1EfWRdmu2YzO5zcUYhryKDLJVIubDNdhsn0PQw1cHs
 3W0Q==
X-Gm-Message-State: ANoB5pnOw2PEERm4Y2Fhfb6djrMSjjTe0y5BdGvqa+Hw4at/Yh8yucJh
 gqJ2VhGhACIkFOLpQt1QVqoE6dYArfgb/hjapFDSGW7Y0ZrWf2j5XxnjEYTsr7rf3ki8Mm3oEth
 8MT+UCjdj8yBOj0+v3NAQw+BK16TFuWo=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr32659297otb.237.1669883398210; 
 Thu, 01 Dec 2022 00:29:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf57D67EWxip/ALpkko5pLh6eu92NbQE4izj6IYEJwrQpclShCVJZ8KTJGbLAzPkUaLSjHWuSL2/FmmZr2TaV4E=
X-Received: by 2002:a05:6830:6505:b0:66c:fb5b:4904 with SMTP id
 cm5-20020a056830650500b0066cfb5b4904mr32659284otb.237.1669883398013; Thu, 01
 Dec 2022 00:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221130113740-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221130113740-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:29:47 +0800
Message-ID: <CACGkMEuz2Sjb84nUxWTtrSEd_vyUZ4J8Y+r8Pbn+MOQ+=+ufFg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 1, 2022 at 12:38 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 04:10:34PM +0800, Jason Wang wrote:
> > Hi All:
> >
> > According to ATS, device should work if ATS is disabled. This is not
> > correctly implemented in the current intel-iommu since it doesn't
> > handle the UNMAP notifier correctly. This breaks the vhost-net +
> > vIOMMU without dt.
> >
> > The root casue is that the when there's a device IOTLB miss (note that
> > it's not specific to PCI so it can work without ATS), Qemu doesn't
> > build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> > won't trigger the UNMAP notifier.
> >
> > Fixing by build IOVA tree during IOMMU translsation.
> >
> > Thanks
>
> Any changes of Fixes tags? this is 8.0 yes?

Yes, it's for 8.0.

Thanks

>
> > Jason Wang (3):
> >   intel-iommu: fail MAP notifier without caching mode
> >   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> >   intel-iommu: build iova tree during IOMMU translation
> >
> >  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
> >  1 file changed, 33 insertions(+), 25 deletions(-)
> >
> > --
> > 2.25.1
>


