Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30452592AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:07:09 +0200 (CEST)
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNV7s-0005xm-6o
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZt-0001IN-Nj
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:01 -0400
Received: from mail-eopbgr130138.outbound.protection.outlook.com
 ([40.107.13.138]:27730 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZs-0001EN-1d
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLYUO8pddp8Y10fticOi9+HRy5DJWcZYkebrD7ZEuBWfOuSAYiMHY3HC9gbpChAvvk+1rEqVPsBoAh/sUTTXKw/MgoWVIqDyYE127KWTqK8HNw8opND+Dn7cm9OfUY2sF3EE5KPGS1g2x4Rb3yJ6XZoQ+FbVFXnbnHeHXCV6jbNC1BQr8cmF/OG4VnsSAeooqApmX6oTzrBXOYcAfOARGXkIkbRaioT5ofkVtA2Wreu7K68D1Fw/0qQi+muMQizSAyL/g2Fr+jCt+lvPWb5VDsfQ6JTTRUYRrOygzbj73nx+Bi2r5LU1/gSKHVm0vqUVkJkStU7J8n8+Ceh/B+corg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxsnHziiPhy3f/geTKEG3yMpBfhtdES4wcNlMUUwuuQ=;
 b=A3OcLR3JVN2xz0hof1zRh5uK3kkT1Dw/riOGLNbnMoBBvx6eKV/fL4nZTGrCHDy/xdW/4MNDLYHilkpLaTzpsxECKLVMEY47TOZpxNqFh4xUztk89tW4FHG6QLaoq/3IwZTLyL1fy4KUNJKuiIm349aJSRLeZGz3NB1DTmxS6rYVH446c55hvqOVRrUz6dWKKaMcjoeVhECDXIEA14k8knjtoW68q7g5dvp8hVam6xkicgRjyNPKYC7vLY1kI2AVRgzEnQbsRMtkVLnpOav1AidWkEr7YQDkVCI1kMNdkgbJtouKq57seup/uTmPBCHtAjFlwyT9TzTyAm17V6v1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxsnHziiPhy3f/geTKEG3yMpBfhtdES4wcNlMUUwuuQ=;
 b=XbQ0LMgZpEgE/LZkDL508DTOXONN+xf+x6SX0P7fTgVTjeuFRsDi+fVdSbBGKViYan1qxl5v1+jBeP0J4U61u2Mng2F0lUJx4eM8xQZdmAGg/aBbDfw8eh5wgM/ZMdz3QV4aGeThV85IjelKLXSUZOKsVLOvsoCQe4eqUaS+Jq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:31:53 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:31:53 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 17/20] disas/nanomips: Remove argument passing by ref
