Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926A4A4AD7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:43:39 +0100 (CET)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYqA-0005Kt-D8
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYka-0007O0-1F; Mon, 31 Jan 2022 10:37:53 -0500
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com
 ([40.107.93.84]:18785 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYkX-0000Eg-H7; Mon, 31 Jan 2022 10:37:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI1vtmazXXVIUNxUZJrCwGXmE/7Ifr3AfDn4mb2xmrRtPsgYSECf4o9JBcFJ8CB1LpwMSINAJcI24HZ0uWeGhlIOcZjcmme4584RT9fUMUVcw1knSUDt5SttxQR5eyPNMpb22iAyQC9aquMeW0YXggRtaxQWeLzBuPRHsI5Pe60Sqexsz5hbwSMzdLtgLLIZTi6gjHOJMP4S1/Xqv81mk1jngv7y3tUtMdWqQFw37EYMxoPcg+jbwHH45jAJwVHq1sC/Jvpgel8jCenhevgtkpRK4hm7zDsmVQ24WT8Yk57q7w6961FrL9Yjmfea5nXOQkiufE4Whj5LxgwC1vJxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NUdoeLSVKdAOm8Ip4u+gNQgqnpLxvawNeIThMG58Xw=;
 b=nI3AoDVVxovk01b+LgbvAOgr51xfoi1RHVaqdLhj1AM2n3wUllloEeGjiGksWZVPvGvAQ6jaULW5yPykuEb3Guxb/FwAACT2zzEAtNX0JHJm+3i23Xd0KQfVAxzkTKxfYKSc6a1En63xchHF3sgLrNLNKg80cWjh/k94j9OZuK7wZHpWoWnFhae7xk/P3b9qMJngjF7aEhQzK6Se7EI+rBB4kaXoKMfiRYWG5ymXpskLUIsyLGog9+xo9U/VGNPdz+8gfDkyhQpL3FwgPutZ4qR4fLO0wnU4YsFGqFtpmti7hmR7Exo61XApln/57LKCuiaBOLyP8mi90okXtgRhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NUdoeLSVKdAOm8Ip4u+gNQgqnpLxvawNeIThMG58Xw=;
 b=mWCUWTh0U6JXH5Ywjt3g8hkAorBqnHsuKycK4mHACMJIP5APV5eFXmYgZOsY2H1yTnTeLYYb66JM8zXPykSJGFFWB3tzu7lexKxHFFxlD5wkcXRn81WpiEufa5KDgK128vsRrZGMtBFhUCdyA8GF9Lmj9tubfc4ag31eN6uM/eA=
Received: from SA9P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::32)
 by PH0PR02MB8764.namprd02.prod.outlook.com (2603:10b6:510:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 15:37:44 +0000
Received: from SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:26:cafe::33) by SA9P223CA0027.outlook.office365.com
 (2603:10b6:806:26::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20 via Frontend
 Transport; Mon, 31 Jan 2022 15:37:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0013.mail.protection.outlook.com (10.97.4.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 15:37:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 07:37:43 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 07:37:43 -0800
Received: from [10.23.120.116] (port=56580 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nEYkR-000ApI-KA; Mon, 31 Jan 2022 07:37:43 -0800
Date: Mon, 31 Jan 2022 15:37:40 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Message-ID: <20220131153739.qyzursnk2agjrgp5@debian>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-5-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-5-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a056e512-e78a-4376-8b5f-08d9e4cfa00a
X-MS-TrafficTypeDiagnostic: PH0PR02MB8764:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB876417D996D3643F70E4D8C8AD259@PH0PR02MB8764.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SEXcnPbFn18HOOaTgYINCtjFKzrnTreOKIoKi7+gjYCGes7LxWqozz9cZXg0lAgyWTO11MIIJX4NQiJQ37iBZgU3QY2Y7dlI12aU6SLsc33vChMFWrIFsIhDANNRgffKaAFVYOjkq7W1TpMaeh7DcSQvverU5ipfiCh6tBgw7fYcdI2iQboDO3HNZRHLYlm56krT9k7cFZsMHCGzD6u0r+O7qF3AOHVivddG2Vni6OQSLaVOeUVvEEUHs4LltGqegslld8/4GmcLGJjQWPQARMncZqdQRSOWZo+QR1Y0/09QbE2Rc7dzuaHZgPEK/R3+1xZXdrFUksEVUdzTkiTUfV/5sUxPskhOFk9R+4agp/OzEjnpqn9SMsNvvrHhnxt27a1eers99NvJryxvq/henCpWf2X6XgBp8+LB0iaRs0pti+nudZ7Y5tf3ZqZTD45d2VeMWUQDthpvRxdHPw9rux2uBzgRFebTw8f1Kaj2PqxKHIHxCEIJLo7YmnP5i1hJjyszVIZ9xwse/cuLXA34XmawGZiq6fnBRql64YKE5atCvhBZqktPe9+kJn+ZQhlO2szL1L7TQnrXKB/LEXrPmajMB6gck7DRbGpzSo75Tvb/zhKU5dHDWi5EKQX6Pjy9lLdY72JBWN/Kew1HLvwrPg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(316002)(336012)(1076003)(5660300002)(426003)(26005)(44832011)(6916009)(8936002)(8676002)(83380400001)(186003)(54906003)(4326008)(70586007)(36860700001)(70206006)(2906002)(508600001)(9786002)(7636003)(9576002)(47076005)(356005)(33716001)(107886003)(82310400004)(9686003)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:37:44.3263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a056e512-e78a-4376-8b5f-08d9e4cfa00a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8764
Received-SPF: pass client-ip=40.107.93.84; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Mon, Jan 31, 2022 at 12:12:04AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP CRF - Clock Reset FPD device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  2 ++
>  hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 99ceb8a609..d5a3ad3df2 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -38,6 +38,7 @@
>  #include "hw/dma/xlnx_csu_dma.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-zynqmp-efuse.h"
> +#include "hw/misc/xlnx-zynqmp-crf.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -122,6 +123,7 @@ struct XlnxZynqMPState {
>      XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
>      XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
>      XlnxCSUDMA qspi_dma;
> +    XlnxZynqMPCRF crf;
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index ba44e95899..857d3c9636 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -51,6 +51,9 @@
>  #define QSPI_IRQ            15
>  #define QSPI_DMA_ADDR       0xff0f0800
>  
> +#define CRF_ADDR            0xfd1a0000
> +#define CRF_IRQ             120
> +
>  #define SERDES_ADDR         0xfd400000
>  #define SERDES_SIZE         0x20000
>  
> @@ -279,6 +282,18 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +
> +    object_initialize_child(OBJECT(s), "crf", &s->crf, TYPE_XLNX_ZYNQMP_CRF);
> +    sbd = SYS_BUS_DEVICE(&s->crf);
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    sysbus_mmio_map(sbd, 0, CRF_ADDR);
> +    sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -682,6 +697,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      xlnx_zynqmp_create_bbram(s, gic_spi);
>      xlnx_zynqmp_create_efuse(s, gic_spi);
> +    xlnx_zynqmp_create_crf(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -- 
> 2.25.1
> 

