Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A453FC980
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4YU-0002xm-QC
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Vy-00082B-KF
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Vu-0003w7-IT
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630419200;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ovW5fHitiMIYH4UUPpgFL9EmaMHc3610w2r7eQLnok=;
 b=gLcptXAlQ48NDErCspuW7n6kqoWGN8BYYlAlgYbmzgHDmPCU6c5pXrKtU2JQ3cL7CFpvW6
 NSdcFmNIcMn+TqAI8anAASPB6hmcVVTQEIUG/1u/JuzUgekJKp8NYtnjuz1g5PEFGEfNeS
 N33bNjyMj/0EmqLy3KroGOUVP4Lb6f4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-xDDV-88EMU6ZDZeSawiaRA-1; Tue, 31 Aug 2021 10:13:19 -0400
X-MC-Unique: xDDV-88EMU6ZDZeSawiaRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so1320671wmc.1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+ovW5fHitiMIYH4UUPpgFL9EmaMHc3610w2r7eQLnok=;
 b=VD9vcXFt3++oVvtgmQPVi2gPnTWbFpuEk8EFCNIHGaBXaWTbECkfSDTewVTi+E9H0E
 UKiFCMcClsCDMWeeXJFHTxn5xAcpLnS3lIBDkp594qBcpOFHVMdY3ugmnQq22ob9Y0b/
 1re8U/EGgBDQSb0eTb+XOpLNybE1tILG7QA31S1o2ceIaYPXy5gELP4ouwstctNuHG7o
 qzP9xO4gxO5ym+k5+vuOy2pzTXCEMzTudmTwGzNmRIXHZBp/W747CTDLEZhOIaWoH+HD
 JSUvfAio2vM5GSaGSq5vVp7NXFN4ufriENVG0NrmKRC7uyAPg+OVGiR4W8RYnpFrYio3
 Pg+g==
X-Gm-Message-State: AOAM531InAOpP8+5BCT0Avn/4K79Z5zHuI0qAqGLaGD/GW8xjh6HkkX/
 OQTcYnfx4GHUvcH5Jfw5tHA3BBChtYiffMmN3icY4yZGoSjkPpNVQiiXzOzCoFt6fkz4nNbaxqU
 MsLKhPHE1NtpP8mQ=
X-Received: by 2002:a1c:f002:: with SMTP id a2mr4507897wmb.79.1630419198293;
 Tue, 31 Aug 2021 07:13:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWw9J6ggS5H6Q/oUbGJouni36I8XO0YuFYkRQV+S5m0ZSz5Qfc5b/aEsIEfbbE+sCOl5/egw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr4507865wmb.79.1630419198002;
 Tue, 31 Aug 2021 07:13:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r15sm2896581wmh.27.2021.08.31.07.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:13:17 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] hw/arm/virt: Update SMMU v3 creation to support
 non PCI/PCIe device connection
To: chunming <chunming_li1234@163.com>, peter.maydell@linaro.org
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-4-git-send-email-chunming_li1234@163.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <c98c4098-1553-51c0-8323-ad20626f9897@redhat.com>
Date: Tue, 31 Aug 2021 16:13:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1629878922-173270-4-git-send-email-chunming_li1234@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chunming,

On 8/25/21 10:08 AM, chunming wrote:
> From: chunming <chunming.li@verisilicon.com>
>
>   . Add "smmuv3_sidmap" to set non PCI/PCIe devices SID value
>   . Pass non PCI/PCIe devices SID value to SMMU v3 model creation
>   . Store SMMU v3 device in virtual machine then non PCI/PCIe can get its memory region later
>
> Signed-off-by: chunming <chunming.li@verisilicon.com>
> ---
>  hw/arm/virt.c         | 18 +++++++++++++++++-
>  include/hw/arm/virt.h |  2 ++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 81eda46b0b..c3fd30e071 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -204,6 +204,10 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("max"),
>  };
>  
> +static const uint16_t smmuv3_sidmap[] = {
> +
> +};
> +
>  static bool cpu_type_valid(const char *cpu)
>  {
>      int i;
> @@ -1223,7 +1227,7 @@ static void create_pcie_irq_map(const MachineState *ms,
>                             0x7           /* PCI irq */);
>  }
>  
> -static void create_smmu(const VirtMachineState *vms,
> +static void create_smmu(VirtMachineState *vms,
>                          PCIBus *bus)
>  {
>      char *node;
> @@ -1244,6 +1248,16 @@ static void create_smmu(const VirtMachineState *vms,
>  
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> +
> +    vms->smmuv3 = dev;
> +
> +    qdev_prop_set_uint32(dev, "len-sid-map", ARRAY_SIZE(smmuv3_sidmap));
> +
> +    for (i = 0; i < ARRAY_SIZE(smmuv3_sidmap); i++) {
> +        g_autofree char *propname = g_strdup_printf("sid-map[%d]", i);
> +        qdev_prop_set_uint16(dev, propname, smmuv3_sidmap[i]);
> +    }
> +
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> @@ -2762,6 +2776,8 @@ static void virt_instance_init(Object *obj)
>  
>      vms->irqmap = a15irqmap;
>  
> +    vms->sidmap = smmuv3_sidmap;
> +
>      virt_flash_create(vms);
>  
>      vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9661c46699..d3402a43dd 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -167,6 +167,8 @@ struct VirtMachineState {
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;
> +    DeviceState *smmuv3;
at this stage it is not obvious why you need the smmuv3 DeviceState in
the VirtMachineState (there is no user). You may squash this change in
subsequent patch instead

Thanks

Eric
> +    const uint16_t *sidmap;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)


