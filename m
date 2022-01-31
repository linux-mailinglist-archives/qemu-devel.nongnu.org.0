Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024914A4D7E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:48:42 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEanB-0003xO-4u
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nEaSY-0006Fu-RH; Mon, 31 Jan 2022 12:27:24 -0500
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com
 ([40.107.236.75]:56224 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1nEaSV-0002e2-SB; Mon, 31 Jan 2022 12:27:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5iU4mYmDp+R35gtusG1fGRF6nT4dQ8IkD/u7Bf+QffHCUxB70IsQsAETXWq5Dj/54WYRmq0jC/4o8V+yyrKYj0hTJYyZ3IpTq7eaIh3q5U5JnElvT9Ig3IS8K1xxvos2It9MvKnWhyF7a4VtyB4mW9TsMMdpQOoSHpeBo09o09cyxvjokvQNl9PgW0hjYC2EZeLt6j+UxM5OmE2dph0anMtIpsXeSHhkqd4sn1+oLKBv3V2DxbdgQa2Aes5gYiNYWzJBHq2Wp4pmMulhBqJH8711Tt3OgpQVruLHb0HTb5qn8IlmY6gU4l6jrYyBHLTNJNDypaWJhNhLvQAbF2WwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxDB2zUVzhI/wL/+hyjYSnyLi4SgDWNnfNCt4BzzGHs=;
 b=jn3sPb2pj6bLP/NsN944K/y2d/G9BmDKRbGbbfVl/VAh0GppUSAkejsqo8Lgm5rthI+9J6DbYgv0JdOdKndzk++aPmRD3EGwG14fNcyjGr8aUWM0tjyFU5ryWqfqDhL/S/ja5zJcivStSFphoXersme37CgpQtXhn+NnKAucW1OROT4DrVC3z9l4OOkh9bVNG9SQ5WPH7Qx5QfeRvoouJPRYaYnmaDTVj7DiX/f1vdmS9rl8ob9Ri4qWdZSwtlLrcyJ7SXWDovbKXrsd11eDubwXluxYIBcTMPgIKfhlK3/SpuK8Uw6fjEERJ9+PIPT7SDjZpp5EvZkea6FTWN+sKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxDB2zUVzhI/wL/+hyjYSnyLi4SgDWNnfNCt4BzzGHs=;
 b=BpwpUKWIZVpo6Fdmyls0kFusBe9d74VuEsHAKoNu0V+5V1MGDM+tWH8+jpmtgHAAZJru1ROW5gRhKfWlsbhs0EjceUCvOi6/oxf2RsifhuiGkI6kw88RyHQ+NNRiU1jlho01OU6lo4KmYhFAOKgMHKPcZJC1Nz5HsvkGkXUQGw8=
Received: from DS7PR03CA0131.namprd03.prod.outlook.com (2603:10b6:5:3b4::16)
 by DM6PR02MB5738.namprd02.prod.outlook.com (2603:10b6:5:155::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 17:27:16 +0000
Received: from DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::cf) by DS7PR03CA0131.outlook.office365.com
 (2603:10b6:5:3b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Mon, 31 Jan 2022 17:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT021.mail.protection.outlook.com (10.13.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 17:27:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 09:27:10 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 09:27:10 -0800
Received: from [10.71.119.88] (port=49872 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1nEaSM-00067p-7M; Mon, 31 Jan 2022 09:27:10 -0800
Date: Mon, 31 Jan 2022 18:27:09 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v1 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Message-ID: <20220131172709.GE8684@toto>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-4-edgar.iglesias@gmail.com>
 <20220131153555.gyivhhz3a7zwiho4@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220131153555.gyivhhz3a7zwiho4@debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c075cb48-fb83-4032-708d-08d9e4deed7c
X-MS-TrafficTypeDiagnostic: DM6PR02MB5738:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5738D2CCE3FCC9D6A520A687C2259@DM6PR02MB5738.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O3B0pyxo1cix+FGocCOfsIYefywyN8f4vlEfpj3w2eKvXen+eYo+DG1peh5hK/BBH76sTw9QlE7qdgY+WhTj89sQHfQBGqQO9sKhN9wSCZOOIbO0ayjxc9cwIMqUVF12HvrhlsZKoQuLRuaW8xEEIS9intqA0icRsCBfqOihfl264zrJ5J4iG1872NN/oou8SNhkxMrHKJwVK2Ihb3ruZvjDtoWiBdDrpiqc3La+J7w0LuvI2e40XfYIu5F/GH7A7H/cNoIfxv0tcPkynSdFNcFqjsGtLJWcD8P6GeQ6aXug/eCZTUlF3IykbOE2jboZB0xZrwIs0zVkewHelcMpr3cX0z3a32+JABQDFZSbJK0UpUfgdkde2VrTscmnhc+L++jjipGRvLNNVJFEtv0hNc2F6j4e3sUW0ApnxHzrsZhxYgvGTUSZBv6fMzAjBFBLoYii1rkv3YJVKR/m3H7Jtih6/S0jWRrp5J4bQTkUwNLEU7LhASdABBv/dGqFZY0MjCPuuxUK95CsmQpUON/6tWEF2yR5DndFbOM0kq5gB3MTgnUGVbhbOIMWjk2UFCq9SkStuaOxbViE7TjXi0IFFmc+9zDGG2aZxJTPedaWnsC8NmNZtSfuNwy4pWxPzAukU2g4zRJyav6iTZKxFUG8+w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(46966006)(36840700001)(70206006)(70586007)(2906002)(107886003)(508600001)(33716001)(336012)(426003)(8676002)(36860700001)(8936002)(47076005)(26005)(4326008)(1076003)(186003)(6862004)(83380400001)(33656002)(316002)(5660300002)(9686003)(6636002)(356005)(7636003)(9786002)(54906003)(82310400004)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:27:16.6926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c075cb48-fb83-4032-708d-08d9e4deed7c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5738
Received-SPF: pass client-ip=40.107.236.75; envelope-from=edgar@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: peter.maydell@linaro.org, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 03:35:57PM +0000, Francisco Iglesias wrote:
> Hi Edgar,
> 
> A couple of minor comments below, looks good to me otherwise!
> 
> On Mon, Jan 31, 2022 at 12:12:03AM +0100, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > 
> > Add a model of the Xilinx ZynqMP CRF. At the moment this
> > is mostly a stub model.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  include/hw/misc/xlnx-zynqmp-crf.h | 209 +++++++++++++++++++++++
> >  hw/misc/xlnx-zynqmp-crf.c         | 270 ++++++++++++++++++++++++++++++
> >  hw/misc/meson.build               |   1 +
> >  3 files changed, 480 insertions(+)
> >  create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
> >  create mode 100644 hw/misc/xlnx-zynqmp-crf.c
> > 
> > diff --git a/include/hw/misc/xlnx-zynqmp-crf.h b/include/hw/misc/xlnx-zynqmp-crf.h
> > new file mode 100644
> > index 0000000000..b173ea4a08
> > --- /dev/null
> > +++ b/include/hw/misc/xlnx-zynqmp-crf.h
> > @@ -0,0 +1,209 @@
> > +/*
> > + * QEMU model of the CRF - Clock Reset FPD.
> > + *
> > + * Copyright (c) 2022 Xilinx Inc.
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > + */
> > +
> 
> Include guard seem to be missing:
> 
> #ifndef XLNX_ZYNQMP_CRF_H
> #define XLNX_ZYNQMP_CRF_H
> 
> 
> > +#include "hw/sysbus.h"
> > +#include "hw/register.h"
> > +
> > +#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
> > +
> > +#define XILINX_CRF(obj) \
> > +     OBJECT_CHECK(XlnxZynqMPCRF, (obj), TYPE_XLNX_ZYNQMP_CRF)
> > +
> > +REG32(ERR_CTRL, 0x0)
> 
> (Optional but in case the these ones wont be used outside
> xlnx-zynqmp-crf.c we could consider placing them there).


Hi,

Yeah, I thought about that but the issue is with defining:

#define CRF_R_MAX (R_RST_DDR_SS + 1)

We could move these regdefs out and hardcode CRF_R_MAX, e.g:
#define CRF_R_MAX (0x108 / 4)

But that seems error-phrone.
The trade-off is keeping them here and pollute the name-space.
I already to rename one of these macros to avoid conflict...

Does someone have other ideas or preferences?

Cheers,
Edgar

....

> > +REG32(RST_DDR_SS, 0x108)
> > +    FIELD(RST_DDR_SS, DDR_RESET, 3, 1)
> > +    FIELD(RST_DDR_SS, APM_RESET, 2, 1)
> > +
> > +#define CRF_R_MAX (R_RST_DDR_SS + 1)
> > +
> > +typedef struct XlnxZynqMPCRF {
> > +    SysBusDevice parent_obj;
> > +    MemoryRegion iomem;
> > +    qemu_irq irq_ir;
> > +
> > +    RegisterInfoArray *reg_array;
> > +    uint32_t regs[CRF_R_MAX];
> > +    RegisterInfo regs_info[CRF_R_MAX];
> > +} XlnxZynqMPCRF;

