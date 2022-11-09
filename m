Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776C623754
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 00:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osuEX-0006fw-1r; Wed, 09 Nov 2022 18:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osuEV-0006fn-Db
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osuET-00050k-Fo
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 18:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668035504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyFpb8nulEazkakzghWLWOG3we360EABagSBqyFWcoE=;
 b=e33/gkh8aqin7fgPnR06UzUzo63SiKE09AnGmpfvUPJ1PNYvNoMorzYz+aHJgQwhWH2/yy
 t7jqOzqVmHQ8jJRlqKAM1NeL3oYbIJqIzwHh9/OsKcW+7aiw8TJ1Ixu4kY5RDQNB0onSRh
 FHfLSPv/tzCVUGukx+zXgQazve/PkyQ=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-GBTKYCnYMOS6YiKublENXw-1; Wed, 09 Nov 2022 18:11:42 -0500
X-MC-Unique: GBTKYCnYMOS6YiKublENXw-1
Received: by mail-pg1-f199.google.com with SMTP id
 i19-20020a63e913000000b004705d1506a6so13477pgh.13
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 15:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyFpb8nulEazkakzghWLWOG3we360EABagSBqyFWcoE=;
 b=1t+f0Jzugtgnd1sj7a3LOj6cQd6On3xkeb02WdDtBzRarLndj8HqWufs0xndx9LFlY
 YZGyt6tsxcZNEnaeNk6pUW27exVX49Q7wLTQwn2Y9nPJGqbXPkzJB8AFJNBrLULzb5dY
 cTYSUplNXBqg/tOJv20/ZlSs918II6fIzE11SCOYXgCQLu2YkJGw4ZC7UCF/91AV6mkT
 ImKFkcRZ3NZfToKBWI/SHXx/7DMLMn6N8qyWd+kcxaKbz+YCq3aWzdE1eWcrFoA2Yb98
 5WiYTbgz/XZ1P1TlrUZeVG3Qj+EAugsIzy5Mbec6KUgScYpCtbd4RWHPa/oZ8OmI1eke
 Dnmg==
X-Gm-Message-State: ACrzQf3PwdyRJkAWQ32XtSW7rlt1N4NnuuWBDkcIJOntlRdY6TcaGQYK
 NY0sNX1ErD+kTmmoAMBKWy47ci/31trlUnkD/wh4NzpATZ/VutY38g7JlAZ1O9WjUgrIWAyhwPo
 Sg0VocTerRg9hTR4=
X-Received: by 2002:a63:d00e:0:b0:46f:8462:6222 with SMTP id
 z14-20020a63d00e000000b0046f84626222mr52206106pgf.285.1668035501678; 
 Wed, 09 Nov 2022 15:11:41 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6qnHnwqzl/WHkhUDAYVBDHIwbVrRRw21qpRwUm355PpjqDTCObIH7NkzHmdWT+QvXqZN2lHQ==
X-Received: by 2002:a63:d00e:0:b0:46f:8462:6222 with SMTP id
 z14-20020a63d00e000000b0046f84626222mr52206098pgf.285.1668035501362; 
 Wed, 09 Nov 2022 15:11:41 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00186f608c543sm9570041plm.304.2022.11.09.15.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 15:11:40 -0800 (PST)
Message-ID: <f47b7420-1eaa-6ba9-8288-0e8249708918@redhat.com>
Date: Thu, 10 Nov 2022 00:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] display: include dependencies explicitly
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20221109222112.74519-1-mst@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20221109222112.74519-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 23:21, Michael S. Tsirkin wrote:
> acpi-vga-stub.c pulls in vga_int.h
> However that currently pulls in ui/console.h which
> breaks e.g. on systems without pixman.
> It's better to remove ui/console.h from vga_int.h
> and directly include it where it's used.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Tested-by: Laurent Vivier <lvivier@redhat.com>

> ---
>   hw/display/vga_int.h        | 1 -
>   include/qemu/typedefs.h     | 2 ++
>   hw/display/ati_2d.c         | 1 +
>   hw/display/cirrus_vga.c     | 1 +
>   hw/display/cirrus_vga_isa.c | 1 +
>   hw/display/vga-isa.c        | 1 +
>   hw/display/vga-mmio.c       | 1 +
>   hw/display/vga-pci.c        | 1 +
>   hw/display/vga.c            | 1 +
>   hw/display/vmware_vga.c     | 1 +
>   10 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 330406ad9c..7cf0d11201 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -27,7 +27,6 @@
>   
>   #include "exec/ioport.h"
>   #include "exec/memory.h"
> -#include "ui/console.h"
>   
>   #include "hw/display/bochs-vbe.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 6d4e6d9708..688408e048 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -132,6 +132,8 @@ typedef struct Visitor Visitor;
>   typedef struct VMChangeStateEntry VMChangeStateEntry;
>   typedef struct VMStateDescription VMStateDescription;
>   typedef struct DumpState DumpState;
> +typedef struct GraphicHwOps GraphicHwOps;
> +typedef struct QEMUCursor QEMUCursor;
>   
>   /*
>    * Pointer types
> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> index 692bec91de..7d786653e8 100644
> --- a/hw/display/ati_2d.c
> +++ b/hw/display/ati_2d.c
> @@ -12,6 +12,7 @@
>   #include "ati_regs.h"
>   #include "qemu/log.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   
>   /*
>    * NOTE:
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 2577005d03..4cc3567c69 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -45,6 +45,7 @@
>   #include "ui/pixel_ops.h"
>   #include "cirrus_vga_internal.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   /*
>    * TODO:
> diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
> index 96144bd690..84be51670e 100644
> --- a/hw/display/cirrus_vga_isa.c
> +++ b/hw/display/cirrus_vga_isa.c
> @@ -31,6 +31,7 @@
>   #include "hw/isa/isa.h"
>   #include "cirrus_vga_internal.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISACirrusVGAState, ISA_CIRRUS_VGA)
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 46abbc5653..2a5437d803 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -32,6 +32,7 @@
>   #include "qemu/timer.h"
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
> +#include "ui/console.h"
>   #include "qom/object.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index 75dfcedea5..cd2c46776d 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -27,6 +27,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/display/vga.h"
>   #include "hw/qdev-properties.h"
> +#include "ui/console.h"
>   #include "vga_int.h"
>   
>   /*
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index 9a91de7ed1..df23dbf3a0 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -30,6 +30,7 @@
>   #include "migration/vmstate.h"
>   #include "vga_int.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   #include "qemu/module.h"
>   #include "qemu/timer.h"
>   #include "hw/loader.h"
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 50ecb1ad02..0cb26a791b 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -31,6 +31,7 @@
>   #include "vga_int.h"
>   #include "vga_regs.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   #include "qemu/timer.h"
>   #include "hw/xen/xen.h"
>   #include "migration/vmstate.h"
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index cedbbde522..53949d2539 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -33,6 +33,7 @@
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   #undef VERBOSE
>   #define HW_RECT_ACCEL


