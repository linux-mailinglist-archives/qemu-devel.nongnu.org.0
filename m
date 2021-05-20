Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE0538B22C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:47:29 +0200 (CEST)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjxO-0007QM-VO
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjad-0008FJ-6A; Thu, 20 May 2021 10:23:55 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:23109 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjaa-0006BI-Pk; Thu, 20 May 2021 10:23:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7iYC41NnT8tKUo5IJo4KGm92lD4ta1FLNY7G8q65kf+A2+aCnANUEI60xys6tNmmn9KmpqFdD90ZUG4bkKR4Cz87jnMq8XULrc1b/XOmERoHtE08L8DXwQPauje7mFvTaqfRr1WuE/ZWIL9dFYEvuTHO2gZddngyDsNNFPZgdf2Y+005++my7j1PDK+cDlP93uKJF3Vrple2BzdGDxfXTej6PN+rSMuCqOR+eZfE2uV3u7GZi7dB1fTwF8HNfoBZZQEBsNxxmLgWaLgwrTA4RiGd2Km/RhQUMjxvr1mHRdc0wm6gHgInmXMYmIjcHNT8LbksWY6HmT3VsMI/zBLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+CHw5kXTiSLLiOWjphuNP1ALWp5vy9nz0YTs3tzd0Y=;
 b=eY9KpY/lhY9Stv0yf4ToDPXvAzoobhJ7uJCnEeOIbSvl8ES3+MkKAjRQ/jQURw/zCUMBXQv/bUXRhkoRUUra3daZ8imQ4ITZ8nIkVJy1zX2KxqVpom715r5kwlKlkzrGqg0UimJQ7YT/eeMSSF96GWup8fogpluDRPo2rkeEhlSDbb5vxTElUY/g4+8UpDm8cH9GAdOH4ADnBSTJhyLsl8i5fyS/wpMSOHHjh3vilLPDCTQoeEdJXTBvDcoL3N+tUrbwIKFnrK2PMHvth/vU8IYTlu0shfv5LpXotxasw/n9epaDzjH5yzsme0tvrm9lijKK1TBgCEHv5V+yDjp7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+CHw5kXTiSLLiOWjphuNP1ALWp5vy9nz0YTs3tzd0Y=;
 b=YrtIsoY1sdETTsGlsZ1I3hRs0fHfUXycxd9dNNkTFbWdnK1A5XkgqPBsCAdZ4/C3UHhhaLRVhClEZUPgVO9USVIm4k20UlH/fKy0urQhUcXGxApEr9aCufXL4MmiyvzrIlPw8/zwes6UyhQZCi+hbDFzH9wjFJNL0uiNpwCWbQQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 33/33] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Thu, 20 May 2021 17:22:05 +0300
