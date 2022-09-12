Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942335B5ADA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:06:56 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj9L-0003PU-NA
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXic7-0007eW-UK
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:42 -0400
Received: from mail-eopbgr70132.outbound.protection.outlook.com
 ([40.107.7.132]:50574 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXic6-0006at-BQ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RchyM0RTlHSUbl+z24sII2BgaENRT8oOP/B30/VB4rJ4BKFCP7OWDIUYKYY8Yy3WbW5gB3McK/+W5AHUjbg3FlGAaTrgDgRcNmB1t3SCruuaZd+l77zb1G2xFxmUE5bC6wdcUzsknUR4M1NVqgLF9+EoyOafqQu64ZncN091jSKHLw+EoE6WG5GbjTC0s9LpknzU3wSl0rdPC7rFmFUoMHB8WO9uiJfK1PR0Gxpi8jN5ckFQCwHZof2PGpoQoFAJzYTUS5FEyoVzBWPtIDmvOrzR+iDby0tkb455EI6yR8JXD41Oc6Iun/IC7asEJBdPVUweSAYYYNNgr+pODNFgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEurgNoRCpAvIXmnYGPzlxWrcjtvuqNr2BUqC7ayMWQ=;
 b=Ib7+ejvy2oJFiIQR8FmB57kN+Sxd8pq233xPSzHRWLGblvlIHzunMoUyjt+3BdMd1rmt8o5qIlo+eNzn40XJB4ABzqJ5OAFWo5bsL0AaJn7Fyvyem7h+UHQd7+8c55aXvfonf8sQ17i/iL7AXkmRy40/yNZeoc3LE0fMD+/QL44YmTtx+twE6IJ0rqK34ecF70myxdC+7F9NesT+QgYnlcDylmUSQDIZ+biOl3QftDyJ1ayEhG8tK2lBSMsyeozT5mj9lE3YZurKNnzAlglS+aKVdFkTN2j/OOLEJ2uawuxnDyyOguJBWSRd5bwiVGVGewoiLqqooujraIHFVqUDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEurgNoRCpAvIXmnYGPzlxWrcjtvuqNr2BUqC7ayMWQ=;
 b=XppZxSoGQ3pJ/GWCMHbVMdFSA+Mxri6fmllUWERYrBOzqtd/LQfTn/tdnxl5hGWr4G1WUvUkSE4ooqojUb4sekDTjtZHxUrOAgOtY1MNeq4sfWVJ+zxQNyl5ymM27b/fNQoqG2Y3xkeI8uiU05RB2X5jReyAvD5nTW9xS8HbV6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:32:31 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:32:31 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 23/24] disas/nanomips: Remove argument passing by ref
