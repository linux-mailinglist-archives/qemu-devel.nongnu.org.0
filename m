Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B23F5A79
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:09:03 +0200 (CEST)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISQY-0001Ra-PL
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz8-0005PA-0f; Tue, 24 Aug 2021 04:40:42 -0400
Received: from mail-eopbgr130131.outbound.protection.outlook.com
 ([40.107.13.131]:22309 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz6-00086z-2h; Tue, 24 Aug 2021 04:40:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZaO8f9L3D/iYsCmNws6zWSbqqSu4FX+uUO3BADN/BRsOMIerbmaNeohgibkLdoM71A0Xja083Q5ZftzwCSoQ3s68FMuOIYGGeD11Rka6E58yK+I+z7qIpQEC8EfEWkVl2qtUd9lxRU3CWWnvpLBRNLuF8guHAgxWgrRZb8KptQ2ywb0Bbnx+CHXKP0N1tJnbuUWleEMm3ge9voYNgOQAI1xF0riiLSKGyyhJN0uWdP/U4Qg5qQ7mlWeEm2opoXLqgc5UBMETKvqi6UTx9bxi9zgFmfSlZLCb1zN1moGiYQN7fAeMZDdEyR9IB22V8EQG09PIw5gBEP65YCuOeHBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=I3VXzZ7nOcTXUCkDdHUsKbxytAc8f8udv/7REMK9xOhU1CWjWxKSEDwCrKSF7AEy2foUZfp+h5NEJFB7FMPEFkYN4DJIJXvCJCyW0WMO447Y1kqYTQ6760itTz5VaMPRuCmqAJLPRiyhtNcvLnqEX/TPiBW8KojvYAwso7IyYlSrtzo0llc1biYhCLyEaIVp76267oIjZcGbnuXbU3GEoxu2QLoitsdobKn13j/48w7BObyUv1vrhrh9wPsFU19O0HEU8vNkBiIuDp2ugTIJgksrMQ14f+RkWr7HT8J5UlwluXtUP7fpshSFgbaSDFUwLWaJ9jE770Jk56SD9GieZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5nciexShtPATulwjI+NVK3OnuPoB2K9ZiF+peWiDmg=;
 b=d9K4fIA2weRD3upoxnvlmRSiRW3yR4voNwidEfyhYrlOZCey5+qBH5QUKF5SOk9yruuBH/+x9iFs4mRT/G8oILARuxzkVTG4kUjycHFAdO4g6bu69U8kVuEQPYx/JIAzt4nmiJIuxPM/fz2l+/SOCJtoR6L92qXGUgbei9udNNg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:40:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:40:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 33/34] iotests/image-fleecing: add test-case for
 copy-before-write filter
