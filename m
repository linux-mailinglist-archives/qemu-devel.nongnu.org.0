Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBAF3E2909
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:03:16 +0200 (CEST)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxdD-0007wp-Cs
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxbL-0006uV-8U
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxbI-0003PN-2r
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628247674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM7aaQ+H+UnznKIzheDvdhRXYYG3kiJ/JMi0PZfg7S4=;
 b=NXGg6nbcKuKfoc0/8YA2OJu43YjWI0RxJebSyKNlNHpPEEQxCRWwgvuFZM0c62j9vS8PYq
 MlGFnBp5S5jFEWST3DzQgOz3/nhHJFpuPQn0OJ9FPCNnBrksxPsemDWk/r1pQDwgHW8OTO
 UiJ5LJf66QZEbY+x8DAawOxJxHlpiFI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-1MKPEReOPA686oC5mb5OGQ-1; Fri, 06 Aug 2021 07:01:13 -0400
X-MC-Unique: 1MKPEReOPA686oC5mb5OGQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so1730080wra.1
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qM7aaQ+H+UnznKIzheDvdhRXYYG3kiJ/JMi0PZfg7S4=;
 b=hxU6zDXvOEacudJ7x/u827UMmlDM34q7W9uFMHQdV5MouGjIVTtjjy/5AZIusM+Pnb
 AqOfOkeuAo/sp7z/+FASy78bWnfabp1moj/+Fc9lIYuCmAQX/TDAqo9mypLz9P7ZPMyp
 ScdTQ3k8Km0km/opp8v4BhSVZACaAQ5n53/8d8A5F5queS3r2IkgCr5Jor3l474BA86Q
 v1qdKER5+/QG6gwGiH5KqCQrBDVNFGHd8Y5FtDdYFGO+S8+s4Xbhnpe+Zr12mSp29QwU
 4azD9jGJXYp4+zMvreeO6BJnStF81lI21jPhfK2ts5q+4aWQMh0+GYVXnFqWkNMC49ex
 3vgw==
X-Gm-Message-State: AOAM531CFALTJk6K8lqsZq45oThweE8CRwUsTvdtj6xEOxno9CubNg+x
 /xb10o76V+ps5I8ORAsTLk9KtGabQYlfupQoD20ld5OxjhDi2svBHz2dE+k26pUX3slpma+/eOm
 KAPNPHVYRi6trytE=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr1992933wmj.4.1628247672117; 
 Fri, 06 Aug 2021 04:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmckNtDtK/HNjnDY+H/QYsDVGDIpKdEQa7fVP7yynUmbXZcjTcDPnUUZBH00HHi2WEiWU4fA==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr1992918wmj.4.1628247671965; 
 Fri, 06 Aug 2021 04:01:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e3sm9290662wrw.51.2021.08.06.04.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 04:01:11 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:01:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 6/6] Use PCI_HOST_BRIDGE macro
Message-ID: <20210806130110.73e6f40c@redhat.com>
In-Reply-To: <20210805193431.307761-7-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-7-ehabkost@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 15:34:31 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> OBJECT_CHECK(PciHostState, ..., TYPE_PCI_HOST_BRIDGE) is exactly
> what the PCI_HOST_BRIDGE macro does.  We can just use the macro
> instead of using OBJECT_CHECK manually.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/i386/acpi-build.c | 8 ++------
>  hw/pci-host/i440fx.c | 4 +---
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a33ac8b91e1..3c6bbb1beb3 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -303,13 +303,9 @@ Object *acpi_get_i386_pci_host(void)
>  {
>      PCIHostState *host;
>  
> -    host = OBJECT_CHECK(PCIHostState,
> -                        object_resolve_path("/machine/i440fx", NULL),
> -                        TYPE_PCI_HOST_BRIDGE);
> +    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
>      if (!host) {
> -        host = OBJECT_CHECK(PCIHostState,
> -                            object_resolve_path("/machine/q35", NULL),
> -                            TYPE_PCI_HOST_BRIDGE);
> +        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
>      }
>      return OBJECT(host);
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 28c9bae8994..cd87e21a9b2 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -316,9 +316,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>  
>  PCIBus *find_i440fx(void)
>  {
> -    PCIHostState *s = OBJECT_CHECK(PCIHostState,
> -                                   object_resolve_path("/machine/i440fx", NULL),
> -                                   TYPE_PCI_HOST_BRIDGE);
> +    PCIHostState *s = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
>      return s ? s->bus : NULL;
>  }
>  


