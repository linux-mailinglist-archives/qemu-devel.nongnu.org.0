Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7881F3978D9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:12:40 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7wV-00060K-HF
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cg-0004p3-Bc; Tue, 01 Jun 2021 12:52:10 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53678 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7ce-0002xm-6l; Tue, 01 Jun 2021 12:52:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loU/Ka8tH0jchDI25mgALMjVRuCaEQm6ZFKtWGv/ql2loS5cbeUAlREhC2swB5PyCO9DOA7qSqjWEzUf1qOHTCWItwQmEBkeblLQIsBqnmUDROf8x/sfPERL7P7lUqSotanho6NaBPSbkUMjsQCASvhdzIg7IksssIHoTrd8QoZ2zYAJW3zOjoboZz1aNPGsw6gfcUe0K4j77p0EZyCtuuCaC5EDhZsRYFEZ94hIV7bPCdsSgkrMrDNsEzbgq4QmgTtBPQ/qgHkEBeA7A5QqxSZyCki9pfml7rKbmiurAmTcFDbVEZJ4QInCbr7Q//O+BhtRLM4+q5zAsjt82Gzq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=c2skEFNgXpNBD2i2xGPwJuQcsiV7OwI+HlhzWbR+d0IMhseMWG0RchjX/XZIzX6FNCGVF5YeQPnQpayzPCn6T08EnkqeRXTtI+xLaybipGW1KF4XlqF1FTllDrXPfv29lh3R46jjlLGWNquxyKM6tBOcWB0f2IvNtA28KGhM0XXRvsUc9/gza4s7mbreDAVqA6jGTS5qfp+fjBzxqEFVA3dnep9wfiCvT+BxaQSQyN8GWHKv7JSgomR5ZJ/Not2+FYNeucBUzrgpZgIk5gpUTi90d3TTRNk356eXOSh7febm6QcWl2CcMRsFEnbjmv+jzQuVAZ7x4qUkxD7nsWbo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=IhoRmQQRpUGWsSb9vcsvvaeh+TIlS/wTJKgHDzX4IzkqnO1Lsghsjlw3tMOqaiCwFNGPxBiTR3rJ5E2JnF0f5gBguuiLa6Zg65XcI8Y13U9kKe3nbf4vM0vA7BZOhCgLGHbvmdU+LOQZfMHL8FQ2Y6JpDbgmW1dq9GRroTJwxGo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 32/35] iotests/image-fleecing: proper source device
Date: Tue,  1 Jun 2021 19:50:23 +0300
Message-Id: <20210601165026.326877-33-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc607159-bd31-4e80-744e-08d9251d7ebd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386448C4C6E2078A34E681EFC13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aaa64PPwqqKkQuah3lPHbuUNlstWBXXUe21419siKp1K9NLJGOGw7x5rkdrzb+vSKY9GJigTnTrM2o9AfWd+Ac2LXq0bRwIXEtI1XspzlhR72gtWq1iH05jssham5eLLfk7Pib0ZlIy2lmoZlI09KfyplSOdKPrWGnHZ+RhJa3PpwlvJr8qZutXVvjZ31NgFatwMTggzxY7MBab/e63rHvjIAFCoqz5FOp0HAXijsL3o+ngsIoovqluWqmkdKesSOIQGt+R5WTf2z1LRse6eAiOH1m+rsub4dcbSIDQA7gZB+nZ/d6C1Ih3qGqg5+dkXNiinXeXTHSl7uNyB6FK0gXHBRHS46hpbkjWEruZmHT91eY3x6Uab2aXEctiP7gPQcRDqWVPLd639Sffc9pFl3ntq82SZxbqxGAR7kxg0YbhZL+C360/fJbGk6K+HVkjUXYRFUJuNRXX088s7IJW3vCSZEkpuLnu0rNbcKsYUOyzpTQos5Tu/aLJRcjky91K0CGEXy9lE6FOV7mjhjhrCVdlHy4vJOk2pXj2w6pq2ECmxTnktby4gKta1QqaujGNpYLmbhpgAHSbZqQiGVjTyL9JyVOWgBJDwaRKNVVK3ROQFTp5l5ndMIzdwCGn6tR1ZbmDpf7spllNqD55TrVT+9wojiucDpES2JjvnkVPcNsrWAS7S7ankHYRk9REMbr2D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?04Gmpdu5vzTPUAXbqtVeQYOxBnguQT8Tj1/PTwTf9Qi0fQ7UxCbrEuoqJtni?=
 =?us-ascii?Q?1xozIYy0JEiIVVE2PTDYJvpMjHGj3Yep9MJU3m5wLe6hM7UahhrySm4mhdRf?=
 =?us-ascii?Q?/JOPpIhER8Mmpq8uT/STtCX/Gx8fGIizZl1oEP8tKvQDxMAtyLITANSxyrdA?=
 =?us-ascii?Q?r5ikogMIZblm1jUz3pd0o2WNaaXd12GRUJ+RHYJH32pUv3M+wWLmPqRcljAD?=
 =?us-ascii?Q?EwRe6On00zbrZaI+lcvGeIntUOY/K7X+s6rDV3dH6UbYM00p6UhlxiS12pMz?=
 =?us-ascii?Q?r6QtTsjC+/qH0YiVyJ5mM5Q8SZALDpRIKBVqkNbNz+z0saWPwcZgV0Ppscgo?=
 =?us-ascii?Q?w7lFjf+RGdNTyfB8EIWQ0/7/EzrK6DHYyl3Qdfcu4CVxYiFdUANG4QxSB6J0?=
 =?us-ascii?Q?B/zACYOUWQOuIo0yGDPHXz1ht5KfimxJIDsd3E3svvPrWmhLEDhrFHXeYTDW?=
 =?us-ascii?Q?GIzzOeR3H17qKgPLUAopCti1iDcoP2NqmffdH2fU5QGC1SjWxH0kok1RRvDE?=
 =?us-ascii?Q?oH1WqgY1lRlMR7eu9q2kPepx9hWOEKXFnppztaqY5wdoBV850sqKb/nGlEuP?=
 =?us-ascii?Q?71VbyAbleRpzx7bbTGQi0hgk9WFTbCjlgO0zTtcn+62M72yfBQvLIGW0OE5j?=
 =?us-ascii?Q?RE9cFG39AF5gzlWHtzMavPfF1L0qx3LI1ZISRwQiq+7swJQKVRAQckidxDMK?=
 =?us-ascii?Q?pV0BUKcXUwFiTbHODHaKKOcNVKuOJ1iysdJK9wcTKAI9I4gpl6DH2vv5HKPO?=
 =?us-ascii?Q?faDjy9dOqAaLR7k1ybYB3sZFzgFhaGRdwKU3zXYowdY41O/X/LnQnslUsNeo?=
 =?us-ascii?Q?UpsZctFDmBjde0sp2s4pX0tZWUqK00dnqHCMlfYar/+tP52fBxod13jWGj1E?=
 =?us-ascii?Q?cKQx8ucyFMe723i/ateJVbbQ+eA/Aw+RWe0oSLFznKq1nA4zcuarHCPMkoV8?=
 =?us-ascii?Q?7YiA5Zr5wvgVvErXIU8qBB9YMTdBW7dGzAooY4Mg5rHFVtfHnIhyzmxeXQqd?=
 =?us-ascii?Q?WnepDjEyYvW5+x0U0n8h0kQTGS51TezZELCHsX7UT5kaS8fKXzt93pBL2hrO?=
 =?us-ascii?Q?jPy7htby1pJbf3glOiIoaSe4hlqmeOQPzK6RQoFoVtx1Cy/q0McYntvbwwkN?=
 =?us-ascii?Q?rtQ0hJI18imF+VDjaBlB/vCDcIYmDDAVHVf0OEmjdBtlKWbHzkn9zEAKkS0L?=
 =?us-ascii?Q?L218xRvWUv0zFHYjG3gNprpBJb+TDYRiD6sfuKEep16L6utHpfd3mzkIbSUn?=
 =?us-ascii?Q?fmIhJHcScBTzXvK4VtPHFD/dszoEtJI+NtA7a1rJ0UoM0QnlCpSQR9NpGmcz?=
 =?us-ascii?Q?JFcs9GaX1j5RXy9EQvdN1AmM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc607159-bd31-4e80-744e-08d9251d7ebd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:26.1335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOoYElSx98jSDimZWk2h3bNMC77mWCAUWiy8AJ9GUn89Tn5F9sBJ+9v5v9hxwUS0rg01aLAIMWOOzhjYaPcq6b6LsOp+uAoU1h0ieymSoNY=
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

