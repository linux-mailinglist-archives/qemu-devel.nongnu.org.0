Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC4518961
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:11:06 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlv7A-00046i-Df
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluvZ-00039n-7C; Tue, 03 May 2022 11:59:05 -0400
Received: from mail-dm6nam12on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::60b]:3297
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluvW-0001k1-Ii; Tue, 03 May 2022 11:59:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+9lbgaunK/UY96aQSaQZLgHBBoNmlBDfn7gpiFkH7we4pQpVCapUJVHGFBRXxf5jyhUO7e+67aUOMxUE+X7mleECK1IIdqa12Ivj9DOENjd9ZHebhe64l4m83FHMCKb9F8pms6w4dqvPdFQtSBxpTNUvMw+53IRTmB0g3UagRF2BK6rQrWz0jKQKpweANEV+RE5tYlOuqnTIev+29B+02uyzt9SynJrMm7Z1+QcPMEyQo8yOTzHrU7hY7ZinEeEPKvsQ6/iNOAEnVsOC4zAXa43JlRjecFANZ2KDNEu9eRMcCY73sBFdkQb003HKdmYPXmpMPj720Ec3320emh3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P32vSrgC2EHL7dU/yRk4FzFH3+2exAtKXXlQ0aNbmoQ=;
 b=kj+xK1n8pDvDdBk9Fc4VTHQpL0Ga+413elpri+rwc/D+dsJ9LabNfla3SqIYbkRNEuKMwXJpkSsBzIKK4XYPhAh7OttNNPL0aDTjY9ectknUT8TLPHe7tlfl+zOj6wTXYe+YjdfBx/zT0nz0yutgES80lvxJsw76Us6jB9EqGRJGHd2FsfsaoLx42H9Y1YEGyqaMHLFw/AtBVDaWhp2evpDFQ23+1pL4VdaXO89xVSLFHhquNCSB1Iv99FzTDU4raAyMHD0Kwc30gsKd7Z1vSWaVEAhyJi/uO9jPI72OW0JVZxWjEjc/W4krqY+Xgdw+nZk/FrOcomayQXJlpgduWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P32vSrgC2EHL7dU/yRk4FzFH3+2exAtKXXlQ0aNbmoQ=;
 b=cOjFuIM0XJMKNu6e7Ys8rBxx7KV2103QifST2GFo3LY6fN0mEI5lquyyRO+0bUFalC/oITFkxca+p25rSMmx1Cpe6+nqsyE+9fSOH1af7CfkeL3WWkOiWZJQZaiw/u0G3O2UDqojwuSiIOIB5i8POH3YoGD4+dXm6VdW1n/3Agg=
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by SN6PR02MB5343.namprd02.prod.outlook.com (2603:10b6:805:71::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 15:58:56 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::d3) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23 via Frontend
 Transport; Tue, 3 May 2022 15:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:58:56 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:58:55 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:58:54 +0100
