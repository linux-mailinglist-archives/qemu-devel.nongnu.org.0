Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1251894C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:05:42 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlv1x-00073P-2L
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluw2-00044j-15; Tue, 03 May 2022 11:59:34 -0400
Received: from mail-dm6nam12on20616.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::616]:48513
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nluvx-0001nv-U0; Tue, 03 May 2022 11:59:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxw9GJKSGD7MZj5KsADO8fmKtIwQnraEknVhkMe+SFExcYmz9+mZNam9k8ffmqfMtFnOT21ohkz5i90O1DnqTXEl0HVoKlPVvn1QZF6RwWyxIm5Tug9FRtY1UQDyzwBPkIveSmb96x0nzucxDPJ/kChFw/mNUm6bIAUMhKL67wvX4572HiGymEZiDm76r6bVHldMkmgUNZSTL9bHhHgdqwcBxjXlBX/vuZo8+HnduIY+DmRaJbU4f9nPA/VMwPuTkxsG+g0tbtUsFKHMoUuQlp23GhO6AnQPPUi2hkG2PvQbeROcpG1Ff/3TsWtGvsJ1kJG3RqZqk36oMMmpMz+R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7omglxDdpCk0VFCl5xcmjri86BR5tzkDtHY+wl11qM=;
 b=B/oxMNXq/aA19nnCCTzqyy/0WLXJEKEUzmyktuOQnK4mejhGMJqFxNYmE4iuxk74al/7ioa+6f9WcctRJwT1EP4ISTlO5bLVHM+ZxCBq/fW/hk13OLR4GZbOYvCX4gVRQ6CMnFp8njI5JlooXYllBmJbP6UV4JyLvBytVjgq1JGG/qjZHVK5IzhjdjPT2+jiRGccjhkx4I8eetKSmFslm+MrbjrURlmuJdQx/fFikDMIqxqVxsJCeEBXWCZEam5Z4c6RPLiAWgfi95iG98BXVTxLVhOyLDZifffMUcqlZMl5jc5lylpCR901lZgzWTTqZPYeeirDhRP1H6ZmqXzprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7omglxDdpCk0VFCl5xcmjri86BR5tzkDtHY+wl11qM=;
 b=l7kXst/X7gZ6NiY5d0dX3+y4P+nzcQV/SYIRCWkMjxLtvp6GzGoelEUQrD/zRMLaJVXl3uOuagYCRNq6momsJyoP173nyQ6qAtv4Cb1zx0WvRA0fJYvqLFpV2ETveZphlxDF0VmlkGc/hxGZVHMPwr5/QdtJKX+hZGRjxsJIbgM=
