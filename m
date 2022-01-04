Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03924842B4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:43:58 +0100 (CET)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4k6X-0005t6-Vw
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1n4k4I-0004a2-3A
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:41:39 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:32008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1n4k4F-0008Jh-SD
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:41:37 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2041evUu009354
 for <qemu-devel@nongnu.org>; Tue, 4 Jan 2022 05:41:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=HI0tNzTzcIYqQWarNy2dz35uHA9cUM0njDSwuTLsh4k=;
 b=MdoekbUIImU01tywyFlOPd2dnULb5w5Wi5YeTlv6sfrLhD4/JeDicYvyMz6LiwRT8RT7
 aDTVcbgogoW+TKL9/SKc+7X+sg3l6BGTSavlNICCKwmOnalGJ2rDOM+8mSVIYmRcb8gg
 KYyUBmsOvPYZY0h7QbdrIGhThUa6DZ3jmwLP4PGwKTLnz9IUyaudBO3GxUuF4j1G9r6t
 gtZG5iU5W9Aqdtup8KOHWQwg8VlZr0tRn8aiw+KKkqXzjxy99mDYOykqn98Tb3/ZQJUz
 UKfR8/VOjSghYrn3gKQ1yL/SKsgQ7guQqT8eAfrabutJoHml1jBq+x10WKOWaDnY36Gc LQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dbyx0a335-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 05:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb5SHhiSRVSIaUtm+doJlKvutdpav0KTJwZ4HbmLr0KUswdq7ElYhq9aBkuxGQyj6PXPCzfKRO/RQhtX7SwOXL0R6e9ICa0KDexaLPTcE3c5EA5wFbyxpceChkATKkRjTdspNdEN1BfS7eXkrBGisAjR2SL5JDhKA8uAOuVUR3AQZPneV8mwHG67HYiUTYT8kZuoa1F+ZS5sF0ZZWCLQZnYd05uzLp0bCen3BPHwTsmHGng3aeSNc+8OPc4YAJS9eTtxqx0jLJwBFIaVH/jdLmphswzHGBWxGcQgDIwfuWiFhMDMC2PU9xiDsLswmunlqG2cEBaqsI79TgM6zxOUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI0tNzTzcIYqQWarNy2dz35uHA9cUM0njDSwuTLsh4k=;
 b=M1m4rMU3rA0dQae1YtxRePO94H18jnqHx7YV6WX4BxpGj0Wk/p2IN3yU4dSmnlHuAm/qEOaOFcacP5cDEGY+rvUto8LD3/W34tK/FuI7cZJLMY1PaQQSBQNTqM2DEaK5+rlmCLThswot7XRze0OqowKYJFrnN6LdzF5kac5jM3dR3xjMCvVMUOJe9q1ZEJ7v/wM+U8hEJPr/nI9DGWmtLCvq0o89Lo6nm71ZUGKnxlDUMbxs1923qQFnO19uakOvr+k7uCskatxWE1YEyISRdei6gh1gM+gmmjlgq/wioe0hQvkERVihl6e382K/VLY3uO5bsn839T8cSEAPyvdYuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by BYAPR02MB4712.namprd02.prod.outlook.com (2603:10b6:a03:50::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 13:41:27 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::5916:1188:53ed:2065]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::5916:1188:53ed:2065%2]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 13:41:26 +0000
