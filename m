Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FBD6A7655
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:46:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUHY-0007ja-JW; Wed, 01 Mar 2023 16:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUHR-0007Zx-Kw
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUHO-0004Bc-RT
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k8pv4CVAIYCba3sIARekdUs9VRnwsbaeSga1EzSc93Y=;
 b=LPM8EzJTR8ZCSXJEnwhPhtbJfGDupI5iXMe3phGnp3IBVQ4EtLGXizCxgLDircyYsmPHLu
 3y9B9KnuSpYSXSR471mXLUOQ1TohZ7fY9oJA9Wqw01XsnCZN8UfR2T+tZMvN4vY8SFZa+F
 diYftDqyvMgdREiUeECstz0iz+42uBw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-0hnP-x6oPW-3kfzEYunAVQ-1; Wed, 01 Mar 2023 16:46:27 -0500
X-MC-Unique: 0hnP-x6oPW-3kfzEYunAVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso267543wmc.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8pv4CVAIYCba3sIARekdUs9VRnwsbaeSga1EzSc93Y=;
 b=aWu7rWQJ7SwdOgpXP7Mp2D6ziUoYfoXKQaw+mds06sBLqBjEh54sOJCY+Vq2tAzU/K
 DZ3YXgsMfCd5cAp60wSCImOtwHc3hQ5DXl1M6ao8f4/5XNVZEgqF8pdTtb5eru0uMNrY
 rjCBmJezQh5/tR9uqzL+H0H5QNQ3pWiVlfCg1rhM2zBaYNXCLp0xbVPfZrYugXmFgnrQ
 koJqJQq3E/zkHYx5LoNcy/u0BDcDlQxq5d9gGEUyF68Bw5AS5r3qLJ1JRpEVyfNFQt0p
 FXODdrltEnWL8YiBwdjxIn/XZc4rT15QL2Fw3lDFHLDEc4IX8GXJHKaCpE4RuOikCvnA
 p1Gw==
X-Gm-Message-State: AO0yUKVj1mS1njENqHuLf5IL3vPWQYwE2hYmJ9wBjUa0O5CyF4BW94Qd
 HPWLX0twqOn970SQ4nLB+uXyWt9ElQ5xatedVmDub8NuN0xvouqH2bctMkKMa2sEAEpx/D7Rhmw
 nEUxiFyuDes3rX68=
X-Received: by 2002:a05:600c:4e06:b0:3eb:2db4:c626 with SMTP id
 b6-20020a05600c4e0600b003eb2db4c626mr6028856wmq.38.1677707186391; 
 Wed, 01 Mar 2023 13:46:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9m0aI3SOXZx96Aj+x0BXXTAKJLC43uO+HVuO/8E2OSpc16+Hu5usIx7lp4aXT5m7IRrzfzfg==
X-Received: by 2002:a05:600c:4e06:b0:3eb:2db4:c626 with SMTP id
 b6-20020a05600c4e0600b003eb2db4c626mr6028846wmq.38.1677707186104; 
 Wed, 01 Mar 2023 13:46:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 w11-20020adff9cb000000b002c55de1c72bsm13463016wrr.62.2023.03.01.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:46:25 -0800 (PST)
Date: Wed, 1 Mar 2023 16:46:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 05/12] hw/pci-host/q35: Initialize "bypass-iommu"
 property from board code
Message-ID: <20230301164557-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <20230214131441.101760-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-6-shentey@gmail.com>
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

On Tue, Feb 14, 2023 at 02:14:34PM +0100, Bernhard Beschow wrote:
> The Q35 PCI host already has a "bypass-iommu" property. However, the
> host initializes this property itself by accessing global machine state,
> thereby assuming it to be a PC machine. Avoid this by having board code
> set this property.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/i386/pc_q35.c  | 2 ++
>  hw/pci-host/q35.c | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index c2dc87acee..b3c55012d4 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -231,6 +231,8 @@ static void pc_q35_init(MachineState *machine)
>                              x86ms->below_4g_mem_size, NULL);
>      object_property_set_int(phb, PCI_HOST_ABOVE_4G_MEM_SIZE,
>                              x86ms->above_4g_mem_size, NULL);
> +    object_property_set_bool(phb, "bypass-iommu",
> +                             pcms->default_bus_bypass_iommu, NULL);

Can we use a macro to avoid duplicating the property name?

>      sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), &error_fatal);
>  
>      /* pci */
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 26e9e28e0e..0e198f97a7 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -66,8 +66,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
>                                  s->mch.pci_address_space,
>                                  s->mch.address_space_io,
>                                  0, TYPE_PCIE_BUS);
> -    pci->bypass_iommu =
> -        PC_MACHINE(qdev_get_machine())->default_bus_bypass_iommu;
> +
>      qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
>  }
>  
> -- 
> 2.39.1


