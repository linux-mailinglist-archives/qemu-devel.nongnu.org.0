Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456083978F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:21:48 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo85L-0006xH-BI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cd-0004c5-2h; Tue, 01 Jun 2021 12:52:07 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53678 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cX-0002xm-JY; Tue, 01 Jun 2021 12:52:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6Zbu6usHn99yaNK0UGntUHpBY963e8la4AB/29SaEzQci9T2upQvGpFNQxuwpneK4VwiRN0kb4At6536CHVfjjJc6TJAz0sOkz9nrtZVUVd8ba1vYfGK94S1PgkcyhSIsHBj36xaSoE70KWktHPdZ/eVeuAcxdc+zK0DPuvmUDu5FSfQZovpxSfl1HVfs9hW1fRQbR4t4pyY4NH6ZhEx0P5DUz5eF6dUStBZbGilnTN5B3nYvWN/3MRHCMaxRyt65ubhvmQxz//DMKE0lSXBVU+J6BRI3ed0AU2a2JMS9C6i9APitx/jPz7WpztHruolo/LiAO2/PlvGDPjBBcmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=VK5W6V9SRq/0KsB2pRz9C+CdMBh8D2KepAEq4NC9JadjjGotGq6hgvBcpmYBoUCwSZOJasfkN370zFKFIZ7iGeLrdWwjfyOzl9HYj+62zeFNKz+qjT0T0raSPBy1essBamaMsCED4knQwsiu/4E9yod7F6RqLFO3haRgXbyyDazDJzOZfD6DnFGlZs+SeUbHowkEb+A+lw9XIpmit/VA3DIJ5iBXD1XC11ZPLz1JvE3lfl6cjLT0/I7CZK50kdpu1mbT+dUZsJtPkOp6sBDdpUrBGAI14zHry8MgCv4/cXpW2w+Kp/KsBcdjkmfiiy4CxAd4h4zPcqaeKu2/LH8t7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=AW41wjGRiXhIXcKBKQTh97o8IB0vbEtIKQSe3MffbCwXHd53aqdWcnmrmG916qyckQ1skhYo6gCe4I1wsL/VZJ3SowcVdbAZaR/TPvxkxklkD4BcKUBUXqJSksiQEELDnZs2H7ZSvCEcXh3l3wSv1wiGG1TqtbFRE1CuHUDBllk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 35/35] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Tue,  1 Jun 2021 19:50:26 +0300
Message-Id: <20210601165026.326877-36-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6916bd21-dfc0-4a62-aa84-08d9251d8123
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386403447FD5930FEE02B8B9C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLMYiyDoJLkWT69DsSCA/2vSv/1jdPPddWSyOsmjNCe3dLQWHqUuICj4cymE6by8sAVdEDQ/Opra35jKmd0OppZH/83+T7poZ6ub1lgEEiqdekWkoHiwsTLqwUivlDdMjjLLSeVG2f563HmrizYo/6BBI/MLFyd2Uo5jdZ3oNQcgFdV+WEO2H87a8Dm4fNE81sGx07j6Pun0T8yINu/DPRZBLshVSG4Z81fzxpGSgVhCx8E5hByILgfmFIeg0gBWjzWTbS4N6NN9iDGeEunL1NVTJ3bO5XFZsoz//XtSjG1zQMEjFZXW97D3yWD1UTxQ1GWvp7mpr/FAART/PBPs5hVtJFksD77d1UvID02CpiCAhyOL7WCwWoX7pHU6Jk2Zv4dCBFs0T0+1JlzjH1MYkxNcHhbbEh92vz/Q3Ukr2IVPHWkGrS8RS6kz0tK42kyWMQaxCDxFRoWeymi4ziX26Etg/AkJ1ib13lg75Wrcs5g6QEkVatShYWIpGTO74iEXEzLMPqoXHBT4DGTPsLDRWyS6WQ1oNtHgfIPaJWEZT+C8PgDe9JhxauWvjsetY7t6sbdWY5ZjNH7HcUHecjFJhiCdexulB+CWV1zkEdgCAyTN6sn5vrEhcwEVVeunC2cfN/3+UX5RNgdc8BSewAfydGzYK8jmuKoLrHBK9s/hS9d/Fmy0dAPbsYYIVkvHuMkK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(6666004)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jr6zFcGKBkBckeKOyATZB8AfIxxf2fQvn+Gabu4Xiud/xTYwXobvAjJQaa6v?=
 =?us-ascii?Q?cZvErrTVIsmY67+sMsIEIjNVEhMDA3vZtNapkq0TPDHOYCL+xJhyodM5DEEM?=
 =?us-ascii?Q?w7Nk9DwQtaNzCHwhYKhAlV695uAQWNORIQZOWp8OgdkM/63DKrQXhK7kXi48?=
 =?us-ascii?Q?DVAu6uv7BcdBP30rnszdvAV9D8HrOoKLBwP++jr3gvTOCKnEBiY07i3IGR1J?=
 =?us-ascii?Q?XsUsKsifZm951ea3kkyFGwB4D2s3YIHiUQHp6UJuzZMG7B0EAkPSF5uLrke2?=
 =?us-ascii?Q?utelmN7C2AL0VJdbRAWpU5+UlDtutgvy6SxiO6mTdT4sUK8chMrXbhe6HlRe?=
 =?us-ascii?Q?Qb07MUo9BoWSRDfeXwCWVoIO6C+r1Uq5INg8204aLBvbBnnN6bWXd7kSPGLk?=
 =?us-ascii?Q?2vcrL/2r+Xh/UTxRPSYi5Fj6hpoawJLDiFTK9BVbptmOpc+b1h+lZccOCf8H?=
 =?us-ascii?Q?p6eM7C2h66dXTZk0sltyWlqdGH49iTSrfZ3Sc8KcRvKbuOy262DtW7a/UCKa?=
 =?us-ascii?Q?C6VFO8fH/RLLmdaNSHcl1l0ANJVpWVOAx05FvT/LCpnUBQKmJ7vE6cfgrEUf?=
 =?us-ascii?Q?F16hcijz0e9OUbqPYYuIS/XAK0xUDOMAQBA1Q7tAQzQYNkQEQOQParFWsfa+?=
 =?us-ascii?Q?8wuh/RkKBotzpnS7ccfLpxbi+SWNM0rQkbFQSLL8tmeN7mpqTmJmtMOMga3s?=
 =?us-ascii?Q?Qlq/Z3y1bB9TJpV6Rxyx7XQmJzCgVF980PuXWYDjYQyPg3ti8DTlmfTDwDIf?=
 =?us-ascii?Q?mrhIsFSVzueNQwk42QoSpHepEw8vXhKss+/PBqmCNWeqUUe2RBR9ygxqyggW?=
 =?us-ascii?Q?FtRDAfnpvukKiXKkofJ/pynmsZ7WRRUU9k1IkFwy/VqrKJYeNxVOFhacO5ns?=
 =?us-ascii?Q?JVn1evKiBi67p+Ucw99VAZXas9gTOXWGh2j4Pu9i2mauJA78tFdErIOgZksc?=
 =?us-ascii?Q?+LhT9F2JyOUZGSsqLzKQc6LzAgsYap04bYgRp4IEysFXBb9UaZGClkcmFrPs?=
 =?us-ascii?Q?nYkdkQiGMXKFd2+Scu30QLlxvXF7jObvpV90H2UKmwrsb94SWwHBsHrxCrao?=
 =?us-ascii?Q?i2UDXJ5dOFHO927/QT5QT4FA7u1hw5NGzx5VBjPIEWxlfcy9zx3cEG1vq8lc?=
 =?us-ascii?Q?6R4RPz8x1ObaQUeg8JS/Eoe3edyJdCMiCkF9c0XfzvJ7caXA+fU1d9FpDU3X?=
 =?us-ascii?Q?8Awpw+nHxzbRGcXUfmgM6tBmlEGabz4Fc+syJRieroaerJCEMTX/Xcgb8Sa7?=
 =?us-ascii?Q?6xMhos7C0GSgmhp2ZkjkiBSlP9uJ/jFb3pSKNrqL1tZkQ/j388P/e5EtrXOb?=
 =?us-ascii?Q?L6wOghW2FaPzOEspGhGkeb7E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6916bd21-dfc0-4a62-aa84-08d9251d8123
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:30.1618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEYaKGChNrqQX5egBdIFo972zR5vvmIwUpr4trERD08I9cx4JTM/shCQ4K2OU4/Yya0ZJPrWuiwE0IJDKp/SAVYD7+BrkLgPzjkVfRlYtkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

