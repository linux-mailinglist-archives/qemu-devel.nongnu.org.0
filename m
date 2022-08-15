Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A9592A63
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:37:48 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUfS-0004o2-TK
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUVy-0007NM-Em
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:27:58 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:18016 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUVw-0000JK-HP
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNts+aD1me9oe+f73dpOx8yxEX9xdj7yQSgLQ0J2MP0MAiK2KkFNObvtx37TQsD88utV1do+vxyN+7THH+ValmrWQRpY1adDutBaMoaHPgkRkVvJfberalGz200JwcRbg4yzLkFzym7fcJsavA+6zl9sAYXGZTUVf1/EVxOQzVSRBloWEKqMe/6eo1PbMkZh0ezL8LohEjiBZ7euab8Bd116XU6s2Cet4TtPqr3EZbVXZiTRf+4xUxBFBw0U1flW4hmZNfjMy7vtiSb6mHrBQAwoXKgupxkUxLuoXGPRjUi9rNRF9zWKkfkmTtcyNe9RH954QwF1O0pdCO5xTXPtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrqMb7EmACoUQUeawI7QfJY6WHlZEc6lsT+wVeC4jD4=;
 b=RojlDPckkEcNkYLClfrsBAHtTQq099eCDzkWaTUAZjOvc3q6xe6jv4k+lzDCTKspgt1kF5VyvYgzF/WGrGOCbsfZM3J+a5heAz9RVAuk3j12josUcItOUXNQG2Te7DFlOEVgOK6/ygVOXlkCO+CwGzcDZ2J1R4LmDxgspiYebWtLa9/lj+3cwlsaFVhjDNtb3U7cBEQ2d0AcDnXXGTrwuZ7ZoIHgvRDRaGaxkSmy5zNIedUxNl+46F049ySkgS/0lgiJlASKzP7IwJh9DowxbIfkb3uiVF6Zad/brmtXqhwjItIzHUz8quGT6ox57y82U0ADnUu5jKxszO3hnTXO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrqMb7EmACoUQUeawI7QfJY6WHlZEc6lsT+wVeC4jD4=;
 b=SwI0hq5T/gwkD6pGenUtxfeBMMxoZ/BoCapEeqNt87/Xkrvuugq39ul/qgJTO2s5J4jLYoElF9h4FvpfeJ6gKZ5LZcQgLg0uvCsROOSIsU+EqZcOe0ay/P6VnvnJIUIJRpdwz2S8OHxNu5OA3lpPsj5Wo6kG8um7cB5mvQbllk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:27:19 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:27:19 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 02/20] disas/nanomips: Extract enums out of the NMD class
