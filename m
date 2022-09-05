Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBC5ACFB6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:13:17 +0200 (CEST)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV96N-0004YP-80
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8sM-000323-Vv
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:43 -0400
Received: from mail-eopbgr80099.outbound.protection.outlook.com
 ([40.107.8.99]:49027 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8sH-0001pX-KI
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:58:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZufICw3+9GGnuZtkXM2oMH9rUj0A8L2D9xRJBzINSck99fVfN38Zx14c7njFRg7JumZkPWYbBBhjSjvsl1Q8ie78BG677NwJ16WjTteOpy4ZUmCuYtm4pv6CAGi5YjhDR0hcikde8brd7aJvwqwZ62CSM6pWYjkedkevAx6jXQCFwRbrFXsD9ijDZfNCIJNvyNCmToqn2foc3QJbQVG+tuvZ5mFqee81kvS2uf8cTQtuvBOzK9ChuTt/N3Py/xmAnSY0c7wmeRM7ZZa5LpSG4WyOmTnsoFOTrpC6pb4A+iKhWlwu3PSDvAT13twvCwTLZnkQp11GS1lvIp7+ZwaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p6VnIs8wdDa/xd94/EAGWnDlYsAl2zjMwgsH3ZLISE=;
 b=AP91/j+YphVdTPwWkhPoz0EgiSaLKKTmFzUrt7QW5Gp16g7Dc9MGSNAz0m6lG59yXxKUwXbW9xfppVhVWK2B+xrTWKBDa6Go+EG/u5H81cuf5sKMZlkzjqPsu/T5UJ/x2lMeRWes/42QOCEOe/cLtjn6SFx05I6HNSc6WWqPnJejpLnnYc3dVpAuuEMIL6+c3162u4WNQBVHuotCo1D4EUvDc+T3eiWY6FmemWUfv7Em/a4/ZafkNNotsswwJj5DILFJgJdd4/S1M4tKmV8M6Phihd+DFaU9noPMftza5AwweJKaGcXJ3vjb75dvw1g3vl93yqk8dgl35ySLU7a8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6VnIs8wdDa/xd94/EAGWnDlYsAl2zjMwgsH3ZLISE=;
 b=VOtQyR2pF/Er9P4bTBA46zgcd24XlB76g249uiqnt6nMTjqDqnOKchYcQl6rnMCuQbuNvOtzGflYTHKev/6rzUQ9iv0tWPrlYbV7qfz+P098d3tQkcBvQllIqvy2xW0DYQetfVHc0HoAnjc9KZJltNFnQSPW8itT5JVsH9TFaMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PR3PR03MB6444.eurprd03.prod.outlook.com (2603:10a6:102:7f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 09:57:25 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:57:25 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 03/20] disas/nanomips: Delete NMD class fields
Date: Mon,  5 Sep 2022 11:55:05 +0200
Message-Id: <20220905095522.66941-4-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: df04cabf-57fa-4191-823b-08da8f25082c
X-MS-TrafficTypeDiagnostic: PR3PR03MB6444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWDepKElGVWWAzkv6LkZk453w19Kj81WOKhK/en4MoVNgmG7phgyeNG55fH5S97cVaNUgcXauUu+Yskj69h/OxrTIiP+VntwfGWDBlK32TtBsn6YpguJN3SkonXhOW1JR0UcfBmdnP6sbNOqbOX8cwQKhod9XM8zWg5fpU68g4jK0VuWjWZQyBX5vMQnSY8PsbI/Nvcsq/WHAz4l9moWC3yTyAwO9NrhqT/bRehBkngaurGh5r0R74lNAypj/O0DbgaIuh4d2u6GtVtQsV0lfWbQQkir0AxWJGH3h1QTWqFKhaTNvqP8FqHaUscYm+0bR5q4HiVe3baJsgHCErXxk6dKSjc2iohAo9jtthynaNW3lLBqWtXVH9fSxRp+zzp4USagl9yheu6KLdxMhRmvtVI7jDkKXEE75LCVJvFl6+JmWGKhH3WzwVijuR9q0hGK+GXDr8IPdX1nwznZLwSZ4regT7aA54U9uLU+hNTl5/m9MzvcjXej1B1f/XPgWi4bJmkOYk0ZZennHj47clLcUMbu2rw9SxQxflh6nxozVeFAo7aSUAH0qIe6Gv5BQPymU5B3ohGwmopUhodVwQ+xE97eCS2qLMgab4+76ZSlxyaK1MSLRBoCSyaR4RFJ30v6ABlYR8x4rwudgzVY1BciiekVyED+AO8/iXjCOOY1KTRcGJ9kq8xjqA/G+43klw+IG1EEB8RHts64oQxRln235KwfsdDpCeU+e4UMuaK3D9YAsEJYJjJXdbR22Z+W7XHDlLZIOkfci84Rfxsia9QvvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(136003)(366004)(346002)(396003)(6512007)(6506007)(26005)(52116002)(86362001)(6486002)(478600001)(107886003)(6666004)(41300700001)(2616005)(38100700002)(38350700002)(83380400001)(1076003)(186003)(316002)(2906002)(4326008)(8676002)(66946007)(66556008)(6916009)(66476007)(36756003)(30864003)(44832011)(8936002)(5660300002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8qloEn+NUzZqSO09ukTQ3ji3Z2ITlHriFMDvdsh0TuA9s24cxy3Ng9EaMbP?=
 =?us-ascii?Q?gL6/pNKL/e7CcxqsSVd0xwik/1mkUJQRnnd7Y4aIL7zxBx52s0rjQzWC6kP/?=
 =?us-ascii?Q?Jzou+m+YjOUGe4QIYaQRS5gcshOL3WnjRrzLAx8WoICvrf/LMge+VD5qYgto?=
 =?us-ascii?Q?cWQI5cEN7vDa3DEKv4l0jnB8XMdqE0xaTHy3JL3WuTa52Q0WpT4qYAUvkmKh?=
 =?us-ascii?Q?wDLXLHLYfreVr4lScBrsFC82Ya+tOliG6sV/kFHdpiAnzEVb2/jBWYlZj20i?=
 =?us-ascii?Q?8Iy0QqGrmJ+dS5mXRkdR3+hxeZF1zwwfjvKTdLWDenI5h4N1lMYIMWMWW2Mc?=
 =?us-ascii?Q?BBE9Ka3Ocyzsg13+lw6uh6dcsTj3pQeN3Q0OdYtMZ6OKzKh/Dy1/ePGZVgaZ?=
 =?us-ascii?Q?F0DmBqaL0Ne2MKoezttRQuSX0+LKYrVVQrv/pPjP58ZT/MRZjyPM7hMPFhpM?=
 =?us-ascii?Q?kU8aDByrflB0usFVAK5I5qyHDnyGWr76PHlIMYDgU2nbgrEjs/O0V5AAi8TU?=
 =?us-ascii?Q?p+ohW63bEUwVMNBSMKIOBOnrD4tCNbEG5vVp1oaK464QFniCypFUf8cbgMCL?=
 =?us-ascii?Q?hm3TPLcC5Dv0PwyekJhLERJF8anw4v3Pi5vzjmKR+/p5EV5ItBgsu2eiJX8B?=
 =?us-ascii?Q?N/1PxLSP/sdgwjMyh52EJIB72XITOZfcK+bkSZ2lz7+u93q7KopRwAcatwyh?=
 =?us-ascii?Q?GSBqksoSOq3zDo+2IPrBi0KqX/CwwNO2HNSasdmXhA1Fjrmbxzph/l+4u/Td?=
 =?us-ascii?Q?zFc5xSFBkeH1K7Jz1JN2Z44Q5DiToq5Hp9/CBQgoO7UciASmParvk+pWoz0E?=
 =?us-ascii?Q?arZ4cwoYfHxRmO/VWt7To8/pP0doXcysOmTKYv1WgWXeDbzBtc9BQ+nGHGCr?=
 =?us-ascii?Q?Lh9r660iRVhza63nJ+d8DtqTuoHjUcM4iFrAG0k1cBK84l/sZI1XNU7wL7Gi?=
 =?us-ascii?Q?GW/4sDSYTD/cAf4lLA6nBnT+3L+GDAI0B8EGdAIMwQym6Ph1M2GRKggY+kPp?=
 =?us-ascii?Q?ci4m56Rt5VCIrj/BdDY8tmwGn/S84OVZooKx4ZcAs2D+7xiBVV1F47mJBbW5?=
 =?us-ascii?Q?CZvxpLgG/cXf3hc9AB6ixSV8+bUEJCD24VcHBouTdn8EsTz3eJtUFnYLKm/g?=
 =?us-ascii?Q?bBYw0DN2LwF4pdvFcy983MZsobMdaZ3Umq44zXDGjzJdj555Pr19MdX4E6U1?=
 =?us-ascii?Q?q4pb5Y+UiML9twCpyHunMnlVR4R5zQGfFTCcjKTUIlzomj9WpDB4MFKZTIlp?=
 =?us-ascii?Q?pyrPrFIVBGSJ3BqHPA3Zp+8CkTo2aVP+6bU9Y6OSZfMUx2XxnrpQ2kiJRrin?=
 =?us-ascii?Q?lpOFbbMT0cj0Ba+GDQC+wdjY729VlSXIyjp7HKMYc1k9hsnupOZp/jM+8pgY?=
 =?us-ascii?Q?RVD5LMKScUkuz+cJ53GB+bns4us6MXdBBS0FziMEjBPFeXnuqlWMqqIsQkyF?=
 =?us-ascii?Q?pyZkh5eDCq+YfqWpEutX+Mg/RJA5A8KWWqDKn5qmC+gODeHI8uZRPRE7xm1W?=
 =?us-ascii?Q?+Io+WZw/jpd4AbKRhqcFw08C0DmAOGq3KFrps8+8/+qI9aPdsClMp3D0dapn?=
 =?us-ascii?Q?imYCQmuJgGPJLzT4p7XBtH9osk/YjsoysmcMsQRFB4P/gV6Wcq4A2WpyTasV?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df04cabf-57fa-4191-823b-08da8f25082c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:57:25.4104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIjGzum87ld+JgvtetyGkgkEIjYTHRjmPmTtfQG5nnu/EGOgZnhtLatzfoZfi3jaXC1tvt1lm8BCCoiqLVqqeUq9M4ZQZJZG3wEG8VGP/D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6444
Received-SPF: pass client-ip=40.107.8.99;
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

Two class fields have been deleted.

Since the m_requested_instruction_categories field always has the same
value, which is ALL_ATTRIBUTES, the only use of that field has been
replaced with the concrete ALL_ATTRIBUTES value.

The second class field m_pc is added as a parameter where needed.
Therefore, prototypes of the following functions have been changed:
- public NMD::Disassemble method
- private NMD::Disassemble method
- NMD::ADDRESS method
- all of the disassembly_function methods

Accordingly, the disassembly_function typedef has been changed.

There is no more need for a constructor, so the NMD constructor has been
deleted. The main goal is to remove NMD class completely.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 1361 ++++++++++++++++++++++----------------------
 disas/nanomips.h   | 1291 +++++++++++++++++++++--------------------
 2 files changed, 1322 insertions(+), 1330 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index bdc640b38b..49cdf23dbc 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -51,8 +51,8 @@ int nanomips_dis(char *buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    NMD d(address, ALL_ATTRIBUTES);
-    int size = d.Disassemble(bits, disasm, type);
+    NMD d;
+    int size = d.Disassemble(bits, disasm, type, address);
 
     strcpy(buf, disasm.c_str());
     return size;
@@ -747,7 +747,7 @@ std::string NMD::CPR(uint64 reg)
 }
 
 
-std::string NMD::ADDRESS(uint64 value, int instruction_size)
+std::string NMD::ADDRESS(uint64 value, int instruction_size, img_address m_pc)
 {
     /* token for string replace */
     img_address address = m_pc + value + instruction_size;
@@ -772,9 +772,9 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 
 
 int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type)
+                     TABLE_ENTRY_TYPE & type, img_address m_pc)
 {
-    return Disassemble(data, dis, type, MAJOR, 2);
+    return Disassemble(data, dis, type, MAJOR, 2, m_pc);
 }
 
 
@@ -791,7 +791,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
  */
 int NMD::Disassemble(const uint16 * data, std::string & dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
-                     int table_size)
+                     int table_size, img_address m_pc)
 {
     try
     {
@@ -807,14 +807,13 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                         if (table[i].type == pool) {
                             return Disassemble(data, dis, type,
                                                table[i].next_table,
-                                               table[i].next_table_size);
+                                               table[i].next_table_size, m_pc);
                         } else if ((table[i].type == instruction) ||
                                    (table[i].type == call_instruction) ||
                                    (table[i].type == branch_instruction) ||
                                    (table[i].type == return_instruction)) {
                             if ((table[i].attributes != 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) == 0) {
+                                (ALL_ATTRIBUTES & table[i].attributes) == 0) {
                                 /*
                                  * failed due to instruction having
                                  * an ASE attribute and the requested version
@@ -829,7 +828,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = (this->*dis_fn)(op_code);
+                            dis = (this->*dis_fn)(op_code, m_pc);
                             return table[i].instructions_size;
                         } else {
                             dis = "reserved instruction";
@@ -1784,7 +1783,7 @@ bool NMD::SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ABS_D(uint64 instruction)
+std::string NMD::ABS_D(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1806,7 +1805,7 @@ std::string NMD::ABS_D(uint64 instruction)
  *               fd -----
  *                    fs -----
  */
-std::string NMD::ABS_S(uint64 instruction)
+std::string NMD::ABS_S(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1828,7 +1827,7 @@ std::string NMD::ABS_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_PH(uint64 instruction)
+std::string NMD::ABSQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1850,7 +1849,7 @@ std::string NMD::ABSQ_S_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_QB(uint64 instruction)
+std::string NMD::ABSQ_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1872,7 +1871,7 @@ std::string NMD::ABSQ_S_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ABSQ_S_W(uint64 instruction)
+std::string NMD::ABSQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1893,7 +1892,7 @@ std::string NMD::ABSQ_S_W(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ACLR(uint64 instruction)
+std::string NMD::ACLR(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1916,7 +1915,7 @@ std::string NMD::ACLR(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADD(uint64 instruction)
+std::string NMD::ADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -1941,7 +1940,7 @@ std::string NMD::ADD(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_D(uint64 instruction)
+std::string NMD::ADD_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1966,7 +1965,7 @@ std::string NMD::ADD_D(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-std::string NMD::ADD_S(uint64 instruction)
+std::string NMD::ADD_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -1989,7 +1988,7 @@ std::string NMD::ADD_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_32_(uint64 instruction)
+std::string NMD::ADDIU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2012,7 +2011,7 @@ std::string NMD::ADDIU_32_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_48_(uint64 instruction)
+std::string NMD::ADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2033,7 +2032,7 @@ std::string NMD::ADDIU_48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP48_(uint64 instruction)
+std::string NMD::ADDIU_GP48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -2054,7 +2053,7 @@ std::string NMD::ADDIU_GP48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_B_(uint64 instruction)
+std::string NMD::ADDIU_GP_B_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -2075,7 +2074,7 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_GP_W_(uint64 instruction)
+std::string NMD::ADDIU_GP_W_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -2096,7 +2095,7 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_NEG_(uint64 instruction)
+std::string NMD::ADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2119,7 +2118,7 @@ std::string NMD::ADDIU_NEG_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R1_SP_(uint64 instruction)
+std::string NMD::ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
@@ -2140,7 +2139,7 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::ADDIU_R2_(uint64 instruction)
+std::string NMD::ADDIU_R2_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2162,7 +2161,7 @@ std::string NMD::ADDIU_R2_(uint64 instruction)
  *     rt -----
  *           s - ---
  */
-std::string NMD::ADDIU_RS5_(uint64 instruction)
+std::string NMD::ADDIU_RS5_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
@@ -2184,13 +2183,13 @@ std::string NMD::ADDIU_RS5_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_32_(uint64 instruction)
+std::string NMD::ADDIUPC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2206,13 +2205,13 @@ std::string NMD::ADDIUPC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDIUPC_48_(uint64 instruction)
+std::string NMD::ADDIUPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2228,7 +2227,7 @@ std::string NMD::ADDIUPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_PH(uint64 instruction)
+std::string NMD::ADDQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2253,7 +2252,7 @@ std::string NMD::ADDQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_PH(uint64 instruction)
+std::string NMD::ADDQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2277,7 +2276,7 @@ std::string NMD::ADDQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQ_S_W(uint64 instruction)
+std::string NMD::ADDQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2302,7 +2301,7 @@ std::string NMD::ADDQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_PH(uint64 instruction)
+std::string NMD::ADDQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2327,7 +2326,7 @@ std::string NMD::ADDQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_PH(uint64 instruction)
+std::string NMD::ADDQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2352,7 +2351,7 @@ std::string NMD::ADDQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_R_W(uint64 instruction)
+std::string NMD::ADDQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2377,7 +2376,7 @@ std::string NMD::ADDQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDQH_W(uint64 instruction)
+std::string NMD::ADDQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2401,7 +2400,7 @@ std::string NMD::ADDQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDSC(uint64 instruction)
+std::string NMD::ADDSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2424,7 +2423,7 @@ std::string NMD::ADDSC(uint64 instruction)
  *       rs3 ---
  *          rd3 ---
  */
-std::string NMD::ADDU_16_(uint64 instruction)
+std::string NMD::ADDU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2448,7 +2447,7 @@ std::string NMD::ADDU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_32_(uint64 instruction)
+std::string NMD::ADDU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2472,7 +2471,7 @@ std::string NMD::ADDU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_4X4_(uint64 instruction)
+std::string NMD::ADDU_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -2494,7 +2493,7 @@ std::string NMD::ADDU_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_PH(uint64 instruction)
+std::string NMD::ADDU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2518,7 +2517,7 @@ std::string NMD::ADDU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_QB(uint64 instruction)
+std::string NMD::ADDU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2543,7 +2542,7 @@ std::string NMD::ADDU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_PH(uint64 instruction)
+std::string NMD::ADDU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2567,7 +2566,7 @@ std::string NMD::ADDU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDU_S_QB(uint64 instruction)
+std::string NMD::ADDU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2592,7 +2591,7 @@ std::string NMD::ADDU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_QB(uint64 instruction)
+std::string NMD::ADDUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2617,7 +2616,7 @@ std::string NMD::ADDUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDUH_R_QB(uint64 instruction)
+std::string NMD::ADDUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2640,7 +2639,7 @@ std::string NMD::ADDUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ADDWC(uint64 instruction)
+std::string NMD::ADDWC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2664,13 +2663,13 @@ std::string NMD::ADDWC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ALUIPC(uint64 instruction)
+std::string NMD::ALUIPC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2685,7 +2684,7 @@ std::string NMD::ALUIPC(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::AND_16_(uint64 instruction)
+std::string NMD::AND_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2707,7 +2706,7 @@ std::string NMD::AND_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::AND_32_(uint64 instruction)
+std::string NMD::AND_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2730,7 +2729,7 @@ std::string NMD::AND_32_(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-std::string NMD::ANDI_16_(uint64 instruction)
+std::string NMD::ANDI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -2754,7 +2753,7 @@ std::string NMD::ANDI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ANDI_32_(uint64 instruction)
+std::string NMD::ANDI_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2778,7 +2777,7 @@ std::string NMD::ANDI_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::APPEND(uint64 instruction)
+std::string NMD::APPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2802,7 +2801,7 @@ std::string NMD::APPEND(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ASET(uint64 instruction)
+std::string NMD::ASET(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2826,11 +2825,11 @@ std::string NMD::ASET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_16_(uint64 instruction)
+std::string NMD::BALC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2846,11 +2845,11 @@ std::string NMD::BALC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALC_32_(uint64 instruction)
+std::string NMD::BALC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2866,7 +2865,7 @@ std::string NMD::BALC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BALRSC(uint64 instruction)
+std::string NMD::BALRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -2888,7 +2887,7 @@ std::string NMD::BALRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBEQZC(uint64 instruction)
+std::string NMD::BBEQZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2896,7 +2895,7 @@ std::string NMD::BBEQZC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2912,7 +2911,7 @@ std::string NMD::BBEQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BBNEZC(uint64 instruction)
+std::string NMD::BBNEZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
@@ -2920,7 +2919,7 @@ std::string NMD::BBNEZC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2936,11 +2935,11 @@ std::string NMD::BBNEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_16_(uint64 instruction)
+std::string NMD::BC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2956,11 +2955,11 @@ std::string NMD::BC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC_32_(uint64 instruction)
+std::string NMD::BC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2976,13 +2975,13 @@ std::string NMD::BC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1EQZC(uint64 instruction)
+std::string NMD::BC1EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2998,13 +2997,13 @@ std::string NMD::BC1EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC1NEZC(uint64 instruction)
+std::string NMD::BC1NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -3020,13 +3019,13 @@ std::string NMD::BC1NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2EQZC(uint64 instruction)
+std::string NMD::BC2EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -3042,13 +3041,13 @@ std::string NMD::BC2EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BC2NEZC(uint64 instruction)
+std::string NMD::BC2NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
     std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -3064,7 +3063,7 @@ std::string NMD::BC2NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_16_(uint64 instruction)
+std::string NMD::BEQC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3072,7 +3071,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    std::string u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -3088,7 +3087,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQC_32_(uint64 instruction)
+std::string NMD::BEQC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3096,7 +3095,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -3112,7 +3111,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQIC(uint64 instruction)
+std::string NMD::BEQIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3120,7 +3119,7 @@ std::string NMD::BEQIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3136,13 +3135,13 @@ std::string NMD::BEQIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BEQZC_16_(uint64 instruction)
+std::string NMD::BEQZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3158,7 +3157,7 @@ std::string NMD::BEQZC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEC(uint64 instruction)
+std::string NMD::BGEC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3166,7 +3165,7 @@ std::string NMD::BGEC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3182,7 +3181,7 @@ std::string NMD::BGEC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIC(uint64 instruction)
+std::string NMD::BGEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3190,7 +3189,7 @@ std::string NMD::BGEIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3206,7 +3205,7 @@ std::string NMD::BGEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEIUC(uint64 instruction)
+std::string NMD::BGEIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3214,7 +3213,7 @@ std::string NMD::BGEIUC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3230,7 +3229,7 @@ std::string NMD::BGEIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BGEUC(uint64 instruction)
+std::string NMD::BGEUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3238,7 +3237,7 @@ std::string NMD::BGEUC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3254,7 +3253,7 @@ std::string NMD::BGEUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTC(uint64 instruction)
+std::string NMD::BLTC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3262,7 +3261,7 @@ std::string NMD::BLTC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3278,7 +3277,7 @@ std::string NMD::BLTC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIC(uint64 instruction)
+std::string NMD::BLTIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3286,7 +3285,7 @@ std::string NMD::BLTIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3302,7 +3301,7 @@ std::string NMD::BLTIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTIUC(uint64 instruction)
+std::string NMD::BLTIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3310,7 +3309,7 @@ std::string NMD::BLTIUC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3326,7 +3325,7 @@ std::string NMD::BLTIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BLTUC(uint64 instruction)
+std::string NMD::BLTUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3334,7 +3333,7 @@ std::string NMD::BLTUC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3350,7 +3349,7 @@ std::string NMD::BLTUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_16_(uint64 instruction)
+std::string NMD::BNEC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -3358,7 +3357,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
 
     std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    std::string u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3374,7 +3373,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEC_32_(uint64 instruction)
+std::string NMD::BNEC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3382,7 +3381,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3398,7 +3397,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEIC(uint64 instruction)
+std::string NMD::BNEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
@@ -3406,7 +3405,7 @@ std::string NMD::BNEIC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3422,13 +3421,13 @@ std::string NMD::BNEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BNEZC_16_(uint64 instruction)
+std::string NMD::BNEZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3444,11 +3443,11 @@ std::string NMD::BNEZC_16_(uint64 instruction)
  *            s[13:1] -------------
  *                           s[14] -
  */
-std::string NMD::BPOSGE32C(uint64 instruction)
+std::string NMD::BPOSGE32C(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3464,7 +3463,7 @@ std::string NMD::BPOSGE32C(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_16_(uint64 instruction)
+std::string NMD::BREAK_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -3484,7 +3483,7 @@ std::string NMD::BREAK_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BREAK_32_(uint64 instruction)
+std::string NMD::BREAK_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -3504,7 +3503,7 @@ std::string NMD::BREAK_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::BRSC(uint64 instruction)
+std::string NMD::BRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
@@ -3524,7 +3523,7 @@ std::string NMD::BRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHE(uint64 instruction)
+std::string NMD::CACHE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3548,7 +3547,7 @@ std::string NMD::CACHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CACHEE(uint64 instruction)
+std::string NMD::CACHEE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3572,7 +3571,7 @@ std::string NMD::CACHEE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_D(uint64 instruction)
+std::string NMD::CEIL_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3594,7 +3593,7 @@ std::string NMD::CEIL_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_L_S(uint64 instruction)
+std::string NMD::CEIL_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3616,7 +3615,7 @@ std::string NMD::CEIL_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_D(uint64 instruction)
+std::string NMD::CEIL_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3638,7 +3637,7 @@ std::string NMD::CEIL_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CEIL_W_S(uint64 instruction)
+std::string NMD::CEIL_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3660,7 +3659,7 @@ std::string NMD::CEIL_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC1(uint64 instruction)
+std::string NMD::CFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3682,7 +3681,7 @@ std::string NMD::CFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CFC2(uint64 instruction)
+std::string NMD::CFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -3704,7 +3703,7 @@ std::string NMD::CFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_D(uint64 instruction)
+std::string NMD::CLASS_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3726,7 +3725,7 @@ std::string NMD::CLASS_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLASS_S(uint64 instruction)
+std::string NMD::CLASS_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3748,7 +3747,7 @@ std::string NMD::CLASS_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLO(uint64 instruction)
+std::string NMD::CLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3770,7 +3769,7 @@ std::string NMD::CLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CLZ(uint64 instruction)
+std::string NMD::CLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3792,7 +3791,7 @@ std::string NMD::CLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_D(uint64 instruction)
+std::string NMD::CMP_AF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3816,7 +3815,7 @@ std::string NMD::CMP_AF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_AF_S(uint64 instruction)
+std::string NMD::CMP_AF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3840,7 +3839,7 @@ std::string NMD::CMP_AF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_D(uint64 instruction)
+std::string NMD::CMP_EQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3863,7 +3862,7 @@ std::string NMD::CMP_EQ_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_EQ_PH(uint64 instruction)
+std::string NMD::CMP_EQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3885,7 +3884,7 @@ std::string NMD::CMP_EQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_EQ_S(uint64 instruction)
+std::string NMD::CMP_EQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3909,7 +3908,7 @@ std::string NMD::CMP_EQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_D(uint64 instruction)
+std::string NMD::CMP_LE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3932,7 +3931,7 @@ std::string NMD::CMP_LE_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LE_PH(uint64 instruction)
+std::string NMD::CMP_LE_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -3954,7 +3953,7 @@ std::string NMD::CMP_LE_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LE_S(uint64 instruction)
+std::string NMD::CMP_LE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -3978,7 +3977,7 @@ std::string NMD::CMP_LE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_D(uint64 instruction)
+std::string NMD::CMP_LT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4001,7 +4000,7 @@ std::string NMD::CMP_LT_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMP_LT_PH(uint64 instruction)
+std::string NMD::CMP_LT_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4023,7 +4022,7 @@ std::string NMD::CMP_LT_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_LT_S(uint64 instruction)
+std::string NMD::CMP_LT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4047,7 +4046,7 @@ std::string NMD::CMP_LT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_D(uint64 instruction)
+std::string NMD::CMP_NE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4071,7 +4070,7 @@ std::string NMD::CMP_NE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_NE_S(uint64 instruction)
+std::string NMD::CMP_NE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4095,7 +4094,7 @@ std::string NMD::CMP_NE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_D(uint64 instruction)
+std::string NMD::CMP_OR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4119,7 +4118,7 @@ std::string NMD::CMP_OR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_OR_S(uint64 instruction)
+std::string NMD::CMP_OR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4143,7 +4142,7 @@ std::string NMD::CMP_OR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_D(uint64 instruction)
+std::string NMD::CMP_SAF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4167,7 +4166,7 @@ std::string NMD::CMP_SAF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SAF_S(uint64 instruction)
+std::string NMD::CMP_SAF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4191,7 +4190,7 @@ std::string NMD::CMP_SAF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_D(uint64 instruction)
+std::string NMD::CMP_SEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4215,7 +4214,7 @@ std::string NMD::CMP_SEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SEQ_S(uint64 instruction)
+std::string NMD::CMP_SEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4239,7 +4238,7 @@ std::string NMD::CMP_SEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_D(uint64 instruction)
+std::string NMD::CMP_SLE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4263,7 +4262,7 @@ std::string NMD::CMP_SLE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLE_S(uint64 instruction)
+std::string NMD::CMP_SLE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4287,7 +4286,7 @@ std::string NMD::CMP_SLE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_D(uint64 instruction)
+std::string NMD::CMP_SLT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4311,7 +4310,7 @@ std::string NMD::CMP_SLT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SLT_S(uint64 instruction)
+std::string NMD::CMP_SLT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4335,7 +4334,7 @@ std::string NMD::CMP_SLT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_D(uint64 instruction)
+std::string NMD::CMP_SNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4359,7 +4358,7 @@ std::string NMD::CMP_SNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SNE_S(uint64 instruction)
+std::string NMD::CMP_SNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4383,7 +4382,7 @@ std::string NMD::CMP_SNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_D(uint64 instruction)
+std::string NMD::CMP_SOR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4407,7 +4406,7 @@ std::string NMD::CMP_SOR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SOR_S(uint64 instruction)
+std::string NMD::CMP_SOR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4431,7 +4430,7 @@ std::string NMD::CMP_SOR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_D(uint64 instruction)
+std::string NMD::CMP_SUEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4455,7 +4454,7 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUEQ_S(uint64 instruction)
+std::string NMD::CMP_SUEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4479,7 +4478,7 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_D(uint64 instruction)
+std::string NMD::CMP_SULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4503,7 +4502,7 @@ std::string NMD::CMP_SULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULE_S(uint64 instruction)
+std::string NMD::CMP_SULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4527,7 +4526,7 @@ std::string NMD::CMP_SULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_D(uint64 instruction)
+std::string NMD::CMP_SULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4551,7 +4550,7 @@ std::string NMD::CMP_SULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SULT_S(uint64 instruction)
+std::string NMD::CMP_SULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4575,7 +4574,7 @@ std::string NMD::CMP_SULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_D(uint64 instruction)
+std::string NMD::CMP_SUN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4599,7 +4598,7 @@ std::string NMD::CMP_SUN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_D(uint64 instruction)
+std::string NMD::CMP_SUNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4623,7 +4622,7 @@ std::string NMD::CMP_SUNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUNE_S(uint64 instruction)
+std::string NMD::CMP_SUNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4647,7 +4646,7 @@ std::string NMD::CMP_SUNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_SUN_S(uint64 instruction)
+std::string NMD::CMP_SUN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4671,7 +4670,7 @@ std::string NMD::CMP_SUN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_D(uint64 instruction)
+std::string NMD::CMP_UEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4695,7 +4694,7 @@ std::string NMD::CMP_UEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UEQ_S(uint64 instruction)
+std::string NMD::CMP_UEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4719,7 +4718,7 @@ std::string NMD::CMP_UEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_D(uint64 instruction)
+std::string NMD::CMP_ULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4743,7 +4742,7 @@ std::string NMD::CMP_ULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULE_S(uint64 instruction)
+std::string NMD::CMP_ULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4767,7 +4766,7 @@ std::string NMD::CMP_ULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_D(uint64 instruction)
+std::string NMD::CMP_ULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4791,7 +4790,7 @@ std::string NMD::CMP_ULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_ULT_S(uint64 instruction)
+std::string NMD::CMP_ULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4815,7 +4814,7 @@ std::string NMD::CMP_ULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_D(uint64 instruction)
+std::string NMD::CMP_UN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4839,7 +4838,7 @@ std::string NMD::CMP_UN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_D(uint64 instruction)
+std::string NMD::CMP_UNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4863,7 +4862,7 @@ std::string NMD::CMP_UNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UNE_S(uint64 instruction)
+std::string NMD::CMP_UNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4887,7 +4886,7 @@ std::string NMD::CMP_UNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMP_UN_S(uint64 instruction)
+std::string NMD::CMP_UN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -4912,7 +4911,7 @@ std::string NMD::CMP_UN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
+std::string NMD::CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4937,7 +4936,7 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LE_QB(uint64 instruction)
+std::string NMD::CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4962,7 +4961,7 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGDU_LT_QB(uint64 instruction)
+std::string NMD::CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -4987,7 +4986,7 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_EQ_QB(uint64 instruction)
+std::string NMD::CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5012,7 +5011,7 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LE_QB(uint64 instruction)
+std::string NMD::CMPGU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5037,7 +5036,7 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CMPGU_LT_QB(uint64 instruction)
+std::string NMD::CMPGU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5061,7 +5060,7 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_EQ_QB(uint64 instruction)
+std::string NMD::CMPU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5083,7 +5082,7 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LE_QB(uint64 instruction)
+std::string NMD::CMPU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5105,7 +5104,7 @@ std::string NMD::CMPU_LE_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::CMPU_LT_QB(uint64 instruction)
+std::string NMD::CMPU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5127,7 +5126,7 @@ std::string NMD::CMPU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::COP2_1(uint64 instruction)
+std::string NMD::COP2_1(uint64 instruction, img_address m_pc)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
@@ -5147,7 +5146,7 @@ std::string NMD::COP2_1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC1(uint64 instruction)
+std::string NMD::CTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5169,7 +5168,7 @@ std::string NMD::CTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CTC2(uint64 instruction)
+std::string NMD::CTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -5191,7 +5190,7 @@ std::string NMD::CTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_L(uint64 instruction)
+std::string NMD::CVT_D_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5213,7 +5212,7 @@ std::string NMD::CVT_D_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_S(uint64 instruction)
+std::string NMD::CVT_D_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5235,7 +5234,7 @@ std::string NMD::CVT_D_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_D_W(uint64 instruction)
+std::string NMD::CVT_D_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5257,7 +5256,7 @@ std::string NMD::CVT_D_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_D(uint64 instruction)
+std::string NMD::CVT_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5279,7 +5278,7 @@ std::string NMD::CVT_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_L_S(uint64 instruction)
+std::string NMD::CVT_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5301,7 +5300,7 @@ std::string NMD::CVT_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_D(uint64 instruction)
+std::string NMD::CVT_S_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5323,7 +5322,7 @@ std::string NMD::CVT_S_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_L(uint64 instruction)
+std::string NMD::CVT_S_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5345,7 +5344,7 @@ std::string NMD::CVT_S_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PL(uint64 instruction)
+std::string NMD::CVT_S_PL(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5367,7 +5366,7 @@ std::string NMD::CVT_S_PL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_PU(uint64 instruction)
+std::string NMD::CVT_S_PU(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5389,7 +5388,7 @@ std::string NMD::CVT_S_PU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_S_W(uint64 instruction)
+std::string NMD::CVT_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5411,7 +5410,7 @@ std::string NMD::CVT_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_D(uint64 instruction)
+std::string NMD::CVT_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5433,7 +5432,7 @@ std::string NMD::CVT_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::CVT_W_S(uint64 instruction)
+std::string NMD::CVT_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5455,7 +5454,7 @@ std::string NMD::CVT_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_48_(uint64 instruction)
+std::string NMD::DADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -5477,7 +5476,7 @@ std::string NMD::DADDIU_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_NEG_(uint64 instruction)
+std::string NMD::DADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5501,7 +5500,7 @@ std::string NMD::DADDIU_NEG_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDIU_U12_(uint64 instruction)
+std::string NMD::DADDIU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5525,7 +5524,7 @@ std::string NMD::DADDIU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADD(uint64 instruction)
+std::string NMD::DADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5549,7 +5548,7 @@ std::string NMD::DADD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DADDU(uint64 instruction)
+std::string NMD::DADDU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5573,7 +5572,7 @@ std::string NMD::DADDU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLO(uint64 instruction)
+std::string NMD::DCLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5595,7 +5594,7 @@ std::string NMD::DCLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DCLZ(uint64 instruction)
+std::string NMD::DCLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5617,7 +5616,7 @@ std::string NMD::DCLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIV(uint64 instruction)
+std::string NMD::DDIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5641,7 +5640,7 @@ std::string NMD::DDIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DDIVU(uint64 instruction)
+std::string NMD::DDIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5665,7 +5664,7 @@ std::string NMD::DDIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DERET(uint64 instruction)
+std::string NMD::DERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -5683,7 +5682,7 @@ std::string NMD::DERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTM(uint64 instruction)
+std::string NMD::DEXTM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5709,7 +5708,7 @@ std::string NMD::DEXTM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXT(uint64 instruction)
+std::string NMD::DEXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5735,7 +5734,7 @@ std::string NMD::DEXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DEXTU(uint64 instruction)
+std::string NMD::DEXTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5761,7 +5760,7 @@ std::string NMD::DEXTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSM(uint64 instruction)
+std::string NMD::DINSM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5789,7 +5788,7 @@ std::string NMD::DINSM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINS(uint64 instruction)
+std::string NMD::DINS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5817,7 +5816,7 @@ std::string NMD::DINS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DINSU(uint64 instruction)
+std::string NMD::DINSU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5845,7 +5844,7 @@ std::string NMD::DINSU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DI(uint64 instruction)
+std::string NMD::DI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -5865,7 +5864,7 @@ std::string NMD::DI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV(uint64 instruction)
+std::string NMD::DIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5889,7 +5888,7 @@ std::string NMD::DIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_D(uint64 instruction)
+std::string NMD::DIV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5913,7 +5912,7 @@ std::string NMD::DIV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIV_S(uint64 instruction)
+std::string NMD::DIV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -5937,7 +5936,7 @@ std::string NMD::DIV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DIVU(uint64 instruction)
+std::string NMD::DIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5961,7 +5960,7 @@ std::string NMD::DIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLSA(uint64 instruction)
+std::string NMD::DLSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -5987,7 +5986,7 @@ std::string NMD::DLSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DLUI_48_(uint64 instruction)
+std::string NMD::DLUI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
@@ -6009,7 +6008,7 @@ std::string NMD::DLUI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC0(uint64 instruction)
+std::string NMD::DMFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6033,7 +6032,7 @@ std::string NMD::DMFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC1(uint64 instruction)
+std::string NMD::DMFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6055,7 +6054,7 @@ std::string NMD::DMFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFC2(uint64 instruction)
+std::string NMD::DMFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6077,7 +6076,7 @@ std::string NMD::DMFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMFGC0(uint64 instruction)
+std::string NMD::DMFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6101,7 +6100,7 @@ std::string NMD::DMFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMOD(uint64 instruction)
+std::string NMD::DMOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6125,7 +6124,7 @@ std::string NMD::DMOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMODU(uint64 instruction)
+std::string NMD::DMODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6149,7 +6148,7 @@ std::string NMD::DMODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC0(uint64 instruction)
+std::string NMD::DMTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6173,7 +6172,7 @@ std::string NMD::DMTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC1(uint64 instruction)
+std::string NMD::DMTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -6195,7 +6194,7 @@ std::string NMD::DMTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTC2(uint64 instruction)
+std::string NMD::DMTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -6217,7 +6216,7 @@ std::string NMD::DMTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMTGC0(uint64 instruction)
+std::string NMD::DMTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -6241,7 +6240,7 @@ std::string NMD::DMTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMT(uint64 instruction)
+std::string NMD::DMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -6261,7 +6260,7 @@ std::string NMD::DMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUH(uint64 instruction)
+std::string NMD::DMUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6285,7 +6284,7 @@ std::string NMD::DMUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUHU(uint64 instruction)
+std::string NMD::DMUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6309,7 +6308,7 @@ std::string NMD::DMUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMUL(uint64 instruction)
+std::string NMD::DMUL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6333,7 +6332,7 @@ std::string NMD::DMUL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DMULU(uint64 instruction)
+std::string NMD::DMULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6358,7 +6357,7 @@ std::string NMD::DMULU(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::DPA_W_PH(uint64 instruction)
+std::string NMD::DPA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6382,7 +6381,7 @@ std::string NMD::DPA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_SA_L_W(uint64 instruction)
+std::string NMD::DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6406,7 +6405,7 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQ_S_W_PH(uint64 instruction)
+std::string NMD::DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6430,7 +6429,7 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
+std::string NMD::DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6454,7 +6453,7 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAQX_S_W_PH(uint64 instruction)
+std::string NMD::DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6478,7 +6477,7 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBL(uint64 instruction)
+std::string NMD::DPAU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6502,7 +6501,7 @@ std::string NMD::DPAU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAU_H_QBR(uint64 instruction)
+std::string NMD::DPAU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6526,7 +6525,7 @@ std::string NMD::DPAU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPAX_W_PH(uint64 instruction)
+std::string NMD::DPAX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6550,7 +6549,7 @@ std::string NMD::DPAX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPS_W_PH(uint64 instruction)
+std::string NMD::DPS_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6574,7 +6573,7 @@ std::string NMD::DPS_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_SA_L_W(uint64 instruction)
+std::string NMD::DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6598,7 +6597,7 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQ_S_W_PH(uint64 instruction)
+std::string NMD::DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6622,7 +6621,7 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
+std::string NMD::DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6646,7 +6645,7 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSQX_S_W_PH(uint64 instruction)
+std::string NMD::DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6670,7 +6669,7 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBL(uint64 instruction)
+std::string NMD::DPSU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6694,7 +6693,7 @@ std::string NMD::DPSU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSU_H_QBR(uint64 instruction)
+std::string NMD::DPSU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6718,7 +6717,7 @@ std::string NMD::DPSU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DPSX_W_PH(uint64 instruction)
+std::string NMD::DPSX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6742,7 +6741,7 @@ std::string NMD::DPSX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTR(uint64 instruction)
+std::string NMD::DROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6766,7 +6765,7 @@ std::string NMD::DROTR(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DROTR32(uint64 instruction)
+std::string NMD::DROTR32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6790,7 +6789,7 @@ std::string NMD::DROTR32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTRV(uint64 instruction)
+std::string NMD::DROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6814,7 +6813,7 @@ std::string NMD::DROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DROTX(uint64 instruction)
+std::string NMD::DROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6840,7 +6839,7 @@ std::string NMD::DROTX(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL(uint64 instruction)
+std::string NMD::DSLL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6864,7 +6863,7 @@ std::string NMD::DSLL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSLL32(uint64 instruction)
+std::string NMD::DSLL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6888,7 +6887,7 @@ std::string NMD::DSLL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSLLV(uint64 instruction)
+std::string NMD::DSLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6912,7 +6911,7 @@ std::string NMD::DSLLV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA(uint64 instruction)
+std::string NMD::DSRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6936,7 +6935,7 @@ std::string NMD::DSRA(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRA32(uint64 instruction)
+std::string NMD::DSRA32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6960,7 +6959,7 @@ std::string NMD::DSRA32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRAV(uint64 instruction)
+std::string NMD::DSRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -6984,7 +6983,7 @@ std::string NMD::DSRAV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL(uint64 instruction)
+std::string NMD::DSRL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7008,7 +7007,7 @@ std::string NMD::DSRL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-std::string NMD::DSRL32(uint64 instruction)
+std::string NMD::DSRL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7032,7 +7031,7 @@ std::string NMD::DSRL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSRLV(uint64 instruction)
+std::string NMD::DSRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7056,7 +7055,7 @@ std::string NMD::DSRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUB(uint64 instruction)
+std::string NMD::DSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7080,7 +7079,7 @@ std::string NMD::DSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DSUBU(uint64 instruction)
+std::string NMD::DSUBU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7104,7 +7103,7 @@ std::string NMD::DSUBU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVPE(uint64 instruction)
+std::string NMD::DVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7124,7 +7123,7 @@ std::string NMD::DVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::DVP(uint64 instruction)
+std::string NMD::DVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7144,7 +7143,7 @@ std::string NMD::DVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EHB(uint64 instruction)
+std::string NMD::EHB(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7162,7 +7161,7 @@ std::string NMD::EHB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EI(uint64 instruction)
+std::string NMD::EI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7182,7 +7181,7 @@ std::string NMD::EI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EMT(uint64 instruction)
+std::string NMD::EMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7202,7 +7201,7 @@ std::string NMD::EMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERET(uint64 instruction)
+std::string NMD::ERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7220,7 +7219,7 @@ std::string NMD::ERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ERETNC(uint64 instruction)
+std::string NMD::ERETNC(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7238,7 +7237,7 @@ std::string NMD::ERETNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVP(uint64 instruction)
+std::string NMD::EVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7258,7 +7257,7 @@ std::string NMD::EVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EVPE(uint64 instruction)
+std::string NMD::EVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
@@ -7278,7 +7277,7 @@ std::string NMD::EVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXT(uint64 instruction)
+std::string NMD::EXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7304,7 +7303,7 @@ std::string NMD::EXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD(uint64 instruction)
+std::string NMD::EXTD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7330,7 +7329,7 @@ std::string NMD::EXTD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTD32(uint64 instruction)
+std::string NMD::EXTD32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7356,7 +7355,7 @@ std::string NMD::EXTD32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDP(uint64 instruction)
+std::string NMD::EXTPDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7380,7 +7379,7 @@ std::string NMD::EXTPDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPDPV(uint64 instruction)
+std::string NMD::EXTPDPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7404,7 +7403,7 @@ std::string NMD::EXTPDPV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTP(uint64 instruction)
+std::string NMD::EXTP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
@@ -7428,7 +7427,7 @@ std::string NMD::EXTP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::EXTPV(uint64 instruction)
+std::string NMD::EXTPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7453,7 +7452,7 @@ std::string NMD::EXTPV(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_RS_W(uint64 instruction)
+std::string NMD::EXTR_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7478,7 +7477,7 @@ std::string NMD::EXTR_RS_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_R_W(uint64 instruction)
+std::string NMD::EXTR_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7503,7 +7502,7 @@ std::string NMD::EXTR_R_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_S_H(uint64 instruction)
+std::string NMD::EXTR_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7528,7 +7527,7 @@ std::string NMD::EXTR_S_H(uint64 instruction)
  *       shift -----
  *               ac --
  */
-std::string NMD::EXTR_W(uint64 instruction)
+std::string NMD::EXTR_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
@@ -7553,7 +7552,7 @@ std::string NMD::EXTR_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_RS_W(uint64 instruction)
+std::string NMD::EXTRV_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7578,7 +7577,7 @@ std::string NMD::EXTRV_RS_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_R_W(uint64 instruction)
+std::string NMD::EXTRV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7603,7 +7602,7 @@ std::string NMD::EXTRV_R_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_S_H(uint64 instruction)
+std::string NMD::EXTRV_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7628,7 +7627,7 @@ std::string NMD::EXTRV_S_H(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::EXTRV_W(uint64 instruction)
+std::string NMD::EXTRV_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7653,7 +7652,7 @@ std::string NMD::EXTRV_W(uint64 instruction)
  *               rd -----
  *                 shift -----
  */
-std::string NMD::EXTW(uint64 instruction)
+std::string NMD::EXTW(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7679,7 +7678,7 @@ std::string NMD::EXTW(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_D(uint64 instruction)
+std::string NMD::FLOOR_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7701,7 +7700,7 @@ std::string NMD::FLOOR_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_L_S(uint64 instruction)
+std::string NMD::FLOOR_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7723,7 +7722,7 @@ std::string NMD::FLOOR_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_D(uint64 instruction)
+std::string NMD::FLOOR_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7745,7 +7744,7 @@ std::string NMD::FLOOR_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FLOOR_W_S(uint64 instruction)
+std::string NMD::FLOOR_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -7767,7 +7766,7 @@ std::string NMD::FLOOR_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::FORK(uint64 instruction)
+std::string NMD::FORK(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7791,7 +7790,7 @@ std::string NMD::FORK(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL(uint64 instruction)
+std::string NMD::HYPCALL(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -7811,7 +7810,7 @@ std::string NMD::HYPCALL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::HYPCALL_16_(uint64 instruction)
+std::string NMD::HYPCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -7831,7 +7830,7 @@ std::string NMD::HYPCALL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::INS(uint64 instruction)
+std::string NMD::INS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7858,7 +7857,7 @@ std::string NMD::INS(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::INSV(uint64 instruction)
+std::string NMD::INSV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7880,7 +7879,7 @@ std::string NMD::INSV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::IRET(uint64 instruction)
+std::string NMD::IRET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -7898,7 +7897,7 @@ std::string NMD::IRET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_16_(uint64 instruction)
+std::string NMD::JALRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7918,7 +7917,7 @@ std::string NMD::JALRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_32_(uint64 instruction)
+std::string NMD::JALRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7940,7 +7939,7 @@ std::string NMD::JALRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JALRC_HB(uint64 instruction)
+std::string NMD::JALRC_HB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -7962,7 +7961,7 @@ std::string NMD::JALRC_HB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::JRC(uint64 instruction)
+std::string NMD::JRC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
@@ -7982,7 +7981,7 @@ std::string NMD::JRC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_16_(uint64 instruction)
+std::string NMD::LB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8006,7 +8005,7 @@ std::string NMD::LB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_GP_(uint64 instruction)
+std::string NMD::LB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8028,7 +8027,7 @@ std::string NMD::LB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_S9_(uint64 instruction)
+std::string NMD::LB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8052,7 +8051,7 @@ std::string NMD::LB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LB_U12_(uint64 instruction)
+std::string NMD::LB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8076,7 +8075,7 @@ std::string NMD::LB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBE(uint64 instruction)
+std::string NMD::LBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8100,7 +8099,7 @@ std::string NMD::LBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_16_(uint64 instruction)
+std::string NMD::LBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8124,7 +8123,7 @@ std::string NMD::LBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_GP_(uint64 instruction)
+std::string NMD::LBU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -8146,7 +8145,7 @@ std::string NMD::LBU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_S9_(uint64 instruction)
+std::string NMD::LBU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8170,7 +8169,7 @@ std::string NMD::LBU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBU_U12_(uint64 instruction)
+std::string NMD::LBU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8194,7 +8193,7 @@ std::string NMD::LBU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUE(uint64 instruction)
+std::string NMD::LBUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8218,7 +8217,7 @@ std::string NMD::LBUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBUX(uint64 instruction)
+std::string NMD::LBUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8242,7 +8241,7 @@ std::string NMD::LBUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LBX(uint64 instruction)
+std::string NMD::LBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8266,7 +8265,7 @@ std::string NMD::LBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_GP_(uint64 instruction)
+std::string NMD::LD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -8288,7 +8287,7 @@ std::string NMD::LD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_S9_(uint64 instruction)
+std::string NMD::LD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8312,7 +8311,7 @@ std::string NMD::LD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LD_U12_(uint64 instruction)
+std::string NMD::LD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8336,7 +8335,7 @@ std::string NMD::LD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_GP_(uint64 instruction)
+std::string NMD::LDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -8358,7 +8357,7 @@ std::string NMD::LDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_S9_(uint64 instruction)
+std::string NMD::LDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8382,7 +8381,7 @@ std::string NMD::LDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1_U12_(uint64 instruction)
+std::string NMD::LDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8406,7 +8405,7 @@ std::string NMD::LDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1XS(uint64 instruction)
+std::string NMD::LDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8430,7 +8429,7 @@ std::string NMD::LDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC1X(uint64 instruction)
+std::string NMD::LDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8454,7 +8453,7 @@ std::string NMD::LDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDC2(uint64 instruction)
+std::string NMD::LDC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8478,7 +8477,7 @@ std::string NMD::LDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDM(uint64 instruction)
+std::string NMD::LDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8504,13 +8503,13 @@ std::string NMD::LDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDPC_48_(uint64 instruction)
+std::string NMD::LDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8526,7 +8525,7 @@ std::string NMD::LDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDX(uint64 instruction)
+std::string NMD::LDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8550,7 +8549,7 @@ std::string NMD::LDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LDXS(uint64 instruction)
+std::string NMD::LDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8574,7 +8573,7 @@ std::string NMD::LDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_16_(uint64 instruction)
+std::string NMD::LH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8598,7 +8597,7 @@ std::string NMD::LH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_GP_(uint64 instruction)
+std::string NMD::LH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8620,7 +8619,7 @@ std::string NMD::LH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_S9_(uint64 instruction)
+std::string NMD::LH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8644,7 +8643,7 @@ std::string NMD::LH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LH_U12_(uint64 instruction)
+std::string NMD::LH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8668,7 +8667,7 @@ std::string NMD::LH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHE(uint64 instruction)
+std::string NMD::LHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8692,7 +8691,7 @@ std::string NMD::LHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_16_(uint64 instruction)
+std::string NMD::LHU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -8716,7 +8715,7 @@ std::string NMD::LHU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_GP_(uint64 instruction)
+std::string NMD::LHU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -8738,7 +8737,7 @@ std::string NMD::LHU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_S9_(uint64 instruction)
+std::string NMD::LHU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8762,7 +8761,7 @@ std::string NMD::LHU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHU_U12_(uint64 instruction)
+std::string NMD::LHU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8786,7 +8785,7 @@ std::string NMD::LHU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUE(uint64 instruction)
+std::string NMD::LHUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8810,7 +8809,7 @@ std::string NMD::LHUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUX(uint64 instruction)
+std::string NMD::LHUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8834,7 +8833,7 @@ std::string NMD::LHUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHUXS(uint64 instruction)
+std::string NMD::LHUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8858,7 +8857,7 @@ std::string NMD::LHUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHXS(uint64 instruction)
+std::string NMD::LHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8882,7 +8881,7 @@ std::string NMD::LHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LHX(uint64 instruction)
+std::string NMD::LHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8906,7 +8905,7 @@ std::string NMD::LHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_16_(uint64 instruction)
+std::string NMD::LI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
@@ -8928,7 +8927,7 @@ std::string NMD::LI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LI_48_(uint64 instruction)
+std::string NMD::LI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
@@ -8950,7 +8949,7 @@ std::string NMD::LI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LL(uint64 instruction)
+std::string NMD::LL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8974,7 +8973,7 @@ std::string NMD::LL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLD(uint64 instruction)
+std::string NMD::LLD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -8998,7 +8997,7 @@ std::string NMD::LLD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLDP(uint64 instruction)
+std::string NMD::LLDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9022,7 +9021,7 @@ std::string NMD::LLDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLE(uint64 instruction)
+std::string NMD::LLE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9046,7 +9045,7 @@ std::string NMD::LLE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWP(uint64 instruction)
+std::string NMD::LLWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9070,7 +9069,7 @@ std::string NMD::LLWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LLWPE(uint64 instruction)
+std::string NMD::LLWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9094,7 +9093,7 @@ std::string NMD::LLWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LSA(uint64 instruction)
+std::string NMD::LSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9120,7 +9119,7 @@ std::string NMD::LSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LUI(uint64 instruction)
+std::string NMD::LUI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
@@ -9142,7 +9141,7 @@ std::string NMD::LUI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_16_(uint64 instruction)
+std::string NMD::LW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9166,7 +9165,7 @@ std::string NMD::LW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_4X4_(uint64 instruction)
+std::string NMD::LW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -9190,7 +9189,7 @@ std::string NMD::LW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP_(uint64 instruction)
+std::string NMD::LW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -9212,7 +9211,7 @@ std::string NMD::LW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_GP16_(uint64 instruction)
+std::string NMD::LW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
@@ -9234,7 +9233,7 @@ std::string NMD::LW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_S9_(uint64 instruction)
+std::string NMD::LW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9258,7 +9257,7 @@ std::string NMD::LW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_SP_(uint64 instruction)
+std::string NMD::LW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -9280,7 +9279,7 @@ std::string NMD::LW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LW_U12_(uint64 instruction)
+std::string NMD::LW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9304,7 +9303,7 @@ std::string NMD::LW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_GP_(uint64 instruction)
+std::string NMD::LWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9326,7 +9325,7 @@ std::string NMD::LWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_S9_(uint64 instruction)
+std::string NMD::LWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9350,7 +9349,7 @@ std::string NMD::LWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1_U12_(uint64 instruction)
+std::string NMD::LWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9374,7 +9373,7 @@ std::string NMD::LWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1X(uint64 instruction)
+std::string NMD::LWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9398,7 +9397,7 @@ std::string NMD::LWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC1XS(uint64 instruction)
+std::string NMD::LWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9422,7 +9421,7 @@ std::string NMD::LWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWC2(uint64 instruction)
+std::string NMD::LWC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9446,7 +9445,7 @@ std::string NMD::LWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWE(uint64 instruction)
+std::string NMD::LWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9470,7 +9469,7 @@ std::string NMD::LWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWM(uint64 instruction)
+std::string NMD::LWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9496,13 +9495,13 @@ std::string NMD::LWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWPC_48_(uint64 instruction)
+std::string NMD::LWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9518,7 +9517,7 @@ std::string NMD::LWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_GP_(uint64 instruction)
+std::string NMD::LWU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -9540,7 +9539,7 @@ std::string NMD::LWU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_S9_(uint64 instruction)
+std::string NMD::LWU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9564,7 +9563,7 @@ std::string NMD::LWU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWU_U12_(uint64 instruction)
+std::string NMD::LWU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9588,7 +9587,7 @@ std::string NMD::LWU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUX(uint64 instruction)
+std::string NMD::LWUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9612,7 +9611,7 @@ std::string NMD::LWUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWUXS(uint64 instruction)
+std::string NMD::LWUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9636,7 +9635,7 @@ std::string NMD::LWUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWX(uint64 instruction)
+std::string NMD::LWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9660,7 +9659,7 @@ std::string NMD::LWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_16_(uint64 instruction)
+std::string NMD::LWXS_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -9684,7 +9683,7 @@ std::string NMD::LWXS_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::LWXS_32_(uint64 instruction)
+std::string NMD::LWXS_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9709,7 +9708,7 @@ std::string NMD::LWXS_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADD_DSP_(uint64 instruction)
+std::string NMD::MADD_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9733,7 +9732,7 @@ std::string NMD::MADD_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_D(uint64 instruction)
+std::string NMD::MADDF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9757,7 +9756,7 @@ std::string NMD::MADDF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDF_S(uint64 instruction)
+std::string NMD::MADDF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9782,7 +9781,7 @@ std::string NMD::MADDF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MADDU_DSP_(uint64 instruction)
+std::string NMD::MADDU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9807,7 +9806,7 @@ std::string NMD::MADDU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHL(uint64 instruction)
+std::string NMD::MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9832,7 +9831,7 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_S_W_PHR(uint64 instruction)
+std::string NMD::MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9857,7 +9856,7 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
+std::string NMD::MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9882,7 +9881,7 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
+std::string NMD::MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -9906,7 +9905,7 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_D(uint64 instruction)
+std::string NMD::MAX_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9930,7 +9929,7 @@ std::string NMD::MAX_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAX_S(uint64 instruction)
+std::string NMD::MAX_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9954,7 +9953,7 @@ std::string NMD::MAX_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_D(uint64 instruction)
+std::string NMD::MAXA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -9978,7 +9977,7 @@ std::string NMD::MAXA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MAXA_S(uint64 instruction)
+std::string NMD::MAXA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10002,7 +10001,7 @@ std::string NMD::MAXA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC0(uint64 instruction)
+std::string NMD::MFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10026,7 +10025,7 @@ std::string NMD::MFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC1(uint64 instruction)
+std::string NMD::MFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10048,7 +10047,7 @@ std::string NMD::MFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFC2(uint64 instruction)
+std::string NMD::MFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10070,7 +10069,7 @@ std::string NMD::MFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFGC0(uint64 instruction)
+std::string NMD::MFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10094,7 +10093,7 @@ std::string NMD::MFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC0(uint64 instruction)
+std::string NMD::MFHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10118,7 +10117,7 @@ std::string NMD::MFHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC1(uint64 instruction)
+std::string NMD::MFHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10140,7 +10139,7 @@ std::string NMD::MFHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHC2(uint64 instruction)
+std::string NMD::MFHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10162,7 +10161,7 @@ std::string NMD::MFHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHGC0(uint64 instruction)
+std::string NMD::MFHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10185,7 +10184,7 @@ std::string NMD::MFHGC0(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFHI_DSP_(uint64 instruction)
+std::string NMD::MFHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10207,7 +10206,7 @@ std::string NMD::MFHI_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFHTR(uint64 instruction)
+std::string NMD::MFHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10232,7 +10231,7 @@ std::string NMD::MFHTR(uint64 instruction)
  *     rt -----
  *               ac --
  */
-std::string NMD::MFLO_DSP_(uint64 instruction)
+std::string NMD::MFLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10254,7 +10253,7 @@ std::string NMD::MFLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MFTR(uint64 instruction)
+std::string NMD::MFTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10280,7 +10279,7 @@ std::string NMD::MFTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_D(uint64 instruction)
+std::string NMD::MIN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10304,7 +10303,7 @@ std::string NMD::MIN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MIN_S(uint64 instruction)
+std::string NMD::MIN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10328,7 +10327,7 @@ std::string NMD::MIN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_D(uint64 instruction)
+std::string NMD::MINA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10352,7 +10351,7 @@ std::string NMD::MINA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MINA_S(uint64 instruction)
+std::string NMD::MINA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10376,7 +10375,7 @@ std::string NMD::MINA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOD(uint64 instruction)
+std::string NMD::MOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10400,7 +10399,7 @@ std::string NMD::MOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODSUB(uint64 instruction)
+std::string NMD::MODSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10424,7 +10423,7 @@ std::string NMD::MODSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MODU(uint64 instruction)
+std::string NMD::MODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10448,7 +10447,7 @@ std::string NMD::MODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_D(uint64 instruction)
+std::string NMD::MOV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10470,7 +10469,7 @@ std::string NMD::MOV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOV_S(uint64 instruction)
+std::string NMD::MOV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10492,7 +10491,7 @@ std::string NMD::MOV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE_BALC(uint64 instruction)
+std::string NMD::MOVE_BALC(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
@@ -10500,7 +10499,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
 
     std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10516,7 +10515,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP(uint64 instruction)
+std::string NMD::MOVEP(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10543,7 +10542,7 @@ std::string NMD::MOVEP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVEP_REV_(uint64 instruction)
+std::string NMD::MOVEP_REV_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
@@ -10570,7 +10569,7 @@ std::string NMD::MOVEP_REV_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVE(uint64 instruction)
+std::string NMD::MOVE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
@@ -10592,7 +10591,7 @@ std::string NMD::MOVE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVN(uint64 instruction)
+std::string NMD::MOVN(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10616,7 +10615,7 @@ std::string NMD::MOVN(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MOVZ(uint64 instruction)
+std::string NMD::MOVZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10640,7 +10639,7 @@ std::string NMD::MOVZ(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUB_DSP_(uint64 instruction)
+std::string NMD::MSUB_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10664,7 +10663,7 @@ std::string NMD::MSUB_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_D(uint64 instruction)
+std::string NMD::MSUBF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10688,7 +10687,7 @@ std::string NMD::MSUBF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MSUBF_S(uint64 instruction)
+std::string NMD::MSUBF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10712,7 +10711,7 @@ std::string NMD::MSUBF_S(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MSUBU_DSP_(uint64 instruction)
+std::string NMD::MSUBU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -10736,7 +10735,7 @@ std::string NMD::MSUBU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC0(uint64 instruction)
+std::string NMD::MTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10760,7 +10759,7 @@ std::string NMD::MTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC1(uint64 instruction)
+std::string NMD::MTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10782,7 +10781,7 @@ std::string NMD::MTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTC2(uint64 instruction)
+std::string NMD::MTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10804,7 +10803,7 @@ std::string NMD::MTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTGC0(uint64 instruction)
+std::string NMD::MTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10828,7 +10827,7 @@ std::string NMD::MTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC0(uint64 instruction)
+std::string NMD::MTHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10852,7 +10851,7 @@ std::string NMD::MTHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC1(uint64 instruction)
+std::string NMD::MTHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -10874,7 +10873,7 @@ std::string NMD::MTHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHC2(uint64 instruction)
+std::string NMD::MTHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
@@ -10896,7 +10895,7 @@ std::string NMD::MTHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHGC0(uint64 instruction)
+std::string NMD::MTHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10919,7 +10918,7 @@ std::string NMD::MTHGC0(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHI_DSP_(uint64 instruction)
+std::string NMD::MTHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10940,7 +10939,7 @@ std::string NMD::MTHI_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTHLIP(uint64 instruction)
+std::string NMD::MTHLIP(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -10962,7 +10961,7 @@ std::string NMD::MTHLIP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTHTR(uint64 instruction)
+std::string NMD::MTHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -10987,7 +10986,7 @@ std::string NMD::MTHTR(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MTLO_DSP_(uint64 instruction)
+std::string NMD::MTLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -11009,7 +11008,7 @@ std::string NMD::MTLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MTTR(uint64 instruction)
+std::string NMD::MTTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
@@ -11035,7 +11034,7 @@ std::string NMD::MTTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUH(uint64 instruction)
+std::string NMD::MUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11059,7 +11058,7 @@ std::string NMD::MUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUHU(uint64 instruction)
+std::string NMD::MUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11083,7 +11082,7 @@ std::string NMD::MUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_32_(uint64 instruction)
+std::string NMD::MUL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11107,7 +11106,7 @@ std::string NMD::MUL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_4X4_(uint64 instruction)
+std::string NMD::MUL_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -11129,7 +11128,7 @@ std::string NMD::MUL_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_D(uint64 instruction)
+std::string NMD::MUL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11154,7 +11153,7 @@ std::string NMD::MUL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_PH(uint64 instruction)
+std::string NMD::MUL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11179,7 +11178,7 @@ std::string NMD::MUL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S_PH(uint64 instruction)
+std::string NMD::MUL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11203,7 +11202,7 @@ std::string NMD::MUL_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MUL_S(uint64 instruction)
+std::string NMD::MUL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11228,7 +11227,7 @@ std::string NMD::MUL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
+std::string NMD::MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11253,7 +11252,7 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
+std::string NMD::MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11278,7 +11277,7 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
+std::string NMD::MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11303,7 +11302,7 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
+std::string NMD::MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11328,7 +11327,7 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_PH(uint64 instruction)
+std::string NMD::MULQ_RS_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11353,7 +11352,7 @@ std::string NMD::MULQ_RS_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_RS_W(uint64 instruction)
+std::string NMD::MULQ_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11378,7 +11377,7 @@ std::string NMD::MULQ_RS_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_PH(uint64 instruction)
+std::string NMD::MULQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11403,7 +11402,7 @@ std::string NMD::MULQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULQ_S_W(uint64 instruction)
+std::string NMD::MULQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11428,7 +11427,7 @@ std::string NMD::MULQ_S_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSA_W_PH(uint64 instruction)
+std::string NMD::MULSA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11453,7 +11452,7 @@ std::string NMD::MULSA_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
+std::string NMD::MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11477,7 +11476,7 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULT_DSP_(uint64 instruction)
+std::string NMD::MULT_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11501,7 +11500,7 @@ std::string NMD::MULT_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::MULTU_DSP_(uint64 instruction)
+std::string NMD::MULTU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11525,7 +11524,7 @@ std::string NMD::MULTU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::MULU(uint64 instruction)
+std::string NMD::MULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11549,7 +11548,7 @@ std::string NMD::MULU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_D(uint64 instruction)
+std::string NMD::NEG_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11571,7 +11570,7 @@ std::string NMD::NEG_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NEG_S(uint64 instruction)
+std::string NMD::NEG_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -11593,7 +11592,7 @@ std::string NMD::NEG_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_16_(uint64 instruction)
+std::string NMD::NOP_16_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11611,7 +11610,7 @@ std::string NMD::NOP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOP_32_(uint64 instruction)
+std::string NMD::NOP_32_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11629,7 +11628,7 @@ std::string NMD::NOP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOR(uint64 instruction)
+std::string NMD::NOR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11653,7 +11652,7 @@ std::string NMD::NOR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::NOT_16_(uint64 instruction)
+std::string NMD::NOT_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11675,7 +11674,7 @@ std::string NMD::NOT_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_16_(uint64 instruction)
+std::string NMD::OR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -11697,7 +11696,7 @@ std::string NMD::OR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::OR_32_(uint64 instruction)
+std::string NMD::OR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11721,7 +11720,7 @@ std::string NMD::OR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ORI(uint64 instruction)
+std::string NMD::ORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11746,7 +11745,7 @@ std::string NMD::ORI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PACKRL_PH(uint64 instruction)
+std::string NMD::PACKRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11770,7 +11769,7 @@ std::string NMD::PACKRL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PAUSE(uint64 instruction)
+std::string NMD::PAUSE(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -11789,7 +11788,7 @@ std::string NMD::PAUSE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_PH(uint64 instruction)
+std::string NMD::PICK_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11814,7 +11813,7 @@ std::string NMD::PICK_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PICK_QB(uint64 instruction)
+std::string NMD::PICK_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11839,7 +11838,7 @@ std::string NMD::PICK_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHL(uint64 instruction)
+std::string NMD::PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11862,7 +11861,7 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQ_W_PHR(uint64 instruction)
+std::string NMD::PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11885,7 +11884,7 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11908,7 +11907,7 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11931,7 +11930,7 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11954,7 +11953,7 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
+std::string NMD::PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -11978,7 +11977,7 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
+std::string NMD::PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12001,7 +12000,7 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBL(uint64 instruction)
+std::string NMD::PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12025,7 +12024,7 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
+std::string NMD::PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12048,7 +12047,7 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECEU_PH_QBR(uint64 instruction)
+std::string NMD::PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12071,7 +12070,7 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_QB_PH(uint64 instruction)
+std::string NMD::PRECR_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12096,7 +12095,7 @@ std::string NMD::PRECR_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
+std::string NMD::PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12121,7 +12120,7 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
+std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12146,7 +12145,7 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_PH_W(uint64 instruction)
+std::string NMD::PRECRQ_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12171,7 +12170,7 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_QB_PH(uint64 instruction)
+std::string NMD::PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12196,7 +12195,7 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
+std::string NMD::PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12221,7 +12220,7 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
+std::string NMD::PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12245,7 +12244,7 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_S9_(uint64 instruction)
+std::string NMD::PREF_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12269,7 +12268,7 @@ std::string NMD::PREF_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREF_U12_(uint64 instruction)
+std::string NMD::PREF_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12293,7 +12292,7 @@ std::string NMD::PREF_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREFE(uint64 instruction)
+std::string NMD::PREFE(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12317,7 +12316,7 @@ std::string NMD::PREFE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::PREPEND(uint64 instruction)
+std::string NMD::PREPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12340,7 +12339,7 @@ std::string NMD::PREPEND(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::RADDU_W_QB(uint64 instruction)
+std::string NMD::RADDU_W_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12361,7 +12360,7 @@ std::string NMD::RADDU_W_QB(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::RDDSP(uint64 instruction)
+std::string NMD::RDDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -12383,7 +12382,7 @@ std::string NMD::RDDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDHWR(uint64 instruction)
+std::string NMD::RDHWR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
@@ -12407,7 +12406,7 @@ std::string NMD::RDHWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RDPGPR(uint64 instruction)
+std::string NMD::RDPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12429,7 +12428,7 @@ std::string NMD::RDPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_D(uint64 instruction)
+std::string NMD::RECIP_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12451,7 +12450,7 @@ std::string NMD::RECIP_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RECIP_S(uint64 instruction)
+std::string NMD::RECIP_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12473,7 +12472,7 @@ std::string NMD::RECIP_S(uint64 instruction)
  *     rt -----
  *           s ----------
  */
-std::string NMD::REPL_PH(uint64 instruction)
+std::string NMD::REPL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
@@ -12495,7 +12494,7 @@ std::string NMD::REPL_PH(uint64 instruction)
  *     rt -----
  *           u --------
  */
-std::string NMD::REPL_QB(uint64 instruction)
+std::string NMD::REPL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
@@ -12517,7 +12516,7 @@ std::string NMD::REPL_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_PH(uint64 instruction)
+std::string NMD::REPLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12538,7 +12537,7 @@ std::string NMD::REPLV_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::REPLV_QB(uint64 instruction)
+std::string NMD::REPLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12560,7 +12559,7 @@ std::string NMD::REPLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_32_(uint64 instruction)
+std::string NMD::RESTORE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12583,7 +12582,7 @@ std::string NMD::RESTORE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_16_(uint64 instruction)
+std::string NMD::RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12605,7 +12604,7 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTORE_JRC_32_(uint64 instruction)
+std::string NMD::RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
@@ -12628,7 +12627,7 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RESTOREF(uint64 instruction)
+std::string NMD::RESTOREF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12650,7 +12649,7 @@ std::string NMD::RESTOREF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_D(uint64 instruction)
+std::string NMD::RINT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12672,7 +12671,7 @@ std::string NMD::RINT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RINT_S(uint64 instruction)
+std::string NMD::RINT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12694,7 +12693,7 @@ std::string NMD::RINT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTR(uint64 instruction)
+std::string NMD::ROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12718,7 +12717,7 @@ std::string NMD::ROTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTRV(uint64 instruction)
+std::string NMD::ROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12742,7 +12741,7 @@ std::string NMD::ROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROTX(uint64 instruction)
+std::string NMD::ROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12771,7 +12770,7 @@ std::string NMD::ROTX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_D(uint64 instruction)
+std::string NMD::ROUND_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12793,7 +12792,7 @@ std::string NMD::ROUND_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_L_S(uint64 instruction)
+std::string NMD::ROUND_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12815,7 +12814,7 @@ std::string NMD::ROUND_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_D(uint64 instruction)
+std::string NMD::ROUND_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12837,7 +12836,7 @@ std::string NMD::ROUND_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::ROUND_W_S(uint64 instruction)
+std::string NMD::ROUND_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12859,7 +12858,7 @@ std::string NMD::ROUND_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_D(uint64 instruction)
+std::string NMD::RSQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12881,7 +12880,7 @@ std::string NMD::RSQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::RSQRT_S(uint64 instruction)
+std::string NMD::RSQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -12903,7 +12902,7 @@ std::string NMD::RSQRT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_16_(uint64 instruction)
+std::string NMD::SAVE_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
@@ -12925,7 +12924,7 @@ std::string NMD::SAVE_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVE_32_(uint64 instruction)
+std::string NMD::SAVE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
@@ -12948,7 +12947,7 @@ std::string NMD::SAVE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SAVEF(uint64 instruction)
+std::string NMD::SAVEF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
@@ -12970,7 +12969,7 @@ std::string NMD::SAVEF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_16_(uint64 instruction)
+std::string NMD::SB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -12994,7 +12993,7 @@ std::string NMD::SB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_GP_(uint64 instruction)
+std::string NMD::SB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
@@ -13016,7 +13015,7 @@ std::string NMD::SB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_S9_(uint64 instruction)
+std::string NMD::SB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13040,7 +13039,7 @@ std::string NMD::SB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SB_U12_(uint64 instruction)
+std::string NMD::SB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13064,7 +13063,7 @@ std::string NMD::SB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBE(uint64 instruction)
+std::string NMD::SBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13088,7 +13087,7 @@ std::string NMD::SBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SBX(uint64 instruction)
+std::string NMD::SBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13112,7 +13111,7 @@ std::string NMD::SBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SC(uint64 instruction)
+std::string NMD::SC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13136,7 +13135,7 @@ std::string NMD::SC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCD(uint64 instruction)
+std::string NMD::SCD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13160,7 +13159,7 @@ std::string NMD::SCD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCDP(uint64 instruction)
+std::string NMD::SCDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13184,7 +13183,7 @@ std::string NMD::SCDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCE(uint64 instruction)
+std::string NMD::SCE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13208,7 +13207,7 @@ std::string NMD::SCE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWP(uint64 instruction)
+std::string NMD::SCWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13232,7 +13231,7 @@ std::string NMD::SCWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SCWPE(uint64 instruction)
+std::string NMD::SCWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13256,7 +13255,7 @@ std::string NMD::SCWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_GP_(uint64 instruction)
+std::string NMD::SD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
@@ -13278,7 +13277,7 @@ std::string NMD::SD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_S9_(uint64 instruction)
+std::string NMD::SD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13302,7 +13301,7 @@ std::string NMD::SD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SD_U12_(uint64 instruction)
+std::string NMD::SD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13326,7 +13325,7 @@ std::string NMD::SD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_16_(uint64 instruction)
+std::string NMD::SDBBP_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
@@ -13346,7 +13345,7 @@ std::string NMD::SDBBP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDBBP_32_(uint64 instruction)
+std::string NMD::SDBBP_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -13366,7 +13365,7 @@ std::string NMD::SDBBP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_GP_(uint64 instruction)
+std::string NMD::SDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -13388,7 +13387,7 @@ std::string NMD::SDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_S9_(uint64 instruction)
+std::string NMD::SDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13412,7 +13411,7 @@ std::string NMD::SDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1_U12_(uint64 instruction)
+std::string NMD::SDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13436,7 +13435,7 @@ std::string NMD::SDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1X(uint64 instruction)
+std::string NMD::SDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13460,7 +13459,7 @@ std::string NMD::SDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC1XS(uint64 instruction)
+std::string NMD::SDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13484,7 +13483,7 @@ std::string NMD::SDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDC2(uint64 instruction)
+std::string NMD::SDC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13508,7 +13507,7 @@ std::string NMD::SDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDM(uint64 instruction)
+std::string NMD::SDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13534,13 +13533,13 @@ std::string NMD::SDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDPC_48_(uint64 instruction)
+std::string NMD::SDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13556,7 +13555,7 @@ std::string NMD::SDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDXS(uint64 instruction)
+std::string NMD::SDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13580,7 +13579,7 @@ std::string NMD::SDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SDX(uint64 instruction)
+std::string NMD::SDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13604,7 +13603,7 @@ std::string NMD::SDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEB(uint64 instruction)
+std::string NMD::SEB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13626,7 +13625,7 @@ std::string NMD::SEB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEH(uint64 instruction)
+std::string NMD::SEH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13648,7 +13647,7 @@ std::string NMD::SEH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_D(uint64 instruction)
+std::string NMD::SEL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13672,7 +13671,7 @@ std::string NMD::SEL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEL_S(uint64 instruction)
+std::string NMD::SEL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13696,7 +13695,7 @@ std::string NMD::SEL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_D(uint64 instruction)
+std::string NMD::SELEQZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13720,7 +13719,7 @@ std::string NMD::SELEQZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELEQZ_S(uint64 instruction)
+std::string NMD::SELEQZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13744,7 +13743,7 @@ std::string NMD::SELEQZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_D(uint64 instruction)
+std::string NMD::SELNEZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13768,7 +13767,7 @@ std::string NMD::SELNEZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SELNEZ_S(uint64 instruction)
+std::string NMD::SELNEZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -13792,7 +13791,7 @@ std::string NMD::SELNEZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SEQI(uint64 instruction)
+std::string NMD::SEQI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13816,7 +13815,7 @@ std::string NMD::SEQI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_16_(uint64 instruction)
+std::string NMD::SH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -13840,7 +13839,7 @@ std::string NMD::SH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_GP_(uint64 instruction)
+std::string NMD::SH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
@@ -13862,7 +13861,7 @@ std::string NMD::SH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_S9_(uint64 instruction)
+std::string NMD::SH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13886,7 +13885,7 @@ std::string NMD::SH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SH_U12_(uint64 instruction)
+std::string NMD::SH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13910,7 +13909,7 @@ std::string NMD::SH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHE(uint64 instruction)
+std::string NMD::SHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -13934,7 +13933,7 @@ std::string NMD::SHE(uint64 instruction)
  *      shift ------
  *               ac --
  */
-std::string NMD::SHILO(uint64 instruction)
+std::string NMD::SHILO(uint64 instruction, img_address m_pc)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13956,7 +13955,7 @@ std::string NMD::SHILO(uint64 instruction)
  *          rs -----
  *               ac --
  */
-std::string NMD::SHILOV(uint64 instruction)
+std::string NMD::SHILOV(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
@@ -13978,7 +13977,7 @@ std::string NMD::SHILOV(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_PH(uint64 instruction)
+std::string NMD::SHLL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14002,7 +14001,7 @@ std::string NMD::SHLL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHLL_QB(uint64 instruction)
+std::string NMD::SHLL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14027,7 +14026,7 @@ std::string NMD::SHLL_QB(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHLL_S_PH(uint64 instruction)
+std::string NMD::SHLL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14051,7 +14050,7 @@ std::string NMD::SHLL_S_PH(uint64 instruction)
  *          rs -----
  *               sa -----
  */
-std::string NMD::SHLL_S_W(uint64 instruction)
+std::string NMD::SHLL_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14076,7 +14075,7 @@ std::string NMD::SHLL_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_PH(uint64 instruction)
+std::string NMD::SHLLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14100,7 +14099,7 @@ std::string NMD::SHLLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_QB(uint64 instruction)
+std::string NMD::SHLLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14125,7 +14124,7 @@ std::string NMD::SHLLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_PH(uint64 instruction)
+std::string NMD::SHLLV_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14149,7 +14148,7 @@ std::string NMD::SHLLV_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHLLV_S_W(uint64 instruction)
+std::string NMD::SHLLV_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14173,7 +14172,7 @@ std::string NMD::SHLLV_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_PH(uint64 instruction)
+std::string NMD::SHRA_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14197,7 +14196,7 @@ std::string NMD::SHRA_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_QB(uint64 instruction)
+std::string NMD::SHRA_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14221,7 +14220,7 @@ std::string NMD::SHRA_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_PH(uint64 instruction)
+std::string NMD::SHRA_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14245,7 +14244,7 @@ std::string NMD::SHRA_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_QB(uint64 instruction)
+std::string NMD::SHRA_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14269,7 +14268,7 @@ std::string NMD::SHRA_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRA_R_W(uint64 instruction)
+std::string NMD::SHRA_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14293,7 +14292,7 @@ std::string NMD::SHRA_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_PH(uint64 instruction)
+std::string NMD::SHRAV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14317,7 +14316,7 @@ std::string NMD::SHRAV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_QB(uint64 instruction)
+std::string NMD::SHRAV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14341,7 +14340,7 @@ std::string NMD::SHRAV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_PH(uint64 instruction)
+std::string NMD::SHRAV_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14365,7 +14364,7 @@ std::string NMD::SHRAV_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_QB(uint64 instruction)
+std::string NMD::SHRAV_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14389,7 +14388,7 @@ std::string NMD::SHRAV_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRAV_R_W(uint64 instruction)
+std::string NMD::SHRAV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14413,7 +14412,7 @@ std::string NMD::SHRAV_R_W(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-std::string NMD::SHRL_PH(uint64 instruction)
+std::string NMD::SHRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14437,7 +14436,7 @@ std::string NMD::SHRL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-std::string NMD::SHRL_QB(uint64 instruction)
+std::string NMD::SHRL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14462,7 +14461,7 @@ std::string NMD::SHRL_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_PH(uint64 instruction)
+std::string NMD::SHRLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14486,7 +14485,7 @@ std::string NMD::SHRLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHRLV_QB(uint64 instruction)
+std::string NMD::SHRLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14510,7 +14509,7 @@ std::string NMD::SHRLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHX(uint64 instruction)
+std::string NMD::SHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14534,7 +14533,7 @@ std::string NMD::SHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SHXS(uint64 instruction)
+std::string NMD::SHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14558,7 +14557,7 @@ std::string NMD::SHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SIGRIE(uint64 instruction)
+std::string NMD::SIGRIE(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
@@ -14578,7 +14577,7 @@ std::string NMD::SIGRIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_16_(uint64 instruction)
+std::string NMD::SLL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14602,7 +14601,7 @@ std::string NMD::SLL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLL_32_(uint64 instruction)
+std::string NMD::SLL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14626,7 +14625,7 @@ std::string NMD::SLL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLLV(uint64 instruction)
+std::string NMD::SLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14650,7 +14649,7 @@ std::string NMD::SLLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLT(uint64 instruction)
+std::string NMD::SLT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14674,7 +14673,7 @@ std::string NMD::SLT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTI(uint64 instruction)
+std::string NMD::SLTI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14698,7 +14697,7 @@ std::string NMD::SLTI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTIU(uint64 instruction)
+std::string NMD::SLTIU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14722,7 +14721,7 @@ std::string NMD::SLTIU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SLTU(uint64 instruction)
+std::string NMD::SLTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14746,7 +14745,7 @@ std::string NMD::SLTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SOV(uint64 instruction)
+std::string NMD::SOV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14770,7 +14769,7 @@ std::string NMD::SOV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SPECIAL2(uint64 instruction)
+std::string NMD::SPECIAL2(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -14790,7 +14789,7 @@ std::string NMD::SPECIAL2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_D(uint64 instruction)
+std::string NMD::SQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14812,7 +14811,7 @@ std::string NMD::SQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SQRT_S(uint64 instruction)
+std::string NMD::SQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -14834,7 +14833,7 @@ std::string NMD::SQRT_S(uint64 instruction)
  *               rd -----
  *                    sa -----
  */
-std::string NMD::SRA(uint64 instruction)
+std::string NMD::SRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14858,7 +14857,7 @@ std::string NMD::SRA(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRAV(uint64 instruction)
+std::string NMD::SRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14882,7 +14881,7 @@ std::string NMD::SRAV(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-std::string NMD::SRL_16_(uint64 instruction)
+std::string NMD::SRL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -14906,7 +14905,7 @@ std::string NMD::SRL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRL_32_(uint64 instruction)
+std::string NMD::SRL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14930,7 +14929,7 @@ std::string NMD::SRL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SRLV(uint64 instruction)
+std::string NMD::SRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14954,7 +14953,7 @@ std::string NMD::SRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB(uint64 instruction)
+std::string NMD::SUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -14978,7 +14977,7 @@ std::string NMD::SUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_D(uint64 instruction)
+std::string NMD::SUB_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -15002,7 +15001,7 @@ std::string NMD::SUB_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUB_S(uint64 instruction)
+std::string NMD::SUB_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -15026,7 +15025,7 @@ std::string NMD::SUB_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_PH(uint64 instruction)
+std::string NMD::SUBQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15051,7 +15050,7 @@ std::string NMD::SUBQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_PH(uint64 instruction)
+std::string NMD::SUBQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15076,7 +15075,7 @@ std::string NMD::SUBQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQ_S_W(uint64 instruction)
+std::string NMD::SUBQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15101,7 +15100,7 @@ std::string NMD::SUBQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_PH(uint64 instruction)
+std::string NMD::SUBQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15126,7 +15125,7 @@ std::string NMD::SUBQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_PH(uint64 instruction)
+std::string NMD::SUBQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15151,7 +15150,7 @@ std::string NMD::SUBQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_R_W(uint64 instruction)
+std::string NMD::SUBQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15176,7 +15175,7 @@ std::string NMD::SUBQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBQH_W(uint64 instruction)
+std::string NMD::SUBQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15200,7 +15199,7 @@ std::string NMD::SUBQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_16_(uint64 instruction)
+std::string NMD::SUBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15224,7 +15223,7 @@ std::string NMD::SUBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_32_(uint64 instruction)
+std::string NMD::SUBU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15248,7 +15247,7 @@ std::string NMD::SUBU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_PH(uint64 instruction)
+std::string NMD::SUBU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15272,7 +15271,7 @@ std::string NMD::SUBU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_QB(uint64 instruction)
+std::string NMD::SUBU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15297,7 +15296,7 @@ std::string NMD::SUBU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_PH(uint64 instruction)
+std::string NMD::SUBU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15322,7 +15321,7 @@ std::string NMD::SUBU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBU_S_QB(uint64 instruction)
+std::string NMD::SUBU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15347,7 +15346,7 @@ std::string NMD::SUBU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_QB(uint64 instruction)
+std::string NMD::SUBUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15372,7 +15371,7 @@ std::string NMD::SUBUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SUBUH_R_QB(uint64 instruction)
+std::string NMD::SUBUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15396,7 +15395,7 @@ std::string NMD::SUBUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_16_(uint64 instruction)
+std::string NMD::SW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -15420,7 +15419,7 @@ std::string NMD::SW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_4X4_(uint64 instruction)
+std::string NMD::SW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
@@ -15444,7 +15443,7 @@ std::string NMD::SW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP16_(uint64 instruction)
+std::string NMD::SW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
@@ -15466,7 +15465,7 @@ std::string NMD::SW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_GP_(uint64 instruction)
+std::string NMD::SW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
@@ -15488,7 +15487,7 @@ std::string NMD::SW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_S9_(uint64 instruction)
+std::string NMD::SW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15512,7 +15511,7 @@ std::string NMD::SW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_SP_(uint64 instruction)
+std::string NMD::SW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
@@ -15534,7 +15533,7 @@ std::string NMD::SW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SW_U12_(uint64 instruction)
+std::string NMD::SW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15558,7 +15557,7 @@ std::string NMD::SW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_GP_(uint64 instruction)
+std::string NMD::SWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
@@ -15580,7 +15579,7 @@ std::string NMD::SWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_S9_(uint64 instruction)
+std::string NMD::SWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15604,7 +15603,7 @@ std::string NMD::SWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1_U12_(uint64 instruction)
+std::string NMD::SWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15628,7 +15627,7 @@ std::string NMD::SWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1X(uint64 instruction)
+std::string NMD::SWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15652,7 +15651,7 @@ std::string NMD::SWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC1XS(uint64 instruction)
+std::string NMD::SWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15676,7 +15675,7 @@ std::string NMD::SWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWC2(uint64 instruction)
+std::string NMD::SWC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15700,7 +15699,7 @@ std::string NMD::SWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWE(uint64 instruction)
+std::string NMD::SWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15724,7 +15723,7 @@ std::string NMD::SWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWM(uint64 instruction)
+std::string NMD::SWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15750,13 +15749,13 @@ std::string NMD::SWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWPC_48_(uint64 instruction)
+std::string NMD::SWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
     std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15772,7 +15771,7 @@ std::string NMD::SWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWX(uint64 instruction)
+std::string NMD::SWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15796,7 +15795,7 @@ std::string NMD::SWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SWXS(uint64 instruction)
+std::string NMD::SWXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15820,7 +15819,7 @@ std::string NMD::SWXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNC(uint64 instruction)
+std::string NMD::SYNC(uint64 instruction, img_address m_pc)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
@@ -15840,7 +15839,7 @@ std::string NMD::SYNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCI(uint64 instruction)
+std::string NMD::SYNCI(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15862,7 +15861,7 @@ std::string NMD::SYNCI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYNCIE(uint64 instruction)
+std::string NMD::SYNCIE(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
@@ -15884,7 +15883,7 @@ std::string NMD::SYNCIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::SYSCALL_16_(uint64 instruction)
+std::string NMD::SYSCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
@@ -15902,7 +15901,7 @@ std::string NMD::SYSCALL_16_(uint64 instruction)
  *  00000000000010
  *           code ------------------
  */
-std::string NMD::SYSCALL_32_(uint64 instruction)
+std::string NMD::SYSCALL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
@@ -15922,7 +15921,7 @@ std::string NMD::SYSCALL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TEQ(uint64 instruction)
+std::string NMD::TEQ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -15944,7 +15943,7 @@ std::string NMD::TEQ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINV(uint64 instruction)
+std::string NMD::TLBGINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15962,7 +15961,7 @@ std::string NMD::TLBGINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGINVF(uint64 instruction)
+std::string NMD::TLBGINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15980,7 +15979,7 @@ std::string NMD::TLBGINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGP(uint64 instruction)
+std::string NMD::TLBGP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -15998,7 +15997,7 @@ std::string NMD::TLBGP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGR(uint64 instruction)
+std::string NMD::TLBGR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16016,7 +16015,7 @@ std::string NMD::TLBGR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWI(uint64 instruction)
+std::string NMD::TLBGWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16034,7 +16033,7 @@ std::string NMD::TLBGWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBGWR(uint64 instruction)
+std::string NMD::TLBGWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16052,7 +16051,7 @@ std::string NMD::TLBGWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINV(uint64 instruction)
+std::string NMD::TLBINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16070,7 +16069,7 @@ std::string NMD::TLBINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBINVF(uint64 instruction)
+std::string NMD::TLBINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16088,7 +16087,7 @@ std::string NMD::TLBINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBP(uint64 instruction)
+std::string NMD::TLBP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16106,7 +16105,7 @@ std::string NMD::TLBP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBR(uint64 instruction)
+std::string NMD::TLBR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16124,7 +16123,7 @@ std::string NMD::TLBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWI(uint64 instruction)
+std::string NMD::TLBWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16142,7 +16141,7 @@ std::string NMD::TLBWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TLBWR(uint64 instruction)
+std::string NMD::TLBWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
@@ -16160,7 +16159,7 @@ std::string NMD::TLBWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TNE(uint64 instruction)
+std::string NMD::TNE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16182,7 +16181,7 @@ std::string NMD::TNE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_D(uint64 instruction)
+std::string NMD::TRUNC_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16204,7 +16203,7 @@ std::string NMD::TRUNC_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_L_S(uint64 instruction)
+std::string NMD::TRUNC_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16226,7 +16225,7 @@ std::string NMD::TRUNC_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_D(uint64 instruction)
+std::string NMD::TRUNC_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16248,7 +16247,7 @@ std::string NMD::TRUNC_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::TRUNC_W_S(uint64 instruction)
+std::string NMD::TRUNC_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
@@ -16270,7 +16269,7 @@ std::string NMD::TRUNC_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALDM(uint64 instruction)
+std::string NMD::UALDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16296,7 +16295,7 @@ std::string NMD::UALDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALH(uint64 instruction)
+std::string NMD::UALH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16320,7 +16319,7 @@ std::string NMD::UALH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UALWM(uint64 instruction)
+std::string NMD::UALWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16346,7 +16345,7 @@ std::string NMD::UALWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASDM(uint64 instruction)
+std::string NMD::UASDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16372,7 +16371,7 @@ std::string NMD::UASDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASH(uint64 instruction)
+std::string NMD::UASH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16396,7 +16395,7 @@ std::string NMD::UASH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UASWM(uint64 instruction)
+std::string NMD::UASWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16422,7 +16421,7 @@ std::string NMD::UASWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::UDI(uint64 instruction)
+std::string NMD::UDI(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
@@ -16440,7 +16439,7 @@ std::string NMD::UDI(uint64 instruction)
  *  001000          1100001101111111
  *   code ----------
  */
-std::string NMD::WAIT(uint64 instruction)
+std::string NMD::WAIT(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
@@ -16460,7 +16459,7 @@ std::string NMD::WAIT(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-std::string NMD::WRDSP(uint64 instruction)
+std::string NMD::WRDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
@@ -16482,7 +16481,7 @@ std::string NMD::WRDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::WRPGPR(uint64 instruction)
+std::string NMD::WRPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16504,7 +16503,7 @@ std::string NMD::WRPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_16_(uint64 instruction)
+std::string NMD::XOR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
@@ -16526,7 +16525,7 @@ std::string NMD::XOR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XOR_32_(uint64 instruction)
+std::string NMD::XOR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16550,7 +16549,7 @@ std::string NMD::XOR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-std::string NMD::XORI(uint64 instruction)
+std::string NMD::XORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -16573,7 +16572,7 @@ std::string NMD::XORI(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-std::string NMD::YIELD(uint64 instruction)
+std::string NMD::YIELD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
diff --git a/disas/nanomips.h b/disas/nanomips.h
index f65a0957b8..4f9ac4b9ab 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -65,21 +65,13 @@ class NMD
 {
 public:
 
-    NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
-        : m_pc(pc)
-        , m_requested_instruction_categories(requested_instruction_categories)
-    {
-    }
-
     int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type);
+                    TABLE_ENTRY_TYPE & type, img_address m_pc);
 
 private:
 
-    img_address           m_pc;
-    TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
-
-    typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
+    typedef std::string(NMD:: *disassembly_function)(uint64 instruction,
+                                                     img_address m_pc);
     typedef bool(NMD:: *conditional_function)(uint64 instruction);
 
     struct Pool {
@@ -96,7 +88,8 @@ private:
 
     uint64 extract_op_code_value(const uint16 *data, int size);
     int Disassemble(const uint16 *data, std::string & dis,
-                    TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
+                    TABLE_ENTRY_TYPE & type, const Pool *table,
+                    int table_size, img_address m_pc);
 
     uint64 renumber_registers(uint64 index, uint64 *register_list,
                               size_t register_list_size);
@@ -137,7 +130,7 @@ private:
     std::string IMMEDIATE(uint64 value);
     std::string IMMEDIATE(int64 value);
     std::string CPR(uint64 reg);
-    std::string ADDRESS(uint64 value, int instruction_size);
+    std::string ADDRESS(uint64 value, int instruction_size, img_address m_pc);
 
     int64 extract_s__se3_4_2_1_0(uint64 instruction);
     int64 extract_s__se7_0_6_5_4_3_2_1_s1(uint64 instruction);
@@ -253,642 +246,642 @@ private:
     bool PREFE_cond(uint64 instruction);
     bool SLTU_cond(uint64 instruction);
 
-    std::string ABS_D(uint64 instruction);
-    std::string ABS_S(uint64 instruction);
-    std::string ABSQ_S_PH(uint64 instruction);
-    std::string ABSQ_S_QB(uint64 instruction);
-    std::string ABSQ_S_W(uint64 instruction);
-    std::string ACLR(uint64 instruction);
-    std::string ADD(uint64 instruction);
-    std::string ADD_D(uint64 instruction);
-    std::string ADD_S(uint64 instruction);
-    std::string ADDIU_32_(uint64 instruction);
-    std::string ADDIU_48_(uint64 instruction);
-    std::string ADDIU_GP48_(uint64 instruction);
-    std::string ADDIU_GP_B_(uint64 instruction);
-    std::string ADDIU_GP_W_(uint64 instruction);
-    std::string ADDIU_NEG_(uint64 instruction);
-    std::string ADDIU_R1_SP_(uint64 instruction);
-    std::string ADDIU_R2_(uint64 instruction);
-    std::string ADDIU_RS5_(uint64 instruction);
-    std::string ADDIUPC_32_(uint64 instruction);
-    std::string ADDIUPC_48_(uint64 instruction);
-    std::string ADDQ_PH(uint64 instruction);
-    std::string ADDQ_S_PH(uint64 instruction);
-    std::string ADDQ_S_W(uint64 instruction);
-    std::string ADDQH_PH(uint64 instruction);
-    std::string ADDQH_R_PH(uint64 instruction);
-    std::string ADDQH_R_W(uint64 instruction);
-    std::string ADDQH_W(uint64 instruction);
-    std::string ADDSC(uint64 instruction);
-    std::string ADDU_16_(uint64 instruction);
-    std::string ADDU_32_(uint64 instruction);
-    std::string ADDU_4X4_(uint64 instruction);
-    std::string ADDU_PH(uint64 instruction);
-    std::string ADDU_QB(uint64 instruction);
-    std::string ADDU_S_PH(uint64 instruction);
-    std::string ADDU_S_QB(uint64 instruction);
-    std::string ADDUH_QB(uint64 instruction);
-    std::string ADDUH_R_QB(uint64 instruction);
-    std::string ADDWC(uint64 instruction);
-    std::string ALUIPC(uint64 instruction);
-    std::string AND_16_(uint64 instruction);
-    std::string AND_32_(uint64 instruction);
-    std::string ANDI_16_(uint64 instruction);
-    std::string ANDI_32_(uint64 instruction);
-    std::string APPEND(uint64 instruction);
-    std::string ASET(uint64 instruction);
-    std::string BALC_16_(uint64 instruction);
-    std::string BALC_32_(uint64 instruction);
-    std::string BALRSC(uint64 instruction);
-    std::string BBEQZC(uint64 instruction);
-    std::string BBNEZC(uint64 instruction);
-    std::string BC_16_(uint64 instruction);
-    std::string BC_32_(uint64 instruction);
-    std::string BC1EQZC(uint64 instruction);
-    std::string BC1NEZC(uint64 instruction);
-    std::string BC2EQZC(uint64 instruction);
-    std::string BC2NEZC(uint64 instruction);
-    std::string BEQC_16_(uint64 instruction);
-    std::string BEQC_32_(uint64 instruction);
-    std::string BEQIC(uint64 instruction);
-    std::string BEQZC_16_(uint64 instruction);
-    std::string BGEC(uint64 instruction);
-    std::string BGEIC(uint64 instruction);
-    std::string BGEIUC(uint64 instruction);
-    std::string BGEUC(uint64 instruction);
-    std::string BLTC(uint64 instruction);
-    std::string BLTIC(uint64 instruction);
-    std::string BLTIUC(uint64 instruction);
-    std::string BLTUC(uint64 instruction);
-    std::string BNEC_16_(uint64 instruction);
-    std::string BNEC_32_(uint64 instruction);
-    std::string BNEIC(uint64 instruction);
-    std::string BNEZC_16_(uint64 instruction);
-    std::string BPOSGE32C(uint64 instruction);
-    std::string BREAK_16_(uint64 instruction);
-    std::string BREAK_32_(uint64 instruction);
-    std::string BRSC(uint64 instruction);
-    std::string CACHE(uint64 instruction);
-    std::string CACHEE(uint64 instruction);
-    std::string CEIL_L_D(uint64 instruction);
-    std::string CEIL_L_S(uint64 instruction);
-    std::string CEIL_W_D(uint64 instruction);
-    std::string CEIL_W_S(uint64 instruction);
-    std::string CFC1(uint64 instruction);
-    std::string CFC2(uint64 instruction);
-    std::string CLASS_D(uint64 instruction);
-    std::string CLASS_S(uint64 instruction);
-    std::string CLO(uint64 instruction);
-    std::string CLZ(uint64 instruction);
-    std::string CMP_AF_D(uint64 instruction);
-    std::string CMP_AF_S(uint64 instruction);
-    std::string CMP_EQ_D(uint64 instruction);
-    std::string CMP_EQ_PH(uint64 instruction);
-    std::string CMP_EQ_S(uint64 instruction);
-    std::string CMP_LE_D(uint64 instruction);
-    std::string CMP_LE_PH(uint64 instruction);
-    std::string CMP_LE_S(uint64 instruction);
-    std::string CMP_LT_D(uint64 instruction);
-    std::string CMP_LT_PH(uint64 instruction);
-    std::string CMP_LT_S(uint64 instruction);
-    std::string CMP_NE_D(uint64 instruction);
-    std::string CMP_NE_S(uint64 instruction);
-    std::string CMP_OR_D(uint64 instruction);
-    std::string CMP_OR_S(uint64 instruction);
-    std::string CMP_SAF_D(uint64 instruction);
-    std::string CMP_SAF_S(uint64 instruction);
-    std::string CMP_SEQ_D(uint64 instruction);
-    std::string CMP_SEQ_S(uint64 instruction);
-    std::string CMP_SLE_D(uint64 instruction);
-    std::string CMP_SLE_S(uint64 instruction);
-    std::string CMP_SLT_D(uint64 instruction);
-    std::string CMP_SLT_S(uint64 instruction);
-    std::string CMP_SNE_D(uint64 instruction);
-    std::string CMP_SNE_S(uint64 instruction);
-    std::string CMP_SOR_D(uint64 instruction);
-    std::string CMP_SOR_S(uint64 instruction);
-    std::string CMP_SUEQ_D(uint64 instruction);
-    std::string CMP_SUEQ_S(uint64 instruction);
-    std::string CMP_SULE_D(uint64 instruction);
-    std::string CMP_SULE_S(uint64 instruction);
-    std::string CMP_SULT_D(uint64 instruction);
-    std::string CMP_SULT_S(uint64 instruction);
-    std::string CMP_SUN_D(uint64 instruction);
-    std::string CMP_SUN_S(uint64 instruction);
-    std::string CMP_SUNE_D(uint64 instruction);
-    std::string CMP_SUNE_S(uint64 instruction);
-    std::string CMP_UEQ_D(uint64 instruction);
-    std::string CMP_UEQ_S(uint64 instruction);
-    std::string CMP_ULE_D(uint64 instruction);
-    std::string CMP_ULE_S(uint64 instruction);
-    std::string CMP_ULT_D(uint64 instruction);
-    std::string CMP_ULT_S(uint64 instruction);
-    std::string CMP_UN_D(uint64 instruction);
-    std::string CMP_UN_S(uint64 instruction);
-    std::string CMP_UNE_D(uint64 instruction);
-    std::string CMP_UNE_S(uint64 instruction);
-    std::string CMPGDU_EQ_QB(uint64 instruction);
-    std::string CMPGDU_LE_QB(uint64 instruction);
-    std::string CMPGDU_LT_QB(uint64 instruction);
-    std::string CMPGU_EQ_QB(uint64 instruction);
-    std::string CMPGU_LE_QB(uint64 instruction);
-    std::string CMPGU_LT_QB(uint64 instruction);
-    std::string CMPU_EQ_QB(uint64 instruction);
-    std::string CMPU_LE_QB(uint64 instruction);
-    std::string CMPU_LT_QB(uint64 instruction);
-    std::string COP2_1(uint64 instruction);
-    std::string CTC1(uint64 instruction);
-    std::string CTC2(uint64 instruction);
-    std::string CVT_D_L(uint64 instruction);
-    std::string CVT_D_S(uint64 instruction);
-    std::string CVT_D_W(uint64 instruction);
-    std::string CVT_L_D(uint64 instruction);
-    std::string CVT_L_S(uint64 instruction);
-    std::string CVT_S_D(uint64 instruction);
-    std::string CVT_S_L(uint64 instruction);
-    std::string CVT_S_PL(uint64 instruction);
-    std::string CVT_S_PU(uint64 instruction);
-    std::string CVT_S_W(uint64 instruction);
-    std::string CVT_W_D(uint64 instruction);
-    std::string CVT_W_S(uint64 instruction);
-    std::string DADDIU_48_(uint64 instruction);
-    std::string DADDIU_NEG_(uint64 instruction);
-    std::string DADDIU_U12_(uint64 instruction);
-    std::string DADD(uint64 instruction);
-    std::string DADDU(uint64 instruction);
-    std::string DCLO(uint64 instruction);
-    std::string DCLZ(uint64 instruction);
-    std::string DDIV(uint64 instruction);
-    std::string DDIVU(uint64 instruction);
-    std::string DERET(uint64 instruction);
-    std::string DEXTM(uint64 instruction);
-    std::string DEXT(uint64 instruction);
-    std::string DEXTU(uint64 instruction);
-    std::string DINSM(uint64 instruction);
-    std::string DINS(uint64 instruction);
-    std::string DINSU(uint64 instruction);
-    std::string DI(uint64 instruction);
-    std::string DIV(uint64 instruction);
-    std::string DIV_D(uint64 instruction);
-    std::string DIV_S(uint64 instruction);
-    std::string DIVU(uint64 instruction);
-    std::string DLSA(uint64 instruction);
-    std::string DLUI_48_(uint64 instruction);
-    std::string DMFC0(uint64 instruction);
-    std::string DMFC1(uint64 instruction);
-    std::string DMFC2(uint64 instruction);
-    std::string DMFGC0(uint64 instruction);
-    std::string DMOD(uint64 instruction);
-    std::string DMODU(uint64 instruction);
-    std::string DMTC0(uint64 instruction);
-    std::string DMTC1(uint64 instruction);
-    std::string DMTC2(uint64 instruction);
-    std::string DMTGC0(uint64 instruction);
-    std::string DMT(uint64 instruction);
-    std::string DMUH(uint64 instruction);
-    std::string DMUHU(uint64 instruction);
-    std::string DMUL(uint64 instruction);
-    std::string DMULU(uint64 instruction);
-    std::string DPAQ_S_W_PH(uint64 instruction);
-    std::string DPAQ_SA_L_W(uint64 instruction);
-    std::string DPAQX_S_W_PH(uint64 instruction);
-    std::string DPAQX_SA_W_PH(uint64 instruction);
-    std::string DPAU_H_QBL(uint64 instruction);
-    std::string DPAU_H_QBR(uint64 instruction);
-    std::string DPA_W_PH(uint64 instruction);
-    std::string DPAX_W_PH(uint64 instruction);
-    std::string DPS_W_PH(uint64 instruction);
-    std::string DPSQ_SA_L_W(uint64 instruction);
-    std::string DPSQ_S_W_PH(uint64 instruction);
-    std::string DPSQX_SA_W_PH(uint64 instruction);
-    std::string DPSQX_S_W_PH(uint64 instruction);
-    std::string DPSU_H_QBL(uint64 instruction);
-    std::string DPSU_H_QBR(uint64 instruction);
-    std::string DPSX_W_PH(uint64 instruction);
-    std::string DROTR(uint64 instruction);
-    std::string DROTR32(uint64 instruction);
-    std::string DROTRV(uint64 instruction);
-    std::string DROTX(uint64 instruction);
-    std::string DSLL(uint64 instruction);
-    std::string DSLL32(uint64 instruction);
-    std::string DSLLV(uint64 instruction);
-    std::string DSRA(uint64 instruction);
-    std::string DSRA32(uint64 instruction);
-    std::string DSRAV(uint64 instruction);
-    std::string DSRL32(uint64 instruction);
-    std::string DSRL(uint64 instruction);
-    std::string DSRLV(uint64 instruction);
-    std::string DSUB(uint64 instruction);
-    std::string DSUBU(uint64 instruction);
-    std::string DVP(uint64 instruction);
-    std::string DVPE(uint64 instruction);
-    std::string EHB(uint64 instruction);
-    std::string EI(uint64 instruction);
-    std::string EMT(uint64 instruction);
-    std::string ERET(uint64 instruction);
-    std::string ERETNC(uint64 instruction);
-    std::string EVP(uint64 instruction);
-    std::string EVPE(uint64 instruction);
-    std::string EXT(uint64 instruction);
-    std::string EXTD(uint64 instruction);
-    std::string EXTD32(uint64 instruction);
-    std::string EXTP(uint64 instruction);
-    std::string EXTPDP(uint64 instruction);
-    std::string EXTPDPV(uint64 instruction);
-    std::string EXTPV(uint64 instruction);
-    std::string EXTR_RS_W(uint64 instruction);
-    std::string EXTR_R_W(uint64 instruction);
-    std::string EXTR_S_H(uint64 instruction);
-    std::string EXTR_W(uint64 instruction);
-    std::string EXTRV_R_W(uint64 instruction);
-    std::string EXTRV_RS_W(uint64 instruction);
-    std::string EXTRV_S_H(uint64 instruction);
-    std::string EXTRV_W(uint64 instruction);
-    std::string EXTW(uint64 instruction);
-    std::string FLOOR_L_D(uint64 instruction);
-    std::string FLOOR_L_S(uint64 instruction);
-    std::string FLOOR_W_D(uint64 instruction);
-    std::string FLOOR_W_S(uint64 instruction);
-    std::string FORK(uint64 instruction);
-    std::string HYPCALL(uint64 instruction);
-    std::string HYPCALL_16_(uint64 instruction);
-    std::string INS(uint64 instruction);
-    std::string INSV(uint64 instruction);
-    std::string IRET(uint64 instruction);
-    std::string JALRC_16_(uint64 instruction);
-    std::string JALRC_32_(uint64 instruction);
-    std::string JALRC_HB(uint64 instruction);
-    std::string JRC(uint64 instruction);
-    std::string LB_16_(uint64 instruction);
-    std::string LB_GP_(uint64 instruction);
-    std::string LB_S9_(uint64 instruction);
-    std::string LB_U12_(uint64 instruction);
-    std::string LBE(uint64 instruction);
-    std::string LBU_16_(uint64 instruction);
-    std::string LBU_GP_(uint64 instruction);
-    std::string LBU_S9_(uint64 instruction);
-    std::string LBU_U12_(uint64 instruction);
-    std::string LBUE(uint64 instruction);
-    std::string LBUX(uint64 instruction);
-    std::string LBX(uint64 instruction);
-    std::string LD_GP_(uint64 instruction);
-    std::string LD_S9_(uint64 instruction);
-    std::string LD_U12_(uint64 instruction);
-    std::string LDC1_GP_(uint64 instruction);
-    std::string LDC1_S9_(uint64 instruction);
-    std::string LDC1_U12_(uint64 instruction);
-    std::string LDC1X(uint64 instruction);
-    std::string LDC1XS(uint64 instruction);
-    std::string LDC2(uint64 instruction);
-    std::string LDM(uint64 instruction);
-    std::string LDPC_48_(uint64 instruction);
-    std::string LDX(uint64 instruction);
-    std::string LDXS(uint64 instruction);
-    std::string LH_16_(uint64 instruction);
-    std::string LH_GP_(uint64 instruction);
-    std::string LH_S9_(uint64 instruction);
-    std::string LH_U12_(uint64 instruction);
-    std::string LHE(uint64 instruction);
-    std::string LHU_16_(uint64 instruction);
-    std::string LHU_GP_(uint64 instruction);
-    std::string LHU_S9_(uint64 instruction);
-    std::string LHU_U12_(uint64 instruction);
-    std::string LHUE(uint64 instruction);
-    std::string LHUX(uint64 instruction);
-    std::string LHUXS(uint64 instruction);
-    std::string LHX(uint64 instruction);
-    std::string LHXS(uint64 instruction);
-    std::string LI_16_(uint64 instruction);
-    std::string LI_48_(uint64 instruction);
-    std::string LL(uint64 instruction);
-    std::string LLD(uint64 instruction);
-    std::string LLDP(uint64 instruction);
-    std::string LLE(uint64 instruction);
-    std::string LLWP(uint64 instruction);
-    std::string LLWPE(uint64 instruction);
-    std::string LSA(uint64 instruction);
-    std::string LUI(uint64 instruction);
-    std::string LW_16_(uint64 instruction);
-    std::string LW_4X4_(uint64 instruction);
-    std::string LWC1_GP_(uint64 instruction);
-    std::string LWC1_S9_(uint64 instruction);
-    std::string LWC1_U12_(uint64 instruction);
-    std::string LWC1X(uint64 instruction);
-    std::string LWC1XS(uint64 instruction);
-    std::string LWC2(uint64 instruction);
-    std::string LWE(uint64 instruction);
-    std::string LW_GP_(uint64 instruction);
-    std::string LW_GP16_(uint64 instruction);
-    std::string LWM(uint64 instruction);
-    std::string LWPC_48_(uint64 instruction);
-    std::string LW_S9_(uint64 instruction);
-    std::string LW_SP_(uint64 instruction);
-    std::string LW_U12_(uint64 instruction);
-    std::string LWU_GP_(uint64 instruction);
-    std::string LWU_S9_(uint64 instruction);
-    std::string LWU_U12_(uint64 instruction);
-    std::string LWUX(uint64 instruction);
-    std::string LWUXS(uint64 instruction);
-    std::string LWX(uint64 instruction);
-    std::string LWXS_16_(uint64 instruction);
-    std::string LWXS_32_(uint64 instruction);
-    std::string MADD_DSP_(uint64 instruction);
-    std::string MADDF_D(uint64 instruction);
-    std::string MADDF_S(uint64 instruction);
-    std::string MADDU_DSP_(uint64 instruction);
-    std::string MAQ_S_W_PHL(uint64 instruction);
-    std::string MAQ_S_W_PHR(uint64 instruction);
-    std::string MAQ_SA_W_PHL(uint64 instruction);
-    std::string MAQ_SA_W_PHR(uint64 instruction);
-    std::string MAX_D(uint64 instruction);
-    std::string MAX_S(uint64 instruction);
-    std::string MAXA_D(uint64 instruction);
-    std::string MAXA_S(uint64 instruction);
-    std::string MFC0(uint64 instruction);
-    std::string MFC1(uint64 instruction);
-    std::string MFC2(uint64 instruction);
-    std::string MFGC0(uint64 instruction);
-    std::string MFHC0(uint64 instruction);
-    std::string MFHC1(uint64 instruction);
-    std::string MFHC2(uint64 instruction);
-    std::string MFHGC0(uint64 instruction);
-    std::string MFHI_DSP_(uint64 instruction);
-    std::string MFHTR(uint64 instruction);
-    std::string MFLO_DSP_(uint64 instruction);
-    std::string MFTR(uint64 instruction);
-    std::string MIN_D(uint64 instruction);
-    std::string MIN_S(uint64 instruction);
-    std::string MINA_D(uint64 instruction);
-    std::string MINA_S(uint64 instruction);
-    std::string MOD(uint64 instruction);
-    std::string MODSUB(uint64 instruction);
-    std::string MODU(uint64 instruction);
-    std::string MOV_D(uint64 instruction);
-    std::string MOV_S(uint64 instruction);
-    std::string MOVE_BALC(uint64 instruction);
-    std::string MOVEP(uint64 instruction);
-    std::string MOVEP_REV_(uint64 instruction);
-    std::string MOVE(uint64 instruction);
-    std::string MOVN(uint64 instruction);
-    std::string MOVZ(uint64 instruction);
-    std::string MSUB_DSP_(uint64 instruction);
-    std::string MSUBF_D(uint64 instruction);
-    std::string MSUBF_S(uint64 instruction);
-    std::string MSUBU_DSP_(uint64 instruction);
-    std::string MTC0(uint64 instruction);
-    std::string MTC1(uint64 instruction);
-    std::string MTC2(uint64 instruction);
-    std::string MTGC0(uint64 instruction);
-    std::string MTHC0(uint64 instruction);
-    std::string MTHC1(uint64 instruction);
-    std::string MTHC2(uint64 instruction);
-    std::string MTHGC0(uint64 instruction);
-    std::string MTHI_DSP_(uint64 instruction);
-    std::string MTHLIP(uint64 instruction);
-    std::string MTHTR(uint64 instruction);
-    std::string MTLO_DSP_(uint64 instruction);
-    std::string MTTR(uint64 instruction);
-    std::string MUH(uint64 instruction);
-    std::string MUHU(uint64 instruction);
-    std::string MUL_32_(uint64 instruction);
-    std::string MUL_4X4_(uint64 instruction);
-    std::string MUL_D(uint64 instruction);
-    std::string MUL_PH(uint64 instruction);
-    std::string MUL_S(uint64 instruction);
-    std::string MUL_S_PH(uint64 instruction);
-    std::string MULEQ_S_W_PHL(uint64 instruction);
-    std::string MULEQ_S_W_PHR(uint64 instruction);
-    std::string MULEU_S_PH_QBL(uint64 instruction);
-    std::string MULEU_S_PH_QBR(uint64 instruction);
-    std::string MULQ_RS_PH(uint64 instruction);
-    std::string MULQ_RS_W(uint64 instruction);
-    std::string MULQ_S_PH(uint64 instruction);
-    std::string MULQ_S_W(uint64 instruction);
-    std::string MULSA_W_PH(uint64 instruction);
-    std::string MULSAQ_S_W_PH(uint64 instruction);
-    std::string MULT_DSP_(uint64 instruction);
-    std::string MULTU_DSP_(uint64 instruction);
-    std::string MULU(uint64 instruction);
-    std::string NEG_D(uint64 instruction);
-    std::string NEG_S(uint64 instruction);
-    std::string NOP_16_(uint64 instruction);
-    std::string NOP_32_(uint64 instruction);
-    std::string NOR(uint64 instruction);
-    std::string NOT_16_(uint64 instruction);
-    std::string OR_16_(uint64 instruction);
-    std::string OR_32_(uint64 instruction);
-    std::string ORI(uint64 instruction);
-    std::string PACKRL_PH(uint64 instruction);
-    std::string PAUSE(uint64 instruction);
-    std::string PICK_PH(uint64 instruction);
-    std::string PICK_QB(uint64 instruction);
-    std::string PRECEQ_W_PHL(uint64 instruction);
-    std::string PRECEQ_W_PHR(uint64 instruction);
-    std::string PRECEQU_PH_QBL(uint64 instruction);
-    std::string PRECEQU_PH_QBLA(uint64 instruction);
-    std::string PRECEQU_PH_QBR(uint64 instruction);
-    std::string PRECEQU_PH_QBRA(uint64 instruction);
-    std::string PRECEU_PH_QBL(uint64 instruction);
-    std::string PRECEU_PH_QBLA(uint64 instruction);
-    std::string PRECEU_PH_QBR(uint64 instruction);
-    std::string PRECEU_PH_QBRA(uint64 instruction);
-    std::string PRECR_QB_PH(uint64 instruction);
-    std::string PRECR_SRA_PH_W(uint64 instruction);
-    std::string PRECR_SRA_R_PH_W(uint64 instruction);
-    std::string PRECRQ_PH_W(uint64 instruction);
-    std::string PRECRQ_QB_PH(uint64 instruction);
-    std::string PRECRQ_RS_PH_W(uint64 instruction);
-    std::string PRECRQU_S_QB_PH(uint64 instruction);
-    std::string PREF_S9_(uint64 instruction);
-    std::string PREF_U12_(uint64 instruction);
-    std::string PREFE(uint64 instruction);
-    std::string PREPEND(uint64 instruction);
-    std::string RADDU_W_QB(uint64 instruction);
-    std::string RDDSP(uint64 instruction);
-    std::string RDHWR(uint64 instruction);
-    std::string RDPGPR(uint64 instruction);
-    std::string RECIP_D(uint64 instruction);
-    std::string RECIP_S(uint64 instruction);
-    std::string REPL_PH(uint64 instruction);
-    std::string REPL_QB(uint64 instruction);
-    std::string REPLV_PH(uint64 instruction);
-    std::string REPLV_QB(uint64 instruction);
-    std::string RESTORE_32_(uint64 instruction);
-    std::string RESTORE_JRC_16_(uint64 instruction);
-    std::string RESTORE_JRC_32_(uint64 instruction);
-    std::string RESTOREF(uint64 instruction);
-    std::string RINT_D(uint64 instruction);
-    std::string RINT_S(uint64 instruction);
-    std::string ROTR(uint64 instruction);
-    std::string ROTRV(uint64 instruction);
-    std::string ROTX(uint64 instruction);
-    std::string ROUND_L_D(uint64 instruction);
-    std::string ROUND_L_S(uint64 instruction);
-    std::string ROUND_W_D(uint64 instruction);
-    std::string ROUND_W_S(uint64 instruction);
-    std::string RSQRT_D(uint64 instruction);
-    std::string RSQRT_S(uint64 instruction);
-    std::string SAVE_16_(uint64 instruction);
-    std::string SAVE_32_(uint64 instruction);
-    std::string SAVEF(uint64 instruction);
-    std::string SB_16_(uint64 instruction);
-    std::string SB_GP_(uint64 instruction);
-    std::string SB_S9_(uint64 instruction);
-    std::string SB_U12_(uint64 instruction);
-    std::string SBE(uint64 instruction);
-    std::string SBX(uint64 instruction);
-    std::string SC(uint64 instruction);
-    std::string SCD(uint64 instruction);
-    std::string SCDP(uint64 instruction);
-    std::string SCE(uint64 instruction);
-    std::string SCWP(uint64 instruction);
-    std::string SCWPE(uint64 instruction);
-    std::string SD_GP_(uint64 instruction);
-    std::string SD_S9_(uint64 instruction);
-    std::string SD_U12_(uint64 instruction);
-    std::string SDBBP_16_(uint64 instruction);
-    std::string SDBBP_32_(uint64 instruction);
-    std::string SDC1_GP_(uint64 instruction);
-    std::string SDC1_S9_(uint64 instruction);
-    std::string SDC1_U12_(uint64 instruction);
-    std::string SDC1X(uint64 instruction);
-    std::string SDC1XS(uint64 instruction);
-    std::string SDC2(uint64 instruction);
-    std::string SDM(uint64 instruction);
-    std::string SDPC_48_(uint64 instruction);
-    std::string SDX(uint64 instruction);
-    std::string SDXS(uint64 instruction);
-    std::string SEB(uint64 instruction);
-    std::string SEH(uint64 instruction);
-    std::string SEL_D(uint64 instruction);
-    std::string SEL_S(uint64 instruction);
-    std::string SELEQZ_D(uint64 instruction);
-    std::string SELEQZ_S(uint64 instruction);
-    std::string SELNEZ_D(uint64 instruction);
-    std::string SELNEZ_S(uint64 instruction);
-    std::string SEQI(uint64 instruction);
-    std::string SH_16_(uint64 instruction);
-    std::string SH_GP_(uint64 instruction);
-    std::string SH_S9_(uint64 instruction);
-    std::string SH_U12_(uint64 instruction);
-    std::string SHE(uint64 instruction);
-    std::string SHILO(uint64 instruction);
-    std::string SHILOV(uint64 instruction);
-    std::string SHLL_PH(uint64 instruction);
-    std::string SHLL_QB(uint64 instruction);
-    std::string SHLL_S_PH(uint64 instruction);
-    std::string SHLL_S_W(uint64 instruction);
-    std::string SHLLV_PH(uint64 instruction);
-    std::string SHLLV_QB(uint64 instruction);
-    std::string SHLLV_S_PH(uint64 instruction);
-    std::string SHLLV_S_W(uint64 instruction);
-    std::string SHRA_PH(uint64 instruction);
-    std::string SHRA_QB(uint64 instruction);
-    std::string SHRA_R_PH(uint64 instruction);
-    std::string SHRA_R_QB(uint64 instruction);
-    std::string SHRA_R_W(uint64 instruction);
-    std::string SHRAV_PH(uint64 instruction);
-    std::string SHRAV_QB(uint64 instruction);
-    std::string SHRAV_R_PH(uint64 instruction);
-    std::string SHRAV_R_QB(uint64 instruction);
-    std::string SHRAV_R_W(uint64 instruction);
-    std::string SHRL_PH(uint64 instruction);
-    std::string SHRL_QB(uint64 instruction);
-    std::string SHRLV_PH(uint64 instruction);
-    std::string SHRLV_QB(uint64 instruction);
-    std::string SHX(uint64 instruction);
-    std::string SHXS(uint64 instruction);
-    std::string SIGRIE(uint64 instruction);
-    std::string SLL_16_(uint64 instruction);
-    std::string SLL_32_(uint64 instruction);
-    std::string SLLV(uint64 instruction);
-    std::string SLT(uint64 instruction);
-    std::string SLTI(uint64 instruction);
-    std::string SLTIU(uint64 instruction);
-    std::string SLTU(uint64 instruction);
-    std::string SOV(uint64 instruction);
-    std::string SPECIAL2(uint64 instruction);
-    std::string SQRT_D(uint64 instruction);
-    std::string SQRT_S(uint64 instruction);
-    std::string SRA(uint64 instruction);
-    std::string SRAV(uint64 instruction);
-    std::string SRL_16_(uint64 instruction);
-    std::string SRL_32_(uint64 instruction);
-    std::string SRLV(uint64 instruction);
-    std::string SUB(uint64 instruction);
-    std::string SUB_D(uint64 instruction);
-    std::string SUB_S(uint64 instruction);
-    std::string SUBQ_PH(uint64 instruction);
-    std::string SUBQ_S_PH(uint64 instruction);
-    std::string SUBQ_S_W(uint64 instruction);
-    std::string SUBQH_PH(uint64 instruction);
-    std::string SUBQH_R_PH(uint64 instruction);
-    std::string SUBQH_R_W(uint64 instruction);
-    std::string SUBQH_W(uint64 instruction);
-    std::string SUBU_16_(uint64 instruction);
-    std::string SUBU_32_(uint64 instruction);
-    std::string SUBU_PH(uint64 instruction);
-    std::string SUBU_QB(uint64 instruction);
-    std::string SUBU_S_PH(uint64 instruction);
-    std::string SUBU_S_QB(uint64 instruction);
-    std::string SUBUH_QB(uint64 instruction);
-    std::string SUBUH_R_QB(uint64 instruction);
-    std::string SW_16_(uint64 instruction);
-    std::string SW_4X4_(uint64 instruction);
-    std::string SW_GP16_(uint64 instruction);
-    std::string SW_GP_(uint64 instruction);
-    std::string SW_S9_(uint64 instruction);
-    std::string SW_SP_(uint64 instruction);
-    std::string SW_U12_(uint64 instruction);
-    std::string SWC1_GP_(uint64 instruction);
-    std::string SWC1_S9_(uint64 instruction);
-    std::string SWC1_U12_(uint64 instruction);
-    std::string SWC1X(uint64 instruction);
-    std::string SWC1XS(uint64 instruction);
-    std::string SWC2(uint64 instruction);
-    std::string SWE(uint64 instruction);
-    std::string SWM(uint64 instruction);
-    std::string SWPC_48_(uint64 instruction);
-    std::string SWX(uint64 instruction);
-    std::string SWXS(uint64 instruction);
-    std::string SYNC(uint64 instruction);
-    std::string SYNCI(uint64 instruction);
-    std::string SYNCIE(uint64 instruction);
-    std::string SYSCALL_16_(uint64 instruction);
-    std::string SYSCALL_32_(uint64 instruction);
-    std::string TEQ(uint64 instruction);
-    std::string TLBGINV(uint64 instruction);
-    std::string TLBGINVF(uint64 instruction);
-    std::string TLBGP(uint64 instruction);
-    std::string TLBGR(uint64 instruction);
-    std::string TLBGWI(uint64 instruction);
-    std::string TLBGWR(uint64 instruction);
-    std::string TLBINV(uint64 instruction);
-    std::string TLBINVF(uint64 instruction);
-    std::string TLBP(uint64 instruction);
-    std::string TLBR(uint64 instruction);
-    std::string TLBWI(uint64 instruction);
-    std::string TLBWR(uint64 instruction);
-    std::string TNE(uint64 instruction);
-    std::string TRUNC_L_D(uint64 instruction);
-    std::string TRUNC_L_S(uint64 instruction);
-    std::string TRUNC_W_D(uint64 instruction);
-    std::string TRUNC_W_S(uint64 instruction);
-    std::string UALDM(uint64 instruction);
-    std::string UALH(uint64 instruction);
-    std::string UALWM(uint64 instruction);
-    std::string UASDM(uint64 instruction);
-    std::string UASH(uint64 instruction);
-    std::string UASWM(uint64 instruction);
-    std::string UDI(uint64 instruction);
-    std::string WAIT(uint64 instruction);
-    std::string WRDSP(uint64 instruction);
-    std::string WRPGPR(uint64 instruction);
-    std::string XOR_16_(uint64 instruction);
-    std::string XOR_32_(uint64 instruction);
-    std::string XORI(uint64 instruction);
-    std::string YIELD(uint64 instruction);
+    std::string ABS_D(uint64 instruction, img_address m_pc);
+    std::string ABS_S(uint64 instruction, img_address m_pc);
+    std::string ABSQ_S_PH(uint64 instruction, img_address m_pc);
+    std::string ABSQ_S_QB(uint64 instruction, img_address m_pc);
+    std::string ABSQ_S_W(uint64 instruction, img_address m_pc);
+    std::string ACLR(uint64 instruction, img_address m_pc);
+    std::string ADD(uint64 instruction, img_address m_pc);
+    std::string ADD_D(uint64 instruction, img_address m_pc);
+    std::string ADD_S(uint64 instruction, img_address m_pc);
+    std::string ADDIU_32_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_48_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_GP48_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_GP_B_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_GP_W_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_NEG_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_R1_SP_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_R2_(uint64 instruction, img_address m_pc);
+    std::string ADDIU_RS5_(uint64 instruction, img_address m_pc);
+    std::string ADDIUPC_32_(uint64 instruction, img_address m_pc);
+    std::string ADDIUPC_48_(uint64 instruction, img_address m_pc);
+    std::string ADDQ_PH(uint64 instruction, img_address m_pc);
+    std::string ADDQ_S_PH(uint64 instruction, img_address m_pc);
+    std::string ADDQ_S_W(uint64 instruction, img_address m_pc);
+    std::string ADDQH_PH(uint64 instruction, img_address m_pc);
+    std::string ADDQH_R_PH(uint64 instruction, img_address m_pc);
+    std::string ADDQH_R_W(uint64 instruction, img_address m_pc);
+    std::string ADDQH_W(uint64 instruction, img_address m_pc);
+    std::string ADDSC(uint64 instruction, img_address m_pc);
+    std::string ADDU_16_(uint64 instruction, img_address m_pc);
+    std::string ADDU_32_(uint64 instruction, img_address m_pc);
+    std::string ADDU_4X4_(uint64 instruction, img_address m_pc);
+    std::string ADDU_PH(uint64 instruction, img_address m_pc);
+    std::string ADDU_QB(uint64 instruction, img_address m_pc);
+    std::string ADDU_S_PH(uint64 instruction, img_address m_pc);
+    std::string ADDU_S_QB(uint64 instruction, img_address m_pc);
+    std::string ADDUH_QB(uint64 instruction, img_address m_pc);
+    std::string ADDUH_R_QB(uint64 instruction, img_address m_pc);
+    std::string ADDWC(uint64 instruction, img_address m_pc);
+    std::string ALUIPC(uint64 instruction, img_address m_pc);
+    std::string AND_16_(uint64 instruction, img_address m_pc);
+    std::string AND_32_(uint64 instruction, img_address m_pc);
+    std::string ANDI_16_(uint64 instruction, img_address m_pc);
+    std::string ANDI_32_(uint64 instruction, img_address m_pc);
+    std::string APPEND(uint64 instruction, img_address m_pc);
+    std::string ASET(uint64 instruction, img_address m_pc);
+    std::string BALC_16_(uint64 instruction, img_address m_pc);
+    std::string BALC_32_(uint64 instruction, img_address m_pc);
+    std::string BALRSC(uint64 instruction, img_address m_pc);
+    std::string BBEQZC(uint64 instruction, img_address m_pc);
+    std::string BBNEZC(uint64 instruction, img_address m_pc);
+    std::string BC_16_(uint64 instruction, img_address m_pc);
+    std::string BC_32_(uint64 instruction, img_address m_pc);
+    std::string BC1EQZC(uint64 instruction, img_address m_pc);
+    std::string BC1NEZC(uint64 instruction, img_address m_pc);
+    std::string BC2EQZC(uint64 instruction, img_address m_pc);
+    std::string BC2NEZC(uint64 instruction, img_address m_pc);
+    std::string BEQC_16_(uint64 instruction, img_address m_pc);
+    std::string BEQC_32_(uint64 instruction, img_address m_pc);
+    std::string BEQIC(uint64 instruction, img_address m_pc);
+    std::string BEQZC_16_(uint64 instruction, img_address m_pc);
+    std::string BGEC(uint64 instruction, img_address m_pc);
+    std::string BGEIC(uint64 instruction, img_address m_pc);
+    std::string BGEIUC(uint64 instruction, img_address m_pc);
+    std::string BGEUC(uint64 instruction, img_address m_pc);
+    std::string BLTC(uint64 instruction, img_address m_pc);
+    std::string BLTIC(uint64 instruction, img_address m_pc);
+    std::string BLTIUC(uint64 instruction, img_address m_pc);
+    std::string BLTUC(uint64 instruction, img_address m_pc);
+    std::string BNEC_16_(uint64 instruction, img_address m_pc);
+    std::string BNEC_32_(uint64 instruction, img_address m_pc);
+    std::string BNEIC(uint64 instruction, img_address m_pc);
+    std::string BNEZC_16_(uint64 instruction, img_address m_pc);
+    std::string BPOSGE32C(uint64 instruction, img_address m_pc);
+    std::string BREAK_16_(uint64 instruction, img_address m_pc);
+    std::string BREAK_32_(uint64 instruction, img_address m_pc);
+    std::string BRSC(uint64 instruction, img_address m_pc);
+    std::string CACHE(uint64 instruction, img_address m_pc);
+    std::string CACHEE(uint64 instruction, img_address m_pc);
+    std::string CEIL_L_D(uint64 instruction, img_address m_pc);
+    std::string CEIL_L_S(uint64 instruction, img_address m_pc);
+    std::string CEIL_W_D(uint64 instruction, img_address m_pc);
+    std::string CEIL_W_S(uint64 instruction, img_address m_pc);
+    std::string CFC1(uint64 instruction, img_address m_pc);
+    std::string CFC2(uint64 instruction, img_address m_pc);
+    std::string CLASS_D(uint64 instruction, img_address m_pc);
+    std::string CLASS_S(uint64 instruction, img_address m_pc);
+    std::string CLO(uint64 instruction, img_address m_pc);
+    std::string CLZ(uint64 instruction, img_address m_pc);
+    std::string CMP_AF_D(uint64 instruction, img_address m_pc);
+    std::string CMP_AF_S(uint64 instruction, img_address m_pc);
+    std::string CMP_EQ_D(uint64 instruction, img_address m_pc);
+    std::string CMP_EQ_PH(uint64 instruction, img_address m_pc);
+    std::string CMP_EQ_S(uint64 instruction, img_address m_pc);
+    std::string CMP_LE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_LE_PH(uint64 instruction, img_address m_pc);
+    std::string CMP_LE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_LT_D(uint64 instruction, img_address m_pc);
+    std::string CMP_LT_PH(uint64 instruction, img_address m_pc);
+    std::string CMP_LT_S(uint64 instruction, img_address m_pc);
+    std::string CMP_NE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_NE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_OR_D(uint64 instruction, img_address m_pc);
+    std::string CMP_OR_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SAF_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SAF_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SEQ_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SEQ_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SLE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SLE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SLT_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SLT_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SNE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SNE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SOR_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SOR_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SUEQ_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SUEQ_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SULE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SULE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SULT_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SULT_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SUN_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SUN_S(uint64 instruction, img_address m_pc);
+    std::string CMP_SUNE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_SUNE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_UEQ_D(uint64 instruction, img_address m_pc);
+    std::string CMP_UEQ_S(uint64 instruction, img_address m_pc);
+    std::string CMP_ULE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_ULE_S(uint64 instruction, img_address m_pc);
+    std::string CMP_ULT_D(uint64 instruction, img_address m_pc);
+    std::string CMP_ULT_S(uint64 instruction, img_address m_pc);
+    std::string CMP_UN_D(uint64 instruction, img_address m_pc);
+    std::string CMP_UN_S(uint64 instruction, img_address m_pc);
+    std::string CMP_UNE_D(uint64 instruction, img_address m_pc);
+    std::string CMP_UNE_S(uint64 instruction, img_address m_pc);
+    std::string CMPGDU_EQ_QB(uint64 instruction, img_address m_pc);
+    std::string CMPGDU_LE_QB(uint64 instruction, img_address m_pc);
+    std::string CMPGDU_LT_QB(uint64 instruction, img_address m_pc);
+    std::string CMPGU_EQ_QB(uint64 instruction, img_address m_pc);
+    std::string CMPGU_LE_QB(uint64 instruction, img_address m_pc);
+    std::string CMPGU_LT_QB(uint64 instruction, img_address m_pc);
+    std::string CMPU_EQ_QB(uint64 instruction, img_address m_pc);
+    std::string CMPU_LE_QB(uint64 instruction, img_address m_pc);
+    std::string CMPU_LT_QB(uint64 instruction, img_address m_pc);
+    std::string COP2_1(uint64 instruction, img_address m_pc);
+    std::string CTC1(uint64 instruction, img_address m_pc);
+    std::string CTC2(uint64 instruction, img_address m_pc);
+    std::string CVT_D_L(uint64 instruction, img_address m_pc);
+    std::string CVT_D_S(uint64 instruction, img_address m_pc);
+    std::string CVT_D_W(uint64 instruction, img_address m_pc);
+    std::string CVT_L_D(uint64 instruction, img_address m_pc);
+    std::string CVT_L_S(uint64 instruction, img_address m_pc);
+    std::string CVT_S_D(uint64 instruction, img_address m_pc);
+    std::string CVT_S_L(uint64 instruction, img_address m_pc);
+    std::string CVT_S_PL(uint64 instruction, img_address m_pc);
+    std::string CVT_S_PU(uint64 instruction, img_address m_pc);
+    std::string CVT_S_W(uint64 instruction, img_address m_pc);
+    std::string CVT_W_D(uint64 instruction, img_address m_pc);
+    std::string CVT_W_S(uint64 instruction, img_address m_pc);
+    std::string DADDIU_48_(uint64 instruction, img_address m_pc);
+    std::string DADDIU_NEG_(uint64 instruction, img_address m_pc);
+    std::string DADDIU_U12_(uint64 instruction, img_address m_pc);
+    std::string DADD(uint64 instruction, img_address m_pc);
+    std::string DADDU(uint64 instruction, img_address m_pc);
+    std::string DCLO(uint64 instruction, img_address m_pc);
+    std::string DCLZ(uint64 instruction, img_address m_pc);
+    std::string DDIV(uint64 instruction, img_address m_pc);
+    std::string DDIVU(uint64 instruction, img_address m_pc);
+    std::string DERET(uint64 instruction, img_address m_pc);
+    std::string DEXTM(uint64 instruction, img_address m_pc);
+    std::string DEXT(uint64 instruction, img_address m_pc);
+    std::string DEXTU(uint64 instruction, img_address m_pc);
+    std::string DINSM(uint64 instruction, img_address m_pc);
+    std::string DINS(uint64 instruction, img_address m_pc);
+    std::string DINSU(uint64 instruction, img_address m_pc);
+    std::string DI(uint64 instruction, img_address m_pc);
+    std::string DIV(uint64 instruction, img_address m_pc);
+    std::string DIV_D(uint64 instruction, img_address m_pc);
+    std::string DIV_S(uint64 instruction, img_address m_pc);
+    std::string DIVU(uint64 instruction, img_address m_pc);
+    std::string DLSA(uint64 instruction, img_address m_pc);
+    std::string DLUI_48_(uint64 instruction, img_address m_pc);
+    std::string DMFC0(uint64 instruction, img_address m_pc);
+    std::string DMFC1(uint64 instruction, img_address m_pc);
+    std::string DMFC2(uint64 instruction, img_address m_pc);
+    std::string DMFGC0(uint64 instruction, img_address m_pc);
+    std::string DMOD(uint64 instruction, img_address m_pc);
+    std::string DMODU(uint64 instruction, img_address m_pc);
+    std::string DMTC0(uint64 instruction, img_address m_pc);
+    std::string DMTC1(uint64 instruction, img_address m_pc);
+    std::string DMTC2(uint64 instruction, img_address m_pc);
+    std::string DMTGC0(uint64 instruction, img_address m_pc);
+    std::string DMT(uint64 instruction, img_address m_pc);
+    std::string DMUH(uint64 instruction, img_address m_pc);
+    std::string DMUHU(uint64 instruction, img_address m_pc);
+    std::string DMUL(uint64 instruction, img_address m_pc);
+    std::string DMULU(uint64 instruction, img_address m_pc);
+    std::string DPAQ_S_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPAQ_SA_L_W(uint64 instruction, img_address m_pc);
+    std::string DPAQX_S_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPAQX_SA_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPAU_H_QBL(uint64 instruction, img_address m_pc);
+    std::string DPAU_H_QBR(uint64 instruction, img_address m_pc);
+    std::string DPA_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPAX_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPS_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPSQ_SA_L_W(uint64 instruction, img_address m_pc);
+    std::string DPSQ_S_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPSQX_SA_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPSQX_S_W_PH(uint64 instruction, img_address m_pc);
+    std::string DPSU_H_QBL(uint64 instruction, img_address m_pc);
+    std::string DPSU_H_QBR(uint64 instruction, img_address m_pc);
+    std::string DPSX_W_PH(uint64 instruction, img_address m_pc);
+    std::string DROTR(uint64 instruction, img_address m_pc);
+    std::string DROTR32(uint64 instruction, img_address m_pc);
+    std::string DROTRV(uint64 instruction, img_address m_pc);
+    std::string DROTX(uint64 instruction, img_address m_pc);
+    std::string DSLL(uint64 instruction, img_address m_pc);
+    std::string DSLL32(uint64 instruction, img_address m_pc);
+    std::string DSLLV(uint64 instruction, img_address m_pc);
+    std::string DSRA(uint64 instruction, img_address m_pc);
+    std::string DSRA32(uint64 instruction, img_address m_pc);
+    std::string DSRAV(uint64 instruction, img_address m_pc);
+    std::string DSRL32(uint64 instruction, img_address m_pc);
+    std::string DSRL(uint64 instruction, img_address m_pc);
+    std::string DSRLV(uint64 instruction, img_address m_pc);
+    std::string DSUB(uint64 instruction, img_address m_pc);
+    std::string DSUBU(uint64 instruction, img_address m_pc);
+    std::string DVP(uint64 instruction, img_address m_pc);
+    std::string DVPE(uint64 instruction, img_address m_pc);
+    std::string EHB(uint64 instruction, img_address m_pc);
+    std::string EI(uint64 instruction, img_address m_pc);
+    std::string EMT(uint64 instruction, img_address m_pc);
+    std::string ERET(uint64 instruction, img_address m_pc);
+    std::string ERETNC(uint64 instruction, img_address m_pc);
+    std::string EVP(uint64 instruction, img_address m_pc);
+    std::string EVPE(uint64 instruction, img_address m_pc);
+    std::string EXT(uint64 instruction, img_address m_pc);
+    std::string EXTD(uint64 instruction, img_address m_pc);
+    std::string EXTD32(uint64 instruction, img_address m_pc);
+    std::string EXTP(uint64 instruction, img_address m_pc);
+    std::string EXTPDP(uint64 instruction, img_address m_pc);
+    std::string EXTPDPV(uint64 instruction, img_address m_pc);
+    std::string EXTPV(uint64 instruction, img_address m_pc);
+    std::string EXTR_RS_W(uint64 instruction, img_address m_pc);
+    std::string EXTR_R_W(uint64 instruction, img_address m_pc);
+    std::string EXTR_S_H(uint64 instruction, img_address m_pc);
+    std::string EXTR_W(uint64 instruction, img_address m_pc);
+    std::string EXTRV_R_W(uint64 instruction, img_address m_pc);
+    std::string EXTRV_RS_W(uint64 instruction, img_address m_pc);
+    std::string EXTRV_S_H(uint64 instruction, img_address m_pc);
+    std::string EXTRV_W(uint64 instruction, img_address m_pc);
+    std::string EXTW(uint64 instruction, img_address m_pc);
+    std::string FLOOR_L_D(uint64 instruction, img_address m_pc);
+    std::string FLOOR_L_S(uint64 instruction, img_address m_pc);
+    std::string FLOOR_W_D(uint64 instruction, img_address m_pc);
+    std::string FLOOR_W_S(uint64 instruction, img_address m_pc);
+    std::string FORK(uint64 instruction, img_address m_pc);
+    std::string HYPCALL(uint64 instruction, img_address m_pc);
+    std::string HYPCALL_16_(uint64 instruction, img_address m_pc);
+    std::string INS(uint64 instruction, img_address m_pc);
+    std::string INSV(uint64 instruction, img_address m_pc);
+    std::string IRET(uint64 instruction, img_address m_pc);
+    std::string JALRC_16_(uint64 instruction, img_address m_pc);
+    std::string JALRC_32_(uint64 instruction, img_address m_pc);
+    std::string JALRC_HB(uint64 instruction, img_address m_pc);
+    std::string JRC(uint64 instruction, img_address m_pc);
+    std::string LB_16_(uint64 instruction, img_address m_pc);
+    std::string LB_GP_(uint64 instruction, img_address m_pc);
+    std::string LB_S9_(uint64 instruction, img_address m_pc);
+    std::string LB_U12_(uint64 instruction, img_address m_pc);
+    std::string LBE(uint64 instruction, img_address m_pc);
+    std::string LBU_16_(uint64 instruction, img_address m_pc);
+    std::string LBU_GP_(uint64 instruction, img_address m_pc);
+    std::string LBU_S9_(uint64 instruction, img_address m_pc);
+    std::string LBU_U12_(uint64 instruction, img_address m_pc);
+    std::string LBUE(uint64 instruction, img_address m_pc);
+    std::string LBUX(uint64 instruction, img_address m_pc);
+    std::string LBX(uint64 instruction, img_address m_pc);
+    std::string LD_GP_(uint64 instruction, img_address m_pc);
+    std::string LD_S9_(uint64 instruction, img_address m_pc);
+    std::string LD_U12_(uint64 instruction, img_address m_pc);
+    std::string LDC1_GP_(uint64 instruction, img_address m_pc);
+    std::string LDC1_S9_(uint64 instruction, img_address m_pc);
+    std::string LDC1_U12_(uint64 instruction, img_address m_pc);
+    std::string LDC1X(uint64 instruction, img_address m_pc);
+    std::string LDC1XS(uint64 instruction, img_address m_pc);
+    std::string LDC2(uint64 instruction, img_address m_pc);
+    std::string LDM(uint64 instruction, img_address m_pc);
+    std::string LDPC_48_(uint64 instruction, img_address m_pc);
+    std::string LDX(uint64 instruction, img_address m_pc);
+    std::string LDXS(uint64 instruction, img_address m_pc);
+    std::string LH_16_(uint64 instruction, img_address m_pc);
+    std::string LH_GP_(uint64 instruction, img_address m_pc);
+    std::string LH_S9_(uint64 instruction, img_address m_pc);
+    std::string LH_U12_(uint64 instruction, img_address m_pc);
+    std::string LHE(uint64 instruction, img_address m_pc);
+    std::string LHU_16_(uint64 instruction, img_address m_pc);
+    std::string LHU_GP_(uint64 instruction, img_address m_pc);
+    std::string LHU_S9_(uint64 instruction, img_address m_pc);
+    std::string LHU_U12_(uint64 instruction, img_address m_pc);
+    std::string LHUE(uint64 instruction, img_address m_pc);
+    std::string LHUX(uint64 instruction, img_address m_pc);
+    std::string LHUXS(uint64 instruction, img_address m_pc);
+    std::string LHX(uint64 instruction, img_address m_pc);
+    std::string LHXS(uint64 instruction, img_address m_pc);
+    std::string LI_16_(uint64 instruction, img_address m_pc);
+    std::string LI_48_(uint64 instruction, img_address m_pc);
+    std::string LL(uint64 instruction, img_address m_pc);
+    std::string LLD(uint64 instruction, img_address m_pc);
+    std::string LLDP(uint64 instruction, img_address m_pc);
+    std::string LLE(uint64 instruction, img_address m_pc);
+    std::string LLWP(uint64 instruction, img_address m_pc);
+    std::string LLWPE(uint64 instruction, img_address m_pc);
+    std::string LSA(uint64 instruction, img_address m_pc);
+    std::string LUI(uint64 instruction, img_address m_pc);
+    std::string LW_16_(uint64 instruction, img_address m_pc);
+    std::string LW_4X4_(uint64 instruction, img_address m_pc);
+    std::string LWC1_GP_(uint64 instruction, img_address m_pc);
+    std::string LWC1_S9_(uint64 instruction, img_address m_pc);
+    std::string LWC1_U12_(uint64 instruction, img_address m_pc);
+    std::string LWC1X(uint64 instruction, img_address m_pc);
+    std::string LWC1XS(uint64 instruction, img_address m_pc);
+    std::string LWC2(uint64 instruction, img_address m_pc);
+    std::string LWE(uint64 instruction, img_address m_pc);
+    std::string LW_GP_(uint64 instruction, img_address m_pc);
+    std::string LW_GP16_(uint64 instruction, img_address m_pc);
+    std::string LWM(uint64 instruction, img_address m_pc);
+    std::string LWPC_48_(uint64 instruction, img_address m_pc);
+    std::string LW_S9_(uint64 instruction, img_address m_pc);
+    std::string LW_SP_(uint64 instruction, img_address m_pc);
+    std::string LW_U12_(uint64 instruction, img_address m_pc);
+    std::string LWU_GP_(uint64 instruction, img_address m_pc);
+    std::string LWU_S9_(uint64 instruction, img_address m_pc);
+    std::string LWU_U12_(uint64 instruction, img_address m_pc);
+    std::string LWUX(uint64 instruction, img_address m_pc);
+    std::string LWUXS(uint64 instruction, img_address m_pc);
+    std::string LWX(uint64 instruction, img_address m_pc);
+    std::string LWXS_16_(uint64 instruction, img_address m_pc);
+    std::string LWXS_32_(uint64 instruction, img_address m_pc);
+    std::string MADD_DSP_(uint64 instruction, img_address m_pc);
+    std::string MADDF_D(uint64 instruction, img_address m_pc);
+    std::string MADDF_S(uint64 instruction, img_address m_pc);
+    std::string MADDU_DSP_(uint64 instruction, img_address m_pc);
+    std::string MAQ_S_W_PHL(uint64 instruction, img_address m_pc);
+    std::string MAQ_S_W_PHR(uint64 instruction, img_address m_pc);
+    std::string MAQ_SA_W_PHL(uint64 instruction, img_address m_pc);
+    std::string MAQ_SA_W_PHR(uint64 instruction, img_address m_pc);
+    std::string MAX_D(uint64 instruction, img_address m_pc);
+    std::string MAX_S(uint64 instruction, img_address m_pc);
+    std::string MAXA_D(uint64 instruction, img_address m_pc);
+    std::string MAXA_S(uint64 instruction, img_address m_pc);
+    std::string MFC0(uint64 instruction, img_address m_pc);
+    std::string MFC1(uint64 instruction, img_address m_pc);
+    std::string MFC2(uint64 instruction, img_address m_pc);
+    std::string MFGC0(uint64 instruction, img_address m_pc);
+    std::string MFHC0(uint64 instruction, img_address m_pc);
+    std::string MFHC1(uint64 instruction, img_address m_pc);
+    std::string MFHC2(uint64 instruction, img_address m_pc);
+    std::string MFHGC0(uint64 instruction, img_address m_pc);
+    std::string MFHI_DSP_(uint64 instruction, img_address m_pc);
+    std::string MFHTR(uint64 instruction, img_address m_pc);
+    std::string MFLO_DSP_(uint64 instruction, img_address m_pc);
+    std::string MFTR(uint64 instruction, img_address m_pc);
+    std::string MIN_D(uint64 instruction, img_address m_pc);
+    std::string MIN_S(uint64 instruction, img_address m_pc);
+    std::string MINA_D(uint64 instruction, img_address m_pc);
+    std::string MINA_S(uint64 instruction, img_address m_pc);
+    std::string MOD(uint64 instruction, img_address m_pc);
+    std::string MODSUB(uint64 instruction, img_address m_pc);
+    std::string MODU(uint64 instruction, img_address m_pc);
+    std::string MOV_D(uint64 instruction, img_address m_pc);
+    std::string MOV_S(uint64 instruction, img_address m_pc);
+    std::string MOVE_BALC(uint64 instruction, img_address m_pc);
+    std::string MOVEP(uint64 instruction, img_address m_pc);
+    std::string MOVEP_REV_(uint64 instruction, img_address m_pc);
+    std::string MOVE(uint64 instruction, img_address m_pc);
+    std::string MOVN(uint64 instruction, img_address m_pc);
+    std::string MOVZ(uint64 instruction, img_address m_pc);
+    std::string MSUB_DSP_(uint64 instruction, img_address m_pc);
+    std::string MSUBF_D(uint64 instruction, img_address m_pc);
+    std::string MSUBF_S(uint64 instruction, img_address m_pc);
+    std::string MSUBU_DSP_(uint64 instruction, img_address m_pc);
+    std::string MTC0(uint64 instruction, img_address m_pc);
+    std::string MTC1(uint64 instruction, img_address m_pc);
+    std::string MTC2(uint64 instruction, img_address m_pc);
+    std::string MTGC0(uint64 instruction, img_address m_pc);
+    std::string MTHC0(uint64 instruction, img_address m_pc);
+    std::string MTHC1(uint64 instruction, img_address m_pc);
+    std::string MTHC2(uint64 instruction, img_address m_pc);
+    std::string MTHGC0(uint64 instruction, img_address m_pc);
+    std::string MTHI_DSP_(uint64 instruction, img_address m_pc);
+    std::string MTHLIP(uint64 instruction, img_address m_pc);
+    std::string MTHTR(uint64 instruction, img_address m_pc);
+    std::string MTLO_DSP_(uint64 instruction, img_address m_pc);
+    std::string MTTR(uint64 instruction, img_address m_pc);
+    std::string MUH(uint64 instruction, img_address m_pc);
+    std::string MUHU(uint64 instruction, img_address m_pc);
+    std::string MUL_32_(uint64 instruction, img_address m_pc);
+    std::string MUL_4X4_(uint64 instruction, img_address m_pc);
+    std::string MUL_D(uint64 instruction, img_address m_pc);
+    std::string MUL_PH(uint64 instruction, img_address m_pc);
+    std::string MUL_S(uint64 instruction, img_address m_pc);
+    std::string MUL_S_PH(uint64 instruction, img_address m_pc);
+    std::string MULEQ_S_W_PHL(uint64 instruction, img_address m_pc);
+    std::string MULEQ_S_W_PHR(uint64 instruction, img_address m_pc);
+    std::string MULEU_S_PH_QBL(uint64 instruction, img_address m_pc);
+    std::string MULEU_S_PH_QBR(uint64 instruction, img_address m_pc);
+    std::string MULQ_RS_PH(uint64 instruction, img_address m_pc);
+    std::string MULQ_RS_W(uint64 instruction, img_address m_pc);
+    std::string MULQ_S_PH(uint64 instruction, img_address m_pc);
+    std::string MULQ_S_W(uint64 instruction, img_address m_pc);
+    std::string MULSA_W_PH(uint64 instruction, img_address m_pc);
+    std::string MULSAQ_S_W_PH(uint64 instruction, img_address m_pc);
+    std::string MULT_DSP_(uint64 instruction, img_address m_pc);
+    std::string MULTU_DSP_(uint64 instruction, img_address m_pc);
+    std::string MULU(uint64 instruction, img_address m_pc);
+    std::string NEG_D(uint64 instruction, img_address m_pc);
+    std::string NEG_S(uint64 instruction, img_address m_pc);
+    std::string NOP_16_(uint64 instruction, img_address m_pc);
+    std::string NOP_32_(uint64 instruction, img_address m_pc);
+    std::string NOR(uint64 instruction, img_address m_pc);
+    std::string NOT_16_(uint64 instruction, img_address m_pc);
+    std::string OR_16_(uint64 instruction, img_address m_pc);
+    std::string OR_32_(uint64 instruction, img_address m_pc);
+    std::string ORI(uint64 instruction, img_address m_pc);
+    std::string PACKRL_PH(uint64 instruction, img_address m_pc);
+    std::string PAUSE(uint64 instruction, img_address m_pc);
+    std::string PICK_PH(uint64 instruction, img_address m_pc);
+    std::string PICK_QB(uint64 instruction, img_address m_pc);
+    std::string PRECEQ_W_PHL(uint64 instruction, img_address m_pc);
+    std::string PRECEQ_W_PHR(uint64 instruction, img_address m_pc);
+    std::string PRECEQU_PH_QBL(uint64 instruction, img_address m_pc);
+    std::string PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc);
+    std::string PRECEQU_PH_QBR(uint64 instruction, img_address m_pc);
+    std::string PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc);
+    std::string PRECEU_PH_QBL(uint64 instruction, img_address m_pc);
+    std::string PRECEU_PH_QBLA(uint64 instruction, img_address m_pc);
+    std::string PRECEU_PH_QBR(uint64 instruction, img_address m_pc);
+    std::string PRECEU_PH_QBRA(uint64 instruction, img_address m_pc);
+    std::string PRECR_QB_PH(uint64 instruction, img_address m_pc);
+    std::string PRECR_SRA_PH_W(uint64 instruction, img_address m_pc);
+    std::string PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc);
+    std::string PRECRQ_PH_W(uint64 instruction, img_address m_pc);
+    std::string PRECRQ_QB_PH(uint64 instruction, img_address m_pc);
+    std::string PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc);
+    std::string PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc);
+    std::string PREF_S9_(uint64 instruction, img_address m_pc);
+    std::string PREF_U12_(uint64 instruction, img_address m_pc);
+    std::string PREFE(uint64 instruction, img_address m_pc);
+    std::string PREPEND(uint64 instruction, img_address m_pc);
+    std::string RADDU_W_QB(uint64 instruction, img_address m_pc);
+    std::string RDDSP(uint64 instruction, img_address m_pc);
+    std::string RDHWR(uint64 instruction, img_address m_pc);
+    std::string RDPGPR(uint64 instruction, img_address m_pc);
+    std::string RECIP_D(uint64 instruction, img_address m_pc);
+    std::string RECIP_S(uint64 instruction, img_address m_pc);
+    std::string REPL_PH(uint64 instruction, img_address m_pc);
+    std::string REPL_QB(uint64 instruction, img_address m_pc);
+    std::string REPLV_PH(uint64 instruction, img_address m_pc);
+    std::string REPLV_QB(uint64 instruction, img_address m_pc);
+    std::string RESTORE_32_(uint64 instruction, img_address m_pc);
+    std::string RESTORE_JRC_16_(uint64 instruction, img_address m_pc);
+    std::string RESTORE_JRC_32_(uint64 instruction, img_address m_pc);
+    std::string RESTOREF(uint64 instruction, img_address m_pc);
+    std::string RINT_D(uint64 instruction, img_address m_pc);
+    std::string RINT_S(uint64 instruction, img_address m_pc);
+    std::string ROTR(uint64 instruction, img_address m_pc);
+    std::string ROTRV(uint64 instruction, img_address m_pc);
+    std::string ROTX(uint64 instruction, img_address m_pc);
+    std::string ROUND_L_D(uint64 instruction, img_address m_pc);
+    std::string ROUND_L_S(uint64 instruction, img_address m_pc);
+    std::string ROUND_W_D(uint64 instruction, img_address m_pc);
+    std::string ROUND_W_S(uint64 instruction, img_address m_pc);
+    std::string RSQRT_D(uint64 instruction, img_address m_pc);
+    std::string RSQRT_S(uint64 instruction, img_address m_pc);
+    std::string SAVE_16_(uint64 instruction, img_address m_pc);
+    std::string SAVE_32_(uint64 instruction, img_address m_pc);
+    std::string SAVEF(uint64 instruction, img_address m_pc);
+    std::string SB_16_(uint64 instruction, img_address m_pc);
+    std::string SB_GP_(uint64 instruction, img_address m_pc);
+    std::string SB_S9_(uint64 instruction, img_address m_pc);
+    std::string SB_U12_(uint64 instruction, img_address m_pc);
+    std::string SBE(uint64 instruction, img_address m_pc);
+    std::string SBX(uint64 instruction, img_address m_pc);
+    std::string SC(uint64 instruction, img_address m_pc);
+    std::string SCD(uint64 instruction, img_address m_pc);
+    std::string SCDP(uint64 instruction, img_address m_pc);
+    std::string SCE(uint64 instruction, img_address m_pc);
+    std::string SCWP(uint64 instruction, img_address m_pc);
+    std::string SCWPE(uint64 instruction, img_address m_pc);
+    std::string SD_GP_(uint64 instruction, img_address m_pc);
+    std::string SD_S9_(uint64 instruction, img_address m_pc);
+    std::string SD_U12_(uint64 instruction, img_address m_pc);
+    std::string SDBBP_16_(uint64 instruction, img_address m_pc);
+    std::string SDBBP_32_(uint64 instruction, img_address m_pc);
+    std::string SDC1_GP_(uint64 instruction, img_address m_pc);
+    std::string SDC1_S9_(uint64 instruction, img_address m_pc);
+    std::string SDC1_U12_(uint64 instruction, img_address m_pc);
+    std::string SDC1X(uint64 instruction, img_address m_pc);
+    std::string SDC1XS(uint64 instruction, img_address m_pc);
+    std::string SDC2(uint64 instruction, img_address m_pc);
+    std::string SDM(uint64 instruction, img_address m_pc);
+    std::string SDPC_48_(uint64 instruction, img_address m_pc);
+    std::string SDX(uint64 instruction, img_address m_pc);
+    std::string SDXS(uint64 instruction, img_address m_pc);
+    std::string SEB(uint64 instruction, img_address m_pc);
+    std::string SEH(uint64 instruction, img_address m_pc);
+    std::string SEL_D(uint64 instruction, img_address m_pc);
+    std::string SEL_S(uint64 instruction, img_address m_pc);
+    std::string SELEQZ_D(uint64 instruction, img_address m_pc);
+    std::string SELEQZ_S(uint64 instruction, img_address m_pc);
+    std::string SELNEZ_D(uint64 instruction, img_address m_pc);
+    std::string SELNEZ_S(uint64 instruction, img_address m_pc);
+    std::string SEQI(uint64 instruction, img_address m_pc);
+    std::string SH_16_(uint64 instruction, img_address m_pc);
+    std::string SH_GP_(uint64 instruction, img_address m_pc);
+    std::string SH_S9_(uint64 instruction, img_address m_pc);
+    std::string SH_U12_(uint64 instruction, img_address m_pc);
+    std::string SHE(uint64 instruction, img_address m_pc);
+    std::string SHILO(uint64 instruction, img_address m_pc);
+    std::string SHILOV(uint64 instruction, img_address m_pc);
+    std::string SHLL_PH(uint64 instruction, img_address m_pc);
+    std::string SHLL_QB(uint64 instruction, img_address m_pc);
+    std::string SHLL_S_PH(uint64 instruction, img_address m_pc);
+    std::string SHLL_S_W(uint64 instruction, img_address m_pc);
+    std::string SHLLV_PH(uint64 instruction, img_address m_pc);
+    std::string SHLLV_QB(uint64 instruction, img_address m_pc);
+    std::string SHLLV_S_PH(uint64 instruction, img_address m_pc);
+    std::string SHLLV_S_W(uint64 instruction, img_address m_pc);
+    std::string SHRA_PH(uint64 instruction, img_address m_pc);
+    std::string SHRA_QB(uint64 instruction, img_address m_pc);
+    std::string SHRA_R_PH(uint64 instruction, img_address m_pc);
+    std::string SHRA_R_QB(uint64 instruction, img_address m_pc);
+    std::string SHRA_R_W(uint64 instruction, img_address m_pc);
+    std::string SHRAV_PH(uint64 instruction, img_address m_pc);
+    std::string SHRAV_QB(uint64 instruction, img_address m_pc);
+    std::string SHRAV_R_PH(uint64 instruction, img_address m_pc);
+    std::string SHRAV_R_QB(uint64 instruction, img_address m_pc);
+    std::string SHRAV_R_W(uint64 instruction, img_address m_pc);
+    std::string SHRL_PH(uint64 instruction, img_address m_pc);
+    std::string SHRL_QB(uint64 instruction, img_address m_pc);
+    std::string SHRLV_PH(uint64 instruction, img_address m_pc);
+    std::string SHRLV_QB(uint64 instruction, img_address m_pc);
+    std::string SHX(uint64 instruction, img_address m_pc);
+    std::string SHXS(uint64 instruction, img_address m_pc);
+    std::string SIGRIE(uint64 instruction, img_address m_pc);
+    std::string SLL_16_(uint64 instruction, img_address m_pc);
+    std::string SLL_32_(uint64 instruction, img_address m_pc);
+    std::string SLLV(uint64 instruction, img_address m_pc);
+    std::string SLT(uint64 instruction, img_address m_pc);
+    std::string SLTI(uint64 instruction, img_address m_pc);
+    std::string SLTIU(uint64 instruction, img_address m_pc);
+    std::string SLTU(uint64 instruction, img_address m_pc);
+    std::string SOV(uint64 instruction, img_address m_pc);
+    std::string SPECIAL2(uint64 instruction, img_address m_pc);
+    std::string SQRT_D(uint64 instruction, img_address m_pc);
+    std::string SQRT_S(uint64 instruction, img_address m_pc);
+    std::string SRA(uint64 instruction, img_address m_pc);
+    std::string SRAV(uint64 instruction, img_address m_pc);
+    std::string SRL_16_(uint64 instruction, img_address m_pc);
+    std::string SRL_32_(uint64 instruction, img_address m_pc);
+    std::string SRLV(uint64 instruction, img_address m_pc);
+    std::string SUB(uint64 instruction, img_address m_pc);
+    std::string SUB_D(uint64 instruction, img_address m_pc);
+    std::string SUB_S(uint64 instruction, img_address m_pc);
+    std::string SUBQ_PH(uint64 instruction, img_address m_pc);
+    std::string SUBQ_S_PH(uint64 instruction, img_address m_pc);
+    std::string SUBQ_S_W(uint64 instruction, img_address m_pc);
+    std::string SUBQH_PH(uint64 instruction, img_address m_pc);
+    std::string SUBQH_R_PH(uint64 instruction, img_address m_pc);
+    std::string SUBQH_R_W(uint64 instruction, img_address m_pc);
+    std::string SUBQH_W(uint64 instruction, img_address m_pc);
+    std::string SUBU_16_(uint64 instruction, img_address m_pc);
+    std::string SUBU_32_(uint64 instruction, img_address m_pc);
+    std::string SUBU_PH(uint64 instruction, img_address m_pc);
+    std::string SUBU_QB(uint64 instruction, img_address m_pc);
+    std::string SUBU_S_PH(uint64 instruction, img_address m_pc);
+    std::string SUBU_S_QB(uint64 instruction, img_address m_pc);
+    std::string SUBUH_QB(uint64 instruction, img_address m_pc);
+    std::string SUBUH_R_QB(uint64 instruction, img_address m_pc);
+    std::string SW_16_(uint64 instruction, img_address m_pc);
+    std::string SW_4X4_(uint64 instruction, img_address m_pc);
+    std::string SW_GP16_(uint64 instruction, img_address m_pc);
+    std::string SW_GP_(uint64 instruction, img_address m_pc);
+    std::string SW_S9_(uint64 instruction, img_address m_pc);
+    std::string SW_SP_(uint64 instruction, img_address m_pc);
+    std::string SW_U12_(uint64 instruction, img_address m_pc);
+    std::string SWC1_GP_(uint64 instruction, img_address m_pc);
+    std::string SWC1_S9_(uint64 instruction, img_address m_pc);
+    std::string SWC1_U12_(uint64 instruction, img_address m_pc);
+    std::string SWC1X(uint64 instruction, img_address m_pc);
+    std::string SWC1XS(uint64 instruction, img_address m_pc);
+    std::string SWC2(uint64 instruction, img_address m_pc);
+    std::string SWE(uint64 instruction, img_address m_pc);
+    std::string SWM(uint64 instruction, img_address m_pc);
+    std::string SWPC_48_(uint64 instruction, img_address m_pc);
+    std::string SWX(uint64 instruction, img_address m_pc);
+    std::string SWXS(uint64 instruction, img_address m_pc);
+    std::string SYNC(uint64 instruction, img_address m_pc);
+    std::string SYNCI(uint64 instruction, img_address m_pc);
+    std::string SYNCIE(uint64 instruction, img_address m_pc);
+    std::string SYSCALL_16_(uint64 instruction, img_address m_pc);
+    std::string SYSCALL_32_(uint64 instruction, img_address m_pc);
+    std::string TEQ(uint64 instruction, img_address m_pc);
+    std::string TLBGINV(uint64 instruction, img_address m_pc);
+    std::string TLBGINVF(uint64 instruction, img_address m_pc);
+    std::string TLBGP(uint64 instruction, img_address m_pc);
+    std::string TLBGR(uint64 instruction, img_address m_pc);
+    std::string TLBGWI(uint64 instruction, img_address m_pc);
+    std::string TLBGWR(uint64 instruction, img_address m_pc);
+    std::string TLBINV(uint64 instruction, img_address m_pc);
+    std::string TLBINVF(uint64 instruction, img_address m_pc);
+    std::string TLBP(uint64 instruction, img_address m_pc);
+    std::string TLBR(uint64 instruction, img_address m_pc);
+    std::string TLBWI(uint64 instruction, img_address m_pc);
+    std::string TLBWR(uint64 instruction, img_address m_pc);
+    std::string TNE(uint64 instruction, img_address m_pc);
+    std::string TRUNC_L_D(uint64 instruction, img_address m_pc);
+    std::string TRUNC_L_S(uint64 instruction, img_address m_pc);
+    std::string TRUNC_W_D(uint64 instruction, img_address m_pc);
+    std::string TRUNC_W_S(uint64 instruction, img_address m_pc);
+    std::string UALDM(uint64 instruction, img_address m_pc);
+    std::string UALH(uint64 instruction, img_address m_pc);
+    std::string UALWM(uint64 instruction, img_address m_pc);
+    std::string UASDM(uint64 instruction, img_address m_pc);
+    std::string UASH(uint64 instruction, img_address m_pc);
+    std::string UASWM(uint64 instruction, img_address m_pc);
+    std::string UDI(uint64 instruction, img_address m_pc);
+    std::string WAIT(uint64 instruction, img_address m_pc);
+    std::string WRDSP(uint64 instruction, img_address m_pc);
+    std::string WRPGPR(uint64 instruction, img_address m_pc);
+    std::string XOR_16_(uint64 instruction, img_address m_pc);
+    std::string XOR_32_(uint64 instruction, img_address m_pc);
+    std::string XORI(uint64 instruction, img_address m_pc);
+    std::string YIELD(uint64 instruction, img_address m_pc);
 
     static Pool P_SYSCALL[2];
     static Pool P_RI[4];
-- 
2.25.1


