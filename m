Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395147417C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:30:19 +0100 (CET)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx60g-0007VB-LV
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:30:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5sE-0007wW-72
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:21:34 -0500
Received: from mail-co1nam11on2057.outbound.protection.outlook.com
 ([40.107.220.57]:15648 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5sA-0000tz-7i
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:21:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHsL0TSv3/I6Q0SyxL5/YRxToD8nUmo37H4aMn6THnQdlU596R2hOPCKVqQqSphES1o1KX0Z9ArDpe/ne4UDMoh/dTjyE/rCPQG4RPQAmjAYWS/scCq/aW5cOovpA6/xEC8vKn2XG0W8coGuU9qSrEJmyCJkkCiUA51SdAvlhaZ7kRGMGk/Jnng3fzceDZfUlVm2cY9IMW9DrJ3wl4iOhbs3LwckSu06IjE11AAO/E+gB3S1F99VZaMVFV5vow4g4aSX7l5z1HBQHejdtIEbLcEIGyJTBBj/0BeEe4qkeJi5TMWZ6LEn8NMcWLS6L81ktiCB6WFCkqAgq3wRzq1vaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrgyFBWvJDHdEvIy0n6cJWZ9CpfX5OqZDbW7mxRh5J8=;
 b=ONgIvR9cXksgiI9jq/Go69Nn2uSVf1s7aFcw/yufNQXzSGNJtm1wbPE9d6+wJ66KXb0/5BuIjyTEJaYmmI+GswemiY673IJZ2plUXOlkS46qRAQAeA1U+ZOOgCSmJilk1D+KghDt1E78AojpltcC9jmSLaDL3+LUX0jQdIaqMD9hCReSduFP+uMgs6EOCnmyqvvYKs8CLNN5DR3AYcQlO4icqJ0M1OvX+3ugfz4pVDfRaTnOF4Lrbx45heUs4HoQPpYdFJJFeYipXEmxbAsQ1425QJUqrHATorSxkDwd5YL0l7BMm86ImyBLu5LCRl3Lr4yBA7qpZakqGpHa3/5zpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrgyFBWvJDHdEvIy0n6cJWZ9CpfX5OqZDbW7mxRh5J8=;
 b=UbP72TXC3lqAXsoffrMDDD0j1mhpQNSjBLNo08ZezGVpEZIDYMVNQbMiA2qL+vOGVHqvlEbGxG5muRzQ6+LsZvy402YIdrqYJIYnN0EQ4I/05cPMmZSZvAHSYJFleOkpIx7QfBZSLcC3xW5rKvvaUev8FVT8jmgoe0rU5FsYDbA=
Received: from BN8PR04CA0010.namprd04.prod.outlook.com (2603:10b6:408:70::23)
 by PH0PR02MB8423.namprd02.prod.outlook.com (2603:10b6:510:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 11:00:41 +0000
Received: from BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::97) by BN8PR04CA0010.outlook.office365.com
 (2603:10b6:408:70::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT016.mail.protection.outlook.com (10.13.2.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:00:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:00:29 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:00:29 -0800
Received: from [10.23.120.191] (port=54325 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5Xn-0004Ek-HT; Tue, 14 Dec 2021 03:00:28 -0800
Date: Tue, 14 Dec 2021 11:00:25 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 11/11] docs/devel: Add documentation for the DMA
 control interface
Message-ID: <20211214110024.xbdjowwe5fg6t636@debian>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-12-francisco.iglesias@xilinx.com>
 <CAFEAcA98YGz0DG+4PVkSNqWQjdpz+pobt8XmrTd4mRXPYyoffg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA98YGz0DG+4PVkSNqWQjdpz+pobt8XmrTd4mRXPYyoffg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899756e1-40a7-465f-a057-08d9bef0f7cd
X-MS-TrafficTypeDiagnostic: PH0PR02MB8423:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB84238E40E7A0EAC4349AF40BAD759@PH0PR02MB8423.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FbixMCUB40Be46HJJy3if0mSkpafGCXsHvJEsm970Jewy0iw2g+NA5JnGEu5LhX5stDGyw2rc3+pvsgaYj565DrgtGewOCTTtB4sdEZpKQw9aoFM2K6Qr69cv5vynejW2H+KM+EVTJFLj6423O8IMGTgk8a3B3yaa1dOvrv0bkPiXfhY335E5qySuDmE0OssiBLq9ytNhO720hcSQX0fNQSVs/757ufbaTjht6fZnGgkzYMz7KvSF+V+rFIGRmdmAnPsyOHfo2PhFya7IG97rCbxO1NNPvxLw2n31y/sTSUAJudS3406VwS2f7yuCkB5ctD8AjSsH7Gno/cm1TV/PfuxUl9WcfL4htap7nlJks9utXB0Rnrwub/1u4bMFXxjjrmZxvLhD9zRShQM/wmKqWdx6q+2K7XOuQr3pjSnmi0BD3fJQiaV6yPbUNaa5ZYFtKsGXXxDMLay/AH0FKP60UF015oprae6+t+o/2cPqLAVZMC2PFVOQ83YGrJ3IiMUgvFgZKeerGc+rKMSBb1L8G2F3+a1BE2c3QSHTY8Oe/f8QVfT/dCxB4nkx/l4KbBo9yJcr7GUz5aKSnTooc/LYJthVEyQ8ZVWEFtNw7xrZ6xk2IZYrhUT/p8yoANG20VnyrQEo8X9hUnJDt33xqr82xcD14hWoH+QV78wc6yzMGrtDV0RAjG6mWUgT9aKkUQRWs5jbbIorqEYgCXL8csOA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(186003)(54906003)(1076003)(6666004)(8676002)(70586007)(508600001)(4326008)(47076005)(70206006)(356005)(7636003)(426003)(44832011)(8936002)(6916009)(82310400004)(9786002)(316002)(36860700001)(26005)(2906002)(5660300002)(83380400001)(9686003)(336012)(9576002)(30864003)(33716001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:00:40.5700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899756e1-40a7-465f-a057-08d9bef0f7cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8423
Received-SPF: pass client-ip=40.107.220.57; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 12:21:26PM +0000, Peter Maydell wrote:
> On Wed, 1 Dec 2021 at 15:41, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Also, since being the author, list myself as maintainer for the file.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  docs/devel/dma-ctrl-if.rst | 320 +++++++++++++++++++++++++++++++++++++++++++++
> >  docs/devel/index.rst       |   1 +
> >  3 files changed, 322 insertions(+)
> >  create mode 100644 docs/devel/dma-ctrl-if.rst
> 
> Hi; I have mostly typo/grammar notes below, but one suggestion for
> a tweak to the API and one question about how DMA "refill" works.
> 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e52cc94840..ffefcc841f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -968,6 +968,7 @@ M: Francisco Iglesias <francisco.iglesias@xilinx.com>
> >  S: Maintained
> >  F: hw/ssi/xlnx-versal-ospi.c
> >  F: include/hw/ssi/xlnx-versal-ospi.h
> > +F: docs/devel/dma-ctrl-if.rst
> >
> >  ARM ACPI Subsystem
> >  M: Shannon Zhao <shannon.zhaosl@gmail.com>
> > diff --git a/docs/devel/dma-ctrl-if.rst b/docs/devel/dma-ctrl-if.rst
> > new file mode 100644
> > index 0000000000..480e2a7d3a
> > --- /dev/null
> > +++ b/docs/devel/dma-ctrl-if.rst
> > @@ -0,0 +1,320 @@
> > +DMA control interface
> > +=====================
> > +
> > +About the DMA control interface
> > +-------------------------------
> > +
> > +DMA engines embedded in peripherals can end up being controlled in
> > +different ways on real hardware. One possible way is to allow software
> > +drivers to access the DMA engine's register API and to allow the drivers
> > +to configure and control DMA transfers through the API. A model of a DMA
> > +engine in QEMU that is embedded and (re)used in this manner does not need
> > +to implement the DMA control interface.
> > +
> > +Another option on real hardware is to allow the peripheral embedding the
> > +DMA engine to control the engine through a custom hardware DMA control
> > +interface between the two. Software drivers in this scenario configure and
> > +trigger DMA operations through the controlling peripheral's register API
> > +(for example could writing a specific bit in a register propagate down to
> 
> "could" here is misplaced:
> "for example, writing a specific bit in a register could propagate"
> 
> > +a transfer start signal on the DMA control interface). At the same time
> > +the status, result and interrupts for the transfer might still be intended
> > +to be read and catched through the DMA engine's register API (and
> 
> "caught"
> 
> > +signals).
> > +
> > +::
> > +
> > +    Hardware example
> > +                   +------------+
> > +                   |            |
> > +                   | Peripheral |
> > +                   |            |
> > +                   +------------+
> > +                        /\
> > +                        ||   DMA control IF (custom)
> > +                        \/
> > +                   +------------+
> > +                   | Peripheral |
> > +                   |    DMA     |
> > +                   +------------+
> > +
> > +Figure 1. A peripheral controlling it's embedded DMA engine through a
> 
> "its"
> 
> > +custom DMA control interface
> > +
> > +Above scenario can be modelled in QEMU by implementing this DMA control
> 
> "The above"
> 
> > +interface in the DMA engine model. This will allow a peripheral embedding
> > +the DMA engine to initiate DMA transfers through the engine using the
> > +interface. At the same time the status, result and interrupts for the
> > +transfer can be read and catched through the DMA engine's register API and
> 
> "caught"
> 
> > +signals. An example implementation and usage of the DMA control interface
> > +can be found in the Xilinx CSU DMA model and Xilinx Versal's OSPI model.
> > +
> > +::
> > +
> > +    Memory address
> > +    (register API)
> > +      0xf1010000   +---------+
> > +                   |         |
> > +                   | Versal  |
> > +                   |  OSPI   |
> > +                   |         |
> > +                   +---------+
> > +                       /\
> > +                       ||  DMA control IF
> > +                       \/
> > +      0xf1011000   +---------+
> > +                   |         |
> > +                   | CSU DMA |
> > +                   |  (src)  |
> > +                   |         |
> > +                   +---------+
> > +
> > +Figure 2. Xilinx Versal's OSPI controls and initiates transfers on it's
> 
> "its"
> 
> > +CSU source DMA through a DMA control interface
> > +
> > +DMA control interface files
> > +---------------------------
> > +
> > +``include/hw/dma/dma-ctrl-if.h``
> > +``hw/dma/dma-ctrl-if.c``
> > +
> > +DmaCtrlIfClass
> > +--------------
> > +
> > +The ``DmaCtrlIfClass`` contains the interface methods that can be
> > +implemented by a DMA engine.
> > +
> > +.. code-block:: c
> > +
> > +    typedef struct DmaCtrlIfClass {
> > +        InterfaceClass parent;
> > +
> > +        /*
> > +         * read: Start a read transfer on the DMA implementing the DMA control
> 
> "on the DMA engine"
> 
> > +         * interface
> > +         *
> > +         * @dma_ctrl: the DMA implementing this interface
> 
> "the DMA engine"
> 
> > +         * @addr: the address to read
> > +         * @len: the amount of bytes to read at 'addr'
> > +         * @notify: the structure containg a callback to call and opaque pointer
> > +         * to pass the callback when the transfer has been completed
> > +         * @start_dma: true for starting the DMA transfer and false for just
> > +         * refilling and proceding an already started transfer
> 
> "proceeding with"
> 

Hi Peter,

Thank you very much for reviewing again! I tried to implement all corrections
and suggestions (for the entire v4 series, not only this patch) in v5!

> 
> The "start a read transfer" part seems clear enough. But I don't
> understand how the "refill" case works (in fact, I'm not even sure
> what "refill" means in a DMA context...) When should a caller pass
> in start_dma = false, and how does it change the behaviour of the
> DMA engine ?

I can see that 'refill' got unclear here, sorry for that. The intention
was to allow a DMA transfer triggered through the interface to be divided
into multiple smaller transfers in case it would be needed (due to
intermediate buffering or in case if it would be desired). I reworked this
functionality though and removed it in v5 (since it perhaps was anyway to non
intuitive) in a attempt to simplify the interface, hopefully the interface
looks better now(!).

Thank you again for the review!!!

Best regards,
Francisco


> 
> > +         */
> > +        void (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
> > +                     DmaCtrlIfNotify *notify, bool start_dma);
> > +    } DmaCtrlIfClass;
> > +
> > +
> > +DmaCtrlIfNotify
> > +---------------
> > +
> > +The ``DmaCtrlIfNotify`` contains a callback function that is called when a
> > +transfer has been completed. It also contains an opaque pointer that is
> > +passed in to the function as an argument.
> > +
> > +.. code-block:: c
> > +
> > +    typedef struct DmaCtrlIfNotify {
> > +        void *opaque;
> > +        dmactrlif_notify_fn cb;
> > +    } DmaCtrlIfNotify;
> 
> I don't think we really need this struct. The read method on
> DmaCtrlIfClass can just take two arguments, one for the
> function pointer and one for the opaque pointer. I think this is
> the more usual convention in C: you can see uses of the two-argument
> approach in QEMU in aio_wait_bh_oneshot(), timerlist_new() and
> memory_region_init_io(), among other places.
> 
> Looking at your implementation, the implementation of the read
> method immediately pulls the two fields out of the struct and
> deals with them separately, and the caller puts together the
> struct only as a way to pass the two things it wants. So the
> struct isn't really bringing anything much here.
> 
> > +dma_ctrl_if_read_with_notify
> > +----------------------------
> > +
> > +The ``dma_ctrl_if_read_with_notify`` function is used from a model
> > +embedding the DMA engine for starting DMA read transfers.
> > +
> > +.. code-block:: c
> > +
> > +    /*
> > +     * Start a read transfer on a DMA implementing the DMA control interface.
> 
> "a DMA engine"
> 
> > +     * The DMA will notify the caller that 'len' bytes have been read at 'addr'
> 
> "The DMA engine"
> 
> > +     * through the callback in the DmaCtrlIfNotify structure. For allowing refilling
> > +     * an already started transfer the DMA notifies the caller before considering
> 
> "the DMA engine"
> 
> > +     * the transfer done (e.g. before setting done flags, generating IRQs and
> > +     * modifying other relevant internal device state).
> > +     *
> > +     * @dma_ctrl: the DMA implementing this interface
> 
> "the DMA engine"
> 
> > +     * @addr: the address to read
> > +     * @len: the amount of bytes to read at 'addr'
> 
> "number of bytes"
> 
> > +     * @notify: the structure containing a callback to call and opaque pointer
> > +     * to pass the callback when the transfer has been completed
> 
> As noted above, we should just pass in the callback and opaque as
> two arguments.
> 
> > +     * @start_dma: true for starting the DMA transfer and false for just
> > +     * refilling and proceding an already started transfer
> 
> "proceeding with"
> 
> > +     */
> > +    void dma_ctrl_if_read_with_notify(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
> > +                                      DmaCtrlIfNotify *notify, bool start_dma);
> > +
> > +Example implementation of the DMA control interface
> > +---------------------------------------------------
> > +
> > +The example code below showing an implementation of the DMA control
> > +interface is taken from the Xilinx CSU DMA model.
> > +
> > +The DMA control interface related code in
> > +``include/hw/dma/xlnx_csu_dma.h`` is found below. The header includes
> > +``include/hw/dma/dma-ctrl-if.h`` and makes it possible to keep track of a
> > +notifier function with a corresponding opaque. The notifier is called when
> > +the transfer has been completed (with the opaque passed in as argument).
> > +
> > +.. code-block:: c
> > +
> > +    .
> > +    .
> > +    .
> > +    #include "hw/dma/dma-ctrl-if.h"
> > +    .
> > +    .
> > +    .
> > +    typedef struct XlnxCSUDMA {
> > +    .
> > +    .
> > +    .
> > +        dmactrlif_notify_fn dmactrlif_notify;
> > +        void *dmactrlif_opaque;
> > +    .
> > +    .
> > +    .
> > +    } XlnxCSUDMA;
> > +    .
> > +    .
> > +    .
> > +
> > +The DMA control interface related code inside ``hw/dma/xlnx_csu_dma.c`` is
> > +shown below. A DMA control interface read function gets installed in the
> > +class init function through which DMA read transfers can be started. The
> > +DMA control interface notifier is called once a transfer has been
> > +completed (with the opaque passed in as argument) but before any DMA
> > +status has been updated (for allowing refilling the transfer).
> > +
> > +.. code-block:: c
> > +
> > +    .
> > +    .
> > +    .
> > +    static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
> > +    {
> > +    .
> > +    .
> > +    .
> > +        /* Notify dma-ctrl-if clients when the transfer has been completed */
> > +        if (size == 0 && s->dmactrlif_notify) {
> > +            s->dmactrlif_notify(s->dmactrlif_opaque);
> > +        }
> > +
> > +        if (size == 0) {
> > +            xlnx_csu_dma_done(s);
> > +        }
> > +
> > +        return size;
> > +    }
> > +    .
> > +    .
> > +    .
> > +    static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
> > +                                              uint32_t len, DmaCtrlIfNotify *notify,
> > +                                              bool start_dma)
> > +    {
> > +    .
> > +    .
> > +    .
> > +    static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
> > +    {
> > +        DeviceClass *dc = DEVICE_CLASS(klass);
> > +        StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
> > +        DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
> > +    .
> > +    .
> > +    .
> > +        dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
> > +    }
> > +    .
> > +    .
> > +    .
> > +    static const TypeInfo xlnx_csu_dma_info = {
> > +    .
> > +    .
> > +    .
> > +        .interfaces = (InterfaceInfo[]) {
> > +            { TYPE_STREAM_SINK },
> > +            { TYPE_DMA_CTRL_IF },
> > +            { }
> > +        }
> > +    };
> > +
> > +Example DMA control interface read transfer start
> > +-------------------------------------------------
> > +
> > +The DMA read transfer example is taken from the Xilinx Versal's OSPI
> > +model. The DMA read transfer is started by a register write to the OSPI
> > +controller.
> > +
> > +The DMA control interface related code inside
> > +``include/hw/ssi/xlnx-versal-ospi.h`` is shown below. The header includes
> > +``include/hw/dma/dma-ctrl-if.h`` and the state structure contains a
> > +pointer to a DMA engine that has implemented the DMA control interface.
> > +
> > +.. code-block:: c
> > +
> > +    .
> > +    .
> > +    .
> > +    #include "hw/dma/dma-ctrl-if.h"
> > +    .
> > +    .
> > +    .
> > +    typedef struct XlnxVersalOspi {
> > +    .
> > +    .
> > +    .
> > +        DmaCtrlIf *dma_src;
> > +    .
> > +    .
> > +    .
> > +    } XlnxVersalOspi;
> > +    .
> > +    .
> > +    .
> > +
> > +The DMA control interface related code inside
> > +``hw/ssi/xlnx-versal-ospi.c`` can be seen below. OSPI DMA read transfers
> > +are performed and executed through the DMA control interface read function
> > +(and with the CSU source DMA). The OSPI controller is also able to refill
> > +the transfer as required through the notifier (which is called when the
> > +transfer has been completed).
> > +
> > +.. code-block:: c
> > +
> > +    static void ospi_dma_read(XlnxVersalOspi *s, bool start_dma)
> > +    {
> > +    .
> > +    .
> > +    .
> > +        DmaCtrlIfNotify notify = { .cb = ospi_notify,
> > +                                   .opaque = (void *)s };
> > +    .
> > +    .
> > +    .
> > +            dma_ctrl_if_read_with_notify(s->dma_src, 0, dma_len,
> > +                                         &notify, start_dma);
> > +    .
> > +    .
> > +    .
> > +    }
> > +    .
> > +    .
> > +    .
> > +    static void xlnx_versal_ospi_init(Object *obj)
> > +    {
> > +    .
> > +    .
> > +    .
> > +        object_property_add_link(obj, "dma-src", TYPE_DMA_CTRL_IF,
> > +                                 (Object **)&s->dma_src,
> > +                                 object_property_allow_set_link,
> > +                                 OBJ_PROP_LINK_STRONG);
> > +    .
> > +    .
> > +    .
> > +    }
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index afd937535e..0d424bdf34 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -37,6 +37,7 @@ modifying QEMU's source code.
> >     reset
> >     s390-dasd-ipl
> >     clocks
> > +   dma-ctrl-if
> >     qom
> >     modules
> >     block-coroutine-wrapper
> 
> thanks
> -- PMM