New fleecing method becomes available: copy-before-write filter.

Actually we don't need backup job to setup image fleecing. Add test
for new recommended way of image fleecing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 50 +++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 72 +++++++++++++++++++++
 2 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index e210c00d28..f6318492c6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,7 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -67,6 +67,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
 
     src_node = 'source'
     tmp_node = 'temp'
+    qom_path = '/machine/peripheral/sda'
     vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
                     f'file.filename={base_img_path},node-name={src_node}')
     vm.add_device('virtio-scsi')
@@ -90,12 +91,22 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
         'backing': src_node,
     }))
 
-    # Establish COW from source to fleecing node
-    log(vm.qmp('blockdev-backup',
-               job_id='fleecing',
-               device=src_node,
-               target=tmp_node,
-               sync='none'))
+    # Establish CBW from source to fleecing node
+    if use_cbw:
+        log(vm.qmp('blockdev-add', {
+            'driver': 'copy-before-write',
+            'node-name': 'fl-cbw',
+            'file': src_node,
+            'target': tmp_node
+        }))
+
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+    else:
+        log(vm.qmp('blockdev-backup',
+                   job_id='fleecing',
+                   device=src_node,
+                   target=tmp_node,
+                   sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
@@ -124,7 +135,7 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
+        log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -139,10 +150,15 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device='fleecing'))
-    e = vm.event_wait('BLOCK_JOB_CANCELLED')
-    assert e is not None
-    log(e, filters=[iotests.filter_qmp_event])
+    if use_cbw:
+        log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
+        log(vm.qmp('blockdev-del', node_name='fl-cbw'))
+    else:
+        log(vm.qmp('block-job-cancel', device='fleecing'))
+        e = vm.event_wait('BLOCK_JOB_CANCELLED')
+        assert e is not None
+        log(e, filters=[iotests.filter_qmp_event])
+
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
@@ -160,13 +176,17 @@ def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test():
+def test(use_cbw):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+
 
+log('=== Test backup(sync=none) based fleecing ===\n')
+test(False)
 
-test()
+log('=== Test filter based fleecing ===\n')
+test(True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 314a1b54e9..e96d122a8b 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -1,3 +1,5 @@
+=== Test backup(sync=none) based fleecing ===
+
 --- Setting up images ---
 
 Done
@@ -65,3 +67,73 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test filter based fleecing ===
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
2.29.2


