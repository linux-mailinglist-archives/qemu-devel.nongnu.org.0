Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497148D0FC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 04:36:59 +0100 (CET)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7qv3-0007pG-Sw
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 22:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7qtt-00076z-W7
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 22:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7qtp-0006Yy-LQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 22:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642044928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pT5SG3MaMLlSgUkCYN/5whbFNR0b1hlQGYWvR7HxyY8=;
 b=e3zLcczUGU0wKnw2blVHZWVpfowFkl90vZCQUzLITv7Hgo7vUmrB89MLo2m8sVjik5mw2v
 fiPNrVnpaMBbPDeln4QD0W0wI1bmtWp0Zlw9kURW0FcIA2HpbI2QAEkrL65AbspeoB9WS4
 3D2U9UNplvOYvLeaenz2cGBFVnmpHHc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-ZiPl8KM2P9mPVYXc2NRaJA-1; Wed, 12 Jan 2022 22:35:27 -0500
X-MC-Unique: ZiPl8KM2P9mPVYXc2NRaJA-1
Received: by mail-pj1-f69.google.com with SMTP id
 62-20020a17090a0fc400b001b31e840054so9188294pjz.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 19:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pT5SG3MaMLlSgUkCYN/5whbFNR0b1hlQGYWvR7HxyY8=;
 b=aZArM3pdVzhDPaea9abedHIjXrqxTKOVIYP2F0xcQIEXGZ7KcQxZF974aBArKWnOVS
 Jf12/4wu3+h8lS7R8pDBIsornNNDK4OerHuAhrE+iF9VWuW3BtK0VEI5XyYioxuj4G4e
 IolIHTAmxjBrF5ewntxBSQoAVAhWb0uQDPhgLJa+1Mk5c5oKw7GUI43tyaunZDH+AnPc
 +aWQwK3IRx+vHAxcdn+CDc7L90SNsdDtYgC3pYmq7VkWpgRXN90mRMwNCdGYdxz4WBID
 LhRylNFHFQON8Qx3x9Xj6jOISgQu0thX6D0GYktUXzJHdzfW7PrLYYor32SIB6LV1gI8
 lKgA==
X-Gm-Message-State: AOAM533pu/+pC+CvPhtPVE2k33SuoTI/GrZzF1sq2+YJPqIOvj2l2tAm
 3HB83ZDAaT17JmNvroFlseUgo/L8wrSWwUU6zhyGBuZrzOLXNwS7PRFVr2yPccX4D9wskQQj3bc
 p6xqilkJJejKuRC8=
X-Received: by 2002:a63:7a52:: with SMTP id j18mr2366834pgn.319.1642044926183; 
 Wed, 12 Jan 2022 19:35:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDlInZ2cqK/w7RP3p0y2/FPigrEQzX0DzAdACPAeARVTWt46AsPKcEkLtyiHyeliqz1a9Vww==
X-Received: by 2002:a63:7a52:: with SMTP id j18mr2366810pgn.319.1642044925821; 
 Wed, 12 Jan 2022 19:35:25 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id n12sm7620409pjt.0.2022.01.12.19.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 19:35:24 -0800 (PST)
Date: Thu, 13 Jan 2022 11:35:19 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <Yd+d9ydZl7tLYWBj@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105041945.13459-3-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 12:19:43PM +0800, Jason Wang wrote:
> We use to warn on wrong rid2pasid entry. But this error could be
> triggered by the guest and could happens during initialization. So
> let's don't warn in this case.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 4c6c016388..f2c7a23712 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1524,8 +1524,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
>      if (s->root_scalable) {
>          ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>          if (ret) {
> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> -                              __func__, ret);
> +            /*
> +             * This error is guest triggerable. We should assumt PT
> +             * not enabled for safety.
> +             */
>              return false;
>          }
>          return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> -- 
> 2.25.1
> 

No strong opinion, but the thing is mostly all error_report_once() in this file
is guest triggerable.  If we remove this one then it's debatable on whether we
want to remove all.

IMHO we used the _once() variant just for this: it won't go into any form of
DoS, meanwhile we'll still get some information (as hypervisor) that the guest
OS may not be trustworthy.

So from that pov it's still useful?  Or is this error very special in some way?

Thanks,

-- 
Peter Xu


