Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08F6FB3E9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:34:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2rT-0006Ki-3J; Mon, 08 May 2023 11:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pw2rO-0006It-Pg
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:33:13 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tejus.gk@nutanix.com>)
 id 1pw2r9-0005p8-Jn
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:32:57 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348EfeCe020034; Mon, 8 May 2023 08:32:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=RD91zFmMHYiH911t5ODfrKOHDPnUsfW6hzZ2RienThE=;
 b=XZTCvFJlVFM1hbHZLU5UXzuqB3bD65E7kyUbYMvvPD1dLQDymdNKJgnRynRmw7dJmifn
 bXyZUCORMaN+pK80PH/JMCKKT2ui7Lh76AbzQC+8kAgPep71NwFp6UItPOowxPJXQNKY
 NshH7VHYXbg3TtCEcB/SQZ/d9RtjrUwqvQ8CIRGNUykflqRHGGqqFUJmwHSXgAlzP4zI
 GpoBkXPAlKgT+Y+KxLQ6Q+UgywU73+E0+Yd8CXkuHVbaxe3+2VOVgnwobEsRLE+EoKvp
 TA3eIi6ckvQheRtMhsNTwnOY6eBn8k5qwrL3bbUGGtrQzuiGg+AHLGDbiu0PqtIREquz BQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3qdjtavakh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 08:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz67E2gPJjNVjdg4x/9xbSSRthxlPvZCjo316EGN7YczTP9yg+mav8yrRi3aKyXufoHKAHmeZpUeRMvWyUZkQ9jDlKMrfYaZvcWygcK+pRE150QY6DrE3zLf/TkerRP7aWhgf+mUrQR1HyJ+7GAlRilMVKreprhY9kVgcXe0J2HPibdfRAFw9wabggfkiYK9hq8zrkOFUcrA9onl1vdGZMQKRJHjE8mckGcWlDoEXTercLI4addOpEAhlBXAWvt5s+m+klngMZEjszUzx+ucbF4qiYkW+JoPpw5FFRCuJ1jVLkoBGhQvT1oXgNmUJaReXMF6d/BBn6mW4LVBNv9EwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD91zFmMHYiH911t5ODfrKOHDPnUsfW6hzZ2RienThE=;
 b=AQiG1+EkXd6r1I5cZqmKokwl0IRnthrJ4mcfrhCF/R5WLfQzG2VYZL9mfZ5SzJJaDE2BNU1A1U8Vm1GqiG2cE4fssXg8HWOqWPNk4ztzdUbUEl0YBjQ2ts/uuWsXy31JoJKilIUC1FVc0nvdUEdG/3Se0VHZ2ue4s9ZiJ04mMHLmsMGZNzRxlk159Yf/4HAUgRP8BLeuGxdTab39jQYHd2+bzlk9HIlwqs/v2oY+RkBSq6xMYX5q6Hr2AXISMCMMHpD9K+CWxg0UOi+3l1Rjy6bCVBVOGtlqoP8Dg042cKBTix6KcE5B8T0OG6wED+9OILf3gRjwGXw3scYemLvqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD91zFmMHYiH911t5ODfrKOHDPnUsfW6hzZ2RienThE=;
 b=Kk4+79CDd7bgoRPH7wxXlAloPgG7KZHIvOxmAaVjjdmv656EipiGmbuzOmOLXYVnxMnbQTrfCnGed5aXLLngE7/AM+UEt+suxet9FmsD0mzHjs0dfnEdh7BybGhP4SqnYKKWY9bVi9Z77fZunS+0RTIn5coFaG9gHw7XmSVhtIoC5/dtjVfkyVamoT15hEK5Q/hGH48almlG2dqSR76PUH8/Zaa2/c2AYoZX68oP5ZwttcGv2wpu94nK2q9wPNKsh5Attk9B2hy9nwHk5KOho1wbOq0QpxPK0bGf4hPnCir4vCbR24tO53NUhDPlxrAVjDkkytqMDx8K2l2++Ki0LA==