Define scsi device to operate with it by qom-set in further patch.

Give a new node-name to source block node, to not look like device
name.

Job now don't want to work without giving explicit id, so, let's call
it "fleecing".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 12 ++++++++----
 tests/qemu-iotests/tests/image-fleecing.out |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 799369e290..961941bb27 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -70,7 +70,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Launching VM ---')
     log('')
 
-    vm.add_drive(base_img_path)
+    src_node = 'source'
+    vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
+                    f'file.filename={base_img_path},node-name={src_node}')
+    vm.add_device('virtio-scsi')
+    vm.add_device(f'scsi-hd,id=sda,drive={src_node}')
     vm.launch()
     log('Done')
 
@@ -78,7 +82,6 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = 'drive0'
     tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
@@ -94,6 +97,7 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     # Establish COW from source to fleecing node
     log(vm.qmp('blockdev-backup',
+               job_id='fleecing',
                device=src_node,
                target=tgt_node,
                sync='none'))
@@ -125,7 +129,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io(src_node, cmd))
+        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -140,7 +144,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device=src_node))
+    log(vm.qmp('block-job-cancel', device='fleecing'))
     e = vm.event_wait('BLOCK_JOB_CANCELLED')
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 16643dde30..314a1b54e9 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -50,7 +50,7 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "drive0", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 {"return": {}}
 
-- 
2.29.2


