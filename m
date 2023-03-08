Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6126AFBB7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiCf-0000lQ-4r; Tue, 07 Mar 2023 20:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiCc-0000l0-O6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:02:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiCa-0008WP-AS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2YagRDbkNUKdmBV6c1eqECwm9lK8Fy6fEjJvSb10aho=;
 b=d1ZgXS1/1WXeIsutKDZ9KJGEsf6lOlG2WDY0LCX+Il8UytM3OMR3lfZmg41KV/x4wLAKs3
 pYLbnLszPnf8Llm5n8lAIVuV5lQ/FyCKvT9NtVUhe8pn0waFNxAL2YcFp9uqyZwkMpTbSE
 M0IVZ/RzZYrAI9P9PKpwsCKp33G7c6I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Rkm5coz2NPyEnbE7nj9Xjg-1; Tue, 07 Mar 2023 20:02:40 -0500
X-MC-Unique: Rkm5coz2NPyEnbE7nj9Xjg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so11229571eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237359;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YagRDbkNUKdmBV6c1eqECwm9lK8Fy6fEjJvSb10aho=;
 b=a2qboRyL/GlGxn/Z3kVhRAL9agH1/XI+n5RBUHFWKRQ0Avil173p/iva/Uln4j6k5Z
 YFEkQI7n0IDnoPwIPkB8xnbjx5B6OkS+JtOyZ6iousF27pzIK0fnB6M7gp79juy/pAwb
 lCp623rAmla1fm3v09ONZer9Cr1fFUz4Fj2kMOW8THXke/SQXIwu4R2yWCkBxGq/7KU6
 cfjKDOxDUYW2dJvJthiBW+Hls/t1iqCJvuz+VkGnKnmtemGuLk1SXQ696ctPUg3HcZdB
 MLj9/8pMulJXotmNGGnVEUXQ3iPlDuIH+AYuI/1UrsqCcoNRA87w80HIrhVinNf8z55t
 5UzA==
X-Gm-Message-State: AO0yUKWo/lkEtbQuwQiFzXLS4GFfhOdf5t+5CBlq0aL341JLFFghlMW4
 s8AKP00Cp4LtCbBYn9BZm4NOd4P9i3Py9jc+ETn8OzEAdyePK2hgZoM2FVUSv2vSgvcDhJp+OCL
 V2xPiGedYnY4wNhI=
X-Received: by 2002:a17:906:6a0f:b0:889:d998:1576 with SMTP id
 qw15-20020a1709066a0f00b00889d9981576mr21960629ejc.66.1678237359426; 
 Tue, 07 Mar 2023 17:02:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8EHEllcDclwlVQLXXmW2wl8s4H0VkXwh/8SapPt2yGxxAcH8bN5GfcghsMeL11aa2LcdHUOg==
X-Received: by 2002:a17:906:6a0f:b0:889:d998:1576 with SMTP id
 qw15-20020a1709066a0f00b00889d9981576mr21960609ejc.66.1678237359123; 
 Tue, 07 Mar 2023 17:02:39 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v18-20020a17090606d200b008ca37f3eae9sm6735208ejb.131.2023.03.07.17.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:02:38 -0800 (PST)
Date: Tue, 7 Mar 2023 20:02:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com, lvivier@redhat.com
Subject: Re: [PATCH V2 3/5] memory: introduce
 memory_region_unmap_iommu_notifier_range()
Message-ID: <20230307200208-mutt-send-email-mst@kernel.org>
References: <20230223065924.42503-1-jasowang@redhat.com>
 <20230223065924.42503-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223065924.42503-4-jasowang@redhat.com>
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

On Thu, Feb 23, 2023 at 02:59:22PM +0800, Jason Wang wrote:
> This patch introduces a new helper to unmap the range of a specific
> IOMMU notifier.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/exec/memory.h | 10 ++++++++++
>  softmmu/memory.c      | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 2e602a2fad..6fa0b071f0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1731,6 +1731,16 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>  void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>                                      IOMMUTLBEvent *event);
>  
> +/**
> + * memory_region_unmap_iommu_notifier_range: notify a unmap for an IOMMU
> + *                                           translation that covers the
> + *                                           range of a notifier
> + *
> + * @notifier: the notifier to be notified
> + */
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> +
> +
>  /**
>   * memory_region_register_iommu_notifier: register a notifier for changes to
>   * IOMMU translation entries.

This causes doc warnings:

/scm/qemu/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
/scm/qemu/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'


please fix.


> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca26..ba43b4474e 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1996,6 +1996,19 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>      }
>  }
>  
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
> +{
> +    IOMMUTLBEvent event;
> +
> +    event.type = IOMMU_NOTIFIER_UNMAP;
> +    event.entry.target_as = &address_space_memory;
> +    event.entry.iova = n->start;
> +    event.entry.perm = IOMMU_NONE;
> +    event.entry.addr_mask = n->end - n->start;
> +
> +    memory_region_notify_iommu_one(n, &event);
> +}
> +
>  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>                                  int iommu_idx,
>                                  IOMMUTLBEvent event)
> -- 
> 2.25.1


