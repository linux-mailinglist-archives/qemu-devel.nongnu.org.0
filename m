Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176348B122
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:42:33 +0100 (CET)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JI8-0000fv-FA
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7JGQ-0007Fk-9q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7JGI-0001Oq-TY
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641915636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDW84FgZu5Va0KkKFnJ4JdUVPZDDRxkfydTsbmL/7zE=;
 b=eoHbOX2fmnNrNWTyu4Gf9B0IH+uh+6OMUsUKCDpw6Tm4i9+8OJJOswxwrrCSX5zbjYUDwv
 UGIK2klVvltti2m3nSPPT7Efu3T5KMDin1eTNKENUrQkEWjFibrSVLuXANqGFMbkkE97bV
 GOyhn9khS0k9Z54tezNdlGeVwtPj4/Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-4xNl0YA-PBanOqRY26-5kA-1; Tue, 11 Jan 2022 10:40:33 -0500
X-MC-Unique: 4xNl0YA-PBanOqRY26-5kA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020a05640251c800b003f9a52daa3fso13634189edd.22
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 07:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VDW84FgZu5Va0KkKFnJ4JdUVPZDDRxkfydTsbmL/7zE=;
 b=BSz+GyTFT1JsswrkbM6QD+VtmQimJ76Z0Qwoq+ZjBKtagQqoStQRjZzF9eXgRN2Xlw
 qGknh7JnzIpYDIKMyS7L1FBLAO/iRVPdF+cej9kQTGUsxUFV+Yq2qNlGYAj6IZ78jOLJ
 76Y4wFBfkU9X6GAC3kmMX4qJOzbNGhDYtYuo47DRFVeCGWB4XYX/53Neup1X6vGRFYiY
 1fFMRRqO2swJLgP1Lqmv7wUf1hOy55bbtdkELiXcERMdYPddu9UcrbCSNATXjhS11nzs
 csYk6hoOdDYRqojsqeCIET/CdZ8buYNxMX3952NXnjiFa2Vd4DGnu7HHj9tu6YVSjMlY
 OjrA==
X-Gm-Message-State: AOAM5327EUHCDK9SKY+1lVXa9+x1UXY4UEfeg4ow2EwJONgju+ONc9vq
 vrkTC3VQspQos6voBdMmwPQkrYjFfplIbv5ZJESJO5gi6V5siUF3DybV9vf+v57Cva9X/MUNzG+
 rTHWCVrmH8J3cqig=
X-Received: by 2002:a17:906:2bc3:: with SMTP id
 n3mr4249465ejg.332.1641915632618; 
 Tue, 11 Jan 2022 07:40:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCBfHXYpBEthrk1FacKGz77RrYcCyld3gnD+oUr/tjqd5+YMzTq8WLk2mFhaNs5H9qsHW4FA==
X-Received: by 2002:a17:906:2bc3:: with SMTP id
 n3mr4249455ejg.332.1641915632442; 
 Tue, 11 Jan 2022 07:40:32 -0800 (PST)
Received: from redhat.com ([2.55.5.100])
 by smtp.gmail.com with ESMTPSA id p16sm3769817ejn.76.2022.01.11.07.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 07:40:31 -0800 (PST)
Date: Tue, 11 Jan 2022 10:40:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <20220111103917-mutt-send-email-mst@kernel.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 10:02:12AM +0100, Eric Auger wrote:
> Hi Jean, Michael,
> 
> On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
> > Replace the VIRTIO_IOMMU_F_BYPASS feature with
> > VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> > global bypass on and off.
> >
> > Add a boot-bypass option, which defaults to 'on' to be in line with
> > other vIOMMUs and to allow running firmware/bootloader that are unaware
> > of the IOMMU.
> >
> > See the spec change for more rationale
> > https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html
> 
> I guess the kernel bits should be merged in 5.17?
> 
> Thanks
> 
> Eric

They are in fact in my tree and set to go into 5.16.
They've been in linux-next for a whole cycle now.
But if you feel I'm rushing things, pls let me know.
Also, pls let me know whether my tree actually works well for you!

> >
> > Jean-Philippe Brucker (3):
> >   NOMERGE: virtio-iommu: Add definitions for
> >     VIRTIO_IOMMU_F_BYPASS_CONFIG
> >   virtio-iommu: Default to bypass during boot
> >   virtio-iommu: Support bypass domain
> >
> >  include/hw/virtio/virtio-iommu.h              |  1 +
> >  include/standard-headers/linux/virtio_iommu.h | 10 +++-
> >  hw/virtio/virtio-iommu.c                      | 60 ++++++++++++++++---
> >  hw/virtio/trace-events                        |  4 +-
> >  4 files changed, 64 insertions(+), 11 deletions(-)
> >


