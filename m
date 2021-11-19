Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4E457503
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:06:40 +0100 (CET)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7LT-0004yO-DE
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7Gx-0008AJ-C3
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:01:59 -0500
Received: from mail-co1nam11on2078.outbound.protection.outlook.com
 ([40.107.220.78]:62235 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1mo7Gu-0003ag-3l
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:01:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROdQ8zAgmU4XxpyuA1Cr6GLMXTEZVaO8njcawuNna7xzE2HNkLvqqTg3fOxE7uyXw9lkzHwT86HWckXkxOMS6RJwba3Um+U0a88CzvAimFgkxe7McAdZASCKBJyFb67agxWI3AV4SXO0orudGz2KbYnNpuoE7Gyz5k3Dqplqhoq5IiOxWox5LHtWHYMcZpdxybjQlV4oPSfCFxnCFw8iXEzB5ggQtPGRFImj6QK77YtXJxWptpb6k1aURg9Dr83K9ersDVyYRpHGfiWIzesIPlB5mRfNC+GDKW6yfx5cRj6cIPa0hIg8ASlmCUfQA2QePJDZstjZiRunPI1USsr5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlPV9/lEkfjsWC2MaZNx8yV2DSJ9TRo3jNe0VvEEMH4=;
 b=h1e9wP+7EXWW6GI/5nOcyNqqXN+/2APA39Rp3/PtUf0tTChYOJDceHDHI8vJjsw1/C8TnK+TD0LVNBKJ+/ZnRARSccDCOkc4BT1MPrVAIaco2GZNuzVGRbuG6cOkb7Ld21OQf8c+3z/8Tb62hLOtKCGmOKczU6bdCQ8i6Q3XSKjAd2iQ5w6L+DscHKvz/zrbq0dV2XC6HIZh4s07D+ifS4YqGXxcX64Pru30VngwsN6W7cLY9OJgwi0ihMFGePfWJvrBl6QYgXBqm1H01BIEhmU2ByeimqF0eZdLcVdOyeP133jirpuWbO0umuFZpEI+vWeTj5rlXyhYoOe/RjKhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlPV9/lEkfjsWC2MaZNx8yV2DSJ9TRo3jNe0VvEEMH4=;
 b=Ac7JLfJesxTv6AWWSHYqQndfrPY1808cW4mbeinqY6T2bV1HEF2aPZQLeOjgDu7C6t/nEwF+LzcR4LwGJLhT8zH5iiRaihWkDejtcoQDRRhiQdTNkHuhIIRqLgpSRZx2BxUauRmYnnhJCXl9DbBmozhGmdPWfNbSGkuf2+L1JTc=
Received: from SN4PR0501CA0100.namprd05.prod.outlook.com
 (2603:10b6:803:42::17) by BYAPR02MB4757.namprd02.prod.outlook.com
 (2603:10b6:a03:47::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 17:01:52 +0000
Received: from SN1NAM02FT0042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42::4) by SN4PR0501CA0100.outlook.office365.com
 (2603:10b6:803:42::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.10 via Frontend
 Transport; Fri, 19 Nov 2021 17:01:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0042.mail.protection.outlook.com (10.97.4.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 17:01:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 09:01:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 09:01:52 -0800
Received: from [10.71.118.100] (port=49790 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mo7Gp-000BHG-77; Fri, 19 Nov 2021 09:01:52 -0800
Date: Fri, 19 Nov 2021 18:01:50 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 4/9] hw/dma: Add the DMA control interface
Message-ID: <20211119170150.GC2341@toto>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
 <20211117141841.4696-5-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211117141841.4696-5-francisco.iglesias@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af47c5ba-1d2e-457e-7fa5-08d9ab7e48b6
X-MS-TrafficTypeDiagnostic: BYAPR02MB4757:
X-Microsoft-Antispam-PRVS: <BYAPR02MB47574C8CC93B9C3F92B7DF43C29C9@BYAPR02MB4757.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/795HNw6ahPj0EcoahCT8d6s2AufvYsMt/5tLN3MvPMeL0s//5dcSN32zaoBXr/EHOnxK1NQ2JR95CfzAOZqlD3u8kq4fWxxLI24A2RF+mKj+ZHyIEzUHsTQBqDaA9jgGlLyctssUKpu/rXNc1dm6IKzpTQkins0rsHAhpLMAeWGfeXXdmKMoSoRpRb33A8ZJVH24vc2LPcV0nTzUVjs2XAK/EVGmhpMtUh4r+XD8xRixduPqk/hc+KZjojKaymusvj/1jDQx7MzYa72wJAulJFynI4PGb9dnYiWTa8o8h8CvmPJpd4DjvkvMiA2BHY5+LTOsLG9NkGTvu7AFkInUpL9iJDDoR1TADwFRMPxf4Dg6ZtUeq/arrKRED3pzXHpRB/4l89Ta84zcQO73l0K6GsMjoHUDnUZahmaQ/Hgfl6iPKu+8YaWOZurzfLWgPFhv0qIt+QKKRsukY5ZJIqX2pn4J3E1CwVxXy7fka5iM2ZuDFTm2+9XowJbpCvLtrwpzrR4wdhXP1rQE1hvXLOsb1w1N10Ep8jDQKwoGCG0nRIJVPsSuuqcogqFuQP6Jm5z2v8Qnsy8PKcCHqihu8zbqiCR73r10sFBRCkUJpAzRQEc4jT7JHzKio513rjROcZXsfAyHk7Cq6LzA4HDueUY/Boz5AbL0VK7uKXz3HGaq2QL1D5Nh3aiSzTh9B5oYgp88TwNBaOFl8wKq15DU4DrA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(36840700001)(46966006)(8676002)(70206006)(70586007)(82310400003)(1076003)(426003)(6636002)(186003)(7636003)(8936002)(54906003)(36906005)(316002)(5660300002)(508600001)(356005)(47076005)(26005)(33716001)(9686003)(336012)(33656002)(2906002)(36860700001)(4326008)(6862004)(9786002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 17:01:52.2984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af47c5ba-1d2e-457e-7fa5-08d9ab7e48b6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4757
Received-SPF: pass client-ip=40.107.220.78; envelope-from=edgar@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

On Wed, Nov 17, 2021 at 02:18:36PM +0000, Francisco Iglesias wrote:
> Add an interface for controlling DMA models that are reused with other
> models. This allows a controlling model to start transfers through the
> DMA while reusing the DMA's handling of transfer state and completion
> signaling.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  hw/dma/dma-ctrl.c         | 31 ++++++++++++++++++++
>  hw/dma/meson.build        |  1 +
>  include/hw/dma/dma-ctrl.h | 74 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 hw/dma/dma-ctrl.c
>  create mode 100644 include/hw/dma/dma-ctrl.h
> 
> diff --git a/hw/dma/dma-ctrl.c b/hw/dma/dma-ctrl.c
> new file mode 100644
> index 0000000000..4a9b68dac1
> --- /dev/null
> +++ b/hw/dma/dma-ctrl.c
> @@ -0,0 +1,31 @@
> +/*
> + * DMA control interface.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +#include "hw/dma/dma-ctrl.h"
> +
> +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                               DmaCtrlNotify *notify, bool start_dma)
> +{
> +    DmaCtrlClass *dcc =  DMA_CTRL_GET_CLASS(dma_ctrl);
> +    dcc->read(dma_ctrl, addr, len, notify, start_dma);
> +}
> +
> +static const TypeInfo dma_ctrl_info = {
> +    .name          = TYPE_DMA_CTRL,
> +    .parent        = TYPE_INTERFACE,
> +    .class_size = sizeof(DmaCtrlClass),
> +};
> +
> +static void dma_ctrl_register_types(void)
> +{
> +    type_register_static(&dma_ctrl_info);
> +}
> +
> +type_init(dma_ctrl_register_types)
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index f3f0661bc3..c0bc134046 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
> +common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl.c'))
> diff --git a/include/hw/dma/dma-ctrl.h b/include/hw/dma/dma-ctrl.h
> new file mode 100644
> index 0000000000..498469395f
> --- /dev/null
> +++ b/include/hw/dma/dma-ctrl.h
> @@ -0,0 +1,74 @@
> +/*
> + * DMA control interface.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_DMA_CTRL_H
> +#define HW_DMA_CTRL_H
> +
> +#include "qemu-common.h"
> +#include "hw/hw.h"
> +#include "qom/object.h"
> +
> +#define TYPE_DMA_CTRL "dma-ctrl"
> +
> +#define DMA_CTRL_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(DmaCtrlClass, (klass), TYPE_DMA_CTRL)
> +#define DMA_CTRL_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(DmaCtrlClass, (obj), TYPE_DMA_CTRL)
> +#define DMA_CTRL(obj) \
> +     INTERFACE_CHECK(DmaCtrl, (obj), TYPE_DMA_CTRL)
> +
> +typedef void (*dmactrl_notify_fn)(void *opaque);
> +
> +typedef struct DmaCtrlNotify {
> +    void *opaque;
> +    dmactrl_notify_fn cb;
> +} DmaCtrlNotify;
> +
> +typedef struct DmaCtrl {
> +    Object Parent;
> +} DmaCtrl;
> +
> +typedef struct DmaCtrlClass {
> +    InterfaceClass parent;
> +
> +    /*
> +     * read: Start a read transfer on the DMA implementing the DMA control
> +     * interface
> +     *
> +     * @dma_ctrl: the DMA implementing this interface
> +     * @addr: the address to read
> +     * @len: the amount of bytes to read at 'addr'
> +     * @notify: the structure containg a callback to call and opaque pointer
> +     * to pass the callback when the transfer has been completed
> +     * @start_dma: true for starting the DMA transfer and false for just
> +     * refilling and proceding an already started transfer
> +     */
> +    void (*read)(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                 DmaCtrlNotify *notify, bool start_dma);
> +} DmaCtrlClass;
> +
> +/*
> + * Start a read transfer on a DMA implementing the DMA control interface.
> + * The DMA will notify the caller that 'len' bytes have been read at 'addr'
> + * through the callback in the DmaCtrlNotify structure. For allowing refilling
> + * an already started transfer the DMA notifies the caller before considering
> + * the transfer done (e.g. before setting done flags, generating IRQs and
> + * modifying other relevant internal device state).
> + *
> + * @dma_ctrl: the DMA implementing this interface
> + * @addr: the address to read
> + * @len: the amount of bytes to read at 'addr'
> + * @notify: the structure containing a callback to call and opaque pointer
> + * to pass the callback when the transfer has been completed
> + * @start_dma: true for starting the DMA transfer and false for just
> + * refilling and proceding an already started transfer
> + */
> +void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
> +                   DmaCtrlNotify *notify, bool start_dma);
> +
> +#endif /* HW_DMA_CTRL_H */
> -- 
> 2.11.0
> 

