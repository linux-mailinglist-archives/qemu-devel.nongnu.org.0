Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54F4C6BD3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:07:47 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeoc-0003XS-8v
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNt-0002bj-VV; Mon, 28 Feb 2022 06:40:10 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNr-0002MY-UH; Mon, 28 Feb 2022 06:40:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNeLjZ9mJCgWUWpP0MikzveOA5IMReOtTl7b3HTU6ByOxrAa2mc96X0OS8He4RaRWQTi9FPLtAwXPlTWvstoyK9IMB7/0RImadsWz9Zv7G10mB4hBw9K7OZpNR6yHY5ngoLJb32OS4Ieik0rG+dC9G6eDZklXrlUHPTXEy7/bDPsOxjWbmR97p6LKLSk54Sd7nMw63C1A1vnA/BPsD910Vbo3tXkYmg2gljDGDp3CjV0RpqpaBnoMW8neJuBrw1YtVFhWS+ve1rPxk8IyAEQTheVLTTML/Np0bB/MLx3qH4wA3kWaOYkH7GtCaLmeFXiIeDH3Nysn+OvqIS/xh0YQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEpH+HIzXiDTHUzHBNTB3tdUmabNgivX1ETxG6gdcEw=;
 b=Adnh6cGWwX0wEb6XKqmU6U5JTTrXsQYiig5vTXrv9rFVL2XbdCC/4MaeAbwJNe8CroZemqVcPKUpV9/5eKBPszDL3kObODMDE/pDYMAbuqszHdGNzgM8Sik32jFfXdtsEDBCaEsNWgtlFMg5iAtJ6H2z/CC7WslMlq49P68O4pj2xzXTnvBgk4qg/zauTYCHn5LM/LBj0yREujyhjXubupDveVbj+F+NzRveM11R+azkQlSTWZPXyuJFCDB3fLxGO9wXZPGLxLrLicPROcUMyYdrWdVVv3ZxPrrD7lOPi2hDcwrDGWGd9JrgtMSg93J3zEBZWTvWT5P98QLE/IfIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEpH+HIzXiDTHUzHBNTB3tdUmabNgivX1ETxG6gdcEw=;
 b=wtEyK/2mj9fSZqPZN2PocDbfdZbYgZ8YEX4r0UQj1HJ7uRW2+CuaFYFQ51DJhq740mug5RR93ttwqRZ9s0UpgPbcVlu8ONZGAGHHLgc9HGN97ae/8vcxKwyEqiLJDSRzMaGGeuZpElEl8uQ+jExYcFqYkOLE07nEMrrVmE11Y4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 13/16] iotests/image-fleecing: add test-case for fleecing
 format node
