Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F545699CB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 07:22:43 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9JyM-0004Fg-95
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 01:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9JwW-0002ze-Qc
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o9JwU-0008WB-W0
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 01:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657171246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHDXdATVu1ju01ObO4tFQR0WA/dTYESZMSNbtqfdxQM=;
 b=UupAZ/zCGgWqfIGCnPZK1lk5wfWx2N22lO9gMkJ9/WglM1JzsXOEVPnIkVXPQs6WoLqPgl
 8Ixg702L1wGNrRWASpqqFd+U4fG5O/lKwEYkrOkw+ZWAeNgoLNeCTlL+eQdVXqgyxpWobl
 +64fUDooOXN2JBzMsJa5Eq3bp/ZbCo8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-LjMq0TiWNe6d4Cb-h-AEpA-1; Thu, 07 Jul 2022 01:20:44 -0400
X-MC-Unique: LjMq0TiWNe6d4Cb-h-AEpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h186-20020a1c21c3000000b003a2cf5b5aaaso279454wmh.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 22:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RHDXdATVu1ju01ObO4tFQR0WA/dTYESZMSNbtqfdxQM=;
 b=6qaLO5qRUe2H1MrvgOTQRG3VbE5hZ0j6n3CV/OIevynLTEMBmh7PMmbQF9bd8E0m7g
 lcjxFaRLLOG1b3w0LyqPd+FX2vqqN/sFIKr++86+vr97iIcdaMkxPC9Ku5v6T4to1Rlv
 NJRH5AzZox0lDbBCPcXlkUzmur7KGWqqkEzCVKRQYw4ltAgiaZQSxCOjif/LO4lCRuh5
 SBGIHxCEdqQD5dbsMEwyuLrdd68+lO3eXERapoUDPAIfzJZ9DkpPYsBhQ5t1HmX6ZU9Q
 1LB8xkDZR/fqw5kPVtA83/OuUpAYysvr0PudOonSN9YvyouSm7ut6IgAmZY+DYC/XGR2
 eoDQ==
X-Gm-Message-State: AJIora821zBdI9GLPg8WU5jvAIkuXqNYTxyWWyVxc7hxqUsWRqd+eH/e
 Ac4/ig2+QDfZupnMENs4pFel3qh8UEhLoQFhdPci++Qem4qG5k9rfJgCnoLxKrcZOw6SkJBgCOd
 khUJ4rv4mDXv2MMw=
X-Received: by 2002:a7b:c386:0:b0:3a2:cf61:133f with SMTP id
 s6-20020a7bc386000000b003a2cf61133fmr836785wmj.31.1657171243687; 
 Wed, 06 Jul 2022 22:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTvvpvds+7TAvJMvDgJSOlQAMRwMhJ7/OM96P5U/FFsOm3WN1XRnHxfJEj0VhdOsLn6qEuSQ==
X-Received: by 2002:a7b:c386:0:b0:3a2:cf61:133f with SMTP id
 s6-20020a7bc386000000b003a2cf61133fmr836772wmj.31.1657171243443; 
 Wed, 06 Jul 2022 22:20:43 -0700 (PDT)
Received: from redhat.com ([2.52.154.68]) by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b0039c798b2dc5sm23916414wmk.8.2022.07.06.22.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 22:20:42 -0700 (PDT)
Date: Thu, 7 Jul 2022 01:20:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru
Subject: Re: [PATCH] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <20220707011925-mutt-send-email-mst@kernel.org>
References: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 04, 2022 at 01:25:14PM +0300, Roman Kagan wrote:
> It's possible to create non-working configurations by attaching a device
> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> specifying a slot number other that zero, e.g.:
> 
>     -device pcie-root-port,id=s0,... \
>     -device virtio-blk-pci,bus=s0,addr=4,...
> 
> Make QEMU reject such configurations and only allow addr=0 on the
> secondary bus of a PCIe slot.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  hw/pci/pci_bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index da34c8ebcd..8b38d5ad3d 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -33,6 +33,7 @@
>  #include "qemu/units.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/pci/pcie_port.h"
>  #include "qemu/module.h"
>  #include "qemu/range.h"
>  #include "qapi/error.h"
> @@ -386,6 +387,10 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
>      br->windows = pci_bridge_region_init(br);
>      QLIST_INIT(&sec_bus->child);
>      QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> +
> +    if (PCIE_SLOT(dev)) {
> +        sec_bus->slot_reserved_mask = ~1u;
> +    }


Please add comments explaining what's going on.

>  }
>  
>  /* default qdev clean up function for PCI-to-PCI bridge */
> -- 
> 2.36.1


