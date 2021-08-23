Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6413F4C01
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:59:56 +0200 (CEST)
Received: from localhost ([::1]:34518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAUV-00022I-6k
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mIATL-000181-ND; Mon, 23 Aug 2021 09:58:43 -0400
Received: from mail-bn8nam12on2040.outbound.protection.outlook.com
 ([40.107.237.40]:35520 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mIATG-0004if-Ty; Mon, 23 Aug 2021 09:58:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzJ0xtCxyWQIkHkPg+lt1TJJv+7dxLDUvi2SgxmuIqX50QjyDBo14X/p9IObaVjzpJPk3vcyq5o83ZdlCLCJQywBVrrFBg+0eyzdoTEktcO4e3HvB9v7hVAGy1eMOAE1wlgjLiRyH1JWK7ersCCTV/7GwLu9NHQAirXzPCObdMVThU9DyEmCfa73OxpdSlrohmWHPfLT1TbooQIA04zFMX/NznQfo6ohZ/hg9rTN5WbEmMpMBS4g9TRX7hGajoz8yCTuyXlqVNLkzftBbzeBIC964GekA91ZmNhjBBrm1U27wNOTGK2XPw/I8QN55Ze4OKCuNSvbbI7J/O2K7zqWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ccxWfg2wKZNbZqoEVKdVGQ/e62J5Mt2O8yA5x9PMk4=;
 b=OEqqcO7wtFbXYe0c5EEaxkBJrUZNDpWIerBlmL4T5vPsBJYH1R25nvSic9+ZUL2t1Dph7eH+D7akj8XdSegpjYySOOWGbbY8gqV8UxRrJK5ta0DNxwa6UHsSX3tRzClIDvw7rR2rxoHFFriQMbOf7x2qCgdYgU8ueS40hS65GItEVfYADgvMTPkU0s9fx7ZNwrbfnZx/C64XON83juzA1XI/qAqlJuvi46F/bnwQuO4n9+ITajK6754kr0l0rYrlKC5Ao/VU4OOlgrPRUeC2i9DNGNPobt3KUmw1TZ3K3eDfZyVptLJ2xg4d2JMaFDMksCoxahWl7lcbiM62848nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ccxWfg2wKZNbZqoEVKdVGQ/e62J5Mt2O8yA5x9PMk4=;
 b=Io8edpLsgRZvUqoMH27R1HmZXdgDhwWGRSWnE8ibLqzl4E4jMan3/zJHovmzVzYOLMxX5MCCiRqOvADLQBFdW/eWTEFTEzYlUjRn7zbsawK/RsNgRcqjMZi1kPPJHLHDVVVD9jPsGdBt2OESuCIz43xcPQIfUIHTGMrRJxZ/r+8=
Received: from DM5PR06CA0070.namprd06.prod.outlook.com (2603:10b6:3:37::32) by
 DM5PR02MB2827.namprd02.prod.outlook.com (2603:10b6:3:109::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.24; Mon, 23 Aug 2021 13:58:33 +0000
Received: from DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::83) by DM5PR06CA0070.outlook.office365.com
 (2603:10b6:3:37::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 13:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT063.mail.protection.outlook.com (10.13.5.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 13:58:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 06:58:33 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 06:58:33 -0700
Received: from [10.71.116.242] (port=52116 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mIATA-0005PZ-Im; Mon, 23 Aug 2021 06:58:33 -0700
Date: Mon, 23 Aug 2021 15:58:31 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
Message-ID: <20210823135831.GB24187@toto>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ce9a2f-061d-4e0e-d3bd-08d9663e18b7
X-MS-TrafficTypeDiagnostic: DM5PR02MB2827:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2827BB0A8F0AB1C8DCB65CDDC2C49@DM5PR02MB2827.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLUQK3cdC9cCg3wlDGZJ5iP3kf4DdtkkxcSTBYsMxXv1q+rvJVTkjlkKnPq4VtfH62uhw5/KbRDjOih0YIa10Ltguz9f1rdwXNEqgFnzBJ+60ot1EEXOzeYJbKYD2otwH0JrBav7g8X/+gY7Ku0/9OzUQN4c+kvpADwg+4xl8KTRZ16MpgdqcWAeHzp9HFPwUZR0fLlzp8uvEWdEjxcKaIwGrR7xRut6T/oIB6yj4F0ZgrTRQi2LB1Dcy4he3ur6N0ld7kZ5AAXpVayQxZC4bY10w17a7J13XK0x7u8GEU08GnN7URO57pCQoV/m+289tTgEIDyVIork+AL7Q+qluQyXprmu+cPX03VqPAStOtBl+AG4azzJ3qxIDiBBbdUiIcef15fcqkBO8j2yKoh19aILIUdHf0jhhzdSi4/ExZ/4kn2P+PImJfRMjZBQri2A6uRkpsRc+mLbKKVSfxkyqsZf4apLz1HwFEHFcvkjkZwdeHCA+OhE0hr3Pxn6hmNFaOJxnrLgh9H9h7P32ymUU5kP7BArggqQG3MZsbDwvBlxnQS2iuaoVSDbe/Ybwt4j9j1PPxaXrCsefJ7z2XCV4XTm+fWWGbg4OKIxt5SDV1jDsmydJK5ur5OhrLak/C+cT7BNd7+1rLf02mv/PUO3XdVNRPhz2EkECyXXUWacDt50lmUbS7+qNsFydUIVxAdltvqD5s0lcyVoEFr8MipCGg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(186003)(356005)(36860700001)(7636003)(36906005)(426003)(478600001)(316002)(83380400001)(4326008)(47076005)(336012)(6916009)(33656002)(9786002)(26005)(8676002)(33716001)(9686003)(8936002)(5660300002)(82740400003)(54906003)(82310400003)(1076003)(53546011)(70206006)(70586007)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:58:33.7412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ce9a2f-061d-4e0e-d3bd-08d9663e18b7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2827
Received-SPF: pass client-ip=40.107.237.40; envelope-from=edgar@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 02:43:26PM +1000, Alistair Francis wrote:
> On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > At present when input clock is disabled, any character transmitted
> > to tx fifo can still show on the serial line, which is wrong.
> >
> > Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/char/cadence_uart.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index b4b5e8a3ee..154be34992 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
> >  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
> >                                 int size)
> >  {
> > +    /* ignore characters when unclocked or in reset */
> > +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> > +        return;
> > +    }
> 
> Should we log a guest error here?
> 


I think it's a good idea to log a guest error on the TX path.

It's not uncommon for bare-metal applications to rely on FSBL/Bootloaders
setting up clocks/resets. On QEMU, it's convenient to run applications
directly without boot-loaders, particularly FSBL since it requires Xilinx tools
to generate it. It's going to be hard for users to figure out what's going on
with no console output and no guest error.

I also wonder how Linux handles this when CCF is not active?
Do we need to use TYPE_ARM_LINUX_BOOT_IF?

Best regards,
Edgar



