Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A04F7BEF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:42:42 +0200 (CEST)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOf3-00015L-QQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOOy-0004zR-4q; Thu, 07 Apr 2022 05:26:04 -0400
Received: from mail-bn1nam07on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::601]:55173
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOOv-0007SZ-IX; Thu, 07 Apr 2022 05:26:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZK9R/2PCI5rH921ZO8cNfYMKXxr0MIA6LhR+jIBTBPOe3yIy+NvTSUE75De96bYtaJW5F9B7OSSycZ49P0k3Rx2l9ztyEMsbEv9j3LGzevtJgC16Za9Er9klOGfpQY3sk4TC0qjYvZaS9q0rNHfgiH39UJ3auW+r+b0HyWYumVdlt5JL+FEVbY+EEd68OiHNVZQXtjpaTFjxWbsdmW/kzIr5LWWHBzrs8Xk5ZYl1aBCLbJHAVtl6VeKMm26yNhtwyN/UD3dXCEEnieu0EEGDwiJ1PLNSlR0jwt4NdZlQhhK9tqCxXXE5BVi0ldhlVstFAhBcs6HBr47smg3cn4AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWCmP2hIyizuM2dSAPQ4x4+uRKKznpnLpLaz2QcWz+0=;
 b=Fau1wkLBQ1xhC+VuakvLXfBg08ac6xk+Ca13lTBS71SwsCK55PWqztwK0cCpHM2ueNpmbyHnFUW7Tv2WWRdif4f7EzINlgKvWMXGQqlclwjLRONmo5WruUJI0LQrrzn8stJ2l6MT8o+dBTv5mKvlbOKBce17vnMvXpSX+qOG0SDg4BNtHZ+gFusUCXTQ1HunVaVCr0jBkSCU9MlIsDIKXQK+s3JRUPubVTfaSuESW1PQclxF7SMZHs/JpTIdDY5ZKrSJXvcGZtwsWLCu08ZnW0BFxQryWP52vwspeNeQ7BU8LGidijlClIiQpog76R7I0maf9AbVZjmbFZKhQ1oKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWCmP2hIyizuM2dSAPQ4x4+uRKKznpnLpLaz2QcWz+0=;
 b=DEGTWDezkVd+2+vRRIWPiVF1mEc0ao+d8tJczAsi9SknnuD3dn0Ux4x566z0iDrTvTdUPzpQsO3ZM9LjpTHgTviYyeCXLg54rDqksm/D4a4DeVptrI/5DKBolOjaFH3F2+n9Zc3IKEksxT7ZmzsHvU6q13CMXcrwflt+nlp27qk=
