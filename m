Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270BF3BA4FB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:19:06 +0200 (CEST)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQYy-0003S0-Ki
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQX3-0001Ix-Os; Fri, 02 Jul 2021 17:17:05 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:49763 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQX1-0003iz-Rr; Fri, 02 Jul 2021 17:17:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzUoSe3oUPxpSpGTSZBe9H11gkZn/+7AO0WQx9GAUkPxtmYz8qnMqC7Fn+kQaYIVl9YHTJ/44/6yuzfxw58OrZlGiZ0+zyrd/3dIHvbWVDkEkhsMiolnO51bkBdqcGjY2SVcIcSSftnfdtYJnNxDVMINVYesS3q7cuvgyYJA7gnVHd77Fk7/5m1Q5El5Uy7xfjmrPRXWaSiqT/1G2d+2nIX9RqyzR5cQ/6U88flkLOuQER/Es5u893/2EUzUHwzfV4NAPvs7FBU+VT05Si/4BwPMzt3SY8r1sem1DNOB3EdL66luLtGZE9EnR66hhIA459QAY9jmS0zYhwZnvOfPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ03WrpLQc8hxWrOr26DrxKsbDTTDy6Pj+wrL78+T1o=;
 b=UwOeceBJAmDTyJCHnm7NNf1LWEieU9iU29wk8VboSaoJ9C8xGG4kohDo86sMWq+QPUrecGGX37iWHMWlSHQJvw4XiFcVOTn3RQNoF969WON+T/OZ1K0ikdN4eY8SNhSovnVmQTIK6fu/qLx0Hpsca04TuFrdaoln54RbD/EImlw3wCyOnPLqIsopbJVwNoxZDD8biqfUpJSjofagpBclq3i5CpMiDtXfI5zwHoaufs/sl5S7kkBsCo4bMj7PUzwmh1FQe5YgUdldaOD8QWAz6onmGhBM9NYXBTUNXYrAVK5MF3Ad9wpBiZEjxl4Ka317uOC5TT2d/04mx6naltbeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ03WrpLQc8hxWrOr26DrxKsbDTTDy6Pj+wrL78+T1o=;
 b=B6EU8ZKLNJnUtvEEiWOp1udWX69QbclJwfB0b33YBDY1r+hOlD8GSlzh3UOEBSXSZbuVgznXFTSJJj5VBm3lhCga8efXNxl6+9XXz0hapVr05oEJ0wKJCFcWRqYS3iVE8vYgpt2Vy5eFuniGYE0+ka9On3M5diSmksn8kdQdtTc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 21:16:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 21:16:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, dem@openvz.org
Subject: [PATCH 2/3] iotest 151: add test-case that shows active mirror
 dead-lock
