Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D945C302EE0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:23:48 +0100 (CET)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4AGx-0006GN-VY
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1l4AFq-0005ol-On
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:22:38 -0500
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com
 ([40.107.223.71]:38241 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1l4AFn-000160-8F
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:22:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE/xCIjQb6YpbnSUrAeA9/LZMXfwQeIjwr4YGfhEQPht9Co5UFBuEDcxF5hzu5ZhOhtkBqoa26+AygnOs30WJkTrZReIG+IkwGdbHb3hdII2xkpq3QIhGev8hFAZ8rJQe+SLNpX0arNknx3lApCCx3WkrdFIfHVOLT1SCRevmQJLMHpXQ3UiZFJk1laygcOq5pH7xpTPMh3gekDoJeI9/xfJ8Z/D/B88HaestgWWuy4wbAbATsa6WErLRiz4yOWfwzW6hwaAP0MDC0auePKqs0azNVxHvQ+KnZHS724xkTQuW70jL/HDVd4MslrLzoQFrPLaAOKXumLhfcSvqaOkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOGnOvx8r96o6iXxgG5VJrMgfNggAd/yLs4cUo8mwUY=;
 b=g45VZFG7O/8rDQUsv53zJVQd3N/Bb3t9RbuMUAVBXQVwsPjFfSPWUztZFRphIw5IsfbWf66iRiJ4/XxBh3xcch1JP5LkhWoDhj1oXZSaBAtotxzrHkq1vHGAUo+qmXmSFGF55OANvZ284eE+ESW7PBvFx2NSDdPIUAOyvS2MI5W2SuyC2mN2Omja1zToMyHa6GP92iGvqx9MjyXudQrp6bVbHfLmS9mElSWndXOKssTfZf40NUkSUmaJx24XaV2Rll5PziXWqgjgbipWXid4WMQ8qWfLWmc85g0+h/OskLvF1Fars8XTfqjbp4mlNmWvbsvuncXNwNCrWrF9qG88/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOGnOvx8r96o6iXxgG5VJrMgfNggAd/yLs4cUo8mwUY=;
 b=LdpEp7x/9Zfm0QrzdoTGb5KYtL8iJymWStBPCYmvKS90ai6Hoq2DHV21uu2ERXePlKtg9TcRYfVMpBDpXCINNcXmRiJaicnq25CMxfHv2loYPYLGHuj9x8pFm23RFd12Qp7iDH0ukfzeYdJoQ0XZIkWTFoXTUEvT++yLlak/LpE=
Received: from DM6PR11CA0052.namprd11.prod.outlook.com (2603:10b6:5:14c::29)
 by BYAPR02MB4102.namprd02.prod.outlook.com (2603:10b6:a02:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 25 Jan
 2021 22:07:20 +0000
Received: from CY1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::b1) by DM6PR11CA0052.outlook.office365.com
 (2603:10b6:5:14c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend
 Transport; Mon, 25 Jan 2021 22:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT043.mail.protection.outlook.com (10.152.74.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 22:07:20 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 25 Jan 2021 14:07:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 25 Jan 2021 14:07:17 -0800
Received: from [172.19.2.115] (port=52874 helo=xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1l4A0z-00081K-58; Mon, 25 Jan 2021 14:07:17 -0800
Date: Mon, 25 Jan 2021 14:07:17 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: rename xlnx-zcu102.canbusN properties
Message-ID: <20210125220716.GA344542@xilinx.com>
References: <20210118162537.779542-1-pbonzini@redhat.com>
 <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_En1xo10n3121r3ZRANkhiH0dRRwT5QwMZ1wRTeLyFWA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d32b35a9-18e0-4c72-f5de-08d8c17d95ce
X-MS-TrafficTypeDiagnostic: BYAPR02MB4102:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4102249DF67B74067B574EE7BCBD0@BYAPR02MB4102.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AXSRx1vRVQ1cZysN44hyvJL/Zc/B92atP2Y24ipmLnMogulv2BnASLOxS9FAcs7oMKds+9pLp3aWf7TQRYViuj1wOT2Y+jBDZFUoxb8We9hd738rhXM5VN10Eck1MDzunzSkqnVP1Cx7YICl/us85hb/5Agd8PIDEhMXCkftYmqQWwXrH9+uDbliJJl8KCa14fay0qmIzdFyQ5BoQ/VqzEDJjimS8rJMidg+JL199uJghHAWDt9g90OdZ+UdaszM7DenDjl9sy1Gzz7KSSFrR0b2bU+6EZOdXvTKyxebSqUSaZHF07P7hdZjSJ9VHQlVygTX++YkiE0ft2jaW0266BGTOYN0EG1D397381lGa5CwvB8Le1idpZUNouWSK5fu+hyC3fU6w8EIsx2ktERBBeyYjMK7zOlEtlEAz3aKzSxw7s+Hq6NGR23opAWwz7YgOCxra57ZVHrVTr8V/wOh/V+/8srXu0np07Obe5kXn/2XD9wju61CZ4QDAogFRF3V7WunQVU5fig0sXX+wniZXIXZSraOdgGHK9Ss9jNGLQIoEEz5UecwiTvDZfS110BAiaaeVSKjScbQ68YOo8KU60sFoKwu3to/T629POxjvFap/XFTR0N/vgWiZxUxOQr
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(1076003)(5660300002)(356005)(4326008)(8936002)(7636003)(6916009)(426003)(2616005)(26005)(54906003)(478600001)(8676002)(83380400001)(82740400003)(36906005)(2906002)(9786002)(82310400003)(316002)(36756003)(33656002)(186003)(336012)(70206006)(7696005)(70586007)(47076005)(27376004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 22:07:20.0746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32b35a9-18e0-4c72-f5de-08d8c17d95ce
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4102
Received-SPF: pass client-ip=40.107.223.71; envelope-from=fnuv@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 01:21:53PM +0000, Peter Maydell wrote:
Patch looks good to me.
Reviewed-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Just noticed this wasn't cc'd to the Xilinx folks. Would one
> of you like to review it?
>
> thanks
> -- PMM
>
> On Mon, 18 Jan 2021 at 16:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The properties to attach a CANBUS object to the xlnx-zcu102 machine have
> > a period in them.  We want to use periods in properties for compound QAPI types,
> > and besides the "xlnx-zcu102." prefix is both unnecessary and different
> > from any other machine property name.  Remove it.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/arm/xlnx-zcu102.c        |  4 ++--
> >  tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------
> >  2 files changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> > index 4ef0c516bf..c9713638c5 100644
> > --- a/hw/arm/xlnx-zcu102.c
> > +++ b/hw/arm/xlnx-zcu102.c
> > @@ -219,12 +219,12 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
> >      s->secure = false;
> >      /* Default to virt (EL2) being disabled */
> >      s->virt = false;
> > -    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
> > +    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
> >                               (Object **)&s->canbus[0],
> >                               object_property_allow_set_link,
> >                               0);
> >
> > -    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
> > +    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
> >                               (Object **)&s->canbus[1],
> >                               object_property_allow_set_link,
> >                               0);
> > diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
> > index 3d1120005b..54de71a686 100644
> > --- a/tests/qtest/xlnx-can-test.c
> > +++ b/tests/qtest/xlnx-can-test.c
> > @@ -138,9 +138,9 @@ static void test_can_bus(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 and CAN1. */
> > @@ -175,9 +175,9 @@ static void test_can_loopback(void)
> >      uint32_t status = 0;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 in loopback mode. */
> > @@ -223,9 +223,9 @@ static void test_can_filter(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0 and CAN1. */
> > @@ -271,9 +271,9 @@ static void test_can_sleepmode(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0. */
> > @@ -317,9 +317,9 @@ static void test_can_snoopmode(void)
> >      uint8_t can_timestamp = 1;
> >
> >      QTestState *qts = qtest_init("-machine xlnx-zcu102"
> > -                " -object can-bus,id=canbus0"
> > -                " -machine xlnx-zcu102.canbus0=canbus0"
> > -                " -machine xlnx-zcu102.canbus1=canbus0"
> > +                " -object can-bus,id=canbus"
> > +                " -machine canbus0=canbus"
> > +                " -machine canbus1=canbus"
> >                  );
> >
> >      /* Configure the CAN0. */
> > --
> > 2.26.2