From: Rohit Kumar <rohit.kumar3@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] Check and report for incomplete 'global' option format
Date: Tue,  4 Jan 2022 08:41:02 -0500
Message-Id: <20220104134102.1080890-1-rohit.kumar3@nutanix.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a545409d-6e5a-436f-c68c-08d9cf87e788
X-MS-TrafficTypeDiagnostic: BYAPR02MB4712:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB47127B4260D0D54542704771D14A9@BYAPR02MB4712.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZdYuLgN5EIyH2PYxF7x/EVIBEgfI+aSVrgMqPhlQHzDY14zL0QT4TCieknlMA09Gh7uf1YpVHOwOw6E5DXsAsIWN3k9ZP8IBLvMnEMN+WxyiXElvL8e5Cu9KT5fpUx4ASvH4ClEp3HRv3f4ZejkxN/MDE0XnLRPUdXKM/g4YmORg987+ByZl4ZF8fK78fgQQH6152Gz0FPfyTbrVFs0gxhZ2VCZYoERK4mvH8O8devf+/ors5ARObz/OGEdADm5JFKk1WDkykHAr7ln1iZLLNMrnbRL5hqAwk7HRNjXivLgQM6dtw+Hl6hUP1wBRKJjQfko2MxXhjUBcPcasmNSMZFa/cuFKTRMTeCw0sE1gqEGIr2CNXLS5u62ruq2Njlg4jj1FZOABNlpZrKPRGmjj2fscOca5pEUQ+lnUKpoN4Ogz9PDXDghEt0ujpep+Ex2+irg7+UVnlEKxcTy0pw7NGaXy13sGmhzdPXjqjG56hthULE/gbuaDuPvGSJX5O5PqWoWCRAKrEMjBKn3Wkh8eFCz8wvYt9Cft1C6M8LP2CqJm3TL9i22Fck/+mWLdEeBxRQX1EnBBKiTVxuw18BRGSSgWM7nJ3CB1gsVKNidFk/XejsZ5xwGXFn4R3GvIAJD0OKKslEi0krJ6DlCs2XtsdDWudQ5dmpLsHKYaZyL0y0qm1V2i1m1/BFwm/z2sPACRk4DaiV8oPmiHtb8TnDbFVMRKe3xfL/dV22ivGxUiewvOSM/hv3D8+wBQ63rPISKUN1ezNxKNA7S7f0s0q0BltsH9u9O5WuFeHYvM70E+Jw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(26005)(5660300002)(8936002)(966005)(38350700002)(107886003)(8676002)(508600001)(38100700002)(6512007)(6506007)(186003)(66946007)(36756003)(6486002)(83380400001)(52116002)(6916009)(2616005)(1076003)(6666004)(2906002)(66556008)(86362001)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dU+SveK4L4ltjrWc4PMvUnQeqiNypieHSnLtXH2asUm+euoY8AZosbYHfwMH?=
 =?us-ascii?Q?XoGbEhLNT4rbzizEaGtoKWp8cRtuaegQI5bOdz7fQzHxXpLFt15qkIRl36t2?=
 =?us-ascii?Q?wn7GMspxtGQEhLO29iu6jC7ARCWm/iK+W60uhBkEzdr/HGh/Q/Gvt8xQurXa?=
 =?us-ascii?Q?R87aH4PmrfaDrapVR5H9/TMHh57j6/QRTuyb6lYJIqeEwOXBRhcl9K4oeZhQ?=
 =?us-ascii?Q?1/CWxi+IhX1f7Gar3IPHcGLu+qAnRzfC3a6pfdRd3ib/i2WqEC7rPB8XFchz?=
 =?us-ascii?Q?6mGq1tV7RQM60z2uLaVzqeoD0RRDvBL2/iobnYk+jXRkJAMTrAU35qY7Szl+?=
 =?us-ascii?Q?3WTF/wvkFKd4FR4LQ7cDpfdj7af5Nrlnxts1ELfuCNDKwCSy23iQiDzYpK5c?=
 =?us-ascii?Q?v0jbyxcbHt/AUKLVmNtIyqBL3a0AluPZWnG2RTC+L1p5ekpoyVScq/BM6BPI?=
 =?us-ascii?Q?bCBsd/wjNTajXFPjR2olQ2ooUP97CQCa9K9Dzxf2HuzgNjkhjTJ7QLzVvp+z?=
 =?us-ascii?Q?hXJZeyHvLGN7uAph85uU+Q1oNCz2sAucuNq6jO89ItwFHM5E7pRfOQnL2p4E?=
 =?us-ascii?Q?X3PJ/MuJ1AUgaoFtUJ4He2jsvcU5GP2lg66ZnYgS18tufirNcIUb4/SZuNvJ?=
 =?us-ascii?Q?rn1iI9Em3eRwodbqLgG22HZ+A1WzRFBajw2VdV8c6zATZDyqPDixsZZmvAGh?=
 =?us-ascii?Q?twJ6gCEs6QpordDWywIrFQrZK4kcaF3okFcxCl8bBGQ0M763AQOMSBsQwJua?=
 =?us-ascii?Q?SvHNxvG8KHLVe0wMEBYo7Tma99YWkPMm1CVBfy76XkxtMhO3s3q45VLbl76u?=
 =?us-ascii?Q?ix9b7Re6vcBqiw2R72/x43YhXgmDVFL54Wpg5+2gjnY5XpaGe1l0rEpNWffq?=
 =?us-ascii?Q?HyNNhJQ8sMfCqauyPAJF8y1NGKVmL91d59gHQOgi9f0mmLa0WQWglRUdF0T1?=
 =?us-ascii?Q?1dWJBbi3ypV9MCQycQ8kF38Ifr4qkTI/fCu7ZB6qbJLm9JUesECVCGQQNbzc?=
 =?us-ascii?Q?V6yj7aIxfXOShjE46EwSmwWRTWrHIdvrJgaDPsFLrF8PMSzQooGti91AEP51?=
 =?us-ascii?Q?zqo6cSRhvdy2BjEU8sCAqkb44zw9GQ2YNsIqQxbJVmMEKNjFDUjb9VNfyERw?=
 =?us-ascii?Q?qWKcHTfhIBCyf1dzS3Bem6/5iTz8YC3qgNDE9Dvr7ev685rN2bP/Lqw54xtv?=
 =?us-ascii?Q?+gmyqaMPx9L5WjVaqyjlkHf0f3J2tO32mHqvBOoQ25jOaUiYPqohWrAGrMRl?=
 =?us-ascii?Q?Sle0snYm2/ptGZN3r1ocQRabcmkBrr+N7itEjOMsvuVP+wkFxirNdVLyYTPr?=
 =?us-ascii?Q?AMVsUNrB8Es1eQzGPbybEOnTeX35ECxDMhGVH7kOx/YWueDXSNmuwhR/We+W?=
 =?us-ascii?Q?WPrOFAnyadS/E0VpZ5rUchPL/vByvmBhBn6Wwdi+QauYexAl9cpza2PZL6iV?=
 =?us-ascii?Q?9jMoHkAUU76HAeno509pUDr9kaIkJ9W1qhy1nWn3MzWX0utFwfa9UolODj/L?=
 =?us-ascii?Q?p0W31P4NgSTMN983XP2L/ncFL9CKcJWwq73xpSE2y0SDt9Eg5YseNp2acKUL?=
 =?us-ascii?Q?n7iNy8dEs2OVGGxYSYzQ9O1EGDfu8WklM+1TbJoG7nddPrhm7IF8fEYuaZzV?=
 =?us-ascii?Q?AkS+jkxNetOszxrkkR8ueuiPDeCa9BZhlxc3AMYAMQ6IgfOsylckp7N9O7GK?=
 =?us-ascii?Q?ru4azP26A/tVwXbquDTYkkvDLdk=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a545409d-6e5a-436f-c68c-08d9cf87e788
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 13:41:26.4026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PYnNPT5MNb+0LOtKDZq7ODUiZ1nD4BZojIdDnu7Z5LWNYeRW3U952IDxhg4a+xPQSFYbdKzq6AI28AKVL0Z0sG8F4FmgK2WSUHi5ceCaxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4712
X-Proofpoint-ORIG-GUID: w2IvNZL5gKg2BxfYg3d5vyCHYCE1H304
X-Proofpoint-GUID: w2IvNZL5gKg2BxfYg3d5vyCHYCE1H304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: prachatos.mitra@nutanix.com, Rohit Kumar <rohit.kumar3@nutanix.com>,
 prerna.saxena@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu might crash when provided incomplete '-global' option.
For example:
	qemu-system-x86_64 -global driver=isa-fdc
	qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
  	string_input_visitor_new: Assertion `str' failed.
 	Aborted (core dumped)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
---
 softmmu/qdev-monitor.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..7aee7b9882 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
     char driver[64], property[64];
     QemuOpts *opts;
     int rc, offset;
+    Error *err = NULL;
 
     rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
     if (rc == 2 && str[offset] == '=') {
@@ -1031,7 +1032,13 @@ int qemu_global_option(const char *str)
     }
 
     opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
-    if (!opts) {
+    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts, "property") ||
+        !qemu_opt_get(opts, "value")) {
+        error_setg(&err, "Invalid 'global' option format\n"
+                   "Expected: -global <driver>.<property>=<value> or "
+                   "-global driver=driver,property=property,value=value\n"
+                   "Received: -global %s", str);
+        error_report_err(err);
         return -1;
     }
 
-- 
2.27.0


