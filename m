Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B667FCEC
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 06:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM0Tm-0005f3-U4; Sun, 29 Jan 2023 00:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM0Tl-0005ev-Kv
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM0Tj-0008QS-GK
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674971026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=50UwZpSMaUReJMHS1Mnp2jomJq/o8hsmk75YdkSKtsg=;
 b=B5Q6BTPF2YXeg7zkTh0UwBJh9fCAFs/60HYl3op1wPBO2tSHy0uomTeIQQh1zeBqGO0Ut+
 0+tqkpBoBAXvszupN/SEfNKI/5cy53AhuIp/cbMfSAD98R/ekqE3AZ7Je5P/5qlPxSiLaK
 e1I7khoXxbsGMA0RweNS8ECj1buEV6g=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-ac5ODHG4NgKAzxOOVb8heg-1; Sun, 29 Jan 2023 00:43:35 -0500
X-MC-Unique: ac5ODHG4NgKAzxOOVb8heg-1
Received: by mail-oo1-f69.google.com with SMTP id
 u1-20020a4ad0c1000000b005176d37d75bso48071oor.15
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 21:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=50UwZpSMaUReJMHS1Mnp2jomJq/o8hsmk75YdkSKtsg=;
 b=bpn5Z5580qAkbr7bz7DDHF/CC+j4chYDoaLp+MNqJoOZz92f+lCfARKThz+nF8Dnkm
 /fm2loL9N4Sk85PbstQ7dJfPjVupTczx3mauXQ8mSaNDax4WrePFZoFJiMRS+3l4WU1c
 cA1agzLT8rHtzrk7NLinYWR1/HlJpUvnAbnLRsRBQZU3u1j5pxTj42kv+IXJPjWABn+l
 KWJJqRrVrm0E8Qxgjlh/7xXlH8da3iX7Cp9ToV9TBqAnre0uAeMPpIdYw9xTNLmdwKe9
 8Xsm0z3XM+ASmvIFpdgVhUy2R450pzSik8y/sehj2XcV+AqfeESuidoRqx4d/2FPaVLn
 5HZw==
X-Gm-Message-State: AFqh2kqfuyoFmnXqrohr62jB4DfzKxXPSROJVSbKKdvvpbwbEpNDJN6b
 lD8MUtQQOBLv2ON+tkhWYkJz3Mz6OMNhzcc2hBPoAXjHFAmK0gM41T8xcA8QycVAqRR3XRxoljD
 p3uM4NfJHmYp6zm07y/pdc31+y0Hd2vQ=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2315975oth.5.1674971014400; 
 Sat, 28 Jan 2023 21:43:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7AVWvZTaVGb0rGBr0lR81j8yZ/Ay/ZZCzigAKYSbQsoqDq+4k/vYiR280IOZi3UPNWC3SJYteMyqiV7L42uY=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2315970oth.5.1674971014209; Sat, 28 Jan
 2023 21:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <CAPv0NP74wPer5uqrWYh8EeFO_YSATNuo5UpADD2QrE34=FwkrQ@mail.gmail.com>
 <CACGkMEvREZQGT=bbpbGAW4UmPreMJ=SriYp3d5L0_FCECQ6yvg@mail.gmail.com>
 <20230127081719-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230127081719-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 29 Jan 2023 13:43:23 +0800
Message-ID: <CACGkMEvU=pjW3TrzMdyzrNyYD=kLR_r2h9RsMB8-1ckYE=QdWA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viktor Prutyanov <viktor@daynix.com>, peterx@redhat.com,
 qemu-devel@nongnu.org, 
 eric.auger@redhat.com, Yan Vugenfirer <yvugenfi@redhat.com>
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

On Fri, Jan 27, 2023 at 9:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jan 16, 2023 at 03:06:44PM +0800, Jason Wang wrote:
> > On Mon, Jan 16, 2023 at 7:30 AM Viktor Prutyanov <viktor@daynix.com> wrote:
> > >
> > > On Tue, Nov 29, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
> > > >
> > > > Hi All:
> > > >
> > > > According to ATS, device should work if ATS is disabled. This is not
> > > > correctly implemented in the current intel-iommu since it doesn't
> > > > handle the UNMAP notifier correctly. This breaks the vhost-net +
> > > > vIOMMU without dt.
> > > >
> > > > The root casue is that the when there's a device IOTLB miss (note that
> > > > it's not specific to PCI so it can work without ATS), Qemu doesn't
> > > > build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> > > > won't trigger the UNMAP notifier.
> > > >
> > > > Fixing by build IOVA tree during IOMMU translsation.
> > > >
> > > > Thanks
> > > >
> > > > Jason Wang (3):
> > > >   intel-iommu: fail MAP notifier without caching mode
> > > >   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> > > >   intel-iommu: build iova tree during IOMMU translation
> > > >
> > > >  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
> > > >  1 file changed, 33 insertions(+), 25 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > Hi Jason,
> > >
> > > I've tried the series with Windows Server 2022 guest with vhost and
> > > intel-iommu (device-iotlb=off) and now networking on this system has
> > > become working.
> > > So, as we discussed, I'm waiting for the series to be accepted in some
> > > form to continue my work about supporting guests who refuse Device-TLB
> > > on systems with device-iotlb=on.
> > >
> > > Tested-by: Viktor Prutyanov <viktor@daynix.com>
> >
> > Great, Peter has some comments on this series, so I will probably send
> > a new version (probably after the chinese new year).
> >
> > Thanks
>
> Were you going to post a new version?

Yes.

Thanks

>
> > >
> > > Best regards,
> > > Viktor Prutyanov
> > >
>


