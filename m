Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7D31EC68
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:44:36 +0100 (CET)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmPs-0004zN-0a
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCmNZ-00045d-2S
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lCmNW-0005jD-Mn
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613666528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bmwAIhb/Gh1yA5qVqeOv/wtEygBfSM5na+p1Cgtcg8=;
 b=WUWh6IT8mC5poqRNKnEcKHBufA/SVhD06hQ6yP3+xXM7Jg/l/+RM2/dIC2YONPvgLmzAtH
 MEkzIaSAvWBL96AH7i1c+MsAso/S2dE5EctVij+jpbLC072AgDeNK1N/1ksEqtUXpT9KEl
 +15CHuOkh4hxCLN9VFeql6kYfL38yDQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-VDWxO5OxMhaAR9XqucWu2g-1; Thu, 18 Feb 2021 11:42:06 -0500
X-MC-Unique: VDWxO5OxMhaAR9XqucWu2g-1
Received: by mail-qt1-f199.google.com with SMTP id f5so1519992qtf.15
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 08:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8bmwAIhb/Gh1yA5qVqeOv/wtEygBfSM5na+p1Cgtcg8=;
 b=VDlandrtSEWB1bROrf2a9XcPFW1RRAAYFLEVqj4vr8EmcEYrgQxljUZqjLBF/Vyn2Z
 XlmuMkwDyT48xk4x2cUeYOSOKqxcqWxcfuFFFmMjykrTyRK4Z7Y68goVNO+VtzUQVqY5
 GnOAO7rHH9TtKw7NKSNaUybyBtHt85fJJWx5VfRQAFvblHilJYIgrvv2ewU/uRGhoyOa
 hi83jU2mhEWiFd0Im2kBoZextyfMjrrYjC3MEvotA84uvSX23FT4Ctpgymlg3X0tgFdK
 6q4otPk6R4aGoraJW9bmPp1HcHUxeEfRr2rjaA0SHSPS9adS9jQQ9uwutyUk4uDBPM4p
 YRPw==
X-Gm-Message-State: AOAM5335yeIts6CeW1wM3TJ1b+EWmx/9Bn6TOOMbaQR861d7ilf1u/E/
 swjXPNF/9UIf7nBnyS11fdF/+vI/KKEQjwxjozAjKo/3e05z4c2bGL5WmKyucBue5WOPklcy/lU
 hxfhKrtSAV02wf3g=
X-Received: by 2002:a37:bf04:: with SMTP id p4mr5305345qkf.459.1613666526321; 
 Thu, 18 Feb 2021 08:42:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLeea18exfG5VjQrvamDiQTM1eLRvjW7D9miMWkQ4doOrAyWGUgrggShYGi1tECKAK+wZbdw==
X-Received: by 2002:a37:bf04:: with SMTP id p4mr5305317qkf.459.1613666526076; 
 Thu, 18 Feb 2021 08:42:06 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id s130sm4326640qka.10.2021.02.18.08.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 08:42:04 -0800 (PST)
Date: Thu, 18 Feb 2021 11:42:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
Message-ID: <20210218164203.GA108961@xz-x1>
References: <20210218141650.424967-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210218141650.424967-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 qemu-devel@nongnu.org, vivek.gautam@arm.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric,

On Thu, Feb 18, 2021 at 03:16:50PM +0100, Eric Auger wrote:
> @@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
>  
>      event.type = IOMMU_NOTIFIER_UNMAP;
>      event.entry.target_as = &address_space_memory;
> -    event.entry.addr_mask = virt_end - virt_start;
> -    event.entry.iova = virt_start;
>      event.entry.perm = IOMMU_NONE;
>      event.entry.translated_addr = 0;
> +    event.entry.addr_mask = mask;
> +    event.entry.iova = virt_start;
>  
> -    memory_region_notify_iommu(mr, 0, event);
> +    if (mask == UINT64_MAX) {
> +        memory_region_notify_iommu(mr, 0, event);
> +    }
> +
> +    size = mask + 1;
> +
> +    while (size) {
> +        uint8_t highest_bit = 64 - clz64(size) - 1;

I'm not sure fetching highest bit would work right. E.g., with start=0x11000
and size=0x11000 (then we need to unmap 0x11000-0x22000), current code will
first try to invalidate range (0x11000, 0x10000), that seems still invalid
since 0x11000 is not aligned to 0x10000 page mask.

I think the same trick in vtd_address_space_unmap() would work.  If you agree,
maybe we can generalize that get_naturally_aligned_size() out, but maybe with a
better name as a helper?

Thanks,

-- 
Peter Xu


