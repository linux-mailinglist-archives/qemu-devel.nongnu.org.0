Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BB6904C2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 11:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ4AN-0001IZ-OG; Thu, 09 Feb 2023 05:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AL-0001I0-Qm
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:33 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pQ4AI-000829-ID
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 05:28:33 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3199XZqZ011953; Thu, 9 Feb 2023 02:28:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=wLPpiTFcgN4z3g3sBmnlbvJ95oOaTzb4FGwEmE/cT5I=;
 b=uwgsq9w5E5rmnV8DXbI6gPlqGGfqYZcIIBI/cyo9qWjqP/cT95t+fxYRHVhf1myECpOn
 H/1rKqPhc0SgFmy4pnmYI/h9NbKXV7JXJTAyqQNWa98kmZp+q9iMYYMKRJqoSkm08yHK
 EHdZ4tLmCyjEQHr9c+LbGG8MkXvXHjPYgadLxnXBtb6FNs4iY7nlb4K0Q4RrfxJ77IzW
 QACgO5WAv1+H3mAlQZTs8t4DpG8eK54O2b3EiW/+yL40xwm9je/cNoAXE0LBOUFnh3T+
 nNPi9i6h8Zur0u9MfftpRiEy1at3qDN0T6YEhpWE8CIv2w5Krc20yA4NTp7Hy94AsgyU Pw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nhqt4q2ua-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 02:28:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfY0ViZVC2yILxfD/dB0/W1zsPzAyPuAdcJv/4Q+LA3sa2dXYVjyQpsL6pxPaO18NEbdmNtg3I/5doYF6LzG04ItxzjkPY7jx16zN6Ve+4O3Fnpk/+rjCgpRdm+mqjT7qOBZO1oG0WVVq7LRFx2YMKcQH/3PZ/Ii2a8uvagGtFgzwdqiTXz3WCRWCCs2YJnw4fBY5fGLd1814K4CfeQli538fFeQkFyq65B5pmSnauzmQrc15N/5L4MdeKLfqkrl+1LbaWwbJOeAHtEQ3OCrVIZm3ScyykLi26eZlyjkkEy2XsF9PNeY+sq46gGXyHk6DQ94cEYCQZFp+r9pRTfbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLPpiTFcgN4z3g3sBmnlbvJ95oOaTzb4FGwEmE/cT5I=;
 b=L30eUaFeqpGdDu/gU3ba9zYlLfKgxDNIZNdoB2sXeaPQN2/afwXgWsnlPKPO5xAkTSSMxBTyYc9UDNyEDd5W8I0z2e1ihGif4HZQGca4SO7/nouzJ2YlxVS/qBN5RmFI90CxtSllqpiYh0fAdaGco11p5AyeEZHjkfh5kpP86QuuY4Kp2io+3+xfS2Y35dHywF5zGDLXipBEJsIouplaVaZprpL7fpsGQU+mWNWwDa3wJcKyiA3YZ/nwp7R7LDK0YpW8eqf89wFnHS4p+ZXo5G+XLqhk4IPrqH/qkfNMg82SUC0c0m/+PbifsnOkZvg73C944M5lZgwdoQQsHbKviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLPpiTFcgN4z3g3sBmnlbvJ95oOaTzb4FGwEmE/cT5I=;
 b=G5zyNBz6T319z/wVtxjgQQxXJ5yXO+IrkjE03Ylud5rZq4bRpQqQW6QfqhDiNAqTRRLNdh/JTA89Ln8gs8YZQIpH39R0tLhofnSd79+7tzD/SyHCCpDPi9L4WcGObG+ReynoUzsVJKk8QsoDOtgES7xLchDrU2HAhkllC9EL/PSzoQ+FKiYv/0aGmQ8IclyWHoKd+OzqclnYyzPvDX34Tb4X4LJdq+4mw+fLuKpJuwabUvrcYwKm78vCO5ABP6X4m4AeIIo8nFSW7Yo07p+g1akHVHgN3r6/q7fJDfkLtx+fmZ9A4ybzNNMUPTyIxpTE3pUmJde517gMrfmU/bjXrw==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DS0PR02MB8928.namprd02.prod.outlook.com (2603:10b6:8:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 10:28:10 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::707d:b1c1:e895:94ac%3]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:28:10 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v3 6/6] migration: Established connection for listener sockets
 on the dest interface
