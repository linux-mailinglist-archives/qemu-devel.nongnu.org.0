Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139774B9204
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:00:39 +0100 (CET)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQTc-0002As-Tz
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:00:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGf-00048T-JH; Wed, 16 Feb 2022 14:47:16 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGd-0006Dk-PW; Wed, 16 Feb 2022 14:47:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCowZXw7vD8m4XDF5g8VRAuPYpLStmTV9/Zt7e50RkrMbeZF3GpbZ9Pw2qSxXrrkjHvAHoduuib0FoVlknSHCOCP8fV1CLtfhK90Imtld6XfFf4KTh5rAM/wiz2LQaI9tnFmlFVeRNgQVLHgeIOJFR2ZODVB/dc4G5bnU1DRg0KqgFOKK4uMBjSBpVHtLATsNz7eZra/di1TnZ9Ajijj52iYNBdu7zXsh3VkqaqrfQxhuGC2Woz3Rwxr9xGHQgptPOptkiN2bX23CyFsJA18R2DuLcHERIMy1lkQOb4reuYqysgJMz/sDFd7JhzWJ4acTBsS2a3zwNh2bY2xbvvfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjQf3y3wQaEnooXwR9p9murh9353ZYyAsP2SYaXwUsI=;
 b=gD/t4yasfScwsVsnFct01Li4SxbMMIDk2ccbRtwZoE6jTnGmx0dOJCuEWEm4ijT/W2NZitWc+jop0lsnfr5aseGIOqfu3ZKbVzJwsLCLFiKCmu6ZGz1KuoOT5lo+vJPS7ekr86p4Jqy3xEhxtm2ljO8kTYE39QuB6FcC8XTt1Wwjwvko76iB4CHogfnL1owsQ7l9OcBLB8zTC4cwWirJHGgZFllR676YJIWEo9pxJiXXjm5GkmK9Z9VkJu5UfFSKX4k04T0xinXeZ44Kgx2ek4z3XzYyFTLMVl5aKDWFw6Xr/59hHdSZpVY4RrMtr0ViYulRUhiPMod3+VVBouWZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjQf3y3wQaEnooXwR9p9murh9353ZYyAsP2SYaXwUsI=;
 b=JOlkejnJiAhsRJWeq9WJ1QXDISKlWPQOAlR01O7Uyp68fW3Bftq8xRLYsF4pOg5lhKn8UCdqIOHWBi89YfRivP9zfvYiNY9mMtE0YnFxdbPoaINXOaCARwK0X8BxiHaUPOdbtOS2S+5hfLrmSFJH3CZRRdN38UYr7F0NaotTj6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 13/18] iotests/image-fleecing: add test-case for fleecing
 format node
