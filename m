Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CCE4F7BA4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 11:29:41 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncOSS-0006wR-KN
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 05:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOOA-0003zt-Rh; Thu, 07 Apr 2022 05:25:15 -0400
Received: from mail-dm6nam11on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::60d]:22113
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1ncOO8-00073o-Cn; Thu, 07 Apr 2022 05:25:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrP8uiCDbf6+dpQudH4bYZSkMSFjexnC6IrXoja9pSgKBjzhNus5/u2V1mgbj3eHC/FTBcGorz9oWxq4JFjTCHLvIWYJd3upGHUTye12ycIhZbHvCfH9ismNHG9tdgTlVLGweeijFSLsYKXePMVWgKcgYbeU7ITVWEJO6tHFZfwu+C0yESIlcHHuGrpiLnCzTKBJ4QcMeSE4Sf+txJmNo9fBm3cttZB2PGtONOi2e+sOEMMK2e4/IOCJa+0A+jV4/8XCCggnTjK7VbljdwL9nzecW39e2NRJUYRjt1KEeqGaML2Adn/6q0iEotBbWp3BvQGsuW8oue+ZXqUU+4nYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKtzgmuzw+LhBwT/nQMCIMdsQLMbFghqpLqVn4wu+Eo=;
 b=Ey1RKC4sIaXEvNP6oRWoReSv3KdcyuKlKdhuqZrnOpVgy7Ktb6dj1E4uEx2oDTNFr5P5ErbhnYENRqlyHJpYaLVOpTyfZU3wvugxvU2vU8L6YmYZYuK8j2RhBltLsflWdRi7pvz1C4C5amWtri7oXagiv12u5llcjklYsVXgNl/GIkiCKmKxapVHspM0ZIu2Mb7zBcIxmsnzgfYgVllmyaH7FO2NspR19wujoVK3WMsDNxTI+/vIfoYbAdRbUT8Ek0Bw1oK9EcfAGAE4TMd05f1Y8w03X/7g9HhELNgmzfGiCYXbuqKqbTfKkhtj3jyKEO7K9Ud4cois8U3VKOHoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKtzgmuzw+LhBwT/nQMCIMdsQLMbFghqpLqVn4wu+Eo=;
 b=WH9YsXMSeRCv4qC3XR8+CHZG2bgUK82A4DiKbMasiMzwfAPNgFaa8JENIHRO80FAvOaxQG0+apZnkHBJwckfU8dgP/CGrJsisfiO8YezJJKhPzZalxgmPry0RgfEmDfo5ahopoj4dj3KH+D0UqsZBG/j3sSKDLhlCqBZ2lPyQ2Y=
