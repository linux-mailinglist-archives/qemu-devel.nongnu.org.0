Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9048D2B4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:18:32 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uNR-00077G-FD
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:18:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uCG-000286-CB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uCD-0002rT-Nu
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642057612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jsL6x/Gbq9Dpvq2usHBXPkwBF1YEZYSbs+9HH6qXck=;
 b=dw/ebZB8G280W0FjzuMo6j8Wq0drBO80Rr7IlJFKYJL7Phiibh7N1sWr00heAsiS0YGHbt
 cH4lzXzLYv76etEHMkGlvxVlSIkfQb9smDkuoJ+YTglhtqgPnISutMXfDLvXRN+mTmPEKH
 OD/sNj99qu8fWKwH+td02xdptIURq+Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-29S7W-1XO06h47ZJBSYqSg-1; Thu, 13 Jan 2022 02:06:52 -0500
X-MC-Unique: 29S7W-1XO06h47ZJBSYqSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso5315701wma.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8jsL6x/Gbq9Dpvq2usHBXPkwBF1YEZYSbs+9HH6qXck=;
 b=R+ygwskRPKHuX8CljCJx5qvsG0x/KnYgY9IdrLNCMCNVXZPpNYzL/5R2jfAN32RAlc
 YiAOzTFwC17EPsNegpRkXsLZLT8q3VIaONJ4LCJ6hQ6c/IESJBm4KkrTsoVzTlLo6cIg
 n73F7f43VN41Uzt4g9Y7vYEk33tMh7ChqWETkvAySTWezCA9UR4YeJiqpQ6Yu8Ky6s5q
 1qPDQMS3p50mPrEqR9b36SJBZDopSOaJdVLJkXRKUZ7HZXdLuZixEJ1YHJ9jjnh0lzv1
 qXmBhg0X3qmqA7CnyKSW2R4fqcnKxX+R7jHHGQtduKcAHrXrxPeC9pujdwhJhiZuUMsy
 773g==
X-Gm-Message-State: AOAM531YTR/Hh0uRlFBBX0bIQuIDggvf4E0fC6v/QHZWflNM2/ESfvKo
 8W5Ql+qjf04GIF+8oW9YBjaF8kmyLJBfDsA2DgvpC41KFVM1UPEZ1gFhmpCKKkIMDWWo8f0I/ed
 HFVZ92Yw6xAA5gGE=
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr2685364wry.495.1642057610066; 
 Wed, 12 Jan 2022 23:06:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBTIlzCxj5bKpjpGPv8M5DseF2lHoOM0jcR8at3irUUsKyIZPQ+63WXwg4eoPLRGklJkJxyA==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr2685338wry.495.1642057609746; 
 Wed, 12 Jan 2022 23:06:49 -0800 (PST)
Received: from redhat.com ([2.55.6.51])
 by smtp.gmail.com with ESMTPSA id z1sm573755wmp.5.2022.01.12.23.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:06:49 -0800 (PST)
Date: Thu, 13 Jan 2022 02:06:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20220113020527-mutt-send-email-mst@kernel.org>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220105041945.13459-3-jasowang@redhat.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
 peterx@redhat.com
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

typo

And drop "We should" pls, just use direct voice:
"Assume PT not enabled".


> +             * not enabled for safety.
> +             */
>              return false;
>          }
>          return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> -- 
> 2.25.1