Date: Mon, 12 Sep 2022 14:26:34 +0200
Message-Id: <20220912122635.74032-24-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dacd64c-645e-4195-3148-08da94badcb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wjv7JiN2dNKZboL/S5Qzy8wy46aVasahP1aPmdvau8puf6EsCnOxcImppuRd3IlyLZbvktmY4jir1WOz6ZRsKbzCtifkecrAMQGUEnDnX2yUU6rkLa74vjAfiAFVPsWQcriLTfI77zLI7sWmNcsiQzZFVEgStQo/rllYRU5HQ3pl2QEt1Paov/rX+fayglEzITMk+0Wr9EuncWnE44kKCQc6RKQIQ8M1pZt+0KYYAbPYypjm4fhtG04SOsMGJIT3jNKtLUqiEvd+lY7dZckDxeXJ3J5prdjsmkWcl44ZUYA+eo4y2fYlrCIfNE3odtoBFxDOvf5Jo9BGOBtBAvANJtIpmTsJwqY9FA3C9vJW831c6jyUkS1X4+9XVarLLz2l48k0MP5AbtBXkBSgRVMULuYURav0DIxiyorA+hRz77fEXQ2M+9EtNSgkmeMq7JBnDaMHcAcywdIwXuhG2eav/VMAe6b7Odu67bJyNT48Ev/bSeeoQ3uk1kJI+gzV8m/NLWClH3elEAjK31yPp3boZL/2fQGr+EQmoAEWe4etYMmeocDKQcq09VA6+t8evZHbnO5RjI7KX+gzf03XpULgxoyQHppazRQgfDnsZfFhHqTWb+074UyrJHqZG7yKIajEgEJOPzUDP1mNWOK0ZoJWr58c5FGhul6/Om4o8s+ta4cuE8mKTk4kot1AQWcJwWHVzoKTvSY8BA6lbVfktXqv73gqlfchBNaIzQ/EXkO/XatktAiOrXacK2hvclezS1tH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AOhLqS3AJWOodz2JDpY8+DA8+vhJTawPC8avqu9vNh2u7axfTlQ+pKI+ZRf?=
 =?us-ascii?Q?NrX4i3aeSazFF10vZ3r/Zjpj4icKo844jKQUox+QhHNua7IX6rQzJq2GGfwm?=
 =?us-ascii?Q?RGl7ZNPniKB5agYFV6YJoN/p3s3Ani6XCJPvitrCug1EsVnnNz2vxTxd5TPn?=
 =?us-ascii?Q?L4NZR+NrKK6ly6FVRY7WRbS80Mpn971lnqqKtJeu/f23C8Cu/2QFV/qmRPzE?=
 =?us-ascii?Q?R2UUeHPXACYs/x/juLH6j/0ILHpdaIbwhjZUsc+zZTW3GtamiJQVQmd4fZfJ?=
 =?us-ascii?Q?0z3jzAAVIK53QFi74R7TJNIoLGkaSCIO5tAygbnaNXf0FVpW8uDq8eSWncYt?=
 =?us-ascii?Q?KT9dKmnCJU81ySzgxsARfjCqdNm1vH2gDc/p/Ri/e/DoIIh6vKFCoP4mBXx0?=
 =?us-ascii?Q?DPIgVUltiUAEkTv6FkTfGgx9lDCNofbKstyOoX3+rVafmYRruW59uisqXIa+?=
 =?us-ascii?Q?xTGGxDPtIj6lq1IOlymVipJG0PDHUcCytODaLU43c2XzDNWTF52wLPJlu/RM?=
 =?us-ascii?Q?gTFL927/rK5yS2iRCoc8UAs3AmNwp9WYaXBkTex417lEjlbAzmcDFXXPbWdg?=
 =?us-ascii?Q?LdjqJIZjgbuptsUNWnKN5P/rNIgUC1lFnk1+obtsAp2G0JbiEoAzDhu21b6l?=
 =?us-ascii?Q?Qq1E5Mv/yYtCkENXpuClUS53Vd5VjhXi/M0/mGg+JTgHiu6jMiFuLsuGGKkZ?=
 =?us-ascii?Q?qhNUlQ4SG+uWDKgQJeFmGq4vJdUpp/k0sjymGuZ/QA/3KuRX3OHoxUIYJu5H?=
 =?us-ascii?Q?waulyTSoalr3qPA1MaNUi1Y7WpmXoa9fZUcitS0ThaiWO63lkVkpIxgkkwO/?=
 =?us-ascii?Q?R3rm0qFS8Ypqk43L5dQTS9z9bRg+lmGWiAzs8T6bMTEO+nh7HqmIa6R5fbj9?=
 =?us-ascii?Q?Qr3XZiSnpkIem7oCWxx/xOpd8xFjIIGJkME7vjW0XFLCAnrSTaejduop2FkC?=
 =?us-ascii?Q?/5i4lielwltKFy364A9MtU9XCiteeTf70Mj961GBfHdIhFC3L8MPBQprnsya?=
 =?us-ascii?Q?lGNmw01ljfTyIOO1zpITr6B40+jYJ0Lv9+d/sKeK5GSgkUSRoNyhSfmn3gFv?=
 =?us-ascii?Q?Q4rHvhSy+OhvOqShoqV5T1lTkVzdB5YzjDG/Fz77tR9EyAidS3+RO1FF7jp4?=
 =?us-ascii?Q?ggcUmPOQxLv7pQ+4NRJNGSGrDWutSeVX+0OAciH8623RgcKyEjNfKznt1/pn?=
 =?us-ascii?Q?OBHnaulrJAsLd5S8JAJADmxtX7OqkIpihAm0bJYZfYDN4bxaay0Yi2W4fPNI?=
 =?us-ascii?Q?2ELYl4vIDlsWDW/dP/ItP1AlD+7ADenjI5lv8XTII17l3yz25HdF5a4FZhuK?=
 =?us-ascii?Q?eohpcGE11qm1QDGV6uCq0PRTitWNV9ANPuD3H25SYoFxlTxsiMwGyO3dyvvi?=
 =?us-ascii?Q?YHuIGHQyVtdtb/rhT8IjwT8g8nu2SfyBreE/gJ7i+ir0bvtBYgYCkCtP6bWX?=
 =?us-ascii?Q?AehMFYGMAEMw4K+bX8ao4J1+Hccpv/slC8vvDPgSMhZQB/ssNw3drwe9PHSo?=
 =?us-ascii?Q?YEe8A4iWxkmfl4tSB6LWlAO7YaRpw19LnnFua+8XsbHkQcshBV6a/bNZ0mEx?=
 =?us-ascii?Q?dFEnFOy+0q6vxXTwfQyKZ1DVBkcNJPEIf8z2wh2tcm8SDfiA7EjRncZBV/bz?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dacd64c-645e-4195-3148-08da94badcb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:32:31.5155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmeZbygTSVRwT9ZO5xEzoeMeklHQg9nugs//ATZERhW7TlhH7hTlDCUef9LY3Hx/Um1ZIjst/YnKhJ6or7MCFbgNzjQtDOwCTt5GfPDXWOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.132;
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

Replaced argument passing by reference with passing by address.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 7e45897f9c..0b5648a7cc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -560,7 +560,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char **dis,
-                     TABLE_ENTRY_TYPE & type, const Pool *table,
+                     TABLE_ENTRY_TYPE *type, const Pool *table,
                      int table_size, Dis_info *info)
 {
     for (int i = 0; i < table_size; i++) {
@@ -585,7 +585,7 @@ static int Disassemble(const uint16 *data, char **dis,
                             "disassembler failure - bad table entry");
                         return -6;
                     }
-                    type = table[i].type;
+                    *type = table[i].type;
                     *dis = dis_fn(op_code, info);
                     return table[i].instructions_size;
                 } else {
@@ -21915,7 +21915,7 @@ static int nanomips_dis(char **buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, type, MAJOR, 2, info);
+    int size = Disassemble(bits, buf, &type, MAJOR, 2, info);
     return size;
 }
 
-- 
2.25.1


