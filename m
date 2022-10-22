Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2B60839C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 04:35:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om47J-0006ps-92; Fri, 21 Oct 2022 22:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1om47G-0006pj-SQ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 22:20:02 -0400
Received: from mail-tyzapc01olkn2082e.outbound.protection.outlook.com
 ([2a01:111:f403:704b::82e]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1om47F-0002ck-05
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 22:20:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL+l2IKXeuNyjJonGK6GnCSmIHOlte1c9i45YrdqNlp50v1na/64VCGHwhIHXZNgNSJqjCNNc4/RIfzHAryS+WLyAA4VyH/Hyo90tjc8r3ewnP9LqLNI0Inyb81XKdhi9q5k8DrAb0PLOp/ZK4ehUM2zgttvRbkKRFCTSo9RgKJAty3jY8GgW/MQ3HBBM/NWTCW0haJ90Ge1oiDMALZNJWrUbPeyeSE6jTinqjo9AqthLTTUFK8bqcIWEdWGJdPQYb9mZkbT8grvzTEp262UWSvy4sIEYj5Rt4jmGzbwyD3+idrPUhGuHIny8UbH0TMdlW7jcBAxcDNVFLJlIgXf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffemJ4AYzGIgtgpXBmoRFetlyQyp0g7SFJTwlVMWLs8=;
 b=a7JyS/RZb704+GEPKFeDSx+MW6E6xg9kck/ngt3gXf6493uzXQHVE2L2LvS+Y5FCR+ypS4WlNV8C18bQSWX61yI06bvxpJoMh4oZKD697Y41q2NUNKIvGV9Jl+Kjmo+QdpnkED6fDDHedq5lmUPSqWThvPqzKisr4lZRKNQfRtSpr/OzsXWARz/z/gcpvs+0tU84QIba/dp5BPXg7rvyWA0ltP8m8N//MfgCpmmZ+lsm3/hUvfbGkZbiRQp5eENLYnYCQxovVGWK5qXBHJC4F8Ux83GitcY81doPw9a+ZSdZfVcTun4JDnv8oMKsP/ou3zdfTYw8dLdtQdKwZv9cGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SEZPR01MB4301.apcprd01.prod.exchangelabs.com
 (2603:1096:101:4f::5) by SEZPR01MB4898.apcprd01.prod.exchangelabs.com
 (2603:1096:101:9c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 02:14:51 +0000
Received: from SEZPR01MB4301.apcprd01.prod.exchangelabs.com
 ([fe80::ebc4:f2e8:caa9:dd6b]) by SEZPR01MB4301.apcprd01.prod.exchangelabs.com
 ([fe80::ebc4:f2e8:caa9:dd6b%7]) with mapi id 15.20.5723.034; Sat, 22 Oct 2022
 02:14:51 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	f4bug@amsat.org,
	taisei1212@outlook.jp
Subject: [PATCH] [PING^2] gdb-xml: Fix size of EFER register on i386
 architecture when debugged by GDB
Date: Sat, 22 Oct 2022 11:14:24 +0900
Message-ID: <SEZPR01MB43019BB36B09C11757F91AA9A42C9@SEZPR01MB4301.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285FA2526435F8CEC158355A4209@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285FA2526435F8CEC158355A4209@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [2ObiZ3rPyuAL3mbwjOnX/wuSCbCLGJEs]
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To SEZPR01MB4301.apcprd01.prod.exchangelabs.com
 (2603:1096:101:4f::5)
X-Microsoft-Original-Message-ID: <20221022021424.6972-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR01MB4301:EE_|SEZPR01MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: da17361f-a5b2-4db9-f2ab-08dab3d33311
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOWvWw84IelY/boZKA0ftQdF0I9msO4NlOQd/KF2/SLb4aldVoIS1EYsLbn7JabEecw4fYNlCnr5uZYBe2HRF9m4yieVS4lbcx3xINwJpQfY1UoiooEFP1GqV7U8fGwB4t4Nc/1saEb1UWdcI1m00zC+f3i/FM1uGpiXXto02gKa0lA9ym+nv3rh4d+wnV/Pda9iQnwuR2swrhYQeKCOJeOPHmPzny8WF9P5v+FSStWPiD4M3Zn9gyBOve4gY75Q9bnQg+SQHPhEpIL58DhJXZ1ykmzxqRINmd+xsL8XvSNyI7n5ZjG2P8D6UsIICC5ZkkefX6naEQld+22BDrFTHE/CjXqy4LDETJGidvu+4J31WZ/l6jVhLVndsTgtCqR255hDJrpRLBDQjp82VbvVial3hQj++pCnFMnwJ15jj9BBDK6JqegHPIxxHI1oTGf5jY4XYH4iBqG77PnFMccw1OhcunRm81ZopieNXSZZdtdUm6yc58UtLpbqwBs6UO4dSFl4DUe3aG3QKz70qw0vOVuHp1nlKmv1vtVQkIPh36rmVLtzbgnB8ZogHkXyyzhIFs1sP6EuEE/hN89rLJ5U3lJCmoEMQaW29NT+NKbxwVRm+J9vyWqsXpGrhehxTgjQmK+MHaRonvJD+XCvfOL32y4sGnuA8EItBhpxs7WjSfgn4py14zKhvZT/7qUt8dRu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2oxE7Gei/GlnV69Us7IcT8mkSMc/w/fp3veRKfg3jGaisJJu4VYPMf5TA3U?=
 =?us-ascii?Q?4DDnGoOajYMtrW+9CWYW08hfb8J0OLqCLIDEnJbIA3KEDTQdavBzjNZ3Kst/?=
 =?us-ascii?Q?z2m7p45dcoArNJ7vf054/it8ysafohaubQO5gdWwrL6AT6bpkKfzXctnaiqe?=
 =?us-ascii?Q?mtgB2xhR5ViXBTJRKrsgLr1nJ0l9xuuPuYOHVIZrsjiEJRMpOvRvpeWzW5TZ?=
 =?us-ascii?Q?r7ROXOM9WL0RIObcG1A5Et29/gCAJgv8MYs3ALkzu0q3m0qWOBF5WqJts6a2?=
 =?us-ascii?Q?h+4pgftsWdvXjvSq1dYYYdz2BLo6yp+vvVByC4kgnuAzkj2KMxl/M7IaUxuz?=
 =?us-ascii?Q?uByLnleH5hjI2Tx/3RR29XZwutdPkQa4uEPSKf/siCzln2/0p76RacKBgo0w?=
 =?us-ascii?Q?dDrnhvSQ/TRCfEZIP9dq2Mt09DkEAgVcVZU2Gk8XTKigX7oyit9ifb0ZUWwP?=
 =?us-ascii?Q?2U6b6uaI/IFe8mXyiF9j856eIt/xDWpoC2xKDxjmvBu/VmWXCZpyav2My6mq?=
 =?us-ascii?Q?Ug2JxuvQx+r1iSkQ3kih44oDKmsTHeqiaXi3yX5gBJqDA7MjlTPotlWZ6KgK?=
 =?us-ascii?Q?65hD8uA5znjLqTmQO8EMIJiuOuKnmcfZzZwoTFz2OCzgwuBMMl98UHVt/RgC?=
 =?us-ascii?Q?Cxlx1n9T7PMU/FZIUqs7/MPNamd2CRVVMaLdPMvpvehJTmznjqk4jF/oEdqu?=
 =?us-ascii?Q?ffnn9lYRmVRuoirAMRzYHvmeiadrpo1ZAMMhLBcOAbSciy6KB02DqqlpcQzW?=
 =?us-ascii?Q?S4Ps5GjnjbMOmNa203hsTcgZqFTMkoW8b4gCCZK1aYNMIvmSffMmKrwb2j/U?=
 =?us-ascii?Q?7LGV+6YMItLhadf0zN0vABtBiPAxiNAYxNhHuu+G+fzzpejhgMNyUi1r7rbM?=
 =?us-ascii?Q?+EMg4HVLc3fufW55QFKFuBoy9sZIREB6K/y5YWLeSpVMfbeoxVnKM1B5WOCp?=
 =?us-ascii?Q?DER8Gxt70GfFqCTanuVmQCDkK4+X+kJxgS4lFcFxQOuffQQJFyISit0ce0OC?=
 =?us-ascii?Q?t36M2YQYA38Aot4K9u1i7B0PzcsVRwm3x5p/4CVoMuXjWmBnpfRof4lBuKGt?=
 =?us-ascii?Q?CJCe8zfhvHWdxsUkgLL1CnE6mDvGglSJxRtxzD6fKmxe2p+2NX6AcC1j1PAQ?=
 =?us-ascii?Q?+RAe59FTq6qfsOgOwB6EF+4/n2iZ024dSwOZALIrBLBfODXYwrhpK/g6FlB4?=
 =?us-ascii?Q?Vbhm+i3Hs2XNyyD3UgU2HHZO43FB5gluvOl1aiEeA86xnKv9xv7R7s1Hgrqb?=
 =?us-ascii?Q?zu4KHTx9O0AY5IS1eXAI4UwrhNZx7np5MIBHB2xVFw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: da17361f-a5b2-4db9-f2ab-08dab3d33311
X-MS-Exchange-CrossTenant-AuthSource: SEZPR01MB4301.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 02:14:51.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4898
Received-SPF: pass client-ip=2a01:111:f403:704b::82e;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a ping to the patch below.

https://patchew.org/QEMU/TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/
https://lore.kernel.org/qemu-devel/TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/

Before this commit, there were contradictory descriptions about size of EFER
register.
Line 113 says the size is 8 bytes.
Line 129 says the size is 4 bytes.

As a result, when GDB is debugging an OS running on QEMU, the GDB cannot
read 'g' packets correctly. This 'g' packet transmits values of each
registers of machine emulated by QEMU to GDB. QEMU, the packet sender,
assign 4 bytes for EFER in 'g' packet based on the line 113.
GDB, the packet receiver, extract 8 bytes for EFER in 'g' packet based on
the line 129. Therefore, all registers located behind EFER in 'g' packet
has been shifted 4 bytes in GDB.

After this commit, GDB can read 'g' packets correctly.

Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
---
 gdb-xml/i386-32bit.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
index 872fcea9c2..7a66a02b67 100644
--- a/gdb-xml/i386-32bit.xml
+++ b/gdb-xml/i386-32bit.xml
@@ -110,7 +110,7 @@
 	<field name="PKE" start="22" end="22"/>
   </flags>
 
-  <flags id="i386_efer" size="8">
+  <flags id="i386_efer" size="4">
 	<field name="TCE" start="15" end="15"/>
 	<field name="FFXSR" start="14" end="14"/>
 	<field name="LMSLE" start="13" end="13"/>
-- 
2.34.1


