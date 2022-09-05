Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BDB5ACF78
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:06:36 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV8zz-0007NL-E1
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8rP-00020N-PE
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:57:44 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:42489 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8rN-0001fX-Gl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:57:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKNcxFKDbBok/VQBAgTLseQsXj29ieVdzBkP0CTuOyAYCoWz7bue43sDFZUP7N7aWdfbm+8UsyXcheCbMDjKnggm/IV4XZbHxm1uXf7DlQDj02xh0roWGze2oqofq0tXilAlT7LZUzGqFdB096a8VQ85cKpEWehd+7CoIypnW4m2vFyEFJ9kJNYtA6KPaZ+xzVkle8/FFGX4YSGND6ULncWogdtugA3kALCZsx62O2ywIvGFFF5nTwjgurfGTUwUzbscTl6SG2CcBI7dg8tlGW5Y2AoTUZr8v5EygKa7K3qvepY6Y/zA+3PkBNtDXesPvaobDCGGu34TTN9fNt/uSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UOlUViDAMig3fYNmHsWyfdC6fj/Uaof/j+Jx9s1Oh4=;
 b=eWtKR9lOqYDJzBm5/Yk1gjuLsFEP2mifXUELFP+dzG0GLsVCtid/R+th0ox89CGYCYbuE8HuuQnJWKaIeQ5bP7wyHod16OUPmR8nBch1izuRmiTWujcVcZHwDjQ6BL+dWVM+2mmmX1onbL9ptWYUv96SzpbddcJ6X0ZPyrudgxteyW9EXMuKI8w+jJM/Csv2pcelX1w/TrM2IzY2XTBUCEVi/cRAn22u2sKfXAbHIdKS+oNTR2eVphmZVE8Umm0ksjP8fALPN72I2Bjxm+fA6BhmMpdjbUHwEWLN8pqoJxrZLZuZr1FLUHDGhsrl/xyNAhMc0Rm3XTXYf0/ztpCLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UOlUViDAMig3fYNmHsWyfdC6fj/Uaof/j+Jx9s1Oh4=;
 b=k3Oh/rbSEr+UxZMcQFDYA7KwIXnXOaPfzzjaqv4cy9fGYeUR7ju4HU70TY8ec07jIdyItG4gjbIk//FuQDQAmyiWc0sFTYMb+ZqMbAzdhchd6cl+EkeqU07SfPvRZwq7NbNno6P8wllZrDdv5+rXsT+/isGyKDKqv0W44innK88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PR3PR03MB6444.eurprd03.prod.outlook.com (2603:10a6:102:7f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:57:14 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:57:14 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 02/20] disas/nanomips: Extract enums out of the NMD class