Date: Thu,  9 Feb 2023 10:27:54 +0000
Message-Id: <20230209102754.81578-7-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230209102754.81578-1-het.gala@nutanix.com>
References: <20230209102754.81578-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|DS0PR02MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c7f365-c9fd-4389-906c-08db0a885770
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXMcA3wkN/viodUL8cIVfo8vF32tR936NiKqG3QD4SCZ1aM/Ed8lt8M/c4VO+2r8RGYi5GcbE5YCRIxHz4WnB4gjfLTr3PkieUpzBP7InDFTiHtjK7po6EOn0IAba9L64u+5gPneQjkoG/OUd53AnJ6esI73pBZdEquGJWsjlV+ox9ETNRYNQfH8BdvnSu5ubagT+sFjGpVcteN6RI2cxYfbCOeR4+crvl7XQA0Kp1csXSCN4Xm+PhHRYOtqVCTI/uvrxHxWsLICMRaK1MGpCF8TUaTnV/eVyuheSX1/zJysT+nZI9wmi32P7l5E9peKYojftZ5DA5DhXbXatKDWKYxyRyhliqPjBN3bOV6a0MWJCD10GB6gmmpGuzepnUAI9aYKRFBQQuJOjsvlBCtNaS3+mEdiprs744ze1AKMhJ9hG2bAvgFt7VRrvrVBMPd8g0N0ON4NDTRix4lB8yaaaxCC/6LAhJ29cytf6PIJmnSMO58Yd0jMJ9tL2AKiHUBfJEGUfOri57NsCtitsH0EeiPQeAxtnsRIPpzmRMhIimSOcl2/9gmHTDmRoq29URgqJX+ZZBul65iXyvlwiW2Zjt4IyAvw5evNKQvtN8bm/vwo0dVqPqf5lBkdU42YbNLu22nQVEW5qCwv3aXe3S4QaQdCPZCQXw0hy1nb0fb3u37s5a0cKSbA71HL/Oqla+bgU853PSMU1V1CBpJx0RPIeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(36756003)(66476007)(38350700002)(83380400001)(38100700002)(8676002)(4326008)(66556008)(66946007)(26005)(6512007)(316002)(6486002)(6666004)(107886003)(1076003)(6506007)(5660300002)(186003)(44832011)(86362001)(478600001)(41300700001)(52116002)(8936002)(6916009)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDWxJhyMWE7evRcEYvTfrUqPJ+84rBBqcqj2/4zmRGH/SK9foQ17ilTUjTMG?=
 =?us-ascii?Q?3IwzMmLbNe320+LUTAa8mw9ut7DGvd7pEqQd/w19YtJEi54sPIe8FwC4EWlF?=
 =?us-ascii?Q?V4R5qdU8C7rnyKvA4nKmGYE5OdOPurqET9+J7PTXHU1haH/ZOC1knsRNm4PB?=
 =?us-ascii?Q?4gke/LbVpdOIqtC4LJiI7ooedagiYIsi5HjfhN7fO+pGaKpUMb69mL1dJWl7?=
 =?us-ascii?Q?LSAo8XPO7dXYXdkCmJqhbZhsCQlgEBPjAunI4H9yjh7GyyRa8qYxT8/zP7YF?=
 =?us-ascii?Q?WBsSz7C4wqQFVqqXSDJHdF/RlyiL1zNKPSSPOU5fT6P//w0N/35HTq0EHWyf?=
 =?us-ascii?Q?fj+G6cWzbgIQVxpHAgAVFTzf/LDwxgKYuOZ6KR66icYC23YVsmQG/wHsJJya?=
 =?us-ascii?Q?l2rEQ2kRAvu3f6g77P0Utm/0wWR8zuiAbY+tCXsZVK4hbZRPdJkwQaM785+N?=
 =?us-ascii?Q?cezKp/HdMtXqthtpylhyQz0xwSUzBpRateLsKtnpYuScvjYRhxQ90/eS9HGy?=
 =?us-ascii?Q?u1m2cTf+2pmPSIlc3KDNSd8ZmaqWfHfftqeUKdkPpT0JGUxyEem6XdGx92Pe?=
 =?us-ascii?Q?CJuVm/I9DvfQwHz6rIezU7BNhBG6qog4rblUa+qwKWZp2SJHIKxaf7de8i5X?=
 =?us-ascii?Q?RNrkb9b2uf6kJyF0dHL+mctyobr2m5d9S1wuyXqlkW0vbOwdQJCWU61fkLHh?=
 =?us-ascii?Q?J693Ff7DpkmI4LaPYLAQ+WEULD9yktvKdAIeS8uCrRa9KG5VNIIvxbbpXqzO?=
 =?us-ascii?Q?Qvo5jBkfMJVcwP4fzGg24vTHhtvFXV9GNkXKxp5Xg5b3HVlWh5TsgPVTdOtr?=
 =?us-ascii?Q?ma56pa2CaWG5FHgv1NsP7veIBOG8ztl6NvOFXb715FDcy0c05O5kmXMSB9tu?=
 =?us-ascii?Q?Y6wYvL+gtpTmkiCQwgN1areYZIQostEPN8+00+H6W8QnSOp+soCiWmoaFGga?=
 =?us-ascii?Q?dW1spCaIRrcechMcbZ3/HlDt0e1/1dss1p5qtqafheCkx4DDefzH5KE8jzlb?=
 =?us-ascii?Q?hIl5sdPBYDzrDk9R0kfh9/PNiXN5z46DmbbG6IeRpTlerHeraAlktOCB5PAy?=
 =?us-ascii?Q?zc+w3ljzWSk355+59tPeTyB9c17kt81ZuC2MbfU4P/9bxtoT+76lSkZ6USVe?=
 =?us-ascii?Q?bHZj1pKPqf5X3IxrODVC3Tzg62FwJcK/Qzokgg7R/bkZisCgf0nDI8IcjYNT?=
 =?us-ascii?Q?nsb1B0Z4As/2ROVSE78Dp8XrAKaNjsiwqvI0KJDPEwUlCurRdrRZTotP72Xn?=
 =?us-ascii?Q?9/KE4z2mk49fkTHJCUPcZAZJwTnkYhXs4gSXrNfHOoLj1n3TlRAg5hcihyM5?=
 =?us-ascii?Q?gSrRxt3R+voJvPqijuQ0+QAWebYWFFQgX5wkcOjTd+QvKiOiMgnDpM5Wt1Mm?=
 =?us-ascii?Q?xSeVOn85jTpoCuWQUiF+alSgk61ld+FoA5PBMHj9b4H3/oBc/stiy+qXOOVx?=
 =?us-ascii?Q?qmilp1Kk9NQiU3BLtQlgMS1/x1RF7Lp11iOnt6diQW0z18kKo2iKwRGM/At5?=
 =?us-ascii?Q?sFMqlBGOwLqyoMcHPf+RLDmEJaVpCMnAr4WzLJib4t3JDJhSn75RkawcDfbP?=
 =?us-ascii?Q?oZpgD5mEIyaiOm8Vp+uWCLpshFh0zFjqxPn06nI2IHNC2DDrCTHB61LItZY/?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c7f365-c9fd-4389-906c-08db0a885770
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:28:10.3913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSN++Oo3aFgcNgn+WoigOl8W8z1ifT7a2gctczCCFCuC7Uj38pHxlRYL4Ggt692LspmCRnp10KU8qZfTPKDfXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8928
X-Proofpoint-ORIG-GUID: t_x6l7zaYQ5yogqwt67rUYQTlox6gD7f
X-Proofpoint-GUID: t_x6l7zaYQ5yogqwt67rUYQTlox6gD7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_08,2023-02-08_02,2022-06-22_01
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

