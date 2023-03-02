Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123AC6A8458
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkAA-0006wI-3a; Thu, 02 Mar 2023 09:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXkA7-0006vx-Ue
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXkA6-0006pJ-FF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677768241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2eKJJacejP9wXF+36LoJxQxXgDcyIduj+iFIB/0YPQ=;
 b=BufeM+GJyiQSurKsRAAXQmxXRBT6QqozHMn38R7IxZSXtgI5zNSiMa8dsZiFCWgvSwDn5P
 nRdCfMzoaxCyGhrCf4NGEax5mm4cZC4riesVADXlUqdeephKOXvaDsTXZnE6+mQ6shhxq3
 tqahisBrBlaIwNFcFTUTiLSWE3A6weU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-_NZQcmPVNze_8kMdYs6tLA-1; Thu, 02 Mar 2023 09:43:59 -0500
X-MC-Unique: _NZQcmPVNze_8kMdYs6tLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso1177616wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677768234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2eKJJacejP9wXF+36LoJxQxXgDcyIduj+iFIB/0YPQ=;
 b=tzhFf+LNWPr3qDFVL/KT+bFpj//lKpM4n4uVnmM9xXZiHU6HHZtaBXv2YPnC2NzJKn
 Neap+ODEmCJ/Rq6RfzDTeUK19I6B1louGrXNAqnf7+v0ICbYF+QFbfT24ZlpPV1d7UPI
 f8/sfSX0D+ph4KnKB25wGBALglOvqZpECfMI83QHJTTT+lxKnuHrERERWzEalEHXe79z
 guZj1Cs2eG+BBHFFqzQUpa2+AW9HdoGmQtQTZA59iLAuz3D49olYQRfU2BPxhs+VN0eh
 KKy+QlKXjgcfaCaz7mNMz91U5svFlKw/7fNheNaQ1/JtteLFQ4jShEq3zMgDX9uorqMc
 /D4w==
X-Gm-Message-State: AO0yUKURIxK2kMHQz6xJS578M6yOo3rMDBoDQNkABN4nxnWpVm6BNxTy
 QBLvN26Ic/glrxj3vTd0X4Ky/mmEXeEMTKo0qbBZeLecfEX2Ry/4qjIalV4k9p+cEZ5s1Jvu9Pj
 R4mo8tw+ZmomuZDI=
X-Received: by 2002:a5d:574d:0:b0:2c9:f488:5f54 with SMTP id
 q13-20020a5d574d000000b002c9f4885f54mr7425563wrw.57.1677768233889; 
 Thu, 02 Mar 2023 06:43:53 -0800 (PST)
X-Google-Smtp-Source: AK7set908BUsMOH2KMIxEcThQWEXjCxBX/BTYV2OgIwSeT/uVIa+ayBdwtn8g7+HSgSBi5dq+1UAMg==
X-Received: by 2002:a5d:574d:0:b0:2c9:f488:5f54 with SMTP id
 q13-20020a5d574d000000b002c9f4885f54mr7425542wrw.57.1677768233567; 
 Thu, 02 Mar 2023 06:43:53 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003eaf666cbe0sm3402780wmo.27.2023.03.02.06.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:43:51 -0800 (PST)
Date: Thu, 2 Mar 2023 15:43:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, Thomas
 Huth <thuth@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2 19/20] hw/i386/ich9: Clean up includes
Message-ID: <20230302154350.0327f0c1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230131115326.12454-20-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-20-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Tue, 31 Jan 2023 12:53:25 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

this lacks commit description explaining below movements

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/i386/ich9.h | 8 +++++---
>  hw/i386/acpi-build.c   | 1 +
>  hw/isa/lpc_ich9.c      | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
> index d29090a9b7..3125863049 100644
> --- a/include/hw/i386/ich9.h
> +++ b/include/hw/i386/ich9.h
> @@ -1,11 +1,13 @@
>  #ifndef HW_ICH9_H
>  #define HW_ICH9_H
>  
> -#include "hw/sysbus.h"
> -#include "hw/i386/pc.h"
>  #include "hw/isa/apm.h"
> -#include "hw/acpi/acpi.h"
>  #include "hw/acpi/ich9.h"
> +#include "hw/intc/ioapic.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_device.h"
> +#include "exec/memory.h"
> +#include "qemu/notify.h"
>  #include "qom/object.h"
>  
>  void ich9_generate_smi(void);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 127c4e2d50..266df7a153 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -59,6 +59,7 @@
>  #include "hw/acpi/pcihp.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/ich9.h"
> +#include "hw/i386/pc.h"
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci-host/i440fx.h"
>  #include "hw/pci-host/q35.h"
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 808c572ae4..f508f6071e 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -40,8 +40,8 @@
>  #include "hw/irq.h"
>  #include "hw/isa/apm.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_bridge.h"
>  #include "hw/i386/ich9.h"
> +#include "hw/i386/pc.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/ich9.h"
>  #include "hw/pci/pci_bus.h"


