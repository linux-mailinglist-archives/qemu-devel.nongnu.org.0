Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D412468EB9F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgsJ-00073Q-SK; Wed, 08 Feb 2023 04:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsG-00071u-V6
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pPgsD-0005JZ-Sg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:36:20 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3185T1sa025574; Wed, 8 Feb 2023 01:36:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=lf9JnwibmmulCmRMdKCBd4ccNAfHi24t7tZq/7JXxIw=;
 b=hTfjgZxLC4+ez2qJG5jPt4BKU5+yNvybLRI9XyR2Nqnza8+/bT7uHIBkU+Vtlk1ts1+3
 FTQsCAb8qfmlrKmYsRBWKro/qaqhZl39mPRjaVWEp7woxP0qw+/w9UnjRWh8HQ30Ci5W
 TeVRYnt8iJYc7p31oZO5tXUamLLzyHSmCP7HIgI3HLsc4Y74cQmQtXx1CY4JMQ3aYFkw
 N05TV1GJH5Myt+xAdsjIHEwcuYAMXsIqEnzYUR/PMfPSmD2twb8Qo75fzB+oNn4yY4a8
 0/8mUxykaT62+FeRJzsvy6Nz5T7sEmJ19CQlu+fx2v7sDmoDStmaJ2SG0HS+Q2HazIpf cg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhmk1bt2k-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 01:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMO5SXfwTkE3UpTy5urZDbofIBiWa6IPHBiS4OU23aPaVPOLfA6LD+E9oCxglbwFxmZcmJQKwKKaUx/rIAd30fknL3KbYlEjye12IQPRGIBNJwysrglYh2Zu+XBHdAm+P0F4gh0Jm/w7pA53bep3EsjUTOEwtyRBAg+TbEJ+ZT/KUQ+t9Siz+rJJTPgMxIVoUlAOlcmwsK66Ldfcheo36TKbnolU8xZOFR/sWI9yuOtKaNJ4f3tcgKZ2JPdsYCQMcQp0IWUUF1ajYmncFqxEwE7HnwfLfvorlIzNl4G3vPb99fwwLJjns9KTluj/syqIeHMUGKnm3EN7z9Vatlwskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf9JnwibmmulCmRMdKCBd4ccNAfHi24t7tZq/7JXxIw=;
 b=WpBJEdNcG+RbmmT3X71RigzwZ6SI2TLt1175OjpRjT8PpKFPgQ9IRBJmZyURSEjVj4eMhmGRS2BP3Qx1UlaVQjxV43i4mLEt6GY+MoIjSgOCCiZYI1xGtG+PyiCl5BhR9/KfJO6x9U+GYgztZ31uYH6Nj42t43BYYvKPSJ7j0FNgKqzr/U8WORJNDpmtX0Wo2dSjd11OxeGTZdN0PGeYcqNxN9MX8by7P7+JyaMeB4yZBVXNJ4Sl/wdQeyPDglO7w/a1rWG/dCkJ1k92GbMl23j1fuG5O/Q1/Q6904fg1tqvnI9EdfGSmvEfijjDldpY2u1QAXUroCuPjBWdIIG1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf9JnwibmmulCmRMdKCBd4ccNAfHi24t7tZq/7JXxIw=;
 b=um4VgJlFtcf1FcxoDN6PhLRRyv+au4mzTcsP9XURfOGx9I5Xqa0l8pqDJKW84O3DQsMZfn01H4aVev1WMgJCDvekulxYRf5Cw8u1ZADFEyJTgfLqEY3L24k6utRiaLSMA883UAu6db08pz0tlTcD9gNp81WmSq2S0dmhx2RBUiZaekz73yMt95e+BXzDTD2bkYTcsYc152HSeAP0P/86ABCvyC0bCMOixAs3ZCT4paGe2MJ7aOieCyEHNausFgavPOohSC/t0e96kdLY6B3md2ttoLM/ht8SpSGjQp1/Kmu6e2cAP96OtJqr+x1BJj6z1Pkzo0p9Ylcyk7dj+m9hRA==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8494.namprd02.prod.outlook.com (2603:10b6:806:1f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 09:36:12 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 09:36:12 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v2 4/6] migration: Avoid multiple parsing of uri in migration
 code flow
