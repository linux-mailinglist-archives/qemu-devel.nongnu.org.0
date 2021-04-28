Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A136DB29
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:23:03 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm1m-00085V-LF
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxf-0005fr-EA; Wed, 28 Apr 2021 11:18:47 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:16352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxd-0001nK-L5; Wed, 28 Apr 2021 11:18:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7nVcUb+1pToWSvt2OCmWXDtI+ZTDyp5Jmf7pOrZBbLcIaDpQgwPNAWkR7t2PzI8eFAYhGg4tcD2j5lldDvwkj+lfhXa/aUUAE28C7fIAeX+fphLV2+MIMp4isVNGjBsm0cDxfinnnRncrJ0a++ojDpjcUrTJsoC5HxPeLvNGXi2qoealacnu4TJDJNZkMBrfqZNRvGkM9qH1uGKgAIEvQlFyCOOUA+ey2HyPHNnz1o9klP8gl6dFmDAGglJD6Y6mfpe1nmvXuw7hJ4T+SeEbozEjomG9qjA6sNdlAdC7Y+vrqAKWISU2N4E55mw2wLGNkPneGIN6x7YvSzG0Qo0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGzFSrJbAZ4qvr0ZRpN70gF1fgDUn5gHIP//DlvizlM=;
 b=HNtnadl/WwBBHYvHKtNe7M5QaAfGQW30OVfoPB5A8cP5UK9k9ICoTeFrmk0EjYtAK5IRZFpYLYlD8Roy6OcA3CFSKxD3sSDVNBdml0uX8xvA+zi3OagjuyznriZtJ0El6wIJ6JWso5lgVImOlx1PZxz60UzqefP+Aeo4sdwjld+Dxj/+XKI7Pwsi+OilqaEcEj/hhCu3ve5MQhkk8J2S0FQ2PZTPr9k8LtHud/bbXbYA16IkxbuZt6SkLP4YT5cXhT14Olo1l2K8HHoAMQV/XFnRcNYofOrWzfXEJdpWP8OFTBpeqcRolWysmTd4K9th9zwIC1F3ZwjaTs0R9S5MFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGzFSrJbAZ4qvr0ZRpN70gF1fgDUn5gHIP//DlvizlM=;
 b=EClChh/xJSJia/f/U16ysqSRoU5FEfGF/BZpxs94DKALRE7jiy8H7lMoO1QTPcwXjRj6v7K726e1bSerAGMWX+5SQUPBmxf2GMfqsFNj98uCr/qJ7tKi8cbgoSPI/MHVzKPyggeg/rJH74bNodXA6gLhzhiY+wTjSTAZ/RWt6ts=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 03/36] tests/test-bdrv-graph-mod: add
 test_append_greedy_filter
