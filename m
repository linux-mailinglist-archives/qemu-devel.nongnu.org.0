Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245845756D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:25:27 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7de-0006Vy-2L
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7FB-0006wv-QR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:00:17 -0500
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com
 ([40.107.92.55]:58526 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7F9-0003GO-01
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:00:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPvDuQjXFexYHjEL2VPZWiVef2xErqVgEZefcb4J5Z5vwh3QE97pd5kxRNxMr5GQ4V57/cZZY+gQF+6OT/v+diRZjJ7LMkzzhGF7Gjsc3Z5r+pJbnVuE9ra3D74E9uAZ541pXTBiP675kxsRQMeGAXihO2FwyTjXPMpbq7SbWKDA9sHmpiHTWohRtEmmlO4y1SAgAy8Vr7B2Sc2eUlCeg65I0ao6SX+3WN1DZLxeNlVDovk4yYc4Up8GhxaXWtFGBf4+GF4QswGs9H7m+dTlEGzv4iiO6pz3i8DQmSvT9wVbMZDZpEPPhKJ8VxdR5F/wq7IqCcBHI7ASoWfrSsu2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kf8S/NlF2SBjv44Qy5izkzKj0QlqFFuNxzwE8HrNDTw=;
 b=dW3sGA+51lmht1ldbyn6cnvPar0Jo+OCfUd4M6uqZScI+MbkmfvqKswsRF4fxUzyGrUu2cKLc1FdWZ9iTXlMpFoR1AOT6H3TBXrR6r2tYF1Cz7OSzu136AoYstJONcxo400IUSc+QlyQWge9XXwlBji9ga0l+E1Avqug2nqnKBy7dm82a1IziMdHm7GfPmcxthreNc0RBZryYedOB2gEpF2q+qy9J22lX1Tg7aEEKIqAOv8N9RLBGoB0dnk9vEDvYuKKKy3nVPLhrA37TlqYFuJP2Jgo1/s1cV3cmGMNZLXnyJZrAqENcsAR7u83za27eYO896p7Klt7Sc0Z5Uvq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf8S/NlF2SBjv44Qy5izkzKj0QlqFFuNxzwE8HrNDTw=;
 b=TsflyWnjg95dJG5ODsp440TcmMe3QW2OcXlGCkw4tl2lMPWQIDJpBdFGrfWMBveVLw20C0klX2dH/ZQkCioHllaQgDsjLr6wni3YwKGiubYPKmSL6U85pdL4u7Llino/oMBkvlM/z2foIuQzJBPGe+C+KIRmJaCt85axQ/abOe4=
Received: from BN6PR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:405:4c::34) by CY4PR0201MB3539.namprd02.prod.outlook.com
 (2603:10b6:910:94::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 16:59:53 +0000
Received: from BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::d5) by BN6PR1201CA0024.outlook.office365.com
 (2603:10b6:405:4c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 16:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT047.mail.protection.outlook.com (10.13.3.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 16:59:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 08:59:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 08:59:50 -0800
Received: from [10.71.118.100] (port=49744 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7Er-000AZb-TB; Fri, 19 Nov 2021 08:59:50 -0800
Date: Fri, 19 Nov 2021 17:59:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 2/9] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Message-ID: <20211119165948.GB2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-3-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-3-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a398a43-8043-423d-1e60-08d9ab7e015b
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3539:
X-Microsoft-Antispam-PRVS: <CY4PR0201MB35397DD570EABBFB757F6D1AC29C9@CY4PR0201MB3539.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggsEKiDXKCrN1Lic7lCGnEidCM0FLNo8DYzfUYEuXTkR3qLNmyppkKBjnTWaW0wd8ZZGn/pObLbuyYIlUXTvAqPiCThlH2lPiDLaF2FGnJLlMJnfq1+7/gu+wrD2alW7yt+AV/dc2ojgQuBqHcaJ7WKM+C9PRZ4taIVG2bTOz25daqs/RbYa0MOlWV+bayEFe3EZ6jtzrumoSDn834bp1lwZIN6XkejgKQMOVk6l0AGiKPyXpsz76NSUmSKe6KFud0LOrTplZFILeE95+jWtqxL7RQh4/6iZCUu+9r88/dBNuTwONcTfExz2tie074jZnL/rN21kxSPhXNz9sZ8Xpw6k4DxuwXj763w4/8t/ekFHXDZEbHKBtcEGcErNUtoBgugs4Q/6FP81CzXkP2zlWqNGifu4FFIyn6cRrOMlUG2yAvpHkg73Bw4hPeVSildUW7HvV4H18tQVM2mGyzd29n0f/UuAsQExOMUGNh9omUIP4lEoCY5AjWmeIU0LdTrOA51bENynG0P3za4iN6QUKUZJCZruxfwsBuqYU5pJzLSqEAmBZ2ERw0WNaajjwVOP2B4PFYt4FYur3RWCJz15QGAUrsxWPwdWGs36L6x/pvjhldhRUNVFhxHfL7Z9Ir+SwUL2NoKJptWp+C14JNE2tNyhTteEVqPts5P7mM4y1mfNs/9dNHbgTfaxzD9AIS3GFbzulb0qxyAfLduE8x1UKg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(46966006)(36840700001)(33716001)(508600001)(6636002)(336012)(36906005)(9786002)(54906003)(33656002)(316002)(36860700001)(4326008)(7636003)(426003)(1076003)(356005)(2906002)(5660300002)(8936002)(6862004)(82310400003)(47076005)(9686003)(26005)(70206006)(8676002)(70586007)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 16:59:52.5204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a398a43-8043-423d-1e60-08d9ab7e015b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3539
Received-SPF: pass client-ip=40.107.92.55; envelope-from=edgar@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Wed, Nov 17, 2021 at 02:18:34PM +0000, Francisco Iglesias wrote:
> Connect Versal's PMC SLCR (system-level control registers) model.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
>  include/hw/arm/xlnx-versal.h |  6 ++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b2705b6925..08e250945f 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -369,6 +369,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
>      sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
>  }
>  
> +static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +
> +    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
> +                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
> +
> +    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
> +        sysbus_mmio_get_region(sbd, 0));
> +
> +    sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
> +}
> +
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -459,6 +476,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
>      versal_create_xrams(s, pic);
>      versal_create_bbram(s, pic);
>      versal_create_efuse(s, pic);
> +    versal_create_pmc_iou_slcr(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>  
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 895ba12c61..729c093dfc 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -26,6 +26,7 @@
>  #include "hw/misc/xlnx-versal-xramc.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-versal-efuse.h"
> +#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -78,6 +79,7 @@ struct Versal {
>      struct {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
> +            XlnxVersalPmcIouSlcr slcr;
>          } iou;
>  
>          XlnxZynqMPRTC rtc;
> @@ -113,6 +115,7 @@ struct Versal {
>  #define VERSAL_XRAM_IRQ_0          79
>  #define VERSAL_BBRAM_APB_IRQ_0     121
>  #define VERSAL_RTC_APB_ERR_IRQ     121
> +#define VERSAL_PMC_IOU_SLCR_IRQ    121
>  #define VERSAL_SD0_IRQ_0           126
>  #define VERSAL_EFUSE_IRQ           139
>  #define VERSAL_RTC_ALARM_IRQ       142
> @@ -178,6 +181,9 @@ struct Versal {
>  #define MM_FPD_FPD_APU              0xfd5c0000
>  #define MM_FPD_FPD_APU_SIZE         0x100
>  
> +#define MM_PMC_PMC_IOU_SLCR         0xf1060000
> +#define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
> +
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
>  #define MM_PMC_BBRAM_CTRL           0xf11f0000
> -- 
> 2.11.0
> 

