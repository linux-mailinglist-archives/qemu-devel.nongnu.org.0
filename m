Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657145A0A7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:51:33 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTOe-0001Xh-Eo
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:51:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTJc-0005DE-SL
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:46:21 -0500
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:26977 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mpTJa-0002Iv-GU
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:46:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsIx5R3Vi2WUxMxDHoj843j/HRxFspLKRh9/EyohXslwYCgACDMUBNaQxt/gM1C2MgpEYSzWuJEmdMEytNufmhVWmZSrBCmVTIg63DzC203kRDkvpMt7WguDKQJSzJE0KClu3ROQUd06kRKtpchBw57KP1TNtO3ZMUEVGwuk2maD5V7S5ly0OPcOnbdm9B30UmSiAfQmAaRiVKvlMoxKl4Cetwnpbl3WEcCBTGdvdWfjOmD3Xfsjt6ajBoYDGr/r4fusDl1IdxiOQcuk4qUzQx9XNpNwFLvyVkaCov8whwG0sWYonU2Mtv4AMoVpOM4bLahDp3GvvP71FEgQ6Ij4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U0ikItvN0Yabp6Dv0DHa8fcRg43OmnI3lwdT8qmnos=;
 b=Emo7zlYRfm3Cn0vCTLsL9Abn3gufjZiBn5vl3lYKbfT86bwESgo451e/TUZeoUCoV5SiIBRnOOD/oQMLeQMlN7UO4vgnHskVOK+SXRb0Dx9On4P7whkgcJBu92TFatuNOGUcuO0ozMtIVs3p67nDv+WvlrPdOyr6UGjBxyffz1OkZ74qpnhozp6l4rcTlkh4MonrOalk9aXeRITDGEN5ZcX53WyxKZY1xcGnUNH2zkCh15dBPL2BDqTyN7UJA4MQZIxWmxYcANE3fuTsYS5wDcd1oY1YkYPLpZhVLkcg+G/S2RuSAqSt0vbfs2q6UzXeaW1ycFU9YgSObbvPC1KbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U0ikItvN0Yabp6Dv0DHa8fcRg43OmnI3lwdT8qmnos=;
 b=Zw4tmVeuGHPBY2fLBbN7ExDTWdV8Y0jF83AjphFZsdD8FoeS6jJQ1gvk/tvvh9HwnOW7+8F1hByOGDXlO/EI/sc3LR2MNPCsXWwBwzQWIdJ9qhj9XGv/SVGP7oQRKS2KUg+Kqx5e+7+7dFXs+yYhUXcWdnMC9Y6Pf7Tw3304vxY=
Received: from SN2PR01CA0033.prod.exchangelabs.com (2603:10b6:804:2::43) by
 DM6PR02MB6059.namprd02.prod.outlook.com (2603:10b6:5:1f7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21; Tue, 23 Nov 2021 10:46:15 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::e3) by SN2PR01CA0033.outlook.office365.com
 (2603:10b6:804:2::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 10:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:46:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:46:14 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:46:14 -0800
Received: from [10.71.117.214] (port=57259 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mpTJV-0002Ym-M5; Tue, 23 Nov 2021 02:46:14 -0800
Date: Tue, 23 Nov 2021 11:46:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v2 09/10] hw/arm/xlnx-versal-virt: Connect mt35xu01g
 flashes to the OSPI
Message-ID: <20211123104612.GC5816@toto>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-10-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211123103428.8765-10-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70083346-ca4e-4084-37c0-08d9ae6e78e1
X-MS-TrafficTypeDiagnostic: DM6PR02MB6059:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6059644E9F1E787850600755C2609@DM6PR02MB6059.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:95;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBYtr2W8jvjMaqcpwPc2aPNRdJV70oApQsVM07SPdlXGs6x7R6sOnQULQ+AgYamUmUZzZD5rK8H6BNc+R78KfjDZATIRc3i4t9XyjugZ6yGBUHg1BLSgNv45u32ujj12EKI/hCI2pEcou+VAWXm3CDNfzfgRJzrx4a+shDoduWCQZcivccvWFCicxsB9ps+lGQ1vNrcu0uA6csrTC8d9VDRYVXLdsCTF0jf+WLp+T4khExHQNqUbyV/PREhG9iClK0gI/HJmFauw4KkC6z1xRwVgNN8jVD6StVOcZdZ102RePJy4tKQ/WFxRI7S9vM0Vz2pVGN5TEr6xKZKOPOvpOgwLVcuQChu6Gs37wYY5fIHbRxeFCNyT4TqXn2gc6P2yyVooN3deTEVLwqvk58ws2IQRnWtgHXhxme1zBDBRaczY5sYOyyFgyMeUukZlODmaLeY4Kf5+divHOaNkxkjQLPOm5QK5XUyR/W8ZrQysF4cH0oh4NKkCjdNEHfERlsCU5fPeSu6Ecu8C2JHLNC6+RyRGdmjW4K/RttYu+QGdej9aAFJTSVkwWoq8k//GVR6h+NksbUzKejIyAzUV+WykWjEBGNb4FUkkIsLA3N6+B6f42CFiv1O5TVTx9WIAj2UJmBwowfe5DPga59QcLFQTmm+G7apjJRh8HcvF8U/SChLMJ7cQNwOQTKu8VkXIm1AY+HTvct06Gl+/tvz7lj+ksw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(8676002)(508600001)(316002)(33716001)(426003)(2906002)(6636002)(1076003)(4326008)(47076005)(54906003)(33656002)(336012)(36860700001)(8936002)(26005)(186003)(9786002)(6862004)(7636003)(5660300002)(83380400001)(70206006)(356005)(36906005)(9686003)(82310400004)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:46:14.6497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70083346-ca4e-4084-37c0-08d9ae6e78e1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6059
Received-SPF: pass client-ip=40.107.244.81; envelope-from=edgar@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

On Tue, Nov 23, 2021 at 10:34:27AM +0000, Francisco Iglesias wrote:
> Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
> controller.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index d2f55e29b6..47f5914e5d 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -25,6 +25,8 @@
>  #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
>  OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
>  
> +#define XLNX_VERSAL_NUM_OSPI_FLASH 4
> +
>  struct VersalVirt {
>      MachineState parent_obj;
>  
> @@ -690,6 +692,27 @@ static void versal_virt_init(MachineState *machine)
>              exit(EXIT_FAILURE);
>          }
>      }
> +
> +    for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
> +        BusState *spi_bus;
> +        DeviceState *flash_dev;
> +        qemu_irq cs_line;
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
> +
> +        spi_bus = qdev_get_child_bus(DEVICE(&s->soc.pmc.iou.ospi), "spi0");
> +
> +        flash_dev = qdev_new("mt35xu01g");
> +        if (dinfo) {
> +            qdev_prop_set_drive_err(flash_dev, "drive",
> +                                    blk_by_legacy_dinfo(dinfo), &error_fatal);
> +        }
> +        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
> +
> +        cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.pmc.iou.ospi),
> +                           i + 1, cs_line);
> +    }
>  }
>  
>  static void versal_virt_machine_instance_init(Object *obj)
> -- 
> 2.11.0
> 