Date: Mon, 28 Feb 2022 12:39:24 +0100
Message-Id: <20220228113927.1852146-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 137cdc30-e91c-4f46-e98f-08d9faaf0b0d
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272AF167E1425CC3881D3ABC1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47wn4Ehr3ERMti6U/zcWh8bx7DG06vFzzKy5MBLUDuNYgEA43cxMFIEsAkmcGvo0HDUOBmSJOEUeqKwqi0RAA3fx3dJSCfBhOiDyzBZa2Q3gAvwJS2R6Ca1yGoudp4G2VA71Tumu1aOUoBEeAHQR34mz/HOBXjW4q6S2SmPdwcPZpFHLbDB/Td74y/VQCI9c7IYPL4XaDVuuNH4mD43Cq1PvFHvoAHK6Mh6icRuxvA8+kVyOjXZyEy3edHXJgMO012FZJmcXbIAuqjHwcNyNUWbnESinXoNctcWNBBtsxGAbkSq2ZIWQVyyCkuXhtkUBAjxni8CeXvDJDWXIlWJLe0tHPSBN2vp2OQj+z4zcxPwoCv1eSFys2njmJhjm1K4WHZw15K6TYBzlRajnpnf/Oq8KF7gh2hpksbskf8z4gChertkALqwl3/3LYrIDnaN/tDIDaZkw40Ixa09Aaf/vj6njqHNO2Cc+Exmgu4y8tw8MhCUHp+SMnRtS3qW61t5u736GzCN56Zc+rEYgxsKSiwqlROr8LaaClfyq0kVqK+dXCOLs6ZK3+3XdQ/6JnHeZ+74im5/5pbwERdkTgJPN+bYZnLvpn7V3s1to+tQPSGiX0BLLMQc0DOGzUomGQF6+JVsrGhuAGeC2thzlHQN/wrScqtMYwCYKZfcAq0M9JW3qeWPbqQnW87Z9Qa78Ivo6LTVzbEVZHZuhwFtHnb90Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NYCiDn0td0wVOy3u1BCPiUItRoY+K67+Q1TJrpZIucPRXdoIFcVBNWaIeuE/?=
 =?us-ascii?Q?UVkV9moZPvv89IjxAVIZS/Omig8G0RCpNpk3qwQOFn+gkVx0Z+JOQeAw48Re?=
 =?us-ascii?Q?U1wegnao4Ik7k8x69ZuRUBcMkn8aXywTos4mJcPQlT+I7OhHIhForJwjdDGf?=
 =?us-ascii?Q?2Vs6c5JM8doHPDWEWKkhyvqa2MUkAKoxc0x5p9Nwi19FX04jSc51rBcjD0x5?=
 =?us-ascii?Q?xKb4kmH5+DTAo8yk/BRmJWd4X1v5ruuNHC0taDalzAx6xQpOBiurnSguw9xH?=
 =?us-ascii?Q?l13Xm28cLHe7LUuGZLh/ItSuRSaMfFrC1ua+ORH2/rnvPBjq7FL1gZM5WL+5?=
 =?us-ascii?Q?JdhSZ4qjd7pGownSAAaUlxM56qxs907A2JlBAcrU6aCWg2TbRFgZaLeGeN/p?=
 =?us-ascii?Q?ByXx3+daNAwNntpBgpxYy6MxKeSwGb5m/44ouTUVZbNJAkR5OyvdXv54Z48h?=
 =?us-ascii?Q?qZpE6nPj+SlriOWO6Y6C+RWXD6Ora9cHy3XMDOr0ep2SCII3uOjdi0FS6FfO?=
 =?us-ascii?Q?uCgvTb6fV1q8p1HPqUwwjoqTx5U5VCJRXczXGenn1IWe5acdUdALOS9pD7hR?=
 =?us-ascii?Q?YZzhM3b6JesThID1ronrVibVbibhKKTVMDIH4SRSXLeg5GtfWWbvTa1jvWmw?=
 =?us-ascii?Q?W49Ibm+Oa4AUy6TxZAvy3aExeG3kfm096p2+kc6IkUxSXcwI7ZLdb0t0C2em?=
 =?us-ascii?Q?gzbUHy4HL9oxJMOa71/p78lXHBvr4VFr6B87IGLuyig2DEEvOfypkIZNLIc+?=
 =?us-ascii?Q?ToL+mfuQs4/Yz7y+v3z+caPwWgN95ICTPT5QBSQP6QvWtSty7/30yULch1GF?=
 =?us-ascii?Q?HXCeF5LlD9ofGPVUUp40fQZXQD5wHh72tf3vX0P2gQFRnV7z3H74IRVmKEn3?=
 =?us-ascii?Q?oX+ZFPX4qu2pV2RbBfCRsDfrY09YeLKFkphleBplPe45GbGZ985gnYBh8P00?=
 =?us-ascii?Q?h2/bisL74p2Qj2JzK4EkJGPaET7Nx6YYg6LWd9TCSMrmcj4BYrwO8H2gvZwL?=
 =?us-ascii?Q?++eji/BnkL3i9yHXxbOAgeZu5fx7D5cHaUFJG44GS6RaX9ah2ebLumJiXNAQ?=
 =?us-ascii?Q?nKTqV/t/9s/WI+oo5Am3p2Z+B6jZFN/qnD0/a5Jqgee4h+qZ+KI7COx0L9Ek?=
 =?us-ascii?Q?gbyrKFDYDEP7H4x2woWp6y3ZmV0PZ/1sW+YbYJOkYJjZp/uwZ7kQBGsK3q5c?=
 =?us-ascii?Q?FIAFvZchuVjXBwzB7jct6z1CQjV5IU18xl3hf1u7G8/4aIxsNyWzHRFcnuax?=
 =?us-ascii?Q?nFQaXVc8UAP8r7V/QSpo29seZT2ncfgO5r5I6qT2lYxPi5ACjFk/SjtbOSOb?=
 =?us-ascii?Q?FWux3mzp4iMIM0quGvdMRGN8iHRNQwsQwoo9yBpC/xgb0MDkT46UTlfm9+IA?=
 =?us-ascii?Q?WaDu6h5mozr4+zQpaj5uBVJ4uyNsLihuU6ssuwtAeV5tJWHnHJflHr4utJxS?=
 =?us-ascii?Q?jvS0LZ96xsXPAW3/DVI1+gmhyZtoNWcwTUpQ1vGoNxABd/Z9vk6jjMgcRAZG?=
 =?us-ascii?Q?E8HNTWR4jhauKaVLLQFgjNn2PI4D1SpdoJChvKkAQK0L7yVcZH1m3fa9mWgh?=
 =?us-ascii?Q?j11tVC05xtqx3qXcwpkwbMZhC897vA7+g0tIqTsfXq0YzdSF+eTiacSkHSxt?=
 =?us-ascii?Q?bIKy9uWZV8ZSHLcQtbSewqtkQ+uv2ZJh+gJ/RcG6s3uBqN4y337b51DVqxVT?=
 =?us-ascii?Q?zHDL4Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137cdc30-e91c-4f46-e98f-08d9faaf0b0d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:56.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMQjL3yaZTt5gO1avtXy+6mV+kgDtUzyaRejlD8ORAdN82d5qHKjzJF5OCJYlvMl2S4bTmvDd2nGIcMnHxC1UmHyxUWuxF5pthue1GDMGWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 64 ++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 76 ++++++++++++++++++++-
 2 files changed, 120 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index a58b5a1781..909fc0a7ad 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -49,12 +49,17 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
