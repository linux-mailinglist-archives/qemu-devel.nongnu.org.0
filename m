Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29839897E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:27:38 +0200 (CEST)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPyD-00019c-FC
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPwb-0008A7-TX
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPwa-00011A-4V
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orI2mfz/xyYk0Hga3CuMNy8vdWlBV3ihOX24VrQ1K58=;
 b=V2q7VcV37XuYvQ5tOXrLpQxFBlBfuD848EpgK07Mg8O2uJanE5jqzWf0mYo/GUfxSIhjDP
 D253/LMRMpUa3vcOv45aQwNkZ7OqtscUDZnelBsukHZ1XZIC/U5NlXfZ1qrmSPTD/ToS1P
 AmKhlgBcw+P5qGayxd+ojEqA4HgzAB0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-fGZEK3-sMpSVSDfsMfbw5Q-1; Wed, 02 Jun 2021 08:25:53 -0400
X-MC-Unique: fGZEK3-sMpSVSDfsMfbw5Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 z3-20020adfdf830000b02901198337bc39so367812wrl.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 05:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=orI2mfz/xyYk0Hga3CuMNy8vdWlBV3ihOX24VrQ1K58=;
 b=q9Z2sqRdwIbQAOwMZyblh9h46Uro6tgwZYNygqsNngThTatUTHY9RzPjA3RuJow6cU
 g3dAO/+nn+06sKseoSCFqfwHGcchSjo3Mw/zlJkcYyCFM2jUQ3S3ozRZALvI0/75JQhF
 xkHtb5c0WRGl8taTQJmyDb0nSUaJru6XoKYwdARQuWB1b9xMWQhHlOISyiMNHf2pib6D
 zzD0GQ8I0tnWcsetbz3mWKuLtENH7AMuLnat0YEvVvNQlRwqklnaAk3NQ4OUpIWLUrDP
 XqjiDjH0Su00w7MfVnsaBwkv1A6dhGAP+wxQjcdbjBmGHd6Cv5iroe9A80EPAkIVd16m
 MYKA==
X-Gm-Message-State: AOAM533dahwC0lLbFpnmQilZvi7eDgEP6TTPQSscVjtafbXYbATFmh+P
 FC5E/nHIyPi0o4MZuOwoeO3Ug05O3tLfTjLh2tagDkGFN2mZgq9jrStujOfW86ksMMDdLAnnKIE
 WDZMUff8MMr4c6RM=
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr18757215wmj.184.1622636752862; 
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJDOw1chhYGX2mxETg+EsGPUAoTroXSHXZEPThN56nY4li/6DFqmn2A2ZJu45Z7rsw+0wSdA==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr18757189wmj.184.1622636752661; 
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f20sm2955456wmh.41.2021.06.02.05.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:25:52 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/8] hw/arm/virt: Add a machine option to bypass iommu
 for primary bus
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
Message-ID: <b1f26e3a-d678-aa50-4e82-71c76c9775b8@redhat.com>
Date: Wed, 2 Jun 2021 14:25:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-4-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 5/25/21 5:50 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu option for arm virt machine,
> the option can be used in this manner:
> qemu -machine virt,iommu=smmuv3,bypass_iommu=true
This still looks confusing to me. On one hand we say that for the virt
machine the iommu is set to smmuv3 and we say bypass_iommu=true on the
virt machine option line
It is not straightforward that the bypass_iommu only relates to devices
plugged onto the "default" root bus.

At least the name of the property should reflect that I think

> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> ---
>  hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 840758666d..49d8a801ed 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1364,6 +1364,7 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  
>      pci = PCI_HOST_BRIDGE(dev);
> +    pci->bypass_iommu = vms->bypass_iommu;
>      vms->bus = pci->bus;
>      if (vms->bus) {
>          for (i = 0; i < nb_nics; i++) {
> @@ -2319,6 +2320,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>      }
>  }
>  
> +static bool virt_get_bypass_iommu(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->bypass_iommu;
> +}
> +
> +static void virt_set_bypass_iommu(Object *obj, bool value,
> +                                              Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->bypass_iommu = value;
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -2656,6 +2672,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set the IOMMU type. "
>                                            "Valid values are none and smmuv3");
>  
> +    object_class_property_add_bool(oc, "bypass_iommu",
> +                                   virt_get_bypass_iommu,
> +                                   virt_set_bypass_iommu);
> +    object_class_property_set_description(oc, "bypass_iommu",
> +                                          "Set on/off to enable/disable "
> +                                          "bypass_iommu for primary bus");
> +
>      object_class_property_add_bool(oc, "ras", virt_get_ras,
>                                     virt_set_ras);
>      object_class_property_set_description(oc, "ras",
> @@ -2723,6 +2746,9 @@ static void virt_instance_init(Object *obj)
>      /* Default disallows iommu instantiation */
>      vms->iommu = VIRT_IOMMU_NONE;
>  
> +    /* The primary bus is attached to iommu by default */
> +    vms->bypass_iommu = false;
I don't fully master the PCI topology but I think you should clarify
which primary bus we talk about. AFAIU PXB's bus also is a primary bus.

Thanks

Eric
> +
>      /* Default disallows RAS instantiation */
>      vms->ras = false;
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..82bceadb82 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -147,6 +147,7 @@ struct VirtMachineState {
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> +    bool bypass_iommu;
>      VirtMSIControllerType msi_controller;
>      uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;


