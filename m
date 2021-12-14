Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAE47410B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:02:46 +0100 (CET)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5a0-00059o-IL
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5Ys-0004E9-95
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:01:34 -0500
Received: from mail-mw2nam08on2077.outbound.protection.outlook.com
 ([40.107.101.77]:37996 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5Yk-0006ki-GM
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:01:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHdXV9HEiAOZ8Yst2KyWo+GCTThdQgM6fF3ccN7Q0eDGLcVZI6UGft52zmZi6Sv23vIU1Dv6KuTq5CS9lRW/sjtDEHj9mAkm5eWeCk0O71hCJuInDv4C40At0TRDEA0/8auGlssOcd5VHr29fhWhg60KnG5Z43QvOPAAtuUGR5j5/ucHWrxF55VR0NVpe90hcGJOfK9kPa/6h6LQoJXQDftOmS7bhzauAar1s0CjX+ot1wBcNA3UJj+4X2WXwYinBy21EOzcpbFwQb1v+lZH2sB7sMN9cz775lDj/YM3Zo6gDLXmQ20kaHtg/cvYc3sl/Tm5taqca9WgLExq2F3+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1yHo4YqScPL8Tev2+67HF+zrmaKcac1PCOtvHdofvA=;
 b=A/QvFXJX1H7JGwxsiv6HHoCH9v474TrOwOEDvzFBRIQsxFcZgJKt1ixgXHG1gsIaZ46/cq6zNaS3q6PFoNijocIuC6S9aABJsJm6hu3nIyZBdN/CyAahKqAwpaE9PxHVDfMzcpuuvZ1cJi143eBrGy++Vwsw92BoRTX0tuVdHsR78dOAAe8uUk4oeRenCa3Sdw+gagU/0HWvX92qZpm0/xwU9MIaZzXCSMw4UIoEfOzuZjW95UtQVPudHzoIPl/E07oTZwakV3utNBqJNYMUMTfuUMRgYuYDJU4dY9Ulxud7A3aOKwX9WHTnOYYPMbaShCUSd73Ovg/pO0EUaz+3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1yHo4YqScPL8Tev2+67HF+zrmaKcac1PCOtvHdofvA=;
 b=fmjoNIN0v0+pw2IeNsSn64WAsaqt/DgHDwBmk5pNQnm6JCeKu3xGMEguo8Dh3tX+nPgy2Se5/kAhhjc/cahZG9rvNylT4HE4K2GWLC3MBJLC11rKgn//K7yb8dPV83sUa7TQuXaE4X7tMDNxkOchzLkLEhE3uAZuIg6+dpD2BlM=
Received: from DM6PR17CA0022.namprd17.prod.outlook.com (2603:10b6:5:1b3::35)
 by SJ0PR02MB8450.namprd02.prod.outlook.com (2603:10b6:a03:3f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Tue, 14 Dec
 2021 11:01:23 +0000
Received: from DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::84) by DM6PR17CA0022.outlook.office365.com
 (2603:10b6:5:1b3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Tue, 14 Dec 2021 11:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT049.mail.protection.outlook.com (10.13.5.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:01:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:01:22 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:01:22 -0800
Received: from [10.23.120.191] (port=54342 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5Yg-00059Z-LG; Tue, 14 Dec 2021 03:01:22 -0800
Date: Tue, 14 Dec 2021 11:01:20 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 01/11] hw/misc: Add a model of Versal's PMC SLCR
Message-ID: <20211214110119.navyllgwng5wd32l@debian>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-2-francisco.iglesias@xilinx.com>
 <CAFEAcA9=cHr4NhVc_gnbM83fEEVXduJ1iyfYXSYk6PUu0grW8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9=cHr4NhVc_gnbM83fEEVXduJ1iyfYXSYk6PUu0grW8g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d78986-c41c-42e6-7a48-08d9bef11154
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8450:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB845065D6F60F0DBAC9BC9D09AD759@SJ0PR02MB8450.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: REDM54yvj1PjyUymaM2uka0/1gRP9UqY6G0OXaTYyEPwD2+Eb05P7GJIs7Ng5zGpEhv64B4ERujaCDf9SmMSQnbZLeZF7RAtq9d0DMRI+shqOWsAX0vtyKJ5Q9gnyXj3vl1PFYZOEQVgnU1hJWR7KfjSuSV1DSWuXjsmdi93FZzt5MIOY8DAP6gAT0B1RA2r9meoTN+ZqR8L+ntvHSNWtLE3cBcYF+eieDIjRbftCz/lRL9Es3oAYrYjWJQ5eqVzJdoK6fU/o+kiQQFnpbSC9ipAC49mKnlIloM04Dm/EhLXUuwex7c9WvtoYRtdKVKFo0J6Wb4sVTceJVsAicsitGu8DkGCm2ESB2RvDq8BXCQuBxpDEYmL8c8dXNMLedD+T48Y3cyaRq+YYPwTSX/PA6/hVISl4l1Z/Kd9hFOau8q0BtzYKi8X8Y8rr5MJ4mCOhPLLsx1MsdhDINdJGcEXfW93qUw7s7UXw/xZ+uvs9/7Vd/N3HAC5s3Bx2E2MFJ9kvLCIBIt6pRFpde8cwmQqo0aJIwZHh5tnLVEv8k+BBM/QkYosNgDyZH3o9lEJyWYTxiOJwy6G95YZRjAq02LMfpjIQwMxqsb/vgDlmcKde+JGa1GjAoIunb+C1fapf29bx1xrzsvi9H73m4iYrZ8iwd8DLkm764Lo2YEfhw1V8tqA9Q9LTWXyDfHcwlg2wypMnMAPiIdmShDdPtmIy7HogQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(4326008)(9686003)(336012)(426003)(2906002)(54906003)(316002)(8676002)(356005)(83380400001)(70586007)(47076005)(1076003)(70206006)(9576002)(9786002)(186003)(8936002)(44832011)(26005)(36860700001)(7636003)(82310400004)(6916009)(508600001)(33716001)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:01:23.5843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d78986-c41c-42e6-7a48-08d9bef11154
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8450
Received-SPF: pass client-ip=40.107.101.77; envelope-from=figlesia@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 03:11:41PM +0000, Peter Maydell wrote:
> On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Add a model of Versal's PMC SLCR (system-level control registers).
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> 
> > +static void xlnx_versal_pmc_iou_slcr_realize(DeviceState *dev, Error **errp)
> > +{
> > +    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(dev);
> > +
> > +    qdev_init_gpio_out(dev, s->sd_emmc_sel, 2);
> > +    qdev_init_gpio_out(dev, &s->qspi_ospi_mux_sel, 1);
> > +    qdev_init_gpio_out(dev, &s->ospi_mux_sel, 1);
> 
> Could we use named GPIOs for these? That would be clearer
> in the code that wires them up than having to remember what
> unnamed gpio lines 0,1,2,3 do.
> 

Hi Peter!

> (Also, I don't see anywhere in the board code in patch 2
> that wires these GPIO lines up. Did I miss it?)

In v5, I added dummy connections outputting unimplemented messages for the
GPIOs whose behaviour is not yet implemented (in this series). Hopefully
that will make it more clear (also for users trying to use them)!

Best regards,
Francisco


> 
> > +#ifndef XILINX_VERSAL_PMC_IOU_SLCR_H
> > +#define XILINX_VERSAL_PMC_IOU_SLCR_H
> 
> For a complicated device like this which has multiple IRQs
> and GPIOs, I would suggest having a comment here which
> defines the "QEMU interface", which is just a list
> of all the sysbus MMIO regions, QOM properties, named and
> unnamed GPIO inputs and outputs, sysbus IRQs, etc, which the
> device has (basically, anything that code creating one of these
> devices might want to configure or wire up). There's an
> example in include/hw/misc/tz-ppc.h (or grep in include/ for
> "QEMU interface" for others).
> 
> > +
> > +#include "hw/register.h"
> > +
> > +#define TYPE_XILINX_VERSAL_PMC_IOU_SLCR "xlnx.versal-pmc-iou-slcr"
> > +
> > +#define XILINX_VERSAL_PMC_IOU_SLCR(obj) \
> > +     OBJECT_CHECK(XlnxVersalPmcIouSlcr, (obj), TYPE_XILINX_VERSAL_PMC_IOU_SLCR)
> 
> Don't define cast macros by hand, please. Prefer
> OBJECT_DECLARE_SIMPLE_TYPE() (which will also do the
> typedef for you, so you don't need it on the struct).
> 
> > +
> > +#define XILINX_VERSAL_PMC_IOU_SLCR_R_MAX (0x828 / 4 + 1)
> > +
> > +typedef struct XlnxVersalPmcIouSlcr {
> > +    SysBusDevice parent_obj;
> > +    MemoryRegion iomem;
> > +    qemu_irq irq_parity_imr;
> > +    qemu_irq irq_imr;
> > +    qemu_irq sd_emmc_sel[2];
> > +    qemu_irq qspi_ospi_mux_sel;
> > +    qemu_irq ospi_mux_sel;
> > +
> > +    uint32_t regs[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
> > +    RegisterInfo regs_info[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
> > +} XlnxVersalPmcIouSlcr;
> > +
> > +#endif /* XILINX_VERSAL_PMC_IOU_SLCR_H */
> 
> Otherwise this patch looks OK.
> 
> -- PMM

