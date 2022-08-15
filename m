Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD3592A65
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:38:51 +0200 (CEST)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUgT-0006E9-Vd
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUY4-0008Rh-5b
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:08 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:52230 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUY1-0000jm-Dp
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXWAgbDWq+FyEiVN3U4qthzIOH6Qr7fF0acumtCHpaaI5e1/2oFIhhnvGxl/zcCl+CJKx2lDPz6J4GKxZ/x/xWvSQKoKjyuNNhZZlpgl/1tjADkymMnWRpTcWfRqxf83Sj/yn8o8ueW+rTS/3/jGPYjTu8rzzU6PaxNf7j9uWr/BmuJ3xiPBTC6cS8tiffrNsAkDvNqfcU7LNZsP+kOtfsUNyeVxIZ61xAYhpuQR6V6Aithae9FFQNeKNqDVODc8Wa4ZXsO70mOe2pV0G8tT4d9mRoua2teUHFq4QJLhSyEju8C6wo9ckZBG9xtAM4pQ0UoE8+6g9Z03s4y+Ei2hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoLvbZbtjo+QPQn5q7Cv7jU/N4X43Xz+G/TkOOipvUI=;
 b=Mo2Mz4EJX1rlQxXndOabX4FEsf8o3IDPjdAxcEsl+amvKojFHEzpzIlo6i+QpQb2tjaaPti+QD87GRElQpHc4sPEidJRkNlG/0L2gUywELyvueVoB1drN0H/Zz6Z5GhkxPTblNjoHgc0k4YMwN3VQtjTCYkbRKTV4WlrlG+vEvqrK2d8T3+dVv0FCCXq4Raqqb/C41h9YZ9eGEsvhypTjk1mOdd4DCI5zUcstjdzIXY6RSp/czl9L5mw4UzbetR3Fexb1eppgAON7Srjics1JtqXt1QdT+Lmr+a+bZUwCmDfLI6rBFVwwh6LWhPIaSp/jiQFuKu2Z7yPv+x43OU4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoLvbZbtjo+QPQn5q7Cv7jU/N4X43Xz+G/TkOOipvUI=;
 b=n+bAmeu9PJ0iuhxzDDpqbsYgU6vZaf6Qj4w7xNSk2ehDkUpChqEgtMlU5VVfstZgiGYFdlVj1DdQ15Y3B7HJlDE/t93um6rY20e/4Jkb3unIFfTu9QutaC1OYYNcRWGcwAnx/3bnNJm7Vek3Oyn+N38QSrRDr6ShTl1qal/rbl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:29:37 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:29:37 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 08/20] disas/nanomips: Remove NMD class
