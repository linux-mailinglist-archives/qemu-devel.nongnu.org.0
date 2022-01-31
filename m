Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F04A4B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:02:49 +0100 (CET)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZ8i-0004Gr-PW
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:02:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYVG-0007zc-Lz; Mon, 31 Jan 2022 10:22:02 -0500
Received: from mail-bn7nam10on2071.outbound.protection.outlook.com
 ([40.107.92.71]:1640 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYV8-0005Ee-VH; Mon, 31 Jan 2022 10:22:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP8iww34nlcEEFuF6LX5V1gWaSnjChSl7Uk5VoiwBoKxkla7AWs6lBksBqQscmLvVSq9jYNRKToSaQbXj20mLZWIibhbdxRYk4EIqaoQtjhMRRYwQPmvPLxx3+tKifh4B1fQmTyv8/CUWgnctE1GEJ19N4W6gWytQYehUE90RGOf1K4QOd7Oq95Py5c/uVw5nP/RKpbn3VYRj+jFmVudE+OZ2eTpKglCkPyb5QBcGwzeOrBOqN71EY3c//KX0PDjxUOdBsOVJqS/C/nUxxwJx9BEj2xNPuQNOnX3IF/tNJQGi+oBE4T24F7SE3eQv/0IVHLPrRiBWpEXEU+evdagVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXpL1imULYCo24Aya+rVwjrQK/kb6iIkblY9xpmHy0U=;
 b=dmfbH1u0bgIri9CXwgsGiFLaVzXtkzsPgEQC3ABQTKe09+3ndM0waOo/xE/7Y8kjyDIep0tP8m8EX6mXjWUkHd1+GEgsT9qq6ThuGbDQFosmvrCVMR6rOsarryAi3TzP4TJb34UNKLUamWng73Y434nq6noKbrrLwDTdOTuZnNuuMoW+apI+KEWkrGZUxYTaQX02EEF2S9K8UWEUtI6bY2pG1L4zaUGGVgVkvbDxv3fSBzlGEmb+pXb6/642Ea2cv3vLzSedD2evvtOw45Pj+MrM2uZpNNK0504v6ZR/9bMPJHzQ3JWyoLX+gdMVogWD0Hp0TANg3xKqL3tEtn/YdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXpL1imULYCo24Aya+rVwjrQK/kb6iIkblY9xpmHy0U=;
 b=Oc3VHHYeXAWeIcSu6dKvyjCbM0j5meOeTv9mlyYBnS93cpofr6GH6J4h8olgSWS1RmSWDYMi/GpOu+6BcIm6h1zmPNJWFHEY5qEo60rzUikCIB9iMu23wAWyPL7T39x6J2826SkeAdPk7i1vkoAZousAwRfbXlh7+wSJhBagCaw=
Received: from DM6PR02CA0069.namprd02.prod.outlook.com (2603:10b6:5:177::46)
 by CO6PR02MB8771.namprd02.prod.outlook.com (2603:10b6:303:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 15:21:40 +0000
Received: from DM3NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::57) by DM6PR02CA0069.outlook.office365.com
 (2603:10b6:5:177::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Mon, 31 Jan 2022 15:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT060.mail.protection.outlook.com (10.13.4.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 15:21:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 07:21:27 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 07:21:27 -0800
Received: from [10.23.120.116] (port=60382 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nEYUg-00068Q-S2; Mon, 31 Jan 2022 07:21:27 -0800
Date: Mon, 31 Jan 2022 15:21:22 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/6] hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
Message-ID: <20220131152122.o26sikoposydehlf@debian>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-2-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 270246d9-ef45-4ecc-e339-08d9e4cd610e
X-MS-TrafficTypeDiagnostic: CO6PR02MB8771:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB8771FF26B5E4D60B7F0EB417AD259@CO6PR02MB8771.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YjSyM2okw32eIgb1KSHyDtqjpUKpENBxqOZxysL9z4nRAaJhCXoDSqO6UJYWXschmMHkm3NoGCF6/6OGfeketyfr3OCID2PwdZ9C2jOjnuFA3eBnkVyUlbDnfNS4Xulj2diHxcZSAeW9yceC8c7jkCi4cCath+BmMXSLMdtPE0oFdkyZFa4kFTU6oFK5SwfC1tSG5KwlpKB279hpfbiT12XLcNs+GWnF9qzu13nWaZvXAVvOn87oqj6B96WJluak5Q1o8t4UO5xtNPAozb2HPYJrXHH3KMGitnWjn5tpPg5G5rsK3EPwlN1fzKsT/eoq6xVQodKZnEsPPwLlhUCaFNi9nw9VTOLnECH+o+QZP73bUNVf5v0avrZgc67xwL0YzMDozd0EekrHj5ugdbTopuVsPfmWeGUJ/Y/hthLX8Op+DO9f0CQ8hTS32o3hflP+2ddePEMot6FodKTf/EINEmGIMEDauW0n//hgBTyoR0BFW5epq2Msjvf28IzlID8me2pGrsYbmhyv8vzjoTmQb2yMkvpkex6qYcie4clb/qiD0SxalHe5n9VXsevD9VXa99p95W85EpgEBKxGTSu4qq2QNojhlLyDLzI3W/JMrlydYlnDefYksJ7Cn/bNWzONK2FntY4ud6nD3NnYsVAOTg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(8676002)(8936002)(508600001)(2906002)(356005)(4326008)(7636003)(6916009)(316002)(54906003)(6666004)(9686003)(82310400004)(107886003)(1076003)(336012)(426003)(186003)(9786002)(9576002)(44832011)(5660300002)(70586007)(70206006)(36860700001)(33716001)(47076005)(83380400001)(26005)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:21:39.6492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 270246d9-ef45-4ecc-e339-08d9e4cd610e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8771
Received-SPF: pass client-ip=40.107.92.71; envelope-from=figlesia@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Mon, Jan 31, 2022 at 12:12:01AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add unimplemented SERDES area.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  include/hw/arm/xlnx-zynqmp.h | 2 +-
>  hw/arm/xlnx-zynqmp.c         | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 062e637fe4..99ceb8a609 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -84,7 +84,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> -#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
> +#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
>  
>  struct XlnxZynqMPState {
>      /*< private >*/
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 17305fe7b7..ba44e95899 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -51,6 +51,9 @@
>  #define QSPI_IRQ            15
>  #define QSPI_DMA_ADDR       0xff0f0800
>  
> +#define SERDES_ADDR         0xfd400000
> +#define SERDES_SIZE         0x20000
> +
>  #define DP_ADDR             0xfd4a0000
>  #define DP_IRQ              113
>  
> @@ -284,6 +287,7 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>          hwaddr size;
>      } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
>          { .name = "apu", APU_ADDR, APU_SIZE },
> +        { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
>      };
>      unsigned int nr;
>  
> -- 
> 2.25.1
> 