Date: Sat,  3 Jul 2021 00:16:35 +0300
Message-Id: <20210702211636.228981-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702211636.228981-1-vsementsov@virtuozzo.com>
References: <20210702211636.228981-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:7:29::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:7:29::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 21:16:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fbbbadd-ae2f-40af-3d08-08d93d9eb752
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691C752F084237E6900959BC11F9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TC9wb/LvUF2X3gRDHk0oG7k7Q5At+1FJMJeVFztLtmHFanbZyI8ZkTcU2oE9PmhOTcT8bcAoFdaLVpqBShJDfQgVnZbOCGCIOjaShD+4o2XKDagfP6b5cMCSJaqKLi7o0wsh/EtLG1sRFcljVj2wk6xqS/uw06m6/RRaRnH3XBheQNfiUFeCwNFmYKinI+0p+it82oXHNN9i5MJhq9gYJpfyiQfxgLCA0nndB9RUhwwK+ptSjH03RchCm8Cn/+APdFK2sJtGC+hnj+qsvim9TxyC66iAN8OAczfgmrhe3KbRxgidtUckoQnotWkTF6k/uNTHOD5zm4o4hEIeXH42qsK/+1nMzVHW7kvIKhM5XrWgDB6fdM7R2hxnt3izaWElEDzzN7DjWTbYJxTGrP6btrsCrxD8mOiz7llK4vouHh0rV5S8bgW5wHBYSGksGlTNyFq+01O9DcaUquyz0GBRrGspIv3W/3UNH78IT4eCsC7+TPJouAHkHVYfhz9/jB4KszqXuaOUjrAMYHdaKBaEHOtJqRwCZaZPbYVAJk7/A2CUbeLN8k9kVh3Nh4+CCsaxDDVlqHYbh4jKTQuQW1OvmcmiNT0eudqW/0BOMEJpLMkk1rn3Mshec4B7NYGq2Sn9NT3YU0RnUbqC3u9R2GAjfuladolC+03agzzvUNHjpEa9bOz9msi4HOn0eUI9bOp4KFuzN3JQTVs9umhy5vcBg3VI0gR+CFnM1kNomaRWnINGHrBTInxhuGFgc8nO5/Ap
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(376002)(346002)(1076003)(86362001)(316002)(2906002)(52116002)(4326008)(38350700002)(8676002)(66476007)(66556008)(5660300002)(38100700002)(66946007)(16526019)(956004)(6916009)(83380400001)(6666004)(107886003)(36756003)(6486002)(186003)(478600001)(26005)(6512007)(6506007)(2616005)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yO876fTlJ2CT3YiWbX2CcNXLnaBAIOiEAC79rd3MRKEQ0eCM7LIrOjhBTfu/?=
 =?us-ascii?Q?RdytqHUxD4IJ20NITnRSGakar1wEU80XPt/EB6nYLZQCJeF14HkLy0pMs1oC?=
 =?us-ascii?Q?5JusNFlE0u3hxVNX/8NrBs5nJLRVNGFZXp11fbJPJC6mdkre/qarV1QTtRrR?=
 =?us-ascii?Q?xRY1NO4znapbEq18JsOfbwzjAuyDM2KQGpkpQ/8KwUsMotsuXyCO1EqVsj4x?=
 =?us-ascii?Q?4gr3m70eKMm3BoytUmXAU5zTF0klEUPhcML8+ef27vbNfWQ8wOlx7ZNDnwOp?=
 =?us-ascii?Q?ACIU3zfoG0Dy+6Yvn1PjnJDnenavHhG6aHlluDyMrGC+KECGdgGMNK8Z9oBZ?=
 =?us-ascii?Q?FMi+uBxNKQliqtoDV2w777ckxIT/tfN9cVVgve30R1uUQ2t5GrEx4bi65tFo?=
 =?us-ascii?Q?wnJIKZEqrTRdDJO6HSuZiSt1Cy/kZcbQ0S0eTsavW6cOX5vGgxobqU9pWZJU?=
 =?us-ascii?Q?E1a218bSHYJwaiNnGB+g855DUN35TEPRUdIHz10Nq9AE106Z2kdLrcZZ+BYg?=
 =?us-ascii?Q?E/o66+NyR8lzFfxup0v5Pamc5E+wXmHBnEbnDkbUh058kXtDAOA1QO64Y4yF?=
 =?us-ascii?Q?5mrB5Ii8+uekAfMhP6kC3UGNi0qUCE7F/BdbxxOwa3OZWI7ZnIUgqwZ3j0KQ?=
 =?us-ascii?Q?2YJLssml1r4axQSvxCCPJQ3o/krvWGuX3mwPaSuUX5UVwyBile5U7GYrMExV?=
 =?us-ascii?Q?6pLpadvNY+RRW5XXuiscJrS0FFJDOSOiban7pEgPalObf5hRRrHYEJT85MO7?=
 =?us-ascii?Q?KQSevYPQro8klebDc+B8k+Tp0EceX/ZM2TPVxe+4hJRU1wOP98zlBfR/S6zd?=
 =?us-ascii?Q?swF5FWqPUOr4NehS5L02KhvejYr4bRPe7RYFCvt1Pr3OXGzEm/PENLskgRWn?=
 =?us-ascii?Q?nPQgT1L/6NZz18tPTuH2dTWnbxS1iya/+DLtQPMlMgSGfzeMtbK3Ui9ItpN9?=
 =?us-ascii?Q?JckdI/w7jwnI0T0Sah/EN6ZO3sDEz8zVmnULkuQHEmvVaQ+EbaGXvQFyF+Cu?=
 =?us-ascii?Q?3Hz6wcadhz8cabC7vQaCNhlQuoI9yu/fx8i4fP6BhAtIq0W2eJrtTGPvrd3H?=
 =?us-ascii?Q?UwjaNs4PVTfYEQYOlnUbY3Yxb/zexqribX9PZlxwUh9L3cB+p68BsL8fGWLq?=
 =?us-ascii?Q?4K+aCxxq/9CkD/LHC+/MwNksmxdNTb/4NnsEB/Km23OZGu8I8L4Kv2w/7piJ?=
 =?us-ascii?Q?kDLdMUtZtfKdmG8rMLj1e/ZsDikPbjNsA7vQdawCIruD8vpNblCsfUCjWbZ/?=
 =?us-ascii?Q?9XOm3+wwfpq6tGnmjyRA6eg+YqrxfIw0ELaS25Obc50V+9GjF8ZzSfJSuEbE?=
 =?us-ascii?Q?faPf00XkzDXpDGgGe7fC69jd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbbbadd-ae2f-40af-3d08-08d93d9eb752
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 21:16:54.3246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt7E8I5Wz4r00JG4K3dXh9ZPOLpc2YiM8fvEf2QxhIun8D9KGnqhiiQnY1S8HXusEl3cLSXkcFm++rmcCqnaaaa3VJ29PGr5rC5TXSmCeDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.6.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There is a dead-lock in active mirror: when we have parallel
intersecting requests (note that non intersecting requests may be
considered intersecting after aligning to mirror granularity), it may
happen that request A waits request B in mirror_wait_on_conflicts() and
request B waits for A.

