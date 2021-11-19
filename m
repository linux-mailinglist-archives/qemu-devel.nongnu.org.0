Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23184457584
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:32:57 +0100 (CET)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7ku-0007Ow-0Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7TT-0002V4-GQ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:14:56 -0500
Received: from mail-bn1nam07on2063.outbound.protection.outlook.com
 ([40.107.212.63]:6619 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7TP-0007IQ-CL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:14:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jekU2WFUm1SncDWtbS78VwAXnp2c9x1JM/ECp/hGWGc1TqvUzWBdN9anVD3tCsZhy0zJ3qoDGfjYjS9WGlTjS+8/lygzj9frEJsH6AF8qEnj5/o1SH+XsGpt6Be9uvSuOccC1ZWlGX+X/fRJApUL2tmfUKM0h4MCU1mKhh1uLOH6yjD5oemVoeusul+v4TOZJkTTK8gQ0FbGeFdXlsmnXuTE/37+kP5NlsNx+mGW9eD52NNbtMH09A2mmpXPdgWRiT57D0xaixnKAY/j93QP3Vrk1pS/TyHWVW9aPkJsjWTFD8XsS4SnNELNsSPFG7geHf9t1aa9ETVRpM1rdPg/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZPFlR567dY4pwIPDy5VY+DNoN3vsz2kE7/ZAqDHUAo=;
 b=haD0l76VA8ued9OyBjt/0YKi438Jp8xkfL3fPg5B6wTQqMV2fSbTfnHmgqY/V2GAlJufqo7z08tW74Vl2fTWO5PaTXqxpTngYPhGFO7s8gAJlpqSBuSZJQz+XTFKEk8vQaU7ghfNYu5dic9zO7gjWJ2TFJ42tY6CcF90tZKHEWepEkrSQrzbN7IjGWToE5spZ8/IhoEGwBMWlPpZlaeBecRTflv3jRZogjyTVzB2jTZYhdxNox7TCeFr2h0R9Ux90FysR1NJX+IWTW33whecNkNR5leG4LN7GsBn8lrxy9elQHckphguWfheAy5GO4u8D4rxUBswwpSqGe6Qq5WWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZPFlR567dY4pwIPDy5VY+DNoN3vsz2kE7/ZAqDHUAo=;
 b=nDkXJSn0PccmbBH9bzE9kszf5ZxPURppm0Sm05ZT3W/g4c6hKOc8VetGxTdrNn9K327CXE35rqbSCt0Bg+00kfv9hf3Ky3SGcXLjqNaATwCZS28yFDX2+wAYIqI8snN6ciDxJBAwy/Cj0cmeR4QL5fa2Wt7IADVpU9S6Q9mTiOU=
Received: from BN6PR18CA0009.namprd18.prod.outlook.com (2603:10b6:404:121::19)
 by CY4PR02MB2646.namprd02.prod.outlook.com (2603:10b6:903:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 17:14:49 +0000
Received: from BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::65) by BN6PR18CA0009.outlook.office365.com
 (2603:10b6:404:121::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 17:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT029.mail.protection.outlook.com (10.13.2.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 17:14:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 09:14:46 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 09:14:46 -0800
Received: from [10.71.118.100] (port=62034 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7TJ-000Cxb-Q9; Fri, 19 Nov 2021 09:14:46 -0800
Date: Fri, 19 Nov 2021 18:14:44 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 7/9] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Message-ID: <20211119171436.GG2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-8-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-8-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e21c8e-49dc-40a6-3432-08d9ab80177d
X-MS-TrafficTypeDiagnostic: CY4PR02MB2646:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2646DCEDADAD6DF94568F03BC29C9@CY4PR02MB2646.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qUKEBt9liL/dqyyHu+j1wsLgdTF0hfMBi6vRxLzP9WYh3c3DCz6LlW3+Ykrf6Tjig8Im328tbLQt6HltGzCO/AdwpQKIUa2dWlWC8ZYhKykLZIH823SKPqn14sr+GCOibeBMiBnnrTTrPGrEIPzDp6R9+L79avH+IYdMP5NG5ejrEjWq06n4W67V5hxUYA2rn9tvKfGir3AVfiDrpH5ImyGbIfgSr4Gnev1pLVPUSkywP1x0nb9I/EM+KMd+99MB4gX0y7CfOoIo7UjTIMqMOCCgTPzWK5eauxVez2U8tYbZhSlGWJYHVN4dJGAKx7kYiG3ettxy4KLob2OzI+VUi8NUq0HRdbQPuF2z78jf1jd50Qe8XarIyrnD77kqOOK55QKBS/4Alx4F9Qr7uP41e/58ABLzJdgq3spx//bcPAvnBeq5zirUtZoSP6hxNJA6aZ6AnAC5YOM4HOyPpBybGBvyOo5Evmnr3AeMpn8579FEOn//LPHZPFD92ltg92lPaILIvgoRUk6Z7A5uk+wP+e1EiBCnWTKXQ0nARmWAoQhz95w4kbF/Sa1LzKWqR6hLYBXMMOA5vTmecjxxbGdQQqv4Yh+8f/QvglRZ6PEJkMVs9soVSrfnihgNAE7EA1dfcZtDTX1kGg+qEHisiE9sNPo5o4xytAAKQAn7ER8bWUGMP0t5et1c1Sdvg+hnETR6IdzYiykn4bj7HrQEWmNngA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(46966006)(36840700001)(36906005)(26005)(8936002)(70206006)(8676002)(70586007)(2906002)(508600001)(9686003)(6862004)(336012)(33656002)(82310400003)(6636002)(426003)(36860700001)(9786002)(1076003)(4326008)(7636003)(47076005)(5660300002)(316002)(186003)(356005)(33716001)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 17:14:48.6471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e21c8e-49dc-40a6-3432-08d9ab80177d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2646
Received-SPF: pass client-ip=40.107.212.63; envelope-from=edgar@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 17, 2021 at 02:18:39PM +0000, Francisco Iglesias wrote:
> Connect the OSPI flash memory controller model (including the source and
> destination DMA).
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 18 +++++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 08e250945f..f8e94a50fd 100644
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
> @@ -385,6 +386,93 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
>  }
>  
> +static void versal_create_ospi(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +    MemoryRegion *mr_dac;
> +
> +    memory_region_init(&s->pmc.iou.lospi_mr, OBJECT(s),
> +                       "versal-lospi_mr" , MM_PMC_OSPI_DAC_SIZE);
> +
> +    object_initialize_child(OBJECT(s), "versal-ospi", &s->pmc.iou.ospi,
> +                            TYPE_XILINX_VERSAL_OSPI);
> +
> +    mr_dac = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pmc.iou.ospi), 1);
> +    memory_region_add_subregion(&s->pmc.iou.lospi_mr, 0x0, mr_dac);
> +
> +    /* Create the OSPI destination DMA */
> +    object_initialize_child(OBJECT(s), "versal-ospi-dma-dst",
> +                            &s->pmc.iou.ospi_dma_dst,
> +                            TYPE_XLNX_CSU_DMA);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_dst),
> +                            "dma", OBJECT(get_system_memory()),
> +                             &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_dst);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_DST,
> +        sysbus_mmio_get_region(sbd, 0));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(sbd), 0, pic[VERSAL_OSPI_IRQ]);
> +
> +    /* Create the OSPI source DMA */
> +    object_initialize_child(OBJECT(s), "versal-ospi-dma-src",
> +                            &s->pmc.iou.ospi_dma_src,
> +                            TYPE_XLNX_CSU_DMA);
> +
> +    object_property_set_bool(OBJECT(&s->pmc.iou.ospi_dma_src), "is-dst",
> +                             false, &error_abort);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_src),
> +                            "dma", OBJECT(mr_dac), &error_abort);
> +
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_src),
> +                            "stream-connected-dma",
> +                             OBJECT(&s->pmc.iou.ospi_dma_dst),
> +                             &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_src);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_SRC,
> +        sysbus_mmio_get_region(sbd, 0));
> +
> +    /* Create the OSPI */
> +    object_property_set_link(OBJECT(&s->pmc.iou.ospi), "dma-src",
> +                             OBJECT(&s->pmc.iou.ospi_dma_src), &error_abort);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI,
> +        sysbus_mmio_get_region(sbd, 0));
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DAC,
> +                                &s->pmc.iou.lospi_mr);
> +
> +    /* ospi_mux_sel */
> +    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.slcr), 3,
> +                          qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi), 0));
> +
> +    /* OSPI irq */
> +    object_initialize_child(OBJECT(s), "ospi-irq",
> +                            &s->pmc.iou.ospi_irq, TYPE_OR_IRQ);
> +    object_property_set_int(OBJECT(&s->pmc.iou.ospi_irq),
> +                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
> +    qdev_realize(DEVICE(&s->pmc.iou.ospi_irq), NULL, &error_fatal);
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_src), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 1));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_dst), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 2));
> +
> +    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.ospi_irq), 0,
> +                          pic[VERSAL_OSPI_IRQ]);
> +}
>  
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
> @@ -477,6 +565,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_bbram(s, pic);
>      versal_create_efuse(s, pic);
>      versal_create_pmc_iou_slcr(s, pic);
> +    versal_create_ospi(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 729c093dfc..dae15db352 100644
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
> @@ -80,6 +82,12 @@ struct Versal {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
>              XlnxVersalPmcIouSlcr slcr;
> +
> +            XlnxVersalOspi ospi;
> +            XlnxCSUDMA ospi_dma_src;
> +            XlnxCSUDMA ospi_dma_dst;
> +            MemoryRegion lospi_mr;
> +            qemu_or_irq ospi_irq;


I wonder if we should do something like?

struct {
    XlnxVersalOspi ospi;
    XlnxCSUDMA dma_src;
    XlnxCSUDMA dma_dst;
    MemoryRegion linear_mr;
    qemu_or_irq irq;
} ospi;


But either way is OK with me:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


