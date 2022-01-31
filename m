Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3324A4B59
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:08:29 +0100 (CET)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZEB-0007tc-Nm
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYvP-0003lJ-Ji; Mon, 31 Jan 2022 10:49:04 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com
 ([40.107.94.67]:1441 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYvM-0002ZU-Rm; Mon, 31 Jan 2022 10:49:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm2rl72Wn8jQeGL5iuwxG5VD61N3EGcmYU2SD0MIJJrI68/Xynywy7BjTM47KAlITFUzE2dBY4TE7TMojvyXW7nuiDMSihghoPWnaIgDNQukl/BRuMTIf0sz/oGl11+5omct22J55s7lO52nLlV2DA05Rc745abN09JeM/c2Woo26IeTzGqcOyq21L0D0E3TWH8AQU5Z0K0tcdfprFxM3Cn/sTI4c4QC/pdV0vBkLv40Twx/nQe6fTNM1KYnU6k3jUF3DqDpyhR0AqMD4E80ZMQ6+c7JeWMXa7I51BoSq2vjDlV5rPZDnMK54QoAbSyFpSIul1jWJq0yXfOzz1YBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj1x9qiaiOSgj8GsMQ1ZrDRnTNE3CJOvI8OL0shx+Q0=;
 b=QkQvenff1OQs3cZm+dc6NIk+6h8FkjU5+sKXOh9qX+rfk8vKKgkDSKK7+ojo/Fv7QAAKhfuMql2lN2fZKYVmIRGG7JFbmLRgUnXqmQxp1QliRhIcpdwyHZQNiw/R22nuYcOQx8ipxSMc/w4BbTYYLcpLKLLehtIsjbE+R4rc2tJUF+fRXBjRwrfkljLLjQUgfgb1Qbs1opeaXtJYTsFXz3MBowbRYPQoJhKw8k9/rr+A7RJgqaMjVsMf+K/DQ+09Id/zf7a71ZZbtGYb0GZkdMhdOFduechdtR5nFi9/4x4BmTlBGz/5a6vMM8h/iehJDrP7YnbJr/YAwn304PoROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj1x9qiaiOSgj8GsMQ1ZrDRnTNE3CJOvI8OL0shx+Q0=;
 b=H+kTxZJm6EmI4Zx6b6pP60PO30rDKLMIosSTKYiOopmiMxlTbrqE4d1Lnn2RMLB1t+2Ux3nGy+mv3oXMT62cDdozhiSKP8OEK0KlCFK+hZ6uWrQKyclxDzz4YIiB3v5cMRukVTDNI5pMLtELP+/M3/nX2JmiT/d442LQdIyquEU=
Received: from BN9PR03CA0915.namprd03.prod.outlook.com (2603:10b6:408:107::20)
 by CH0PR02MB8133.namprd02.prod.outlook.com (2603:10b6:610:10a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 31 Jan
 2022 15:48:56 +0000
Received: from BN1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::ac) by BN9PR03CA0915.outlook.office365.com
 (2603:10b6:408:107::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 15:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT058.mail.protection.outlook.com (10.13.2.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 15:48:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 07:48:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 07:48:53 -0800
Received: from [10.23.120.116] (port=56721 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nEYvF-000Dti-5W; Mon, 31 Jan 2022 07:48:53 -0800
Date: Mon, 31 Jan 2022 15:48:50 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Message-ID: <20220131154848.itmhkvnbfb7bxoun@debian>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-7-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-7-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b33efd-7de2-4113-b3ce-08d9e4d1306f
X-MS-TrafficTypeDiagnostic: CH0PR02MB8133:EE_
X-Microsoft-Antispam-PRVS: <CH0PR02MB813368BFC32C017BE53CB592AD259@CH0PR02MB8133.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68KulyGJ0bo8BeTitJti+G4/lo11daYwPs8OL9dm2QYJzOUkAb10BEmnKy4M9uSIbsFaHi+fgjhJt+Nry1pYtJC5hiVzA/KVcr348wh73xtJZJwsxm5ORjI6sOCEy5Y1BIMK2y7la8E41tZNkK6g5xGMKVTSY4kGTUmlb+VZAncD2uKcbs2wEQV7vRxfu1JcbXDi4rpZN4cMpJKqTzeKruy24IYSRvH1VikXe9sMhZPIB2R+7iJIBA0kRMHhAvzZH0xpPdpbWqd/E51RBbZrHcaVtlp/uk9XvBgNlzkfZeB1uaMstaq2g5O5hkuYigeRemL91uUPucnu5BgJ5D2rE2bjGpFYtB3xBagr4j77ooV2QcKwbaKyX7uHvtUxLUvbP77iz6FRUKqO28IU7C789meydAhHYJb3d/pBMxNIXubVGMiuKIzvdGqMHR355Thsj0gCgnQQ655xevcyBMK1V8kC0Jn4onybBrMujTZ14RQEcqyA5oawDBkbXIeTq8bOF8UVDLvlF4wu+JLkLDcORnF9NxE3/wrwSegQvDx/KzW/aIYHrpRhRdLf1wsc2lRoNotXWcbyue6gxUjpootrExA2lV6sJ3d5y7erjdRL7gI+AJkjCh0LnSe5N4h1xgpQX+1uOACcFWe9MkGRA7F1mLyA/Ge7LkOG4/E8nmxqZxJQ4XFidChNXhnvXkb50H3vK4yq+LQAsUH/Qjd4DVZBfg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(70206006)(1076003)(5660300002)(44832011)(107886003)(186003)(47076005)(9686003)(508600001)(54906003)(6916009)(426003)(2906002)(8676002)(83380400001)(36860700001)(70586007)(9576002)(8936002)(9786002)(26005)(33716001)(82310400004)(356005)(4326008)(316002)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:48:56.0154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b33efd-7de2-4113-b3ce-08d9e4d1306f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8133
Received-SPF: pass client-ip=40.107.94.67; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 12:12:06AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP APU Control device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 +++-
>  hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index d5a3ad3df2..05cd2128f3 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -38,6 +38,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-zynqmp-efuse.h"
> +#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
> @@ -85,7 +86,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> -#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
> +#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
>  
>  struct XlnxZynqMPState {
>      /*< private >*/
> @@ -123,6 +124,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> +    XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
>  
>      char *boot_cpu;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 857d3c9636..21c411cd77 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -64,7 +64,7 @@
>  #define DPDMA_IRQ           116
>  
>  #define APU_ADDR            0xfd5c0000
> -#define APU_SIZE            0x100
> +#define APU_IRQ             153
>  
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
> @@ -282,6 +282,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "apu-ctrl", &s->apu_ctrl,
> +                            TYPE_XLNX_ZYNQMP_APU_CTRL);
> +    sbd = SYS_BUS_DEVICE(&s->apu_ctrl);
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +        g_autofree gchar *name = g_strdup_printf("cpu%d", i);
> +
> +        object_property_set_link(OBJECT(&s->apu_ctrl), name,
> +                                 OBJECT(&s->apu_cpu[i]), &error_abort);
> +    }
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    sysbus_mmio_map(sbd, 0, APU_ADDR);
> +    sysbus_connect_irq(sbd, 0, gic[APU_IRQ]);
> +}
> +
>  static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>  {
>      SysBusDevice *sbd;
> @@ -301,7 +322,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>          hwaddr base;
>          hwaddr size;
>      } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
> -        { .name = "apu", APU_ADDR, APU_SIZE },
>          { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
>      };
>      unsigned int nr;
> @@ -697,6 +717,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      xlnx_zynqmp_create_bbram(s, gic_spi);
>      xlnx_zynqmp_create_efuse(s, gic_spi);
> +    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
> -- 
> 2.25.1
> 

