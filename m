Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605325ACFB1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:10:52 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV947-0001v9-DC
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tV-0004dT-0K
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:54 -0400
Received: from mail-am7eur03on2106.outbound.protection.outlook.com
 ([40.107.105.106]:56865 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tT-0001wM-0F
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os1eUVJViF4BUF8+Bk70Fkm+9DrbvUrWb8mo8B7egihuYC6JMYtY4thYxqxCoshEl6zWWbrw+XMUY1rnxlvudFWdZ6lHSdf2sOxIpH2Ie2iIUJPYtryiAy+G2JgkdwNFvr0qJa1PZBsI5deMEYAZBTxSWjzFJyOLM923kw2i3YbY2zfWdQ5UeFErVpi8EJnej9JnTvngUw/a2O2mXlU7Juh6uKM2V+cGtLfvO/nBnTKWxjoObXUO7YDD/j9wKrG15frAogM8vEVX8Rn6/iKIpSeQ1YfdB+XvM+pVKTsCwDQzq9xj4eKW0AGMU/mtYI/kVwsQobPgWOXvpT/KjHPdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ1EGmUav2lvb/6KeE5jcE0LhIpa3sDtEp/1JR7yYuo=;
 b=JayroWCuVkvtFqj8B1qHkgxrnohnp1E2VblzbqzaKkSw4FSuu7rHDY39H16wpsKx986K98E1szqfEmwj7V+c2E3xOkgxJgPh4P7BpCpTbf9P8o5FlNP8IcIKYi8R6Gchv0rECF9d0Wi9B2S6FHu3VY8r2HPI+GyfCpqioisb9JeUn8Hsevj8veEhUOgIY79mYwIX7nmmHCI90XVVgCY68hTZOvQ4nP4RRpACQk5gl99k+NwRFQhR1PQcSJ6JItHH0pVwM6IPCy51u9FRr+gjQ74foNLm5fbMm6Iy/3J3i0QuwBUW9iwA31D23MXHK6DB2vAC57rhT/aUT5h4B6Q88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ1EGmUav2lvb/6KeE5jcE0LhIpa3sDtEp/1JR7yYuo=;
 b=XkjxUwpZ8TmdeA7nxI1uKyC2grbXWRbCFXwPP4EO8+EdxwIumXsJ0FztmRMFPpau/dHkUOk0jwIS/Gj/VLbArDaimTyoAplFO/A+OY4M0sjPMpW5HZdU/n+S7jKhsQToOut3uF6BOedN+5ga+NWL64ag30H8KybO+/8TJZmoa/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:59:43 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:59:43 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 08/20] disas/nanomips: Remove NMD class
