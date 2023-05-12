Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9A700A60
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:34:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTpR-0007vS-Jb; Fri, 12 May 2023 10:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpP-0007uY-Ei
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:03 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1pxTpM-0002cC-UP
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:33:03 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C9NQJl024537; Fri, 12 May 2023 07:32:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=UDZn05OAEca7HLJfI4lSENEtwMOG6fFshWxgZ2GPeJY=;
 b=o/XZ57sqce89y64h3iF8YKNd1LhNEUtt53H20EJ4F7MppVnWBNp/4baBu3wjKt8xKdlU
 2MO9Kogl0ubRJdvNLttPNHXnUd7fsdBm0fFG7aSBHcq9vzys1kzjAL2TLRfJeCxpuHWL
 /SWjN7zH9MT4iHXlWPMpolc/1Aoh9OH1on/JchQAWflVFEUnk1/iDhTnnzJVQgpP8m+V
 +U9/RDrSLnYM4ayKEPsGmyrhEN8wF8XyVf7um6t3xvtSJULhoKQftPNg3fS/345auql2
 TKkcYij0wIMLWfEKnQ0OQRlljjFgT40DmSrLJwQLPr8qDkAvSmNGOxi8GBbcB6gKmHnn 2Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3qf7g6a11r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 07:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrXKYBDo5/qainL0d+DpKYwSjgCndtHcgV7+lPbw6l07PXjNL2Y1arGwl9thMnBywO8pkvpo8dFP3hznkSSUsPs6rNDq+vtqlKTbFwtnjDP/A/xVwB8VvGrn1vL5jAJZ7V3H2PC79EA/dHanTkYdDqxdTCgg00TfRdOnwrGGkLi9C5IiUUrpB06H+yT1ZJvcOUtGcmnxnznZncSjFYEnNTIJDaJuXR20CPkqvBE8znQIoFCl0kJJDBEnuad5fdJF7EW1PDJhT799f+lWFoslPxGRPrOTODP8aMhJ0bjLBOuK/Z1hCIiOZurMQpQvVSVdaF2PZ+Wu6ashROoFPnaLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDZn05OAEca7HLJfI4lSENEtwMOG6fFshWxgZ2GPeJY=;
 b=D1W/CBMtychWZkubpbpRjuqSufN1t5/u1zUv7sUs38DIsqJU7K96HpDLKCUvMPR+AKXUTcy0AbWbVvJAHGlDvi8NsjZFwlQaSgq/Ksh2n6r3/agCaX7k/cG4zJ3qJAtmckirhI56eOTfeBlIPCoS0o6y2EFTXfFP9eGfhGcKcQ5l2rhGa0TYcKnueyhdMb8m3shjIf6k4vIuSZnHO4Q4gU1kvuSQgE7QyjW4cHmQDfta5ozzggpK03GG1KdUJ3vqZmXdkdhBwNZlGJIvjmrEdLJFBxQiWpAZWOuJgl6u7z4ptJD2bHEtFs5PfTb8p0q2r4E1uHaHlJl/pBjJNYRPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDZn05OAEca7HLJfI4lSENEtwMOG6fFshWxgZ2GPeJY=;
 b=H98u5+1W/3/uSjLaPw+48T9sXVnxNEJbWWeqZXYInn5uhOzH8OY9xD2ZvBeKUZyw+fG5D8EPyZj3OmYhydMPN7CW2BjNZoP8YkXrlB0EXYgUsKiFlOUtK3lp/1/qxVhr5Szs4TjbhoclZyBoUzi9hP3AdTWyYqw4uPjxcRCDm/8mt6vHjE36EekVeDHUOrcRPPeK6lnZHgphfaP6qWGrYOJ7zUXK9L+PPF0ZLJhRrLrmWLtgFdMzKBXHV/c3b4gW4JaANt3NxOcbsfDPGmHnWIhJcPaCW+MKxjDf05nBH+PlwNIUe57DBsPyU3nZWwvk5cF3lDnHNVsRahnARTI1Ug==
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 14:32:52 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::4500:569:a3d6:71c9%6]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 14:32:52 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: prerna.saxena@nutanix.com, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com, Het Gala <het.gala@nutanix.com>
Subject: [PATCH v4 4/8] migration: converts rdma backend to accept
 MigrateAddress struct