Received: from BYAPR02MB4806.namprd02.prod.outlook.com (2603:10b6:a03:42::30)
 by SJ2PR02MB10148.namprd02.prod.outlook.com (2603:10b6:a03:55a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 15:32:51 +0000
Received: from BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0]) by BYAPR02MB4806.namprd02.prod.outlook.com
 ([fe80::7a30:ca33:20c9:c9d0%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 15:32:51 +0000
From: "tejus.gk" <tejus.gk@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 berrange@redhat.com, shivam.kumar1@nutanix.com,
 "tejus.gk" <tejus.gk@nutanix.com>
Subject: [RFC v2 1/1] migration: Update error description whenever migration
 fails
Date: Mon,  8 May 2023 15:32:23 +0000
Message-Id: <20230508153223.133081-2-tejus.gk@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20230508153223.133081-1-tejus.gk@nutanix.com>
References: <20230508153223.133081-1-tejus.gk@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To BYAPR02MB4806.namprd02.prod.outlook.com
 (2603:10b6:a03:42::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR02MB4806:EE_|SJ2PR02MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d10e37-f6bf-4f6c-20de-08db4fd97bcb
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37TWkx7zcopW+Mc1KWYfH7Y07+27NH9NbKdcNIdP8L3SgXhncePCqk9w4reoX0xHqz49gBw6j7s6tXCVwUSkhraFCzjKFh+wEl2u7BgA1SCHIlpS7QgV61x9ccNVeyhyIOtwwNI0gLb5vt8WD/A3J8/cSES+K9v6jK6nDektEi3FifiZ3mwprWD8X9k2NHHECjwMjdhExRRHp5os78fGi0BbezAGNc1HFvtzvAi0brOwl2jOoUJyGedzJ6iUKTSrGeGY0Ddx+T7BlmNamUB4p7G2qW0WUlVgXO1rwGYVZN1eeFQFtIDBeXLMMtUdfx4kVIxiyqVhLTixe3u4ktG3Y2AU7U0iZY6kOwf2IzVY7V1t2UP2uHJskhXZQui2oaajoiLUk6jmMelrFFWztl/CxuRC9sILnAssC4AijhJI++HFOe5r9OaPskuKN8ezRB10x0j6gOqsQFf1sfry7dFD9pJ2Kg15vVOM8HJKFpkZcOgfgcd5BGISyTcCZV9HRRj2QYQf4nfDjJWQyyUfe1bD3iHm51oiTOoeXiwqUcbLJaADtN8Sc7QdJmQWjqf9X/zlX4T4/Q62it2gtyWAiRzIJskJbz60k/aciLT6o5CCkQJtCpc/wZNWardebpqQtr4q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4806.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199021)(5660300002)(6486002)(52116002)(8676002)(6666004)(41300700001)(8936002)(316002)(26005)(6512007)(6506007)(1076003)(66476007)(478600001)(107886003)(66946007)(66556008)(6916009)(4326008)(15650500001)(83380400001)(186003)(2616005)(2906002)(86362001)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4frGv4SPHCsjhVV9Jx5xLaT1suAG9qlF0n/SwvrjwwUMN8N4j6PkjZV03Tl?=
 =?us-ascii?Q?/bV8qHEXpzWW45keap8MrAbNjH4S//FYG/EtH6es2hcAk6SJcder4hQSMYG0?=
 =?us-ascii?Q?NvP5DPYgC4pDhzGqnwZXWPPUiwkEkQ0FU7Mrx9CvAw/9DVLEoMFy0OEfTHSA?=
 =?us-ascii?Q?E1PA5iRsoNnaJ9FtzI6M8x45Wkf/2/xhCoSXXPTyJYUt4Rnnq1RJ7RdNES8c?=
 =?us-ascii?Q?kklm3wyGGMbE0sn98bMpszAVvikNaM1ZFvDBt0HBwbK/93WhuDS/mYZcRRxX?=
 =?us-ascii?Q?l1aJoIXi9lnUKws9/PQqaRlPvCBSBnI25qnswiQG+5g/GBAooow3UVV/z29i?=
 =?us-ascii?Q?WBiYdy5cO/2NZsLw2NJwFRgQT+Mj0J/hJqXl+91oW7TKW+gj0MgdbLsPKRfA?=
 =?us-ascii?Q?E2LFXFRnHGdxa5XAQpcFv8OW9Jj1gcqrUSE+wM3xPowdI8NgyN383rVaNr9L?=
 =?us-ascii?Q?sHMz7XUkWqykLIk7r+jcko2vhjQsb6Ia8iMjijr5VCBG5YYtX8wmn7VXja8Q?=
 =?us-ascii?Q?+X61u1vq4xSdC8rVSuQ6if5IkzO+lLBaIfGWzwKfASVf/HyBhrX3gD3f6GJR?=
 =?us-ascii?Q?UQpikoAiVLC8x0BDURil2UxkVbEswcYAGq+1BnGqwz3tL9+F31jpvMM2rGjM?=
 =?us-ascii?Q?1FZ6Z0cIThq6kzPFB5kp79bLviTJCA+zD7o1SXwfd/8vEICDptj6wnYSMzE2?=
 =?us-ascii?Q?02JIhusmPpPDwxrNQKGWYO3Ey73Czc9UTMmfNVGpPVlFnuoSdGBIML0Wibpg?=
 =?us-ascii?Q?ryJBtKJxknBUlFOocpmWpXE+SV0XfgXSGXYl3Lk29tyL5htj0xa7Ss4gv5hL?=
 =?us-ascii?Q?g7dE50on30zC/lKKXP40ADYa3V7DW8qXyUtHyL/pDERCAy89cUEqs88bEH0N?=
 =?us-ascii?Q?2BUCzBtFbXr6B+ajEQsw3grUSUnPtXaGkqCWW8U1ytoZotw/0Ni/saAvFmy5?=
 =?us-ascii?Q?zo55pNK35b+yLKOzGf9bUhbnCR3iVd6GhMcoFe03d7reJ749+xlT5UplN8uJ?=
 =?us-ascii?Q?SJTHWoVdM0xRGJLIX2SfiUldwwcnPNh/DmjVoTD+T90z605Yk/T1xj5PQ7Q7?=
 =?us-ascii?Q?a+GoYX8jRn5ICs+SW2QvdgCMP7pZBTREV6xjpStDZOKmx2CId9vbxnSQEqiz?=
 =?us-ascii?Q?keb0FA0Lb1Znyy1bISQOt/itat5Kjn++SKdKQ1/dnIx094zPq7sD+tD+EzjQ?=
 =?us-ascii?Q?B+QJL9dcot0TQANxEuG+lOYXhUZSw/eyiRcU857A7Y5RCaJrRc0I2/h7Tw3c?=
 =?us-ascii?Q?faiSkn1jqICHpPBM9o7p+Qym2/t7sQAtQ34r1bcwiByLbwtRtSDs8+HBbWTg?=
 =?us-ascii?Q?ozTdxVylSyt6sS8qpSePNIFJ7asTCHrnLqdU4M5GoWYh22PDfQMLpWQjSZwy?=
 =?us-ascii?Q?57rTG3k6D6p54K+mzidly52fZulcxhhBdbsTtws4m6hyK05cOeQfY1/Yqi4e?=
 =?us-ascii?Q?1DCeOE1MleRSaWFrv3wa7JDTFs7isAr29gOODdNBnnXm/1+A/EfrB8XUk5kO?=
 =?us-ascii?Q?ILyLneVYhuNzzsi1AhtMa/4I8SFM5W79qQnvxbNXjQNynv7TP4RkWGcXmX5c?=
 =?us-ascii?Q?Q7g5HJ4BjU/xahRfLR9lnD2binpftZVxQfP3FzEE?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d10e37-f6bf-4f6c-20de-08db4fd97bcb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4806.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 15:32:50.8073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lVvKXJmFgvTxLdkVgdGVkJ6H9ErZ8zDZFPA8N1Dm0yxHGCHyGdrSY5onYoHTxSHP8lgFx09jQMwNO5j7VhSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10148
X-Proofpoint-ORIG-GUID: X3O5tzC7lxL3skFPsWkuF3o7qRHO-IRt
X-Proofpoint-GUID: X3O5tzC7lxL3skFPsWkuF3o7qRHO-IRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=tejus.gk@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
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

There are places in the code where the migration is marked failed with
MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
libvirt doesn't know why the migration failed when it queries for it.

Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
---
 migration/migration.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 232e387109..87101eed5c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1660,15 +1660,9 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_outgoing_migration(s, p, &local_err);
     } else {
-        if (!(has_resume && resume)) {
-            yank_unregister_instance(MIGRATION_YANK_INSTANCE);
-        }
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
+        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
                    "a valid migration protocol");
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_FAILED);
         block_cleanup_parameters();
