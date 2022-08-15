Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C4592AF9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:28:07 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNVS9-0000bn-R5
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZ4-0000XQ-Cb
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:10 -0400
Received: from mail-am7eur03on2127.outbound.protection.outlook.com
 ([40.107.105.127]:38112 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUYq-00012i-Sm
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbP9ySrAHAuigNnHkV56mODb1Z7c33PNRPPZdUT5VcalbnsfH2F16ghBUopx6PNJizGpW2rLSk+vsPF0PUPGB9TNkRCzeVWvwZsZwLwHdSeicTb/3/vs0/rhVEqz2Fq5nwa4amPLhH54HX30vZNnGrpywqX9FkNQGnLF9f7XRhObzZz/liFCePgimOo2ehYtkcb4jgIYRPrj40z/Aj8yKEVbX2lB3psNxhq2FRc40benecGINYBc9hXnWZoWMa8cEMTGao+6kJPJ/elsEar7npDqi7On6FKglofufBqOJoTCx7gA/+ksbVqzO2d+xfmo1tg/OUPmtr3n44djkXXiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK5Egd7Hexm/z903oqH2r7pycV4oYgcS5lnwxDVFFfM=;
 b=NeiDbZuPDXpAoZXVmjf6epM3p29TADKKeloHCGnPw1MqLDdECphN5LYf6SYPrEej9MbBMnI5x0wuadJI9E6h3FZRESkpaft0NWRda+IZQ0hKrzWy0uEhtW/vcL8YMpvuQqnRUrsrPgueLNJVS8kh48lB7DDWXfxAo02WK6lQnLO690ak4zkiG9uOaRqLnJEJBdqKNoSeinP8yhKok+Y55oOFLElE08Cl9y9EMmOaQVquV77458GbouwwS0mtojdPQ0vrHFOzk+P4r+ybhhQmiMMF/gK9WDrv4hPnoGO1YiFDdgmxCL4b15y0yIS0gmYEVwPCgXgrbYjKyDrUg0Zr+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK5Egd7Hexm/z903oqH2r7pycV4oYgcS5lnwxDVFFfM=;
 b=fnLJ7CMbjx1ra0e6KlisteGtcCJph0w8NLHFM4m9JIxBodPbEJUq57XznphwlRwnC3HCcjg09W3foj69xFZeq8fxqozsRmWVY3lJFF0JYQwN/q8K6MJ2HiKQZX/6bkok9GCg6eQVoymFWp9LCOvh2U5YqYe0rsvL/8A6X8HdnKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM0PR03MB4515.eurprd03.prod.outlook.com (2603:10a6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:30:44 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:30:44 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 13/20] disas/nanomips: Add free() calls
Date: Mon, 15 Aug 2022 09:26:22 +0200
Message-Id: <20220815072629.12865-14-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 97f490ca-c402-46ad-1d0c-08da7e901076
X-MS-TrafficTypeDiagnostic: AM0PR03MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/GQ2OK0ytWGe/gaHjDPP0JmkhX75DbcN5fN0sC9aBpQhVPw6Fntfvp+0Xh3MKCzaL6jWcapMBJQqJV5ofZuGRALkOJqf0lqSMoJRQD0i/B2P15mQD8eoM03asNCow0sh8VJjGAGNvCKcLYorKp2yc9FNCfbtSFbDqmdC80gt1LZ3Dd7cxgrN+fqWKAvsDcuWYi6G2TDIp9G+Qbkj2Ov/QJPcCyKG0l7Xq3OVaeT81TjsqOQcYAQOKLFRY5dYhgjh6mraYNSDgIDBkC3yWQL+g2KksvQ5lkB1bOVr0y+CTDyu5Mdp1VB1SodsMksW8oaXBNkyagLNwkB+MW28ZpD0U8MsVAhTgjz1wm6Z3L2cEy3bkm6qAsjmHaqyT/TbNdpxCJyP2DrFJfCsipVjrAAA7qLF3xXw9ua3W02UqlN1lCHf6oghGRHl0fg14wlN3gfpCxX/zdW/iifLNVMo8PcBr2dLWekQaditeuS76FXmXYZkZHiotXzI74Si6lyDqutysPlqPUhssK457thB+kDdnsbM/w25xQxwgV07ekx/1RhBSNjzGDBR+mykpIwByJtZma8B8JoEEOy9AxGr68Y73QpcWrOmWbm2U/+dEh7T3EwCUHRCuHw2/yjfOh5Ymf+RcUdUfEl43sKihGQA0NNG1ejISS9LaiU4RiBht8Mwwhh7blx8R/DsBGl7lYEU3r6hCyNHaizc27r/MMBqftk2mzSRcnaBHdFDs/ov1ZaxaKclHU0uBO/C6NSsBhkGr4JkkDLns2ihJXxCQabIBLrtWpfFnc/pwFFRKmEuH1uRTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(346002)(136003)(366004)(39840400004)(2906002)(44832011)(30864003)(4326008)(8676002)(66476007)(66556008)(8936002)(36756003)(66946007)(6666004)(6506007)(316002)(6916009)(6486002)(478600001)(26005)(6512007)(52116002)(41300700001)(86362001)(107886003)(2616005)(1076003)(186003)(5660300002)(38350700002)(83380400001)(38100700002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGk20E7b6JZ1DNiIz/3sxk6829g20qUV3AS9R8G+WitKxqtluWTk1vAvi73v?=
 =?us-ascii?Q?j4h1o/lPyQPo5z0l//VxmSb11HRXackac5MX/Y62J2xuywQDhOuxfErKO6Eo?=
 =?us-ascii?Q?H8+2/4kq4r0+tdQguVVwoxzIU3y4YNKtlP7f9FTIRow0OOU2/5YS9k10B3tk?=
 =?us-ascii?Q?MS2NvDv88tDRh3so55sUzObfhq70l1R84aGVMVNwJqjSYMlysFddAJECxYra?=
 =?us-ascii?Q?4myW/t1K57bqgHyLT2RYfw1uW6Mf7n2nm7VZ+QWx+jI3wU/eQmNbvznGUiqR?=
 =?us-ascii?Q?MJcFdC7HqqPN/87RIl4Ja+FaKbGRu59bfjjPrWE+RpDdHziabJmTXvOdLqBd?=
 =?us-ascii?Q?m7HZNHvRFyOfw9vEPLUXfSNWp0FTcEezADPouNFHsWJfeJyiwXmjKYJBfdLH?=
 =?us-ascii?Q?EJFK0v4GvX223WztHQ+seR3SOIPFE5dZA4m7kKeXJkjYakMLVf2l+ctVDxvr?=
 =?us-ascii?Q?DC7BxG32Bnvg1GnNi/oJ1VhsPtx/BbsXpu6t8avCKf+3aL11UzkuQ7VJ2l1H?=
 =?us-ascii?Q?AQfNWmIuqo49g/lfn3cHrMOxbPD6K6WU1zCb83znNSxY7Mi+MFnFauKuj/zx?=
 =?us-ascii?Q?631vPs+pv+o9LDL41ATHxR6cA8kkHHgbWLppPz+JyhpbuoOtErc/16U7miQP?=
 =?us-ascii?Q?nEHgFLtD6QFUv5m6mpdCJTj2ssKpNLBUhTmyHg+wWeOP4ngvacEjXsZU/SKz?=
 =?us-ascii?Q?0MmT9RhShidspn0q1Iwk3FVts0u8RnAqa3CB0sSOmoQ7o9v34iv5fMzBj/AS?=
 =?us-ascii?Q?GP2YhlIcSkK49SVqFokBko4GtkE9GbRfsO4T6Wtfli8CAR6kbIxslNL48fFQ?=
 =?us-ascii?Q?9zXOitIWEO9oETYL1C4AUklGuQ5cxCiR/JuoxILhh0luBFBEWfdEjztZakRy?=
 =?us-ascii?Q?o3auC00Z9NQRM9mfW0b6kmPj6QqIueit0PSiuiMj8+FaGtA/kaR57IWa4VJ3?=
 =?us-ascii?Q?zNgxC3DYkkuNShIO9XHQzdoGvA7H3xotc2FwLAqmXdXywfvvqrkJpGI3HrE9?=
 =?us-ascii?Q?smA8RGjXXw0w/9iuRZ4yX05oXD2uYQXbMUglTP43GlMv0EYXcniyXktj9L3N?=
 =?us-ascii?Q?sLGcFY8LPwluyou4h4ju4UcYEsGN63NBsEZ46VBlmlIdi4k6bezyq+G9b+Vu?=
 =?us-ascii?Q?xaM4ZYPvvQK0VdjzuazIW+3xA6HmWf913bWLXCBK640mczAvLR2IEBDC0io2?=
 =?us-ascii?Q?C4MbzUd5tWo7kc0bPn9T3kWx5OuDK9lUKlPNY6r2gWs7+E2yfJGAN9AOSSCN?=
 =?us-ascii?Q?Ryr1Lq9P15xdlXTG6WaZEOFi1YDbkic1a6SjMq6TMTn2R0d0Vszj6+2C45RL?=
 =?us-ascii?Q?9Z8ZgdIqroQug0t2m8wC9eehaDTIYRau9ymjY76SuDPTOPHvui5UyyJtPSvG?=
 =?us-ascii?Q?K6XGfblzXMA7ODlkGvul6tDnklDy70sErLMyWOxJptJ/8BaQN8SEYLUw9+7H?=
 =?us-ascii?Q?buZBF706VcCEqWjMGVrQ3HuNHluYEoaEa1gBb04bK8J/286HUeJpTi78cJMl?=
 =?us-ascii?Q?bI4PP4RWezqtWAehAjBrI722sqkkWZN9RYqpdaDWpiwevxB0xqXyM1yzl48p?=
 =?us-ascii?Q?stuipFHr/SagsrEB0OebVVapp2yVXN9ZXKej2CjGGaAUkXgHYUPYTe6NlXCU?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f490ca-c402-46ad-1d0c-08da7e901076
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:30:44.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSXHqo1D3iAX8luq97HOnuEku7NqO3BeZY4+YRm/HGTXcLBdgAfqBU/RHo5sk3NGeXGan0RDnwIg/47BQdxQwP/eNzL2s2UJVrDFIfXBtBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4515
Received-SPF: pass client-ip=40.107.105.127;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

The free() function is called for every string allocated using the
strdup() function to prevent memory leaking.

The implementation of the several functions working with dynamically
allocated strings is slightly changed so we can free those strings.

Almost every disassembly_function returns the result of the img_format()
function, which returns a dynamically allocated string. To be able to
free that string for every disassembly_function, a strdup() call is
added for returning value of some disassembly functions like TLBGINV,
TLBGINVF, TLBGP, etc.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 1117 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 841 insertions(+), 276 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 561e4ff095..551bcb3164 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -526,7 +526,9 @@ static const char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        strcat(str, img_format(",%s", GPR(this_rt)));
+        const char *dis_str = img_format(",%s", GPR(this_rt));
+        strcat(str, dis_str);
+        free((char *)dis_str);
     }
 
     return strdup(str);
@@ -663,7 +665,9 @@ static int Disassemble(const uint16 *data, char *dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            strcpy(dis, dis_fn(op_code));
+                            const char *dis_str = dis_fn(op_code);
+                            strcpy(dis, dis_str);
+                            free((char *)dis_str);
                             return table[i].instructions_size;
                         } else {
                             strcpy(dis, "reserved instruction");
@@ -1737,7 +1741,10 @@ static const char *ACLR(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("ACLR %s, %s(%s)", bit, s, rs);
+    const char *ret = img_format("ACLR %s, %s(%s)", bit, s, rs);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -1833,7 +1840,9 @@ static const char *ADDIU_32_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("ADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -1853,8 +1862,9 @@ static const char *ADDIU_48_(uint64 instruction)
 
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
-
-    return img_format("ADDIU %s, %s", rt, s);
+    const char *ret = img_format("ADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -1874,8 +1884,9 @@ static const char *ADDIU_GP48_(uint64 instruction)
 
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
-
-    return img_format("ADDIU %s, $%d, %s", rt, 28, s);
+    const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -1896,7 +1907,9 @@ static const char *ADDIU_GP_B_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -1917,7 +1930,9 @@ static const char *ADDIU_GP_W_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    const char *ret = img_format("ADDIU %s, $%d, %s", rt, 28, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -1940,7 +1955,9 @@ static const char *ADDIU_NEG_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(neg_copy(u_value));
 
-    return img_format("ADDIU %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("ADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -1961,7 +1978,9 @@ static const char *ADDIU_R1_SP_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
+    const char *ret = img_format("ADDIU %s, $%d, %s", rt3, 29, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -1984,7 +2003,9 @@ static const char *ADDIU_R2_(uint64 instruction)
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
+    const char *ret = img_format("ADDIU %s, %s, %s", rt3, rs3, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -2004,7 +2025,9 @@ static const char *ADDIU_RS5_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
 
-    return img_format("ADDIU %s, %s", rt, s);
+    const char *ret = img_format("ADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2026,7 +2049,9 @@ static const char *ADDIUPC_32_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("ADDIUPC %s, %s", rt, s);
+    const char *ret = img_format("ADDIUPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2048,7 +2073,9 @@ static const char *ADDIUPC_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img_format("ADDIUPC %s, %s", rt, s);
+    const char *ret = img_format("ADDIUPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2506,7 +2533,9 @@ static const char *ALUIPC(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    const char *ret = img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2574,7 +2603,9 @@ static const char *ANDI_16_(uint64 instruction)
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
-    return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
+    const char *ret = img_format("ANDI %s, %s, %s", rt3, rs3, eu);
+    free((char *)eu);
+    return ret;
 }
 
 
@@ -2598,7 +2629,9 @@ static const char *ANDI_32_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ANDI %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("ANDI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -2622,7 +2655,9 @@ static const char *APPEND(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("APPEND %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("APPEND %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -2646,7 +2681,10 @@ static const char *ASET(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("ASET %s, %s(%s)", bit, s, rs);
+    const char *ret = img_format("ASET %s, %s(%s)", bit, s, rs);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2666,7 +2704,9 @@ static const char *BALC_16_(uint64 instruction)
 
     const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img_format("BALC %s", s);
+    const char *ret = img_format("BALC %s", s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2686,7 +2726,9 @@ static const char *BALC_32_(uint64 instruction)
 
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BALC %s", s);
+    const char *ret = img_format("BALC %s", s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2732,7 +2774,10 @@ static const char *BBEQZC(uint64 instruction)
     const char *bit = IMMEDIATE(copy(bit_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BBEQZC %s, %s, %s", rt, bit, s);
+    const char *ret = img_format("BBEQZC %s, %s, %s", rt, bit, s);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2756,7 +2801,10 @@ static const char *BBNEZC(uint64 instruction)
     const char *bit = IMMEDIATE(copy(bit_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BBNEZC %s, %s, %s", rt, bit, s);
+    const char *ret = img_format("BBNEZC %s, %s, %s", rt, bit, s);
+    free((char *)bit);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2776,7 +2824,9 @@ static const char *BC_16_(uint64 instruction)
 
     const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img_format("BC %s", s);
+    const char *ret = img_format("BC %s", s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2796,7 +2846,9 @@ static const char *BC_32_(uint64 instruction)
 
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BC %s", s);
+    const char *ret = img_format("BC %s", s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2818,7 +2870,9 @@ static const char *BC1EQZC(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BC1EQZC %s, %s", ft, s);
+    const char *ret = img_format("BC1EQZC %s, %s", ft, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2840,7 +2894,9 @@ static const char *BC1NEZC(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BC1NEZC %s, %s", ft, s);
+    const char *ret = img_format("BC1NEZC %s, %s", ft, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2862,7 +2918,9 @@ static const char *BC2EQZC(uint64 instruction)
     const char *ct = CPR(copy(ct_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BC2EQZC %s, %s", ct, s);
+    const char *ret = img_format("BC2EQZC %s, %s", ct, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2884,7 +2942,9 @@ static const char *BC2NEZC(uint64 instruction)
     const char *ct = CPR(copy(ct_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BC2NEZC %s, %s", ct, s);
+    const char *ret = img_format("BC2NEZC %s, %s", ct, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2908,7 +2968,9 @@ static const char *BEQC_16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img_format("BEQC %s, %s, %s", rs3, rt3, u);
+    const char *ret = img_format("BEQC %s, %s, %s", rs3, rt3, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -2932,7 +2994,9 @@ static const char *BEQC_32_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BEQC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BEQC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2956,7 +3020,10 @@ static const char *BEQIC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BEQIC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BEQIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -2978,7 +3045,9 @@ static const char *BEQZC_16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img_format("BEQZC %s, %s", rt3, s);
+    const char *ret = img_format("BEQZC %s, %s", rt3, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3002,7 +3071,9 @@ static const char *BGEC(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BGEC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BGEC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3026,7 +3097,10 @@ static const char *BGEIC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BGEIC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BGEIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3050,7 +3124,10 @@ static const char *BGEIUC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BGEIUC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BGEIUC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3074,7 +3151,9 @@ static const char *BGEUC(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BGEUC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BGEUC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3098,7 +3177,9 @@ static const char *BLTC(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BLTC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BLTC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3122,7 +3203,10 @@ static const char *BLTIC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BLTIC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BLTIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3146,7 +3230,10 @@ static const char *BLTIUC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BLTIUC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BLTIUC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3170,7 +3257,9 @@ static const char *BLTUC(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BLTUC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BLTUC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3194,7 +3283,9 @@ static const char *BNEC_16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img_format("BNEC %s, %s, %s", rs3, rt3, u);
+    const char *ret = img_format("BNEC %s, %s, %s", rs3, rt3, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -3218,7 +3309,9 @@ static const char *BNEC_32_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BNEC %s, %s, %s", rs, rt, s);
+    const char *ret = img_format("BNEC %s, %s, %s", rs, rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3242,7 +3335,10 @@ static const char *BNEIC(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BNEIC %s, %s, %s", rt, u, s);
+    const char *ret = img_format("BNEIC %s, %s, %s", rt, u, s);
+    free((char *)u);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3264,7 +3360,9 @@ static const char *BNEZC_16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img_format("BNEZC %s, %s", rt3, s);
+    const char *ret = img_format("BNEZC %s, %s", rt3, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3284,7 +3382,9 @@ static const char *BPOSGE32C(uint64 instruction)
 
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("BPOSGE32C %s", s);
+    const char *ret = img_format("BPOSGE32C %s", s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3304,7 +3404,9 @@ static const char *BREAK_16_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("BREAK %s", code);
+    const char *ret = img_format("BREAK %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -3324,7 +3426,9 @@ static const char *BREAK_32_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("BREAK %s", code);
+    const char *ret = img_format("BREAK %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -3368,7 +3472,10 @@ static const char *CACHE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("CACHE %s, %s(%s)", op, s, rs);
+    const char *ret = img_format("CACHE %s, %s(%s)", op, s, rs);
+    free((char *)op);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -3392,7 +3499,10 @@ static const char *CACHEE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("CACHEE %s, %s(%s)", op, s, rs);
+    const char *ret = img_format("CACHEE %s, %s(%s)", op, s, rs);
+    free((char *)op);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -4967,7 +5077,9 @@ static const char *COP2_1(uint64 instruction)
 
     const char *cofun = IMMEDIATE(copy(cofun_value));
 
-    return img_format("COP2_1 %s", cofun);
+    const char *ret = img_format("COP2_1 %s", cofun);
+    free((char *)cofun);
+    return ret;
 }
 
 
@@ -5297,7 +5409,9 @@ static const char *DADDIU_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
 
-    return img_format("DADDIU %s, %s", rt, s);
+    const char *ret = img_format("DADDIU %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -5321,7 +5435,9 @@ static const char *DADDIU_NEG_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(neg_copy(u_value));
 
-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("DADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -5345,7 +5461,9 @@ static const char *DADDIU_U12_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("DADDIU %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("DADDIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -5503,7 +5621,7 @@ static const char *DERET(uint64 instruction)
 {
     (void)instruction;
 
-    return "DERET ";
+    return strdup("DERET ");
 }
 
 
@@ -5529,7 +5647,10 @@ static const char *DEXTM(uint64 instruction)
     const char *lsb = IMMEDIATE(copy(lsb_value));
     const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret = img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }
 
 
@@ -5555,7 +5676,10 @@ static const char *DEXT(uint64 instruction)
     const char *lsb = IMMEDIATE(copy(lsb_value));
     const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret = img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }
 
 
@@ -5581,7 +5705,10 @@ static const char *DEXTU(uint64 instruction)
     const char *lsb = IMMEDIATE(copy(lsb_value));
     const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret = img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }
 
 
@@ -5608,8 +5735,11 @@ static const char *DINSM(uint64 instruction)
     const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret = img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -5636,8 +5766,11 @@ static const char *DINS(uint64 instruction)
     const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret = img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -5664,8 +5797,11 @@ static const char *DINSU(uint64 instruction)
     const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret = img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -5807,7 +5943,9 @@ static const char *DLSA(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u2 = IMMEDIATE(copy(u2_value));
 
-    return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    const char *ret = img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    free((char *)u2);
+    return ret;
 }
 
 
@@ -5829,7 +5967,9 @@ static const char *DLUI_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("DLUI %s, %s", rt, u);
+    const char *ret = img_format("DLUI %s, %s", rt, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -5853,7 +5993,9 @@ static const char *DMFC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -5921,7 +6063,9 @@ static const char *DMFGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -5993,7 +6137,9 @@ static const char *DMTC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -6061,7 +6207,9 @@ static const char *DMTGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -6586,7 +6734,9 @@ static const char *DROTR(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DROTR %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DROTR %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6610,7 +6760,9 @@ static const char *DROTR32(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DROTR32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6660,7 +6812,10 @@ static const char *DROTX(uint64 instruction)
     const char *shift = IMMEDIATE(copy(shift_value));
     const char *shiftx = IMMEDIATE(copy(shiftx_value));
 
-    return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    const char *ret = img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    free((char *)shift);
+    free((char *)shiftx);
+    return ret;
 }
 
 
@@ -6684,7 +6839,9 @@ static const char *DSLL(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSLL %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSLL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6708,7 +6865,9 @@ static const char *DSLL32(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSLL32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6756,7 +6915,9 @@ static const char *DSRA(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSRA %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSRA %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6780,7 +6941,9 @@ static const char *DSRA32(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSRA32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6828,7 +6991,9 @@ static const char *DSRL(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSRL %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSRL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6852,7 +7017,9 @@ static const char *DSRL32(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("DSRL32 %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -6982,7 +7149,7 @@ static const char *EHB(uint64 instruction)
 {
     (void)instruction;
 
-    return "EHB ";
+    return strdup("EHB ");
 }
 
 
@@ -7040,7 +7207,7 @@ static const char *ERET(uint64 instruction)
 {
     (void)instruction;
 
-    return "ERET ";
+    return strdup("ERET ");
 }
 
 
@@ -7058,7 +7225,7 @@ static const char *ERETNC(uint64 instruction)
 {
     (void)instruction;
 
-    return "ERETNC ";
+    return strdup("ERETNC ");
 }
 
 
@@ -7124,7 +7291,10 @@ static const char *EXT(uint64 instruction)
     const char *lsb = IMMEDIATE(copy(lsb_value));
     const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    const char *ret = img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    free((char *)lsb);
+    free((char *)msbd);
+    return ret;
 }
 
 
@@ -7150,7 +7320,9 @@ static const char *EXTD(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret = img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7176,7 +7348,9 @@ static const char *EXTD32(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret = img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7200,7 +7374,9 @@ static const char *EXTPDP(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *size = IMMEDIATE(copy(size_value));
 
-    return img_format("EXTPDP %s, %s, %s", rt, ac, size);
+    const char *ret = img_format("EXTPDP %s, %s, %s", rt, ac, size);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -7248,7 +7424,9 @@ static const char *EXTP(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *size = IMMEDIATE(copy(size_value));
 
-    return img_format("EXTP %s, %s, %s", rt, ac, size);
+    const char *ret = img_format("EXTP %s, %s, %s", rt, ac, size);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -7297,7 +7475,9 @@ static const char *EXTR_RS_W(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    const char *ret = img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7322,7 +7502,9 @@ static const char *EXTR_R_W(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    const char *ret = img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7347,7 +7529,9 @@ static const char *EXTR_S_H(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    const char *ret = img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7372,7 +7556,9 @@ static const char *EXTR_W(uint64 instruction)
     const char *ac = AC(copy(ac_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
+    const char *ret = img_format("EXTR.W %s, %s, %s", rt, ac, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7499,7 +7685,9 @@ static const char *EXTW(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    const char *ret = img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -7631,7 +7819,9 @@ static const char *HYPCALL(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("HYPCALL %s", code);
+    const char *ret = img_format("HYPCALL %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -7651,7 +7841,9 @@ static const char *HYPCALL_16_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("HYPCALL %s", code);
+    const char *ret = img_format("HYPCALL %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -7678,8 +7870,11 @@ static const char *INS(uint64 instruction)
     const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
+    const char *ret = img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
+    free((char *)pos);
+    free((char *)size);
+    return ret;
 }
 
 
@@ -7718,7 +7913,7 @@ static const char *IRET(uint64 instruction)
 {
     (void)instruction;
 
-    return "IRET ";
+    return strdup("IRET ");
 }
 
 
@@ -7826,7 +8021,9 @@ static const char *LB_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LB %s, %s(%s)", rt3, u, rs3);
+    const char *ret = img_format("LB %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -7848,7 +8045,9 @@ static const char *LB_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LB %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LB %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -7872,7 +8071,9 @@ static const char *LB_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LB %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LB %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -7896,7 +8097,9 @@ static const char *LB_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LB %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LB %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -7920,7 +8123,9 @@ static const char *LBE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LBE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LBE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -7944,7 +8149,9 @@ static const char *LBU_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LBU %s, %s(%s)", rt3, u, rs3);
+    const char *ret = img_format("LBU %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -7966,7 +8173,9 @@ static const char *LBU_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LBU %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LBU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -7990,7 +8199,9 @@ static const char *LBU_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LBU %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LBU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8014,7 +8225,9 @@ static const char *LBU_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LBU %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LBU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8038,7 +8251,9 @@ static const char *LBUE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LBUE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LBUE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8108,7 +8323,9 @@ static const char *LD_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LD %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LD %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8132,7 +8349,9 @@ static const char *LD_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LD %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8156,7 +8375,9 @@ static const char *LD_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LD %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LD %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8178,7 +8399,9 @@ static const char *LDC1_GP_(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LDC1 %s, %s($%d)", ft, u, 28);
+    const char *ret = img_format("LDC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8202,7 +8425,9 @@ static const char *LDC1_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LDC1 %s, %s(%s)", ft, s, rs);
+    const char *ret = img_format("LDC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8226,7 +8451,9 @@ static const char *LDC1_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LDC1 %s, %s(%s)", ft, u, rs);
+    const char *ret = img_format("LDC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8298,7 +8525,9 @@ static const char *LDC2(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LDC2 %s, %s(%s)", ct, s, rs);
+    const char *ret = img_format("LDC2 %s, %s(%s)", ct, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8324,7 +8553,10 @@ static const char *LDM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -8346,7 +8578,9 @@ static const char *LDPC_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img_format("LDPC %s, %s", rt, s);
+    const char *ret = img_format("LDPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8418,7 +8652,9 @@ static const char *LH_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LH %s, %s(%s)", rt3, u, rs3);
+    const char *ret = img_format("LH %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8440,7 +8676,9 @@ static const char *LH_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LH %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LH %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8464,7 +8702,9 @@ static const char *LH_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LH %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8488,7 +8728,9 @@ static const char *LH_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LH %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LH %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8512,7 +8754,9 @@ static const char *LHE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LHE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LHE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8536,7 +8780,9 @@ static const char *LHU_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LHU %s, %s(%s)", rt3, u, rs3);
+    const char *ret = img_format("LHU %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8558,7 +8804,9 @@ static const char *LHU_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LHU %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LHU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8582,7 +8830,9 @@ static const char *LHU_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LHU %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LHU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8606,7 +8856,9 @@ static const char *LHU_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LHU %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LHU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -8630,7 +8882,9 @@ static const char *LHUE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LHUE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LHUE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8748,7 +9002,9 @@ static const char *LI_16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
-    return img_format("LI %s, %s", rt3, eu);
+    const char *ret = img_format("LI %s, %s", rt3, eu);
+    free((char *)eu);
+    return ret;
 }
 
 
@@ -8770,7 +9026,9 @@ static const char *LI_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
 
-    return img_format("LI %s, %s", rt, s);
+    const char *ret = img_format("LI %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8794,7 +9052,9 @@ static const char *LL(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LL %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LL %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8818,7 +9078,9 @@ static const char *LLD(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LLD %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LLD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8866,7 +9128,9 @@ static const char *LLE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LLE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LLE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8940,7 +9204,9 @@ static const char *LSA(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u2 = IMMEDIATE(copy(u2_value));
 
-    return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    const char *ret = img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    free((char *)u2);
+    return ret;
 }
 
 
@@ -8962,7 +9228,9 @@ static const char *LUI(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = IMMEDIATE(copy(s_value));
 
-    return img_format("LUI %s, %%hi(%s)", rt, s);
+    const char *ret = img_format("LUI %s, %%hi(%s)", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -8986,7 +9254,9 @@ static const char *LW_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("LW %s, %s(%s)", rt3, u, rs3);
+    const char *ret = img_format("LW %s, %s(%s)", rt3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9010,7 +9280,9 @@ static const char *LW_4X4_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img_format("LW %s, %s(%s)", rt4, u, rs4);
+    const char *ret = img_format("LW %s, %s(%s)", rt4, u, rs4);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9032,7 +9304,9 @@ static const char *LW_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LW %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LW %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9054,7 +9328,9 @@ static const char *LW_GP16_(uint64 instruction)
     const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LW %s, %s($%d)", rt3, u, 28);
+    const char *ret = img_format("LW %s, %s($%d)", rt3, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9078,7 +9354,9 @@ static const char *LW_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LW %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LW %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9100,7 +9378,9 @@ static const char *LW_SP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LW %s, %s($%d)", rt, u, 29);
+    const char *ret = img_format("LW %s, %s($%d)", rt, u, 29);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9124,7 +9404,9 @@ static const char *LW_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LW %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LW %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9146,7 +9428,9 @@ static const char *LWC1_GP_(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LWC1 %s, %s($%d)", ft, u, 28);
+    const char *ret = img_format("LWC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9170,7 +9454,9 @@ static const char *LWC1_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWC1 %s, %s(%s)", ft, s, rs);
+    const char *ret = img_format("LWC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9194,7 +9480,9 @@ static const char *LWC1_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWC1 %s, %s(%s)", ft, u, rs);
+    const char *ret = img_format("LWC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9266,7 +9554,9 @@ static const char *LWC2(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWC2 %s, %s(%s)", ct, s, rs);
+    const char *ret = img_format("LWC2 %s, %s(%s)", ct, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9290,7 +9580,9 @@ static const char *LWE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LWE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9316,7 +9608,10 @@ static const char *LWM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -9338,7 +9633,9 @@ static const char *LWPC_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img_format("LWPC %s, %s", rt, s);
+    const char *ret = img_format("LWPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9360,7 +9657,9 @@ static const char *LWU_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("LWU %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("LWU %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9384,7 +9683,9 @@ static const char *LWU_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWU %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("LWU %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -9408,7 +9709,9 @@ static const char *LWU_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("LWU %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("LWU %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -9504,7 +9807,9 @@ static const char *LWXS_16_(uint64 instruction)
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
-    return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    const char *ret = img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    free((char *)rt3);
+    return ret;
 }
 
 
@@ -9846,7 +10151,10 @@ static const char *MFC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MFC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -9914,7 +10222,10 @@ static const char *MFGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -9938,7 +10249,10 @@ static const char *MFHC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10006,7 +10320,10 @@ static const char *MFHGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10053,7 +10370,11 @@ static const char *MFHTR(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret = img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10100,7 +10421,11 @@ static const char *MFTR(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret = img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10336,7 +10661,9 @@ static const char *MOVE_BALC(uint64 instruction)
     const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    const char *ret = img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -10580,7 +10907,10 @@ static const char *MTC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MTC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10648,7 +10978,10 @@ static const char *MTGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10672,7 +11005,10 @@ static const char *MTHC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10740,7 +11076,10 @@ static const char *MTHGC0(uint64 instruction)
     const char *c0s = CPR(copy(c0s_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    const char *ret = img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    free((char *)c0s);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10808,7 +11147,11 @@ static const char *MTHTR(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret = img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -10855,7 +11198,11 @@ static const char *MTTR(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    const char *ret = img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    free((char *)c0s);
+    free((char *)u);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -11431,7 +11778,7 @@ static const char *NOP_16_(uint64 instruction)
 {
     (void)instruction;
 
-    return "NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11449,7 +11796,7 @@ static const char *NOP_32_(uint64 instruction)
 {
     (void)instruction;
 
-    return "NOP ";
+    return strdup("NOP ");
 }
 
 
@@ -11565,7 +11912,9 @@ static const char *ORI(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("ORI %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("ORI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -11608,7 +11957,7 @@ static const char *PAUSE(uint64 instruction)
 {
     (void)instruction;
 
-    return "PAUSE ";
+    return strdup("PAUSE ");
 }
 
 
@@ -11940,7 +12289,9 @@ static const char *PRECR_SRA_PH_W(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -11965,7 +12316,9 @@ static const char *PRECR_SRA_R_PH_W(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -12089,7 +12442,10 @@ static const char *PREF_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("PREF %s, %s(%s)", hint, s, rs);
+    const char *ret = img_format("PREF %s, %s(%s)", hint, s, rs);
+    free((char *)hint);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -12113,7 +12469,10 @@ static const char *PREF_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("PREF %s, %s(%s)", hint, u, rs);
+    const char *ret = img_format("PREF %s, %s(%s)", hint, u, rs);
+    free((char *)hint);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12137,7 +12496,10 @@ static const char *PREFE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("PREFE %s, %s(%s)", hint, s, rs);
+    const char *ret = img_format("PREFE %s, %s(%s)", hint, s, rs);
+    free((char *)hint);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -12161,7 +12523,9 @@ static const char *PREPEND(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("PREPEND %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("PREPEND %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -12203,7 +12567,9 @@ static const char *RDDSP(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *mask = IMMEDIATE(copy(mask_value));
 
-    return img_format("RDDSP %s, %s", rt, mask);
+    const char *ret = img_format("RDDSP %s, %s", rt, mask);
+    free((char *)mask);
+    return ret;
 }
 
 
@@ -12227,7 +12593,10 @@ static const char *RDHWR(uint64 instruction)
     const char *hs = CPR(copy(hs_value));
     const char *sel = IMMEDIATE(copy(sel_value));
 
-    return img_format("RDHWR %s, %s, %s", rt, hs, sel);
+    const char *ret = img_format("RDHWR %s, %s, %s", rt, hs, sel);
+    free((char *)hs);
+    free((char *)sel);
+    return ret;
 }
 
 
@@ -12316,6 +12685,7 @@ static const char *REPL_PH(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
+
 }
 
 
@@ -12337,7 +12707,9 @@ static const char *REPL_QB(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("REPL.QB %s, %s", rt, u);
+    const char *ret = img_format("REPL.QB %s, %s", rt, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12402,8 +12774,13 @@ static const char *RESTORE_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     const char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret = img_format("RESTORE %s%s", u, save_restore_str);
+    free((char *)save_restore_str);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12424,8 +12801,13 @@ static const char *RESTORE_JRC_16_(uint64 instruction)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     const char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    const char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+
+    const char *ret = img_format("RESTORE.JRC %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }
 
 
@@ -12447,8 +12829,13 @@ static const char *RESTORE_JRC_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     const char *u = IMMEDIATE(copy(u_value));
-    return img_format("RESTORE.JRC %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret = img_format("RESTORE.JRC %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }
 
 
@@ -12470,7 +12857,10 @@ static const char *RESTOREF(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *count = IMMEDIATE(copy(count_value));
 
-    return img_format("RESTOREF %s, %s", u, count);
+    const char *ret = img_format("RESTOREF %s, %s", u, count);
+    free((char *)u);
+    free((char *)count);
+    return ret;
 }
 
 
@@ -12538,7 +12928,9 @@ static const char *ROTR(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("ROTR %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("ROTR %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -12590,8 +12982,12 @@ static const char *ROTX(uint64 instruction)
     const char *shiftx = IMMEDIATE(copy(shiftx_value));
     const char *stripe = IMMEDIATE(copy(stripe_value));
 
-    return img_format("ROTX %s, %s, %s, %s, %s",
+    const char *ret = img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
+    free((char *)shift);
+    free((char *)shiftx);
+    free((char *)stripe);
+    return ret;
 }
 
 
@@ -12744,8 +13140,13 @@ static const char *SAVE_16_(uint64 instruction)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     const char *u = IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-        save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
+    const char *save_restore_str = save_restore_list(
+        encode_rt1_from_rt(rt1_value), count_value, 0);
+
+    const char *ret = img_format("SAVE %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }
 
 
@@ -12767,8 +13168,13 @@ static const char *SAVE_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     const char *u = IMMEDIATE(copy(u_value));
-    return img_format("SAVE %s%s", u,
-               save_restore_list(rt_value, count_value, gp_value));
+    const char *save_restore_str = save_restore_list(
+        rt_value, count_value, gp_value);
+
+    const char *ret = img_format("SAVE %s%s", u, save_restore_str);
+    free((char *)u);
+    free((char *)save_restore_str);
+    return ret;
 }
 
 
@@ -12790,7 +13196,10 @@ static const char *SAVEF(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *count = IMMEDIATE(copy(count_value));
 
-    return img_format("SAVEF %s, %s", u, count);
+    const char *ret = img_format("SAVEF %s, %s", u, count);
+    free((char *)u);
+    free((char *)count);
+    return ret;
 }
 
 
@@ -12814,7 +13223,9 @@ static const char *SB_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SB %s, %s(%s)", rtz3, u, rs3);
+    const char *ret = img_format("SB %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12836,7 +13247,9 @@ static const char *SB_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SB %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("SB %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12860,7 +13273,9 @@ static const char *SB_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SB %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SB %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -12884,7 +13299,9 @@ static const char *SB_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SB %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("SB %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -12908,7 +13325,9 @@ static const char *SBE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SBE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SBE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -12956,7 +13375,9 @@ static const char *SC(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SC %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SC %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -12980,7 +13401,9 @@ static const char *SCD(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SCD %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SCD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13028,7 +13451,9 @@ static const char *SCE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SCE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SCE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13098,7 +13523,9 @@ static const char *SD_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SD %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("SD %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13122,7 +13549,9 @@ static const char *SD_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SD %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SD %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13146,7 +13575,9 @@ static const char *SD_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SD %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("SD %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13166,7 +13597,9 @@ static const char *SDBBP_16_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("SDBBP %s", code);
+    const char *ret = img_format("SDBBP %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -13186,7 +13619,9 @@ static const char *SDBBP_32_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("SDBBP %s", code);
+    const char *ret = img_format("SDBBP %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -13208,7 +13643,9 @@ static const char *SDC1_GP_(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SDC1 %s, %s($%d)", ft, u, 28);
+    const char *ret = img_format("SDC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13232,7 +13669,9 @@ static const char *SDC1_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SDC1 %s, %s(%s)", ft, s, rs);
+    const char *ret = img_format("SDC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13256,7 +13695,9 @@ static const char *SDC1_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SDC1 %s, %s(%s)", ft, u, rs);
+    const char *ret = img_format("SDC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13328,7 +13769,9 @@ static const char *SDC2(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SDC2 %s, %s(%s)", cs, s, rs);
+    const char *ret = img_format("SDC2 %s, %s(%s)", cs, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13354,7 +13797,10 @@ static const char *SDM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -13376,7 +13822,9 @@ static const char *SDPC_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img_format("SDPC %s, %s", rt, s);
+    const char *ret = img_format("SDPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13636,7 +14084,9 @@ static const char *SEQI(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SEQI %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("SEQI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13660,7 +14110,9 @@ static const char *SH_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SH %s, %s(%s)", rtz3, u, rs3);
+    const char *ret = img_format("SH %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13682,7 +14134,9 @@ static const char *SH_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SH %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("SH %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13706,7 +14160,9 @@ static const char *SH_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SH %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13730,7 +14186,9 @@ static const char *SH_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SH %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("SH %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -13754,7 +14212,9 @@ static const char *SHE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SHE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SHE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -13776,7 +14236,9 @@ static const char *SHILO(uint64 instruction)
     const char *shift = IMMEDIATE(copy(shift_value));
     const char *ac = AC(copy(ac_value));
 
-    return img_format("SHILO %s, %s", ac, shift);
+    const char *ret = img_format("SHILO %s, %s", ac, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -13822,7 +14284,9 @@ static const char *SHLL_PH(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -13846,7 +14310,9 @@ static const char *SHLL_QB(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -13871,7 +14337,9 @@ static const char *SHLL_S_PH(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -13895,7 +14363,9 @@ static const char *SHLL_S_W(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14017,7 +14487,9 @@ static const char *SHRA_PH(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14041,7 +14513,9 @@ static const char *SHRA_QB(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14065,7 +14539,9 @@ static const char *SHRA_R_PH(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14089,7 +14565,9 @@ static const char *SHRA_R_QB(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14113,7 +14591,9 @@ static const char *SHRA_R_W(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14257,7 +14737,9 @@ static const char *SHRL_PH(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14281,7 +14763,9 @@ static const char *SHRL_QB(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *sa = IMMEDIATE(copy(sa_value));
 
-    return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    const char *ret = img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    free((char *)sa);
+    return ret;
 }
 
 
@@ -14398,7 +14882,9 @@ static const char *SIGRIE(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("SIGRIE %s", code);
+    const char *ret = img_format("SIGRIE %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -14422,7 +14908,9 @@ static const char *SLL_16_(uint64 instruction)
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
-    return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
+    const char *ret = img_format("SLL %s, %s, %s", rt3, rs3, shift3);
+    free((char *)shift3);
+    return ret;
 }
 
 
@@ -14446,7 +14934,9 @@ static const char *SLL_32_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("SLL %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("SLL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -14518,7 +15008,9 @@ static const char *SLTI(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SLTI %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("SLTI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -14542,7 +15034,9 @@ static const char *SLTIU(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SLTIU %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("SLTIU %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -14610,7 +15104,9 @@ static const char *SPECIAL2(uint64 instruction)
 
     const char *op = IMMEDIATE(copy(op_value));
 
-    return img_format("SPECIAL2 %s", op);
+    const char *ret = img_format("SPECIAL2 %s", op);
+    free((char *)op);
+    return ret;
 }
 
 
@@ -14678,7 +15174,9 @@ static const char *SRA(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("SRA %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("SRA %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -14726,7 +15224,9 @@ static const char *SRL_16_(uint64 instruction)
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
     const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
-    return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
+    const char *ret = img_format("SRL %s, %s, %s", rt3, rs3, shift3);
+    free((char *)shift3);
+    return ret;
 }
 
 
@@ -14750,7 +15250,9 @@ static const char *SRL_32_(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *shift = IMMEDIATE(copy(shift_value));
 
-    return img_format("SRL %s, %s, %s", rt, rs, shift);
+    const char *ret = img_format("SRL %s, %s, %s", rt, rs, shift);
+    free((char *)shift);
+    return ret;
 }
 
 
@@ -15240,7 +15742,9 @@ static const char *SW_16_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img_format("SW %s, %s(%s)", rtz3, u, rs3);
+    const char *ret = img_format("SW %s, %s(%s)", rtz3, u, rs3);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15264,7 +15768,9 @@ static const char *SW_4X4_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img_format("SW %s, %s(%s)", rtz4, u, rs4);
+    const char *ret = img_format("SW %s, %s(%s)", rtz4, u, rs4);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15286,7 +15792,9 @@ static const char *SW_GP16_(uint64 instruction)
     const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SW %s, %s($%d)", rtz3, u, 28);
+    const char *ret = img_format("SW %s, %s($%d)", rtz3, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15308,7 +15816,9 @@ static const char *SW_GP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SW %s, %s($%d)", rt, u, 28);
+    const char *ret = img_format("SW %s, %s($%d)", rt, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15332,7 +15842,9 @@ static const char *SW_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SW %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SW %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15354,7 +15866,9 @@ static const char *SW_SP_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SW %s, %s($%d)", rt, u, 29);
+    const char *ret = img_format("SW %s, %s($%d)", rt, u, 29);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15378,7 +15892,9 @@ static const char *SW_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SW %s, %s(%s)", rt, u, rs);
+    const char *ret = img_format("SW %s, %s(%s)", rt, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15400,7 +15916,9 @@ static const char *SWC1_GP_(uint64 instruction)
     const char *ft = FPR(copy(ft_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("SWC1 %s, %s($%d)", ft, u, 28);
+    const char *ret = img_format("SWC1 %s, %s($%d)", ft, u, 28);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15424,7 +15942,9 @@ static const char *SWC1_S9_(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SWC1 %s, %s(%s)", ft, s, rs);
+    const char *ret = img_format("SWC1 %s, %s(%s)", ft, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15448,7 +15968,9 @@ static const char *SWC1_U12_(uint64 instruction)
     const char *u = IMMEDIATE(copy(u_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SWC1 %s, %s(%s)", ft, u, rs);
+    const char *ret = img_format("SWC1 %s, %s(%s)", ft, u, rs);
+    free((char *)u);
+    return ret;
 }
 
 
@@ -15520,7 +16042,9 @@ static const char *SWC2(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SWC2 %s, %s(%s)", cs, s, rs);
+    const char *ret = img_format("SWC2 %s, %s(%s)", cs, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15544,7 +16068,9 @@ static const char *SWE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SWE %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("SWE %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15570,7 +16096,10 @@ static const char *SWM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -15592,7 +16121,9 @@ static const char *SWPC_48_(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img_format("SWPC %s, %s", rt, s);
+    const char *ret = img_format("SWPC %s, %s", rt, s);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15660,7 +16191,9 @@ static const char *SYNC(uint64 instruction)
 
     const char *stype = IMMEDIATE(copy(stype_value));
 
-    return img_format("SYNC %s", stype);
+    const char *ret = img_format("SYNC %s", stype);
+    free((char *)stype);
+    return ret;
 }
 
 
@@ -15682,7 +16215,9 @@ static const char *SYNCI(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SYNCI %s(%s)", s, rs);
+    const char *ret = img_format("SYNCI %s(%s)", s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15704,7 +16239,9 @@ static const char *SYNCIE(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("SYNCIE %s(%s)", s, rs);
+    const char *ret = img_format("SYNCIE %s(%s)", s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -15724,7 +16261,9 @@ static const char *SYSCALL_16_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("SYSCALL %s", code);
+    const char *ret = img_format("SYSCALL %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -15742,7 +16281,9 @@ static const char *SYSCALL_32_(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("SYSCALL %s", code);
+    const char *ret = img_format("SYSCALL %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -15782,7 +16323,7 @@ static const char *TLBGINV(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGINV ";
+    return strdup("TLBGINV ");
 }
 
 
@@ -15800,7 +16341,7 @@ static const char *TLBGINVF(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGINVF ";
+    return strdup("TLBGINVF ");
 }
 
 
@@ -15818,7 +16359,7 @@ static const char *TLBGP(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGP ";
+    return strdup("TLBGP ");
 }
 
 
@@ -15836,7 +16377,7 @@ static const char *TLBGR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGR ";
+    return strdup("TLBGR ");
 }
 
 
@@ -15854,7 +16395,7 @@ static const char *TLBGWI(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGWI ";
+    return strdup("TLBGWI ");
 }
 
 
@@ -15872,7 +16413,7 @@ static const char *TLBGWR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBGWR ";
+    return strdup("TLBGWR ");
 }
 
 
@@ -15890,7 +16431,7 @@ static const char *TLBINV(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBINV ";
+    return strdup("TLBINV ");
 }
 
 
@@ -15908,7 +16449,7 @@ static const char *TLBINVF(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBINVF ";
+    return strdup("TLBINVF ");
 }
 
 
@@ -15926,7 +16467,7 @@ static const char *TLBP(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBP ";
+    return strdup("TLBP ");
 }
 
 
@@ -15944,7 +16485,7 @@ static const char *TLBR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBR ";
+    return strdup("TLBR ");
 }
 
 
@@ -15962,7 +16503,7 @@ static const char *TLBWI(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBWI ";
+    return strdup("TLBWI ");
 }
 
 
@@ -15980,7 +16521,7 @@ static const char *TLBWR(uint64 instruction)
 {
     (void)instruction;
 
-    return "TLBWR ";
+    return strdup("TLBWR ");
 }
 
 
@@ -16116,7 +16657,10 @@ static const char *UALDM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -16140,7 +16684,9 @@ static const char *UALH(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("UALH %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("UALH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -16166,7 +16712,10 @@ static const char *UALWM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -16192,7 +16741,10 @@ static const char *UASDM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -16216,7 +16768,9 @@ static const char *UASH(uint64 instruction)
     const char *s = IMMEDIATE(copy(s_value));
     const char *rs = GPR(copy(rs_value));
 
-    return img_format("UASH %s, %s(%s)", rt, s, rs);
+    const char *ret = img_format("UASH %s, %s(%s)", rt, s, rs);
+    free((char *)s);
+    return ret;
 }
 
 
@@ -16242,7 +16796,10 @@ static const char *UASWM(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    const char *ret = img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    free((char *)s);
+    free((char *)count3);
+    return ret;
 }
 
 
@@ -16262,7 +16819,9 @@ static const char *UDI(uint64 instruction)
 
     const char *op = IMMEDIATE(copy(op_value));
 
-    return img_format("UDI %s", op);
+    const char *ret = img_format("UDI %s", op);
+    free((char *)op);
+    return ret;
 }
 
 
@@ -16280,7 +16839,9 @@ static const char *WAIT(uint64 instruction)
 
     const char *code = IMMEDIATE(copy(code_value));
 
-    return img_format("WAIT %s", code);
+    const char *ret = img_format("WAIT %s", code);
+    free((char *)code);
+    return ret;
 }
 
 
@@ -16302,7 +16863,9 @@ static const char *WRDSP(uint64 instruction)
     const char *rt = GPR(copy(rt_value));
     const char *mask = IMMEDIATE(copy(mask_value));
 
-    return img_format("WRDSP %s, %s", rt, mask);
+    const char *ret = img_format("WRDSP %s, %s", rt, mask);
+    free((char *)mask);
+    return ret;
 }
 
 
@@ -16394,7 +16957,9 @@ static const char *XORI(uint64 instruction)
     const char *rs = GPR(copy(rs_value));
     const char *u = IMMEDIATE(copy(u_value));
 
-    return img_format("XORI %s, %s, %s", rt, rs, u);
+    const char *ret = img_format("XORI %s, %s, %s", rt, rs, u);
+    free((char *)u);
+    return ret;
 }
 
 
-- 
2.25.1