Date: Wed, 28 Apr 2021 18:17:31 +0300
Message-Id: <20210428151804.439460-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914df3b9-da9d-4c82-8502-08d90a58de13
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB590926F2AA33E97D2236429AC1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UivODFa/gdtliRZ7uulf5ImJgRPkYYofW9siz4CCVlXXu2zV06Z75DaH1WPSKop0A3umCJA6s5H55KW86mS1DZlRiN/9W8vrzFsCJXl7ceyB8FtYHNV1mfOhYP4BBFSLhKZWNkB1au+JrIdc0dHBxD2+NIRaGWXgJck6bsX8xvLmRqzP7nc2c9ZDQ3CMIPfIMeFOKph7NUP5z/vVm3kj9Jpo3EvKdZDgW29gV06FKCeP7UDWb2izoIOdUIzy0WQ+5xOPxq0WMWE15iLCYM4jB4DyeZeVXUu4ApQpa1hAakx+rFBQ+uzK6dxi9AYHzFJ896Nxsj/WtCuAXtRnhBRpEqo15OjhiDLsajzW/gfYStKBRMO+emnok43VNppBjXYQTePokAK7EA0KYOs9NaSF9pEyYQG5CUTIG9PPuQgPaLS4ZT6KACaaY9hNbKfPiSq+lV4Keo7D2/EGoV4kS3EsFkgVVpcg83WX4nT0H76M50DHbgCa7DCbvBNoV2M1nLhX5jR5o5UuFZdAQWi99eqfVAYt3Gb/xTmnHEsRAIJOfrrJNP537fuPaWKMBi+jLkmeIrCi+vyuuZg3wQRKpCsJB4NncjsD0NBQnnNBHSKGSzIaM65OS7G2O219snRiF+Mzr4vYFDbIbb7Q+S7MBl4jXERsuUzM38HqkKzJpk7Pqm7ZW3xLGfN3a7fV+gsBuUbJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BINsDvEh7PbgnSevebmWoPguVeCPbXNhf9eTW8crUAqiyF6IcpEZCWmS6mUg?=
 =?us-ascii?Q?/G+/nktiGfHQmZbpSru0FvmeovJhCOHMMqZq3Iwu39rYAoCGWSbzAflLlKgY?=
 =?us-ascii?Q?1mDCfWe33L6QlH42hvPj4H9UIwUJUc7tR4WmBqQfghTz6W160wbgr6ruZlTg?=
 =?us-ascii?Q?CrGjEKAfxDB6hjJ8zTmlhJDxOmRixRdD4TafK9RSLl13smwaA3X+rymL6dxd?=
 =?us-ascii?Q?yo/X6ZZ0aJaMx8IoTfyRFlaEVKuD1zAFF0Q7gUdNOMuRIot1wdaTqwlHwqK8?=
 =?us-ascii?Q?ZvS1zMSvEddwee2PG+OnzOj/1GSPToaeXqL52EKnPxGGSCNa0SVwVQzsOXJv?=
 =?us-ascii?Q?R3DdaFY2b0WqH6EsSHEnMYrbCp/SCY1rDWQmZhXAOwoS9riyycv68vIpJNWY?=
 =?us-ascii?Q?PwDwH8X2VgdihKGuCdjgW3PTDo1nzHmWfHmR80svbtChm1q60+yJGu5EwrDH?=
 =?us-ascii?Q?xDXKwf0pOPEOep1HMZUCj6jyxRymhOJmvdHx9DU+aAw9lIclYCTwERv8n2Dq?=
 =?us-ascii?Q?RtBNvLp1z+URMwUm1cUrl2Zv3eel+H6AhkU+l64zlDP6U2n8G8dxDkQUxrPs?=
 =?us-ascii?Q?KWrUa2eaGU0+68xcPCB4efBj/ra4O6XDk/611KJLkBs7gIMFg2++2SU25FoL?=
 =?us-ascii?Q?waC6RNwhKF8fXopIPQ2zkSlIROzncBw5lD7zmEZePLx9M1nZ70Puf/Ye6GAH?=
 =?us-ascii?Q?KIUQB26QrrCV4i3eJGiE+iAML+Qx+j+grIORsxrggF2gTqrZQ/l6QJDduUAt?=
 =?us-ascii?Q?Pk/gMph7KBqZSzbwY4osZv8ABNYkD+jz/8Q9ZONJeXsz8AIziHbA4aVPY5F1?=
 =?us-ascii?Q?Anq/sE++uLUgM0RbMp+nB1D1bzautUyl3BrT55CJ4jkaIyADo3n1wvalwU8C?=
 =?us-ascii?Q?6tQwAgvhG5EgZbJIx7ajSJNWRHTiFwnnDt9+9C5KmxiggmXYUAafbsOCQeaa?=
 =?us-ascii?Q?I4MTqYGCAtcMne7BNBujFyyR3rejEdJEAd0AGu/SMnkAMFd7OjKPVOWxxEKU?=
 =?us-ascii?Q?VNtFVFR05c1ZgRMM0UQX8AfY2J/edgxXy0YMVtC16k/fR5iiSoiFC/Hpdf0a?=
 =?us-ascii?Q?/QGQ2Uf6TlRzUWLgYEdHjPSg8r/w4eMsi2EvvmHfU+mJjSTpPDeUXM2th9gP?=
 =?us-ascii?Q?48UwdbZaM4n4ZpwjfeavpitcfHtHjfIRpOMW66IX2y7jqUtEvjXxlf8jYKZ3?=
 =?us-ascii?Q?eyge9nweYW9t3OWaqMpucaCpbDY2AJz0zop9Ik4fSTWzsb4zH0FgNMITdPHB?=
 =?us-ascii?Q?2i4/ky99sNwpEb09jHSdN8dD62aP/IVj6OtakLw2lJGn7YNQeRx9T0X6WUdV?=
 =?us-ascii?Q?7gffYrEFl0ibQZaaJ/LhRB63?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914df3b9-da9d-4c82-8502-08d90a58de13
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:25.0001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbwZDCyHbLTK7Wn38KWhrSh9ZDm8/Osf2/H78BcqhACaw62TzVGzuXOcvBbfKU5Wp0T1KeZ+bPNFDVgEH4o2Z/GSkU4tC/RsA4TpLMMH0X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_append() is not quite good for inserting filters: it does extra
permission update in intermediate state, where filter get it filtered
child but is not yet replace it in a backing chain.

Some filters (for example backup-top) may want permissions even when
have no parents. And described intermediate state becomes invalid.

That's (half a) reason, why we need "inactive" state for backup-top
filter.

bdrv_append() will be improved later, now let's add a unit test.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/append-greedy-filter

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-graph-mod.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a8219b131e..5b6934e68b 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -352,6 +352,37 @@ static void test_parallel_perm_update(void)
     bdrv_unref(top);
 }
 
+/*
+ * It's possible that filter required permissions allows to insert it to backing
+ * chain, like:
+ *
+ *  1.  [top] -> [filter] -> [base]
+ *
+ * but doesn't allow to add it as a branch:
+ *
+ *  2.  [filter] --\
+ *                 v
+ *      [top] -> [base]
+ *
+ * So, inserting such filter should do all graph modifications and only then
+ * update permissions. If we try to go through intermediate state [2] and update
+ * permissions on it we'll fail.
+ *
+ * Let's check that bdrv_append() can append such a filter.
+ */
+static void test_append_greedy_filter(void)
+{
+    BlockDriverState *top = exclusive_writer_node("top");
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl = exclusive_writer_node("fl1");
+
+    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+                      &error_abort);
+
+    bdrv_append(fl, base, &error_abort);
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -378,6 +409,8 @@ int main(int argc, char *argv[])
                         test_parallel_exclusive_write);
         g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                         test_parallel_perm_update);
+        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                        test_append_greedy_filter);
     }
 
     return g_test_run();
-- 
2.29.2


