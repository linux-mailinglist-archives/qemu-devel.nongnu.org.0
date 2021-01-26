Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA8303B73
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:23:08 +0100 (CET)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MR8-0008G1-Ti
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MOi-0006Kw-5A
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:20:37 -0500
Received: from mail-eopbgr760041.outbound.protection.outlook.com
 ([40.107.76.41]:39072 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MOc-00013r-Fq
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:20:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEtkLA7k5nA5iGBb6UMKS0f2OQcZ8xMgFUcTWq9dDBwjsQJ5AmRrxpG+vfR0FXRvyHU7Q6oyvA0TPGuQrL6lOxQH5xZh0qtl2TmG8mTB44y7woVsFFMlNvxx7NJNDBPvXIcsto4qMm/jbP85vOU/pm5znfhLenTlEr/lGat+Sx3twlWuMLMYIHXiDofKEY4In3t3V28f921Ezic7FqtlOBkJa7uJBEOupqDUlUoRRitPfqCeOlDK6Aj2/XiplOpe8G966lofUl/wWIqHCwKnKdTGhVBlR8O8Ibh8JFFu0n3qqBk91vtR6KaZkITk/psL3/7IwZLNa5UzCxyEWvDddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH/G87gsstrBWtxPyl85uMzUNauNkNQK/msK18xLPDE=;
 b=nC458PD1gVobpFkELH65O19eaiOzZfOj+BnYSS3fODBQ1Sy1Pao2PFJKIDmJI++KdvBujh/pHaR8zqt7LcinTTcTLH+Ncm4WYnPD87uyNUGXkwcJ06tM9Z4jmkvYQeI8XkwMaT5jV0Ihm/nsgQ6n5d2tTUAaj3UPgd7yqdP+S7fBogICnLQ55CAzgPiZRcjfGXMc0LtAFqgNj1XD8FX8bmNaMnbjI/UL309mantVyMr8Rc3Q9TGDt1MP4FVHJZYuBXbm3+Y0KSs4MJDQV1MzV5oxWRZUu2xqqd/v1wFzlEOTYAgxGtLp5OytBur9wKI1RLrmJxUJOamodoBn9SDg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH/G87gsstrBWtxPyl85uMzUNauNkNQK/msK18xLPDE=;
 b=OSOI5SYMVVz6NYZBtwYeVskchgRifI8K4+IS66OrEdz3X5TQx7HYr+Z/yNJas99FXRp+inyM88lP6J1PhviupTqHdU2YeGhf4/dJF8yhWy9lCxhCWEmpvrnUfR+clOIsBTLGFztphWy/3kzCCbkjXt8gRrn1kRJGOzlt5SpEEvc=
Received: from BL1PR13CA0263.namprd13.prod.outlook.com (2603:10b6:208:2ba::28)
 by BYAPR02MB4439.namprd02.prod.outlook.com (2603:10b6:a03:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Tue, 26 Jan
 2021 11:20:26 +0000
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2ba:cafe::c6) by BL1PR13CA0263.outlook.office365.com
 (2603:10b6:208:2ba::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend
 Transport; Tue, 26 Jan 2021 11:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 11:20:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 26 Jan 2021 03:20:25 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 26 Jan 2021 03:20:25 -0800
Received: from [10.71.117.86] (port=52852 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1l4MKZ-0008IR-Kh; Tue, 26 Jan 2021 03:16:19 -0800
Date: Tue, 26 Jan 2021 12:16:25 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v1 2/3] target/microblaze: use MMUAccessType instead of
 int in mmu_translate
Message-ID: <20210126111625.GG10562@toto>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
 <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d0e1ac-e6d5-44c3-5fd0-08d8c1ec619e
X-MS-TrafficTypeDiagnostic: BYAPR02MB4439:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4439F0EF8449A5029E6F18A3C2BC9@BYAPR02MB4439.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FGqI/V+lzJbVqnemEGRkn1COCvmbN68FeplJevEdFaptEInn+4AiVKCPr7e0+byZVyMJkyEwhKCu+MufKUQWzzl7TMq21eHyfEhb2BWL/4UGnC4YawZVQ1F+qFHgUdiIdZDU+iFaJvziRlUPcPi49Qcjn4a4PxUFCutszKoexMJ036E9ze3f9+5YaQ06fI6GUFy+U4U2VFYt2V8VnrXPk22obdx8jGMcPdYHU5GKz3kkqZ8PLYK2X7HEF+ofnW7nRAMn134J9ZhESWxZBTHyvamrK8Lk81h/wgwLsCXQmjc1zgE0kFCrLqaRomryRH0KKq8VUdKN24VfT7v2OFGhF3eSxV+IzOVN2gLvv8T5DiEt5ccT1BRgaK6JwTTWNYTovBhTvnf2Jq/C30mSq4jyh2XjfJOvJk6E9FQRVcXFKHr3eOTTqUhL/FfPSaokNc+IR8qyd7lYLkz8+8mAeckhw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(396003)(376002)(346002)(39860400002)(46966006)(107886003)(83380400001)(36906005)(1076003)(478600001)(316002)(9686003)(186003)(54906003)(47076005)(70206006)(7636003)(4326008)(356005)(82740400003)(82310400003)(26005)(33716001)(5660300002)(2906002)(6666004)(336012)(9786002)(6636002)(6862004)(426003)(33656002)(8676002)(70586007)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:20:26.5727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0e1ac-e6d5-44c3-5fd0-08d8c1ec619e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4439
Received-SPF: pass client-ip=40.107.76.41; envelope-from=edgar@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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
Cc: edgari@xilinx.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 04:18:54PM -0800, Joe Komlodi wrote:
> Using MMUAccessType makes it more clear what the variable's use is.
> No functional change.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  target/microblaze/mmu.c | 2 +-
>  target/microblaze/mmu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
> index 1e42696..cc40f27 100644
> --- a/target/microblaze/mmu.c
> +++ b/target/microblaze/mmu.c
> @@ -74,7 +74,7 @@ static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
>  
>  /* rw - 0 = read, 1 = write, 2 = fetch.  */
>  unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
> -                           target_ulong vaddr, int rw, int mmu_idx)
> +                           target_ulong vaddr, MMUAccessType rw, int mmu_idx)
>  {
>      MicroBlazeMMU *mmu = &cpu->env.mmu;
>      unsigned int i, hit = 0;
> diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
> index 09e4075..b6b4b9a 100644
> --- a/target/microblaze/mmu.h
> +++ b/target/microblaze/mmu.h
> @@ -84,7 +84,7 @@ typedef struct {
>  } MicroBlazeMMULookup;
>  
>  unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
> -                           target_ulong vaddr, int rw, int mmu_idx);
> +                           target_ulong vaddr, MMUAccessType rw, int mmu_idx);
>  uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
>  void mmu_write(CPUMBState *env, bool ea, uint32_t rn, uint32_t v);
>  void mmu_init(MicroBlazeMMU *mmu);
> -- 
> 2.7.4
> 