Received: from DM6PR14CA0038.namprd14.prod.outlook.com (2603:10b6:5:18f::15)
 by BY5PR02MB6273.namprd02.prod.outlook.com (2603:10b6:a03:1fb::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 15:59:25 +0000
Received: from DM3NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::cf) by DM6PR14CA0038.outlook.office365.com
 (2603:10b6:5:18f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23 via Frontend
 Transport; Tue, 3 May 2022 15:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT064.mail.protection.outlook.com (10.13.4.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:59:24 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:59:23 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:59:23 +0100
Received: from [10.71.119.176] (port=12625 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nluvq-00040d-Jk; Tue, 03 May 2022 16:59:23 +0100
Date: Tue, 3 May 2022 17:59:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <frederic.konrad@xilinx.com>
CC: <qemu-devel@nongnu.org>, <alistair@alistair23.me>,
 <edgar.iglesias@gmail.com>, <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>,
 <fkonrad@amd.com>, Sai Pavan Boddu <saipava@xilinx.com>
Subject: Re: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
Message-ID: <YnFRWZVGUP7vNQh/@toto>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-3-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220503152545.1100386-3-fkonrad@xilinx.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca05e312-d4e0-4ae3-5629-08da2d1de556
X-MS-TrafficTypeDiagnostic: BY5PR02MB6273:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6273A8EE134F21B66C5818F7ABC09@BY5PR02MB6273.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YModXzUpSU60jH+Yc/9RvhCiPB+2PzRJz4XnaVyezBamwfufBM3rQW3R8cmn0MXIFHmrFP4MGUIaYTlPyLhbrlAEcknRJ4nu8ha72VbiPeyQ3MdRK7O9rLoghG0cpvP+4V4eW+Lo1jwZVtKiuXlCgY954KN1w+14umliz0yu+e6U61jz3BiaCRwN3vYgd7xnw3lRJIFrS7eYtgftuhMtlCFMEQzyUyETt/riEz8/utC7HbcIMfaf9rouje7UjtnPD7uyN9s3na8ntH7bStl5XhJlRfakJ+72NqPTwKn6ygIC+BVsnSbs2dnr8ckBqpv3NfyZQ8Ed1scxhYsz7EcktcVLFufdYdE/sWVIQT4Wc/25/x9vA0fvCttKKsKpJX+SPBnVGDmktC35b/ywlsrKX0dcu04+R0S9zx3NYHjqElmy9Dl2ZCZBC+XqrZ4DrC3zEqAl6WCCM+1pQH75Eo14zCpDoPxB5CNSodX8Tdn/5BLFHX+7GWQ+Z2YPOpPSZDWrqdZtJ3/4jb0Jdx/xF05gRZqrviiKn+03tIDiUQ7VRJcERSiqHIg1t531vL+Svb1v6HAwSkvHjgljgxwy055p4iSBkJ9d5I/Y/zLihMAKxps/Wj5bPrzlb1QagbZY9KdW4rx6o06Jz6RnbWW82Kpf40u+l7RgUC4qVJvBWXNjLBYmcfcFX1LnP06p0SB4wxCj
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(40470700004)(46966006)(36840700001)(5660300002)(8936002)(70586007)(8676002)(70206006)(316002)(9786002)(4326008)(6862004)(426003)(336012)(47076005)(356005)(2906002)(7636003)(40460700003)(107886003)(186003)(36860700001)(6636002)(54906003)(82310400005)(33716001)(83380400001)(508600001)(26005)(9686003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:59:24.9101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca05e312-d4e0-4ae3-5629-08da2d1de556
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6273
Received-SPF: pass client-ip=2a01:111:f400:fe59::616;
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

On Tue, May 03, 2022 at 04:25:43PM +0100, frederic.konrad@xilinx.com wrote:
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> 
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

 
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---
>  hw/display/xlnx_dp.c         | 24 +++++++++++++++++++++---
>  include/hw/display/xlnx_dp.h |  3 +++
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 0378570459..984b0a6bb9 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -114,6 +114,7 @@
>  #define DP_TX_N_AUD                         (0x032C >> 2)
>  #define DP_TX_AUDIO_EXT_DATA(n)             ((0x0330 + 4 * n) >> 2)
>  #define DP_INT_STATUS                       (0x03A0 >> 2)
> +#define DP_INT_VBLNK_START                  (1 << 13)
>  #define DP_INT_MASK                         (0x03A4 >> 2)
>  #define DP_INT_EN                           (0x03A8 >> 2)
>  #define DP_INT_DS                           (0x03AC >> 2)
> @@ -773,6 +774,14 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          break;
>      case DP_TRANSMITTER_ENABLE:
>          s->core_registers[offset] = value & 0x01;
> +        ptimer_transaction_begin(s->vblank);
> +        if (value & 0x1) {
> +            ptimer_set_limit(s->vblank, 1, 1);
> +            ptimer_run(s->vblank, 0);
> +        } else {
> +            ptimer_stop(s->vblank);
> +        }
> +        ptimer_transaction_commit(s->vblank);
>          break;
>      case DP_FORCE_SCRAMBLER_RESET:
>          /*
> @@ -1177,9 +1186,6 @@ static void xlnx_dp_update_display(void *opaque)
>          return;
>      }
>  
> -    s->core_registers[DP_INT_STATUS] |= (1 << 13);
> -    xlnx_dp_update_irq(s);
> -
>      xlnx_dpdma_trigger_vsync_irq(s->dpdma);
>  
>      /*
> @@ -1275,6 +1281,14 @@ static void xlnx_dp_finalize(Object *obj)
>      fifo8_destroy(&s->rx_fifo);
>  }
>  
> +static void vblank_hit(void *opaque)
> +{
> +    XlnxDPState *s = XLNX_DP(opaque);
> +
> +    s->core_registers[DP_INT_STATUS] |= DP_INT_VBLNK_START;
> +    xlnx_dp_update_irq(s);
> +}
> +
>  static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>  {
>      XlnxDPState *s = XLNX_DP(dev);
> @@ -1309,6 +1323,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>                                             &as);
>      AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
>      xlnx_dp_audio_activate(s);
> +    s->vblank = ptimer_init(vblank_hit, s, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(s->vblank);
> +    ptimer_set_freq(s->vblank, 30);
> +    ptimer_transaction_commit(s->vblank);
>  }
>  
>  static void xlnx_dp_reset(DeviceState *dev)
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index 1ef5a89ee7..e86a87f235 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -35,6 +35,7 @@
>  #include "hw/dma/xlnx_dpdma.h"
>  #include "audio/audio.h"
>  #include "qom/object.h"
> +#include "hw/ptimer.h"
>  
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
> @@ -107,6 +108,8 @@ struct XlnxDPState {
>       */
>      DPCDState *dpcd;
>      I2CDDCState *edid;
> +
> +    ptimer_state *vblank;
>  };
>  
>  #define TYPE_XLNX_DP "xlnx.v-dp"
> -- 
> 2.25.1
> 

