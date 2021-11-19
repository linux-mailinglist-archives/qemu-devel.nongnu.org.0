Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53B45750C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:10:38 +0100 (CET)
Received: from localhost ([::1]:52244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7PJ-0002LB-BQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7IY-0002yX-SJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:03:39 -0500
Received: from mail-bn8nam08on2082.outbound.protection.outlook.com
 ([40.107.100.82]:37888 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7IW-0003qv-GJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:03:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSF3T4fICck7SWv85nNFcaewYF+rjd8xsILIlQ72QFSF9Stct1ZSklbvpbhFvn2j+9TSD+lwNzwnjvfrp7emrxA84u+4o+skmd4ubIiTIWPjwuXw7do15MbuKFhR1Woba8XeFM25to548I1bzYxN6yHQUlzV0xXBoi83KcQ81sObO46EgT9xf0orLwzUiJj3qotyXsjXf3ck0/bgWbGaF8WqOWngLV8dSSD+gmMqNdRWujyNnDRD9YkrEhkEqPMSInqsFu1z9UIe44eUBhvmWCl8Oj4PhwcvKfjY9Mp91zsr4sIv8qyLk6cOKHfKoAyHmkOm5QJR3NO+IZhAzcTWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OucaBJbOg3IK+PKHGFNq8u2pNado8Gz8R74KvAkwNpc=;
 b=FhWigdVOdFsec+9UVLrN+MMVX3sCR/yMD25Y0I/M9akKZ7DXHCATVeBHhQlyXRTn9aTuY3faQtzpVPc5sEQtOsiTtzCdEn16eq78e94kY0P4LA0TZAbUdZraW0K5Na3UY0WSyOUUoOIO3chG5Nz6i3GGMTPqFUPQY2nvXR76XrvFvgay+6YlSoUFscDomrNl/fGBkZ9sIrZ9sDFu3QXGoSQyvGvemqzkZHit0wrkqnO9LSNpRqZxl+k0lh0omwBUXVsriBrFism6AAQ55EvTZjb8NOVJ0Q/6CQ/B3aAV8Cul/l+6VVLQ3B3eGSB437fy6vIM3Yh/pBzYpyKerQIgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OucaBJbOg3IK+PKHGFNq8u2pNado8Gz8R74KvAkwNpc=;
 b=ofY1Etx3tvDz4WX/lJu14rC7Ty9F4o22x8o4ymnANgVZ0OfmfL0GWN2eggumZJbECD4d2JVmZJl9nyoNQgrfItWVQSdRGP+AW+26sH+1kSM+UVz96Pyp+N3DUrqRuxFDK4HhwDl8xJes16rp3u9KzO4TF54OMhRxYtQrCn+MW+4=
Received: from BN8PR16CA0003.namprd16.prod.outlook.com (2603:10b6:408:4c::16)
 by PH0PR02MB7143.namprd02.prod.outlook.com (2603:10b6:510:1f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 17:03:33 +0000
Received: from BN1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::5d) by BN8PR16CA0003.outlook.office365.com
 (2603:10b6:408:4c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 17:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT061.mail.protection.outlook.com (10.13.3.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 17:03:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 09:03:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 09:03:32 -0800
Received: from [10.71.118.100] (port=49815 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7IS-000BPm-04; Fri, 19 Nov 2021 09:03:32 -0800
Date: Fri, 19 Nov 2021 18:03:30 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 5/9] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Message-ID: <20211119170330.GD2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-6-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-6-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a79f3a8-4475-44d9-7e50-08d9ab7e84d3
X-MS-TrafficTypeDiagnostic: PH0PR02MB7143:
X-Microsoft-Antispam-PRVS: <PH0PR02MB71430DFC6127828EB66EDA56C29C9@PH0PR02MB7143.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2XIjCwSzpBgzn4GOSnh9HQimJPiy6sm2mnSsSOHVc14j3KC7n4VAUvIict5c6/xOyrgpQBrLw8V+5Si+K3r8d9HDETDYaDEmIg1U3Y6Ow8zWIpPxWMUBUnIW+yhYcuDbB3GRA6oUavzdCUD17a0u037CQl2Xa83+Kz6vbfBy6XaRj/2cK1Br7Sh9nUOunPdT1ALooMtT/ZBAMlBEkH5BQDlUUtYky3jDUhduzOyBl6ZmoVYzJ4cqSCoT3Zpk3LG4z8TqPaoG1ZeHaDniNryaf8QYzvM30PnAN9bUema4XZKsD3k5bQRMG2UAMj79MZsa/41d1UG1Bq6iJwYrRagNleCYbHR9i79xrc1ePHtQxHVi264ml4bjLTpXWiS/40Eh66f2/6vDDJkV9guJkCvco2Uivdhc0Sgo1rOzB6MUO2pk2tQnYZux8HHA5GNjB57Jz1/tPPGtITfLSuYEhbh6E4/5oUyW6cntDXoPUFnGhZVHvfLfe1p+0jVZ+HV/7/XbbPEpu+5jq7orjnkMqw2sjWRFte83JFRV0R5Z/DqrZRxUETPMgH0Z4qdnMkUMzQAxHzwOsQnpz0Bv681o312PnmurUTgYHSMVsAiv1qB/ahkWP4Mn5Rbk3QVFiI+aaze4qBekTYiyGTZkYZwOpj1pcSnpiWLL9WzyqAhc+Ud18cBUCYKBVrbJIvoFqYW9ykHpksZp2Jcx6eGhuX3Owwocw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(83380400001)(33656002)(9686003)(186003)(5660300002)(4326008)(9786002)(54906003)(336012)(26005)(426003)(2906002)(8936002)(508600001)(356005)(33716001)(8676002)(316002)(36906005)(82310400003)(47076005)(70586007)(6636002)(6862004)(36860700001)(7636003)(70206006)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 17:03:33.0918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a79f3a8-4475-44d9-7e50-08d9ab7e84d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7143
Received-SPF: pass client-ip=40.107.100.82; envelope-from=edgar@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

On Wed, Nov 17, 2021 at 02:18:37PM +0000, Francisco Iglesias wrote:
> Implement the DMA control interface for allowing control of DMA operations
> from inside models that contain instances of (and reuse) the Xilinx CSU
> DMA.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/dma/xlnx_csu_dma.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/dma/xlnx_csu_dma.h |  4 ++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 896bb3574d..9ed6e82225 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -277,6 +277,11 @@ static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
>          s->regs[R_ADDR_MSB] = dst >> 32;
>      }
>  
> +    /* Notify dma-ctrl clients when the transfer has been completed */
> +    if (size == 0 && s->dma_ctrl_notify) {
> +        s->dma_ctrl_notify(s->dma_ctrl_opaque);
> +    }
> +
>      if (size == 0) {
>          xlnx_csu_dma_done(s);
>      }
> @@ -472,6 +477,29 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
>      return val & R_ADDR_MSB_ADDR_MSB_MASK;
>  }
>  
> +static void xlnx_csu_dma_dma_ctrl_read(DmaCtrl *dma_ctrl, hwaddr addr,
> +                                         uint32_t len, DmaCtrlNotify *notify,
> +                                         bool start_dma)
> +{
> +    XlnxCSUDMA *s = XLNX_CSU_DMA(dma_ctrl);
> +    RegisterInfo *reg = &s->regs_info[R_SIZE];
> +    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
> +
> +    s->regs[R_ADDR] = addr;
> +    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
> +
> +    if (notify) {
> +        s->dma_ctrl_notify = notify->cb;
> +        s->dma_ctrl_opaque = notify->opaque;
> +    }
> +
> +    if (start_dma) {
> +        register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
> +    } else {
> +        s->regs[R_SIZE] = len;
> +    }
> +}
> +
>  static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
>  #define DMACH_REGINFO(NAME, snd)                                              \
>      (const RegisterAccessInfo []) {                                           \
> @@ -696,6 +724,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
> +    DmaCtrlClass *dcc = DMA_CTRL_CLASS(klass);
>  
>      dc->reset = xlnx_csu_dma_reset;
>      dc->realize = xlnx_csu_dma_realize;
> @@ -704,6 +733,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
>  
>      ssc->push = xlnx_csu_dma_stream_push;
>      ssc->can_push = xlnx_csu_dma_stream_can_push;
> +
> +    dcc->read = xlnx_csu_dma_dma_ctrl_read;
>  }
>  
>  static void xlnx_csu_dma_init(Object *obj)
> @@ -731,6 +762,7 @@ static const TypeInfo xlnx_csu_dma_info = {
>      .instance_init = xlnx_csu_dma_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_STREAM_SINK },
> +        { TYPE_DMA_CTRL },
>          { }
>      }
>  };
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> index 8c39e46f58..f7f086593c 100644
> --- a/include/hw/dma/xlnx_csu_dma.h
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -23,6 +23,7 @@
>  
>  #include "hw/ptimer.h"
>  #include "hw/stream.h"
> +#include "hw/dma/dma-ctrl.h"
>  
>  #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
>  
> @@ -45,6 +46,9 @@ typedef struct XlnxCSUDMA {
>      StreamCanPushNotifyFn notify;
>      void *notify_opaque;
>  
> +    dmactrl_notify_fn dma_ctrl_notify;
> +    void *dma_ctrl_opaque;
> +
>      uint32_t regs[XLNX_CSU_DMA_R_MAX];
>      RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
>  } XlnxCSUDMA;
> -- 
> 2.11.0
> 

