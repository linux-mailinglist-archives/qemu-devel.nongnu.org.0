Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6694B41FF
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 07:34:01 +0100 (CET)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJUvw-0005cq-5W
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 01:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJUtK-0004qE-3i
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJUtB-00048L-HC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644820267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tqm20092Loay16bcOXWAwEmUpHJA671RM+ohsWt0RtQ=;
 b=fNlt4SvIEbL3VNkElGZe7TF2jTprALWUMIWMVoJeQgBaqLqpBeTv+3T2iXJFLM0ryLoTqR
 slnxKPDlNmdzMOcMG3Jc+VAlLwkwVxCVcnbR3KJ1VgS8XNOhWcQO/P9K86ySgeaDKWxvX3
 eoyFWnH9SUCZADIJxvTx9RE/pooF3V8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-8Z8Vjh-6PwysQmQk0d7wkg-1; Mon, 14 Feb 2022 01:31:06 -0500
X-MC-Unique: 8Z8Vjh-6PwysQmQk0d7wkg-1
Received: by mail-pf1-f199.google.com with SMTP id
 g19-20020aa796b3000000b004e136dcec34so194005pfk.23
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 22:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tqm20092Loay16bcOXWAwEmUpHJA671RM+ohsWt0RtQ=;
 b=fQAiUPOITi2TdObd654aIhoC+o5+3LPQRQejrMIymv7T0rEjhreV3cRrcxseRlMOmC
 Ky+m+roqIf8mWUQU/wRSx2hiSxE9ReVg5yOOIUsvYbYAT5QGE5AZb9tIHzfMbFyl8vjf
 Uy3dOyepdP3N9UBbfYWTD5kvaw4/bGiQ4EA2hDIGuREeRcNazibpC5+szKDNyLRITKZw
 3I9cGpvsx0G6ctB98w60ix5QW60VIGZpiMUIpAb9qwLRAYu/g/MWBgmAJGEP9OH19DIe
 TC7LuvPl+hVtCOjvxEQNb1dNw+NEE1AVaCi74t3NaHGTe0Nvbl7F6kPFk91keOfiOJzm
 hZEw==
X-Gm-Message-State: AOAM533O307Qdk5vd41EM4xfxpwQ6Qmc9s3WooxeXoqjrUXLmDcVw48K
 AJL+Ku/DD7FoVJ15Gc8smBr1Jp6Ujcn8emZaC0hiWLXYfQknQnEoOrT5AqYsUhjRTuKS/4BWWNc
 YOCsus7B0KrXpErc=
X-Received: by 2002:a63:286:: with SMTP id 128mr10354724pgc.216.1644820264901; 
 Sun, 13 Feb 2022 22:31:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdwaT2qUbVF5/5mSOHU0s7dtUHZGRRrSxfgnc96zwcLlUAUkpLprQQWAarxFvWWTAjkvHTZw==
X-Received: by 2002:a63:286:: with SMTP id 128mr10354713pgc.216.1644820264632; 
 Sun, 13 Feb 2022 22:31:04 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id bm3sm24702024pgb.88.2022.02.13.22.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 22:31:04 -0800 (PST)
Date: Mon, 14 Feb 2022 14:30:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
Message-ID: <Ygn3I3T2DH3SHFXj@xz-m1.local>
References: <20220214060346.72455-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220214060346.72455-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:03:46PM +0800, Jason Wang wrote:
> SC is required for some kernel features like vhost-vDPA. So this patch
> implements basic SC feature. The idea is pretty simple, for software
> emulated DMA it would be always coherent. In this case we can simple
> advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> complicated, so this patch simply fail the IOMMU notifier
> registration.

Could we spell out which vhost branch won't work?  How about also mention what
this patch is used for (perhaps for some pure vdpa tests on fully emulated)?

> 
> In the future, we may want to have a dedicated notifiers flag or
> similar mechanism to demonstrate the coherency so VFIO could advertise
> that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
> need that since it's a software backend.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c          | 14 +++++++++++++-
>  hw/i386/intel_iommu_internal.h |  1 +
>  include/hw/i386/intel_iommu.h  |  1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 5b865ac08c..5fa8e361b8 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3022,6 +3022,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>      IntelIOMMUState *s = vtd_as->iommu_state;
>  
> +    /* TODO: add support for VFIO and vhost users */
> +    if (s->snoop_control) {
> +        error_setg_errno(errp, -ENOTSUP,
> +                         "Snoop Control with vhost or VFIO is not supported");
> +        return -ENOTSUP;
> +    }

IIUC this will also fail things like e.g. vhost-kernel but afaiu that can be
fully emulated too.  That's expected, am I right?

Thanks,

> +
>      /* Update per-address-space notifier flags */
>      vtd_as->notifier_flags = new;

-- 
Peter Xu


