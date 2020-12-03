Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF92CDD57
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:27:40 +0100 (CET)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kktKN-00026r-V7
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1kktDS-0006jA-B7
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:20:30 -0500
Received: from mail-dm6nam10on2047.outbound.protection.outlook.com
 ([40.107.93.47]:35378 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1kktDP-0005bF-Is
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:20:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLw/djtQIyqbllbp0fd7yjmpvtbcd774j06ZYthQE/egSJnTJnrlrowlhOEQVF1Q6o/wx+I5R0HjttuuZ1WG9kwHl8ljZaPNAzCJGkrlf07QfE+42+R0OnArZbtDTabOAreKKfpndEUopmXNDGBw9yvUd8We0TqL++I+g7/bSqEShChUmjqB9EJGhYh1Njearm/5ZXFMjrZEzBYwTyvBCBKDg8ivrfAzl1d0O3WcyLmXOi/wxydkENyp9grSegT6KEHiB4xRhzbmUBBQmoUoDxhvpGvYDNfSjBjFEoKGHL2Ka6/uUpyFGGMi6MBqlVG2n10uM8OaGuPmJN9wCFxs+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5FuoCMJyGGnt445/jxqQBllu5YsW6aCJXbtnT+9bAQ=;
 b=KS1jsgzNDD1UfA4vtc1BFOOpvdvxrxo3uVJF06ZQZfbS2d3ubStRi8B09p0KjJTUQKzVsQCxlunramiYukJAyEj7bHA/jB/Tk34UsJf7A9aYC8TI5nZCgstJWhyk2Ci8NhozBHhChUOXiv6o4yBASdsoP+drz7lgGej4hk2yC+Pr3O5d3Ny2IGkWY9ntCdnpWFIn2r3/XQzsDzDMcB+n97aSNLg4+ioFivg37CyaHUEZOCjQmvhagEbfDVS3PIf0YUZq6qVd2m3f7NhAhr4mwRfDaoBG0JcTfsMr5NAUCB+Kq9C7kcfk5fLqVstCl648SqWFqCxxi1l2CDZVl1WGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5FuoCMJyGGnt445/jxqQBllu5YsW6aCJXbtnT+9bAQ=;
 b=Fw8LkoHKDsh9wUS9z0WYJNIK1K+eFkJwoeTzC8wCgorUk9tdCjHpNt1W0uY5LuwOPHiCyNPEE7EgPCHoIt+cGuBfunprP8jEEOTCf/MfMHqLYCMlpEU1lzLs/iC2tiFfe+qWS2yKqsABmpH2FLIY+6kwStuUDvjQjx1JdKzBSpY=
Received: from MN2PR18CA0027.namprd18.prod.outlook.com (2603:10b6:208:23c::32)
 by CH2PR02MB6133.namprd02.prod.outlook.com (2603:10b6:610:9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 18:05:20 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23c:cafe::5a) by MN2PR18CA0027.outlook.office365.com
 (2603:10b6:208:23c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 18:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Thu, 3 Dec 2020 18:05:19 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 10:05:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 10:05:17 -0800
Received: from [10.71.118.230] (port=55955 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1kksyj-0006V8-A8; Thu, 03 Dec 2020 10:05:17 -0800
Date: Thu, 3 Dec 2020 19:05:17 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v14 4/4] arm: xlnx-versal: Connect usb to virt-versal
Message-ID: <20201203180517.GA10051@toto>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-5-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA-esWWXWx-kfz=UvVsydU5siFvx-=u42DTW4n42YLu_jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-esWWXWx-kfz=UvVsydU5siFvx-=u42DTW4n42YLu_jA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd342a30-192a-46c4-303b-08d897b5ff2c
X-MS-TrafficTypeDiagnostic: CH2PR02MB6133:
X-Microsoft-Antispam-PRVS: <CH2PR02MB613390843D19617B46C257FBC2F20@CH2PR02MB6133.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojkq2ptUBAzaJTgjdYncPjD49UxdG422SV5F1+whGFy0wxcXSuL4GrH+R91OeTUyGApkUQSB+iQA/LyBYvV3zP9fw2PCoUagzzkKYkyK9a35knvVRXTOw3OiAmrFeZ9rdy4xGXg4nK+K7/mSdGV1g+cpczGkP4LrJzHlUzz8I2akZ3iZ2Vpi5p1HHb41ctM55C/1KuAL7dkRPcpcfZAdFF7iDkXsE8YVZKFH+dOvxTBRp56wll796XRplmGfGGDiriRioNuZv3eqt7KvfxRCLKpW2U7h7fceiKNtDvVys2Pn1SSd0oaxLKpbEFbYuEKxnG1z0Rp6ZIfq4ygBTK4rvKBVLyshyWdXY2aXH+t/PGXvAtPvIqhA+oQaL+8uf370SYxOyxHOB25Eg/BgKbCYVA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(336012)(36906005)(426003)(54906003)(26005)(82310400003)(186003)(33656002)(478600001)(8676002)(7416002)(7636003)(70586007)(356005)(316002)(6916009)(83380400001)(4326008)(9686003)(9786002)(82740400003)(70206006)(1076003)(47076004)(8936002)(33716001)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 18:05:19.7466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd342a30-192a-46c4-303b-08d897b5ff2c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6133
Received-SPF: pass client-ip=40.107.93.47; envelope-from=edgar@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco
 Eduardo Iglesias <figlesia@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Paul Zimmerman <pauldzim@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ying Fang <fangying1@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 11:34:25AM +0000, Peter Maydell wrote:
> On Tue, 1 Dec 2020 at 08:34, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> wrote:
> >
> > From: Vikram Garhwal <fnu.vikram@xilinx.com>
> >
> > Connect VersalUbs2 subsystem to xlnx-versal SOC, its placed
> 
> Typo : "VersalUSB2".
> 
> 
> > in iou of lpd domain and configure it as dual port host controller.
> > Add the respective guest dts nodes for "xlnx-versal-virt" machine.
> >
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> 
> Code looks OK but I'll let somebody else from Xilinx review the detail.
> 
> > +static void fdt_add_usb_xhci_nodes(VersalVirt *s)
> > +{
> > +    const char clocknames[] = "bus_clk\0ref_clk";
> > +    char *name = g_strdup_printf("/usb@%" PRIx32, MM_USB2_CTRL_REGS);
> > +    const char compat[] = "xlnx,versal-dwc3";
> > +
> > +    qemu_fdt_add_subnode(s->fdt, name);
> > +    qemu_fdt_setprop(s->fdt, name, "compatible",
> > +                         compat, sizeof(compat));
> > +    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> > +                                 2, MM_USB2_CTRL_REGS,
> > +                                 2, MM_USB2_CTRL_REGS_SIZE);
> > +    qemu_fdt_setprop(s->fdt, name, "clock-names",
> > +                         clocknames, sizeof(clocknames));
> > +    qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> > +                               s->phandle.clk_25Mhz, s->phandle.clk_125Mhz);
> > +    qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
> > +    qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 2);
> > +    qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 2);
> > +    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.usb);
> > +    g_free(name);
> > +
> > +    {
> > +        const char irq_name[] = "dwc_usb3";
> > +        const char compat[] = "snps,dwc3";
> 
> Minor coding style side note, but I'm not hugely fond of
> code blocks in the middle of functions just for declaring
> variables. You could either put these variable declarations
> at the top of the function, or if you think the code in the
> block is self contained and worth putting in its own function
> you could do that.
>

Hi Sai, I beleive I had already reviewed a previous version of this
patch so after you fix the stuff the Peter pointed out feel free to add my
Rb:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar

