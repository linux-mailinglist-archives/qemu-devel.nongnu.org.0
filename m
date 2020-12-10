Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA32D687A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:17:31 +0100 (CET)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSNV-0000Hs-R8
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1knSJX-0006zg-7q; Thu, 10 Dec 2020 15:13:23 -0500
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com
 ([40.107.94.79]:39745 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1knSJU-0000Zx-Aa; Thu, 10 Dec 2020 15:13:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdiIG9LwezqDUhxG3MH2cyRIsKT07oWEOxnrPbBdWv/hkBS19wWX/UvA5aLxz+09uJFK2HujSeT8g/PM4hLBj54tjxqUFvhmf2sVAbgX7NSw1mHspl7UlU3d81QLew4TdTaT+y38n44PfJb4bDW76JcTr5+zZZQBinRkDZ4p9kP0s06rMsFQanZGAAHgGKFIQyw/qcTBi9kiON7pfl5avV8aqiKsvFNkUFAd4ZL5pz43mXlJN20GmqfNwotPuVsOzlZNOab3I/LD1vQ3cH7VrvG2z82t6Ij5xCAJadVXLIxM+ST6wFzdE5YK1kYqp7anauY5V7ZlXCjThpbNnprl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cDUHWeG5GH2et1kluSMeWSmN8dnWORpo7uhJVwMByU=;
 b=jjcZMIRyFBVFi7DtVQfYTy8UmpjSBcgNKN3vk8VxGkJAwrcr7jKA534h7vj8nWKtxx9WntpSsAWqi1tZg+qtcrUh/U0UoVM8OJY0d1nRTvqUriuMiF7651+bTSDqjmREg8IuTvroGDZQPFS2eVDOTxOl/eOsVF7b/SBJJ4XHxtfqGyBp8kriTmplb4qTVm9yGsKxW9/MMOCq90ik3Wc1WEKFCTqL+wFkxxwSM9AuOpNbLl1L1sV8gLDSZ23XeNT9v3p+raDajJHf5GDP3Ow70LVTrwOYuTkjej4mG2ky3KsUhpFWFPKKgsxn+5CASdzdW1kFESrTlknk4UcE9MSsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cDUHWeG5GH2et1kluSMeWSmN8dnWORpo7uhJVwMByU=;
 b=HnB/gOHmkIcSWohqsJvGL0Aa407ldjlTr+R/XP0vcs/fNTB3MawQ28PzUOTlL17onXC1EfYWkvO1R3XZ0LrxMBV7Ev86TjkoXv8nHRjgpX3y81rMtE0RYsjH3QNsmKs9cm84zGV4yt7L/Cb+Ki0D/oVMcGpdUsP255raXVKpCMY=
Received: from BLAPR03CA0059.namprd03.prod.outlook.com (2603:10b6:208:32d::34)
 by DM6PR02MB5546.namprd02.prod.outlook.com (2603:10b6:5:35::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 10 Dec
 2020 20:13:10 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:32d:cafe::bd) by BLAPR03CA0059.outlook.office365.com
 (2603:10b6:208:32d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23 via Frontend
 Transport; Thu, 10 Dec 2020 20:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 20:13:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 10 Dec 2020 12:13:09 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 10 Dec 2020 12:13:09 -0800
Received: from [10.71.118.230] (port=60336 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1knSJJ-0002C3-D4; Thu, 10 Dec 2020 12:13:09 -0800
Date: Thu, 10 Dec 2020 21:13:09 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [RFC PATCH] hw/misc/zynq_slcr: Avoid #DIV/0! error
Message-ID: <20201210201309.GQ22548@toto>
References: <20201210141610.884600-1-f4bug@amsat.org>
 <CAKmqyKN7OMipCzi-B+qNJb_J--ontKzpwX5J=rQ8zye3tmYePQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKN7OMipCzi-B+qNJb_J--ontKzpwX5J=rQ8zye3tmYePQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4805ca25-916f-4263-bb5d-08d89d48044d
X-MS-TrafficTypeDiagnostic: DM6PR02MB5546:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5546416AF8037A925AC4B8C3C2CB0@DM6PR02MB5546.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICjKhm+OHO89nbEzRcU2jB5lugSuu8rSvxS1cNJekhn+W3mpkbOoed3+QdRiX4jUJ3THpwNw6kTwdoLKWWdXspFsVWKID/0WxycRkLQGxNNPFyaHGL5gCyy4sIZVZWD6qKUnMU9+fxxIWf0JpPUPn+USMytEgOtDZXRMZnI45u7PujsaSw+fQPxZ6cIuL67PIV6aCOyQ2pKPotK+4KjHdRXkOwi5kgUC4j+VRri/i4jDVDmDEY/Uyqx+rVSDq/hwU21Ts422CcBALFLLPgvGVy2Awe3rzyjgkuGv4qxjFPIfEiBYkZK/LQxu0BKrxr4h6lp29eBsnjCMTI3IOApqYXpvzSSYIaMd0IdQmS5f5HUfjcMUFDtLa8c0hiacUFQHUaaNnA6Guuu6m5r8zkOaTQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(376002)(46966005)(426003)(33656002)(33716001)(508600001)(36906005)(26005)(356005)(83380400001)(4326008)(7416002)(47076004)(8936002)(70586007)(336012)(6916009)(70206006)(9786002)(53546011)(186003)(54906003)(1076003)(7636003)(9686003)(8676002)(2906002)(82310400003)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 20:13:10.6925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4805ca25-916f-4263-bb5d-08d89d48044d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5546
Received-SPF: pass client-ip=40.107.94.79; envelope-from=edgar@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gaoning Pan <gaoning.pgn@antgroup.com>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 08:39:32AM -0800, Alistair Francis wrote:
> On Thu, Dec 10, 2020 at 6:27 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > Malicious user can set the feedback divisor for the PLLs
> > to zero, triggering a floating-point exception (SIGFPE).
> >
> > As the datasheet [*] is not clear how hardware behaves
> > when these bits are zeroes, use the maximum divisor
> > possible (128) to avoid the software FPE.
> >
> > [*] Zynq-7000 TRM, UG585 (v1.12.2)
> >     B.28 System Level Control Registers (slcr)
> >     -> "Register (slcr) ARM_PLL_CTRL"
> >     25.10.4 PLLs
> >     -> "Software-Controlled PLL Update"
> >
> > Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
> > Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> > Cc: Damien Hedde <damien.hedde@greensocs.com>
> > Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Cc: Gaoning Pan <gaoning.pgn@antgroup.com>
> > Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> >
> > Alternative is to threat that as PLL disabled and return 0...
> 
> I'm not sure which is better, but this patch now is better then before:
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

I agree with Alistair:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