Date: Mon, 15 Aug 2022 09:26:26 +0200
Message-Id: <20220815072629.12865-18-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e540557-17f9-4c89-3585-08da7e9039b0
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d84Nni9XqVNfhZ8LnYdFTX+RY9pvyJFbfFZqeUhTtZD2CRvtWyUqXp5lmvP3BGLvd5eDN7DmNB+H4rVFhWzaR69P+6lTRddyM5H/iZzJ3s5kaNjZ55oh59VUBQiwuZK5oE8PCQn01zLlOS5GQ1hhL0hKI8pyOjW4Irgormb7FexPjEoEhlNMlsRQGPKbBhBHgpwyy1mFNtjIh32FSppIfO8Y9hkutWaXhVGWev0lTp03v/tPJBwosibS6LY6jHQ5IhvKTY6q++yoBGg3INHbSHeifBzGi/EmnXfNGhl+XkeOIErOXMJFqWU/Al+3tRvXW7KPFKI3z69o+g6NsJV/VDCVlfm8Wr1E3fUJqduJyqqnKQqLFVXRTpPLpBiIyJldC+Ovkf4YWRH7O09QIYVVwyX95ROqplDgrwPMJVNmG/ybV3mQZljFE3sz/b+cypSKdm5cKkvmwD8EsSzm8nPUY570UtZ2Itvipl17HIShGoSviImSipofX0v+xACVQkF6TWTCowcPn027z5OZKNukhsLQ2YKr6P2PcA0AmsUfFWa6piljAHAe3sdEQSM5tSy72XnfFyDL6lJKhTAZ/E0G6eEtDI9vSynEUzkgnP6Y8hNyQRFUeJQtFZkS4fNs7sUVkBrs3VTsHSIWMkEYX+gsWiGkDAPE6jhBKkfwNHCs8PxOFI/CI68Z5fw4wxU/8rfj1QHhbao/YYi2lXfw2rbfDbu9IGj5elare9SnjS5f8trkWqLqsfq+ZHxWZTFKNWy6eo8QAi4GNdYwY7Eun1jSAK7os+Zz3ftIq/dxbdE3Ufw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+CFQnGLpwMjVbIhWug1zdnhEmFm54/e06Vo9jUfta1xvVD7Bm6+vk1Honf4?=
 =?us-ascii?Q?Qra2ek45TTe4FKyeOtGsJawe5AVXFPd0LHO3fpw6hBgX7CWvzkKEtyr4QhNa?=
 =?us-ascii?Q?3oxjx+bxdAnaO03D34+WN2XKrmtY4c1oNLmddnGLkXG4JTKGDWA+FHfcTNBq?=
 =?us-ascii?Q?cAANZnC26B4pu+OCjnfpBpIJY7nJXw9KjYFa2dRXDtmgaayhy7A7nlSFcDuf?=
 =?us-ascii?Q?uf11YsxNIuZ+ptIWSSyykWQvAVeB3X7436stHDqMSB64O6kQjxhUZD0cD+bz?=
 =?us-ascii?Q?Janivm6uEVjrv6EU0wxYTL03TQqOBTZoSeP1Zoy0Wv9Ntr6rXtPv4yodYYi0?=
 =?us-ascii?Q?SxY2IYnVn5SErjenZtucuvLgKFbAVkfZdqcEXfB+EKbybZphwzl5TNsj4vMP?=
 =?us-ascii?Q?/+NP7ex0jhVk+iAQknezSnnBc08MWyNn1b3eWww+nW/hxNesmY6duCLG3vnC?=
 =?us-ascii?Q?L8T5IPUy9tSLv+pcS4OYmsjFNG1USUWGdT7Xax9vKJaweXrleIQzyCWSTS0q?=
 =?us-ascii?Q?CNl9MzMpohdhivSGlNws3zE4U5R2CMyp+Woj8Lh9+oBMIg/+ql6HzyjcMDrW?=
 =?us-ascii?Q?4sjXjCG0gAdfnN6kHsRDspLPlEPWx4iUE02LzZJK5wgoJYIZjz0eQdJLVl44?=
 =?us-ascii?Q?PVcy+87/rRnAWU1pkZs5I9741DOJbMOdl5DOvkD41gLtcGn9rLaJd9y2jtoo?=
 =?us-ascii?Q?sXQeaCx77jvtnSLIJyI0Q9U1Q4Hy7dfKUZq5RQDIC73BH+iagz9G4lleX2Tf?=
 =?us-ascii?Q?A0djLQ1Zx9NxC5zgRMOoVUsuFxD70cs2Ggep40/G8X5p665GyCdtk3PSNX9L?=
 =?us-ascii?Q?FKcQbcn6F1ai5XchtJ0CGgRw/7nAfzHJOb/A2RK3f02v0GzXr4an3ehuAFGy?=
 =?us-ascii?Q?rSITODu6dGIMZCgHfVzCSeaWg2M9ZsD8mI655X3nervOmT/z+UUtE5ii8znI?=
 =?us-ascii?Q?4j3vvj1UzdOZsnuvETY1CNH/RWhFjIv2KdCgUhHvN6xiEfFOZggA09XEt+6O?=
 =?us-ascii?Q?oE34ZISVfVx++UJ/Aqs6iniQfXR67Ouf3JOACnuoaoGqU/foWUMO8c55K+GW?=
 =?us-ascii?Q?VjMorrm7c9qZCe/5bsVnmIeagmtn2S80p9DwJm6v4y338d/qNpMsyIoWgot0?=
 =?us-ascii?Q?1gGoGXQOQWLXFAhm4hv8Q7OB171BlYPEU6ldOnlmLmKi6MXEFeLblqkIWS/M?=
 =?us-ascii?Q?6IioRL1rf65LwJwPMVmcUjBtOWRfSmaXIpWXRiU1hRxwvWiaCBdseirGI+Qg?=
 =?us-ascii?Q?xh62VsQo0UuPx2KmpLFRw7c0mB/Ydo/yQbOm0ZLMCL3S/s3uufjplxb2t9z0?=
 =?us-ascii?Q?wvMs2xuGbUlJY4T/KKFEyUNdJAemZ385oAYQMN5ZRTI8pd47HjjoFrauyZX6?=
 =?us-ascii?Q?zLsLiv9kjbvt+w3PuTI8rV91WZvfMq0Tt/rUvfPY5eHCPOfYR8Dt/VwH/DHe?=
 =?us-ascii?Q?RWzf5pYUR9UwkejxKWKuz0iK8V5jHKHIPtuULkoD3S9AXKR8K+wiNU4UNQcQ?=
 =?us-ascii?Q?1+aL1hHMoatOcfqqj6q/Iiv1i5GigZfDc8rQJkBsCKNxnIXq6rHcGDh/t5Pd?=
 =?us-ascii?Q?3qm8qawOdgcAYK0bG9sXB4v74A1XCnCXiLnNKTMv4FNaEN71W4jk0vsbudi9?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e540557-17f9-4c89-3585-08da7e9039b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:31:53.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDtuVw2kGksTP5Jua657HphYyMZOGf/aFXXqVwW5/yo9TIrJ4KRVx58hxyRS96PJMWWtbzHb7oTvhd+iRzDI+Ul9KMxkn73K4HeOmccfoUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.13.138;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Replaced argument passing by reference with passing by address.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9406805367..7dfefdc5ed 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -638,7 +638,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char *dis,
-                       TABLE_ENTRY_TYPE & type, const Pool *table,
+                       TABLE_ENTRY_TYPE *type, const Pool *table,
                        int table_size)
 {
     for (int i = 0; i < table_size; i++) {
@@ -673,7 +673,7 @@ static int Disassemble(const uint16 *data, char *dis,
                         "disassembler failure - bad table entry");
                         return -6;
                     }
-                    type = table[i].type;
+                    *type = table[i].type;
                     const char *dis_str = dis_fn(op_code);
                     strcpy(dis, dis_str);
                     free((char *)dis_str);
@@ -22792,7 +22792,7 @@ int nanomips_dis(char *buf,
     TABLE_ENTRY_TYPE type;
     m_pc = address;
     m_requested_instruction_categories = ALL_ATTRIBUTES;
-    int size = Disassemble(bits, disasm, type, MAJOR, 2);
+    int size = Disassemble(bits, disasm, &type, MAJOR, 2);
 
     strcpy(buf, disasm);
     return size;
-- 
2.25.1


