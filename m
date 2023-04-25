Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62BE6EE227
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI4A-00013t-Jy; Tue, 25 Apr 2023 08:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI48-00012x-2y; Tue, 25 Apr 2023 08:46:40 -0400
Received: from mail-he1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70e]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI46-0000dV-Ez; Tue, 25 Apr 2023 08:46:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxt6rOA4I+Di5vA2zdlLlgcYsAjFlZ5gmTsjXrHj4zGD76F3v7BQO33NgCaiYfMyESR7nCBQ06cjbiQ64BHCl17w5o26JREYpWEjXFrOXmwUnOs8wVdbg8h3OyaagiDGctfoCrjEeBAzz22iaIQ0dFZzqb2AwuF95TIecRwWwovDpm3XMhKgKR5BLKAAEWfjr/N8Ey15MaGtOK08uKQCkDZ+hcwqQ4yD7q2jiYSkeMudBLINT21Su9DjbF3lKWA7Bx67iS0UVKH22VpzlUYud+vH75N/VKGbrjo6M5rXysUDuGdiBGnlZ0W8YnxYtgy4gSlmzsMi7RNN0zoQfGa0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEe0eihCeuFAUQQRulF0qttAaOppAZRgF56WPxz05os=;
 b=Jk7kr1eupcCaOGRSKry5Dcjb2ctbpUlhfqASd9BWbLG45Y7Udw4elynSwbWv87CHDinuTAM9QjzKjJSKbI4ilXUz7sNstoFPeWpFRtlnN5cx3rmbZlu3lu9POW3C3x2giPNMzyyOlTjxsfYia36Wew2V7IaGtZo3N5b/+fi7qkQ3U+RFuJUlQ4mxuNwQ1m/rjSneU53NfARgnd+44rVI3ImJ8EcBxdKpToRGT8t7w70SUofNXVAShfrqHjTFiBrR91iuWfSjmmSMm8y15Yrc+O+majejF1ygkaa0AuOQls2vG8OoNZPJOLcl7YgvEcZoxL8J+eE7EiGOQN3n8vUJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEe0eihCeuFAUQQRulF0qttAaOppAZRgF56WPxz05os=;
 b=ViR659dkd4rRUN1Dq1hx5KdQc++htRMkoT6HDAFUuv9n70mj3yMXIOlxSC5ViiydOmUPAcsB6qcbqGlE/W+2YMfDShnD774EhPiSpxb27P7n6/QKcoe1ielz+JKC3x+GckX1z1UQnaiFExfbskwOtXl51WpsoLIatyxp0CU6Yw3m5hk8/S4wowmuWKGvpCHuOGoPdHRj2u69o4PK9uZtpauJwlWC9nauoW/tYdOt1iXyitMU1asN2AKLiFLjf4j+jmSQnHi+mAwDHn8TuowGvRVryILx2MILF5Rjj7aZzeyArQPc2Z17piyRQlhEPXas3/QP9cG6Qy1E3kbmdIvrgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 12:46:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 2/6] iotests: Add leak check test for parallels format