Date: Wed,  8 Feb 2023 09:35:58 +0000
Message-Id: <20230208093600.242665-5-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230208093600.242665-1-het.gala@nutanix.com>
References: <20230208093600.242665-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|SA1PR02MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: a6053269-4f35-4495-c16f-08db09b7ea47
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ud1wV2wcJw5JWICbu2Z1l4aDYSFEJ7cyiNZ4/XCjpJVHe2Bx2G8VNYb0XGc2IZdmorhH0K2JDlKhyvyeo2IBRTlnxCTDuB1z7zWsSh5JKYVElYmhA+JKo3gBgTobU+cgbwoq48Es3b55ua+YE1S69nX+BsJnGIEB1dgJ93JxQHYhbvMhO16xpg6GMWKHDsw5KM0qhssixPOw+/1vT4MBlvK3Ut+PBckNyFSQIVjxXxd8qu0M3BdIzQr0By46HBWySJM4xFWozO6YeX8YQ8TOceP5+RjAFjLi8r1/cKTzHWoy5oUIfe5J1lHylOMurfNN0carcrV21kBgslOL/KbsnxwYmatuRmBsAtjmWPvYRdS5v3kqHsXO90khYRCIDXwMd/KjACZm3zYdrQtZIg+h26m+3Yru3icaqpafFB3kvtiEtwKJAIVdQ4jMaX/fFtj/mHI0SWPJS3sidDLOOGVYz4TdV3Bk0mURBAqaGN1cDopyeV+PFinD5pSEBlO70AcU4CMB996q2vlfoF2jhxTyoLfayaemmlJlGEkDOcDqplq/hMYtbNhDoKZXM5dgZ51ysRAAfjvwpxPD+9UPYAIujMsyf/dlJgprZemqE9yakiWNmVVpqCUBOfNJF/aL054qDJs2grVSJjz0Twfg53AZhVgyKvWE1dRR7Oiw6aGgrrjfbzl46cSh1p7+k3olDk4wWIT4dNw5ZrQILRFABdDDHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199018)(6506007)(1076003)(6512007)(36756003)(26005)(186003)(52116002)(6486002)(478600001)(6666004)(107886003)(8936002)(30864003)(5660300002)(4326008)(6916009)(66556008)(66476007)(8676002)(66946007)(38350700002)(41300700001)(38100700002)(2616005)(2906002)(86362001)(316002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6GIeHQeuz33HSrSbjLI+aBpw8IxSdvleCHj57g+bvjcoZs7SAGLNah52qk1E?=
 =?us-ascii?Q?kgq9glLUZWngheskj6z/m/xC15my2trZS6+2J31LS8l1Jg5gZ2q+o0X+MikK?=
 =?us-ascii?Q?BhDrGPCUpeXWLuLAW1p4U19+58EUdT3Xtb4LdelDx7MW5sh5uQwt3kZej2sp?=
 =?us-ascii?Q?/rmZjutmMRnZ96A5l5W15htLvR4381mZ5u5SemceTsyEgp8Ucu7Qpqz1Box7?=
 =?us-ascii?Q?7LyHEdHd/Oza3rtDXv0YI5lJJtZWW3R4/8ZUJRxzSnKNhnAADROwTdpR3WjY?=
 =?us-ascii?Q?AqloiTQVg99Xn9QPS0VT+DPOhF0cR9l2/o0iNmZohMEmGWFwgxHsPKJTBPYZ?=
 =?us-ascii?Q?UsSVyogxuW24cp0MmVQhEeuR9jiWsymHtjuoLno5X/nkz/9yqumUkELn6w3n?=
 =?us-ascii?Q?uork22U5k+CnA/3r3BO2mv8vqth4qOguPTIz/2uPPSh8Q2y67220OSbXPTZy?=
 =?us-ascii?Q?iHmMTU+4pvLCE5sqi4Ojfp69vCvM8eAX27QM3oc2V8tqGkrM55/jbS6TXynZ?=
 =?us-ascii?Q?EHpKco2BZGOQ1r4gtb48gwXNej3OcoWdCXPlgcJUuik3/qeOL/hl2EB++OlZ?=
 =?us-ascii?Q?lDZqoqbZR+xMLaCa9OOtV8p7reES+OEbNdnH7donRS3uPjPpima43S1Pua2m?=
 =?us-ascii?Q?ytPEgpL+i/awvIiYC8vLlXl7XdvbkvRDlOjQUu8a/Upa73NJWeG9fBBJZAEe?=
 =?us-ascii?Q?GHwKR3hOMsAMQTEw3mCQoWCcl+SIkUfLxpyyXPdpu6Fo8fZLXVXt22Zuv1rl?=
 =?us-ascii?Q?bS0bcmrNdYX/MVcuTINhvUBRURE01NSlcGyWMQ39f1btpbgPjDw20GcCpKSj?=
 =?us-ascii?Q?RByeuwBQ5ezsgub8kxQjH7D6sPQTuJznxksNwpQaSqVB7L4ZGqUmLvw62mYJ?=
 =?us-ascii?Q?n6AHGGN57GoSvtxLb5hnSaH4F50ihp7h0zIqdkH8fdWtuLhUF/ZNtJZhp1++?=
 =?us-ascii?Q?Ln1aAGt0U2tmsKutuJHNRR0p9LjMsUKOKiC76WkxNh5nfTW0Yy3cu0vdpgEJ?=
 =?us-ascii?Q?0u9qfCQ/Buio3EVFGbmZ3sezFcO/PAo6cLcPrhYUUb627sOokTUYOVzYDDPP?=
 =?us-ascii?Q?Kl2GjVscltmZtnht6MObzkGK25E+Pqn7dCgKAFbf5plqyEGrOb2EKSRhMNkC?=
 =?us-ascii?Q?yHXHUi594xpMh4wASdQ+3T2sjyPypjSLLX+teQ4z5u8knUcfOi+I0JYYgyaX?=
 =?us-ascii?Q?IzPSOEo1VA0q2KOqTuiyLowf3Zma4QcnPVR/w3N/RSpgppu5R4/dFhrRCXjW?=
 =?us-ascii?Q?rkhPX90Gg1sKMombbh3GKkLTxBPnchRZXMBkbom0JszxioNxaw2ZKONpYSiU?=
 =?us-ascii?Q?BmmqOwH9IbHRE+REc4MDtBTcmkPNz4lX4fuji3y4IITJ6G5ZGAQ6DbMO/nNT?=
 =?us-ascii?Q?lKLmK1ot35+5rbRqnLGWHh4o5/uuOPVGgDDZAaYc34xUv45YLvNH04d3/s2j?=
 =?us-ascii?Q?+F4vlWBZYXSJpxVVRV72LWQp1HKuzF5kkmCcQz3h8xsNiNx3cgIYC5pC8pMB?=
 =?us-ascii?Q?CBlfsBFZKD51r1ahgRxPOigibuYQ2D86MuZfg3vDKFdtuNt3zXUwSs6XnuWh?=
 =?us-ascii?Q?nD2yguIdzrGJz8rGpw8hX0Sf3D90CEJTG0N7IYYwUoW4G0PSHRU0vfVV8/E6?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6053269-4f35-4495-c16f-08db09b7ea47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:36:11.9324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAuNzeTlbR/YtOAroE3mO7I0cm/qIpQooTMdJpNbqGjN6+TS7NxRmR6HAYHkutnAI9ejhi5xY8Yi+/6/89GlaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8494
X-Proofpoint-GUID: iTQ0gaJE6TybCJNsj1XsEYsWpMBEqFec
X-Proofpoint-ORIG-GUID: iTQ0gaJE6TybCJNsj1XsEYsWpMBEqFec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In existing senario, 'migrate' QAPI argument - string uri, is encoded
twice to extract migration parameters for stream connection. This is
not a good representation of migration wire protocol as it is a data
encoding scheme within a data encoding scheme. Qemu should be able to
directly work with results from QAPI without having to do a second
level parsing.
Modified 'migrate' QAPI design supports well defined MigrateChannel
struct which plays important role in avoiding double encoding
of uri strings.

qemu_uri_parsing() parses uri string (kept for backward
compatibility) and populate the MigrateChannel struct parameters.
Migration code flow for all required migration transport types -
socket, exec and rdma is modified.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      | 31 ++++++++++++++++--
 migration/exec.h      |  4 ++-
 migration/migration.c | 75 +++++++++++++++++++++++++++++++++++--------
 migration/rdma.c      | 30 +++++------------
 migration/rdma.h      |  3 +-
 migration/socket.c    | 21 ++++--------
 migration/socket.h    |  3 +-
 7 files changed, 110 insertions(+), 57 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 375d2e1b54..4fa9819792 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -23,14 +23,39 @@
 #include "migration.h"
 #include "io/channel-command.h"
 #include "trace.h"
+#include "qapi/error.h"
 
 
-void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
+void init_exec_array(strList *command, const char *argv[], Error **errp)
+{
+    int i = 0;
+    strList *lst;
+
+    for (lst = command; lst ; lst = lst->next) {
+        argv[i++] = lst->value;
+    }
+
+    /*
+     * Considering exec command always has 3 arguments to execute
+     * a command directly from the bash itself.
+     */
+    if (i > 3) {
+        error_setg(errp, "exec accepts maximum of 3 arguments in the list");
+        return;
+    }
+
+    argv[i] = NULL;
+    return;
+}
+
+void exec_start_outgoing_migration(MigrationState *s, strList *command,
+                                   Error **errp)
 {
     QIOChannel *ioc;
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
+    const char *argv[4];
+    init_exec_array(command, argv, errp);
 
-    trace_migration_exec_outgoing(command);
+    trace_migration_exec_outgoing(argv[2]);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
diff --git a/migration/exec.h b/migration/exec.h
index b210ffde7a..5b39ba6cbb 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -19,8 +19,10 @@
 
 #ifndef QEMU_MIGRATION_EXEC_H
 #define QEMU_MIGRATION_EXEC_H
+void init_exec_array(strList *command, const char *argv[], Error **errp);
+
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
-void exec_start_outgoing_migration(MigrationState *s, const char *host_port,
+void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f6dd8dbb03..accbf72a18 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,6 +63,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "qemu/sockets.h"
 #include "ui/qemu-spice.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
@@ -489,6 +490,44 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
+static bool migrate_uri_parse(const char *uri,
+                              MigrateChannel **channel,
+                              Error **errp)
+{
+    Error *local_err = NULL;
+    MigrateChannel *val = g_new0(MigrateChannel, 1);
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
+
+    if (strstart(uri, "exec:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_EXEC;
+        addrs->u.exec.data = str_split_at_comma(uri + strlen("exec:"));
+    } else if (strstart(uri, "rdma:", NULL) &&
+               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
+        addrs->transport = MIGRATE_TRANSPORT_RDMA;
+        addrs->u.rdma.data = isock;
+    } else if (strstart(uri, "tcp:", NULL) ||
+                strstart(uri, "unix:", NULL) ||
+                strstart(uri, "vsock:", NULL) ||
+                strstart(uri, "fd:", NULL)) {
+        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
+        saddr = socket_parse(uri, &local_err);
+        addrs->u.socket.socket_type = saddr;
+    }
+
+    val->channeltype = MIGRATE_CHANNEL_TYPE_MAIN;
+    val->addr = addrs;
+    *channel = val;
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    return true;
+}
+
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
@@ -2469,7 +2508,8 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
 {
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
 
     if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
                          has_resume && resume, errp)) {
@@ -2490,22 +2530,29 @@ void qmp_migrate(const char *uri, MigrateChannel *channel, bool has_blk,
         error_setg(errp, "uri and channels options should be"
                           "mutually exclusive");
         return;
+    } else if (uri && !migrate_uri_parse(uri, &channel, &local_err)) {
+        error_setg(errp, "Error parsing uri");
+        return;
     }
 
     migrate_protocol_allow_multi_channels(false);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
-#endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_outgoing_migration(s, p, &local_err);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_outgoing_migration(s, p, &local_err);
+    addrs = channel->addr;
+    saddr = channel->addr->u.socket.socket_type;
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_outgoing_migration(s, saddr, &local_err);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
+        }
+    #ifdef CONFIG_RDMA
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, addrs->u.rdma.data, &local_err);
+    #endif
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_outgoing_migration(s, addrs->u.exec.data, &local_err);
     } else {
         if (!(has_resume && resume)) {
             yank_unregister_instance(MIGRATION_YANK_INSTANCE);
diff --git a/migration/rdma.c b/migration/rdma.c
index 288eadc2d2..48f49add6f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -316,7 +316,6 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
-    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2449,9 +2448,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma->channel = NULL;
     }
     g_free(rdma->host);
-    g_free(rdma->host_port);
     rdma->host = NULL;
-    rdma->host_port = NULL;
 }
 
 
@@ -2733,28 +2730,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
     rdma_return_path->is_return_path = true;
 }
 