Message-Id: <20210520142205.607501-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80999eb3-285f-44fb-afa8-08d91b9acb72
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072E3F59C877D84A2BB1096C12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKc+4AyQs7z7NWlV9bBgq2+yJxn/C2ixb9h4vkm/tZDv1ZnELGuM/8V2rve/hpg5/nPd9+3Z/VBX/oEfehJvJOsELxFAS9DTomAg5GKpMWLciaN/3mFbDlMjvWlgK80Zz0Qwmkm0P6c6/kmMR2T955YmfJEss0xp/RCc+XUQyfXFGgKx6VcBVbg2ceni5AQ7fAbz+oRoCxRvSoQxOr83tzRKlSa/sTIuwGDsHfmvmz5a0ijMRw+dGN3zHCTM5aH12+9UgYFLTZRqiUofTU2i6Km211Wo0lL9FdTOWeb3s7S/rf+oztZNHmCr8UopRQqiq13HCOpXBNT1lK2ub3a80wFC/iC2QVidw7TVBFcgX+7+kRfPJe33I/R25n6F+8KmAjB0AUOFLcVj2FsfYBMeC+X6azp3h6NIQZUyIR4krX9CMuNCAWhq1G1uH8MXXmuCwb2gL/rthh0Y1XPQ3kahwKok47Lq4jNenrZfCq6aDoqba/3TWWIIS8ok9ly5D0tZC62Ly277kKfTsMeTbNDSzbrKq88lREpwlc8AGKkwJzD94OUQUhGiGwfAPLJFJrcDa01pGos+qpHf16ErmFblWwtdT+9iKhjS/CsV8NxqKRgcjInjoHSOLE5DAX7qpusvHvwYQIHodqJxovqVW2ql7qw1UayPUL1EAow8vNuT93k+wp6gyjFmWfpKBViUOr3c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(366004)(136003)(376002)(956004)(6916009)(16526019)(66556008)(66476007)(8676002)(2616005)(6512007)(66946007)(6666004)(107886003)(86362001)(7416002)(316002)(5660300002)(8936002)(83380400001)(2906002)(36756003)(38350700002)(186003)(1076003)(38100700002)(478600001)(6486002)(6506007)(26005)(52116002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?efDqwijwRQRuocchdEDKJHEVdodQMyKKLGMx7IIr2S0iSdom5vjZIPp+G11u?=
 =?us-ascii?Q?GkbqShKBL9FdP844JWvuc6ueb0kCnvCl7Y5KVr2dG22tN1chQ2zJISUTitL/?=
 =?us-ascii?Q?joGGzzOyC+H/0ikjtmouT+UKtyvfseQB3NwMhcdoOj1BXYvxsABXV5gQxdz1?=
 =?us-ascii?Q?L87AZ4L6p0G9BuOF+wWHxEH522KPDoWtRAfj2Xu43bVeMDPrCKM5zUmQgOxh?=
 =?us-ascii?Q?1DYZGi+ipaF901ahmb6YgVjjrjsiaulLRIUZPcOBHTH9NhHhMJWpGT09kKhi?=
 =?us-ascii?Q?8r9Z2rjNeJ4OvnbjacEnSfOVtE+SkJ4jk7hVBCqaoBVsDMlOpTwSM//wPeMn?=
 =?us-ascii?Q?/R7StbHGnBqY62N5PeZ/VugtOX3l4jn2APT1ie9BY26ef+viohZSwu7+Aml5?=
 =?us-ascii?Q?zyFr5phc+bN7BkzFI5AsfnXLGdfxWoxlGa5KGPG+QKwlZWV/2yYXyKypuLMj?=
 =?us-ascii?Q?XYN6MEU/SyyJqdACA8S/UZXzgt5IS7C8s0oyS6iznbIFm3ajga2uDTxGXZaF?=
 =?us-ascii?Q?E825p3BlBacuoxsao6MYo3lHj8nivgi04Nf9bUIrvpPxlgzGwdFL9ucPIDXO?=
 =?us-ascii?Q?BJHGEkca14tfjh6qo8LnL0XcQNwrPEGsO98qCS8YAkGnxRs5ahG08jLasR6n?=
 =?us-ascii?Q?9tLDdMigL2tcnaDbIG6Dj29UrPTQzXb8Hg4i+TMAnw200+8JUansyT68yoJV?=
 =?us-ascii?Q?Rfd1ppk+K1cHONDNG3WtJNhTvcps7oXh8//qWHtrqlnz6rEQQr2J7VnL5sU7?=
 =?us-ascii?Q?A2QtQsxNJ+R4VAIqy88y98QynUS6gMrKgRFD/Fo0YNbkSNcPKuGPsyTPFBlC?=
 =?us-ascii?Q?b3xfp6Ipm/OcCmZ6H7SIeGeC+bjZ5Tj1WKrrz/bpsQTFcX2Cbuqg1li2sB/a?=
 =?us-ascii?Q?9eyH7BcPAsu5HLJt5ZymU2k+y63+GZ86ip4+bmsc4NCyNSAEgM+iM4gwAj59?=
 =?us-ascii?Q?WkXbv3t2LwsIVaABAUC7PDm4tU/KVb76wb+TnX3XvzEAyo0qqxzJrEeKazla?=
 =?us-ascii?Q?j0mJSCiBgFQJDTtTRozgFD9aEs6Ke5j20+DmbfMcdXD9+UYxmfHSPaWSNc26?=
 =?us-ascii?Q?jMBKCid6J3YB9UJPeX3ZcT/ksE3kOG7c+TQqqM1aD3/pWP6+w2KyYPteqfas?=
 =?us-ascii?Q?DYW95bYJ0BhN3eRC6cI/gqYheqGuCoUQ0KUPsExiPnMhbigrADfuxRNdUAW+?=
 =?us-ascii?Q?lcS986iKKLKc5UaW0W+VBhgWUQ8eWKSB3b1weeJQ1Caxt0jY1hAaDMQnpxhh?=
 =?us-ascii?Q?+/LVQg/992PsvBERCUpcFHCL8Y5FZCVhEtBr6MY6dRjkBJNLggdTUMTEBuCk?=
 =?us-ascii?Q?Z6oKsNSy8YN5WXgij8kfeV3U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80999eb3-285f-44fb-afa8-08d91b9acb72
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:10.3064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kjdSraLgD0gG82okVa796jy4jvdOJHN+iVVmFj7xl3bxhb8LlPgP2GOSV97xaqJR/b5Tef7PX/wXJJo6QndpAyKmvTVhMSA960Gmnw17t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

New fleecing method becomes available: copy-before-write filter.

Actually we don't need backup job to setup image fleecing. Add test
for new recommended way of image fleecing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 50 +++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 72 +++++++++++++++++++++
 2 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index e210c00d28..404ebc00f1 100755
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
+        log(vm.qmp('blockdev-add', **{
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


