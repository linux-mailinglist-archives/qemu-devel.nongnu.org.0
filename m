Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B545A0E9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:07:55 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTeU-00055z-4e
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTdc-0004Qn-61
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:07:00 -0500
Received: from mail-sn1anam02on2040.outbound.protection.outlook.com
 ([40.107.96.40]:64960 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTdZ-0004fK-CC
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:06:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9vg64LM0DsbbFicjNCNuVLDJ7N9o+YyPLBAbhCa2G4GsfjcvPUx79b5yhfCQDUzOVsrwp4rlJioOYtgPwmspgcirpDXPA7W6/OFizh40S0oaugWn20LC4rIALBQDss7j9NpqzYtWeP/oa//Ih+8kuk6LQAnXwutnd9A27Q3tHMG9OUTMGhptO+V8qXd9aKhOesBCfD40tfPDOk0In2ydizluyf7JCkW8CJQ7kXm15z/7qm7KNflfh6FNhnIJIx9F+BvyDQ93o23jeWza9xelyDlXkMgJs3BAmuuGLQaYHHKi2SLvd2gTrZBGekFZfKLQExs2gx3/jl5dEJ/+hGFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NPw3o2R1Jvbsm7p4TjYAgknqsG3DdbMln8ROUR6Gwg=;
 b=JOkbrwSVZlpJDG/X7pxk87hVoLxCOJVITUI0G4OViMF6NaG9yGEu+kAkDXJU9+/g49IN+mf/X4J5Pb9Dcqt4/qPOZRNkkFPalyp8W1LOmECE2wV1s6a/C40ty10YgdHMZsnJsGRyd4I+skUcHlTtZZtAq4fVI+hMjcGlKnGOx3K44qDW3EFS7mVK4nXhTmUQDcNFhVq7LBe/Lt14kL6xba1iREAU1gMenQFf6gzi6GL2r/msOG6YSdBvZJSpsUdZipw9YPHIMuA9WDoliyxVpI4qJexjwxgqVdcHHhJ4R/XoWHI/ABeFdmsPHrGF5VL/ZfuCVOgNbgRX2tohTYZpHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NPw3o2R1Jvbsm7p4TjYAgknqsG3DdbMln8ROUR6Gwg=;
 b=WTgmkqKc6UxaHKuvaBW/3sqUj0KubRTf5uQBZgv57ps8qrZY5IHV227QELZkOQzmZh/MUW9Q5VztUe7KYbVKamlCED9oypuCEJ9eKSeqfTJOUceuxP1PxV+VdEXva+m5pAr/KRpeuIeNi/PJlrIFYUUoN3NaKzK8idrmhl3FBP0=
Received: from SN1PR12CA0114.namprd12.prod.outlook.com (2603:10b6:802:21::49)
 by SA1PR02MB8445.namprd02.prod.outlook.com (2603:10b6:806:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 10:45:43 +0000
Received: from SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::38) by SN1PR12CA0114.outlook.office365.com
 (2603:10b6:802:21::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 10:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0047.mail.protection.outlook.com (10.97.5.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:45:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:45:42 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:45:42 -0800
Received: from [10.71.117.214] (port=55004 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mpTIz-0002Tm-O0; Tue, 23 Nov 2021 02:45:42 -0800
Date: Tue, 23 Nov 2021 11:45:40 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v2 07/10] hw/arm/xlnx-versal: Connect the OSPI flash
 memory controller model
Message-ID: <20211123104540.GB5816@toto>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-8-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211123103428.8765-8-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a135504b-36bb-40a9-b7e9-08d9ae6e65dc
X-MS-TrafficTypeDiagnostic: SA1PR02MB8445:
X-Microsoft-Antispam-PRVS: <SA1PR02MB8445B3AECC30967E232F8BB2C2609@SA1PR02MB8445.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwRXVkoP840I3Ign/VkywJn6Iqn3vAIDco4bF66KYN9jqPgTmOzYYP+59gpUBWCztg644/79znL++zSibGjhL5P5LbhuTn8iiCb7PAbjVSdKt06cCy6vwc5cIxYwwAPoEuAOfWEhICnPfTemAQ19F0NuMC3bN6tZOx1kZ93/caaJi2pCa0i3wR9uVN4kMipzV6Wo+SKnUCYZH2iqwjZyC/TdTGKsDWxs8u+4xdXDbccrCn27gO2Q2v1XduCMygWKFKOgXgsAs1ytzys8UXZgQVD0i1s7gjGJ7JKIthLYbPwnFinpOkOvkRknR3a2kMb1NJVhy9lAFg9sfTO6fTztHdnRk38OdAzmTJeJ01y4IM4noBxLHrpnz/v3eyu1xEY/QqtI7e8LI16Y2axIZME31KHw08vaoxtPOeaAIVF6hNCM4rc4Mo+3gZEgQVUwH89GtdVG06IVO1kDLhMh5H879nhhNYeQdpS6Y06Mqb+PAjXm5LxBZlhc/HlTP4o1AVYUenwgsgjK4CVwRcQv4upoUSKHvfIGFNFJuczB9XO1AqQMYBvCPMevwPcybTNDofRtxOiyTCehYV8rtLfqsUc0mDvIdcGe/EaIUFGk/MAKohffpXxWlBc+LsPAz0DCnSc6xUmAAFd9WO1kmDBqnJyEiwxZQe9hn1p/7G6vcHi8tgTPkl0r7ftcR9IozWNNN6+iPUm5XAr0vC5CL1jqP25xTw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(36860700001)(70206006)(54906003)(6636002)(9786002)(36906005)(9686003)(7636003)(47076005)(6862004)(8936002)(2906002)(4326008)(508600001)(426003)(186003)(1076003)(8676002)(33716001)(5660300002)(316002)(336012)(26005)(356005)(82310400004)(33656002)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:45:42.7425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a135504b-36bb-40a9-b7e9-08d9ae6e65dc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8445
Received-SPF: pass client-ip=40.107.96.40; envelope-from=edgar@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, frasse.iglesias@gmail.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 10:34:25AM +0000, Francisco Iglesias wrote:
> Connect the OSPI flash memory controller model (including the source and
> destination DMA).


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 20 ++++++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 08e250945f..20c82bff01 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -24,6 +24,7 @@
>  
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
> +#define NUM_OSPI_IRQ_LINES 3
>  
>  static void versal_create_apu_cpus(Versal *s)
>  {
> @@ -385,6 +386,91 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
>  }
>  
> +static void versal_create_ospi(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +    MemoryRegion *mr_dac;
> +
> +    memory_region_init(&s->pmc.iou.ospi.linear_mr, OBJECT(s),
> +                       "versal-ospi-linear-mr" , MM_PMC_OSPI_DAC_SIZE);
> +
> +    object_initialize_child(OBJECT(s), "versal-ospi", &s->pmc.iou.ospi.ospi,
> +                            TYPE_XILINX_VERSAL_OSPI);
> +
> +    mr_dac = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 1);
> +    memory_region_add_subregion(&s->pmc.iou.ospi.linear_mr, 0x0, mr_dac);
> +
> +    /* Create the OSPI destination DMA */
> +    object_initialize_child(OBJECT(s), "versal-ospi-dma-dst",
> +                            &s->pmc.iou.ospi.dma_dst,
> +                            TYPE_XLNX_CSU_DMA);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_dst),
> +                            "dma", OBJECT(get_system_memory()),
> +                             &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_DST,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
> +    /* Create the OSPI source DMA */
> +    object_initialize_child(OBJECT(s), "versal-ospi-dma-src",
> +                            &s->pmc.iou.ospi.dma_src,
> +                            TYPE_XLNX_CSU_DMA);
> +
> +    object_property_set_bool(OBJECT(&s->pmc.iou.ospi.dma_src), "is-dst",
> +                             false, &error_abort);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
> +                            "dma", OBJECT(mr_dac), &error_abort);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
> +                            "stream-connected-dma",
> +                             OBJECT(&s->pmc.iou.ospi.dma_dst),
> +                             &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_SRC,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
> +    /* Realize the OSPI */
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi.ospi), "dma-src",
> +                             OBJECT(&s->pmc.iou.ospi.dma_src), &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DAC,
> +                                &s->pmc.iou.ospi.linear_mr);
> +
> +    /* ospi_mux_sel */
> +    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.slcr), 3,
> +                          qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.ospi), 0));
> +
> +    /* OSPI irq */
> +    object_initialize_child(OBJECT(s), "ospi-irq",
> +                            &s->pmc.iou.ospi.irq, TYPE_OR_IRQ);
> +    object_property_set_int(OBJECT(&s->pmc.iou.ospi.irq),
> +                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
> +    qdev_realize(DEVICE(&s->pmc.iou.ospi.irq), NULL, &error_fatal);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 1));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 2));
> +
> +    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.ospi.irq), 0,
> +                          pic[VERSAL_OSPI_IRQ]);
> +}
>  
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
> @@ -477,6 +563,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_bbram(s, pic);
>      versal_create_efuse(s, pic);
>      versal_create_pmc_iou_slcr(s, pic);
> +    versal_create_ospi(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 729c093dfc..d5c9c3900b 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -26,6 +26,8 @@
>  #include "hw/misc/xlnx-versal-xramc.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-versal-efuse.h"
> +#include "hw/ssi/xlnx-versal-ospi.h"
> +#include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
> @@ -80,6 +82,14 @@ struct Versal {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
>              XlnxVersalPmcIouSlcr slcr;
> +
> +            struct {
> +                XlnxVersalOspi ospi;
> +                XlnxCSUDMA dma_src;
> +                XlnxCSUDMA dma_dst;
> +                MemoryRegion linear_mr;
> +                qemu_or_irq irq;
> +            } ospi;
>          } iou;
>  
>          XlnxZynqMPRTC rtc;
> @@ -116,6 +126,7 @@ struct Versal {
>  #define VERSAL_BBRAM_APB_IRQ_0     121
>  #define VERSAL_RTC_APB_ERR_IRQ     121
>  #define VERSAL_PMC_IOU_SLCR_IRQ    121
> +#define VERSAL_OSPI_IRQ            124
>  #define VERSAL_SD0_IRQ_0           126
>  #define VERSAL_EFUSE_IRQ           139
>  #define VERSAL_RTC_ALARM_IRQ       142
> @@ -184,6 +195,15 @@ struct Versal {
>  #define MM_PMC_PMC_IOU_SLCR         0xf1060000
>  #define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
>  
> +#define MM_PMC_OSPI                 0xf1010000
> +#define MM_PMC_OSPI_SIZE            0x10000
> +
> +#define MM_PMC_OSPI_DAC             0xc0000000
> +#define MM_PMC_OSPI_DAC_SIZE        0x20000000
> +
> +#define MM_PMC_OSPI_DMA_DST         0xf1011800
> +#define MM_PMC_OSPI_DMA_SRC         0xf1011000
> +
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_BBRAM_CTRL           0xf11f0000
> -- 
> 2.11.0
> 

