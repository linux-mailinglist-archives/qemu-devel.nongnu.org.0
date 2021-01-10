Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95172F0775
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:38:05 +0100 (CET)
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyauz-0008FX-0W
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyahl-0007hB-5k
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:24:25 -0500
Received: from mail-hk2apc01olkn080f.outbound.protection.outlook.com
 ([2a01:111:f400:febc::80f]:40616
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyahj-00055b-E3
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:24:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i84qNKnyf/R+SvH+DgWf93WNZmcl0HRQvoU85jywMReiecGizpG1IWSAgXi7kSafT+iIWKiVeHoyVMKHSr6gch7Le75d8MBMN7By5wQTqnbH/Z9GsQhx7SBaHJgDifpoxjQxUOv0vumojKAPiLvzCsNzbV+/q78nSXDfiUHZZ+xY7W+Q8HOHNNJLq6WaJO4UeMcU/IuMAweNalhRfgxQxfxWVnIP3345P/seM8ipoDzoBrA6nAez0X7o0+2aeteWWV8q4D0zshTCj20Okhtf0d47/dmhihspiQl4LyMw7fvo+C8H8YCIUpy0LXCwGTizXWn5+ZAbaAP1fLAGGRdLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR5adnkcaLt4h7zRxYwvbY5GABhfoZfe2fFNvNE1gz8=;
 b=EtoBdcKF/AIw2eJqh4WARd57MZW7Op2txFv/x+BMFR0kb/oJsnMzfidpuB9nk12AIzlW9unt+MdN/Apa9EYG1oiyPHNPI3vdRVLuXxpoLlXgsO9S7MzsnHHsAD9akD70szWTTyoEPx/xMLi/dX7j6mh05Aa+9WR9SkEiDT9eTvEWwnnx1fahrXp5hPO4XhgHN6qxneeEj+/YkzlFR9JZcDSU2LzYJ/fhuGasSdg0T4ud0IjgVge7OyKZSFJpaLHueKPcnIDy2sFwptMPvseTSc4hT6qjN4AMUsVJk1rLeL7Iump5BdoGkfJT7GG9f3akGKlaI8shH0bvB3qhmn9Gcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR5adnkcaLt4h7zRxYwvbY5GABhfoZfe2fFNvNE1gz8=;
 b=trkpU4wjtVww4d3aeB0PPGMck3H9Bg/xxNCCO6xP4Ff+1S6HcT8UCFOp9cC+pnSq1FVR7XBv8S0rTHqHsDG5JkqYnBCubLseP2AUVZFUArRZWRe1zObeI+29D35DAs+VMf1Z12oEhjW3dh5OB8QoVRGcmfQvkKFlkwSdsxTYOZ6+FFk0h2x4CJY/eBqyShNz/eiJ9MqXOUO2m9/Mtz4Huo2Nl7MBrXdveOSb07+etw8exbs2dReVudKrCMBzTjGhPSLCblC7S2XDsCv6VBTf3L0z5WaWFX+75c6KCPfucngMYuL2A1oHz+C8iFroSfcl15DMATZQI6V1vhAbYYLcpA==
Received: from HK2APC01FT043.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4b) by
 HK2APC01HT071.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::229)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:08:58 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4f) by HK2APC01FT043.mail.protection.outlook.com
 (2a01:111:e400:7ebc::348) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:08:58 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:F0DB4EC31A50A3E4C7FFB10D559BD4539EA3BCA354905AF9CF970A61E5F1B722;
 UpperCasedChecksum:5EC9B29E8C48B73E40C23E7EE81D5D1940F5D61480E95D6387A4BFC500F5D783;
 SizeAsReceived:7376; Count:45
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:08:57 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v7 0/7] fuzz: improve crash case minimization
Date: Sun, 10 Jan 2021 21:08:42 +0800
Message-ID: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [BHZJkLl9Wx+fsA8TtxTVPMTvhtKZT9Sn]
X-ClientProxiedBy: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210110130842.96781-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0207.apcprd02.prod.outlook.com (2603:1096:201:20::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 13:08:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 875825ca-cac9-4b1d-1d87-08d8b568e37b
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNWt8qMG3IjM1nlahHjQ+yey1e7NzQUR/0ASrSdu2jOXJ+oHjR8NEgpcaCEhZxBZuXGhM4ys8YmTEGlIcN2Tqh5XRUAxQor/r6U6vJ4qDpkRgyF2fxErpBXrCYquZSMW/Lp5RcmoLSY3Ew4c9586w+KinfYy1r9wg2kAlM625QvzpMn2uiT6istbF1Hnb5yt+u24VVDfgf+N2gNcLgIVZxcch4XXhkKpAq9KO0UcBqokfWvwpN1sa2q0zdw2QhsFVGoxuj9bxfxV7vpO43f3bw9F14yC9eVqsSMbjB0+L3jTERtuuO/gQLlxi/JrtI0I762sghQnieRUE6U6LBPivAi63+U2ybcdYeK7ACqq9GZ3x0zBoKcwKRKUpHPSttG1vjF6Ce/JXtRRudKONNv4Xe7RqaG6GBdQ5s+BQ6Cgofv0LgYK8Mjvrnvm/pECCwjulffBxyoBvITR0Ii9t+5aqfE+lgIr82UCj8DyWJptN7Gsuj6AWiGl9oL2V4K/Osl7xtlb0mvR7r74Swrbg3lNRnNLmvbR0qnbWQ41VguLa8RXPFv9YR6c+BEs0lp6yM3G9mvGBqYaLpttgi19974t5iMlZQudCO3zFpQGoo4Jf8/SwqQ7vGnbFQxP+HRTT9IiYNr2R7SJsyOXgnVfv2rNKAaeN5DcjBefY0dFb5xMrSy4+ruE0g6C14F9iY2chQTT8yAkPVC8zvXLRUvzUxldVSHUE2nxQWLMAfw=
X-MS-TrafficTypeDiagnostic: HK2APC01HT071:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzTXVM0mIvZqDnOHd9zxw7+60hHJcsnOro/o1V+GUSTcJPvpgJWtkjF0dDWMO9Yf2OSOq2YZsvgnuPXPRsPSPBSCRhFNBSuAPHgnxZq5c5LfLT5QboPgLLAu27ClJGvgTISRsNhqp07OLV4+MO/qBrDH2i9IMp47eUDtg9rIXKd+CTA8BBq5TcB/RWbuOhNo4KHtO6rSGG1rLXPm9syAI8FFlO2AlloX6vUZxHqWLtU5ZoRxYlXT7iHXpk2hjgiW
X-MS-Exchange-AntiSpam-MessageData: 8EAS+xI3+Yja7S2BJAnVCufDxpcQ3Seb9iuJTZBqJdWmnsteNQAYMXXn8iJ/U8Y5zUMBITnO39xeLUCEuzPT6ZIJY//NBiLS4yL7WuMlexJeJ3ZXLpWE05J5ZEZ37nv9UNWfoHzSefDVVM6r+OJ3xA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:08:57.0198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 875825ca-cac9-4b1d-1d87-08d8b568e37b
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT043.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT071
Received-SPF: pass client-ip=2a01:111:f400:febc::80f;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend and refine the crash case minimization process.

Test input:
  Bug 1909261 full_reproducer
  6500 QTest instructions (write mostly)

Refined (-M1 minimization level) vs. Original version:
  real  38m31.942s  <-- real  532m57.192s
  user  28m18.188s  <-- user  89m0.536s
  sys   12m42.239s  <-- sys   50m33.074s
  2558 instructions <-- 2846 instructions

Test Enviroment:
  i7-8550U, 16GB LPDDR3, SSD 
  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  Python 3.8.5

v7:
  Fix: [PATCH v6 1/7] get stuck in crash detection

v6:
  Fix: add Reviewed-by and Tested-by tags

v5:
  Fix: send SIGKILL on timeout
  Fix: rename minimization functions

v4:
  Fix: messy diff in [PATCH v3 4/7]

v3:
  Fix: checkpatch.pl errors

v2: 
  New: [PATCH v2 1/7]
  New: [PATCH v2 2/7]
  New: [PATCH v2 4/7]
  New: [PATCH v2 6/7]
  New: [PATCH v2 7/7]
  Fix: [PATCH 2/4] split using binary approach
  Fix: [PATCH 3/4] typo in comments
  Discard: [PATCH 1/4] the hardcoded regex match for crash detection
  Discard: [PATCH 4/4] the delaying minimizer
  
Thanks for the suggestions from:
  Alexander Bulekov

Qiuhao Li (7):
  fuzz: accelerate non-crash detection
  fuzz: double the IOs to remove for every loop
  fuzz: split write operand using binary approach
  fuzz: remove IO commands iteratively
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 261 +++++++++++++++++++----
 1 file changed, 214 insertions(+), 47 deletions(-)

-- 
2.25.1