Received: from DS7PR03CA0014.namprd03.prod.outlook.com (2603:10b6:5:3b8::19)
 by CO6PR02MB7729.namprd02.prod.outlook.com (2603:10b6:303:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 09:25:06 +0000
Received: from DM3NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::41) by DS7PR03CA0014.outlook.office365.com
 (2603:10b6:5:3b8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Thu, 7 Apr 2022 09:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT014.mail.protection.outlook.com (10.13.5.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Thu, 7 Apr 2022 09:25:05 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 7 Apr 2022 10:25:04 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 7 Apr 2022 10:25:04 +0100
Received: from [10.71.118.41] (port=13186 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1ncONl-0000nd-LP; Thu, 07 Apr 2022 10:24:50 +0100
Date: Thu, 7 Apr 2022 10:24:48 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v1 1/4] hw/arm: versal: Create an APU CPU Cluster
Message-ID: <20220407092204.4glkr7xhhgf5xnxl@debian>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-2-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220406174303.2022038-2-edgar.iglesias@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d759a753-55ae-4b1f-f189-08da18788089
X-MS-TrafficTypeDiagnostic: CO6PR02MB7729:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB772938962A1FAA6A1280F2A5ADE69@CO6PR02MB7729.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jbfUBVVdKKfHZX6l0tkLGNnIF2gAtqqFTmbea+9ImTHAswxqWJtZ1/CW9c14MlLs09ec+r2DWISVg6+TKLBCOpv0VSjyXC9QCxuK2+psv7HvtU/xaoW74V6Lp995y7vguMLVMiizVMLCXYRI9kCXqezYyOcUk6364YpoSuSkWJT3QC4vQC3/XOzcmTKhkZ5RJyMZxzjHj1GXrZJdUNTO1wudpclhMcHW24eozdXIoyRFRYsFhpbyxd2K3wmN5KNE4RRN8UxCLM86qHVTG/JTfizJaJr49FgAYLSRva3KqJ19WTLxzWv0H1sAwZtwgOgN0as6SiJJLnkdJTHyiVsOJgREIzJPmI4W0ZAojKNhzldyeaYvcQF9TgkqwVSJ/pE/wcsm3GbOqXbjm5LcvPrjqUKhu5o3cgbVQgWsA83ameM7Bzl/BwavqKsJdlSlCxOaG7fx2qJF8aQHRAg2WTgJzdUdOvtElfo0pIn2xZeKRe9fu9jvZvutdpvf8Q0D/nydOb8D8XER+L8o3OiAZd9SvTFVcxqoGsXJY9TnRWjkkMcu8tZCt20L9721eU8NPYKM1SFlYem8KPc9ngUiH2Utebo9nFTPWfvjwJBHjwbudQNG8MjPZBhT3UkFx6oHyKkr1g2XBllmmG6W06Xz7lbQvHGE2klOhbue8DgkebU6MhYi2kYtPo3HXMGN33XiXtq
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(9686003)(36860700001)(83380400001)(426003)(336012)(26005)(9576002)(9786002)(8936002)(4326008)(186003)(1076003)(2906002)(8676002)(40460700003)(70206006)(82310400005)(6636002)(54906003)(508600001)(7636003)(316002)(33716001)(5660300002)(44832011)(6862004)(356005)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:25:05.5668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d759a753-55ae-4b1f-f189-08da18788089
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7729
Received-SPF: pass client-ip=2a01:111:f400:7eaa::60d;
 envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

On Wed, Apr 06, 2022 at 06:43:00PM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Create an APU CPU Cluster. This is in preparation to add the RPU.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

> ---
>  hw/arm/xlnx-versal.c         | 9 ++++++++-
>  include/hw/arm/xlnx-versal.h | 2 ++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 2551dfc22d..4415ee413f 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -34,10 +34,15 @@ static void versal_create_apu_cpus(Versal *s)
>  {
>      int i;
>  
> +    object_initialize_child(OBJECT(s), "apu-cluster", &s->fpd.apu.cluster,
> +                            TYPE_CPU_CLUSTER);
> +    qdev_prop_set_uint32(DEVICE(&s->fpd.apu.cluster), "cluster-id", 0);
> +
>      for (i = 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
>          Object *obj;
>  
> -        object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i],
> +        object_initialize_child(OBJECT(&s->fpd.apu.cluster),
> +                                "apu-cpu[*]", &s->fpd.apu.cpu[i],
>                                  XLNX_VERSAL_ACPU_TYPE);
>          obj = OBJECT(&s->fpd.apu.cpu[i]);
>          if (i) {
> @@ -52,6 +57,8 @@ static void versal_create_apu_cpus(Versal *s)
>                                   &error_abort);
>          qdev_realize(DEVICE(obj), NULL, &error_fatal);
>      }
> +
> +    qdev_realize(DEVICE(&s->fpd.apu.cluster), NULL, &error_fatal);
>  }
>  
>  static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 0728316ec7..d2d3028e18 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -14,6 +14,7 @@
>  
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
> +#include "hw/cpu/cluster.h"
>  #include "hw/or-irq.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/intc/arm_gicv3.h"
> @@ -49,6 +50,7 @@ struct Versal {
>      struct {
>          struct {
>              MemoryRegion mr;
> +            CPUClusterState cluster;
>              ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
>              GICv3State gic;
>          } apu;
> -- 
> 2.25.1
> 