Modified 'migrate-incoming' QAPI design supports MigrateChannel parameters.
This well-defined struct replaces uri string to prevent multiple encodings.
(uri paramter is kept for backward compatibility).

socket_start_incoming_migration() has been deprecated  and
socket_start_incoming_migration_internal() name has been replaced with
socket_outgoing_migration().
qemu_uri_parsing() has been used to populate the migration parameters in
MigrateChannel struct.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/exec.c      |  7 +++---
 migration/exec.h      |  2 +-
 migration/migration.c | 51 +++++++++++++++++++++++++++++--------------
 migration/rdma.c      |  9 +++++---
 migration/rdma.h      |  2 +-
 migration/socket.c    | 16 ++------------
 migration/socket.h    |  2 +-
 7 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/migration/exec.c b/migration/exec.c
index 4fa9819792..8506ad7f18 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -77,12 +77,13 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
     return G_SOURCE_REMOVE;
 }
 
-void exec_start_incoming_migration(const char *command, Error **errp)
+void exec_start_incoming_migration(strList *command, Error **errp)
 {
     QIOChannel *ioc;
-    const char *argv[] = { "/bin/sh", "-c", command, NULL };
+    const char *argv[4];
+    init_exec_array(command, argv, errp);
 
-    trace_migration_exec_incoming(command);
+    trace_migration_exec_incoming(argv[2]);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
                                                     O_RDWR,
                                                     errp));
diff --git a/migration/exec.h b/migration/exec.h
index 5b39ba6cbb..5335f7c24a 100644
--- a/migration/exec.h
+++ b/migration/exec.h
@@ -21,7 +21,7 @@
 #define QEMU_MIGRATION_EXEC_H
 void init_exec_array(strList *command, const char *argv[], Error **errp);
 
-void exec_start_incoming_migration(const char *host_port, Error **errp);
+void exec_start_incoming_migration(strList *host_port, Error **errp);
 
 void exec_start_outgoing_migration(MigrationState *s, strList *host_port,
                                    Error **errp);
diff --git a/migration/migration.c b/migration/migration.c
index 5fbf252243..35d5e1e72d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -528,27 +528,46 @@ static bool migrate_uri_parse(const char *uri,
     return true;
 }
 