+            fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+    if use_snapshot_access_filter:
+        assert use_cbw
+        assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
+    else:
+        assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -81,16 +86,23 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
 
-    # create tmp_node backed by src_node
-    log(vm.qmp('blockdev-add', {
-        'driver': 'qcow2',
-        'node-name': tmp_node,
-        'file': {
+    if use_snapshot_access_filter:
+        log(vm.qmp('blockdev-add', {
+            'node-name': tmp_node,
             'driver': 'file',
             'filename': fleece_img_path,
-        },
-        'backing': src_node,
-    }))
+        }))
+    else:
+        # create tmp_node backed by src_node
+        log(vm.qmp('blockdev-add', {
+            'driver': 'qcow2',
+            'node-name': tmp_node,
+            'file': {
+                'driver': 'file',
+                'filename': fleece_img_path,
+            },
+            'backing': src_node,
+        }))
 
     # Establish CBW from source to fleecing node
     if use_cbw:
@@ -102,6 +114,13 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         }))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+
+        if use_snapshot_access_filter:
+            log(vm.qmp('blockdev-add', {
+                'driver': 'snapshot-access',
+                'node-name': 'fl-access',
+                'file': 'fl-cbw',
+            }))
     else:
         log(vm.qmp('blockdev-backup',
                    job_id='fleecing',
@@ -109,16 +128,18 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
                    target=tmp_node,
                    sync='none'))
 
+    export_node = 'fl-access' if use_snapshot_access_filter else tmp_node
+
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
+    nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
                {'addr': {'type': 'unix',
                          'data': {'path': nbd_sock_path}}}))
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+    log(vm.qmp('nbd-server-add', device=export_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -151,7 +172,11 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
+    log(vm.qmp('nbd-server-stop'))
+
     if use_cbw:
+        if use_snapshot_access_filter:
+            log(vm.qmp('blockdev-del', node_name='fl-access'))
         log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
         log(vm.qmp('blockdev-del', node_name='fl-cbw'))
     else:
@@ -160,7 +185,6 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         assert e is not None
         log(e, filters=[iotests.filter_qmp_event])
 
-    log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
@@ -177,17 +201,21 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test(use_cbw):
+def test(use_cbw, use_snapshot_access_filter):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, use_snapshot_access_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, vm)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False)
+test(False, False)
 
-log('=== Test filter based fleecing ===\n')
-test(True)
+log('=== Test cbw-filter based fleecing ===\n')
+test(True, False)
+
+log('=== Test fleecing-format based fleecing ===\n')
+test(True, True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..da0af93388 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -52,8 +52,8 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 
 --- Confirming writes ---
@@ -67,7 +67,7 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
-=== Test filter based fleecing ===
+=== Test cbw-filter based fleecing ===
 
 --- Setting up images ---
 
@@ -137,3 +137,75 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test fleecing-format based fleecing ===
+
+--- Setting up images ---
+
+Done
+
+--- Launching VM ---
+
+Done
+
+--- Setting up Fleecing Graph ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Setting up NBD Export ---
+
+{"return": {}}
+{"return": {}}
+
+--- Sanity Check ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Testing COW ---
+
+write -P0xab 0 64k
+{"return": ""}
+write -P0xad 0x00f8000 64k
+{"return": ""}
+write -P0x1d 0x2008000 64k
+{"return": ""}
+write -P0xea 0x3fe0000 64k
+{"return": ""}
+
+--- Verifying Data ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Confirming writes ---
+
+read -P0xab 0 64k
+read -P0xad 0x00f8000 64k
+read -P0x1d 0x2008000 64k
+read -P0xea 0x3fe0000 64k
+read -P0xd5 0x108000 32k
+read -P0xdc 32M 32k
+read -P0xcd 0x3ff0000 64k
+
+Done
-- 
2.31.1