Date: Mon,  5 Sep 2022 11:55:04 +0200
Message-Id: <20220905095522.66941-3-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 33fe48b5-43c7-466c-dddb-08da8f25027b
X-MS-TrafficTypeDiagnostic: PR3PR03MB6444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dh9BNZJVWyy3q2obmxAt9hVWj6Y5t4uF0cCxTwkwYUL8RFK/lQROv3NONbj70Pn5EmqMctSQvo9UOnVff0EWNFO1guxYhGLB2m4daTwVWYQo/iJ8Qd9NPuPs7jnqKH0U6i3zy7VoL2vyJD2Z/OXCmq+xLLk6RxZaTirFeqHncpr/E+WaevF9Rtn4t41+5u3GKw8UwW6Tj+x/iHZTnDPNrT1T5A0U3ZzkNvsNFmJRpoZsLShR+fNXuLva0xIWdhqwxGvsdHxwuS/ibxaDgbnrjBB/YkllbghXSAheKwmsMFY20vdPObRNbyeUZO2X/6+zV8Oji/pOGCk/OryLh6YFq41FdB/cidZYCfr29Uo8BiL9vmwLOc1SUc2S4rQmcMaKfg1UDQ5IjUwBDmuPM7Tkkyhaw7UBUHzyi92mrliH3UpXqOW4RcdK1je4HZWR1/docq1uy5DTtn8Erral97neN4/uVX3srzL7avIxeR7p5P+xR2GWrrzuV8wtKM9mHH1pFWYOI3B+krySFP0IcgVWtCSNIy+Zk5bnxfoeoLnf1/QGTGw8vWhqOUkkT4xg4nqiWlyKCmPfUMgalRHqITLNbUg60PdPOf5KBn3c1QsbsXkSX98UVxQ3YIjtyw7g+1GhnMDmT9PMqvsOQxPJOkIn0SNU/9+glnZYNarDKlF8ixyh6OrYofrz9Wf1t/fY8hF4FfT1xOHkQT9nrthjgDr6BHmFFLlD3L7jAKN8Qb3zo4fQVMjXAw/oPvdjwAwhZcGVY8dscsGBTso4N9rpbi7qXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(136003)(366004)(346002)(396003)(6512007)(6506007)(26005)(52116002)(86362001)(6486002)(478600001)(107886003)(6666004)(41300700001)(2616005)(38100700002)(38350700002)(83380400001)(1076003)(186003)(316002)(2906002)(4326008)(8676002)(66946007)(66556008)(6916009)(66476007)(36756003)(44832011)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9CIpqhVoku2PdEOxpxvdJUP3oXY72bZ5AZQvOJhaDRslpvbKaCPA4iPTUr/N?=
 =?us-ascii?Q?sydd4cJ64jVSep+DIY5pTaOAT/Zq5Fpn7nk4yGDyCkOy/Y20Y8dbMVCwep2y?=
 =?us-ascii?Q?RVD3TmIawQ66iz3GwPkEE5KNc/4Qw4XggGjT/Rh3rwHF0iK51pvrp8lEPqBJ?=
 =?us-ascii?Q?RdlEKDkkACe1LqQA+DOVwvqaZwaC5FwZbQG25HnZ3b2poYM1M+CORGK77K0f?=
 =?us-ascii?Q?r8DR7yc46y0GPmzO5/mOPgKbGMo/pNsnmeeywrSK+aJvvaWltDIX6SNbyqmV?=
 =?us-ascii?Q?URaJHNCZ2HzHg5oQ6Mf0YTSIjmg/GexHRp5+KSBZqRa6xnxvvlG+xWUcMUyb?=
 =?us-ascii?Q?12uqgmQOdjyvp6UNYLQlvbl2N1ZRX10LmhkumIE6WV68mCIdLJ7N8MrAm3Qh?=
 =?us-ascii?Q?uv2VFivk3JUlhwOi986A00mp07+KSKjSTenFn6tzG+V1wx+DsZiSzLWWA0pI?=
 =?us-ascii?Q?X0K0qGIbIo5mAYi6FvlGgzh3o7SRj+v6h6llAaNVdEb46Du1wZRlwi9jZrLA?=
 =?us-ascii?Q?RMg/wiWE/BaIMxm8VwXUnHY4owJzYUyYx5B9NrSzbsLiDz/D/zRFkl5HuFxo?=
 =?us-ascii?Q?THUsaC3tsg+zdWm6hv1yXSHlDkqcyt3tvvu8NgFv83yLp3niNv8h4mUbpoYj?=
 =?us-ascii?Q?0C66X+GTk6VUVN4nr0AXAWrKBZdr4lxRH9mnLIMgH8hGbWtn1/sEZktoafCs?=
 =?us-ascii?Q?IG4+t70adVzJAYdrPkbpnIn6qyiMlocwRI0EsZE1qIdixZ0Da3cqAdhglHVR?=
 =?us-ascii?Q?nJLD3C7Nb2knYz/OhFGJ6jW60BmCzg80IM+PqysbU/YFcmkHE+Yg1nBUAg0L?=
 =?us-ascii?Q?zzBVcWGr+WtaKWnIZmN5m4A1TFQdvws1BhfTQ2UKMaFsJkv6Ky6Q4FQnkXgY?=
 =?us-ascii?Q?vx98Xp+HGJ1NNMrs39Hvi3QjQyh6iUQ1Tl/YkV3RzP9APcHO3gg6udxtbXCV?=
 =?us-ascii?Q?MkakWzOjP2r8EsSopx3Dv3bZIZxPS274gVyog5zHGrPiE4JNIsZWpgel1QHC?=
 =?us-ascii?Q?IT13TooaDzHcTEbNhUc7GZu3AH35RvctjLMaCFKV8PBEjAOHECNRFn5b/U+M?=
 =?us-ascii?Q?zhsy4TIaQfDIRwbf9w/Mq77oyHIx48y/nTu7kxDtl+TnO3+UBFKbY8u4R6Uz?=
 =?us-ascii?Q?/vBKUe/NRe4XYAR70esdzU8cXdWsZi5Iu2mzMxwYPsKGafFLAAmzqmujBorw?=
 =?us-ascii?Q?7y1yQ0U1O2jBM6LPQSF8HVETeZX2aH39oMuo/PAw4AVHhW5qME9A1nrytBOj?=
 =?us-ascii?Q?Ukl7apK/1gIwWN8gOlTpxnUx1vWOrPebIbnXYXQ2ojbOvVRZb8e9akaeleNg?=
 =?us-ascii?Q?JuHQ9oY9NHrRhO1V+c6Z0ebfhiJpeA8QO/UIA0ArG9Nj3MT8zIrMW9KbJFvs?=
 =?us-ascii?Q?FiG5Rtzl3D6MNqEBEVq7mdjeN+3qb0bwwkOqNdJyqxKZFhD8nVU6KdSQf2hC?=
 =?us-ascii?Q?UPv+fU1kUJMmIKKv7VuLuQ1VEiaSARdPT8H5dsFqd5GWthxVMwucSsl6vnHR?=
 =?us-ascii?Q?MVHnV643vKra1uXR/Os4FLdsP56cgIkAXFIYqCm6kxCu6NzNarl4TFPPKBO9?=
 =?us-ascii?Q?SFIdrIoza5Y0vrY2+VKqNmOU9ampO+OV10vN0Y2eLr1p8V05/jkLeWK9P+sp?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fe48b5-43c7-466c-dddb-08da8f25027b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:57:14.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjYWwEVmjAgmChzsEfp/fIqQUQdCyXlAVGUrDnWRS+kjsx+lJ8bEZb+BkfihFpKU8xq3GQVdzktK0NE49On0fM7kwKl1VqliJOK7QARRabs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6444
Received-SPF: pass client-ip=40.107.6.134;
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

Definitions of enums TABLE_ENTRY_TYPE and TABLE_ATTRIBUTE_TYPE are moved
out of the NMD class. The main goal is to remove NMD class completely.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


