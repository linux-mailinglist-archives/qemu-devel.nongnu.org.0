Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FB5B5AC3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:01:10 +0200 (CEST)
Received: from localhost ([::1]:50168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj3l-00047F-LM
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZ6-0004Y5-Os
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:28 -0400
Received: from mail-eopbgr70131.outbound.protection.outlook.com
 ([40.107.7.131]:5091 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZ4-0005rg-LD
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJu+bxJp8XHZYhPjg1jZausYLJMdNJ6V6djWrOcLvfW+ytDVQOo+2KkSKDXSON/1USknwuppHoXhF/Xz/kHxGOAXp3M6GGvxGEGOu01m+rc8ieB329iGLrwoLoYLY6WrPhkrqiwRDYyg2zqpimI1bSPjEBzLeIWWZX8R3c2YpU24Y3jm+IojNTE89zNgkojdeEVjYh0L/7xyXgzXCLp3qn9reeHaj/v76shyYuMcaIrnyeF4t9WqrWQWNWV9MTIA99pwr2lvX6U7UEjEckQQmSyy29osRKx0ONOudxTqTe3ElqdoFt2BeqR6xdyJyrQGl1Cm8l7R3M8lNayI/W6Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moOY51iitjJiSGB1MDVeS94q1BXF6fGFlyUDPV+NJGQ=;
 b=ctdEyk7M9J1PKXtARripcXWHev4rVuGHpuLTULaQpjutsKhVzNr7eFtVgnhfDw4ckE9lOp0VeEPwOQpkkpt+teoi2XSAazC1ewBejAnUHAFPZGG/3hk+Tu3Le2/6jmiAMS9cwqUX19dH5PGmEBRxUxnqYq86VWxAyjPPCDOGtCkjO4ar/qUBzcZYnmw9JcpjQMsbd+smCHdmA3ZgTkz93dQbPw4LuD3w7JbWju0a1Cl9wuO6gv1E8Wl2FwAb97z6F7xVGB89E1d+98b1GVxpP0BbzXWIrbAUEiYQ/X+1EmYTgIbu0j+zOpB8mrfr6tpNFPoh41HKcY5sOh1RvoqglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moOY51iitjJiSGB1MDVeS94q1BXF6fGFlyUDPV+NJGQ=;
 b=CjjBnleYuGQ6VTTV2cmQGuknNSichdNxUWQ0tildQqGvAs5SMBUrMviyuFznv0qp+4RWE1B0hWxIFu82o/l4lDPXAjeddwkdQ5xLIQVqkvp3HkKJ93zt9/M69VhmUa3FKmJpbsDJ2lumYQJkTMqPncu0iz8fe3fjXfi4FJI1XsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:29:18 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:29:18 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 09/24] disas/nanomips: Remove NMD class
Date: Mon, 12 Sep 2022 14:26:20 +0200
Message-Id: <20220912122635.74032-10-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0aa0e3b2-c0b9-4db0-8259-08da94ba6966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGFLDhVqYWr2lM3cAdDYvtX9/fs7OJVwMDCIfOCwnLBGie5NZJiqaat9Dj5QFzjnLvX6LCgpn7dgl0dLYY6bxkAHqOpiRSX9OkoMW9G4NgPwL1OG/JG6isejiAOLnJMjCBDDCTO1p0+2HYvs+eVioaXgpyMiKks6GbSOIDDBpFLMwYJ2QYo38iy7X93sdqp8Gze5F4qQlRQOljAoxaPrTKKl2AVPg09S1OVi34PF9rS6OC2qmX9aOqvWMcwtryCOHHkHzB1bP/KUqCCu7o9LFHgKK6WVqnJse3uA2mxoen1Gigqojr+i0aPAcTtO7S/D/1ns5D4zVUPyoVD8KqPwNJor91LtcR9rYSb/MDuJ+cemcMosl32euAjmkqJ5QPGIRG223MYrkIhvK7UsYQgEy4ozPgiWcir8nw48DNlB7KAh/zZBj+O+DMoRlXTkzra8IG+6a+6/tOn0fSyi4SzblrBvFxkDUOrDguv12F0HhXhcnmsl47uV7PmElFh6HOmpE1suFES0Cm1mhfzDR21NCAAwkrEpgZuQvrUut+W+yODzIUNW+wC9hCIGLAmEyQ0bAXdavzRKMYLfcvj4lEdJ95C3ExMxplaTO7RWIDRzFvYBCq82VsuoFeYzCJICbSlBdbUTPeBoIFjEfqp3hERCmbEq6e8tZ2WblT93aiSk8+YAZg7MSNe5BPgR/nIm1wfoaMyPpn+KdLpWOZ2clKxAIqWkTNIEQA5EYqsfWYTzyfLIZ/dkWN35Jj/AwBq9gmJa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?miESs8lCLnt+SxF3bmQcAXDS+qSECl9pskFmodZG1Td3JDIl46kRy1pDFzYC?=
 =?us-ascii?Q?DfnZDhR3LYhqZcoYUd+iUMBjezLGI+fEVwbX+RgMpOYCLeXV9SFgbE03fx3P?=
 =?us-ascii?Q?eZHbmGe7pulMlPwK55y/MI+5AK5jH+yYogqUCCGgp4BQbZfgxaO2fxz7fakA?=
 =?us-ascii?Q?lQkncklBMdEcQVuUdMAnqG/awOlgTDf8m3RZGRmPlPeRepa+8RKO0kgFvgzg?=
 =?us-ascii?Q?+Nh4P2/gSQYWfiFLumzpaBmm1RwxYgtwcoMyM+x5/Z7uv3Azal0UAeBVMop4?=
 =?us-ascii?Q?58nd+1NZtrwcPTnAohAyrhS8iM3EAmPePB7oPQ5VPoJhOGjXpcX1Q01FpHIB?=
 =?us-ascii?Q?wb19g7dd42hT/79gEDv/n8YfgzYPsoO3QmNblcVpCcg60nax1jCb7SKUHlxx?=
 =?us-ascii?Q?3FBDKmKvzBQLPJeYjnUoh1aughzyD4yAYgmf9u++SKJAORRFijkX76cLkl3X?=
 =?us-ascii?Q?poYsrKRzSIFHmfCF1xo5L68ute+efxH6/9OA7RUe2oXOpTk967lMhh52BZki?=
 =?us-ascii?Q?mzXp3JoSTdUFHOAAIAtDOgw8MbbL2EhLZgdddOepTmRZ/T19XrBDIB3tO17g?=
 =?us-ascii?Q?4Yv6g8+TdMLfvo0xVIZHkmiDFgGJFV7zmJA4UeRTVqFTqTrUW/dSLGDOnIgM?=
 =?us-ascii?Q?9uiA/gqENx9YM1FYhEtsG/scRO7USymgY6ArbrRlZtGyq3UbXKa79qZI1aYj?=
 =?us-ascii?Q?6nWZL4GzTEQIV3CHA6YHfmN/NzfO2rglnOorZvFE/efJSWZicAWO54Kig+G7?=
 =?us-ascii?Q?x+6zl1DVBL4i32Um7SLhrgjuSlvAltgQpg32gsdc0isa1Aza2/r5hBMuZQ8x?=
 =?us-ascii?Q?27qDXKBdlpbX71S531adnf7MazEwa5vcoOEJ9goLILzFtsWk/CvY2XZlarOV?=
 =?us-ascii?Q?OzvQUbzwLh7UsnxTaEo8NU1xNzmwAUqb2CC9OdlDqYlkBJAb74eeAvVFtmq0?=
 =?us-ascii?Q?0b1BnHVUuu+mBGany2nNsinTtf5ZwlshNEw3SBUcNv5g3BopbU52QtmyAfhG?=
 =?us-ascii?Q?H3BiOhddm10CRj/Pi0LFoh2gQ46VDQXp5a3qtvr8X3aqIOBM37JnJum/MDND?=
 =?us-ascii?Q?uoN/URFuuauxe3M4AvhnueLMtdRiN3jXydh1yb69Ksjjd9erfHbzEd7TQ1j9?=
 =?us-ascii?Q?Mpybtqf8MG0QjcdiG0MQx4fqT1sUcLFcJi30XRI+yCeYP60yyQUd8q5xc0rk?=
 =?us-ascii?Q?MEgwxr/hC1IBg3M9yC/x3J4TROrh6J4DnlYN29iMcazs8b9qBTrjj1pCIVXa?=
 =?us-ascii?Q?X33jRFgvqRgAkp8nmHTWZ3+4t+qsq+5Szz7ncYjs2YeqWhNvMd8tzUzVyNfO?=
 =?us-ascii?Q?tnsS4H9aMTz290HXH7yiWYOeH3CEWxBTjqtAJXpPV02CCUdknbUYfkUnnyPo?=
 =?us-ascii?Q?6FEluzksKxdp6JJv74Cy6tUyqppL6AgNtH0zTrvavZuQPO2Be6w3iV++WMfz?=
 =?us-ascii?Q?etkkEbix6r7IqLpeHlrlk0geRUnI/aBrDU7FkkYRv440htgktjXTyaTbzM8j?=
 =?us-ascii?Q?2VslfCu031er3r0N0BpStfJXjG2meNmeS7+VrIVVUg4tMSB1FuTl76DJ7L4R?=
 =?us-ascii?Q?LtpMom+Oh0nR2XDzvWEUu08VyMOJGrml/QM7HfjY8nz129mdk2zS1BdzcBNB?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa0e3b2-c0b9-4db0-8259-08da94ba6966
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:29:18.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kquOASpKXIwCVTx/dXQv9uGKuo386z/XFEHT7rq53UDVmBqW6UPeDFo/wHllKL2Qg/mak/pc+mYtN7o3eT4WDQjKr7kaF4u8DXz9Mw8c72I=
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

NMD class has been deleted. The following methods are now declared as
static functions:
- public NMD::Disassemble method
- private NMD::Disassemble method
- private NMD::extract_op_code_value helper method

Also, the implementation of the print_insn_nanomips function and
nanomips_dis function is moved to the end of the nanomips.cpp file,
right after the implementation of the Disassemble function.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 202 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   |  15 ----
 2 files changed, 100 insertions(+), 117 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index fa2cf2204a..3b5e6d520f 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,105 +41,6 @@
 #define IMGASSERTONCE(test)
 
 
-static int nanomips_dis(char *buf,
-                 Dis_info *info,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
-{
-    std::string disasm;
-    uint16 bits[3] = {one, two, three};
-
-    TABLE_ENTRY_TYPE type;
-    NMD d;
-    int size = d.Disassemble(bits, disasm, type, info);
-
-    strcpy(buf, disasm.c_str());
-    return size;
-}
-
-int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
-{
-    int status;
-    bfd_byte buffer[2];
-    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
-    char buf[200];
-
-    info->bytes_per_chunk = 2;
-    info->display_endian = info->endian;
-    info->insn_info_valid = 1;
-    info->branch_delay_insns = 0;
-    info->data_size = 0;
-    info->insn_type = dis_nonbranch;
-    info->target = 0;
-    info->target2 = 0;
-
-    Dis_info disassm_info;
-    disassm_info.m_pc = memaddr;
-
-    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
-    if (status != 0) {
-        (*info->memory_error_func)(status, memaddr, info);
-        return -1;
-    }
-
-    if (info->endian == BFD_ENDIAN_BIG) {
-        insn1 = bfd_getb16(buffer);
-    } else {
-        insn1 = bfd_getl16(buffer);
-    }
-    (*info->fprintf_func)(info->stream, "%04x ", insn1);
-
-    /* Handle 32-bit opcodes.  */
-    if ((insn1 & 0x1000) == 0) {
-        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 2, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn2 = bfd_getb16(buffer);
-        } else {
-            insn2 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn2);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-    /* Handle 48-bit opcodes.  */
-    if ((insn1 >> 10) == 0x18) {
-        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
-        if (status != 0) {
-            (*info->memory_error_func)(status, memaddr + 4, info);
-            return -1;
-        }
-
-        if (info->endian == BFD_ENDIAN_BIG) {
-            insn3 = bfd_getb16(buffer);
-        } else {
-            insn3 = bfd_getl16(buffer);
-        }
-        (*info->fprintf_func)(info->stream, "%04x ", insn3);
-    } else {
-        (*info->fprintf_func)(info->stream, "     ");
-    }
-
-    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
-
-    /* FIXME: Should probably use a hash table on the major opcode here.  */
-
-    (*info->fprintf_func) (info->stream, "%s", buf);
-    if (length > 0) {
-        return length / 8;
-    }
-
-    info->insn_type = dis_noninsn;
-
-    return insn3 ? 6 : insn2 ? 4 : 2;
-}
-
-
 std::string img_format(const char *format, ...)
 {
     char buffer[256];
@@ -739,7 +640,7 @@ static std::string ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 }
 
 
-uint64 NMD::extract_op_code_value(const uint16 * data, int size)
+static uint64 extract_op_code_value(const uint16 *data, int size)
 {
     switch (size) {
     case 16:
@@ -765,7 +666,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-int NMD::Disassemble(const uint16 * data, std::string & dis,
+static int Disassemble(const uint16 * data, std::string & dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size, Dis_info *info)
 {
@@ -22348,8 +22249,105 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
+static int Disassemble(const uint16 *data, std::string & dis,
                      TABLE_ENTRY_TYPE & type, Dis_info *info)
 {
     return Disassemble(data, dis, type, MAJOR, 2, info);
 }
+
+static int nanomips_dis(char *buf,
+                 Dis_info *info,
+                 unsigned short one,
+                 unsigned short two,
+                 unsigned short three)
+{
+    std::string disasm;
+    uint16 bits[3] = {one, two, three};
+
+    TABLE_ENTRY_TYPE type;
+    int size = Disassemble(bits, disasm, type, info);
+
+    strcpy(buf, disasm.c_str());
+    return size;
+}
+
+int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
+{
+    int status;
+    bfd_byte buffer[2];
+    uint16_t insn1 = 0, insn2 = 0, insn3 = 0;
+    char buf[200];
+
+    info->bytes_per_chunk = 2;
+    info->display_endian = info->endian;
+    info->insn_info_valid = 1;
+    info->branch_delay_insns = 0;
+    info->data_size = 0;
+    info->insn_type = dis_nonbranch;
+    info->target = 0;
+    info->target2 = 0;
+
+    Dis_info disassm_info;
+    disassm_info.m_pc = memaddr;
+
+    status = (*info->read_memory_func)(memaddr, buffer, 2, info);
+    if (status != 0) {
+        (*info->memory_error_func)(status, memaddr, info);
+        return -1;
+    }
+
+    if (info->endian == BFD_ENDIAN_BIG) {
+        insn1 = bfd_getb16(buffer);
+    } else {
+        insn1 = bfd_getl16(buffer);
+    }
+    (*info->fprintf_func)(info->stream, "%04x ", insn1);
+
+    /* Handle 32-bit opcodes.  */
+    if ((insn1 & 0x1000) == 0) {
+        status = (*info->read_memory_func)(memaddr + 2, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 2, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn2 = bfd_getb16(buffer);
+        } else {
+            insn2 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn2);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+    /* Handle 48-bit opcodes.  */
+    if ((insn1 >> 10) == 0x18) {
+        status = (*info->read_memory_func)(memaddr + 4, buffer, 2, info);
+        if (status != 0) {
+            (*info->memory_error_func)(status, memaddr + 4, info);
+            return -1;
+        }
+
+        if (info->endian == BFD_ENDIAN_BIG) {
+            insn3 = bfd_getb16(buffer);
+        } else {
+            insn3 = bfd_getl16(buffer);
+        }
+        (*info->fprintf_func)(info->stream, "%04x ", insn3);
+    } else {
+        (*info->fprintf_func)(info->stream, "     ");
+    }
+
+    int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
+
+    /* FIXME: Should probably use a hash table on the major opcode here.  */
+
+    (*info->fprintf_func) (info->stream, "%s", buf);
+    if (length > 0) {
+        return length / 8;
+    }
+
+    info->insn_type = dis_noninsn;
+
+    return insn3 ? 6 : insn2 ? 4 : 2;
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 82deff1094..75abe03bba 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -80,19 +80,4 @@ typedef struct Pool {
     uint64               attributes;
 } Pool;
 
-class NMD
-{
-public:
-
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, Dis_info *info);
-
-private:
-
-    uint64 extract_op_code_value(const uint16 *data, int size);
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
-                    Dis_info *info);
-};
-
 #endif
-- 
2.25.1


