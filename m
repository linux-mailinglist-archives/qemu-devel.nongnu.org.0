Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58C2DBE09
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:54:47 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTWA-0005ip-Rr
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTz-0004Fv-5i; Wed, 16 Dec 2020 04:52:31 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:24992 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTw-0004EF-BV; Wed, 16 Dec 2020 04:52:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtezB5shy+HQZMaosTXPBAK6xFjgHm5ml1N26cS78ikjNGoFDxRCHlxo6x8u2Z+g+8FOgvtmTMmvZ6JxzOkJB9vYDGYI0ERK6VSsDE0ScRrcVZsrIP7+HOUcIlP9rhKos434dOmq1DnJIHFtMEWXu00GroDiB0BeWcDXvEDyF8vwrhPijEi+DiG5vxetj61aP3+xGBUKJDIEtMmfWXcVA/3klrGKTu1qlEQDdNpmL+iX65nCQ+lidv3eS9YaTIgNu9dnRgqRoOOUwfwMHIv8/6fT507T3fmi50TThDC3t1LrFC2aasPyV859/FG2MDvq6uFme2r5wFSyH3r4puz7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfTJw3rXvKfJMSuItwAb2b7Zs2dCE6SODR3H/QMS240=;
 b=C1l663RcIZi72cQCT9pdxLY7iO1o+bwPymWLLCH+PBlnMaajZ23tbABvGwIm6+/2DzjLlQt604C3zD/ml1IpJUNLpCpPcAaqnstzPXosESqS3c3wP3Ypi7l0y/AgV8JXHRqZpnwd5elKaBoXit0TqmusvbHVsri07d27IH3DvKfwBPSSoSahiOx+sLI04f/a10rY2Cfpt/LrvqoWmGc4ejjHOnYYM3NuUKWhyPpC1b0sgUEMFJX4tAmOM18ss2keoiTzRdGv6xqS6xB9acQdT1D1C6cvQhU03t4yzartIYSS9BivBBChpgjObbzfmNfg5HBRI0eSJavp1upaGxK7Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfTJw3rXvKfJMSuItwAb2b7Zs2dCE6SODR3H/QMS240=;
 b=vb7u34PSE0ZGBl0/PCpa/c1TWrA8+7Y5xwN6zUjPUver5V31ocS8v66rotYUgC1DEbSGcGc2qzLejYvEHiKxBG3GXiqJxXGEsRntvLXi5434iC7mCk0MQw9isW267sMZoiU4PwUKXZ9/wr1tgc3R55sClo5icx7zbPyzCtHzwDM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Wed, 16 Dec
 2020 09:52:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 09:52:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests:172: use _filter_qom_path
