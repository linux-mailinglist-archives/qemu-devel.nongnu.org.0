Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBC2B4990
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:39:34 +0100 (CET)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegbN-0003lw-8r
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegZr-0003Ba-Vv; Mon, 16 Nov 2020 10:38:00 -0500
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com
 ([40.107.93.75]:20320 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegZo-0005RR-82; Mon, 16 Nov 2020 10:37:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBq7UXEfYPbLET3aJwsaSVSu4rjWa1RbRvzrrUZ1ptsU/4/7sJm04aVK33b0UgrVufFmhu7BmCzdVpsZgzhP52buIS90ovfq6f8PGM5pOPOUVCjXSds7AOO5uD4nHbs9THnPwOuerZDXYXJ2gYsbNI86KWO07aVDUPNbbOFEMBCEN0ghDR1XANZAnh0A21teopbsjaQVhUddjt8+mqFA/c/cXDR7Ycpxh6ycMn3hC4vMu2T94RxZu1mpJ4JVBVVQzHAJXmMcVNcHZzdubIjw3YrgcNr2NvwUsoVYb1DW2UwwWmWdj1JT2ZcLryHrFPCZ4SOlroYIGDHKn77Q98voxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRxf5JZ5B5xNWBVorbUFtFLk/ofxhZt1BnJdtqIxcE8=;
 b=Mhdp7f3Bo2P/TH3OlatMvhZaKhr+LOJDZuJVFIVio/fXmVLbCnurQ33g5VObmW3UKEl/vnqeL94fSTROezPcWvccjhAZLehnQ6cVGBMsiX1eqJZP3P5rm8PJ44Z96YLn1JSjGaNOjzVzOzeJ9cm3tewqA842n/Vf26NM1jGnISoi6bcu73fGBl1xAmLdvtvLkRhZt6rRycgGuAuyh/BQkWuqRvhe+RmOfpzfizA/65JPQA+WZaACRWuRZNBrFBXNNaWR6M4vJJr/L0TLCn8ER17too2HZacdAF3+uSzYhxhVl+oYdWxUeJnBLXQ6I3XrkYqnIN+Uu7I/4kCKULw4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRxf5JZ5B5xNWBVorbUFtFLk/ofxhZt1BnJdtqIxcE8=;
 b=qISf7cRE+uwfx6kqC7YcwElSXSCXv4/JvQ4bwrNrRzokLILj+7wvKwROfc+aW9Ls+vyV2DAE0w85/bLc1idgxJ3ScJKSl764fIgM+TmeupuqaAXk0kcygZxYn2jj8DCp0P7MheRiu9f7ScZelDKYDgexYJE/56Y7bcfODX4v9HU=
Received: from MN2PR15CA0034.namprd15.prod.outlook.com (2603:10b6:208:1b4::47)
 by BY5PR02MB6947.namprd02.prod.outlook.com (2603:10b6:a03:23e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 15:37:51 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1b4:cafe::47) by MN2PR15CA0034.outlook.office365.com
 (2603:10b6:208:1b4::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 15:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 15:37:51 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 07:37:51 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 07:37:51 -0800
Received: from [10.23.120.221] (port=52648 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kegZi-0006pW-Rc; Mon, 16 Nov 2020 07:37:51 -0800
Date: Mon, 16 Nov 2020 15:37:48 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v4 1/4] hw/block/m25p80: Make Numonyx config field names
 more accurate
Message-ID: <20201116153747.htumfxnhvzvfk4es@debian>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
 <1605237055-393580-2-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1605237055-393580-2-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db2891c8-f4e3-4cd0-caa4-08d88a45943c
X-MS-TrafficTypeDiagnostic: BY5PR02MB6947:
X-Microsoft-Antispam-PRVS: <BY5PR02MB69477AAB1BB1C65E0884C32CADE30@BY5PR02MB6947.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSw0+ZCBtzogF9OQSTjFECNs+3FyleUJquMXxu5KQFWm2actKVX1usvOKL2FcsZobDgweGRcsm0ZWKEvQQkwqWTQ+8SlB1djU1dXcNOqQD1ElV8Ycs0RW5xTMGfjhY6X1DNezt5NLsWtGh5NBrI8AT8/9HMhFmTe3NCQ0p1iu9l3JOXzpIAOG5D5gNQ4TeoAfNobINFU7m5xI2pcI3h7qm92m/54X7TaCSEejb3s7uQefmn5KM7FswLA+0aQeKZX5Tne6rLmxVRUBALctN99Mx3qUBP965/+8iBbA8AOFN2qg7XoxlE5Vg2vKNMNnBuyayDQUqccuJvrFGEmtNvsNCuVB7kvN9aTkyEBwxr4uZulDiS3LMgJberB7jpg2mnHYP4IIlwxay+SkxcPsFKzSg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(336012)(26005)(426003)(6862004)(70206006)(4326008)(6666004)(356005)(478600001)(70586007)(54906003)(2906002)(186003)(1076003)(44832011)(9686003)(316002)(6636002)(36906005)(9576002)(9786002)(5660300002)(7636003)(47076004)(82740400003)(33716001)(8676002)(8936002)(82310400003)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 15:37:51.5894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2891c8-f4e3-4cd0-caa4-08d88a45943c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6947
Received-SPF: pass client-ip=40.107.93.75; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 10:37:53
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: figlesia@xilinx.com, qemu-block@nongnu.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, mreitz@redhat.com, philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 07:10:52PM -0800, Joe Komlodi wrote:
> The previous naming of the configuration registers made it sound like that if
> the bits were set the settings would be enabled, while the opposite is true.
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  hw/block/m25p80.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f..452d252 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -136,7 +136,7 @@ typedef struct FlashPartInfo {
>  #define VCFG_WRAP_SEQUENTIAL 0x2
>  #define NVCFG_XIP_MODE_DISABLED (7 << 9)
>  #define NVCFG_XIP_MODE_MASK (7 << 9)
> -#define VCFG_XIP_MODE_ENABLED (1 << 3)
> +#define VCFG_XIP_MODE_DISABLED (1 << 3)
>  #define CFG_DUMMY_CLK_LEN 4
>  #define NVCFG_DUMMY_CLK_POS 12
>  #define VCFG_DUMMY_CLK_POS 4
> @@ -144,9 +144,9 @@ typedef struct FlashPartInfo {
>  #define EVCFG_VPP_ACCELERATOR (1 << 3)
>  #define EVCFG_RESET_HOLD_ENABLED (1 << 4)
>  #define NVCFG_DUAL_IO_MASK (1 << 2)
> -#define EVCFG_DUAL_IO_ENABLED (1 << 6)
> +#define EVCFG_DUAL_IO_DISABLED (1 << 6)
>  #define NVCFG_QUAD_IO_MASK (1 << 3)
> -#define EVCFG_QUAD_IO_ENABLED (1 << 7)
> +#define EVCFG_QUAD_IO_DISABLED (1 << 7)
>  #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
>  #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)
>  
> @@ -769,7 +769,7 @@ static void reset_memory(Flash *s)
>          s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
>          if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
>                                  != NVCFG_XIP_MODE_DISABLED) {
> -            s->volatile_cfg |= VCFG_XIP_MODE_ENABLED;
> +            s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
>          }
>          s->volatile_cfg |= deposit32(s->volatile_cfg,
>                              VCFG_DUMMY_CLK_POS,
> @@ -784,10 +784,10 @@ static void reset_memory(Flash *s)
>          s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
>          s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
>          if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
> -            s->enh_volatile_cfg |= EVCFG_DUAL_IO_ENABLED;
> +            s->enh_volatile_cfg |= EVCFG_DUAL_IO_DISABLED;
>          }
>          if (s->nonvolatile_cfg & NVCFG_QUAD_IO_MASK) {
> -            s->enh_volatile_cfg |= EVCFG_QUAD_IO_ENABLED;
> +            s->enh_volatile_cfg |= EVCFG_QUAD_IO_DISABLED;
>          }
>          if (!(s->nonvolatile_cfg & NVCFG_4BYTE_ADDR_MASK)) {
>              s->four_bytes_address_mode = true;
> -- 
> 2.7.4
> 