Date: Fri, 12 May 2023 14:32:36 +0000
Message-Id: <20230512143240.192504-5-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230512143240.192504-1-het.gala@nutanix.com>
References: <20230512143240.192504-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4343:EE_|BL3PR02MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c64e46b-80b4-4dd6-3cd5-08db52f5c45d
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlGiK4a6sKLgMzibT5xFGrjChr/egRI8a11/x23PVTIwyXy6B+3U/2+sO1/9zW1kDOsFwh0hDF8wr64Ifax8deHQPM9rKnZRPrSBjdWZq2NJh4cE9enlmT3O+a25qfIJ8pCnz/MqK1y8oSyCAAlwvainkQmq8LQ5sHIK8SjudgX5u5W9AMDPeA3aM1CFP6wl2FrK7la/sIMogUcjzWSPLqh0N1dLvlPQQw0z9w2p3xK0GEwMOzBaGUC7cb2MALnKKa4/GoSo3IDWTHjsCHDuLc+1PM6kK5JPNzFqFb+hr6B9dUG+S/oX4HA5h5eUWVBihVI2JbjU0mhQudVqh1GkTNJREvNPH5RfZnBBhStw7bOJXwiN/gvmCa6sX9DQcFkahuAsNnvG64b2yaiviKhmXaO6zS4BACMTmMJlNdYgHNRcmV7b+xo9aNOvHa0OMIY31G4+mBKzTp/OrpTL69UjZOHdkVyM6SONjWSap14S8f3muXfQQX3OcVQLQfSpKCs3P1RM10D4Ep+RnHjAicv9woVACboZVOUp14kjJGcH8QUnMtlDXp6xVEvIlRP2bsYAezONF8i9ux3+J66lkjfdD6+eI0LgxNC3/5Ds7vF9FEgFmNRBBvaUNTYWHh6mqzVM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(5660300002)(26005)(6512007)(83380400001)(1076003)(38350700002)(186003)(52116002)(2616005)(38100700002)(6506007)(2906002)(107886003)(44832011)(8676002)(8936002)(36756003)(478600001)(6486002)(6666004)(41300700001)(316002)(86362001)(66556008)(4326008)(66476007)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VcBBoUs7f8ZkoU18cQZKr4GNFrh7dGfuTDDIMik+JSoX9+Sqzf9pjfiSCI94?=
 =?us-ascii?Q?96uJvjycWNfge3omq2hiGq4pSbQrD5aISWVRzJ+2Q4cGsVWewd5QaFQlcI++?=
 =?us-ascii?Q?1uE6qIsmdTH1ktxGxpo2qvnwh+AtDa47xqLmUpAtfZGAlRhPM1z4r5sBsJyf?=
 =?us-ascii?Q?A0eMF5VgPPVjDcB6hB3A9SO2gHUT9Xs+oqhGE60QyeQsOezwVTBpfDEB7mNF?=
 =?us-ascii?Q?oL4QKV3Onee7uNuax2JHCPEFox+KNGw24VqrGF8/6UDW+pOtAIiTZ0ynyB30?=
 =?us-ascii?Q?kOADAV//jLVRZiXDdcxbobVLs7gvtvgBTKow6ziJ8kymMBOIv7YXM9oRx0na?=
 =?us-ascii?Q?XBgsJ1jKXa5RdcE0hpY5jMEjLxQjegpg/9u0Lt8JFnG7OknxQnvuKhiAqoYg?=
 =?us-ascii?Q?ZOVOrGaU9wCQa7LUTUZMelbJ+HfY+Hl1n6caluOJe8Hn3Oz13CYSOU3T1SpD?=
 =?us-ascii?Q?fzFjPpHeBieOfHruxCBE0p7zjE3cV/W0yBpv8trbdwVfT9ND19fqBDm672vK?=
 =?us-ascii?Q?5H3op+bxMG23MDMHp1KUQLrLj5hmUo/bUyMaktX5OlS3tcSujmdwJmj05tUW?=
 =?us-ascii?Q?cWusYvguZZoGp/KTXhTIP98l+gPykNTSWAoGbJrazUxht2Y4E+0bispLlS84?=
 =?us-ascii?Q?JGmcZkGSNficmsUYoncif1dSnJZOLoyovvBu4+WJv85Drcn+dzCsZ24djZLo?=
 =?us-ascii?Q?ryz3vFbZ+Zw/8eKDICf2olpCAYwoKqGJp3fmd+s9xcsALFg1PgONaN0UZLWU?=
 =?us-ascii?Q?uQI0OY/A1dlrVL0RQADB70cM3LBDYGuxPVZPDFR+K7Y+1PGsse+VpjXSi+yx?=
 =?us-ascii?Q?/usl4pG1r1B6pVii49KlYjv6JnxXkEQEoEN9UDwY37gLhw4CsOrOhoPwczcd?=
 =?us-ascii?Q?2soegD6JhtseLZrCUVQDxsjQmsKpSUXm9y8DSGnstCGsTj71uzXPgUdiok8N?=
 =?us-ascii?Q?uzdrP1DhCOny3RKSASzK4hLd7jy2hejorsohi93zGAmGTeKOS2o4CQ52QZDE?=
 =?us-ascii?Q?X0uU+uD7mCuM6i4lbR6YmNtXzIPMA2GxSt/cUrv7/uL1iFFGf8HdMetNg/cE?=
 =?us-ascii?Q?vrgGqbybsY9OSVW9SfLey819BW0AU2YNLIhhD2sJ0S5uUZYb2+2F4WJ/Tn2v?=
 =?us-ascii?Q?6oMIKnmH3ccx6Qfi0PGwR/Oq6hh3PHSTzTtyiV3ghA7R3YH2cCu2Cp8FfoM1?=
 =?us-ascii?Q?bvr0RY7HOTK7tYezFmYN9rO4GXQDjwmFOxTdZvzx1GablxFKKzPwFn1TjbIQ?=
 =?us-ascii?Q?U1SG/NlBQdkOHzW52ZZBrS1wL3UHy7bN8Kr0tJna3IONPeg6SruV+j1BsdRP?=
 =?us-ascii?Q?xpE2HmDwNBv6cLWuStygkoLz7MKVKO+z7RLrMa7BMSRV4eLTR6SXNZCroU5p?=
 =?us-ascii?Q?Bcuxcn0K7skYYmh8/hfoz3puPaGLo6d3cFpa02oryG2YnGR2C5Lv9wKynsoj?=
 =?us-ascii?Q?1bHNJdk1o2nB/Re3WHe8iSRIrsJpj6h1CySdX59Cc82rtIJdilSEkR86cXac?=
 =?us-ascii?Q?dnqjW7p8q6xDv9Akf+lRP2IqLLVlM84Bq06BJ3i4GHWWHNo/EyJW4dKk5Onq?=
 =?us-ascii?Q?Uq1mEoTIsFdeR7vsJUsqb6m0aqtLUmU51Qdwum3K?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c64e46b-80b4-4dd6-3cd5-08db52f5c45d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:32:52.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTUCRl4JOrdL9Qrr14aqXtlbuEcd+WRadNd7uHxAcId8Sncf3EqN7FLPGiaNwKVQJP2RQ8oSXTD7hXPQ+drW8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