Date: Wed, 16 Dec 2020 12:52:05 +0300
Message-Id: <20201216095205.526235-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216095205.526235-1-vsementsov@virtuozzo.com>
References: <20201216095205.526235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 09:52:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78fb657f-4075-40d8-9d0a-08d8a1a84731
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713583D40D0A690CD336756C1C50@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chXZVwUykjfXcdzHrcKA3tVM9Tf81UQMun9lC/4pmTJoIUzrVLXsOvozoMa/wcNrtYN7/DjTCQg5gB+8goXupCJOCefpKWCN75zYsthzMyHOOWE24jlLUNUqRrd4rbJU332+cO3ev3YUAMLCWIA2+osSEDQGMMau96cGgxpm63kAfBhhy7Q5SwXAIlyZuydyap0feKZ9WwYM/CMcuPgsx5D4vRur2AuQMBjhUKpLnPnEfhZqyWBYRFgbldS+4ZpbUxLxz5WFlOy41tHDxfyH+X+RhStX/geI8apwvM6I3anxlOV7Qju7jogTNFT2RhXyijKWR3NQxhuQdHnEQ43ejA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(8936002)(316002)(52116002)(5660300002)(6506007)(26005)(8676002)(66476007)(186003)(6486002)(478600001)(16526019)(66946007)(107886003)(6512007)(956004)(4326008)(36756003)(30864003)(66556008)(2906002)(6916009)(83380400001)(6666004)(86362001)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XOI3NZglmQg6bjoMwizkaWpgIKgMHzIVJv9snbJhO0l0vPagW4rlMK73pgVm?=
 =?us-ascii?Q?sMMVZqrdDhb0XGadFeuujN5ir2mT8g2Sdnd08AlIvirU7cXj7AyaifVFWf6J?=
 =?us-ascii?Q?Pn0bblAtr7P7ig+rPpWDc97wXoIF2OjCkYrZIQ+wkzkRrO474ZHNDLvLTuxd?=
 =?us-ascii?Q?bZw/sRNXWDFy0EIQ/b5DlpuieGGNyH/b6b3Ij9cHnZdCs5IuNf7zyRa4p/Mz?=
 =?us-ascii?Q?TdfPdNkDrEsW4y2W3She3+Jtw0M7kFdF3eIgeP0Fm4EIFpRMhSEiK7wXgcyy?=
 =?us-ascii?Q?PGOblqmuS0x49N0otoFKPHSs6MmRZutb/eOTRs98YOGinolPJN5QBHZpuIYp?=
 =?us-ascii?Q?mtKJ4lw+2A098A4A/cLXEO7USMOCc4pbfo+suywqFxcywNUaC2Ekh45neAtg?=
 =?us-ascii?Q?5eH+jxb6V5+2DR3YY9fX2q15BCdw+prAXsD4HjHa5tBevDKVdS9f1uMPLZeI?=
 =?us-ascii?Q?QO8G4tF8H7ciiGl7rpqkUHGyRmKJsnBPUh7x5MYwUCzdqkCkM0fPk5/HMOV3?=
 =?us-ascii?Q?gETToSN3rHYMVhX/amt2ZZZ6vMhqZEzx4lw25qieMo+iSbDr7Dpwv5MpctXH?=
 =?us-ascii?Q?DuppgH5OTAfslQhKKTDk5zaij9joiqCJvsqBO5YePyqdRaOBXGElBAyw4IEW?=
 =?us-ascii?Q?EmNL54Zy1QzL6pPaQFrdvmzAKtcagTGQV/keLki7v+zmPEp0vfOTCEbin0+S?=
 =?us-ascii?Q?r9e7N1dhbaBdeAiMNzeJeEsuiM8iRB1hlNOe2pfJIo6HB6pCq9oqOyAz9XLL?=
 =?us-ascii?Q?+RY5HdrpZNdDiet8rKATkPk1JCudK2c0BO9fWt+yKP1cWzLoYQAoMhr7wSgz?=
 =?us-ascii?Q?bl+QSgKLMzcoslXJ6gX47UmB9HRhHiy1Asm8sl+RM76rpOtqN0LT/oU/Rlcq?=
 =?us-ascii?Q?bQ2KlES2wlTJT4YvqO0R1zh73IVrK0Ee1FvuS+2CNPGADQqDobRm9/g0V0V6?=
 =?us-ascii?Q?Sriwx765Z+hm/lehky1HuLiHHotG3hm09MYLTkk4L85gBLwtE0wPRvGrAZq7?=
 =?us-ascii?Q?TOQ8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 09:52:19.3628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fb657f-4075-40d8-9d0a-08d8a1a84731
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00uTiyUcLCSJ0h+OiS6S6GMXE+LGK66MGiccT/P2jc0aSguMUw73FErwSVH89EsvS0CG7vJQjuVLh9OrpEUoAT66EyWI3wtNwbAau56jMtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.7.90;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

device[NUMBER] thing in QOM path is not stable and tracking it during
code modifications is not fun. Let's filter it like it's already done
in iotest 186.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/172     |   2 +-
 tests/qemu-iotests/172.out | 152 ++++++++++++++++++-------------------
 2 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 3abfa72948..b45782e8db 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -73,7 +73,7 @@ check_floppy_qtree()
     (QEMU_OPTIONS="" do_run_qemu "$@" |
 	_filter_testdir |_filter_generated_node_ids | _filter_hmp |
         sed -ne '/^          dev: isa-fdc/,/^          dev:/{x;p};/^[a-z][^ ]* (NODE_NAME):* /,/^(qemu)$/{p}') 2>&1 |
-    _filter_win32 | _filter_qemu
+    _filter_win32 | _filter_qemu | _filter_qom_path
 }
 
 check_cache_mode()
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index cca2894af0..2cd4a8fd83 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -63,12 +63,12 @@ Testing: -fda TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -114,16 +114,16 @@ Testing: -fdb TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 floppy0: [not inserted]
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -169,17 +169,17 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -255,12 +255,12 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -306,16 +306,16 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
                 share-rw = false
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 floppy0: [not inserted]
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -361,17 +361,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -411,12 +411,12 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -453,12 +453,12 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -508,17 +508,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -556,12 +556,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -596,12 +596,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -647,17 +647,17 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[1]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -708,17 +708,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -766,17 +766,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[16]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[23]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -838,17 +838,17 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -894,17 +894,17 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -950,17 +950,17 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1006,17 +1006,17 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 share-rw = false
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1071,17 +1071,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1127,17 +1127,17 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 share-rw = false
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1191,17 +1191,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1249,17 +1249,17 @@ Use -device floppy,unit=0,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1307,17 +1307,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1365,17 +1365,17 @@ Use -device floppy,unit=1,drive=... instead.
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[15]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[22]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1410,12 +1410,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1603,12 +1603,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 share-rw = false
                 drive-type = "120"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1643,12 +1643,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 share-rw = false
                 drive-type = "288"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1686,12 +1686,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
@@ -1726,12 +1726,12 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
                 share-rw = false
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[0]
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 
 ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[21]
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 
 sd0: [not inserted]
-- 
2.25.4


