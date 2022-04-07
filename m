Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C24F7BC9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:37:36 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOa6-00051L-Qn
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOOP-00047G-59; Thu, 07 Apr 2022 05:25:34 -0400
Received: from mail-bn8nam11on20629.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::629]:3937
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOON-00079W-8V; Thu, 07 Apr 2022 05:25:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIKreKMtCJb79dZzo4cwu8mtn/v3Z86OkqIv59Aya6/xLES/HNpoFS9KBsJPxiSTLJbNUrhHv1ouZzV5zhNaxbK64ZUVHIimSSRbF71z0Y8/f85zRrlyKkbgDcCqkicZuiRzgNP1paV7aomoBqyyG/7GRye4U2i9a2XXB9yn0loNtXqqbVmgZVUnarJdXItERAdG2OAU31AYNo7i91raDd7hP4k/d3Z4+mxF3w8QNyIO38EUG5SRGQIhf8q/vR5Tz2r3BZyM/D+XeCUYu+HUs9btRvTvEDxEqYBqYgZdetK7oZsM2MZ4+XFX7Ck6uVVW5ELG0OeloYQ1qUem7PZ3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytzfAAvFMb1UZJEnFhJQLNzibFhyIDAEH8/P9iU2tbo=;
 b=Bv8ckHFBx2/MndQRm9pWvhm4CL2xtwCaBvKpRsnMIf51aNttkeBdUeXe/sD0ogxckiubafVTXz3ZWdOcrMbh3zR9ey6DlLB+2bYOPidWAAqzqgXslT3jBiVF7XE4/XbiaWQEg+rvplz38QtVEJXrd45zXv24Sd9+OjylF4GaPGLY2Q9y6sMT7XdfzcN+eC0AUSZTOyR3Gr/Dc1xBlrSPvxQaEX8r3jS5UfP27C3ug1PzKslo2WgUygtkckANX9LSmJzKSVT5rVDmFGYYnEsbrLigFTKxtBL8bz3t3T/FWtEMR/0FkZCRw+V70myJ9hWP0tCTY2DvMvfLHI3XOGubOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzfAAvFMb1UZJEnFhJQLNzibFhyIDAEH8/P9iU2tbo=;
 b=W1Q8ZkoQnSRRZ5bDZNxc802b7l8y7OavY46UxYfCryOvhkDX36zlw59VZlFgEpYl9aW843Xp8yiYgxf+mJeb/SULF3PHGX5BDoxhSiqSVNgpemo7mda9Z/8tY1K6B1ubhSuHjQVS87vjtf3SoXZzTajJe4wOcGd3xxSCj/qT258=