Date: Mon, 15 Aug 2022 09:26:17 +0200
Message-Id: <20220815072629.12865-9-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 416f6ee6-6293-405c-1808-08da7e8fe879
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTnvxmaNh2VqNOAZB/neoadqi5hu4uAplItYgi00XFivlAPdLrPgLQaMXbDUg74JFktnatQx6qq0xWTDvRCRYuEtc0rlkPb1uZgVtETK5ArOnhlvW4rCiOdGTa92PFrD/38NqAlGXk7MgjcoX/Xn3jYqri68zB0XdAHSkcJjspITw1y/oo+UjOPjgKpFdM5q+K/Ma2E+rzVP1eW+GDDzKxUHEUJ5lx2vxWxZX/vUPje8le/SfFeZExnRIjDUSVcVOE7Hgp08Qiz7MbxiMNThO+iEqJCZ2RGXlD9VNGC2zYGXFJTKNZY6C+mLwf4vX51mJ+BfxAsNa15RNVbOvSyRcKdXeAh5S5W8WsgChsxQXGPpe4IXZxFgp/KoADfZZxh9rM+jlRph8o2Z7DY0lBDAkTUP4WQCpR7+igacWQ2VfyZbj4sJvXl48nPI/7rimaGzE3WhJ97bphD4Y/ozOYzpf5dxmedzPgymXlNFWGmtDZCO0PBepRxMRkzIBlz5PucB/aRZyUmanwU1UfZ06ZVZR5n5+/J0UMVJyYhHu4a7YAStgZwy28XBbgFAf8/D2h8dOi4CGBsDlfDPx7wf8HJQ04JTYZwJfipre5fvvcE7jfsX5/J8MKt9M5rmUgbmF5YfxB8Lehjb5KtWcXVuqI/BhXcnzzrDVPKoZym2yGdUpA9ci5ccIZZFnTYiEBvQVvfnXKxq+b5LnNEeb06IELGR2Hce+HbipszVKb0gdNJJ0w4hTLg4wY+ZHkKnxuy7UDl+iWPeHR4r81X1pZFOX/FES9jAN3CgzSQWrd4cFsFi4Qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(6666004)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?88qSDWCffEbseBlnXGzjG4LVvmjekC+01rf9nADJbNeVIinFq//6n8yoY937?=
 =?us-ascii?Q?ES1MCTq1Dhb7GyY0ofHupnJCX37rIhT3iPl5w5IO8+T4UBdW7+Yii/h6R3gu?=
 =?us-ascii?Q?bdRFMy3XLD69LofmHEacW938J4x1bfVxrTMvloALsC3TXoeeud2n7w+E4tIZ?=
 =?us-ascii?Q?D/E9K1K3TJGGBjuqkTRs0ygzpUUqCyLU01OEqOYQSB//3+yogRqZiigy0xPm?=
 =?us-ascii?Q?2K5TYvfpEAiM2OVHpy0SWsdr/DDqZ8j8ZNYlbDD1za8SKbUKJOzFlT0Yq9mi?=
 =?us-ascii?Q?SwOVPvWblriYZScdsHsjl3JM0FT87Et81hoq9zxU/wRty+Ngg0iTKlnS0dik?=
 =?us-ascii?Q?2nxuAMzHNWmU8eepF883cYhBgrpR+L+dsS5+dwx5nj540CTtm9qz1fWwzqTR?=
 =?us-ascii?Q?Up5udRgdo7hR6CH3vAOCTZq9amIecUZS9vA96/exaY5wLEZWODGwmPuC/YqE?=
 =?us-ascii?Q?xLlUI39/cYRb73jUK3o0DyH8m5I4rP1PnellVm3iPayynWgovBLSQcyqFcAj?=
 =?us-ascii?Q?FNufLFdbUrJhiUATWDDr1rmL42G05BtsjcoFlhPOnbw/uY4wl6R0AhSMXOdu?=
 =?us-ascii?Q?8O583sPv6Dv49T/gQCAno/LczTVjTT99OdnLtTuVvH2ALqYZHcVCoXRarZNN?=
 =?us-ascii?Q?UY4RmXNNC4necinJ43TBnNbIwQ8V8ZFEOmlPG+OfTJNze72tlepSQS+O9X58?=
 =?us-ascii?Q?yqD8nBnM2IvkpDhX0uTqBH/ifAgg22AxQttHo3G2g+1cFeWtvMufzscg34/u?=
 =?us-ascii?Q?EJ8Bg4lYfiur53HYllI9XhPhciHUOFvSUaQHWvVB5MUVGPOzmXppB4cqzZYo?=
 =?us-ascii?Q?3TWrXQgABhOwVk1CfRTmFyivIDphRbVB3zYYK1+CBOQCMXt50YevvgQ4ucRd?=
 =?us-ascii?Q?TWrM43w7VKeK5DL+Xm+HdALRLdniJNSTzJiAi8lgNXr4I/qGNe5Rlo42k5Af?=
 =?us-ascii?Q?jyaBIS+cXjW7znN3inRdrZd9OLUNwWzJdu/HQGHUzrBODch/2Hf+ECkilHrj?=
 =?us-ascii?Q?/grzpAPhUVQZG/Q+0cH4y5mp+BrgLTMMKyl7pXxlL4HWHF/UJlDKbR4QWn3P?=
 =?us-ascii?Q?1WTvip5kdx167zFStTCuEciW/Xpdq/vplMOcrWkOSejMFNZ1rvHLdiGHg0TK?=
 =?us-ascii?Q?R5I2+V1kgp2lIM3tG/Sh5U33nKwr1GzYLaUZtFkO4w7Wil+HJ3T4Cuc31YD+?=
 =?us-ascii?Q?JYT8I7DGxKD5x7TXuP+fmE6ofG8FeWYn3UqqMFmYbiHP6gsHHUCNW6u3I7kO?=
 =?us-ascii?Q?uNGCt+/Fa8tvCuNBbGjp2gWUzXDQ71iFtNe3Gk8b/ymN/WLfeiwH5dzSZSJw?=
 =?us-ascii?Q?1clXQP6zf0s8es9/SyhNepPtNcqeNLPtEBdPcdoX1S1m40O/SYboawyXlXJS?=
 =?us-ascii?Q?HVYC9GLLe6xu5/wTU8hyGnR/s7orwZ7eIHkEddvDLGh8jGe3mHgMP8UV35rd?=
 =?us-ascii?Q?IaL1sZkuqfIiQJ09emiHOb7HujK4tJ31qPg1UQNw+drXQTRnKojc+w50WgE8?=
 =?us-ascii?Q?rO75gki//P7P2IHNMpzfTT9pmguJqcigZTGO1jtYIaR8rKJNRx3607kaLjaY?=
 =?us-ascii?Q?BgZx82dwjE4P31NOGEsG5FOEIcCuBc60GG+dEuf0Slx5xScOOiu5Vr6xvlDj?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f6ee6-6293-405c-1808-08da7e8fe879
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:29:37.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hjernO1hIrfK05HKWauZ0ywuaasmiQKhgclY0HievoORFzrCRlsx5MFvW+EMXRcpbA74/KCN+l0VofaiNvXuHusDMf6TkgJJiu7prKytp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 disas/nanomips.cpp | 204 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   |  14 ----
 2 files changed, 101 insertions(+), 117 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index c35ece428c..be6705d0c3 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -43,104 +43,6 @@
 static img_address           m_pc;
 static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
