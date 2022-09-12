Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51435B5B02
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:20:43 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjMe-00027o-KS
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibG-0006q5-QL
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:43 -0400
Received: from mail-eopbgr60115.outbound.protection.outlook.com
 ([40.107.6.115]:19286 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibB-0006SV-Ls
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlXiwI9mH9eAi1uY/8MrSBHR1EMvHqk90HM31HBBYYeK4ECuWKOrU+RVcssaVszjLwCdmte5ML/JJy+vZPb+jCjyYeU6gZkYIB5y0yR+JihjvXde5HjAvc9yGJPI6F6JJx0E5KUgUgrSgpVIjWWiEGt1TNq1ZPNg+19JB8THUDfKkSJuYgCrtZgF55ca3r86IIh+ukeGFxFyY6/p5CqZRVeVkTEKD6A0LIIgc9Wvlof5Q3+DGZW/7DXRKklurZYT18bA0tYn1SFbOFlgnqXVYMSVTQW/feMIKuEX6Egi8mH+UL3JCs94LrOdVCjE/lQsDH/bY4Sb8X4sVrir3+dukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYGgq0NzzMMmLCn8KTLaYXKHM+x2p5yiqka+roGDzdc=;
 b=VmFgygyYMrUHrRsLgQ/b73SdpH4LvwG4oUtHFm5saOjXszoU0Dgl/OKymky+346n3Vho8/6phiRJtfcgwm9mMCJEZTtPDuCek2uFU4Azw1nDuqtG6VybBdk9ctehEm99W+Q+m6OeCFrSowLJzMMvNe4LGoSP/WoLT++xanQvWLoKfDCm/mthZycUqChGmNGXa47PJqE1LUGC5NPjFbB18vAptcMcctSwNz5MrMTqXOU27sotezt/+l3sYsNr+GFPPJ2XmKTGZJMcZ70OHdGgtFO+zVkJpp4JjA1nEAMv/tMWYcPS9rAcvOaw4Mr8ETw52m5gZwhsetbd0Bx0130+dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYGgq0NzzMMmLCn8KTLaYXKHM+x2p5yiqka+roGDzdc=;
 b=Q6GwpEnjUf3uBBjkGmlwt3Da/3ZywElbMguHvHW0iNswx1na2D03P3z2U418WPH0WPlEbiXMiEVFOVfRTchC0kEYaE6CisFXcbM27VDT7tM+f+TyPSBsEdizMr+SxWznI/R6yEfPQLNnbaY8u5IwLcMwAbVuecP7+5qE2+DPPKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB4PR03MB9481.eurprd03.prod.outlook.com (2603:10a6:10:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:31:32 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:31:32 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 19/24] disas/nanomips: Remove function overloading
Date: Mon, 12 Sep 2022 14:26:30 +0200
Message-Id: <20220912122635.74032-20-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|DB4PR03MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 136e9a31-6252-48e9-15c6-08da94bab9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAd9K6c7DB755Qtb7qW51RI1SHv48JvoU4ttAMfMCpP+XfsrXQKq8h6YPTPprEcNso0BFA4E4ZbXRVA8g8w70/+xE67dlcmv7j4CzDf9V8w26DSmr9U1eWl6DlKRJcJD2VbHyFLbytRZPA6IkvF0f3Z66PK8KHQVj6o6ZEU/kvY5any9SqNLugtHq83qHrDFHQwoZ31faykskOsK1WBx5C+BW00/Wb32pawdrEq6FR3DmaoI3CUMitFFdvRXJr2hF8PRGyVf/v8Ee++YyQPAmgU4Zz98DER9b2JzpKW0UgOIksO7logUsiwIbRCXOgNWg7/Fu3g7Ndu5oIS+9NpgM/Vg9znPi4Fdjboo9E3ioVihnhMsgLvXJCgaUNuOiFds2uPQSrdSi3+pZYeRvd8GTQK6+g5ut+qgmo7NINvs5tp3HL7ccbMQToBsXx8N4hBcsDICSdXJKcS1GxtHeKc47y5wZDT7fTFBVs59Z9Aibg36qEbYs0BZvTO2HWNcJZaAf1HzY6Cqpj+dI8wilOOa13hUVcvw83pkfSWyA+vXhXG9oHzOR91p7FjCkmmXh4U4TWWGFvnOXZxpyQB72jv32V+t4K4+1Ok9fI5nkjYyIxswFWKCdyXgPIDZwXS1ridQTvYxF+/1EuJevDDcBjYe3oYQE+HCtZUS6HNSxYIGM9tB7Y5AcjU9aC3np8If1KNscji3Ar7EVq5LXjehGIsD8srbuanW4ve08gFV59e6MoZfyNuJU3LH7Okom16vzHi0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(376002)(346002)(366004)(396003)(4744005)(38100700002)(26005)(36756003)(6512007)(41300700001)(83380400001)(107886003)(2906002)(52116002)(8936002)(2616005)(44832011)(1076003)(186003)(6506007)(5660300002)(86362001)(66556008)(66946007)(66476007)(8676002)(6486002)(4326008)(38350700002)(6916009)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g/DKyDMyMicIFCMJ3IVa4sqvP2frmcihshT1aZYDQU0W730GhDJhMfVQFfln?=
 =?us-ascii?Q?I0/7BPtsp22s8CiYiisXe0Rf7CvKSbh0ySwIDmxQXVln5x7/Y22qVHJ1tbST?=
 =?us-ascii?Q?0ExuduAiMCut3HGHKiq4W1aR8dIGn0np2HHsSfvCYQsvuaFSD5JvBGpVdQ9H?=
 =?us-ascii?Q?5kjImJU7RXRPIXfZh1EHaTpUfhUTNWfHf1zOkZ9y5gOg5zfzne1qkYqH876F?=
 =?us-ascii?Q?1KZYS+nmTqjE/C2XM03L0QplfBNclcl/Yr8BW133jXYZu5ylYE/eoOrwAB4l?=
 =?us-ascii?Q?r9ZyGujCjMt3Qv88ED4atkgIQAd4P6QMasU6L0krkFdJHCIAgDof+mgo2o37?=
 =?us-ascii?Q?QoBKciDl9Y8AeSwsHWCeVdxX6wU+U/p50a+iNjLbFNJiUtS4sc06pNIRtrO0?=
 =?us-ascii?Q?/El/nnc4dRJwGFZwEDEBjtSTd7HZXNV6hu9Lv0AchWRR/KRMQRftaA38Epe+?=
 =?us-ascii?Q?38Dre2M9H9UKVPl8MwCmjVniDhWhKgwvVqLUNHrmfLVJJgi7SiGNG5M7XnEp?=
 =?us-ascii?Q?HcQK3b0+At2DguVpwuI6pB0zlEU2mqGT/jOnBAL7GF7yqF5eD0SWTM0JmthZ?=
 =?us-ascii?Q?oCfapVwgkjj3+KBxUpjuzfVrGBM1fTJM8PjoA+ZbMXpDaxgwiabVR02+wlOu?=
 =?us-ascii?Q?wFgjoIfERkCtk6uFBQkDFZ+oNGaLs99rrk9Pz1sYxxyRMjBy4G6jux+kDl4W?=
 =?us-ascii?Q?DNI68P/QfFUTSPELvzXdEL1mWS+0L9ZYRPjPw5AvOPKrmJPaEKzgLbwUMNTR?=
 =?us-ascii?Q?XxIr7QvZy9dKsgVsuzAcivCmIjkrHFatEZj3wkiekv9Zyr/ihfYAlplF8lel?=
 =?us-ascii?Q?rQHR+ZJWskdN2xOi2zidIpWUWS4ag59/RLUHIGYzQj6fZXeuX1a87YpKrdKL?=
 =?us-ascii?Q?KsjfcfcknixKxlxuynFBsy6CcLMVlkhAgmkxd8kwS9ItiKFrPqosfd3IZek/?=
 =?us-ascii?Q?fwsF/xuDfIo2JtKF77TcFjpzuYN0bbuD8L2RhILL4+BWoFSmcUKNj49DpB38?=
 =?us-ascii?Q?AnagmB4Iu8vEZIV6SGtn4eDnEYskukiBFOBHeMJiTlE5MA57wdSYxKtH0pjv?=
 =?us-ascii?Q?D1bpuQNGprC7k/11ptJ1aunHDs0k3tW8KFgF8hJKGSwL2pywLp9oH4bL5/FH?=
 =?us-ascii?Q?p/IbqABxoI5eBxJ1idg6NMkiRcrfaf3asmHNw4viWpN+p6+XZyL02Pdk3HTm?=
 =?us-ascii?Q?0LgItE4kJxm8DT6U+tPppK7JFxx06+MKDsoopbSDlhRPv+dzrNdQl9zEjCL4?=
 =?us-ascii?Q?OiF9nsQDJOmTV++HsK3CfWlNYoyBDX+eznYHVjXVa6uk2eXyxy5f4tdf8co8?=
 =?us-ascii?Q?Y5BrEWOunxcdXUViOw2ff7jXMlCcY4TB84B8fwqUS3w4svqp2xF8jLIpSQjE?=
 =?us-ascii?Q?01uzTPIUWnHoMf8fLqvOER3jrRSnctzyWKRVB7dxRrNzK7TvzzZ6NsjGtyqJ?=
 =?us-ascii?Q?CYYedU4yFVcVSjUT43QXaZG6enQF01M8nduo9I1VIM1eHHyQ9fLGmqQDsRDz?=
 =?us-ascii?Q?BgZ292oPPOiDI72Bp0DLSC6Sb7Gh4IKGU7XG8h99DGEpv9cm9OFV3Z7a6Ruq?=
 =?us-ascii?Q?EFSY5vcTysk8q9E10LtpdklDIyi03h7tUl9IK4gdQqnA1WE80+b5yC/hTKFd?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e9a31-6252-48e9-15c6-08da94bab9a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:31:32.7224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me6apDoAWbhNJqclHrX81C8Pc2F44qEHErmDn9AqjvmYtY5+ETIjQsn3HRysc7B5/hoHlJ3NAvEYbeti+ZqO9uCkQ4QM8mDpVl9biDUKPjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9481
Received-SPF: pass client-ip=40.107.6.115;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Disassemble function that calls the other variant of it is deleted.
Where it is called, now we're directly calling the other implementation.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 52b3708f75..132cf89f6c 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -21917,11 +21917,6 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, char **dis,
-                     TABLE_ENTRY_TYPE & type, Dis_info *info)
-{
-    return Disassemble(data, dis, type, MAJOR, 2, info);
-}
 
 static int nanomips_dis(char **buf,
                  Dis_info *info,
@@ -21932,7 +21927,7 @@ static int nanomips_dis(char **buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, type, info);
+    int size = Disassemble(bits, buf, type, MAJOR, 2, info);
     return size;
 }
 
-- 
2.25.1


