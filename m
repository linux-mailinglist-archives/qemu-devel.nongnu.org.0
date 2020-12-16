Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6252DBB20
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:20:13 +0100 (CET)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQAW-0004fA-Kf
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7u-0002cO-TN; Wed, 16 Dec 2020 01:17:30 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7r-0001CD-Re; Wed, 16 Dec 2020 01:17:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxFGvhzHNoKR5LMpLJgxXcigeVn/AFqVXE2tg9AuBe1qZjI3mdhU7+Ik+UfMTZnCEkXm0GqVE8XgV0hmX79DU4v7IqG/kNWkTXffPXmUMRRYv8lEvpS4fgaCdFkvVoqaXX4HDfkcETLbXNB1eDmQnvoS6tq6gjDkNQ/Dfqkuchj/dz2o8qH9nWYLsWPxfyETZ5POmTNPk/AoCx/AWL7IxgvrhBsWuydEyi0RVgzDQcQpJegKYhKzbL7U0oqaKuvyX+LWQK3tfQEDS/oColB1UBvyM387Vhmy9Xn2w76+SSVUVxcZ2vJv63rgR5bnGBxsqBkEbNL1oew+V6ZIYrUaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiFnHSDVmn8R0jv2ACkeT1KnVgS7TjugogxgWo6bRYA=;
 b=VJZ3pjdstOWsI7xIYZU4lgrJScjG7TpEsszxi1ybLhW+2ucnLKv685+oz01VsX5x1oGJtSS6MRnGcVOxv38XWa5UUhiS6hzAizXL2/SAl3wqy0x4wFdR2MPyLf15P1Si0zUXhCtF4kActwBTaCB3OHQehscQx6dyz0gulxzusSHVDe0ex7tO9fOXkhh+lvDwE/SaFxqq1pLubgoUKo6YVD6wfRyN7ws1KxyYFb64uxXEEfROUy3aqoQDioY5hTnSDRaggLaSlhWXsgEe+tdszEGwH4PkrHTCHkRdqsPVcsuSzgb5IbNViTHAn4qYBMtWeHGbVn6Egc90EiaGc+I7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiFnHSDVmn8R0jv2ACkeT1KnVgS7TjugogxgWo6bRYA=;
 b=qVfP54UDpOUt4PNZxYaiy81og72A2gjycp2geikPjRX9xlhgeEl2X49vMVGYngbKlR3LdrK9coJC0QBtbxtxUO2U9Cv1D1i5hicnuBWdNJP1LAkxbxMT56qhQkiTrvJDUPCLjtF4IUxTlDacMJCp5H/Y2neUTnfw6AJ7zhFS3/0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 02/13] block: add API function to insert a node
