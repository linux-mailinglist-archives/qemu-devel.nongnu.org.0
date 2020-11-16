Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EFE2B4994
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:41:14 +0100 (CET)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegcz-00051S-K4
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegaK-0003ct-M4; Mon, 16 Nov 2020 10:38:28 -0500
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com
 ([40.107.244.56]:55584 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegaH-0005fa-08; Mon, 16 Nov 2020 10:38:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hldkWSPU3ME7mzc0HMhv2OccvykU2qsmFhs8Jopso1QowHcBw37aiIeI2Cw7gn+WlK/16sXwHJmx/CgNfcPWmz6KRyGJatp3iAhqFaWv12meWk9J9W+ohXe5Wul59nCoJK93ZwNXteQEAQM3wh8NhURHW5fKdfCjRGdj7BjEK50Lz5cixOJt7PpyhFkWJ7K6fkW/lBIAbiWOWB6j9CfP6s4cKsPp4iFhonI6zu/fd7zHEiCH0SLyd9J6qO4gC6KB1cPOvWufzgYP4ivx0sOGzfk0XS+dAMRWwPV25COIpqn3CdWpcUaVOVKZnQ5f0bcvrxgYEaZFkRvYh3/LmhwvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSucJQBOdADHedM2ULnyxMJ9gWq61lQbltKa1eBnK74=;
 b=i6RIRaHQy92Er5aWkXhGLGANSNmjp57aYRFDm/l0aqqta+0FbvsllyEUGpnwMyxk65joWstd+qJy+hnYcA36NjwyFOonBK9+xCBhntF+FAhXJSTQAUuC2i2hyVrnQiuy1RTkm/8p4SLLQ2GnRMHPcpmk0BcxsPGkG595CMD01aqbTrAZzcEttvzWXp0L6fkQUsbqwnIksSs1ZELYjGFI83asT10s9g6mBtpqDOwNE8Df2KHiKeAI5wvmCHYdHB3AhnJb1fHT2/H3JLjo4rGmg84k1BWw1orvwQkfLeTNpUKXb89VFfQqBE6BP3nwSr8B5WtLWnuBPl82pEnITbW+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSucJQBOdADHedM2ULnyxMJ9gWq61lQbltKa1eBnK74=;
 b=cWFrQxkg1/TdekvQ7d/UMnpxgyL1uvbkH7DOHPYQWqkeyIGOMZkxVdoFr7FJrqu8XNxdiQVGW9dHfxK4iPZK2XCUD7zbA5hIpDEZZD+Vuk6UbbE5GMYunMiTEyxeBBG6AWkpQ25VdH9ATFegO2Pi2AZL9Y0zmy4zdHcvngSdurs=
Received: from BL0PR0102CA0042.prod.exchangelabs.com (2603:10b6:208:25::19) by
 SA0PR02MB7209.namprd02.prod.outlook.com (2603:10b6:806:da::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Mon, 16 Nov 2020 15:38:16 +0000
Received: from BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:25:cafe::4f) by BL0PR0102CA0042.outlook.office365.com
 (2603:10b6:208:25::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 15:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT051.mail.protection.outlook.com (10.152.76.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 15:38:16 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 07:38:15 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 07:38:15 -0800
Received: from [10.23.120.221] (port=52666 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kega7-0006sC-Ae; Mon, 16 Nov 2020 07:38:15 -0800
Date: Mon, 16 Nov 2020 15:38:13 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v4 2/4] hw/block/m25p80: Fix when VCFG XIP bit is set for
 Numonyx
Message-ID: <20201116153812.xitssj6xkpervz5e@debian>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
 <1605237055-393580-3-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1605237055-393580-3-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 432409c2-98df-435a-78d3-08d88a45a2d9
X-MS-TrafficTypeDiagnostic: SA0PR02MB7209:
X-Microsoft-Antispam-PRVS: <SA0PR02MB72099F809006186A57052286ADE30@SA0PR02MB7209.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOBFLz8tLPryNEClxbqFcuf1QCzqPoasigbZshucHali2JM6A+vaFaW1gkZfsZf+kUwKe1pDQVCXqGvizbMHo01KTVna7DjcXqOQoerG9Oc4RIlWntic0EywWSSVMavHhsbi9P0QG2i0JX7AoAwR3rQmsmAmxggLdCpzF4Y+DMSgx/zwosR3rpqr3o7G7Noc2CFGM/rq5Qht7/PmTgNyXxjbrf4iIBp4GgW90zEdafssXGSfeAkEcB/45bFhk5twjSPXhD7R59qNFpWMggw+5MRzTew/ZqpGdRk51F7PAinHZI5zCSrPDeBUVhwRsrY1aYHALQfWSsFvq67ChCNkPIL+3YSXpyROw+gXDtmVSYSVq8dEsIpzni6Bt2mmqr448AbyWynmqmJZn8MekKwuHw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(336012)(6862004)(44832011)(426003)(9786002)(26005)(8936002)(186003)(9576002)(6636002)(2906002)(316002)(4326008)(54906003)(9686003)(478600001)(36906005)(8676002)(83380400001)(70586007)(47076004)(70206006)(7636003)(82740400003)(82310400003)(356005)(1076003)(33716001)(4744005)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 15:38:16.1053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 432409c2-98df-435a-78d3-08d88a45a2d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7209
Received-SPF: pass client-ip=40.107.244.56; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 10:38:22
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

On Thu, Nov 12, 2020 at 07:10:53PM -0800, Joe Komlodi wrote:
> VCFG XIP is set (disabled) when the NVCFG XIP bits are all set (disabled).
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  hw/block/m25p80.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 452d252..eb6539f 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -768,7 +768,7 @@ static void reset_memory(Flash *s)
>          s->volatile_cfg |= VCFG_DUMMY;
>          s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
>          if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
> -                                != NVCFG_XIP_MODE_DISABLED) {
> +                                == NVCFG_XIP_MODE_DISABLED) {
>              s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
>          }
>          s->volatile_cfg |= deposit32(s->volatile_cfg,
> -- 
> 2.7.4
> 

