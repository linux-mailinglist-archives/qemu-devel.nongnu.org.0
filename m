Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DBF617AA9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXDW-0002Q7-MD; Thu, 03 Nov 2022 06:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oqXDU-0002Py-Da
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oqXDS-0001SG-SE
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667470374;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEg9zF/vGvXXz6wIbjIU9pMd54nmTK+K0RBmRm7neXY=;
 b=hnR1tAKlcoDV18uLx+60gSjSzS0L++c8WRf6mg7bqO1c5YGVi2L0hqEgyc02qqONx+MMxy
 QxP288bHbM6gmpa2944ApkOSGQY0s0AYy9LtKBKnUpneCoEU8P3PzV8oFQSrCCmX1Op2iL
 /gcsa3osE/DDr5vsr2xpk0xPzOC56hs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-lWUswIubMQyHogLDBWfulQ-1; Thu, 03 Nov 2022 06:12:53 -0400
X-MC-Unique: lWUswIubMQyHogLDBWfulQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so333256wru.9
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 03:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEg9zF/vGvXXz6wIbjIU9pMd54nmTK+K0RBmRm7neXY=;
 b=fRMlmLn1PvoQpzxmAJ7lF735riA8qSGyFCYhw5k0XfMBvkxmzZ+j9fNbByU/Bzaq1J
 2aH7UsKKLoV3p28lWp+vA3++wg/I6tTHArrCH7XJ7cZ//mcBD9MdBdws89Y1aLaKGxvy
 uELl+BMhg4IK6R/wKCIQ+OfriGLjsDGtGncc3Gd+097kv6SjB6lb6I8+7TzPrTCN9wrX
 nWMfNXLbOAb/Thx2KAuUGH7jov1Bn/j1Ed1vZVC4goso82PHZNSKNUR0kCRlcFaFQEov
 x29ZCq2szziZggwEX680ppMSxe9c2Rq9A3uWwLbSX0jEyLaXi6mI7X7r9cWbgpE/2cOZ
 YPjQ==
X-Gm-Message-State: ACrzQf0qtcN5d5h1azzt4Gj5tUn97/+diAjuZK0KomtPIGILhqwxBFWR
 XwsBYnVWWMM0GJGIHN2F79JNYhXlI2s+k8QIurpW4FCFr+ozJWKL3dAHZDG+FYwoJEuGEbT92dk
 IgoUBY+lQ6BxaZdg=
X-Received: by 2002:a05:600c:5d3:b0:3cf:6bbf:9ee3 with SMTP id
 p19-20020a05600c05d300b003cf6bbf9ee3mr15060627wmd.15.1667470367217; 
 Thu, 03 Nov 2022 03:12:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wuWx4FN/PNSUuqh/YJQsIlQOiALEk5F3hHypuiJziUj8uLItHsEWUrjdcF/5qv79iugb3Ew==
X-Received: by 2002:a05:600c:5d3:b0:3cf:6bbf:9ee3 with SMTP id
 p19-20020a05600c05d300b003cf6bbf9ee3mr15060590wmd.15.1667470366812; 
 Thu, 03 Nov 2022 03:12:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a05600c1c0200b003c6c3fb3cf6sm971024wms.18.2022.11.03.03.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 03:12:46 -0700 (PDT)
Message-ID: <fc877215-61dc-8c9a-fb0e-5ffa000cef07@redhat.com>
Date: Thu, 3 Nov 2022 11:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high memory
 regions
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20221029224307.138822-1-gshan@redhat.com>
 <20221029224307.138822-8-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221029224307.138822-8-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Gavin,
On 10/30/22 00:43, Gavin Shan wrote:
> The 3 high memory regions are usually enabled by default, but they may
> be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
> This leads to waste in the PA space.
>
> Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
> allow users selectively disable them if needed. After that, the high
> memory region for GICv3 or GICv4 redistributor can be disabled by user,
> the number of maximal supported CPUs needs to be calculated based on
> 'vms->highmem_redists'. The follow-up error message is also improved
> to indicate if the high memory region for GICv3 and GICv4 has been
> enabled or not.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  docs/system/arm/virt.rst | 13 +++++++
>  hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 4454706392..188a4f211f 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -98,6 +98,19 @@ compact-highmem
>    Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>    The default is ``on`` for machine types later than ``virt-7.2``.
>  
> +highmem-redists
> +  Set ``on``/``off`` to enable/disable the high memory region for GICv3 or
> +  GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
> +  limit the maximum number of CPUs when GICv3 or GICv4 is used.
> +
> +highmem-ecam
> +  Set ``on``/``off`` to enable/disable the high memory region for PCI ECAM.
> +  The default is ``on`` for machine types later than ``virt-3.0``.
> +
> +highmem-mmio
> +  Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
> +  The default is ``on``.
> +
>  gic-version
>    Specify the version of the Generic Interrupt Controller (GIC) to provide.
>    Valid values are:
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 020a95cfa2..65cff7add1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2095,14 +2095,20 @@ static void machvirt_init(MachineState *machine)
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
>          virt_max_cpus = GIC_NCPU;
>      } else {
> -        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
> -            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> +        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
> +        if (vms->highmem_redists) {
> +            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
> +        }
>      }
>  
>      if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                       "supported by machine 'mach-virt' (%d)",
>                       max_cpus, virt_max_cpus);
> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
> +            error_printf("Try 'highmem-redists=on' for more CPUs\n");
> +        }
> +
>          exit(1);
>      }
>  
> @@ -2371,6 +2377,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
>      vms->highmem_compact = value;
>  }
>  
> +static bool virt_get_highmem_redists(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_redists;
> +}
> +
> +static void virt_set_highmem_redists(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_redists = value;
> +}
> +
> +static bool virt_get_highmem_ecam(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_ecam;
> +}
> +
> +static void virt_set_highmem_ecam(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_ecam = value;
> +}
> +
> +static bool virt_get_highmem_mmio(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->highmem_mmio;
> +}
> +
> +static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->highmem_mmio = value;
> +}
> +
> +
>  static bool virt_get_its(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2996,6 +3045,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set on/off to enable/disable compact "
>                                            "layout for high memory regions");
>  
> +    object_class_property_add_bool(oc, "highmem-redists",
> +                                   virt_get_highmem_redists,
> +                                   virt_set_highmem_redists);
> +    object_class_property_set_description(oc, "highmem-redists",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for GICv3 or GICv4 "
> +                                          "redistributor");
> +
> +    object_class_property_add_bool(oc, "highmem-ecam",
> +                                   virt_get_highmem_ecam,
> +                                   virt_set_highmem_ecam);
> +    object_class_property_set_description(oc, "highmem-ecam",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for PCI ECAM");
> +
> +    object_class_property_add_bool(oc, "highmem-mmio",
> +                                   virt_get_highmem_mmio,
> +                                   virt_set_highmem_mmio);
> +    object_class_property_set_description(oc, "highmem-mmio",
> +                                          "Set on/off to enable/disable high "
> +                                          "memory region for PCI MMIO");
> +
>      object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
>                                    virt_set_gic_version);
>      object_class_property_set_description(oc, "gic-version",