Date: Mon,  5 Sep 2022 11:55:10 +0200
Message-Id: <20220905095522.66941-9-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca61bba0-5e77-453c-4699-08da8f255b58
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BHQnUXD48uwuUa8AnW5Zo1Wn9XTpviKldYthjLL6tCpDNKEuEji0uMf6u8fyTeOOE8+QsZuRN+vYKY9NeBTd9KsGMbMAZGNvfKE+glWCVGDRolmRU0Q1ArdPtQMbfueTwpn3Y87xz4uG1KIEZd6stF5oU/TtAD+wyyFHN9vlsgzvzrHBX3ob13FncIlK1uWclaN3+7Bo8zr58KQ1FLPeJYDf2eZNijH9rmKqUhZAQ0gS/FJDTydC+qQjGaT3YaDF2yMUPH/IchxUflJ4IGB+sglpfBkxD8d32t0ZlSI10QzZOD1dMAQbpEnqRqiiHV/WhOMjQyIiAjkjmG+MAf8qVQ7TFCxnDN6P6VJ4K1V0vco17AWgdtaUWnEcNwDM9HCSeYo7YBIr6lE95TxXH3vZA6xkZ1s5Al8+x6obXjWCHm1vB4cRmoWg1yiIDA3G4iDIQnxMjxkTfMktxXsR0x+Bbo73tkyQXKhcHklKQasVVaeE5+tQdQyJNbDY6jT1tvlze6k/CinObi0sC+UfTtMAdxhtvlwSr4Tg10WmnJqbhHQtSJDuQ74fF+XMf72vCrQFIsZ+JtET2OtmFCLVf6KPlMU7ijnDJIQFkrcPfh24A2eaYr2Z85hXqK4kAafJK+Nn8Z/h5TtZAOOV/tAchEEALMQOw6J+blCaeRy6TvH+Og4Xx6Z6Q8euU7WF+MbnfdLEgzdjTqe7fSq6uwhXn/YZwj3s7E8q8OZROluO0lA+WRhGDmnksoKq5AMNxD0sUvvycJfXfAJ0wflu1/xVJ7Kiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(8936002)(44832011)(5660300002)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(107886003)(316002)(83380400001)(6916009)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?el5ofwIbwvZE3Ok0gWSvz93dYhFuTk9rG+IqxEQo6Zy+pCAEkDsYOvdUuhlR?=
 =?us-ascii?Q?rNer70JGKBVXHEpSnEfqIClS8BojjqxKpJ71GtAku1LhiNdKRnda66K5eSIM?=
 =?us-ascii?Q?HyeJ6Uz6rI1JEJ1bs7Rhv2uRs1y5hla5EtAtFqc5Vu0w3B5eIg1Y++hmPWzP?=
 =?us-ascii?Q?u+kmn6aWgugwbP7P0AIiXMl+gjyDDBRpEZAnHuczHYmtbhXpUvX8d/11Gz04?=
 =?us-ascii?Q?FMgrgJGTgM2IgwdqrezyjbjRNW8szR8PJe8jYvzlZQ742DhWgrzIj5/DcaAv?=
 =?us-ascii?Q?z9N1LOwltGl69/HN19gSc3loH6b8q5BT2HhE3wcl1hgzq01h3Bzwp2xmkUkY?=
 =?us-ascii?Q?ylIl/9ydsDLeZRAWTC4i3oVwAyeUiG9IFI+z0OmBUYiYHOUTEeNvfSuJ5ExB?=
 =?us-ascii?Q?lfAMu6cmJFXHwT7RaX0oMz6V4rBI2QFzraGOPVfNFNLAy9/V0kzrbC7n93gR?=
 =?us-ascii?Q?YMrwSxinumpYj+B6zKdNVs9QtjXGy5KQRKkMN3y59SdUt2PXjW81yNYS0Gwp?=
 =?us-ascii?Q?UlsghjLWZLHaLFcmFt/Mw7zLZhwh2KQXCs43OeiANxvz3+oIRVUcYVyI5o7V?=
 =?us-ascii?Q?RL/IbUxtKCfZ6c4C9BEBHrfS8vIGdk2y/Jry6QwMo6ws/t+88FgQVP27S7jn?=
 =?us-ascii?Q?lwG7396ZJbW9+usXThljm94AVCbGHGJB9E2GMygChE2ZVE5DEmEEfbAJTuep?=
 =?us-ascii?Q?7ypQuXXo6ZSzYabyvGNp662Z9cehfLrhQUeZCIkfSg9AIDHt58W6P7TpD3KZ?=
 =?us-ascii?Q?halWsnJjc1iBi0w97b+MQLADfoVoeBetQRzlM21yC/Fc+Xyt1xWoOpuHMc3v?=
 =?us-ascii?Q?kwN9/UAu5Glw6VsTbEchKRnQgobf0X2bopIsVFiGcFBQrETr/KUCojpVGnGj?=
 =?us-ascii?Q?meTAdDkypoRjgYX34iJa8Y/r5yK0pU5l+eiMBOkrrIIuGNtNDtgChVOWN083?=
 =?us-ascii?Q?0DTv/bL5NuEo2VUafo8FV7Ca0ALI9YFE1BNjCUtyW+Tau1wFvqSnrAdGdSRy?=
 =?us-ascii?Q?XMQfpJTKgs7cPSm+t+aIJnYpSqxAiWiFHfY+UmAW1xtnAeNsI1wyEyFEJtJP?=
 =?us-ascii?Q?Moi8N7CDJK4Ov/Zg6vEHYgSyoSLy/urSUnK4f9NRyA/FBXlNEvN/dTYC7V9U?=
 =?us-ascii?Q?H49iM1s4KYFPbnVyDbOaEiTazD52Ahw17fRtBZI4l1mWHVBWJ/0WGo+Q2RSs?=
 =?us-ascii?Q?7w4HBD1RSE/NWEn4ijqXYBogfetMh2vFE8ozoCYaiRd4ik63Z+wY5OQzaC2Y?=
 =?us-ascii?Q?Fl8SNOybG8RwQI6cZRaRIGIco7IpjLSyqbnlZUCCW9aYBhfTl310swlaZNb7?=
 =?us-ascii?Q?QdmKOfPOiEJfJdHsfhDmAZrfPPVBXXXelGwA/amD8/AGBOxnL22KJO0J5dGc?=
 =?us-ascii?Q?se8BIDmC1U/XI1BJKhJdUHHotrHJOulJeopEEpV/zNGz5PL5kZUA4aTycn4R?=
 =?us-ascii?Q?7XraMA4d9ZwvMVfY4lWkgqPZJJoI4Z+Onho4y8D+J6/cgCr/hv9YmZdN4UfD?=
 =?us-ascii?Q?E7gLarYaXylr5g4+J8qAKG+INKww+NZJD9AADQtgSvBd0t4nbuIi7hL7aaDI?=
 =?us-ascii?Q?dhdBEM3IE52V6uTMnvu4kJdnUdzOMNiovCQZcJq8qFNZ6Y1ywBzWu9vs521p?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca61bba0-5e77-453c-4699-08da8f255b58
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:59:43.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u25b6ff+sMwQL38BEnyNfBB2PQIWtARdz+RRnWulwc5NaG/IpacRi8DILVJ1qYpS7f3V0XQ+M4pxzwVs0evFEOSPpL/dSGJbob+yMH1NzXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.106;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 disas/nanomips.cpp | 202 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   |  17 ----
 2 files changed, 100 insertions(+), 119 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 37809ff365..1326840611 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -41,102 +41,6 @@
 #define IMGASSERTONCE(test)
 
 