-int nanomips_dis(char *buf,
-                 unsigned address,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
-{
-    std::string disasm;
-    uint16 bits[3] = {one, two, three};
-
-    TABLE_ENTRY_TYPE type;
-    m_pc = address;
-    m_requested_instruction_categories = ALL_ATTRIBUTES;
-    NMD d;
-    int size = d.Disassemble(bits, disasm, type);
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
-    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
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
@@ -742,7 +644,7 @@ static std::string ADDRESS(uint64 value, int instruction_size)
 }
 
 
-uint64 NMD::extract_op_code_value(const uint16 * data, int size)
+static uint64 extract_op_code_value(const uint16 *data, int size)
 {
     switch (size) {
     case 16:
@@ -768,9 +670,9 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, const Pool *table,
-                     int table_size)
+static int Disassemble(const uint16 *data, std::string & dis,
+                       TABLE_ENTRY_TYPE & type, const Pool *table,
+                       int table_size)
 {
     try
     {
@@ -22361,8 +22263,104 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
+static int Disassemble(const uint16 *data, std::string & dis,
                      TABLE_ENTRY_TYPE & type)
 {
     return Disassemble(data, dis, type, MAJOR, 2);
 }
+
+int nanomips_dis(char *buf,
+                 unsigned address,
+                 unsigned short one,
+                 unsigned short two,
+                 unsigned short three)
+{
+    std::string disasm;
+    uint16 bits[3] = {one, two, three};
+
+    TABLE_ENTRY_TYPE type;
+    m_pc = address;
+    m_requested_instruction_categories = ALL_ATTRIBUTES;
+    int size = Disassemble(bits, disasm, type);
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
+    int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
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
index da1ec2ad8f..fb832619e1 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -76,18 +76,4 @@ struct Pool {
 };
 
 
-class NMD
-{
-public:
-
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type);
-
-private:
-
-    uint64 extract_op_code_value(const uint16 *data, int size);
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
-};
-
 #endif
-- 
2.25.1