Date: Wed, 16 Feb 2022 20:46:12 +0100
Message-Id: <20220216194617.126484-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f40c94-8b7b-41c0-3bc5-08d9f1850db4
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB285185879D0F4301D3E57594C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjdGcmP5bzfN5N61UyqCKufr5oK4x9q84NRC311OuUWRuE4nww49vn7RU/2aHPg7u/IQjDU9JDMstC+jcSa43HF4VpJwBxSXnxZRhXhslw3nmWo3Nv8bXFnIkmDI8RLQXsyMNnQ0X6MaAZ+YiI2nbfM4I2uWChfSvH5Cj9A4FavvcBHmdt7+2Sth76ZrrznxAW5BtI89txcjf+Avy3294gV8vZ5AdRkP344gKF6Kqyj0k5Qtktgr2IJ/dOP14bOmkUSrc4xiB/ld1hUp3jzQhtSgnCDtopsTHTEIhGD+WDaaj0b0mj9vUWER4ZFyzL0pIgZVra06P9h8056eKETlbwYLkG2NFjwqN2PrLlt1iVkA8y3X2zQQO90vRu3R0soGv/foRKRkuhwoU+UzhhePueQTH3rvsMWrsjNhqYy8F/a3Mb7d8vAAaQ3Ihb0OXsSca5APwhGKd+evVN0Auk8TV5X4MDP4xkl9ZQA5sv7QPf0lakz+JPVUHlaIBH3DPgf9XhDsnLqWwyghsZP0cvfFfPoV2cNo1+DMVYNf071SgW3NLbs4ZQldi2M74rAcUtc+C5WEytB1gJn/uOIVmTBBNFLHJBSpS8lK1SXjgdYsxz1EO5egLnYkjI9MJQ/L3rolFTZ43dXjpMPOqt4xIg3rmJAiVVSzYPbqLLrmZRqC30O6DC/XYhhmkkIljH1JaJI7Cia91sdRVNQBjO4uhlcEcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvJUqJM83Ieeu0yIxQcQhtihfuiVQ05aOC/cgbIyFlAhdrk5gNtjbh2TuIUV?=
 =?us-ascii?Q?SzVTOd559MZ8jQiwNJnLu1KJUi4vPoQhkD1hA+jCjNurnZBzeI3jHji4Ph7E?=
 =?us-ascii?Q?jpTj7hnr1VPaMuqqjeAVIn5mDNUail17ImLCRYeSmc9PhezK+34tIrg0lWFQ?=
 =?us-ascii?Q?tVHZHzYKkH4PnM9ZbvJ/j94aXNy/AEQQMErIR146+OgFSoTobo+Mvrxjeq5K?=
 =?us-ascii?Q?a3GxSBZ5Tf20hduoQoC60+zKjWm7xCN0BFnNIPulFqTTiviQZfHHjeL28byc?=
 =?us-ascii?Q?4Bl+8X93srkG36jm9WRMgIUXdP2ICQHcBhjzhmfgIjEkAZcfEe+5ESI1fn3N?=
 =?us-ascii?Q?Q+8gtPjqY0Zzxed1kCT3IslrdrYm46Ipa3YqI1fszv8dsjpVdTYWmX3ZVZSW?=
 =?us-ascii?Q?KcgMGNp1lckGds4ohejCQy9BbTIWk0Hjjkb7YuaWNkbytscfv7/r33uoT69z?=
 =?us-ascii?Q?Mw7At6N8hwSJyjbtqJqvkWDOOvYGLgCgoU3cTKj/wy38CEjKIbddtSdyjhbk?=
 =?us-ascii?Q?59hw0dXoapCi/oqLA7FHZHe7AdsPIj2iZ4xrOrzKrng5cumAbyheeTgjBPB7?=
 =?us-ascii?Q?FoKNwt9ltxqxm7rolOsRHar1iJ305kDIAbPyvIYFBoKwdF5RrFnneP7wPFPp?=
 =?us-ascii?Q?rM3HwvRX5fX+iuG5sJKUA0bxemK8UP8Y3bJVYkUdOJTOjH/gNQffd7kqNchF?=
 =?us-ascii?Q?OZKfAnl9T3yvvgrWLGWGZMIZzPbU/ewXzrnjaGFqASNXVip56JQVObLpAunI?=
 =?us-ascii?Q?kSfG7kNRVg2TDXWjVePOsEK9vqzjMq7yxfv1QFOgAmkQDXFo0wZuyd2iXls6?=
 =?us-ascii?Q?iIMpC8B222FpceEAnLFaEFK7R7zV3uwCtjAS5nstj8tkNLZfSCKxRNoliEs6?=
 =?us-ascii?Q?Z/b1KnBTX+9PPEaq8coNL/+IBywgYYsYrYbL6+C0Qwv59MeSHJgZglNJcGRq?=
 =?us-ascii?Q?mefRLE2M/NCB62LGrAoWHGoBPSIJiF75FnJsJ67/jyUkxxQ+CTBtGn8ivVXb?=
 =?us-ascii?Q?YbfR2kFRksiEwTAgcJILalAqqcwZR9M3nHwnDLCvx2jK+E8S2HbfWtVTMCKR?=
 =?us-ascii?Q?jHffj9+nN4WzVPLQAkj7VMmw0kUKqKRwiGXGf3aOrBvfKijMWrlnfxuI5okp?=
 =?us-ascii?Q?1FAJRl+Lvh/aWWS6n2fy5t+tuzwz1nS8xhaKisjKbqhM1VjQ+RotEKJqdIof?=
 =?us-ascii?Q?Eyg2k0mpSJnPIEAD8nW9EshzmSYZlHtOYHSQeib6uREVKa25K1bWUD/W7NKW?=
 =?us-ascii?Q?XrxO5ApWXnKlIzzPC97FIW7HJU8fPYZt3ivYE3VzGNWb8dKPLsHzGZN8jBP0?=
 =?us-ascii?Q?r+plgwxqngUaBTcGKJZJp0ItFXlVPRrSWx4UQp1+S+Wnz23uGzY4eoyFJlov?=
 =?us-ascii?Q?e58GdCJRKOivtGRIfKNRmVKNPc+xmbJgCM5irZ+63bi9d3O0s6u3qG2pBq2Q?=
 =?us-ascii?Q?dkIarplCG9Y4+wqhDEilol6HchEnoEPiraEp1cgUSeL7f5XbP+ECScpx4lb+?=
 =?us-ascii?Q?lJLiGdmxeABx1CG7E6n4NT3ApQdBef6gkOF/XFCxfO3iWgWwdtDOI4tAWDIf?=
 =?us-ascii?Q?aEOCJNanOG1YDFo1plQ8tH3UuyD4PbZhWK7AHDebl9QHlQ3pX+yrCwSiGFm7?=
 =?us-ascii?Q?HMC0l8odUQlkOnuWJF164p7vvK88ok4pjhCIwd5KV/A04ag/aUnYHYWmTDH6?=
 =?us-ascii?Q?xpmCGA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f40c94-8b7b-41c0-3bc5-08d9f1850db4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:41.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpjF27yvFydZuPLJ0k23ybEBCphWdIiMe7frKw9YS6p2cEqcJzPTccFJwJMIs5nRkcVxwdiorowDcMKKeEGOAB6qA85y01u8lxD2kuYgAUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


