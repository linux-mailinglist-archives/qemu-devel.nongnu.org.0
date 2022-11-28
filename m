Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E36F63A841
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 13:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdCF-0003Mz-Hj; Mon, 28 Nov 2022 07:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozdCB-0003Mk-SS
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozdC9-00014x-Ek
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 07:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669638301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1lcVkMIYJ6m3NwTTYu3tF4ix2h2s3Yz2aEJEiu6skgI=;
 b=gHXYB2+5C4OoJZ16GNkqi5VV/zdpN3YIC+/jkjh/4XTy7pPY0Swg9vDjq3x3wiHo5rOW2Z
 Xvd0yr53Tmq8SzA0zKzOBZPPpjQZEyjMn6XGgKGco0/jMWAkfj9o8dRGsDCZZvx8WZyolg
 Pgfivx5w5zCKzGU2NI/qET1eWC0gI9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-geoF1WwZNMa1uKmLjUNcBQ-1; Mon, 28 Nov 2022 07:24:59 -0500
X-MC-Unique: geoF1WwZNMa1uKmLjUNcBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so3635167wme.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 04:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lcVkMIYJ6m3NwTTYu3tF4ix2h2s3Yz2aEJEiu6skgI=;
 b=K/Ngha8B9Gj2jlsiMTY/tZ9Eh6n85TSJBXY9Fx0caCsqVtuK4tPWNN0mXNZjiadg2B
 rGsBoWo/sOP7tr0G/HDryBEXshnysshjJ3ql8/LrFRELHkt97rvFHVdAlC+1jcM77aDL
 7v4J8NJD907u85uUdKHzRWBWBcKiwBPrDTODwLECB6rpudeYcFQRNnG372zoFPbBqc5k
 F5+9s0BQdsgegpevuYhxKE/u7of4KB5hzDFeznFFlaAnt/xEACJ5zaEbODQO3VaIq+TL
 8lDQTG1VkO2F5GZMhwXufrGW9PPWIQ39P+oZTWb9B1MbQ4R79xZv6un+kQ8O/BPrdjMt
 FPpg==
X-Gm-Message-State: ANoB5pl1mZIeytDZVNYl4s0qneDkxrwOm2hsHTYgpiooIDDNKYRm/Cgw
 vmT5qmUCeKa2P1OBOkaZ2LJ3/mOgzIchFQ6gNjCrz2LS/d+L0FmtjmEEH/BhP8XFA+MP0wKrxGr
 9ew7h7Hdhs9M5Vmo=
X-Received: by 2002:a5d:6144:0:b0:242:1c33:35b8 with SMTP id
 y4-20020a5d6144000000b002421c3335b8mr1455003wrt.217.1669638298491; 
 Mon, 28 Nov 2022 04:24:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4X5fJ3VZt9ftSnYuIVghhzTOMFBW+10vmkAMAX+pc7wRMtQThO17o3TW8eRIA4ylpL/ggdKA==
X-Received: by 2002:a5d:6144:0:b0:242:1c33:35b8 with SMTP id
 y4-20020a5d6144000000b002421c3335b8mr1454993wrt.217.1669638298244; 
 Mon, 28 Nov 2022 04:24:58 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003cfd0bd8c0asm16365656wms.30.2022.11.28.04.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 04:24:57 -0800 (PST)
Date: Mon, 28 Nov 2022 12:24:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
Message-ID: <Y4Sol9q0NI52iTmE@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-6-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Had you considered wrapping the hmp-commands-info.hx entry
with a #if defined instead?

Dave

> ---
>  hw/pci/pci-stub.c  | 5 +++++
>  hw/pci/meson.build | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> index f29ecc999e..01d20a2f67 100644
> --- a/hw/pci/pci-stub.c
> +++ b/hw/pci/pci-stub.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/sysemu.h"
>  #include "monitor/monitor.h"
> +#include "monitor/hmp.h"
>  #include "qapi/qapi-commands-pci.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/msi.h"
> @@ -34,6 +35,10 @@ PciInfoList *qmp_query_pci(Error **errp)
>      return NULL;
>  }
>  
> +void hmp_info_pci(Monitor *mon, const QDict *qdict)
> +{
> +}
> +
>  void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>  {
>      monitor_printf(mon, "PCI devices not supported\n");
> diff --git a/hw/pci/meson.build b/hw/pci/meson.build
> index e42a133f3a..4fcd888b27 100644
> --- a/hw/pci/meson.build
> +++ b/hw/pci/meson.build
> @@ -5,6 +5,7 @@ pci_ss.add(files(
>    'pci.c',
>    'pci_bridge.c',
>    'pci_host.c',
> +  'pci-hmp-cmds.c',
>    'pci-qmp-cmds.c',
>    'pcie_sriov.c',
>    'shpc.c',
> @@ -20,4 +21,3 @@ softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
>  
>  softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
> -softmmu_ss.add(files('pci-hmp-cmds.c'))
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