X-Proofpoint-GUID: JxDZnpDzS--d4EdDMyVPo8abtnErqe9g
X-Proofpoint-ORIG-GUID: JxDZnpDzS--d4EdDMyVPo8abtnErqe9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RDMA based transport backend for 'migrate'/'migrate-incoming' QAPIs
accept new wire protocol of MigrateAddress struct.

It is achived by parsing 'uri' string and storing migration parameters
required for RDMA connection into well defined InetSocketAddress struct.

Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c |  8 ++++----
 migration/rdma.c      | 38 ++++++++++++++++----------------------
 migration/rdma.h      |  6 ++++--
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 61f52d2f90..b7c3b939d5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -480,8 +480,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
             fd_start_incoming_migration(saddr->u.fd.str, &local_err);
         }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_incoming_migration(p, errp);
+    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_incoming_migration(&channel->u.rdma, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_incoming_migration(p, errp);
@@ -1737,8 +1737,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
             fd_start_outgoing_migration(s, saddr->u.fd.str, &local_err);
         }
 #ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_outgoing_migration(s, p, &local_err);
+    } else if (channel->transport == MIGRATE_TRANSPORT_RDMA) {
+        rdma_start_outgoing_migration(s, &channel->u.rdma, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
         exec_start_outgoing_migration(s, p, &local_err);
diff --git a/migration/rdma.c b/migration/rdma.c
index 2cd8f1cc66..32b4b8099e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -319,7 +319,6 @@ typedef struct RDMALocalBlocks {
 typedef struct RDMAContext {
     char *host;
     int port;
-    char *host_port;
 
     RDMAWorkRequestData wr_data[RDMA_WRID_MAX];
 
@@ -2455,9 +2454,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
         rdma->channel = NULL;
     }
     g_free(rdma->host);
-    g_free(rdma->host_port);
     rdma->host = NULL;
-    rdma->host_port = NULL;
 }
 
 
@@ -2739,28 +2736,17 @@ static void qemu_rdma_return_path_dest_init(RDMAContext *rdma_return_path,
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
@@ -3360,10 +3346,12 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
+    InetSocketAddress *isock = g_new0(InetSocketAddress, 1);
     struct rdma_cm_event *cm_event;
     struct ibv_context *verbs;
     int ret = -EINVAL;
     int idx;
+    char arr[8];
 
     ret = rdma_get_cm_event(rdma->channel, &cm_event);
     if (ret) {
@@ -3375,13 +3363,17 @@ static int qemu_rdma_accept(RDMAContext *rdma)
         goto err_rdma_dest_wait;
     }
 
+    isock->host = rdma->host;
+    sprintf(arr,"%d", rdma->port);
+    isock->port = arr;
+
     /*
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
     if ((migrate_postcopy() || migrate_return_path())
         && !rdma->is_return_path) {
-        rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
+        rdma_return_path = qemu_rdma_data_init(isock, NULL);
         if (rdma_return_path == NULL) {
             rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
@@ -3506,6 +3498,8 @@ static int qemu_rdma_accept(RDMAContext *rdma)
 err_rdma_dest_wait:
     rdma->error_state = ret;
     qemu_rdma_cleanup(rdma);
+    qapi_free_InetSocketAddress(isock);
+    g_free(arr);
     g_free(rdma_return_path);
     return ret;
 }
@@ -4114,7 +4108,8 @@ static void rdma_accept_incoming_migration(void *opaque)
     }
 }
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp)
+void rdma_start_incoming_migration(InetSocketAddress *host_port,
+                                   Error **errp)
 {
     int ret;
     RDMAContext *rdma;
@@ -4160,13 +4155,12 @@ err:
     error_propagate(errp, local_err);
     if (rdma) {
         g_free(rdma->host);
-        g_free(rdma->host_port);
     }
     g_free(rdma);
 }
 
 void rdma_start_outgoing_migration(void *opaque,
-                            const char *host_port, Error **errp)
+                            InetSocketAddress *host_port, Error **errp)
 {
     MigrationState *s = opaque;
     RDMAContext *rdma_return_path = NULL;
diff --git a/migration/rdma.h b/migration/rdma.h
index de2ba09dc5..ee89296555 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -14,12 +14,14 @@
  *
  */
 
+#include "qemu/sockets.h"
+
 #ifndef QEMU_MIGRATION_RDMA_H
 #define QEMU_MIGRATION_RDMA_H
 
-void rdma_start_outgoing_migration(void *opaque, const char *host_port,
+void rdma_start_outgoing_migration(void *opaque, InetSocketAddress *host_port,
                                    Error **errp);
 
-void rdma_start_incoming_migration(const char *host_port, Error **errp);
+void rdma_start_incoming_migration(InetSocketAddress *host_port, Error **errp);
 
 #endif
-- 
2.22.3