Date: Tue, 25 Apr 2023 14:46:15 +0200
Message-Id: <20230425124620.241022-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
References: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a385b3-d562-4f1b-0b7c-08db458b17a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/Pzmnyyf+FhaoBA+J8GrAGXkhpdzo2cIhJMs8SAzIB0dk7FYsN6ZuHzrIJLmHiOmQm9tggVD3Z3CQyPbsVXAS+o7NnCF5I2+0ufFPefsDOf1+7Bms/Tde366pGZ4dtdwC4oRFh6kNOjQaY34TMfIqsU7FMSOSN0/d48SqZzsOXs7ZBMOeEBwzTPesq1GtFpitEX0ZS2gTojk/YgWKwxBpIwDUWWVTWE+m1CUaPPkU4HH38RehbPafz8QHBAbEb6oolbOHnEXD1fuwiIEciNIdmngmRlzhm8jToi7O/lJkZZoXVXqDMN8dlHVcq375lOv8UaCU8BnSoAPJcELVEHAPnVG5jngWCS/vYjDntlPVBWZhLKml1e0m6LrlDumzVQYyYm5g7nPevEAUlVzdq4UegBZ9N46ztj8c2voRPikVE+s0oWi7RZfTXiWX/6qHynrjZhLftbfki3GHttgU53GWzMkBGRbXhkWroXuRlkyzS5q1uZ6SyCxaoU3S/FHCPZiI0OxwGeCLSfmtKibvaO0eJZQPu/8o/YTmuCOEyvPdawUwYMjQ2N3wTAQhAvsSF8ImJGB30Wvbo4V22kNsvEpyitUhnsK71IWGtpTNDFh06tZd6B3EQn70xVu86aXdxaJpeCwAjNmPSs6xAtZ+XPtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(52116002)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(1076003)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(44832011)(5660300002)(38350700002)(38100700002)(36756003)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lC+N7Qi1JCnOP4W939HuLxP1BGP93w61b5BBuZEAF2819U+nPtaIRw22mLPu?=
 =?us-ascii?Q?EAasxjhnrkZtgNAn/4kBRa3IAXnoUzz1hGymzYqApYjuRXWUwEDSv2VlVeMu?=
 =?us-ascii?Q?6olAo/VOW7t1k6NofmJMDDI49YQpCZumcs2ovvzQOIUwtYz+bYmOq614mCKD?=
 =?us-ascii?Q?b102pkf2z/20lA9aYmMXvJe/3mzFS4K3V/uzWaa3V4fmY8vMn6ZbFuUp8p8w?=
 =?us-ascii?Q?tx4T7GvQTDlFp8q60UKXc3XRRTdmb9ks2KbDTGVz9ONC9ulzVZEJ74B37IEt?=
 =?us-ascii?Q?9sLZgAxCJJpeE4mkv0eUe6iqAKIMvqz7Inph8e/5B2sbus/q4J2C7d1Esu81?=
 =?us-ascii?Q?sCfekqId1oeyW5FEJxQb7WOyiwzzXJcPFDPjV/2YxhwUDnxOu/ZaDhh5q834?=
 =?us-ascii?Q?oWfD6jnOGS89XJS8LzXZ7t0BLRhdPjBy5ETRW/U2BESb7A/bIQBrXMATaui4?=
 =?us-ascii?Q?VVBxgWtyIVj3/mtj04ApCc/BU6ttuw0uQhkEh++coUSJVjGJO+AeXl1k7/Kp?=
 =?us-ascii?Q?cv9F2TRxQynbLb4HnksVRIkjiUOy4Yd1IA5H1XEVQ2U6KyDZg8Ddlb5HieHt?=
 =?us-ascii?Q?jzPKkcABvJBud4+yVUeWMDvggLFAbt0ayVARC5mGMtNDwUuctjxeNMeYuQG+?=
 =?us-ascii?Q?C0N0vrTN1t87/XM8ASLR9ZPbHSgnu3Znwv/LShATzEe8LrvpfZJFlURLwFAf?=
 =?us-ascii?Q?ZRQG/tD7f2VBY+ZV4J+QaCwOSBS0lFsKrS0mWSS4SG2S0K0AHf0DuO0lZwns?=
 =?us-ascii?Q?DFUP/YasAIEWHUbnD7uKoopbe8EgMZrPmyGp41p3vgaX7WvoVKk/+j5nF9sa?=
 =?us-ascii?Q?9c56t//7e7A4iaSZ6jDe+Z1EZFa+it2cpn1N0A2v8oL1AUvqIU1T1wOop2Ff?=
 =?us-ascii?Q?0LLvIpNg7i7LFGjuSC2SPSO0dhI5KNZntklBFWTfQNQcAJr2XoVJpqloGHEo?=
 =?us-ascii?Q?3sJ0CYS34lSGKOSlBep8yBLwE0XxXYEsy9WhWU+TKzefeN+cdURVOf1Ogsp5?=
 =?us-ascii?Q?xIHrYwW6JJwj4bIY/1TSnODKiHIopWeUnm2aHBcFpuosu7JinwOTQUs0+BJf?=
 =?us-ascii?Q?pZ+nftVLnO5k+EXu+OOV2qhGmWH6Nw3IOsPoN2MZDmLARzrCfD7/+SmUBRpP?=
 =?us-ascii?Q?ix14tfm5llUL1ZtY4zD2DcPmkfRLP1E9ff5yKixYk2G1uADNIr75KH9cD8pw?=
 =?us-ascii?Q?xov90P8CKSatAmA8oU/tIrsKqcWkMS8C8hZXF5txXGrG5c0dr64hduzYBpmN?=
 =?us-ascii?Q?6zPLAjD4rs+VyXFCABrQ9HyxTm8a/kIuDcS/Ob7YBl6ZU7gDE17SLaVIxVgR?=
 =?us-ascii?Q?iWC+kRoe8AMD4ZIlm/heeiPW5B6vrLEdGqOcg4xuxSTADzwk7SeXaNgeEV6X?=
 =?us-ascii?Q?aCzPSGDTz0jT0lu4TcNGVtUEJpDJueUTGd1DnquBWbEqZCNu1Zib/ZryRRGZ?=
 =?us-ascii?Q?AveBI3r2kDYeNJAtXON75BRrtu60i/A7LkHUiZ+NPq/UmHtb7QlG0R6cqtjl?=
 =?us-ascii?Q?ljF536umqUgxI6d8JFB2suJm/y0FobLUhS9uU2Iev4M6BWlNPQRw4k9b+cWZ?=
 =?us-ascii?Q?G3FHKiHe0hbweAfRnG2y38e/dvcTC+Y2m9+iF17UJMW29vHhyfueI4yJ95Ch?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a385b3-d562-4f1b-0b7c-08db458b17a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:30.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqMkl0o6AplxrUkewP3pLHrFBpfohZdOEv5WHLNiE6pC7Uc6gA8YC2tkGoT6m6JX6ouaQjDQxjIIKuiJ+L30JupqfYyrjFTbzm7iTbWgxFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9410
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Write a pattern to the last cluster, extend the image by 1 claster, repair
and check that the last cluster still has the same pattern.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 27 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 22 +++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
index 055ce34766..8be282fabe 100755
--- a/tests/qemu-iotests/tests/parallels-checks
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -65,6 +65,33 @@ poke_file "$TEST_IMG" "$BAT_OFFSET" "\x$cluster\x00\x00\x00"
 echo "== read corrupted image with repairing =="
 { $QEMU_IO -c "read -P 0x00 0 $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
+# Clear image
+_make_test_img $SIZE
+
+echo "== TEST LEAK CHECK =="
+
+echo "== write pattern to last cluster =="
+echo "write -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE"
+{ $QEMU_IO -c "write -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== extend image by 1 cluster =="
+fallocate -xl $((file_size + CLUSTER_SIZE)) "$TEST_IMG"
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== repair image =="
+_check_test_img -r all
+
+file_size=`stat --printf="%s" "$TEST_IMG"`
+echo "file size: $file_size"
+
+echo "== check last cluster =="
+{ $QEMU_IO -c "read -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
index ea4dcef0a6..f2cb6dde85 100644
--- a/tests/qemu-iotests/tests/parallels-checks.out
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -9,4 +9,26 @@ wrote 4194304/4194304 bytes at offset 0
 Repairing cluster 0 is outside image
 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+== TEST LEAK CHECK ==
+== write pattern to last cluster ==
+write -P 0x11 3145728 1048576
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+file size: 2097152
+== extend image by 1 cluster ==
+file size: 3145728
+== repair image ==
+Repairing space leaked at the end of the image 1048576
+The following inconsistencies were found and repaired:
+
+    1 leaked clusters
+    0 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+file size: 2097152
+== check last cluster ==
+read 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.34.1


