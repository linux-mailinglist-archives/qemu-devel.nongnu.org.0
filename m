Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65F357DC0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:02:16 +0200 (CEST)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUPcF-0006jg-1V
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1lUPaO-00065H-Ly; Thu, 08 Apr 2021 04:00:21 -0400
Received: from mail-eopbgr690060.outbound.protection.outlook.com
 ([40.107.69.60]:31616 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1lUPaK-0006vK-LW; Thu, 08 Apr 2021 04:00:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPzMLrU+fHZ9N2bn8K3/QmrZyFIKhlstJjFvOUsmKa4qys/SdzLt1AsdXlcHi9pVxtztQlPqMxWOF64GCzXTKd1PY/V66VI5vZtrj+Sq+NhG+1r5DrMvcnug9bdTLn84eipmcGOv25RxBPJeRgfpUqru9FSeYnBNb+4/JeEeTQo251oyz9Lf0KVM680FbKmKwINUzg33RlIh2qDw/PmkApo1BRjg1fTixMP6dCduiAgC8fK78gmZTyESbcamI/KMfEb1EWF4+OWjNsUzunveB/6V0fpRmd6c96LKb4ycZGnZs9nLrVfUdIPT1l/HZgsAvAPKafztlGBO/0x38yrUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMxFpXETqYyt6tB5mNrzFl4yyboJbJNa4iHCzpqAa40=;
 b=T5RXwhplOmEMjbuD8E4Q+6Sy0+/O07kGI7Xc9Q64osNtWdE75e1qndW6zj7kihJSHs1FarKjdA8eCuTXHHfdAOcy98spfUIRzmaOZ6OKx8cX71MPas70doGXWShH83u85e+0Lu1oH3Chplo3OMNUwog/8uhoCOLxqDzrzxNCJYwYNEdRm/dhuFlIVHnO0st4WSlu8bFaq6EYwvjreHkwnfgWkY95+vIo9c8sujf5aZa2j6yXtW4diX+56MFZ+PWIFT57zV8pXOpoa/3fjtAOCTovl2dPXLdEu89CWG4TdZkX0T+emTe9RK5wNRBi6Rqz52RgfRCanZI1hm8b6DH8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kaod.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMxFpXETqYyt6tB5mNrzFl4yyboJbJNa4iHCzpqAa40=;
 b=jKvgc2uWs+RuCO97Gm1ulKYkSm1Creq/oHuk4sgHV1U/spEoE6rcKs9tGxkFNfO+wYgLdObGoUam17k2GCt4q/NDj7BS9ZrB48pNmE3Fn792sMQ6jgW/K2YraC7RntDBJrY1Awyv9QSQBBsGNX3E1n5f1JXGSi71kT3ufcSBEdM=
Received: from MN2PR03CA0009.namprd03.prod.outlook.com (2603:10b6:208:23a::14)
 by DM5PR02MB2633.namprd02.prod.outlook.com (2603:10b6:3:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 08:00:09 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23a:cafe::d0) by MN2PR03CA0009.outlook.office365.com
 (2603:10b6:208:23a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 08:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 08:00:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 01:00:04 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 01:00:04 -0700
Received: from [10.23.122.151] (port=57957 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1lUPa8-0005zY-Mn; Thu, 08 Apr 2021 01:00:04 -0700
Date: Thu, 8 Apr 2021 09:00:02 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 21/24] hw/block: m25p80: Add support for mt25qu02g
Message-ID: <20210408080001.2r4gxygjsuorvaxs@debian>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-22-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210407171637.777743-22-clg@kaod.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cf986b4-53e5-478a-7e5c-08d8fa645481
X-MS-TrafficTypeDiagnostic: DM5PR02MB2633:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2633A62A86853A2B00CBC280AD749@DM5PR02MB2633.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48RIPWQ7j3ckmBX6J2S+ngoYcWGMjFkDVwt3smmk41s4waNEdqVtAVkEnkgvl+vgmyT1rBpsylqiCaCAeiyXhEvK//VgO20F33JsV9d9EudX27DMeWMbSmudqcYtMCQXGrHXaKjlRorXBbX7g8Clyf0k2mb2AIqOrtiXrnX0QiCA2EUYqQjorp3h/L4zhBEpoEnh00QwDYcn6tjKOO30BIo4Rjlh/qfToJDtojY1F9k5QoJ/yenJ8pleHlmFOfEAlpzq12L7NIn9/1jgJV59Hs8FGkLl3ZAEQ0kHyJkLyx5TpYUwZ7M1Qkjyjb3Bk7V+wJALX1o5vGl8dpH+eSSafAuZbhF6EmYLKmOn/m0QiQa7d9yovYjYSs7FnzsvZ07wn3GArsQMVMRITnRX1T5DCVgVeP1dQ2zfi2bJttUiEG4c3U8I5VrjRUPmu8nq/dnwAQa3wXo4X8D5CNWeD6wZypZ2i19IdQ6w2kZXxDE6B2QfnAk7v08QjjfUKFS4RPU1rAnjcs4WyaXw3Fau1dfA0/Pl6uIN3zBs/VFhT1W+1C8ZqltVdy0sCixXyKXFsUQbmKet/jGoVh0eWEgYvU/UeuFK0/7sfn/VGYx9m+FIJ81pWV6q23VBMobYYI9kaKi5Bht+ISQItSDLsVDJfUm+prlcrMigrIpKobS4cAmkL2dl1qqioTi44w1uMbePZzCZ0nJLPRUGIp/hVvVP+zxxFw5+AuLIAWxFhjJwStIZRvuz24cbn7iRs/WTPBlk4j7Km4woCgSGhQ6L3/GAvdkU0Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(4326008)(36860700001)(8936002)(2906002)(82740400003)(9786002)(70586007)(83380400001)(70206006)(26005)(6916009)(54906003)(5660300002)(44832011)(33716001)(1076003)(7636003)(426003)(478600001)(9686003)(47076005)(82310400003)(336012)(8676002)(9576002)(36906005)(316002)(966005)(186003)(356005)(138113003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 08:00:09.2832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf986b4-53e5-478a-7e5c-08d8fa645481
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2633
Received-SPF: pass client-ip=40.107.69.60; envelope-from=figlesia@xilinx.com;
 helo=NAM04-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Cedric!

On Wed, Apr 07, 2021 at 07:16:34PM +0200, Cédric Le Goater wrote:
> The Micron mt25qu02g is a 3V 2Gb serial NOR flash memory supporting
> dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
> 4B opcodes.
> 
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 183d3f44c259..2afb939ae28e 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -259,6 +259,7 @@ static const FlashPartInfo known_devices[] = {
>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
>      { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
> +    { INFO_STACKED("mt25qu02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K, 2) },

Is it possible it should be as below instead?

{ INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },

's/0x20ba22/0x20bb22/' (or 's/mt25qu02g/mt25ql02g/') since 'u' looks to stand
for 1.7-2.0 V and 'bb' for 1.8 V (see page 2 and 32 in [1]).

s/ER_4K/ER_4K | ER_32K/ since ERASE_32K is supported (see page 36). 

If you find above changes ok and go with them please add:

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Best regards,
Francisco Iglesias

[1] Micron Serial NOR Flash Memory 1.8V, Multiple I/O, 64KB Sector Erase MT25QU02GCBB
    https://4donline.ihs.com/images/VipMasterIC/IC/MICT/MICT-S-A0008500026/MICT-S-A0008511423-1.pdf?hkey=52A5661711E402568146F3353EA87419

>  
>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
> -- 
> 2.26.3
> 