-static void qemu_start_incoming_migration(const char *uri, Error **errp)
+static void qemu_start_incoming_migration(const char *uri,
+                                          MigrateChannel *channel,
+                                          Error **errp)
 {
-    const char *p = NULL;
+    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
+    SocketAddress *saddr = g_new0(SocketAddress, 1);
+
+    /*
+     * Having preliminary checks for uri and channel
+     */
+    if (uri && channel) {
+        error_setg(errp, "uri and channels options should be used "
+                          "mutually exclusive");
+        return;
+    } else if (uri && !migrate_uri_parse(uri, &channel, errp)) {
+        error_setg(errp, "Error parsing uri");
+        return;
+    }
 
     migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+    addrs = channel->addr;
+    saddr = channel->addr->u.socket.data;
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_incoming_migration(p ? p : uri, errp);
+    if (addrs->transport == MIGRATE_TRANSPORT_SOCKET) {
+        if (saddr->type == SOCKET_ADDRESS_TYPE_INET ||
+            saddr->type == SOCKET_ADDRESS_TYPE_UNIX ||
+            saddr->type == SOCKET_ADDRESS_TYPE_VSOCK) {
+            migrate_protocol_allow_multi_channels(true);
+            socket_start_incoming_migration(saddr, errp);
+        } else if (saddr->type == SOCKET_ADDRESS_TYPE_FD) {
+            fd_start_incoming_migration(saddr->u.fd.str, errp);
+        }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_incoming_migration(p, errp);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_incoming_migration(addrs->u.rdma.data, errp);
 #endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
+    } else if (addrs->transport == MIGRATE_TRANSPORT_EXEC) {
+        exec_start_incoming_migration(addrs->u.exec.data, errp);
     } else {
-        error_setg(errp, "unknown migration protocol: %s", uri);
+        error_setg(errp, "unknown migration protocol: %i", addrs->transport);
     }
 }
 
@@ -2333,7 +2352,7 @@ void qmp_migrate_incoming(const char *uri, MigrateChannel *channel,
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    qemu_start_incoming_migration(uri, channel, &local_err);
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2369,7 +2388,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, NULL, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/rdma.c b/migration/rdma.c
index 48f49add6f..0225bbaf3c 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3356,12 +3356,15 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    isock->host = rdma->host;
+    isock->port = (char *)(intptr_t)rdma->port;
+
     /*
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
     if (migrate_postcopy() && !rdma->is_return_path) {
-        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        rdma_return_path = qemu_rdma_data_init(isock, NULL);
         if (rdma_return_path == NULL) {
             rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
@@ -4093,7 +4096,7 @@ static void rdma_accept_incoming_migration(void *opaque)
     }
 }
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp)
+void rdma_start_incoming_migration(InetSocketAddress *addr, Error **errp)
 {
     int ret;
     RDMAContext *rdma, *rdma_return_path = NULL;
@@ -4107,7 +4110,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         return;
     }
 
-    rdma = qemu_rdma_data_init(host_port, &local_err);
+    rdma = qemu_rdma_data_init(addr, &local_err);
     if (rdma == NULL) {
         goto err;
     }
diff --git a/migration/rdma.h b/migration/rdma.h
index 8d9978e1a9..40673287a7 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -21,6 +21,6 @@
 void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *addr,
                                    Error **errp);
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp);
+void rdma_start_incoming_migration(InetSocketAddress *addr, Error **errp);
 
 #endif
diff --git a/migration/socket.c b/migration/socket.c
index c751e0bfc1..6469d615d6 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -162,9 +162,8 @@ socket_incoming_migration_end(void *opaque)
     object_unref(OBJECT(listener));
 }
 
-static void
-socket_start_incoming_migration_internal(SocketAddress *saddr,
-                                         Error **errp)
+void socket_start_incoming_migration(SocketAddress *saddr,
+                                     Error **errp)
 {
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -202,14 +201,3 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
         qapi_free_SocketAddress(address);
     }
 }
-
-void socket_start_incoming_migration(const char *str, Error **errp)
-{
-    Error *err = NULL;
-    SocketAddress *saddr = socket_parse(str, &err);
-    if (!err) {
-        socket_start_incoming_migration_internal(saddr, &err);
-    }
-    qapi_free_SocketAddress(saddr);
-    error_propagate(errp, err);
-}
diff --git a/migration/socket.h b/migration/socket.h
index 95c9c166ec..4769a2bdf9 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -25,7 +25,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
-void socket_start_incoming_migration(const char *str, Error **errp);
+void socket_start_incoming_migration(SocketAddress *saddr, Error **errp);
 
 void socket_start_outgoing_migration(MigrationState *s, SocketAddress *saddr,
                                      Error **errp);
-- 
2.22.3


