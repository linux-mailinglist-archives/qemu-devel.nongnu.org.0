Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A256A7656
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUIV-0000Ww-9T; Wed, 01 Mar 2023 16:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUIM-0000Vm-Tn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUIK-0004Sp-B7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hNBbD54s1tLqT84qszu4hk/UWZZhN+82k4aLGc5ero=;
 b=ZXKCzL/d2a3yEgBhMXmTzVE7xMnARfTBLwnTeXEhVhbslWbQzFsWeNGou4Woi8S8ElMu56
 OGdxDgwwvjSsYasl5CTCUiazy7//jF9C1bLXdIsVH7fKzptzILZzqyYihNoC0sMJq6iOgb
 yzKKzGwo0IRvAV4DFF6i4lf8ob6pg20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-60tUSAKAPtCQ5cbX_E0jYQ-1; Wed, 01 Mar 2023 16:47:26 -0500
X-MC-Unique: 60tUSAKAPtCQ5cbX_E0jYQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so2852904wrb.20
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707245;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hNBbD54s1tLqT84qszu4hk/UWZZhN+82k4aLGc5ero=;
 b=OSG5IMF2aNht7ClIj4UGrGIHo9X9HSQgNkO8pi/JPL5iqOt5q0SvvxS4eDVgVDM97i
 DJIaI0PMInK1jYIIfsMbpENeDUCB0dbOaYSbjC5iZDl40MIV9MId7aboZzRFy6ikLoEb
 5mHaosn2jpH24449d1KN1jktZxpHe/3jRaSCAPViTx5TcT2LSiOsYKLNU+4x10NB4wEV
 4WQdwA+02n17RsyOtMceTwkr6QcJFWvZAHjzxHWX781DXDa9WF/6wF7ch/pn6O48sXJT
 cQtPA+KrIIsk2J0ERUwPc4VLNxm9g8T4UXsO9S5YRf4ktDS831jRJ227I10A8Da1zXQC
 MVFg==
X-Gm-Message-State: AO0yUKVMUB7loRc58Y56sbKRnMazTWAORTg9Qwv1h54EjETbePs0gv5y
 oryiIJNYdmXPrglgLUEdZ8CmQENn9FgbUgzEQdqtW8vHZc6FfwpXm4cMP+qx745YZrxDMj01Vuc
 pE0r+ueSVsyJskaO++p0C
X-Received: by 2002:adf:f404:0:b0:2c5:5687:5ed5 with SMTP id
 g4-20020adff404000000b002c556875ed5mr5611915wro.18.1677707244841; 
 Wed, 01 Mar 2023 13:47:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+cz+V1uDX3/VxYZo1R5lPUpfuqHI5BfbjP3U5zECVBhRhovfHQGkwWJXojIBgIw6eUMM9ltQ==
X-Received: by 2002:adf:f404:0:b0:2c5:5687:5ed5 with SMTP id
 g4-20020adff404000000b002c556875ed5mr5611907wro.18.1677707244499; 
 Wed, 01 Mar 2023 13:47:24 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002cdbb26bb48sm2610481wrt.33.2023.03.01.13.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:47:24 -0800 (PST)
Date: Wed, 1 Mar 2023 16:47:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 06/12] hw/pci-host/q35: Initialize properties just once
Message-ID: <20230301164701-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <20230214131441.101760-7-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-7-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 14, 2023 at 02:14:35PM +0100, Bernhard Beschow wrote:
> Although not used there, the attributes for Q35's "pci-hole64-size" and
> "short_root_bus" properties currently reside in its child device. This
> causes the default values to be overwritten during the child's
> object_initialize() phase.

pls add explanation why this is a problem.

> Avoid this by moving both attributes into the
> host device.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/pci-host/q35.h |  5 +++--
>  hw/pci-host/q35.c         | 20 +++++---------------
>  2 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index fcbe57b42d..93e41ffbee 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -54,8 +54,6 @@ struct MCHPCIState {
>      Range pci_hole;
>      uint64_t below_4g_mem_size;
>      uint64_t above_4g_mem_size;
> -    uint64_t pci_hole64_size;
> -    uint32_t short_root_bus;
>      uint16_t ext_tseg_mbytes;
>  };
>  
> @@ -64,7 +62,10 @@ struct Q35PCIHost {
>      PCIExpressHost parent_obj;
>      /*< public >*/
>  
> +    uint64_t pci_hole64_size;
> +    uint32_t short_root_bus;
>      bool pci_hole64_fix;
> +
>      MCHPCIState mch;
>  };
>  
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 0e198f97a7..03aa08dae5 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -76,7 +76,7 @@ static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
>      Q35PCIHost *s = Q35_HOST_DEVICE(host_bridge);
>  
>       /* For backwards compat with old device paths */
> -    if (s->mch.short_root_bus) {
> +    if (s->short_root_bus) {
>          return "0000";
>      }
>      return "0000:00";
> @@ -161,27 +161,19 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
>  
>      pci_bus_get_w64_range(h->bus, &w64);
>      value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> -    hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
> +    hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
>      if (s->pci_hole64_fix && value < hole64_end) {
>          value = hole64_end;
>      }
>      visit_type_uint64(v, name, &value, errp);
>  }
>  
> -/*
> - * NOTE: setting defaults for the mch.* fields in this table
> - * doesn't work, because mch is a separate QOM object that is
> - * zeroed by the object_initialize(&s->mch, ...) call inside
> - * q35_host_initfn().  The default values for those
> - * properties need to be initialized manually by
> - * q35_host_initfn() after the object_initialize() call.
> - */
>  static Property q35_host_props[] = {
>      DEFINE_PROP_UINT64(PCIE_HOST_MCFG_BASE, Q35PCIHost, parent_obj.base_addr,
>                          MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT),
>      DEFINE_PROP_SIZE(PCI_HOST_PROP_PCI_HOLE64_SIZE, Q35PCIHost,
> -                     mch.pci_hole64_size, Q35_PCI_HOST_HOLE64_SIZE_DEFAULT),
> -    DEFINE_PROP_UINT32("short_root_bus", Q35PCIHost, mch.short_root_bus, 0),
> +                     pci_hole64_size, Q35_PCI_HOST_HOLE64_SIZE_DEFAULT),
> +    DEFINE_PROP_UINT32("short_root_bus", Q35PCIHost, short_root_bus, 0),
>      DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MEM_SIZE, Q35PCIHost,
>                       mch.below_4g_mem_size, 0),
>      DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MEM_SIZE, Q35PCIHost,
> @@ -218,9 +210,7 @@ static void q35_host_initfn(Object *obj)
>      object_initialize_child(OBJECT(s), "mch", &s->mch, TYPE_MCH_PCI_DEVICE);
>      qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
> -    /* mch's object_initialize resets the default value, set it again */
> -    qdev_prop_set_uint64(DEVICE(s), PCI_HOST_PROP_PCI_HOLE64_SIZE,
> -                         Q35_PCI_HOST_HOLE64_SIZE_DEFAULT);
> +
>      object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
>                          q35_host_get_pci_hole_start,
>                          NULL, NULL, NULL);
> -- 
> 2.39.1


