Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597765957DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:16:55 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtd0-0002uY-9S
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNtXS-0002IL-3L
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNtXO-0003lF-4R
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660644665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNA/WEHQW2qQBjPz9C4YTAt9b1bms6uXkEl32mTwIDQ=;
 b=OEIh8BeyqgCaRpJ9PsXlgN28dnkLEye/gktPM7a+dd9oBTIId2OU5wBhETmt08Ax/WvV9t
 vErwVUYpSyDvjSD3QoKTqgR8QqtvvQqCR0lYXzlQ7ub5Sy99TDANvdU1kstjEFyH2gM6X+
 0Vk3P+sOQf/zg3I3UDdEHCudQ6ByVpg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-awsIwg2sOoa7ErvjSf0jaA-1; Tue, 16 Aug 2022 06:11:04 -0400
X-MC-Unique: awsIwg2sOoa7ErvjSf0jaA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q8-20020adfab08000000b00224f68eb1a3so1395521wrc.20
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=GNA/WEHQW2qQBjPz9C4YTAt9b1bms6uXkEl32mTwIDQ=;
 b=mHZ3jWbLC1b2m10MkghLNovjERtpjJAK/vPB72yL/DhX6pKcfWoQqxI58TrMzxM3yG
 FIX98Ti9QcAp12oilkuHhU6DqZ6MaOL8D2lDe08JMJ+biL4n69OI5HSfZu4TKXLyhhTM
 HxbKVhR2/dJ/y4kxaPXDJM+BxUOQ1ZvoiCWy9YTtKhBvi83RBZuhkSgKH98Y46DrZgJt
 08/eEP9rA9GTvFry4qASksQLDuwzjwczrSDdYGY7KgHtrWddU+tkzDFqFnnM2Ql8Q7VB
 Ubqc1FwEFklQArMf8X57lNSHZIR8vqjDHymwdSKuF4/beqSEa0VecnCRYsZu9xVQKgd8
 tipw==
X-Gm-Message-State: ACgBeo2wRErrQ+X0pSSZGWCfEpjw13IajrViqRlwuDAe5cUWpgMGZEqb
 s6KrC106LpTENtDZID2oerbt8R9K+G+7kwxc9iWFeDm7WVgdSIO9112AmmtaN6ZVpMOQxd4Y4/i
 hmbz1WFtz4FEIK/c=
X-Received: by 2002:a7b:ca58:0:b0:3a5:3c1c:6d71 with SMTP id
 m24-20020a7bca58000000b003a53c1c6d71mr19265383wml.118.1660644662848; 
 Tue, 16 Aug 2022 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fA7Sx6mrhFRB4ZGLkYIjpfSG75vwaCqadVb1qH4t7bWkNHNpa6UvB4xWhBZRaHD4ac2Yw0Q==
X-Received: by 2002:a7b:ca58:0:b0:3a5:3c1c:6d71 with SMTP id
 m24-20020a7bca58000000b003a53c1c6d71mr19265363wml.118.1660644662624; 
 Tue, 16 Aug 2022 03:11:02 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a5fa79007fsm5660083wmq.7.2022.08.16.03.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:11:01 -0700 (PDT)
Date: Tue, 16 Aug 2022 06:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paul Schlacter <wlfightup@gmail.com>
Cc: marcel.apfelbaum@gmail.com, fam@euphon.net, kwolf@redhat.com,
 stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org,
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org,
 hreitz@redhat.com, ani@anisinha.ca
Subject: Re: [PATCH v2] xio3130_upstream: Add ACS (Access Control Services)
 capability
Message-ID: <20220816060903-mutt-send-email-mst@kernel.org>
References: <CADak6y6U=jBXWWBtPruGrPxkwYZZwk5GekSG2n8DsGOvpQMh_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADak6y6U=jBXWWBtPruGrPxkwYZZwk5GekSG2n8DsGOvpQMh_A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 16, 2022 at 05:16:38PM +0800, Paul Schlacter wrote:
> v1 -> v2:
> - Allow ACS to be disabled.
> - Suggested by Michael S. Tsirkin, use disable-acs to set property.
> 
> v1:
> - Add ACS (Access Control Services) capability.

changelog generally after ---

> 
> If it is a pcie device, check that all devices on the path from


Hmm I don't see any checks on a path. what does this refer to?

> 
> the device to the root complex have ACS enabled, and then the
> 
> device will become an iommu_group.
> 
> it will have the effect of isolation
> 
> 
> 
> Signed-off-by: wangliang <wlfightup@gmail.com>
> 
> Signed-off-by: wangliang <wangliang40@baidu.com>
> 

why two signatures?

> 
> ---

> 
>  hw/pci-bridge/xio3130_upstream.c | 12 +++++++++++-
> 
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Patch has corrupted whitespace.

> 
> diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/
> xio3130_upstream.c
> 
> index 2df952222b..5433d06fb3 100644
> 
> --- a/hw/pci-bridge/xio3130_upstream.c
> 
> +++ b/hw/pci-bridge/xio3130_upstream.c
> 
> @@ -24,6 +24,7 @@
> 
>  #include "hw/pci/msi.h"
> 
>  #include "hw/pci/pcie.h"
> 
>  #include "hw/pci/pcie_port.h"
> 
> +#include "hw/qdev-properties.h"
> 
>  #include "migration/vmstate.h"
> 
>  #include "qemu/module.h"
> 
>  
> 
> @@ -59,6 +60,7 @@ static void xio3130_upstream_reset(DeviceState *qdev)
> 
>  static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
> 
>  {
> 
>      PCIEPort *p = PCIE_PORT(d);
> 
> +    PCIESlot *s = PCIE_SLOT(d);
> 
>      int rc;
> 
>  
> 
>      pci_bridge_initfn(d, TYPE_PCIE_BUS);
> 
> @@ -94,7 +96,9 @@ static void xio3130_upstream_realize(PCIDevice *d, Error
> **errp)
> 
>          goto err;
> 
>      }
> 
>  
> 
> -    pcie_acs_init(d, XIO3130_ACS_OFFSET);
> 
> +    if (!s->disable_acs) {
> 
> +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> 
> +    }
> 
>      return;
> 
>  
> 
>  err:
> 
> @@ -113,6 +117,11 @@ static void xio3130_upstream_exitfn(PCIDevice *d)
> 
>      pci_bridge_exitfn(d);
> 
>  }
> 
>  
> 
> +static Property xio3130_upstream_props[] = {
> 
> +    DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),
> 
> +    DEFINE_PROP_END_OF_LIST()
> 
> +};
> 
> +

I'd say prefix the property with "x-".


> 
>  static const VMStateDescription vmstate_xio3130_upstream = {
> 
>      .name = "xio3130-express-upstream-port",
> 
>      .priority = MIG_PRI_PCI_BUS,
> 
> @@ -142,6 +151,7 @@ static void xio3130_upstream_class_init(ObjectClass *klass,
> void *data)
> 
>      dc->desc = "TI X3130 Upstream Port of PCI Express Switch";
> 
>      dc->reset = xio3130_upstream_reset;
> 
>      dc->vmsd = &vmstate_xio3130_upstream;
> 
> +    device_class_set_props(dc, xio3130_upstream_props);
> 
>  }
> 

Seems to lack compat machinety for existing machine types.


>  
> 
>  static const TypeInfo xio3130_upstream_info = {
> 
> -- 
> 
> 2.24.3 (Apple Git-128)
> 


