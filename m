Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060645B5A5C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:45:11 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXioH-00042h-Gg
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYZ-00043G-QC
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:57 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:6240 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiYY-0005oA-9T
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:28:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZZjx5VhHZXf0+6uHv0EX8rEutIa0xeMdxCPQubd5+n2azSiKalSX8i+Av8Xzr8S8Vy7xzZBhGLjn7FTruWlM1IAxqpIUucWEHeLrIXm69jBGt9aUjxK0+hNH/Bq/z2UByANCn2A13t8SQr3N7zgzUUwvLfnpWLD7g7SrywYKzLjxJwV/ZY9b6drPg2TUK0X1au7WXCbwr0joPBQBc9+zwTb4f7/7xKgNRXLBbjQ0kLEgFjhMSqMAOnpNbAhi/sgX0uBNivvhiDaFbg9+654RA0WwUbSQKmB1xPtDPe8MnCl4vukczxIBJRvszmoO5Lz/FNK/5MXwtHGdxKJYdEZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO+lpPsmnGtWoA7qG6RRhVul0IJAUn6sR9Ll6um+1g8=;
 b=KaGFNQJBehY32HDAktv+1cS08E2yIv/YePj9FV7V5BzJGS+mOCHKk4wvplHgaVcIWFWjCOhVGU5OV9axKOMHMNhFnwEvD7lRdFmED5/AMmdAtZXChISxj2S4vyjSkZ2bHOymFEMizKmp4l3lTTbm9ytSIqMXun2u8FdZD1G8JqR719KoD0337NP6x3CtskVzyCl9rHiyQeHzgoXRHpajBdkTxNUsQqQcOgz7FFZjSYk1ZPRPQ8jYpaW9cDdDpsyjWainptGei4pwDcpSWxQKwLlI5BbxJ9dMoVIYvhjBufcdR40abbnn9iO3cXgS4MkhxrGXerg+zTQHP4RZG5yzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO+lpPsmnGtWoA7qG6RRhVul0IJAUn6sR9Ll6um+1g8=;
 b=eQvOVKxL9p5wNXx9RgVz2CY3w1eH1gtWqrbrCYhJQPV9p8qCW90Si52xMC0iEisfttgy2xCzRDmDQtIbxOH5f0Y1iJr2GXOtJ7KPiyFdOoz0ASHdN4qv6v9GVznl+KGPwlXZPbeVzbZ0SfA9yKgjd770jCt8BwXb0JKhhnYBC4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:27:55 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:27:55 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 03/24] disas/nanomips: Delete NMD class field
