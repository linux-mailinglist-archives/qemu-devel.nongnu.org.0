Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B97331A37
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:32:08 +0100 (CET)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOQ3-00022n-F5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1lJONw-0001NH-Sl; Mon, 08 Mar 2021 17:29:57 -0500
Received: from mail-mw2nam08on2062.outbound.protection.outlook.com
 ([40.107.101.62]:25185 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1lJONt-0003iL-3X; Mon, 08 Mar 2021 17:29:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPEXwganwwKnWi588lNuTOMyWMjYY7rzpfjYx2nJvNIPlevxj6MwvrgfWdlVhQkssaVhuANP7HcBcShWeQ3Hoq24Ae9xhQuKfqE8KUUvoKiE501k2GxdHm3Y4zKk42tiomRpDqLxUHs8NiUqHvbVdgcfLgUBAm2+Iv/AKkvTUhO3wXs9n+iCdGP+pgA3jLdfh7fp8R0WlcEBq7k0rgt0BvbdziJegFhHEpygH9oZEX/UuB0634oElu0yJiSWyJw9pguPDY+Ls0FxD1YsNRSa53lPpb/chwYqOp3oM7VhqGzcowJDRbXgc175418LLYPNtnvZtgBx6X+ZCocS/FNPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3cmzx65Vkkk0HpIQ6se5Lnmb2cU6Fv5RySi733NPsA=;
 b=lmXxKMdH2GTLmxZAl2KH5fVcw/igegRboZNwxQbPGcGR+x81T5qHlF4LB49j05NSTmnsoV4DbKh49erTNFm44yWavZZew0LyijfO3lAbOMAYTY/JYUSal1MbVrviFSjZ6Sbvkb0WI5bG5NdOzBDtqwCnKoDno4hSJqc5FgnZvp9yNiiN5CMhgkN62s1wLeUbsGH/4+82zRY7tx2tsFdtIUsD46mReO/uJGuXJrOUtm2d+moezIoKqbs22V3TMnN0TBHl+Ae0rMV5R5D768nrYDeZKekBYeb2q8q6q+NvjlQ8BaeCiM9/bZYzMjG3cYSG2UNcFSebyFc046dkQ6KKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3cmzx65Vkkk0HpIQ6se5Lnmb2cU6Fv5RySi733NPsA=;
 b=jKH2dyuRXBm+Ct5rMyUF02OiBYDPAO0xSVkweBvSBnMqQl1m4v2FXTZsmkdK+h6XtP5F4zoaXVEudpKrK++I7c9vSxw9agjz6GCQjfyehid7bKn5MTEGsOs+HpZykbeSf2qZx+5VdpRrfa7v4cB9xEAas8AwGrZqTnYJxYh+1/A=
Received: from MN2PR01CA0059.prod.exchangelabs.com (2603:10b6:208:23f::28) by
 SN6PR02MB4286.namprd02.prod.outlook.com (2603:10b6:805:a8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Mon, 8 Mar 2021 22:29:48 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23f:cafe::8) by MN2PR01CA0059.outlook.office365.com
 (2603:10b6:208:23f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 22:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3912.25 via Frontend Transport; Mon, 8 Mar 2021 22:29:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 14:29:45 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Mar 2021 14:29:45 -0800
Received: from [10.71.118.76] (port=56746 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1lJONl-0003t7-4U; Mon, 08 Mar 2021 14:29:45 -0800
Date: Mon, 8 Mar 2021 23:29:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 1/2] hw/misc: versal: Add a model of the XRAM controller
Message-ID: <20210308222946.GP28976@toto>
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-2-edgar.iglesias@gmail.com>
 <CAFEAcA-Bquwni3NN6BLfXjCntCwUqXuXx9=-RSpZgfHS+RgxqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Bquwni3NN6BLfXjCntCwUqXuXx9=-RSpZgfHS+RgxqQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9135f5db-d74c-4f76-bb7a-08d8e281aede
X-MS-TrafficTypeDiagnostic: SN6PR02MB4286:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4286E91C3AED6C87358BB6C7C2939@SN6PR02MB4286.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sv468RlUTpdrQDAg8shAHAqL0AO3Agn4t79dDGRCXm3UvbSvEsEIDC47gYkv0wf5nTGjTKZCIvRdjzWy2dWoa+J287O2hUEe0mABvzTQEomMSBO/HYnNHJfZFkr3FM/RavEK8SnOh6XmHZBJOUrUeikq9/xW4qFzpQa4U5dIoA+oT8+U+0d8gL4+3nqufHQLok5W6vuqVd/fdNvH7rC9jEhrPjQJ2Hq09Y/vmGg1kIt+Wx9yreDWINS/OjnOErb0yye6iZkolKtPsKL7kitEXJtGJHto/NiIw+gus499l5vQD/J6+/iZ3UcNTkz/BJ1jqn1dR4Bdao1BZG7xHZiKr7fzRIFi6ywVyAEQClQrGE63wcV0YU2iOY+TrGzVlwZWYTfkYCCMzFrc7ggre3WXNsrRlHfriH2IDQ9pkMf8/315Z/RazU9VdrNtIUQHbu2W++gaLOC48ULnYeCKuos514fh3fSD+pjl5sqE8o5on/JVfKjWFZTO0537H4RxFXKvytcxcTEgQKtGSePg2mnM7hCUHRO68naiki7TjL7538MmMSlRl3HJXi0U28mqHHNsCyAlKcAs7BeyyTQwiFmf5HchRaIplhq/JYn/VZWPbgAmAkY0e/9ibFy0ts9GKPShxANy4T3iZoyL4GFaBU/UNF3DULleviM+INZVNk9OsdU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(5660300002)(33656002)(1076003)(36860700001)(36906005)(478600001)(54906003)(336012)(4326008)(47076005)(356005)(316002)(7416002)(107886003)(426003)(8676002)(82740400003)(82310400003)(8936002)(2906002)(83380400001)(6916009)(33716001)(70206006)(70586007)(186003)(26005)(9786002)(7636003)(9686003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 22:29:48.4003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9135f5db-d74c-4f76-bb7a-08d8e281aede
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4286
Received-SPF: pass client-ip=40.107.101.62; envelope-from=edgar@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, francisco.iglesias@xilinx.com,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 04:54:26PM +0000, Peter Maydell wrote:
> On Tue, 2 Mar 2021 at 11:09, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a model of the Xilinx Versal Accelerator RAM (XRAM).
> > This is mainly a stub to make firmware happy. The size of
> > the RAMs can be probed. The interrupt mask logic is
> > modelled but none of the interrups will ever be raised
> > unless injected.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  include/hw/misc/xlnx-versal-xramc.h | 102 +++++++++++
> >  hw/misc/xlnx-versal-xramc.c         | 253 ++++++++++++++++++++++++++++
> >  hw/misc/meson.build                 |   1 +
> >  3 files changed, 356 insertions(+)
> >  create mode 100644 include/hw/misc/xlnx-versal-xramc.h
> >  create mode 100644 hw/misc/xlnx-versal-xramc.c
> >
> > diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
> > new file mode 100644
> > index 0000000000..68163cf330
> > --- /dev/null
> > +++ b/include/hw/misc/xlnx-versal-xramc.h
> > @@ -0,0 +1,102 @@
> > +/*
> > + * QEMU model of the Xilinx XRAM Controller.
> > + *
> > + * Copyright (c) 2021 Xilinx Inc.
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > + */
> > +
> > +#ifndef XLNX_VERSAL_XRAMC_H
> > +#define XLNX_VERSAL_XRAMC_H
> > +
> > +#include "qemu/osdep.h"
> 
> Headers must never include osdep.h.
> 
> > +#include "hw/sysbus.h"
> > +#include "hw/register.h"
> > +#include "qemu/bitops.h"
> > +#include "qemu/log.h"
> > +#include "migration/vmstate.h"
> > +#include "hw/irq.h"
> 
> I bet you don't really need all of these includes in the header file;
> some of them belong in the .c file.

Yep, I'll cleanup the header files in v2.


> 
> > +static void xram_ctrl_init(Object *obj)
> > +{
> > +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > +    RegisterInfoArray *reg_array;
> > +
> > +    memory_region_init(&s->iomem, obj, TYPE_XLNX_XRAM_CTRL,
> > +                       XRAM_CTRL_R_MAX * 4);
> > +    reg_array =
> > +        register_init_block32(DEVICE(obj), xram_ctrl_regs_info,
> > +                              ARRAY_SIZE(xram_ctrl_regs_info),
> > +                              s->regs_info, s->regs,
> > +                              &xram_ctrl_ops,
> > +                              XLNX_XRAM_CTRL_ERR_DEBUG,
> > +                              XRAM_CTRL_R_MAX * 4);
> > +    memory_region_add_subregion(&s->iomem,
> > +                                0x0,
> > +                                &reg_array->mem);
> 
> Isn't this just creating a container region that contains
> exactly one subregion that is the same size as it? Do we
> need to do this so that the reg_array is disposed of via
> refcounting or something ?

TBH I was just copying a pattern here. It looks to me like if
reg_array gets leaked and we're using an unnecesarry container MR.
I'll fix this in v2 (if I understood the life-cycle
of these regs correctly).

Cheers,
Edgar