Received: from DM6PR18CA0004.namprd18.prod.outlook.com (2603:10b6:5:15b::17)
 by BYAPR02MB4422.namprd02.prod.outlook.com (2603:10b6:a03:5c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:25:23 +0000
Received: from DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::bc) by DM6PR18CA0004.outlook.office365.com
 (2603:10b6:5:15b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Thu, 7 Apr 2022 09:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT056.mail.protection.outlook.com (10.13.4.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 09:25:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 7 Apr 2022 10:25:20 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 7 Apr 2022 10:25:20 +0100
Received: from [10.71.118.41] (port=22050 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1ncOOG-0001Fq-Fy; Thu, 07 Apr 2022 10:25:20 +0100
Date: Thu, 7 Apr 2022 10:25:19 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 2/4] hw/arm: versal: Add the Cortex-R5Fs
Message-ID: <20220407092518.2zwozgrt6njxyync@debian>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-3-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220406174303.2022038-3-edgar.iglesias@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa83a2f1-f99c-4e01-6399-08da18788a87
X-MS-TrafficTypeDiagnostic: BYAPR02MB4422:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB44226E8FA5D9B94BD8469334ADE69@BYAPR02MB4422.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAwhwnutJBw1b4zYItteSjjFQc9szk6niy7LgzSGa8BajPHgp9LRo5D/NRk55H7OVBcsG1mACfKRMSF2LNszmw0BJcTBPMNMQ6gvDTvdO+EsSkpeApq4To9NYPSCxQ59Tx40Ns3qnTr7i+iF2yGNo0vp9MMkgGlDxE0RP3LJKWDOKkC6clctWV5Y7pdhqDPFIaBEMYxeVa6625p90AjPnyQdRSEn9+ZbWLe9WIi/pF2YEkupfyAHkkXGbvTDk5/qtVuZf/ue5PM98MjPXjGFJnGr7dnL8M620UlqWd5WRIAbtp299XCiqj0KdlM6hBipgmHSt4V9uwUWOrTx/vpCaY7+evpNc5uRplDekYA6Ff87fzr+TRRe2Ix7V6QmZdCOWC/y9S2dtJIautE0Kmo6SRQcLM45b/Ftt2Yp/+hWhFrrX1Fy/SHje9mOomQgRwALu7bCHnRwZq70BO4jPk91h9dcKWZKiGgevCATdJx5bctOEWczGo71nwXGGGV+dahRKNg4aGiJYbB3mH44pEn3r0DdeGlHZ+eWFCH+LGz/U8dzw3+CQfRJZVsqVWy2uimuWKTbv9++B71KoJJMLehznItDRpgycsVSZFPh7wXGzrPzytOgCMApDAjx38y+zLhKNDVSX6WrGZacXImj/+kqv7pBZe3L+g4vtn1JW/5fmlWlib0J9Mbmz+/caRivAe9Z
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(82310400005)(186003)(6862004)(70586007)(26005)(70206006)(4326008)(336012)(1076003)(426003)(83380400001)(356005)(7636003)(5660300002)(33716001)(2906002)(44832011)(6636002)(316002)(47076005)(508600001)(9686003)(54906003)(36860700001)(40460700003)(9786002)(8936002)(9576002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:25:22.2648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa83a2f1-f99c-4e01-6399-08da18788a87
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4422
Received-SPF: pass client-ip=2a01:111:f400:7eae::629;
 envelope-from=figlesia@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, edgar.iglesias@amd.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 fkonrad@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 06, 2022 at 06:43:01PM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add the Cortex-R5Fs of the Versal RPU (Real-time Processing Unit)
> subsystem.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>


> ---
>  hw/arm/xlnx-versal-virt.c    |  6 +++---
>  hw/arm/xlnx-versal.c         | 36 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h | 10 ++++++++++
>  3 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 7c7baff8b7..66a2de7e13 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -721,9 +721,9 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Xilinx Versal Virtual development board";
>      mc->init = versal_virt_init;
> -    mc->min_cpus = XLNX_VERSAL_NR_ACPUS;
> -    mc->max_cpus = XLNX_VERSAL_NR_ACPUS;
> -    mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
> +    mc->min_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
> +    mc->max_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
> +    mc->default_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
>      mc->no_cdrom = true;
>      mc->default_ram_id = "ddr";
>  }
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 4415ee413f..ebad8dbb6d 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -25,6 +25,7 @@
>  #include "hw/sysbus.h"
>  
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
> +#define XLNX_VERSAL_RCPU_TYPE ARM_CPU_TYPE_NAME("cortex-r5f")
>  #define GEM_REVISION        0x40070106
>  
>  #define VERSAL_NUM_PMC_APB_IRQS 3
> @@ -130,6 +131,35 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
>      }
>  }
>  
> +static void versal_create_rpu_cpus(Versal *s)
> +{
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "rpu-cluster", &s->lpd.rpu.cluster,
> +                            TYPE_CPU_CLUSTER);
> +    qdev_prop_set_uint32(DEVICE(&s->lpd.rpu.cluster), "cluster-id", 1);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
> +        Object *obj;
> +
> +        object_initialize_child(OBJECT(&s->lpd.rpu.cluster),
> +                                "rpu-cpu[*]", &s->lpd.rpu.cpu[i],
> +                                XLNX_VERSAL_RCPU_TYPE);
> +        obj = OBJECT(&s->lpd.rpu.cpu[i]);
> +        object_property_set_bool(obj, "start-powered-off", true,
> +                                 &error_abort);
> +
> +        object_property_set_int(obj, "mp-affinity", 0x100 | i, &error_abort);
> +        object_property_set_int(obj, "core-count", ARRAY_SIZE(s->lpd.rpu.cpu),
> +                                &error_abort);
> +        object_property_set_link(obj, "memory", OBJECT(&s->lpd.rpu.mr),
> +                                 &error_abort);
> +        qdev_realize(DEVICE(obj), NULL, &error_fatal);
> +    }
> +
> +    qdev_realize(DEVICE(&s->lpd.rpu.cluster), NULL, &error_fatal);
> +}
> +
>  static void versal_create_uarts(Versal *s, qemu_irq *pic)
>  {
>      int i;
> @@ -638,6 +668,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>  
>      versal_create_apu_cpus(s);
>      versal_create_apu_gic(s, pic);
> +    versal_create_rpu_cpus(s);
>      versal_create_uarts(s, pic);
>      versal_create_usbs(s, pic);
>      versal_create_gems(s, pic);
> @@ -659,6 +690,8 @@ static void versal_realize(DeviceState *dev, Error **errp)
>  
>      memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
>      memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
> +    memory_region_add_subregion_overlap(&s->lpd.rpu.mr, 0,
> +                                        &s->lpd.rpu.mr_ps_alias, 0);
>  }
>  
>  static void versal_init(Object *obj)
> @@ -666,7 +699,10 @@ static void versal_init(Object *obj)
>      Versal *s = XLNX_VERSAL(obj);
>  
>      memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
> +    memory_region_init(&s->lpd.rpu.mr, obj, "mr-rpu", UINT64_MAX);
>      memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
> +    memory_region_init_alias(&s->lpd.rpu.mr_ps_alias, OBJECT(s),
> +                             "mr-rpu-ps-alias", &s->mr_ps, 0, UINT64_MAX);
>  }
>  
>  static Property versal_properties[] = {
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index d2d3028e18..155e8c4b8c 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -35,6 +35,7 @@
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
>  
>  #define XLNX_VERSAL_NR_ACPUS   2
> +#define XLNX_VERSAL_NR_RCPUS   2
>  #define XLNX_VERSAL_NR_UARTS   2
>  #define XLNX_VERSAL_NR_GEMS    2
>  #define XLNX_VERSAL_NR_ADMAS   8
> @@ -73,6 +74,15 @@ struct Versal {
>              VersalUsb2 usb;
>          } iou;
>  
> +        /* Real-time Processing Unit.  */
> +        struct {
> +            MemoryRegion mr;
> +            MemoryRegion mr_ps_alias;
> +
> +            CPUClusterState cluster;
> +            ARMCPU cpu[XLNX_VERSAL_NR_RCPUS];
> +        } rpu;
> +
>          struct {
>              qemu_or_irq irq_orgate;
>              XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
> -- 
> 2.25.1
> 

