Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17831AA59
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 08:27:43 +0100 (CET)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lApLC-0007gu-Ag
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 02:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1lApIr-00071m-W0; Sat, 13 Feb 2021 02:25:19 -0500
Received: from mail-mw2nam08on2087.outbound.protection.outlook.com
 ([40.107.101.87]:14880 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1lApIn-0007LB-V4; Sat, 13 Feb 2021 02:25:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A16ojFiRHWC/2WbGXu5GLwqNJa47n0JhEu77faXn0cQKl5Nd/zsUYLWuxuTV9TayyzwWo1isKhDe2cuJ0z4qu7EdJcExEggEJUMwr+L44fN1NsO/MSWSA04U7xwddu3k5qchoJAzqcKicsiV79K/5bhNbbaxrmAV/1H1zmWBtnGLOi9L/sCodJNb1zLhnTVyGdQNA3hFyCJQpcf6mbaN2zluDJnUva7wrll+2QiUtnTnJSYr6xw0cXToZs6j8T8ouVV+82GpQllss7JCPLQ0poc7Uz9S1v9AJChufDrKCIR6q9LG4LkqSleOVOPgOowWlyrLH6X4dx47PVmHeoueFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13U3SYwWJLruyWpHvHeuHqV5XRdnqcDkOdxBsgq3jdU=;
 b=EowTK/bRTrfuY4nJWY75pBdpK4/TAATlDWq6lvNGSSuSyCn0K208Ay6V/QuaYOlZpmjmprTvRq3FPRVZ/ClgfRcQZXz1v9gKX6h300JQnHfg4wlU0z5I1uhYr0HX/3Ho0rclWArvPr8KPDx14NUX45JcOYWnJe/T6IhwtfS9s+nAfYf6Ax40J3ZNPgKcoAfWspfdUKil2QOxcDs97NoSjl8jnEA9afHdjnuGhKKek5ZfRd1WIggjLYUqwGJMB58d4CXcpw95zqNlMG+n89x5zQuMfJ5Im+CAmy6R1mgI9M26G3++onDOTRgvDBiM1T01HcIj+9fziqau/4N94d04+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13U3SYwWJLruyWpHvHeuHqV5XRdnqcDkOdxBsgq3jdU=;
 b=VJ85gi3sThTHyt7XACRlPG6UC+dHky7nENzOyh98PrlqAEx3MEbCg0FnFKcLVmn8AfvRGZ3P419lCu0I1Xb1NDlk65k+hh0LrNLeUqfIV6nVolXaWSVkbPMsNk6pxt0otNtE7hHgLzfIiQidOwEuftHWHDMV+9JxVCloibB/X6w=
Received: from DM5PR10CA0014.namprd10.prod.outlook.com (2603:10b6:4:2::24) by
 DM6PR02MB6219.namprd02.prod.outlook.com (2603:10b6:5:1fe::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Sat, 13 Feb 2021 07:25:09 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::8) by DM5PR10CA0014.outlook.office365.com
 (2603:10b6:4:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Sat, 13 Feb 2021 07:25:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Sat, 13 Feb 2021 07:25:09 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 12 Feb 2021 23:25:08 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 12 Feb 2021 23:25:08 -0800
Received: from [10.71.117.207] (port=50286 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1lApIi-0006bB-1N; Fri, 12 Feb 2021 23:25:08 -0800
Date: Sat, 13 Feb 2021 08:25:13 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [RFC PATCH 15/15] arm: xlnx-versal: Add emmc to versal
Message-ID: <20210213072513.GB8256@toto>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-16-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAKmqyKMx7aLD9zz5TvHfvL2bfrfe3Emo44p4s+SZeKndrAE8qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKMx7aLD9zz5TvHfvL2bfrfe3Emo44p4s+SZeKndrAE8qA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dddc0b4a-323a-436f-3198-08d8cff07e87
X-MS-TrafficTypeDiagnostic: DM6PR02MB6219:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6219C21AB314145DB9E50B6DC28A9@DM6PR02MB6219.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qn2++ZxuvOFpVvJTEUHyiOTDGGhKrnvSzINRLgohLzhyXyOem/UgRDyYqMVTjYJqMwIhX2tTLhXMzZjj0tMx5qeW0FdYuFuUDxRc1oj/J29BLgHSxFVVCjCxUHlzK9IWMm5exUgIfOCT89tjcQ4QiucRe7ntur5q3bLEDHKCB75OmtdmfoBnwo5mm2BFOQKPZJ9Og4efR2HEvnDt5jTrXcMTsyg+rsCYdHffCfhGdUiPZXnmlLvk6iSBoj220dTZswuqxLsedaHNFjRqOaMlcyWtvQKcnwWRnL/KcOmA0q4wB1eRxLl2EcVrs2b6+5ycVtr5eYr5uMlczo7XLcPU/nrbmafKAXpa5M11j1UESOugRK8zHiFL1e5lpZ4izZzN6KwBX1SU25O0YuB7tCiih5k+7Ilb6gmZUnK8r9uaOWKL2P8N7Hfo4sp1h4xjPC1oAt1Pe3kuguKbPRGhT7adaJc8SGjVHzekrKVhVhkHDWm7TMkKEgnk1YdkV0QDPpBFjynLAmrO67Lh/UOCNyzKoUrFLg5tR5fE+ijQcc4Tcl9RmWzXcYl/nf9DeQo/+/wvrT0QucaC38Ymy23p5+yAL6lISdCAuSIYyIBjqkqZZ2sCW5mmbTfQO/g4lRjLU3dYK+tavroHB5NLoHKoK4n+JuU7uc4jUyaZFZuKPyDAOCg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(186003)(336012)(9786002)(6666004)(36906005)(8676002)(7416002)(53546011)(26005)(47076005)(1076003)(356005)(6916009)(54906003)(82740400003)(33716001)(478600001)(7636003)(316002)(8936002)(70586007)(9686003)(4326008)(426003)(82310400003)(5660300002)(33656002)(36860700001)(70206006)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2021 07:25:09.4176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddc0b4a-323a-436f-3198-08d8cff07e87
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6219
Received-SPF: pass client-ip=40.107.101.87; envelope-from=edgar@xilinx.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 01:37:18PM -0800, Alistair Francis wrote:
> On Thu, Feb 11, 2021 at 12:36 AM Sai Pavan Boddu
> <sai.pavan.boddu@xilinx.com> wrote:
> >
> > Configuring SDHCI-0 to act as eMMC controller.
> >
> > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair



Hi Sai,

It would be great, if EMMC somehow could be made optional.
In any case, I think this is OK!

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Could you please also add an example command-line in docs/system/arm/xlnx-versal-virt.rst?

Thanks,
Edgar



> 
> > ---
> >  hw/arm/xlnx-versal-virt.c | 16 +++++++++++-----
> >  hw/arm/xlnx-versal.c      | 14 ++++++++++++--
> >  2 files changed, 23 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> > index 8482cd6..18489e4 100644
> > --- a/hw/arm/xlnx-versal-virt.c
> > +++ b/hw/arm/xlnx-versal-virt.c
> > @@ -333,6 +333,13 @@ static void fdt_add_sd_nodes(VersalVirt *s)
> >          qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> >                                       2, addr, 2, MM_PMC_SD0_SIZE);
> >          qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> > +        /*
> > +         * eMMC specific properties
> > +         */
> > +        if (i == 0) {
> > +            qemu_fdt_setprop(s->fdt, name, "non-removable", NULL, 0);
> > +            qemu_fdt_setprop_sized_cells(s->fdt, name, "bus-width", 1, 8);
> > +        }
> >          g_free(name);
> >      }
> >  }
> > @@ -512,7 +519,7 @@ static void create_virtio_regions(VersalVirt *s)
> >      }
> >  }
> >
> > -static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
> > +static void sd_plugin_card(SDHCIState *sd, DriveInfo *di, bool emmc)
> >  {
> >      BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
> >      DeviceState *card;
> > @@ -520,6 +527,7 @@ static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
> >      card = qdev_new(TYPE_SD_CARD);
> >      object_property_add_child(OBJECT(sd), "card[*]", OBJECT(card));
> >      qdev_prop_set_drive_err(card, "drive", blk, &error_fatal);
> > +    object_property_set_bool(OBJECT(card), "emmc", emmc, &error_fatal);
> >      qdev_realize_and_unref(card, qdev_get_child_bus(DEVICE(sd), "sd-bus"),
> >                             &error_fatal);
> >  }
> > @@ -528,7 +536,6 @@ static void versal_virt_init(MachineState *machine)
> >  {
> >      VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
> >      int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> > -    int i;
> >
> >      /*
> >       * If the user provides an Operating System to be loaded, we expect them
> > @@ -581,10 +588,9 @@ static void versal_virt_init(MachineState *machine)
> >      memory_region_add_subregion_overlap(get_system_memory(),
> >                                          0, &s->soc.fpd.apu.mr, 0);
> >
> > +    sd_plugin_card(&s->soc.pmc.iou.sd[0], drive_get_next(IF_EMMC), true);
> >      /* Plugin SD cards.  */
> > -    for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
> > -        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
> > -    }
> > +    sd_plugin_card(&s->soc.pmc.iou.sd[1], drive_get_next(IF_SD), false);
> >
> >      s->binfo.ram_size = machine->ram_size;
> >      s->binfo.loader_start = 0x0;
> > diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> > index b077716..3498dd9 100644
> > --- a/hw/arm/xlnx-versal.c
> > +++ b/hw/arm/xlnx-versal.c
> > @@ -230,9 +230,14 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
> >  }
> >
> >  #define SDHCI_CAPABILITIES  0x280737ec6481 /* Same as on ZynqMP.  */
> > +#define SDHCI0_CAPS ((SDHCI_CAPABILITIES & ~(3 << 30)) | \
> > +                     (1 << 30))
> > +#define SDHCI1_CAPS SDHCI_CAPABILITIES
> > +
> >  static void versal_create_sds(Versal *s, qemu_irq *pic)
> >  {
> >      int i;
> > +    uint64_t caps[] = {SDHCI0_CAPS, SDHCI1_CAPS};
> >
> >      for (i = 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
> >          DeviceState *dev;
> > @@ -244,9 +249,14 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
> >
> >          object_property_set_uint(OBJECT(dev), "sd-spec-version", 3,
> >                                   &error_fatal);
> > -        object_property_set_uint(OBJECT(dev), "capareg", SDHCI_CAPABILITIES,
> > +        object_property_set_uint(OBJECT(dev), "capareg", caps[i],
> >                                   &error_fatal);
> > -        object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
> > +        /*
> > +         * UHS is not applicable for eMMC
> > +         */
> > +        if (i == 1) {
> > +            object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal);
> > +        }
> >          sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
> >
> >          mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > --
> > 2.7.4
> >
> >

