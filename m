Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24575B5ACD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:04:21 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj6r-0000Py-0A
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZA-0004it-SO
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:32 -0400
Received: from mail-eopbgr70131.outbound.protection.outlook.com
 ([40.107.7.131]:5091 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZ9-0005rg-3G
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmlc4AQ0hddbYVeffzNl0WErrcR8vxox4ibFTsaRTRA8feoH5Qo8BirUeKCA8BDDsiAA9kph2qP80gES+7qyAI6cVMrSTM4czhDBimL8yTllGEYzxr1WdUKGrbJJPVGyoeiFB5aRNfuIIfoU/pjI3qXzAGhHv+MUd2qlFpj6Ahqi/NaLRwnfzuKs/jg0D3cfaeTcOIvGxeKnbM2sFKQ4CcP/60dv6dUJ6nxuDjJ3S+LaQ6flm2fBCi/ij1cwDxWHncL3jOs9hXsJx/fwVeYRDiqJwXCXZLKCkTuzPVukH+fOdfdW8sl25FeI0dWHB3Cw7RNUMa3ZhpZsfDoe7ljYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcXuC6nDfOiLLTj+yYQ+9NeO6SaHBMXc21gEATxZzqQ=;
 b=P/o/A+v0qoLrlkoOGYivYsiIqFCxozJXb5jL8MI0XmZcTOhtjK8MA8JIhH6RU9TGy2yLmLqc2cNMQlPG8T/iyyeSNqJCzgep9F3jjor35BO3xwhobO4gZpRwaZX917K3C3Ovpba0FHjOx5t90npmrSkzV/LPQF75c6gZ6W6UO8GBCvOAnCIsZ9hXtVdi4EIqG6WjE3NxqonZpOdIW2X5S2fZ9grQNIePnMvsmbeyzvmXIFSCGpKGLU7jJYLfeJ1PzogCAA6i2OZAIGLCmGqRnV1IKkFx5vj4FBo78NhyGFtZk1kd//H07EoYYshVRG2uKVKQnX/IMKjhwd+djOx+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcXuC6nDfOiLLTj+yYQ+9NeO6SaHBMXc21gEATxZzqQ=;
 b=JmJ1Y6HA+NJLVxOynV4MKsFT32XYIG5e7CJ5o0RGeSPIgRwa0DW5cEtgajlvj1kPly6eC5W//CLfbzc3ir9XVfVO70c+zlH8V8Vg4/FYza2DCQ8q3J2J843Hkp2ryAFmJLI5cXyLhXqNgc1KAtDc+zPq8GI7o8GsK0xPrAOO3qU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:29:27 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:29:27 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 11/24] disas/nanomips: Delete nanomips.h
Date: Mon, 12 Sep 2022 14:26:22 +0200
Message-Id: <20220912122635.74032-12-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f9cd14-ff03-42cc-ade9-08da94ba6f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a2gvbiNl48vczB8X52njj602+EHLn/iupr41c0hGW0lB+//NvpX+M1o/+zAibzFLCWYsCPe3h0RrWRlTnDmyIRKwEUV444IIk5cezRMcMnn5kPhykYSq2S4hECaQdKOtXExMwI/+xonPapOzs8HifFhi3WivhO1QUzYbUWDUzNrDKrSgwcvh+eflESksGgGvzSPaVax4tIggQnsla9w17mDQd563+Nb1iFjVamN6QYlcSz/Q0skKo4j6GXsJfiLjVFcu3ojPW9yO/ynTsfwlpP7JQF60xaPVLnnQwJg6qHNqkuQ2mrFwA+MwgPELB6F1yuquggCJUGhFjhXanm9FC0keLqGBuWx/TI1mn3S6ExFL0cEEelmG4rRQVL3ZK1d4if2toH/FcksP+ACPN5R4WLHJUKBKKX4QZ+lVlIATAzDJ+5PaNvCNxtGj0t3sFSJPcHpogvdnZCpYax53NPn1NV8mmzzenbJELPs35EScEd5RsBQo7X11Ys/1uT0L+sq57Osdlm7TNmLREYmzyUzFS9LyUujVuf+rBCfmrmOLssIHXDG3kPReQR/jijqE0t2vivMgqMlhVdmv10ONwP+s/Z1DhYjER8dT+Qn7xi55i8q1egslvf18W1IShISuWCVi3SNFkUWFD/CZQJfTiqxu+D8pq5xTiYC6pmdQDKEIPxWEYF/p2Mq+CW4Tm/uFxftqJdBTLwU4mgOpfZ4+B92H+tOL5jh39nrbVMo2nCVmxIDSeKS4ETzQl4Vb2auqMfYEEW9GCLWzLUbuhbofHF2ONZB5TGqAvnd+JehQXCU8XHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(54906003)(5660300002)(7416002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(6666004)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE5KUkJ0bHdETW5LRyttWE1FaWlHcUFXM1lEbUhVdWhqK05oYy9UUW9zdXRK?=
 =?utf-8?B?MVBFenNpS1R4di9nams1d1B0SzlmdlFhZ1M3SGMrSVpsUEI4V1l5VnRtZEZq?=
 =?utf-8?B?dGExclhzNmhGVFFGTnhMVjlhekJlR2ovdVNycWh5SkwybHE3QUJlUDNVSWNW?=
 =?utf-8?B?UTFHODdITlpoMmlpYStZUm5zSG1YNGlJZjE2TitpKzdZczAyd0sraSs4U2dy?=
 =?utf-8?B?MDlPZDJEV3BHUjZ5SkRKSFRZdk9jeEZPS0cyR3NDdHQ2Y1A2RTRSZERUMHVI?=
 =?utf-8?B?OWFnN3BBMUZwQWVCTUdGMURBWDlMZDlubEVBTHNVeFcwUFVlY3RYSDJicTQv?=
 =?utf-8?B?a2hUYU5sUHlkdndxaWM0VGNoNFlHZ3NjVFM5emQ3VEZhNDVSckk4RG1hNkND?=
 =?utf-8?B?enhJQ3VvL0hVZXdNWkl6QkNCbXVxRmhneEY5Q1dmaVN0blkzSkpSS0Jqam9w?=
 =?utf-8?B?N2FaNXFSV1RsZGM0WEJaNzFUcCt0UXJ6SEkvcWhVbzNyQnNFTDNRbWpTM3ZS?=
 =?utf-8?B?NldwMzZxcS9wUWRpT0hhYlhZekd1Kytaa29yYlZNNys0c1o3WUNadVV6UElq?=
 =?utf-8?B?ZENVY0hLMjRyK2E0U2xDSzllRk1RV2NSdEVwVzVCTG1JRWowa3ZJNjgrT2Zi?=
 =?utf-8?B?L2J1cFRySHhKbnB6N2UxKzFKdU9pWnkvb2lJaVREOTJPMi85QUxKQnlJUzRX?=
 =?utf-8?B?eWZGRjRBMVRVVE82MytyQVA5Yjk3SnJvalNLblVWSHhPUTc2R1BJQ3VpQ2oz?=
 =?utf-8?B?bTJ6N3J0aGZmQ1VEWUo4bzVubVYrdnQ1WmVsQU9JQW0xSHA3ZTJlYzZkcnhY?=
 =?utf-8?B?Qnl6STVKc2tPS2Y0c0xWSlI0WmlEa3QrdWh2bGVMQVNVVTZJQWpsSFdhVWx5?=
 =?utf-8?B?OWhHa3ZSOW93R3lYdjd1aDRYZzhZcVJ4QUg5MkdGR2liQ2xJbEt5ZWROR0Mz?=
 =?utf-8?B?L0t6L3J1SHIzaDRxejVHR0g5UWZ6WGk4dElIdzVDMDN4T3hPSXNiUDFuN25I?=
 =?utf-8?B?SzRiMWhubS90Z3AwYmI2enQvdHhoc2NoMnd4Q25MOUpkdzZzajEzRkhzZE1i?=
 =?utf-8?B?VE95QmV0WEZkT0p6Y1BhT08wVU1Fa3ZlcXZubUdIbDMxOG9oMUx2VHZvVGJS?=
 =?utf-8?B?ek53cWJqNUY0QnFvc25RU0hRY1BwU29yc0hrK3c1OUxyZjdkV0RXaUpHOWRN?=
 =?utf-8?B?cDhxUmQ1OWlLTDBFc3B6cTlMaWVackU4YUhyWVZzVk5zdmt5ZEJMTGRFYUJP?=
 =?utf-8?B?bkQ1Qy9DNnRQNnh6b0t5N1NtdUpIR2lRUjV2S0JvVkIvbG1lRHJWM1Jkb1ZU?=
 =?utf-8?B?REJBYU5HU0dpOWhxU3NOSzEyUysxd3FINmlWSktOekxFSytXVFgrSW1EUzA5?=
 =?utf-8?B?TmRBbk5yZ1lwTkVMRnhtbmU0alRvTlFhOEJKNUd6MFpkZmdnN1BpSGczem15?=
 =?utf-8?B?Sk9FVmxrRXdSQUJQeUViWHRyWW5wSVA1YmNkbFZnUkVhMVN5RG1BVzBBMlAw?=
 =?utf-8?B?VkVBNVRTTzBIeVpwaVRqcC9ndDVJSGx0emozV0sxYUhqL0dqc0RCSlduS1JW?=
 =?utf-8?B?clJUTllGdzMxUjRnTGpRMjZNSnhaRHJQd0RiWnZiUVgreTlNMjluWGtyNHpF?=
 =?utf-8?B?TVJ0bndxbTFhb1FIR3BGMi9DS1FRcUp1UzB4V0IxTnFSUVhlR3ZOVWk5bkh6?=
 =?utf-8?B?UVFrdlZsZFRFYVNmT210L0tyUGt4NDl3cmFPaUFWRFk1TStEdUVZODFwUzI4?=
 =?utf-8?B?WnJFSkJLSG90cTFNWHdnTjlWaHczVStEb1IzVVZhYll3cU5hU2t0SDRQbmtJ?=
 =?utf-8?B?Y0UxM004YVlscW41OGhhbHpyTk5UdDk0bm9ZNDJLZHF1UlEwSU1lTktjemt0?=
 =?utf-8?B?blpNcmNJSjY3V3pPQnJtUzJoNE5SL0dUanlFWGNCb0hCQ3czd3BTY0ZRSktx?=
 =?utf-8?B?V0huTUNxci9CVVE2VXdVNW9UNHVzc2xGZjBkbmlqTy9rM2ZPVW1GSUt2YmZn?=
 =?utf-8?B?R0NyZFViVkhIY0ZrVm43R3BMWWw1NFlVTEFLeXplQXBIMlBtSGNWOURERm5k?=
 =?utf-8?B?bmFVT1VEQTd5d0Z3UkVhRFlRZDFpcE1ocEtqNHpobW8vWDlndTZwUjh3NTVO?=
 =?utf-8?B?ZjB1cFJFdDZoWDF1R091TzhPOEgvTEo5cnlXVkhpUEduQWx1WXF0dExMVG5n?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f9cd14-ff03-42cc-ade9-08da94ba6f3f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:29:27.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sry+7XSmspy1KThX76k+lkTrUpEGIYVftf+WIs4H/ZAwRepJcy3uhgtx+2e0XH8rvUyT6A7mdYs2Vfm11ZOyXbfq86tNSiDVyZ1FQ4m6clQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.131;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Header file nanomips.h has been deleted for the nanomips disassembler to
stay consistent with the rest of the disassemblers which don't include
extra header files.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.h | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 disas/nanomips.h

diff --git a/disas/nanomips.h b/disas/nanomips.h
deleted file mode 100644
index 0fd7299900..0000000000
--- a/disas/nanomips.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- *  Header file for nanoMIPS disassembler component of QEMU
- *
- *  Copyright (C) 2018  Wave Computing, Inc.
- *  Copyright (C) 2018  Matthew Fortune <matthew.fortune@mips.com>
- *  Copyright (C) 2018  Aleksandar Markovic <amarkovic@wavecomp.com>
- *
- *  This program is free software: you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation, either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
- *
- */
-
-#ifndef DISAS_NANOMIPS_H
-#define DISAS_NANOMIPS_H
-
-#endif
-- 
2.25.1