Date: Mon, 15 Aug 2022 09:26:11 +0200
Message-Id: <20220815072629.12865-3-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 944e8924-6323-4e36-5795-08da7e8f9658
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: by++KZO7henB9ZKIbmllzuf1uauhgeA988bvEtQteyl33KXwPUxumGKUPyycbmxKWX8qtMw0knrypAtGKoNnkgaw1qlhge+uW2Qq0HRc1T5O0sUTlOaR+cTYARb0FzBvagUV6BrmhL2yCgnmTEubb6bimR/D+cCf02hZvLLHVG+3FG7lFTD6hELQ5V6lJEEPUcr1nnMEDLh9HrriQISUKv+DVtkD/X6D2cH2qohhos+hzbvSLtNN9UKdAEscPkYrbLfdZD7iCTVZQ0XgY5unUAxsS4p2amxU3T/29gEzsCmdELlcuLNyPJzQitghC8MfBnBNmsdrRIhlXc6JafKhdjvJdk8QI7zWqXrMok/lgzReqn4I259cOiTLqmerYDSl60Gulx7G7s+dSgpNrwc3f8rDlwIqYAoFOQSY4GhxcSBYJt8StR/aj7Q1e1O2MoJnekgH44ip9Vpyf2XuKcO5+nwKN2CTICx9IhDN0FvSrTOn6L9D1mHzDG9zHKKY5JnFjy9k+4JnlrUbXCOD08WSBFCd13thFkKJCYE5ZTrWNOY/3coYb2Zdfbntos70y04OaJtIPDEf5VDnqA2I8EEyTWIj8dYwA0ZHe9g/ZDMC7Y6t5XeKhOI62mqGpjVdWIZ2O23c3H6zFPJLII/7cvGbVDHfn20MsuNElux2nCsxQtghhEdH+Zy6tMWsAmWtO64bYG3yF5MjyJOcf5xXXiwbTXIBpwgye6CjGDYov1k01WjSfiB8C2dRxNKzP32S+7KTeoPaeYPMqaKOcX3RMS9ek3J6RlLJjErXh0dDNP9UOnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(396003)(346002)(376002)(366004)(86362001)(2616005)(6666004)(186003)(316002)(41300700001)(107886003)(44832011)(8676002)(36756003)(8936002)(83380400001)(1076003)(4326008)(66556008)(5660300002)(66476007)(66946007)(38100700002)(26005)(2906002)(6916009)(38350700002)(478600001)(6486002)(6512007)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1OXrwEHu5uVNYTviUFEACmyoeWdPN2dKn4zQNWX3SUbHaD9W1wMS57jVwhV?=
 =?us-ascii?Q?rEmElDslqbB+k0DDadOxSowx/hZpS4U0b9d5C5n/pStDsyT13UtXpceWA7nM?=
 =?us-ascii?Q?zbRmA0uWFN6uqEaJs51uVuGV+MjAk7Qza8aMvC38aWVzRfGxIrf35Z2JyND3?=
 =?us-ascii?Q?NL9dF6Jnv/+WEUXEdWMVFO9veKxdrGiEqaOeXBn3bdnFcyyJhZ2+7ONIUpqa?=
 =?us-ascii?Q?GsHYNcrZH+kJdfbu9XjkG+rrAzQSTyuhQ3XFe4k22qW/BUxXL/8fOvDBYp2A?=
 =?us-ascii?Q?RdlVF9d7wkICk/iT9CUWQrOWxK8QdQVWV5haQjMw01Gb9WdhYqYDiDgp0f9n?=
 =?us-ascii?Q?aNBHJVTWatX/qZn6heohAqOlxeAZNr9QiaDtCbULyMriB0RuV/RqJObnpcza?=
 =?us-ascii?Q?iHzxw48U+Zb0YN6Ma1FY0QIBwKHjRszkvOskgEsrx1mmsd6341Np0uwJq0Rw?=
 =?us-ascii?Q?NNyf46fvVQ4rwmSuoaMgtMgwiVERT6LkFpoQl+GmOMTERwex5lO8tuulk6F9?=
 =?us-ascii?Q?zutoxQyGGHNHgoZ9/wRHQm9u+RLDGywfO7B785q/NjJ9Mv54Z7xmf7u9OQsR?=
 =?us-ascii?Q?2IxitxQea8Ru0KU22U+tY1HpKkATKj9InmkhPPlbX1W0lOoumZKM7a2F0f/w?=
 =?us-ascii?Q?Wdz0K9kAGEd/2pozjjCpN5ieZz6XrEAeMpJgsreaT1JpXHC7A+1W/C8tY2qF?=
 =?us-ascii?Q?YLP59VfipVxoIJfITNaAToqi6/dljbxCA9TyBgrA51i7Xi9JGShFyJ1zqhUF?=
 =?us-ascii?Q?AYkRYkRkq00+7tIt1AjljaB1WyLvSKsvYo1jog564uBgbwISoVXmvzoOdS3y?=
 =?us-ascii?Q?Rw0BvWgcJOA0hc3DERu3VFEt9SqfdjKKvDUfhOZbaBLxQlX1UAKadGkonnKP?=
 =?us-ascii?Q?noXC7Nqt2Vfiyh47l/to0IwFhKnXYSt6UT6VbrkFNBE14TBpBK1SIYhWhX+o?=
 =?us-ascii?Q?OfbbbJ3D2mA6+Fmt1ANRLDbB1z/iDe5zEahEG5v+DNr7BgA6AdnZ5owwZQ2E?=
 =?us-ascii?Q?l1NwbMPLZACadqi0wkmcf/A305xRniGhD4WbR+zlH6j+LruttGQQOblec7bt?=
 =?us-ascii?Q?QqZ66Rql+ZjfOSgVjUXOYLBAwSwBfW+Sja79VnrsVdh3Elii9+ITMaCRNzbx?=
 =?us-ascii?Q?d3dePSXGV1y90vw+qEN5vf9qF0uiBBWLp3zRMe/ODadKTCL9ExdOX8WKvo1n?=
 =?us-ascii?Q?KlCOewRQN2JYxOVJwaICYN2uKPTnPEdsYEy4ZdQPdJpMqcMn/44sk6sHvldj?=
 =?us-ascii?Q?DZbdDpzuuHoxWGEmYBqSGvcCBxSrxy3g/m9XQfcQ0fLXViab6z7F8DGJSxdd?=
 =?us-ascii?Q?nptgtuAXe0FDXEx3LWWRC1RcO6mEhuy/Yn7A3Vu0OC9+bTXpjfTfNZKbquYB?=
 =?us-ascii?Q?XrruVV1S2NYXZKDxghL+JgP17TcQntpYrefpBWHX65iqkxQBQ3KeCx/5nk8P?=
 =?us-ascii?Q?8I2vzpMxUyYPWzr/B4SFDpiivAHjg5HiLXAcKDIWWjOkv/eoPl88lW55Z7vN?=
 =?us-ascii?Q?tfTzS/HyfWZiu/CHCXu58SNkksvND9Pag2iz78cM0eQ7IWS2F1Ksj0ZDRZPw?=
 =?us-ascii?Q?L2uEw/LstLJFZ0qwHqUsqrT4k2hXoi7LgzCo9FQdbaY385+t9EMMVHs0MpQT?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944e8924-6323-4e36-5795-08da7e8f9658
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:27:19.5391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnCHoKMcrAwqlu+shpzp1bEioCJ+ziYTI2c8YRn3VfhgU/lMHUYOCcuKZga2gk9osji52UDdiQjggVBIPM4w1rMszgvZxN46s400z+H8n9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.21.97;
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

