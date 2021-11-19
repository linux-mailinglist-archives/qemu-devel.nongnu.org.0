Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E540457586
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:35:04 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7mx-0000SY-JE
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7Uz-00046g-SZ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:16:29 -0500
Received: from mail-dm6nam11on2085.outbound.protection.outlook.com
 ([40.107.223.85]:39904 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7Uy-0007f2-5W
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:16:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnJdSkRHQTrGvC8Ucr1D5DCNorVNNpeSG6qCO5McONJHbp0WSVtbt48KWKnvIUT8IyyS7Mp67MWslzlcWdJe5RB8/jxBeDMfmrrZ7gdak1u+J4c8tLKUHw7fm27OkdEOqFy3ZuZaKumz4PCHOujHyoeS8KBuSaOABKKTQdM9Onc5PQ6nPZfXnTqCwOOwhuFCiJvnn2OLwMraiJDAkfKRg4jqdq7G7bYYHzCG3dLIBVsUZ103IDBDxBMVILEaarZZF1ElwfUv9vZhOhjvjlrXk58NY1mnfQgFwybSE23/j+az0UIdrFWuTgDEk6R8TTGkqshNHzEvStsj9J+dms+58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ViGJ3j6FNUiXgbPG6gIwHYpqaHKcDcD04/F8JxN/wY=;
 b=iWImFpPiiK2awkycn6X9uj3T3B3L4vuj6K1pxRteHzgtRkM+RrSHPClbYTKaZ3fxxn5bOg42PhlTyHOK8whs9oKEw/shUAr6iKaxdVmbJMnNwyYp1VzxYYh+6Z2hR/w7d7wttt2l7fypfnD4n03x1b4jYmj8YRboeSCVZWjclTCruflHDONFmUuqHyEkUJzfSiFK1/KxSQTnw+ofQbsjFlxBNf4J1f68xXeMOVXorYag84AApSxnILet6ybH6TGucrmJebutup3XDqBs/a4NFn/xspGMx0Mg77HWsDxaIR1aXQdMyywMHWlUjFl1tB5ekDTKw9Q2OXGh+FOlE9EUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ViGJ3j6FNUiXgbPG6gIwHYpqaHKcDcD04/F8JxN/wY=;
 b=qFtiK0QGxIld9AgJ353AIA3fddw38oI9quOMJi+ONUQDDN5EtupVG6ewIkRb2raZZlr0W4w4svW69eX/7GSNawWTgTDWQLi2sLwhinwcQSAEhcsSsVwwoaNAC7G2fcwt6KWEHsPFVBOLLOCs/pL2hUKt38Ej/6jRvuejAVPe82Q=
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by SN6PR02MB4781.namprd02.prod.outlook.com (2603:10b6:805:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 17:16:25 +0000
Received: from BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::8d) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 17:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT022.mail.protection.outlook.com (10.13.2.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 17:16:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 09:16:24 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 09:16:24 -0800
Received: from [10.71.118.100] (port=60125 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7Uu-00081G-0L; Fri, 19 Nov 2021 09:16:24 -0800
Date: Fri, 19 Nov 2021 18:16:23 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 9/9] hw/arm/xlnx-versal-virt: Connect mt35xu01g
 flashes to the OSPI
Message-ID: <20211119171623.GH2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-10-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-10-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 837a2cf6-a446-4ace-4c6e-08d9ab805146
X-MS-TrafficTypeDiagnostic: SN6PR02MB4781:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4781BEB204D535E4ABFF85BBC29C9@SN6PR02MB4781.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Z1RySW/QcULlyb/e+T4aEEYkQajcY7pqhLubgDo7TleW6c3OH2dATCMepJeWpcQvC1q4iBFYsdM760tArrkXq9fxoKowj1bRJf7p69HnHqik+QAYu//kGLY3AYzxN1/GXZ3MTXn43rPWHL/bTwyu1oi6elnkAVENL66hhhD/uMsg/KB0A9ZMPIjvvil/RuN7KKH4BNdVjGTYMA1GtWV3c2D4y+OFtFPVpH0Av3BT/E6I42SutFJdNQ6JT0EtfiBn7Pp6U+zzV67JMzBH5iXP8mVkdL/B3oLIT6Xen4qH7GffA6Y3G3uHr3klf1fc5CUpeXq62HgOH1Nh6LhyB6CeIDmr2GBmYpRlOVmlc01kmRHwnXlkSyzrh/75EeXNeNz+WWF7N5oHLsRdKsu6+ZTrIb9IA1boKQ7Df8Pj8QfF9EcLRlYKRjxLVbxUCTgXPtsRI6/UbyEoO4Ywvxv+TAWV0oC5NbwFEZU4IB0+JxZGZpT7lU6L+j9nwvjulcif0Il7saKe70qlLcuewdZDhtpLcTpsGbwxFdKv3DYv6J1Bsf3aJZfFyrMnSHix08MtWMnpMTozMjytegeDwEcuChU0vPfJ4lZizVd+eZHPGY0buzb6Kn+q1ow7ptmudISoe7kg6vCahGJ+NANrdtd2JHaaTEK275AkfU+4JA5/uxHXciMBiX/udB7/Maml/jMulsJnhgGnr3WVVLaf04XwJiezw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(46966006)(36840700001)(2906002)(6862004)(8676002)(336012)(54906003)(82310400003)(4326008)(36860700001)(70206006)(316002)(186003)(9686003)(83380400001)(356005)(7636003)(6636002)(33656002)(9786002)(70586007)(1076003)(8936002)(47076005)(33716001)(508600001)(5660300002)(426003)(36906005)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 17:16:25.5871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 837a2cf6-a446-4ace-4c6e-08d9ab805146
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4781
Received-SPF: pass client-ip=40.107.223.85; envelope-from=edgar@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

On Wed, Nov 17, 2021 at 02:18:41PM +0000, Francisco Iglesias wrote:
> Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
> controller.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index d2f55e29b6..f2f12a781e 100644
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
> +        DriveInfo *dinfo = drive_get_next(IF_MTD);

There's a patch from Markus on the list that is getting rid of
drive_get_next(), we'll need to merge with that at some point...




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