Date: Mon, 12 Sep 2022 14:26:14 +0200
Message-Id: <20220912122635.74032-4-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 060fade2-f8cb-4da2-bfba-08da94ba3865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/KZjC7JxwQ8A+CW6eg2C1GKf3t6mJzVtePAvWUxMeXnuQ3KrkiWoLT7YHYxxmQkQ5OJGyIIpXIGz4csdNyUCIlcJjdLAfiBCxjRfi7HGlojgy/qfsb3p9faVRpEHBBJ/ZK4A7uIm12Cwl1OEKybayDXtep322Q7hPv5hjFtehp987rfOSjFblUs+KqkOXApF6djQu1TSugL14FyvX6/m4FdUxKC7YwErVgdYE2F3+oqEaKKuWe77PZ4dJ2pNYdLsT7zWr5aP9fvA/iObKzx51QPQwwHW46wJSZpsPqLMl4YlpPkIY0xLinJ8QnnsgTk3+LpE0C6AUJ2I0EVNZxQwBYu/bwKkLC7iGD59/A2+FuwLIF1PVhOdadOELZo9QCMMsDrRd1RnVYbwFnFSsyMqfR7PX5kjEBDVcel6MY19MjDkoKQlCnVWlbLDbyq4QKmDRyTpNWQjC9IKNdH3yuc+ETnJtccmztODIgGMoC9SMYGx43xEc7NVHavBD+mwFjeDH3N0LwEW9upiTHDaHnWS28pq3UYrh8XEFNxghhyJ30mCUTO81TFj0rYlxhacWjIKLR91YtX8s9XS/79rCIBP6KYwU+MkACDd7MoKwDSMOLZLJ9TDCYsefklBfVjKKB45LTVoHdOKTsplFE83S8c7avYGmb258boniKzCPVrxqm18WtOkbrC5WsH4Bpu16ClmG+apqW20ttrFHoZ6kQjorxtAmr7Xqe3C5J5KYqebcvQl/JIuDq18dBedoLLplcLGzERMZ4tEKbNjbLRW4htOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(376002)(136003)(39840400004)(2616005)(6666004)(36756003)(6486002)(316002)(6506007)(6916009)(8936002)(107886003)(83380400001)(52116002)(478600001)(41300700001)(186003)(1076003)(2906002)(38350700002)(38100700002)(26005)(6512007)(44832011)(66556008)(8676002)(66946007)(4326008)(5660300002)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?arXZZEw6lrCRu81DJBtLLG/5vMNBOSZAHizWQypV5/YoKZrvqSfXVIOgmfBr?=
 =?us-ascii?Q?Om2sdJHGodf9nqVPId7FZiLOKQ0QaPzwKM1CsMzXlGUi9TRjktjTSMl8WZ97?=
 =?us-ascii?Q?9+MqY5idqAa3gvVe5dgTg6yNqXPHyGSDiWVPNxs/WaaJcIjcyo+903MR63SU?=
 =?us-ascii?Q?QetOx8oasQ50Smbk1KeYLXH+nEzax2XgvxH35TCcTFiRRtItzAdIT3IXufrJ?=
 =?us-ascii?Q?GKgR6Q/FgGo6xFTVv/qA96/baK0ELi2sKi5Ca5NnA9Nf65JsqMvXt3i82Mw6?=
 =?us-ascii?Q?RwCz9nWxQujetMwFOTVTaLXg68mrypNRbMZ1j+k8BqliA+2b/8/7RR8AnJb1?=
 =?us-ascii?Q?IOS+cvgmiD9TgvMeFfCvA01SMVaZsgvJhduXUBWxqwbbMwu32TXn66aLmWZV?=
 =?us-ascii?Q?Wsc/BQsp0w9cZLrSS5Gt+R0H35NaRGueqofL1MHbgaMqrhqOM3jKbpS5qo9f?=
 =?us-ascii?Q?VcG6HFxDVZ4qnN2zZwB9I9UP7M+jq6AHRdCLa4qsBXCJU/izNsrRYFygZ2Q6?=
 =?us-ascii?Q?tMEDHjtP7MALl0CAPJ5Gwz472R/Lx5YVMzOUMuhxt0lY7uVnx3pOlfmiYKVR?=
 =?us-ascii?Q?q4Mza6AuuGfjf+thNeS5b5CPbaAh9lBGBDflCIToN5o9u4+pFOjdriCR4Ml8?=
 =?us-ascii?Q?oXjqh3uKU50HpX1gK4fNf3zzHzxJmS4GCA17xX49ACWhCw8+DJX9HDa6NkK2?=
 =?us-ascii?Q?1euOB/l/ZeQrGMHMP8DWS44HKjleu1c2OyDbinDozkPtCtCbXGXLDr+S6+xc?=
 =?us-ascii?Q?HXytMbWXe8SKhjhdz64pVlsDdWfqqdAxRV3WGnFHipQKhzPz4PBN44xXuXsz?=
 =?us-ascii?Q?2CyLe0Qe3XLjVdd8YeKVSfRBTEsa6FNvhRgiMQfbFYFkmPoTVwNW3vb3QEd7?=
 =?us-ascii?Q?whrYwyp1J2JkKGLjdFY+COBukzphG0m30Pb9/nIB4R2/u3j0Mry32p+WUxGM?=
 =?us-ascii?Q?NI4APRNgik3MlMVzgpd6H1OydDbmwRinE/de20rbHYe5jqWeK2oyTNDGy0eR?=
 =?us-ascii?Q?6utRN2Enj61kZ9ROnEnl+TrgfNrhURq1vBsIkV6aFim9m2wvEsmI3gU4pT1y?=
 =?us-ascii?Q?JX+lK1Wkpu30mjDQvaPnJxcMwt/q/fsFRAR0Pm0ud2oUAMRn6fu80Fz9W4Um?=
 =?us-ascii?Q?suE+4yvnACQlo1jpUqR4RsxIItq8o1A4CaHQSNl0TDEwNK28NN7xQUUjRm6L?=
 =?us-ascii?Q?tfPBExgbHzXonRHyRFldBJ8wJEPKMdrybwu7mM2Ida9vcoAz/ZRTm4wsQGBv?=
 =?us-ascii?Q?4a5RJI6rVmAw3RsZqI6TU4TY5w8ya7Rhv+pT1miWMvF86ZreOvPB4xyDFjW8?=
 =?us-ascii?Q?oyf6lzSTYt/BcSJL3j8EREQH7mxxFmpQ6WiUQBKLFPMJOiqSFBGiMud2jtdf?=
 =?us-ascii?Q?uWR9yWElqZ8PusbNoJM66iJQDkmOnQ3eNAiqhfCHNkaEbS+2B+dNqbCEXqwx?=
 =?us-ascii?Q?4rS9AHwe7v5KX+M6GwjS4buaRKqAG1H/sIFPBUawhAUKVeMMTOCBnleFB8jB?=
 =?us-ascii?Q?p8ms7sgaBxfqtQqyaep5KChu/HR0sJwbhgjt4eZKi8+XaJOR0x4wBGgmlVCD?=
 =?us-ascii?Q?Lah8Zf222UIauiFAMPiVomWXGCzzjKPRtkxI/SZBHAAQc5xUiuDbqmqkw+pd?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060fade2-f8cb-4da2-bfba-08da94ba3865
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:27:55.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqUGCcmhB/xlDXBeaDFeAGb0KxBG8dwFrFXhdyVrsAA/x7RTALXbOSl2EL8rG9kNFDjhbLjwfbQJECFZq3X0vX2TK6MUws0VCFVd4S/mij8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8805
Received-SPF: pass client-ip=40.107.21.139;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