-static void *qemu_rdma_data_init(const char *host_port, Error **errp)
+static void *qemu_rdma_data_init(InetSocketAddress *saddr, Error **errp)
 {
     RDMAContext *rdma = NULL;
-    InetSocketAddress *addr;
 
-    if (host_port) {
+    if (saddr) {
         rdma = g_new0(RDMAContext, 1);
         rdma->current_index = -1;
         rdma->current_chunk = -1;
 
-        addr = g_new(InetSocketAddress, 1);
-        if (!inet_parse(addr, host_port, NULL)) {
-            rdma->port = atoi(addr->port);
-            rdma->host = g_strdup(addr->host);
-            rdma->host_port = g_strdup(host_port);
-        } else {
-            ERROR(errp, "bad RDMA migration address '%s'", host_port);
-            g_free(rdma);
-            rdma = NULL;
-        }
-
-        qapi_free_InetSocketAddress(addr);
+        rdma->host = g_strdup(saddr->host);
+        rdma->port = atoi(saddr->port);
     }
 
     return rdma;
@@ -3354,6 +3340,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
@@ -4152,14 +4139,13 @@ err:
     error_propagate(errp, local_err);
     if (rdma) {
         g_free(rdma->host);
-        g_free(rdma->host_port);
     }
     g_free(rdma);
     g_free(rdma_return_path);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-                            const char *host_port, Error **errp)
+                            InetSocketAddress *addr, Error **errp)
 {
     MigrationState *s = opaque;
     RDMAContext *rdma_return_path = NULL;
@@ -4172,7 +4158,7 @@ void rdma_start_outgoing_migration(void *opaque,
         return;
     }
 
-    rdma = qemu_rdma_data_init(host_port, errp);
+    rdma = qemu_rdma_data_init(addr, errp);
     if (rdma == NULL) {
         goto err;
     }
@@ -4193,7 +4179,7 @@ void rdma_start_outgoing_migration(void *opaque,
 
     /* RDMA postcopy need a separate queue pair for return path */
     if (migrate_postcopy()) {
-        rdma_return_path = qemu_rdma_data_init(host_port, errp);
+        rdma_return_path = qemu_rdma_data_init(addr, errp);
 
         if (rdma_return_path == NULL) {
             goto return_path_err;
diff --git a/migration/rdma.h b/migration/rdma.h
index de2ba09dc5..8d9978e1a9 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -13,11 +13,12 @@
  * later.  See the COPYING file in the top-level directory.
  *
  */
+#include "io/channel-socket.h"
 
 #ifndef QEMU_MIGRATION_RDMA_H
 #define QEMU_MIGRATION_RDMA_H
 
-void rdma_start_outgoing_migration(void *opaque, const char *host_port,
+void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
                                    Error **errp);
 
 void rdma_start_incoming_migration(const char *host_port, Error **errp);
diff --git a/migration/socket.c b/migration/socket.c
index e6fdf3c5e1..c751e0bfc1 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -27,6 +27,8 @@
 #include "io/net-listener.h"
 #include "trace.h"
 #include "postcopy-ram.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
 
 struct SocketOutgoingArgs {
     SocketAddress *saddr;
@@ -107,19 +109,20 @@ out:
     object_unref(OBJECT(sioc));
 }
 
-static void
-socket_start_outgoing_migration_internal(MigrationState *s,
+void socket_start_outgoing_migration(MigrationState *s,
                                          SocketAddress *saddr,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     struct SocketConnectData *data = g_new0(struct SocketConnectData, 1);
+    SocketAddress *addr = g_new0(SocketAddress, 1);
+    addr = QAPI_CLONE(SocketAddress, saddr);
 
     data->s = s;
 
     /* in case previous migration leaked it */
     qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
+    outgoing_args.saddr = addr;
 
     if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
         data->hostname = g_strdup(saddr->u.inet.host);
@@ -134,18 +137,6 @@ socket_start_outgoing_migration_internal(MigrationState *s,
                                      NULL);
 }
 
-void socket_start_outgoing_migration(MigrationState *s,
-                                     const char *str,
-                                     Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_outgoing_migration_internal(s, saddr, &err);
-    }
-    error_propagate(errp, err);
-}
-
 static void socket_accept_incoming_migration(QIONetListener *listener,
                                              QIOChannelSocket *cioc,
                                              gpointer opaque)
diff --git a/migration/socket.h b/migration/socket.h
index dc54df4e6c..95c9c166ec 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -19,6 +19,7 @@
 
 #include "io/channel.h"
 #include "io/task.h"
+#include "io/channel-socket.h"
 
 void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
@@ -26,6 +27,6 @@ int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, Error **errp);
 
-void socket_start_outgoing_migration(MigrationState *s, const char *str,
+void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
 #endif
-- 
2.22.3