-        return;
     }
 
     if (local_err) {
@@ -2050,7 +2044,7 @@ migration_wait_main_channel(MigrationState *ms)
  * Switch from normal iteration to postcopy
  * Returns non-0 on error
  */
-static int postcopy_start(MigrationState *ms)
+static int postcopy_start(MigrationState *ms, Error **errp)
 {
     int ret;
     QIOChannelBuffer *bioc;
@@ -2165,7 +2159,7 @@ static int postcopy_start(MigrationState *ms)
      */
     ret = qemu_file_get_error(ms->to_dst_file);
     if (ret) {
-        error_report("postcopy_start: Migration stream errored (pre package)");
+        error_setg(errp, "postcopy_start: Migration stream errored (pre package)");
         goto fail_closefb;
     }
 
@@ -2202,7 +2196,7 @@ static int postcopy_start(MigrationState *ms)
 
     ret = qemu_file_get_error(ms->to_dst_file);
     if (ret) {
-        error_report("postcopy_start: Migration stream errored");
+        error_setg(errp, "postcopy_start: Migration stream errored");
         migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
                               MIGRATION_STATUS_FAILED);
     }
@@ -2719,6 +2713,7 @@ typedef enum {
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
     uint64_t must_precopy, can_postcopy;
+    Error *local_err = NULL;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
     qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
@@ -2741,8 +2736,9 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     /* Still a significant amount to transfer */
     if (!in_postcopy && must_precopy <= s->threshold_size &&
         qatomic_read(&s->start_postcopy)) {
-        if (postcopy_start(s)) {
-            error_report("%s: postcopy failed to start", __func__);
+        if (postcopy_start(s, &local_err)) {
+            migrate_set_error(s, local_err);
+            error_report_err(local_err);
         }
         return MIG_ITERATE_SKIP;
     }
@@ -3232,8 +3228,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
      */
     if (migrate_postcopy_ram() || migrate_return_path()) {
         if (open_return_path_on_source(s, !resume)) {
-            error_report("Unable to open return-path for postcopy");
+            error_setg(&local_err, "Unable to open return-path for postcopy");
             migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
+            migrate_set_error(s, local_err);
+            error_report_err(local_err);
             migrate_fd_cleanup(s);
             return;
         }
-- 
2.22.3