The m_requested_instruction_categories field always has the same value,
ALL_ATTRIBUTES. The only use of that field is within the if statement.
When replaced with a specific value, the if statement is always false,
so it has been removed.

Now, when the only use of the m_requested_instruction_categories field
is removed, we can delete the field declaration and initialization in
the NMD class. Also, we're changing the way of the construction of the
NMD object in the nanomips_dis function.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 13 +------------
 disas/nanomips.h   |  4 +---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index bdc640b38b..721ca3f52b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -51,7 +51,7 @@ int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    NMD d(address, ALL_ATTRIBUTES);
+    NMD d(address);
     int size = d.Disassemble(bits, disasm, type);
 
     strcpy(buf, disasm.c_str());
@@ -812,17 +812,6 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                    (table[i].type == call_instruction) ||
                                    (table[i].type == branch_instruction) ||
                                    (table[i].type == return_instruction)) {
-                            if ((table[i].attributes != 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) == 0) {
-                                /*
-                                 * failed due to instruction having
-                                 * an ASE attribute and the requested version
-                                 * not having that attribute
-                                 */
-                                dis = "ASE attribute mismatch";
-                                return -5;
-                            }
                             disassembly_function dis_fn = table[i].disassembly;
                             if (dis_fn == 0) {
                                 dis = "disassembler failure - bad table entry";
diff --git a/disas/nanomips.h b/disas/nanomips.h
index f65a0957b8..5bdfe1e30b 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -65,9 +65,8 @@ class NMD
 {
 public:
 
-    NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
+    NMD(img_address pc)
         : m_pc(pc)
-        , m_requested_instruction_categories(requested_instruction_categories)
     {
     }
 
@@ -77,7 +76,6 @@ public:
 private:
 
     img_address           m_pc;
-    TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
     typedef bool(NMD:: *conditional_function)(uint64 instruction);
-- 
2.25.1