Date: Wed, 16 Dec 2020 09:16:52 +0300
Message-Id: <20201216061703.70908-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d785eaf-f9d8-4bf6-0bc4-08d8a18a3de2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63093BAC709ED4367149F935C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zTI64n3QejFGMs1celTnA7maMTaGwm794okvOuEgSjO/8O1yxSt4/KWIGxjryqOihTDB6kIeh/WPzfgxIcVw2/jaYnI/dLpc6qRwr3UGJb2MliOl9jEVb+mYf8KjhI7Q11hfrWC42hZMbCELRK8GhVOLcX6pO0YFi83rBIPI6oUFXVi6LYHMNfYlTm9FCMTFjXne66HkDW0nKIiwScOQc+bUJWzkYSlZfXGX63QtDXuOPGUPykxISVfVbyF9q8MKSRCSDOZzkCtoQ3fNk5rqC2vBN9GNW5D4wMuN3rDMf1l0dpJT7KlPXnB+LKlg9cTEJT4/UPSmiCCtcnsjm7ohYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KBwQJmivsN0/MTlfEqMbMbjw/Ow4rIN6l2vw94iVaYPE12zDO0CNOEuST7w8?=
 =?us-ascii?Q?FAwnWE/MoE7WGz15C4xz7qZn9C6S9IANWIJUjTDRr56atz/QSButxqXAAmQu?=
 =?us-ascii?Q?uU4d5UE+icdMT+hHgN0ZXpHpQvzyUdx0iHJRZnziwGbo+ONApUS8Ppi4D+jf?=
 =?us-ascii?Q?cjs6FF22Rl82kFP2ITaum6k5IFwfV2/ro5pmo//psKtC/C79o9kLJW/1n4n3?=
 =?us-ascii?Q?ByhNfE3giVULSNKGKTyTgxU1y5kwNdJ/dbD4wPOlg0bUkpOUfMEcj5be1hrC?=
 =?us-ascii?Q?tYj5UQyLwGIvnsZ0uhv2ylMyyDwS/LNiAVtvC1xygLy+Rp1Tw1J5nzSPPYlo?=
 =?us-ascii?Q?NJ3b7Q0iENL2vHkZOA/cGricLRPycIcCrnZSFNkH7kuwx/3gv30GA3EmSGGA?=
 =?us-ascii?Q?QqHX90/sZXIpsJE1vtIWUYPSmZFWd5lbSPNI/Kmio29mIAxp8lkrmCigFUFg?=
 =?us-ascii?Q?lJfgs3atqLN35+0HRzEmUe9ADRCZ7LRdfsYFLDe+GH0A49dM15frJ6FunS6l?=
 =?us-ascii?Q?lG0orsd6E4ngZzin3Ub3VX40ek2PtTa3cehQq3WGRqajYeMcN5sJC67FnRtl?=
 =?us-ascii?Q?Zp5rhdGMMPWLn7x/ijbH1O9eOWuV3QdNWs6SVuQMqzLlLQtVccyBo5w2LHQF?=
 =?us-ascii?Q?aygioUkoASGP3+VTtIgl7Hst7xbbpydX2rUE5SPm3cZnFtA2x6dwphxjgZOZ?=
 =?us-ascii?Q?GGkYhOD+I8HcHDsPuOLyVcWrAanR3eDh2+26QxKnTYiw36gH0m932ZtK163O?=
 =?us-ascii?Q?mFttog6VZJXW1GieHqkShreIzDSbVLWD0b/r5+1XzMtdSzHdAM28FrDjehdo?=
 =?us-ascii?Q?Y2ATdmx4PwqS5FaIHVea/9Fbl81+6G8tR/3AxR8qGpfbFFq9zlA+jGzd0TtR?=
 =?us-ascii?Q?6VWhMoOOkjzeBvFMn4i3JJ2B4emCdWHVFLFCTfkMUWk7urpCymgmVFh59X+q?=
 =?us-ascii?Q?xglH4tf0sNTwV6ZXll011Arn7gh2q9ho9ZU/G9wBazTcpOc+23ih3viIFpbl?=
 =?us-ascii?Q?3m8T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:18.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d785eaf-f9d8-4bf6-0bc4-08d8a18a3de2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjRwmNrFQCyCD6fAQMJBHnnrsLn1QJzTfXWZjlTdaTnOQmcsIxcUtHzVZCsEGCgGuhsokqUzeEgWewSboX1ONjZxy0+yiNro+oWedeTFQmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for insertion a node to backing chain.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 5b81e33e94..8ea794959b 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -360,6 +360,8 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                  Error **errp);
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 8f177504d4..8ed9c5eaf9 100644
--- a/block.c
+++ b/block.c
@@ -4704,6 +4704,31 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp)
+{
+    BlockDriverState *new_node_bs;
+    Error *local_err = NULL;
+
+    new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
+    if (new_node_bs == NULL) {
+        error_prepend(errp, "Could not create node: ");
+        return NULL;
+    }
+
+    bdrv_drained_begin(bs);
+    bdrv_replace_node(bs, new_node_bs, &local_err);
+    bdrv_drained_end(bs);
+
+    if (local_err) {
+        bdrv_unref(new_node_bs);
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    return new_node_bs;
+}
+
 /*
  * Run consistency checks on an image
  *
-- 
2.25.4


