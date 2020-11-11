Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55D2AF543
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:42:44 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsGh-0007N1-IF
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcsF1-0005hF-1f; Wed, 11 Nov 2020 10:40:59 -0500
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com
 ([40.107.223.70]:54496 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kcsEu-00033G-Uj; Wed, 11 Nov 2020 10:40:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1SM2S9t3sxwNTghK52f0d+dZLMJswU1As5LgACv/MszdeH3YWUByE7uCcJXkR8HEi+tl6UytDAWnBpSV/xw8HopJTql0Lp8Sq+Gc7WPkZbuNO82J7qiwZ5HdDRO/suX4xMZ5ritunlaHjNlZCU4P0UzHteGmA3fdSGUcbudYIPzFrXtSbll4PWVMu34lMTuDG4J1GHGNrXx0m/tilTpkEUNaFy/5+dpTMYckz3LejeDyBgUxOvx6HOvhJadXUIczLetC2zhWz7+SA7QzvRCVjdpZjc02DrUC0M3fP/5k1ai56oMzY6R/A8MMyBFsDwfmguPajPaYIYeWkMU1C9qNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqHYJbNxEWyaH79rxGMgYZqsdoWUw4+L3TXVvNeAhzs=;
 b=ZdJN8HWlGO6cbQzE/eCbjsX+KpW3WbrdgS+AjcHBLYXDawsnRRO9Gk29rBoAqNoRVv8uPEF1EH2IDlqigGYJDtqBp7zM/8dVPLrT0q9mFphqHfZ+DOXCFWQ8fCUjTteWDEldtPpHbUgBqHDjjDzCU4KEaFecyZisF4wZKWh/SfRXw1YYCbHBdaQSZrutEhgLs3pju253xSNdJ48a5nEqpTGcExdYa1isPyGY40IcAK93Cleq+BZ4Xm4jgNDRhi2KJ/I39UmyI/BwM8zcNG4QjKYbWSD00hn1/Jr+pEv30sSYao7z7Cn3Md4KAa48c+ns1/UkpwOMbJ2yW7PQ/bOOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqHYJbNxEWyaH79rxGMgYZqsdoWUw4+L3TXVvNeAhzs=;
 b=ZSFXGndeR7bJefuH6trp19TPTa+ZaifWG317Cs1gT+Vdxu0A/sakJ2n1rM3fO7WH4yasSmq4T5DydrmvrJOfAwHOIZ9W57tVNhHEN0/q9sIhAOvZ5krbYme2gNoKzQpwVEIyPfdJj+pAVCA8C7EzsDpVfsvYHTnlt7WT7HCwnig=
Received: from BL1PR13CA0055.namprd13.prod.outlook.com (2603:10b6:208:257::30)
 by BYAPR02MB5928.namprd02.prod.outlook.com (2603:10b6:a03:123::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Wed, 11 Nov
 2020 15:40:49 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:257:cafe::1d) by BL1PR13CA0055.outlook.office365.com
 (2603:10b6:208:257::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Wed, 11 Nov 2020 15:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 11 Nov 2020 15:40:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 11 Nov 2020 07:40:45 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 11 Nov 2020 07:40:45 -0800
Received: from [10.23.120.221] (port=55011 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kcsEm-0000sb-SW; Wed, 11 Nov 2020 07:40:45 -0800
Date: Wed, 11 Nov 2020 15:40:42 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v3 3/3] hw/block/m25p80: Fix Numonyx fast read dummy
 cycle count
Message-ID: <20201111154041.mtzntvkxiu6obhoh@debian>
References: <1604626378-152352-1-git-send-email-komlodi@xilinx.com>
 <1604626378-152352-4-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1604626378-152352-4-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3190481a-9833-4583-b0d1-08d8865829e9
X-MS-TrafficTypeDiagnostic: BYAPR02MB5928:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5928EF720CC1DC58650AD1B3ADE80@BYAPR02MB5928.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85GSSmQGTDOWMyycWegJbKlgevB3i/4B7AP+Cm0QUrUhxt+5b7R6+31jrqhgNQVET/Vd5So7b/aYSy0LHAoi+lVNyAf75u5PZ3WR1cT7R5cW9MNqr97HSP30xS/ZQ1hew1xWZyMCQOpiFz42knDw98WK8aCjYuvCPb5WGrq3dWpH1ShN2DcTiK/EV6Y9XF/c/q9j7rSBOygmZh7IWi5TXlQV5l6VhNdmKvlaDkGQpMqeClpn6VTaggcWrDzS7InMOO69CcCdWG66OjjlvcbZrcz1CJ7Jt8Y4EEdiccqyyzL+8+CYiX2QqeROMMkw4UN05/Vu0fNXWp6/ZCbJ7r5XqS1oOwkq22O8gUqyklO4xoIeLd5HJHFa23Pg7BNixUvEfZT/iGgt2yfEsSbS3S/S6+mayLiUnfcRBKPDC+I3A7NxZVOKtMjltCten+5krjWSjbGEVsQPaXDpCg4sz6uM1d09I0s63Z6AdnuBBVNjVmU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(70586007)(7636003)(2906002)(8936002)(70206006)(336012)(6666004)(4326008)(82310400003)(1076003)(26005)(44832011)(186003)(426003)(9686003)(9786002)(8676002)(9576002)(5660300002)(6636002)(36906005)(83380400001)(6862004)(316002)(54906003)(33716001)(966005)(356005)(478600001)(47076004)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 15:40:48.9940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3190481a-9833-4583-b0d1-08d8865829e9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5928
Received-SPF: pass client-ip=40.107.223.70; envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 10:40:50
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

Hi Joe,

On Thu, Nov 05, 2020 at 05:32:58PM -0800, Joe Komlodi wrote:
> Numonyx chips determine the number of cycles to wait based on bits 7:4
> in the volatile configuration register.
> 
> However, if these bits are 0x0 or 0xF, the number of dummy cycles to wait is
> 10 on a QIOR or QIOR4 command, or 8 on any other currently supported
> fast read command. [1]
> 
> [1]
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  hw/block/m25p80.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 8a1b684..a2cdfb6 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -841,6 +841,43 @@ static uint8_t numonyx_get_mode(Flash *s)
>      return mode;
>  }
>  
> +static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
> +{
> +    uint8_t cycle_count;

We can remove some lines and shrink the function if we remove above variable
and work on num_dummies directly instead.

> +    uint8_t num_dummies;
> +    uint8_t mode;
> +    uint8_t cycle_table[0x100][3] = {
> +        [FAST_READ] = {8, 8, 10},
> +        [FAST_READ4] = {8, 8, 10},
> +        [DOR] = {8, 8, 0xff},
> +        [DOR4] = {8, 8, 0xff},
> +        [QOR] = {8, 0xff, 10},
> +        [QOR4] = {8, 0xff, 10},
> +        [DIOR] = {8, 8, 0xff},
> +        [DIOR4] = {8, 8, 0xff},
> +        [QIOR] = {10, 0xff, 10},
> +        [QIOR4] = {10, 0xff, 10},
> +    };
> +    assert(get_man(s) == MAN_NUMONYX);
> +
> +    mode = numonyx_get_mode(s);
> +
> +    cycle_count = extract32(s->volatile_cfg, 4, 4);
> +    if (cycle_count == 0x0 || cycle_count == 0xf) {
> +        num_dummies = cycle_table[s->cmd_in_progress][mode];

Instead of the table i think it is easier to do a switch here:

switch (s->cmd_in_progress) {
case QIOR:
case QIOR4:
    num_dummies = 10;
    break;
default:
    num_dummies = (mode == MODE_QIO) = 10 : 8;
    break;

};

Best regards,
Francisco Iglesias

> +    } else {
> +        num_dummies = cycle_count;
> +    }
> +
> +    /*
> +     * Validation if the command can be executed should be done outside of
> +     * this function. e.g. trying to execute DIOR in QIO mode.
> +     */
> +    assert(num_dummies != 0xff);
> +
> +    return num_dummies;
> +}
> +
>  static bool numonyx_check_cmd_mode(Flash *s)
>  {
>      uint8_t mode;
> @@ -901,7 +938,7 @@ static void decode_fast_read_cmd(Flash *s)
>          break;
>      case MAN_NUMONYX:
>          if (numonyx_check_cmd_mode(s)) {
> -            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>              s->state = STATE_COLLECTING_DATA;
>          }
>          break;
> @@ -947,7 +984,7 @@ static void decode_dio_read_cmd(Flash *s)
>          break;
>      case MAN_NUMONYX:
>          if (numonyx_check_cmd_mode(s)) {
> -            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>              s->state = STATE_COLLECTING_DATA;
>          }
>          break;
> @@ -993,7 +1030,7 @@ static void decode_qio_read_cmd(Flash *s)
>          break;
>      case MAN_NUMONYX:
>          if (numonyx_check_cmd_mode(s)) {
> -            s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +            s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
>              s->state = STATE_COLLECTING_DATA;
>          }
>          break;
> -- 
> 2.7.4
> 