Received: from [10.71.119.176] (port=54233 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nluvO-0007ES-Ek; Tue, 03 May 2022 16:58:54 +0100
Date: Tue, 3 May 2022 17:58:53 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <frederic.konrad@xilinx.com>
CC: <qemu-devel@nongnu.org>, <alistair@alistair23.me>,
 <edgar.iglesias@gmail.com>, <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>,
 <fkonrad@amd.com>
Subject: Re: [PATCH v1 1/4] xlnx_dp: fix the wrong register size
Message-ID: <YnFRPUVta+8rPEKC@toto>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-2-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220503152545.1100386-2-fkonrad@xilinx.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c31c9f6d-408d-4f8a-87f4-08da2d1dd424
X-MS-TrafficTypeDiagnostic: SN6PR02MB5343:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5343B77C81272D1B82DF6B63ABC09@SN6PR02MB5343.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q4Qpa1VLTtq+zLnXKbCSqOEPaK7/vvKHrQrRxBhPM2YsWkh1kGgCklhnUNymFUIIhD4iT4KeigjTWAqDMTG9uVx6gbdMGbKhwo1XyqXSTB0H/Ftk21lD4pRK5dzB+b6MfOlX4Q1Ee5da2ArWcob+qoixQY44dm3c0nhwz2fiCCC1J/2JzrRZWH0hbv94DKfxLmbDB+uRRQAyuIlncUrdAZb5xruzKqi5UaxX7jN8/9EIQKM5MijzV/oC34K+dczkQdZtZ+2gXMgqCezktGLG2bVej4CoXiZsRJfhRtqUQHWbr7EKnkRynyuRNdv9bZ41r/+n3II71YF0kzCkRHUEhC0q0xpPk4HKp4NSAsdYSCMQ7g13OSR3uisJRxSnvACyr410PKOCfMmLJDksGZmI+7NgGzg/k28YypiINrkUeDMNcjF9XLcjcPimUvqbkQh23D4T8acfw1fj5HQ20wZl1C7sDgzOsvXFuZqxw8fmnT3htaYGQbeQ5GiOVmd69GehcIC9KZvtnMFeu3962zqHpdopqkfycvcTp5k9jBPJbj0xOQ6OU1fUquvSbcsOtBnpfDxGQg20mIqZZhAxtnJZ7FsLvfRcWqIXdvaN+cnGXESstMsBZt+bQBCmZ0udOZ+Ji077VAzPrfjCZp6zf7LRRQHuCZTq91H79//1EcIoARdGByYF11fbxywYUmD6s79Hr9sQ4U8FAWA5UKHNp7lRz6bWpT5f1SBDPlCDXEEIjeB2SqNDzyf/LZzGU1Xa8cJxJdCmUpBN2cKwNFxNaOEXGoaPkLnT0Y1xejFhdKWs/xg=
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(40470700004)(46966006)(36840700001)(6636002)(54906003)(316002)(966005)(83380400001)(2906002)(47076005)(426003)(336012)(5660300002)(82310400005)(8936002)(9786002)(33716001)(36860700001)(70206006)(70586007)(7636003)(508600001)(186003)(40460700003)(4326008)(8676002)(6862004)(9686003)(26005)(356005)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:58:56.0780 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c31c9f6d-408d-4f8a-87f4-08da2d1dd424
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5343
Received-SPF: pass client-ip=2a01:111:f400:fe59::60b;
 envelope-from=edgari@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 03, 2022 at 04:25:42PM +0100, frederic.konrad@xilinx.com wrote:
> From: Frederic Konrad <fkonrad@amd.com>
> 
> The core and the vblend registers size are wrong, they should respectively be
> 0x3B0 and 0x1E0 according to:
>   https://www.xilinx.com/htmldocs/registers/ug1087/ug1087-zynq-ultrascale-registers.html.
> 
> Let's fix that and use macros when creating the mmio region.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Fixes: 58ac482a66d ("introduce xlnx-dp")
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---
>  hw/display/xlnx_dp.c         | 17 ++++++++++-------
>  include/hw/display/xlnx_dp.h |  9 +++++++--
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 9bb781e312..0378570459 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1219,19 +1219,22 @@ static void xlnx_dp_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      XlnxDPState *s = XLNX_DP(obj);
>  
> -    memory_region_init(&s->container, obj, TYPE_XLNX_DP, 0xC050);
> +    memory_region_init(&s->container, obj, TYPE_XLNX_DP, DP_CONTAINER_SIZE);
>  
>      memory_region_init_io(&s->core_iomem, obj, &dp_ops, s, TYPE_XLNX_DP
> -                          ".core", 0x3AF);
> -    memory_region_add_subregion(&s->container, 0x0000, &s->core_iomem);
> +                          ".core", sizeof(s->core_registers));
> +    memory_region_add_subregion(&s->container, DP_CORE_REG_OFFSET,
> +                                &s->core_iomem);
>  
>      memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
> -                          ".v_blend", 0x1DF);
> -    memory_region_add_subregion(&s->container, 0xA000, &s->vblend_iomem);
> +                          ".v_blend", sizeof(s->vblend_registers));
> +    memory_region_add_subregion(&s->container, DP_VBLEND_REG_OFFSET,
> +                                &s->vblend_iomem);
>  
>      memory_region_init_io(&s->avbufm_iomem, obj, &avbufm_ops, s, TYPE_XLNX_DP
> -                          ".av_buffer_manager", 0x238);
> -    memory_region_add_subregion(&s->container, 0xB000, &s->avbufm_iomem);
> +                          ".av_buffer_manager", sizeof(s->avbufm_registers));
> +    memory_region_add_subregion(&s->container, DP_AVBUF_REG_OFFSET,
> +                                &s->avbufm_iomem);
>  
>      memory_region_init_io(&s->audio_iomem, obj, &audio_ops, s, TYPE_XLNX_DP
>                            ".audio", sizeof(s->audio_registers));
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index 8ab4733bb8..1ef5a89ee7 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -39,10 +39,15 @@
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
>  
> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> +#define DP_CORE_REG_OFFSET                  (0x0000)
> +#define DP_CORE_REG_ARRAY_SIZE              (0x3B0 >> 2)
> +#define DP_AVBUF_REG_OFFSET                 (0xB000)
>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
> -#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
> +#define DP_VBLEND_REG_OFFSET                (0xA000)
> +#define DP_VBLEND_REG_ARRAY_SIZE            (0x1E0 >> 2)
> +#define DP_AUDIO_REG_OFFSET                 (0xC000)
>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
> +#define DP_CONTAINER_SIZE                   (0xC050)
>  
>  struct PixmanPlane {
>      pixman_format_code_t format;
> -- 
> 2.25.1
> 