Date: Tue, 24 Aug 2021 11:38:55 +0300
Message-Id: <20210824083856.17408-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:40:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6947f08-90b0-4b56-8965-08d966dac54b
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077C0E648B5AF1BAC95F18EC1C59@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkRA3gI13LCmncn7pmyBq3PqHX0UA4bkBzNq7XQpKlaAohoEja+ZTkP+sXx0Lj1dXMmbyKPM3VkSsMBPqVKwaPhZP3ZAstys+Xljsz48biEPCPw3F+NfiiLU42Ko5gjQbrX8oM24DK+0sgP6Uyc1WJn0Hg97TuhwMcwMBySTcB1zn1/6XIpep9Bn6DMIRuCyPxqhE23BLKUhMN4nTrvKRPlC+QvsSiz9SmMZrwwO3dtOu0cURv8HSjMnezTLbaumH48Es5uUL1+wb39K+s6mtkSL+X2aUkzbM01kZTujzhMeN8BB5eM9JxgJOo6EJ/9rgAGn/gOK5WLAn2av0785rO++6/sYyqQm3hBYeSa/N1bFA2b1PaIrC6v3BR+8DHmjwWU5+Av+4f+WSLEW5q3HfGokGhtLWj7An0f25eXHh0FzLYGx4VSAJkZUtiruwFM2JXACFaNPLVa9zz4wJ75N/dmaVOQe1TBgY9kWQdQlkJcxQJGQ2y7OYHtDR8ZoxQ3N2ueDofA2Pk0Z2xMZFA6PWF5G6rHzCTB+GXuC4cRScCWdkIA4wWSvEav0cXKfvdpv0EOERam8Wa0uSDNeMtyvUwYmPh21EYtMRkcNpswnoDj/PYsJjk0vbzaGouWwx+E4BjnnIuLrjicWA4Gf1vB9AtAU5AG/8S3xCPFql0j3iLj8m/dmF2hhBSycP/CEX9X7MCGBcRejdw1UP6B1sTtSLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(956004)(66476007)(66946007)(316002)(6506007)(36756003)(2906002)(66556008)(6512007)(186003)(2616005)(1076003)(6486002)(52116002)(6666004)(86362001)(38100700002)(38350700002)(8676002)(4326008)(478600001)(26005)(5660300002)(7416002)(83380400001)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ap6RKS08vgN+5ifn9Kp5AlegraPu9S52XbZJEto0gO7m4XzWdnJmF9zAuJUE?=
 =?us-ascii?Q?8UxBEymreKbEptzhOi74f5X5cAXJhnrfPFvIvYCGMHjQcTWNtHrUe9j7rNh5?=
 =?us-ascii?Q?3g9b6YewdQyTtZ4qT5ceX3aZ60W/QS7PV0rMI+PvbfA5WMuJ/JECdyFlH8Zx?=
 =?us-ascii?Q?eF0QNAj0dpHHki6CmhpLTk7Uhwp7FIeQb8ArlrpXrmk8MAxSKtoGtNavp240?=
 =?us-ascii?Q?eNL8S5UBG5qEXzMHeDh73CFQIEl7Ne5DkU0i+S31EZTtTpfd1ke2/NS3t7/y?=
 =?us-ascii?Q?bqkb4OPVCTN+ZYSKsvg7lqhEawqhz0YX3ss2yPECDp/MG5f5xn1rwTAbQ7dc?=
 =?us-ascii?Q?QeZZcaGOfmL3uumbIVo/11LehYlSfiEbAtQzPu5koLpsRUi4Cy9nGuyvYbRa?=
 =?us-ascii?Q?lJVL8mgJTLPwutwzFFVCju8PKtFq+Jd07MGzBdnax4usBNRLkOHWV8JGNr2d?=
 =?us-ascii?Q?gxMQWmJyF8FVKKTJ411cGr0I6i2npHnRWwQB/qSdJMUkBhqCLyCNDGkSKPzi?=
 =?us-ascii?Q?qfooq6Z9MexFqHNfNnWhXkrh+sWzvxAlrnXDSx2qdLNa2ScmD8QqAUZnqwhR?=
 =?us-ascii?Q?PnDl+gI8V5O+M69Gopkf6PRQO6XPdWdy0I14IU6sUelrBYm+mTcM9yu6Ce5C?=
 =?us-ascii?Q?41dyvDom9QkULjG8dbDzf2QfolCPr7r1E9F/UwMOmVH5z189fTDSaBO/qlGn?=
 =?us-ascii?Q?NUUf2kwfoT6EyXAFcCE1/FecQ4rgr/aEt8JCIZgbjzc1NTXo6Ie7ihGGrAgJ?=
 =?us-ascii?Q?5TeiMLo4jFA3SrWXhmpH6tSAmkmGESD4SXQmVzQT0CjFPlDR5Jh81B//w5BY?=
 =?us-ascii?Q?4zjdyG/am9UgR7mUDx1CMcR3G3fU+pj5Q1pE4RJoKyfnqp+0OBO3WKJen0EH?=
 =?us-ascii?Q?lM6ehkL1Ws4lyQjVhquj+A6DXt+jdn28VGDvn2pC1YbE94AxQ7hywJcZ2hsX?=
 =?us-ascii?Q?E6yv06TohNRTNKCD5MmlFr04QaeN1fmpgbHKNJJKl/o0EFLcfeE7DUa8Wxbc?=
 =?us-ascii?Q?/61vHmjcPSBzkPmx9uXIwPsKbDK5OOy2hbKbGc7RVf/LKg7I5VsthW6zmWyt?=
 =?us-ascii?Q?/nu2rpTQZiRuwtPYOfFgUke6HpMz18CV9uddB8iEORVCBcBzSr4vgtklsxQE?=
 =?us-ascii?Q?vtEqH/s/V0zCeGhrzX8d5U9+p9nUJ09CCii9Bi2lV2xIBq0jtQVdliM/tJka?=
 =?us-ascii?Q?JEBS9HQEh8U5JG6Q5ktA7mnAiVHjUUwhVB6bKefawcaiwBhquoJUxXjoBBQt?=
 =?us-ascii?Q?Qmjl75BUdhd8JYIuEqNxEV0gF/t0WDF6skkJkJ0sIQBw6FEEzyNTIixbStWM?=
 =?us-ascii?Q?+H3d7jgdjI+QanR1Z5sLhB4O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6947f08-90b0-4b56-8965-08d966dac54b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:40:05.0074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8Yw4DRAz2fnez/6lGkBbXJgUXKWBYgYB10ZPFNnuBcWG90V5HkrfwlqveKWdXAd0NoP1uungXHx5rpHvV6fAq/TbDwW6rAr/qdt/GCs+KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