Look at the test for details. Test now dead-locks, that's why it's
disabled. Next commit will fix mirror and enable the test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/151     | 62 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/151.out |  4 +--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 182f6b5321..ab46c5e8ba 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -38,8 +38,9 @@ class TestActiveMirror(iotests.QMPTestCase):
                       'if': 'none',
                       'node-name': 'source-node',
                       'driver': iotests.imgfmt,
-                      'file': {'driver': 'file',
-                               'filename': source_img}}
+                      'file': {'driver': 'blkdebug',
+                               'image': {'driver': 'file',
+                                         'filename': source_img}}}
 
         blk_target = {'node-name': 'target-node',
                       'driver': iotests.imgfmt,
@@ -141,6 +142,63 @@ class TestActiveMirror(iotests.QMPTestCase):
 
         self.potential_writes_in_flight = False
 
+    def testIntersectingActiveIO(self):
+        # FIXME: test-case is dead-locking. To reproduce dead-lock just drop
+        # this return statement
+        return
+
+        # Fill the source image
+        result = self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
+
+        # Start the block job (very slowly)
+        result = self.vm.qmp('blockdev-mirror',
+                             job_id='mirror',
+                             filter_node_name='mirror-node',
+                             device='source-node',
+                             target='target-node',
+                             sync='full',
+                             copy_mode='write-blocking',
+                             speed=1)
+
+        self.vm.hmp_qemu_io('source', 'break write_aio A')
+        self.vm.hmp_qemu_io('source', 'aio_write 0 1M')  # 1
+        self.vm.hmp_qemu_io('source', 'wait_break A')
+        self.vm.hmp_qemu_io('source', 'aio_write 0 2M')  # 2
+        self.vm.hmp_qemu_io('source', 'aio_write 0 2M')  # 3
+
+        # Now 2 and 3 are in mirror_wait_on_conflicts, waiting for 1
+
+        self.vm.hmp_qemu_io('source', 'break write_aio B')
+        self.vm.hmp_qemu_io('source', 'aio_write 1M 2M')  # 4
+        self.vm.hmp_qemu_io('source', 'wait_break B')
+
+        # 4 doesn't wait for 2 and 3, because they didn't yet set
+        # in_flight_bitmap. So, nothing prevents 4 to go except for our
+        # break-point B.
+
+        self.vm.hmp_qemu_io('source', 'resume A')
+
+        # Now we resumed 1, so 2 and 3 goes to the next iteration of while loop
+        # in mirror_wait_on_conflicts(). They don't exit, as bitmap is dirty
+        # due to request 4. And they start to wait: 2 wait for 3, 3 wait for 2
+        # - DEAD LOCK.
+        # Note that it's important that we add request 4 at last: requests are
+        # appended to the list, so we are sure that 4 is last in the list, so 2
+        # and 3 now waits for each other, not for 4.
+
+        self.vm.hmp_qemu_io('source', 'resume B')
+
+        # Resuming 4 doesn't help, 2 and 3 already dead-locked
+        # To check the dead-lock run:
+        #    gdb -p $(pidof qemu-system-x86_64) -ex 'set $job=(MirrorBlockJob *)jobs.lh_first' -ex 'p *$job->ops_in_flight.tqh_first' -ex 'p *$job->ops_in_flight.tqh_first->next.tqe_next'
+        # You'll see two MirrorOp objects waiting on each other
+
+        result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait(drive='mirror')
+
+        self.potential_writes_in_flight = False
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'raw'],
diff --git a/tests/qemu-iotests/151.out b/tests/qemu-iotests/151.out
index 8d7e996700..89968f35d7 100644
--- a/tests/qemu-iotests/151.out
+++ b/tests/qemu-iotests/151.out
@@ -1,5 +1,5 @@
-...
+....
 ----------------------------------------------------------------------
-Ran 3 tests
+Ran 4 tests
 
 OK
-- 
2.29.2