Definitions of enums TABLE_ENTRY_TYPE and TABLE_ATTRIBUTE_TYPE are moved
out of the NMD class. The main goal is to remove NMD class completely.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp |  8 +++----
 disas/nanomips.h   | 59 +++++++++++++++++++++++-----------------------
 2 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 96b7bfd83b..00e489fd59 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -50,8 +50,8 @@ int nanomips_dis(char *buf,
     std::string disasm;
     uint16 bits[3] = {one, two, three};
 
-    NMD::TABLE_ENTRY_TYPE type;
-    NMD d(address, NMD::ALL_ATTRIBUTES);
+    TABLE_ENTRY_TYPE type;
+    NMD d(address, ALL_ATTRIBUTES);
     int size = d.Disassemble(bits, disasm, type);
 
     strcpy(buf, disasm.c_str());
@@ -774,7 +774,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 
 
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type)
+                     TABLE_ENTRY_TYPE & type)
 {
     return Disassemble(data, dis, type, MAJOR, 2);
 }
@@ -792,7 +792,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
  *      disassembly string  - on error will constain error string
  */
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type, const Pool *table,
+                     TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size)
 {
     try
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 9fe0cc67da..f65a0957b8 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -31,41 +31,40 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
+enum TABLE_ENTRY_TYPE {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+};
+
+enum TABLE_ATTRIBUTE_TYPE {
+    MIPS64_    = 0x00000001,
+    XNP_       = 0x00000002,
+    XMMS_      = 0x00000004,
+    EVA_       = 0x00000008,
+    DSP_       = 0x00000010,
+    MT_        = 0x00000020,
+    EJTAG_     = 0x00000040,
+    TLBINV_    = 0x00000080,
+    CP0_       = 0x00000100,
+    CP1_       = 0x00000200,
+    CP2_       = 0x00000400,
+    UDI_       = 0x00000800,
+    MCU_       = 0x00001000,
+    VZ_        = 0x00002000,
+    TLB_       = 0x00004000,
+    MVH_       = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+};
+
 
 class NMD
 {
 public:
 
-    enum TABLE_ENTRY_TYPE {
-        instruction,
-        call_instruction,
-        branch_instruction,
-        return_instruction,
-        reserved_block,
-        pool,
-    };
-
-    enum TABLE_ATTRIBUTE_TYPE {
-        MIPS64_    = 0x00000001,
-        XNP_       = 0x00000002,
-        XMMS_      = 0x00000004,
-        EVA_       = 0x00000008,
-        DSP_       = 0x00000010,
-        MT_        = 0x00000020,
-        EJTAG_     = 0x00000040,
-        TLBINV_    = 0x00000080,
-        CP0_       = 0x00000100,
-        CP1_       = 0x00000200,
-        CP2_       = 0x00000400,
-        UDI_       = 0x00000800,
-        MCU_       = 0x00001000,
-        VZ_        = 0x00002000,
-        TLB_       = 0x00004000,
-        MVH_       = 0x00008000,
-        ALL_ATTRIBUTES = 0xffffffffull,
-    };
-
-
     NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
         : m_pc(pc)
         , m_requested_instruction_categories(requested_instruction_categories)
-- 
2.25.1


