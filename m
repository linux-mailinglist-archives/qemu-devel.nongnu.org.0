Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F375B5A30
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:34:50 +0200 (CEST)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXieH-00008A-5N
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiXd-0003Sy-09
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:27:57 -0400
Received: from mail-eopbgr20105.outbound.protection.outlook.com
 ([40.107.2.105]:10471 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiXW-0005aW-9k
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:27:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWLXVO8liavrFaninu1DhH1/S4k+btnc8zhmpDkm/E5JbNBCZtcAq4RIJ/JragJS4qLfr0acC/d+LZsYwlYXndCVcUMP+hA0Mv9PwGd0O2oo5PVBCkwHDj4gx7nQbstkxDo7D7tK6Ws2hXSSkT3bHosMhfQvQUaUx2LF4EW9DXSwa+ChbIoPuCcQX6Z1PIJ2AXZPDUSqyAmIHHp4yxjrptxxv1n0PciwupoWAq73J5A7s1fGWbG69fWORuWSrevQ9L4A1bH1ZDiVer8j7oS5sEn/bInoqo+XUyeLsNu9+BpxFYEHVpNxOTItHqs66NLb3Fmwt3MgzUMf5HNLVr/d/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teVlKC0opfUmewvZ+DRn62F8reYBnETKJw/6Ux32Wtw=;
 b=DqFMQMZ2oyReLEJxZsOCzCWo6Y1sjsBHxWNb9B+R7eJdx3afTG1oNXkBNUKP8LIocVpuBMTczVSmfPRJaPRF4nBKWhfBjkde4WFYqOaSIjXbJgYBWrH7UjYUnqnfJtP8a1m+M98EtWRnnHeuLru/Jj5H/YclBNN/4FY3hJ0bMa2Im64D/U6b4D4auXje9wD0Xw86nmkI0FraaSk7HU+Er2U0Pz8l2iltPdsIp4MYZBAN4+g7I+bW3fX8XkYNuG/t1UGbvZvXdEkbmh3fnB/ppGzexB3Al/5qru+MmQg7Bv5/p4X+HqOuWiDMB20To8y17zSEsTq8DTVhayi9YLKycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teVlKC0opfUmewvZ+DRn62F8reYBnETKJw/6Ux32Wtw=;
 b=W1vmMNxG55nrt4xEyWTQTMOkpuWATuv5EjYQSTKlwfVNWbofuhLYT2DupSsmLdKLJX7g1xF52QHi426gcX7p736RRwQZNaxg5MJRD8wBH5pJ5DfGEdD6+3Er6/4iVPbJjjIQsJnpdXoxUKi3NKjqB5JwximesWd1W2TEXLkxMPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS2PR03MB9768.eurprd03.prod.outlook.com (2603:10a6:20b:60b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:27:46 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:27:46 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 02/24] disas/nanomips: Extract enums out of the NMD class
Date: Mon, 12 Sep 2022 14:26:13 +0200
Message-Id: <20220912122635.74032-3-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS2PR03MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: c369205c-2a5a-46bd-08fd-08da94ba32a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Oz9nisiv9jD0uHPqzcBrwSrRXO2utYDuO5GM/eamNLmDYbOgfvaJF32uiAYEdrZsTtfy+44ahi4YqtFVYb0CspkxdlZdwZdwhbVK6rWpRnR2OycEIb/3svkKxKqwDDKbqITCviF8XYu3XUQkYzR8rWFnT+f568WhTYi5ZMPLR48Kfwh8ef4Ir+N3/Pv3zUMuHf1Q44L1IF8qpEDcr2JXSxWS/YCrrpAIcsCwFEbOgLqeYDBSi9TsjMSeTm6vbb3HTtjDhG/wMU9yPBTIDd9zn7vTb7tMy9Pf8LqEWc7U3F6iOvla2hN0fWfAiWjHFYoAaKmW0wZqKYtzhQ2g700Rdc93IFhgNYYLBNdxG0JKq4tZjMj+xD6nSlqLGZTRGvw5Jh/ZWz9fgNjWsJc9S63WLUH60t/+8agHlXSkeekyA6og+rfk1DSZ/tz4MJRnHGFMWwgK3QYn3cXHi83hWt5cv+sQnj9k+qj35ZLLBmB4k2n4RaUbPFE0mn7Wkhew7eLkJFJp3XXmkYAvqQBcZ78xUfbkaNw08uWyGY8jbWeWQOhIONF2kOkF1d+I0227NZWLS57+IylWsrJQCeFemk3dv5hI8Fs537gGlFyUatIhkivqNgjcJKfndsno62A/TyBqBaLvF1vc5J0ixStnlYRWmgwfhpAIQYQz69G9R106M7P/bJfdHVJs429c2cjansQwVbTi+7+L8rktHSaVq4+VXiwWWI2kXGLt8hEFGR5LvGBMBWsL96q3FT/3D97nNc1kF67NAjh6onvTUFBfeiTNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39840400004)(136003)(346002)(366004)(86362001)(66946007)(8676002)(38100700002)(66556008)(66476007)(4326008)(36756003)(38350700002)(186003)(83380400001)(2616005)(52116002)(6512007)(26005)(478600001)(107886003)(6486002)(41300700001)(6506007)(6666004)(2906002)(6916009)(316002)(1076003)(5660300002)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rrxJYqAlR07bzs1UJoOTBH8Ymo8TzBbr4r7rzgxbKqO8rXzcdHDPkM0zCajW?=
 =?us-ascii?Q?0jmRPLV+12fYp48LFHkDHF8uQufktC0TZNm3sTZ2ebopxXm1S/Oq9h7D0Gc4?=
 =?us-ascii?Q?Qi0xxBV+LVnO+edUJOS3SEkWjRFz8FVS6gopmj1+F8+zJN0lMlH2I4D5StDZ?=
 =?us-ascii?Q?9gS52RsbK4AjOsbCtVuommEDCJnq+GBqqyiqpWq+70Nghl0MidptdNkRY3Aw?=
 =?us-ascii?Q?yzgt5jZvYU9q1Ug8wvWYULQmEpS5OQnfv7eUWj5JDLSbwvVQkmIUKlnmUL5A?=
 =?us-ascii?Q?FbJ9Qii07LAG+hHIc3NxWahwG/Ug/Ooa0yuAiZHCLZ9YdVc29Ikz9yHUXKQr?=
 =?us-ascii?Q?FXfxlhBmFVla1Catpn9FwUdinuIrPJFFCdp4PZPM1LO2excLwur62yyH3ZF1?=
 =?us-ascii?Q?2r6X+aZSp6cdtK8/XV2gUAQ/8alPF/xfhxaAsnmJId4qX8h3s5jEJsvgAeYf?=
 =?us-ascii?Q?x62IKFUY5K1o0il8Ajw5z0CDvkZN+chM/Cc1jzGp7j3CXU7itQZe7U5IQmlN?=
 =?us-ascii?Q?pk8/drn6ggENMt9CrwgKwyPGWIeF6qPRRt29yTSuQJxaEIvf/QyTEPfjvjvE?=
 =?us-ascii?Q?u6YWKlZ+cFwXqH0Ua5FdzOnuW5kB5luZbda3MIRmu2SNsKApvyqRNrmJjHIv?=
 =?us-ascii?Q?zY8NHLd24Yp55Nf7DT/X52YTeOxjFq0goHVw/+H8/JqQ4+jMIWxU0GO+ymqW?=
 =?us-ascii?Q?7sRK95XlP9pr2d1QDNSmWyft5a35hNtJBFeojGx53dFZxACAMsnPEXgHblAe?=
 =?us-ascii?Q?w2mCVzju6ca6XMAho8K1nxpWOV/z3c1t5I1q+iufI8tPc7xvVBM1Xttphff7?=
 =?us-ascii?Q?ZbR79RgNY+HUCtVTNi6dxChH7Ljbp8c/iZeR9A9uxG9tt4oQOZKDW689d8zo?=
 =?us-ascii?Q?pdTQqbTGhiqk2l2TtskxohmdJajXvDlyvkfN8XOvbLxu1FyQ2cY7ZyFMLHDD?=
 =?us-ascii?Q?2t6Loy0kqhed/F4EVMG0PgV4MxUCpoD/l24I/cV+n2TGBoq/aUH81fK9pSXP?=
 =?us-ascii?Q?aXtlYrx5WMcyG7USnWXMgyqw3m58I2KVXuL1GvsaI/Nu555TL3WPJRhWDthD?=
 =?us-ascii?Q?dD8wZGKpinGweVuhwIWfFxMIT99Q+rG5A5/iuQl04gFzx+nLS8CXp8KSQ+Ds?=
 =?us-ascii?Q?8GqFAcz6m1RkOa78pvSACe3dyxyE5yQLleyfvY0IhFC8mqZB6xo8VUxN78pN?=
 =?us-ascii?Q?hxoI0cB9hIwr+bEHumNwYAYaRrdZ3xPTYlBJdIZAtQxi+HEHpfSb3kqz6MxO?=
 =?us-ascii?Q?NqPg21QdrWLcA/Q7wF54Wu4cMOlLk/7q7hNZNAhxNI1wsjX9OSQgaZXVodRG?=
 =?us-ascii?Q?0QqZIwdMmKYzQcXozGHbPPn3xvbjDgn+fNIPpCXW1Tm7A73rWsJ3ptiN1g1w?=
 =?us-ascii?Q?P8u4gBNyac0ZM4O+BJj8kNzgIKKFJUlATa1qyDSF1lYtjiXcR2862yW06sGx?=
 =?us-ascii?Q?nT/lLZNsEtE1k/2WoCZ5RJYpQjhvn5AIzZ997OUn3AwUTyq8tHcdjBpiw53N?=
 =?us-ascii?Q?rMJLYQ6+ggVTwjj4RBcNPtVo0AgR1TsfRhCOorevatInW88Nb5axWq9X47VJ?=
 =?us-ascii?Q?Lyyu2bw0hIyOKVTbWBfwvBNdN5C/GkSfdGCo81aQ4i/G8EM/y3crDlyktCX4?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c369205c-2a5a-46bd-08fd-08da94ba32a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:27:46.2060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JE4xYylV3330urrc73hIszaueiQQ3LKTmLwfKw+DQcODnH2Zfqhzh5kBZAsVsOEXaJ/1m4oC2r//44/zBTV31t/p+arROSUVlCoeoUyFEAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9768
Received-SPF: pass client-ip=40.107.2.105;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp |  8 +++----
 disas/nanomips.h   | 59 +++++++++++++++++++++++-----------------------
 2 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 84529685bf..bdc640b38b 100644
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
@@ -772,7 +772,7 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 
 
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     NMD::TABLE_ENTRY_TYPE & type)
+                     TABLE_ENTRY_TYPE & type)
 {
     return Disassemble(data, dis, type, MAJOR, 2);
 }
@@ -790,7 +790,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
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


