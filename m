Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966774292FE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:17:30 +0200 (CEST)
Received: from localhost ([::1]:49770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZx3R-0003cb-7O
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZx27-0002bS-TD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZx22-0005jB-Jh
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633965361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2OpKnDLnAJno+Zesxx72oqTPwWxOzALKGR8YQeCyPI=;
 b=PYYktpayBy3q5u+KzMuQvwgm3vp1eAEM99Lx0aPVWlP9URIYWj4lS9DXih5FBuKCoP4pjM
 v9n8Evjz0hW4zNYjElYcrufgmVdkg66C+alcWt4j2SFUt/4P10w2U5i3OEvBFcRqzmhQ45
 ioO0tuzz/4XpbqZMyvEXDq2eHJZMno0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-ix89izV3MWaoXP1ZF8fRZQ-1; Mon, 11 Oct 2021 11:15:59 -0400
X-MC-Unique: ix89izV3MWaoXP1ZF8fRZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so7850381eda.23
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2OpKnDLnAJno+Zesxx72oqTPwWxOzALKGR8YQeCyPI=;
 b=qypdrIRIt3Qx356MCXeFPGkHeuP9AO3oTPLanR3it7Eprjgbmvf4zS8ycBsKrfo/oO
 hsA7hvV+BzS6hcNd4OXAneGKbYbTR6SBP9hzTZXxr4Ad0yVjKBx5XO6HLrnd33GS1q31
 eMzB4vRajaBquAzTjHsxfEH2IfLSmo2QpEuWFkTPRcu3+oHw3qWk5BAkDwTa0n+YBqnk
 x+Q12Sz5nOAG003h1dJA/FXF3JboJUIIcPBdh63DCjwNrsNyKPpuYQ5nvVbAc7NRdQsR
 aaQL+WtZ2Yr36I1/uKLnuKndQTDyMpzSRoB77ut2GxVciqF6R4vq+aqfsX+uCpFNjS5+
 WmRA==
X-Gm-Message-State: AOAM532z2mnJXW4vQav9sSQh6XDVR1XFfaL3qJ1CuvVX4ATnF1/IySld
 aGfoiBp+fZOFmIoftWVHFYCZmY+ty/SpL4kTqWRIRojXHlG/16zgf3iaY0E17WwwooUK5t1UL4G
 2wVYsh8ID0+SbTPI=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr5415327edf.27.1633965358803; 
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYOX24QESeSgaZqA11iMQh5iDaGXJjyj2hR5nh7lzCIHp+M/51/nHoeJOoIieIlTI/DX/P5w==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr5415283edf.27.1633965358563; 
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u19sm4429423edv.40.2021.10.11.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
Date: Mon, 11 Oct 2021 17:15:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot
 config DSM #5
Message-ID: <20211011171557.416c1fc6@redhat.com>
In-Reply-To: <20211005085313.493858-2-eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
 <20211005085313.493858-2-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 jean-philippe@linaro.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 Oct 2021 10:53:12 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a 'preserve_config' field in struct GPEXConfig and
> if set generate the DSM #5 for preserving PCI boot configurations.
> The DSM presence is needed to expose RMRs.

here should be pointers to spec and location within it
where it says preserving PCI boot configuration is necessary
or in absence of that a bit more detailed explanation
why it's necessary.

> 
> At the moment the DSM generation is not yet enabled.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/pci-host/gpex.h |  1 +
>  hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index fcf8b63820..3f8f8ec38d 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -64,6 +64,7 @@ struct GPEXConfig {
>      MemMapEntry pio;
>      int         irq;
>      PCIBus      *bus;
> +    bool        preserve_config;
s/^^^/preserve_fw_config/

>  };
>  
>  int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index e7e162a00a..7dab259379 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
>              }
>  


> +            if (cfg->preserve_config) {
> +                method = aml_method("_DSM", 5, AML_SERIALIZED);
> +                aml_append(method, aml_return(aml_int(0)));
> +                aml_append(dev, method);
> +            }
> +
>              acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>  
>              /*
> @@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> +    if (cfg->preserve_config) {
> +        method = aml_method("_DSM", 5, AML_SERIALIZED);
> +        aml_append(method, aml_return(aml_int(0)));
> +        aml_append(dev, method);
> +    }
> +


these ones seem to wrong ,
it adds duplicate _DSM methods with wrong ARGs number.

virt board already has _DSM defined, see

  acpi_dsdt_add_pci_osc()
    E5C937D0-3553-4D7A-9117-EA4D19C3434D

you need to modify that one (and possibly move out DSM into a separate function),
also preserving config might regress what commit 40c3472a29c9a was fixing.


>      acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>  
>      method = aml_method("_CBA", 0, AML_NOTSERIALIZED);


