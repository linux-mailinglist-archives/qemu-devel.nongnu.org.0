Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964923160BA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:14:47 +0100 (CET)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ke6-0003Cm-LI
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kcS-00028W-Gl
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kcQ-0006PH-FI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612944781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1VU2PNEs/Qz6MNJFxfBG3cTEyHXBfApkVTAe1HRIAzs=;
 b=XIHPUYD6XVx42DwGEbZfB0x6vb4XBQnFC5Sc97ztKOwtF5Z429j+mbSzm1MVBu+5UEgu/t
 aryv+fqn59fP+CiH2xkmNtBp+RTANL8B3nFNF3tk+chFngRJKFvGYiDglW9BJ6a6y4NnT5
 cMewsv13uvecKnBTnxtR6LNt89LE20M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-xRR89MazMcWS04_Ur6GsrA-1; Wed, 10 Feb 2021 03:13:00 -0500
X-MC-Unique: xRR89MazMcWS04_Ur6GsrA-1
Received: by mail-wm1-f72.google.com with SMTP id b62so953063wmc.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 00:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1VU2PNEs/Qz6MNJFxfBG3cTEyHXBfApkVTAe1HRIAzs=;
 b=JIss7mATVHa8DfeVW+z8K6qGcCxhE3rwtcbVITK+heZi7zWU14i3Y4yEimuLfXVBKV
 1oMrxwxsteDav5utYqtJ4li1Lt9A6chlc4M1yoL4RiCcf3FSjUA80/OLGz4uV+cx4uoH
 GU/T6a0PfxtE6PidFDBYwKaNC012WSY34B2+CjIlZdrUEZWK2rN5M3e+rGgY2KTU6hmS
 EHV78I5Vm75nW28A22NKY0prJh6VQWR58zTLLHYUcLO68tU66RpwmARHE/suxIRvWNyz
 ucXDVa1HNlzfRo5wu2SiGf4EXFxh5aeZgx/s0FUu8EU8EQUDxLZr3frYO2A00EoH7hVb
 RmQw==
X-Gm-Message-State: AOAM530wyVATzdPeNSvnrOix/ehqi9xhPBPvZZ6YWymCWJ0HNvF0d/bD
 G/iNDXvBd508wUtIBAZf5+0HvYayI+BY/+mpQoy+0R7mGeyE95JhHm8BZ+bu+vYiuJKJXfQwqpr
 Dy0UGTp6tMVUUk+U=
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr2298991wrs.106.1612944778938; 
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ0T4LIKGIM2XiQFoQA0V26/ab44v/FZK1uaVHZZfNA+RqqOR4snb9g17SzPWrW23p4mMUng==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr2298963wrs.106.1612944778667; 
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id v1sm1494387wmj.31.2021.02.10.00.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:12:58 -0800 (PST)
Date: Wed, 10 Feb 2021 03:12:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
Message-ID: <20210210031242-mutt-send-email-mst@kernel.org>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, groug@kaod.org, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 10:32:33PM +0100, Eric Auger wrote:
> Previous work on dev-iotlb message broke spapr_iommu/vhost integration
> as it did for SMMU and virtio-iommu. The spapr_iommu currently
> only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
> VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
> and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
> spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> registration.
> 
> Reported-by: Peter Xu <peterx@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/ppc/spapr_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 30352df00e..24537ffcbd 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      struct SpaprTceTable *tbl = container_of(iommu, SpaprTceTable, iommu);
>  
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "spart_tce does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>      if (old == IOMMU_NOTIFIER_NONE && new != IOMMU_NOTIFIER_NONE) {
>          spapr_tce_set_need_vfio(tbl, true);
>      } else if (old != IOMMU_NOTIFIER_NONE && new == IOMMU_NOTIFIER_NONE) {
> -- 
> 2.26.2


