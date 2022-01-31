Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD04A4B23
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:59:18 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZ5J-00021l-3n
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYt7-0001Yn-6Y; Mon, 31 Jan 2022 10:46:43 -0500
Received: from mail-co1nam11on2043.outbound.protection.outlook.com
 ([40.107.220.43]:41825 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYt3-0002Fj-8D; Mon, 31 Jan 2022 10:46:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lauV73/l0D1JrL4u5Fsmog0+NJW9HN6SF60o0M2seds2kJWmQM+dnZAns7bKFtISmhJnr5JxUAz3nSbsKZD8ugS4dQ/kl12PRjmZ5Cey00b2+sELVd0/6mjgZGuJqE0HnI/QAvcWnQ+Pp9tziBOasarIZ0HwoHzXC0ltYVxXPXoejLOxoJIRECCC4H5fy2dJcWs2XG52lfFVl0As1YQB6aN0ZgKlkHAjLc1hXK0v7vNriW9QiKU9f/DyxKNEW8WdcwHU/JugM+XB/qowZl9eb5qpc51idEC/t4TGTIvS5wPQkqsI0/Eacc04KloWHLMK0fGGUzvCQNDaGO1Ed+/uIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNG784fOpVWkkdkFBc9nJ6PNWivAt46amfUe6gk3+FQ=;
 b=FQcDQmEoMSpG1HfYZ6OeNgzTuz0faM9QRtLsphVIu0h46KwB5wr/DLgbbY9U9BLVIpk7zGiSL0eWQiWza3w/NSLlhzS3vuGZb/JG3RuCA0LwRWWh5EBqdNaR7wIYxPr7a5D7nDZwdipnLa9OlUHCvDgIIe5VmHAEyFFZMdjGVDmK94hvsjaWE/ptESas/zRtjQ1BFm6cq43nZDVT6dHKPyVISdvd0fkJ+f//409dDBWMqtOlE9MhjguUClrcFqC1IxJCjrPsk3qbcuLO2WEMO/5QM/09KmeDOaBhZBBTUhBlve2OFSv7QEzTTEwh8UPbcZP6uLDZ6yIR8p94OxC5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNG784fOpVWkkdkFBc9nJ6PNWivAt46amfUe6gk3+FQ=;
 b=QE7d1PfIjndVO11j94nIKfSpwvJ1gd4q3aWa3OText1EmuuWWCM/3yXX4k4TZkzA6rgs+WsxnkUprw+oD2L0viBwGY6jBk9WzFFlYhJb+vXYHjRmk1GtZJzy9XpqQNhyL8fy86cjqMrPkPQYRrvJA7MARG/Gi0QL12/2zP4oAH8=
Received: from SN6PR04CA0080.namprd04.prod.outlook.com (2603:10b6:805:f2::21)
 by BN0PR02MB8240.namprd02.prod.outlook.com (2603:10b6:408:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 15:46:32 +0000
Received: from SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::61) by SN6PR04CA0080.outlook.office365.com
 (2603:10b6:805:f2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Mon, 31 Jan 2022 15:46:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0018.mail.protection.outlook.com (10.97.5.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 15:46:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 07:46:31 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 07:46:31 -0800
Received: from [10.23.120.116] (port=56685 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nEYsw-000DjP-Qt; Mon, 31 Jan 2022 07:46:31 -0800
Date: Mon, 31 Jan 2022 15:46:27 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Message-ID: <20220131154626.gw66ugajpgebtt4r@debian>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-6-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3285101-019e-467c-df50-08d9e4d0da8c
X-MS-TrafficTypeDiagnostic: BN0PR02MB8240:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB82402F0D0EDF4DDB76927361AD259@BN0PR02MB8240.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkP9YfDrvad2lhlrrJAvOv30O4V5X86defJBA5G+M8f++CvNDKlf9xm4mMpCD0ftAjtmboBfZ8pcYWV+zD4hiZS5ex+47S9WUbtdde+aQ889Gsn9bX20YYovTp4QbcQWCUFgQQorkd7EW06p2UyhrO+fj3cH9v1CAPGxDfaTJbAmCBnkEKcgCv9fhuPqlegbAnRGOwHqQ8VYDaarjT5Y44P4eILgSfhz8k9X77b8x9his8Mo6DRl86TMCNg7QBrY/2OB59OmVVADWvJpQeexzbKObFusyEE2bXNNScnuTRHuJ1genjnGCE40q5wnjnMeQVRHrXtY+pHH/GSdgezDQtKmVAw6gZCwY2inPya4uA07hCTLVpf62D/nFl1q5ODhAbFgr9YSK1amPeypdgZBmUxuSeSMKYh+mxWiyIF4u5XDwIN2+Pe1XISq/5iBC3ZzUtdm+7+Ft0gkrer4ZtGHieYM3ZeDTMuibuEGxQ/645DPZffHk97uK1cyue1hJ9En097SOWzAW8xMOQAPGVGT4q8cOkk/UF0BX0hHXIvQ6TQuHimnDIGkmkfMZ8aX6njzjaRv6bHscFOROx7yc1IS11qE451mo6+cNlIPe0KwvJ8l3taXbF6YakzMswcgae2g8K6i7Z1b5Flvh0iM3iJCUAgON057CBcn160KCsjv6UY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(30864003)(44832011)(6666004)(54906003)(9576002)(9786002)(6916009)(9686003)(1076003)(70206006)(70586007)(26005)(186003)(5660300002)(426003)(316002)(336012)(508600001)(7636003)(107886003)(4326008)(8676002)(2906002)(82310400004)(8936002)(83380400001)(33716001)(47076005)(356005)(36860700001)(309714004)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:46:31.9850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3285101-019e-467c-df50-08d9e4d0da8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8240
Received-SPF: pass client-ip=40.107.220.43; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Hi Edgar,

Some minor comments again, otherwise it looks good to me!

On Mon, Jan 31, 2022 at 12:12:05AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add a model of the Xilinx ZynqMP APU Control.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
>  hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
>  hw/misc/meson.build                    |   1 +
>  3 files changed, 349 insertions(+)
>  create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
>  create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
> 
> diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> new file mode 100644
> index 0000000000..44bf264cef
> --- /dev/null
> +++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
> @@ -0,0 +1,91 @@
> +/*
> + * QEMU model of ZynqMP APU Control.
> + *
> + * Copyright (c) 2013-2022 Xilinx Inc
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
> + * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + *
> + */
> +

Include guards are missing here again.

> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "target/arm/cpu.h"
> +
> +#define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
> +
> +#define XLNX_ZYNQMP_APU(obj) \
> +     OBJECT_CHECK(XlnxZynqMPAPUCtrl, (obj), TYPE_XLNX_ZYNQMP_APU_CTRL)
> +
> +REG32(APU_ERR_CTRL, 0x0)
> +    FIELD(APU_ERR_CTRL, PSLVERR, 0, 1)
> +REG32(ISR, 0x10)
> +    FIELD(ISR, INV_APB, 0, 1)
> +REG32(IMR, 0x14)
> +    FIELD(IMR, INV_APB, 0, 1)
> +REG32(IEN, 0x18)
> +    FIELD(IEN, INV_APB, 0, 1)
> +REG32(IDS, 0x1c)
> +    FIELD(IDS, INV_APB, 0, 1)
> +REG32(CONFIG_0, 0x20)
> +    FIELD(CONFIG_0, CFGTE, 24, 4)
> +    FIELD(CONFIG_0, CFGEND, 16, 4)
> +    FIELD(CONFIG_0, VINITHI, 8, 4)
> +    FIELD(CONFIG_0, AA64NAA32, 0, 4)
> +REG32(CONFIG_1, 0x24)
> +    FIELD(CONFIG_1, L2RSTDISABLE, 29, 1)
> +    FIELD(CONFIG_1, L1RSTDISABLE, 28, 1)
> +    FIELD(CONFIG_1, CP15DISABLE, 0, 4)
> +REG32(RVBARADDR0L, 0x40)
> +    FIELD(RVBARADDR0L, ADDR, 2, 30)
> +REG32(RVBARADDR0H, 0x44)
> +    FIELD(RVBARADDR0H, ADDR, 0, 8)
> +REG32(RVBARADDR1L, 0x48)
> +    FIELD(RVBARADDR1L, ADDR, 2, 30)
> +REG32(RVBARADDR1H, 0x4c)
> +    FIELD(RVBARADDR1H, ADDR, 0, 8)
> +REG32(RVBARADDR2L, 0x50)
> +    FIELD(RVBARADDR2L, ADDR, 2, 30)
> +REG32(RVBARADDR2H, 0x54)
> +    FIELD(RVBARADDR2H, ADDR, 0, 8)
> +REG32(RVBARADDR3L, 0x58)
> +    FIELD(RVBARADDR3L, ADDR, 2, 30)
> +REG32(RVBARADDR3H, 0x5c)
> +    FIELD(RVBARADDR3H, ADDR, 0, 8)
> +REG32(ACE_CTRL, 0x60)
> +    FIELD(ACE_CTRL, AWQOS, 16, 4)
> +    FIELD(ACE_CTRL, ARQOS, 0, 4)
> +REG32(SNOOP_CTRL, 0x80)
> +    FIELD(SNOOP_CTRL, ACE_INACT, 4, 1)
> +    FIELD(SNOOP_CTRL, ACP_INACT, 0, 1)
> +REG32(PWRCTL, 0x90)
> +    FIELD(PWRCTL, CLREXMONREQ, 17, 1)
> +    FIELD(PWRCTL, L2FLUSHREQ, 16, 1)
> +    FIELD(PWRCTL, CPUPWRDWNREQ, 0, 4)
> +REG32(PWRSTAT, 0x94)
> +    FIELD(PWRSTAT, CLREXMONACK, 17, 1)
> +    FIELD(PWRSTAT, L2FLUSHDONE, 16, 1)
> +    FIELD(PWRSTAT, DBGNOPWRDWN, 0, 4)
> +
> +#define APU_R_MAX ((R_PWRSTAT) + 1)
> +
> +#define NUM_CPUS 4
> +
> +typedef struct XlnxZynqMPAPUCtrl {
> +    SysBusDevice busdev;
> +
> +    ARMCPU *cpus[NUM_CPUS];
> +    /* WFIs towards PMU. */
> +    qemu_irq wfi_out[4];
> +    /* CPU Power status towards INTC Redirect. */
> +    qemu_irq cpu_power_status[4];
> +    qemu_irq irq_imr;
> +
> +    uint8_t cpu_pwrdwn_req;
> +    uint8_t cpu_in_wfi;
> +
> +    RegisterInfoArray *reg_array;
> +    uint32_t regs[APU_R_MAX];
> +    RegisterInfo regs_info[APU_R_MAX];
> +} XlnxZynqMPAPUCtrl;
> diff --git a/hw/misc/xlnx-zynqmp-apu-ctrl.c b/hw/misc/xlnx-zynqmp-apu-ctrl.c
> new file mode 100644
> index 0000000000..c27b8b9253
> --- /dev/null
> +++ b/hw/misc/xlnx-zynqmp-apu-ctrl.c
> @@ -0,0 +1,257 @@
> +/*
> + * QEMU model of the ZynqMP APU Control.
> + *
> + * Copyright (c) 2013-2022 Xilinx Inc
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
> + * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "hw/register.h"
> +
> +#include "qemu/bitops.h"
> +#include "qapi/qmp/qerror.h"
> +
> +#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
> +
> +#ifndef XILINX_ZYNQMP_APU_ERR_DEBUG
> +#define XILINX_ZYNQMP_APU_ERR_DEBUG 1
> +#endif
> +
> +static void update_wfi_out(void *opaque)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(opaque);
> +    unsigned int i, wfi_pending;
> +
> +    wfi_pending = s->cpu_pwrdwn_req & s->cpu_in_wfi;
> +    for (i = 0; i < NUM_CPUS; i++) {
> +        qemu_set_irq(s->wfi_out[i], !!(wfi_pending & (1 << i)));
> +    }
> +}
> +
> +static void zynqmp_apu_rvbar_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
> +    int i;
> +
> +    for (i = 0; i < NUM_CPUS; ++i) {
> +        uint64_t rvbar = s->regs[R_RVBARADDR0L + 2 * i] +
> +                         ((uint64_t)s->regs[R_RVBARADDR0H + 2 * i] << 32);
> +        if (s->cpus[i]) {
> +            object_property_set_int(OBJECT(s->cpus[i]), "rvbar", rvbar,
> +                                    &error_abort);
> +        }
> +    }
> +}
> +
> +static void zynqmp_apu_pwrctl_post_write(RegisterInfo *reg, uint64_t val)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
> +    unsigned int i, new;
> +
> +    for (i = 0; i < NUM_CPUS; i++) {
> +        new = val & (1 << i);
> +        /* Check if CPU's CPUPWRDNREQ has changed. If yes, update GPIOs. */
> +        if (new != (s->cpu_pwrdwn_req & (1 << i))) {
> +            qemu_set_irq(s->cpu_power_status[i], !!new);
> +        }
> +        s->cpu_pwrdwn_req &= ~(1 << i);
> +        s->cpu_pwrdwn_req |= new;
> +    }
> +    update_wfi_out(s);
> +}
> +
> +static void imr_update_irq(XlnxZynqMPAPUCtrl *s)
> +{
> +    bool pending = s->regs[R_ISR] & ~s->regs[R_IMR];
> +    qemu_set_irq(s->irq_imr, pending);
> +}
> +
> +static void isr_postw(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
> +    imr_update_irq(s);
> +}
> +
> +static uint64_t ien_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_IMR] &= ~val;
> +    imr_update_irq(s);
> +    return 0;
> +}
> +
> +static uint64_t ids_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_IMR] |= val;
> +    imr_update_irq(s);
> +    return 0;
> +}
> +
> +static const RegisterAccessInfo zynqmp_apu_regs_info[] = {
> +#define RVBAR_REGDEF(n) \
> +    {   .name = "RVBAR CPU " #n " Low",  .addr = A_RVBARADDR ## n ## L,    \
> +            .reset = 0xffff0000ul,                                         \
> +            .post_write = zynqmp_apu_rvbar_post_write,                     \
> +    },{ .name = "RVBAR CPU " #n " High", .addr = A_RVBARADDR ## n ## H,    \
> +            .post_write = zynqmp_apu_rvbar_post_write,                     \
> +    }
> +    {   .name = "ERR_CTRL",  .addr = A_APU_ERR_CTRL,
> +    },{ .name = "ISR",  .addr = A_ISR,
> +        .w1c = 0x1,
> +        .post_write = isr_postw,
> +    },{ .name = "IMR",  .addr = A_IMR,
> +        .reset = 0x1,
> +        .ro = 0x1,
> +    },{ .name = "IEN",  .addr = A_IEN,
> +        .pre_write = ien_prew,
> +    },{ .name = "IDS",  .addr = A_IDS,
> +        .pre_write = ids_prew,
> +    },{ .name = "CONFIG_0",  .addr = A_CONFIG_0,
> +        .reset = 0xf0f,
> +    },{ .name = "CONFIG_1",  .addr = A_CONFIG_1,
> +    },
> +    RVBAR_REGDEF(0),
> +    RVBAR_REGDEF(1),
> +    RVBAR_REGDEF(2),
> +    RVBAR_REGDEF(3),
> +    { .name = "ACE_CTRL",  .addr = A_ACE_CTRL,
> +        .reset = 0xf000f,
> +    },{ .name = "SNOOP_CTRL",  .addr = A_SNOOP_CTRL,
> +    },{ .name = "PWRCTL",  .addr = A_PWRCTL,
> +        .post_write = zynqmp_apu_pwrctl_post_write,
> +    },{ .name = "PWRSTAT",  .addr = A_PWRSTAT,
> +        .ro = 0x3000f,
> +    }
> +};
> +
> +static void zynqmp_apu_reset_enter(Object *obj, ResetType type)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
> +    int i;
> +
> +    for (i = 0; i < APU_R_MAX; ++i) {
> +        register_reset(&s->regs_info[i]);
> +    }
> +
> +    s->cpu_pwrdwn_req = 0;
> +    s->cpu_in_wfi = 0;
> +}
> +
> +static void zynqmp_apu_reset_hold(Object *obj)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
> +
> +    update_wfi_out(s);
> +    imr_update_irq(s);
> +}
> +
> +static const MemoryRegionOps zynqmp_apu_ops = {
> +    .read = register_read_memory,
> +    .write = register_write_memory,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    }
> +};
> +
> +static void zynqmp_apu_handle_wfi(void *opaque, int irq, int level)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(opaque);
> +
> +    s->cpu_in_wfi = deposit32(s->cpu_in_wfi, irq, 1, level);
> +    update_wfi_out(s);
> +}
> +
> +static void zynqmp_apu_init(Object *obj)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
> +    int i;
> +
> +    s->reg_array =
> +        register_init_block32(DEVICE(obj), zynqmp_apu_regs_info,
> +                              ARRAY_SIZE(zynqmp_apu_regs_info),
> +                              s->regs_info, s->regs,
> +                              &zynqmp_apu_ops,
> +                              XILINX_ZYNQMP_APU_ERR_DEBUG,
> +                              APU_R_MAX * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->reg_array->mem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq_imr);
> +
> +    for (i = 0; i < NUM_CPUS; ++i) {
> +        g_autofree gchar *prop_name = g_strdup_printf("cpu%d", i);
> +        object_property_add_link(obj, prop_name, TYPE_ARM_CPU,

Indentation needs a minor correction on the lines below.

> +                             (Object **)&s->cpus[i],
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG);
> +    }
> +
> +    /* wfi_out is used to connect to PMU GPIs. */
> +    qdev_init_gpio_out_named(DEVICE(obj), s->wfi_out, "wfi_out", 4);
> +    /* CPU_POWER_STATUS is used to connect to INTC redirect. */
> +    qdev_init_gpio_out_named(DEVICE(obj), s->cpu_power_status,
> +                             "CPU_POWER_STATUS", 4);
> +    /* wfi_in is used as input from CPUs as wfi request. */
> +    qdev_init_gpio_in_named(DEVICE(obj), zynqmp_apu_handle_wfi, "wfi_in", 4);
> +}
> +
> +static void zynqmp_apu_finalize(Object *obj)
> +{
> +    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
> +    register_finalize_block(s->reg_array);
> +}
> +
> +static const VMStateDescription vmstate_zynqmp_apu = {
> +    .name = TYPE_XLNX_ZYNQMP_APU_CTRL,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPAPUCtrl, APU_R_MAX),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static void zynqmp_apu_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_zynqmp_apu;
> +
> +    rc->phases.enter = zynqmp_apu_reset_enter;
> +    rc->phases.hold = zynqmp_apu_reset_hold;
> +}
> +
> +static const TypeInfo zynqmp_apu_info = {
> +    .name              = TYPE_XLNX_ZYNQMP_APU_CTRL,
> +    .parent            = TYPE_SYS_BUS_DEVICE,
> +    .instance_size     = sizeof(XlnxZynqMPAPUCtrl),
> +    .class_init        = zynqmp_apu_class_init,
> +    .instance_init     = zynqmp_apu_init,
> +    .instance_finalize = zynqmp_apu_finalize,
> +    .interfaces        = (InterfaceInfo[]) {
> +        { }

Interfaces can be removed above. 

Best regards,
Francisco Iglesias

> +    },
> +};
> +
> +static void zynqmp_apu_register_types(void)
> +{
> +    type_register_static(&zynqmp_apu_info);
> +}
> +
> +type_init(zynqmp_apu_register_types)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 1927f13a5e..cf9d4cc618 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -85,6 +85,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
>  softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
>  specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
> +specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
>    'xlnx-versal-xramc.c',
>    'xlnx-versal-pmc-iou-slcr.c',
> -- 
> 2.25.1
> 