-static int nanomips_dis(char *buf,
-                 unsigned address,
-                 unsigned short one,
-                 unsigned short two,
-                 unsigned short three)
-{
-    std::string disasm;
-    uint16 bits[3] = {one, two, three};
-
-    TABLE_ENTRY_TYPE type;
-    NMD d;
-    int size = d.Disassemble(bits, disasm, type, address);
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
@@ -736,7 +640,7 @@ static std::string ADDRESS(uint64 value, int instruction_size, img_address m_pc)
 }
 
 
-uint64 NMD::extract_op_code_value(const uint16 * data, int size)
+static uint64 extract_op_code_value(const uint16 *data, int size)
 {
     switch (size) {
     case 16:
@@ -762,9 +666,9 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, const Pool *table,
-                     int table_size, img_address m_pc)
+static int Disassemble(const uint16 *data, std::string & dis,
+                       TABLE_ENTRY_TYPE & type, const Pool *table,
+                       int table_size, img_address m_pc)
 {
     try
     {
@@ -22354,8 +22258,102 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, img_address m_pc)
+static int Disassemble(const uint16 *data, std::string & dis,
+                       TABLE_ENTRY_TYPE & type, img_address m_pc)
 {
     return Disassemble(data, dis, type, MAJOR, 2, m_pc);
 }
+
+static int nanomips_dis(char *buf,
+                 unsigned address,
+                 unsigned short one,
+                 unsigned short two,
+                 unsigned short three)
+{
+    std::string disasm;
+    uint16 bits[3] = {one, two, three};
+
+    TABLE_ENTRY_TYPE type;
+    int size = Disassemble(bits, disasm, type, address);
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
index 4cdceb2279..04f57c26ea 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -76,21 +76,4 @@ struct Pool {
     uint64               attributes;
 };
 
-
-class NMD
-{
-public:
-
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, img_address m_pc);
-
-private:
-
-    uint64 extract_op_code_value(const uint16 *data, int size);
-    int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table,
-                    int table_size, img_address m_pc);
-
-};
-
 #endif
-- 
2.25.1