Received: from SA9PR03CA0028.namprd03.prod.outlook.com (2603:10b6:806:20::33)
 by DM6PR02MB5850.namprd02.prod.outlook.com (2603:10b6:5:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 09:25:53 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::90) by SA9PR03CA0028.outlook.office365.com
 (2603:10b6:806:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Thu, 7 Apr 2022 09:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 09:25:52 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 7 Apr 2022 10:25:51 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 7 Apr 2022 10:25:51 +0100
Received: from [10.71.118.41] (port=36680 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1ncOOk-0001GU-A9; Thu, 07 Apr 2022 10:25:50 +0100
Date: Thu, 7 Apr 2022 10:25:49 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 4/4] hw/arm: versal: Connect the CRL
Message-ID: <20220407092548.x42gbz63ickvskyo@debian>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-5-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220406174303.2022038-5-edgar.iglesias@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eae2246-e61a-4dae-897b-08da18789c87
X-MS-TrafficTypeDiagnostic: DM6PR02MB5850:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB58501C626CA9D906593712A0ADE69@DM6PR02MB5850.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSAC0f+wf5tDmQOC6DIQUGlmT/TfcR7Ax5a6dnwpEeKliYxobJBcSIQrml+hMcx5FD4JEteLhKxx8JVjLZDBSafajj0LFKB1o63T42QmCb+mNpFxrGEt53WhAWba8l08vU4m6t+jFIz1a6WmYNWhh3PqcRNjRPgqNWJTiffqYj7yfxRRqwPBwCkHTvo7YcNo4qQJHKvcB6zU8PH05T/kGA1sQfJqul7jG/q/aI4Nm4k7Fzm0cz/XhNr+3KNDPqZrg5C/y+mdCJYXCwARCH6N0LaRl6X+GAQNEks7XUHILasQeQPzPhu9nf2qs18ft7cSPIR1m66kXCfX2/Z+YOlpExsksAQhUmMw1Ud0LFvBBGouUumiFp3n7lyFbR2eC4/CTSe6HBf2ZCoXlUPGJWZjuhjDL7deNkgenuGPOHnhQMlO/uwNH/EzDOXQf/mULOJeOOzh9xm/jwtsI8mo3SMxNJHLncbHFkUSBffuOqy+wx+OURuXZ/8MbsNe8SzlPp9UIvALKcV7uu9YS66mjYDowvOJgi1oP4x4VIY1QBoiVKcLVs/GZ4nZJ9k3FtagF5MD7kWah+6apRMn8qWUcsf0FmTO0V1Gzo90F4tet7DFuTv87Iko/P9MGJKe4UiGcsQoWcEyUEB5QW2v6w6Q/SP19t2ESQhYsf8ltuhs8Ge7irWkvM3W+JMeapiHkma+XtLK
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(70586007)(83380400001)(4326008)(6862004)(8676002)(336012)(47076005)(9686003)(426003)(40460700003)(508600001)(8936002)(9576002)(5660300002)(9786002)(26005)(186003)(1076003)(2906002)(356005)(44832011)(36860700001)(316002)(33716001)(54906003)(7636003)(82310400005)(6636002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:25:52.4804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eae2246-e61a-4dae-897b-08da18789c87
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5850
Received-SPF: pass client-ip=2a01:111:f400:7eb2::601;
 envelope-from=figlesia@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

On Wed, Apr 06, 2022 at 06:43:03PM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Connect the CRL (Clock Reset LPD) to the Versal SoC.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>  hw/arm/xlnx-versal.c         | 54 ++++++++++++++++++++++++++++++++++--
>  include/hw/arm/xlnx-versal.h |  4 +++
>  2 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index ebad8dbb6d..57276e1506 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -539,6 +539,57 @@ static void versal_create_ospi(Versal *s, qemu_irq *pic)
>      qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
>  }
>  
> +static void versal_create_crl(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "crl", &s->lpd.crl,
> +                            TYPE_XLNX_VERSAL_CRL);
> +    sbd = SYS_BUS_DEVICE(&s->lpd.crl);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
> +        g_autofree gchar *name = g_strdup_printf("cpu_r5[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.rpu.cpu[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.gem); i++) {
> +        g_autofree gchar *name = g_strdup_printf("gem[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.gem[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
> +        g_autofree gchar *name = g_strdup_printf("adma[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.adma[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.uart); i++) {
> +        g_autofree gchar *name = g_strdup_printf("uart[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.uart[i]),
> +                                 &error_abort);
> +    }
> +
> +    object_property_set_link(OBJECT(&s->lpd.crl),
> +                             "usb", OBJECT(&s->lpd.iou.usb),
> +                             &error_abort);
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    memory_region_add_subregion(&s->mr_ps, MM_CRL,
> +                                sysbus_mmio_get_region(sbd, 0));
> +    sysbus_connect_irq(sbd, 0, pic[VERSAL_CRL_IRQ]);
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -622,8 +673,6 @@ static void versal_unimp(Versal *s)
>  
>      versal_unimp_area(s, "psm", &s->mr_ps,
>                          MM_PSM_START, MM_PSM_END - MM_PSM_START);
> -    versal_unimp_area(s, "crl", &s->mr_ps,
> -                        MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
>      versal_unimp_area(s, "apu", &s->mr_ps,
> @@ -681,6 +730,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_efuse(s, pic);
>      versal_create_pmc_iou_slcr(s, pic);
>      versal_create_ospi(s, pic);
> +    versal_create_crl(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 155e8c4b8c..cbe8a19c10 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -29,6 +29,7 @@
>  #include "hw/nvram/xlnx-versal-efuse.h"
>  #include "hw/ssi/xlnx-versal-ospi.h"
>  #include "hw/dma/xlnx_csu_dma.h"
> +#include "hw/misc/xlnx-versal-crl.h"
>  #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
> @@ -87,6 +88,8 @@ struct Versal {
>              qemu_or_irq irq_orgate;
>              XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
>          } xram;
> +
> +        XlnxVersalCRL crl;
>      } lpd;
>  
>      /* The Platform Management Controller subsystem.  */
> @@ -127,6 +130,7 @@ struct Versal {
>  #define VERSAL_TIMER_NS_EL1_IRQ     14
>  #define VERSAL_TIMER_NS_EL2_IRQ     10
>  
> +#define VERSAL_CRL_IRQ             10
>  #define VERSAL_UART0_IRQ_0         18
>  #define VERSAL_UART1_IRQ_0         19
>  #define VERSAL_USB0_IRQ_0          22
> -- 
> 2.25.1
> 

