Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CD398AD1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:35:05 +0200 (CEST)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR1U-0001qz-FK
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfy-0002SO-6R; Wed, 02 Jun 2021 09:12:50 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:57568 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQft-0003lC-Ua; Wed, 02 Jun 2021 09:12:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7klIi5Tf2vcG8Aa3p0HO4rx02T2UXRzkPt6EvvsJz3QQDXCVw0pctphQ2xe1LdNMa+DwqURgCqGw4ziFIeUEFiifJBnGaO/wblNXS3hQfcZ/DU7NvEU4tuk2bhf+jwv4VxiGZ9G/QJ9IZHBlngKBRQ3SIW3GvZARBij6o1KL98EFjy9k4kqT7PZ1cFSsox4O4XChV9ZuENzjIjUYt6xlzphH14ckq/XRHxQTyd4he3ptex7+qpes0va81rWTFMXS5kTRfqWysznygLvViuQ13iavMp4pDVRdzeRl712C83IjiMeobuLyc7CEktbmY8hFBha913KVZjZ+3UEryVXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=Qr1r0izAh/cguY8T5ynBChqHhDICjKew5/43HnlWRMDiAGHEXsDbzT2ei9bSuBl7wn1KV5Lr5hTGXeqMmlZNMKpPgzceuZPAZ6fMAgG3+AjeiqER/l2pCIAzfrAvIG9yWMO0tPA8Vvtnz0Fz1vQ5fVxV++S+/6lUgyjg3MF6dMBCbCPzylH6WJNFKGPFrbfxGHhkqHhTNr0OJO8DaqQP9jC/ecDsdGMi/JwPB6X6rDt8ESeYCZgm9uYDi7CnkSiESrlReXp/GNJEW7OjRmbrg16RTWfwfSpjn5A5nBhRzgh0pWhyRFlHv4vw/fh4vattng/huVIWIRjLpybNs5SjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=OCHU/qSYYM0l81H1UKo0T3/pB8Uc0m2yLTRTXWNgpWj9PAQBNhmf1m6GOsIDdxxFbhQrsnXmtlsQfp0cWhf03atnE813nKSK/TvuTauohcAsM6PdG3LejuVYbozXyZJmlUhCfI8tGZUqCc+OaTN827cbZuSEMWBpga0xyRxzxUk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 32/35] iotests/image-fleecing: proper source device
Date: Wed,  2 Jun 2021 16:11:05 +0300
Message-Id: <20210602131108.74979-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84b8b1b7-852d-48f3-83e1-08d925c807fa
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536322BEA3F1FFA17F12207C13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MiIeXmH4gAIAJONlAYHPvQkZ862UAHJ1MZXuv4t1S+Ypms8il9hTHINGv4hsfKrKCQGbLYInDCLdgJ3LVpnDUYjEjRYANHUQMyOL0+maso+8Z0OMSGeoY4eEqewu8ufa633srvAz/YszbbVXQVlzUf9PDYe9jFRgZGOCH+/lgIHu4NRjcVdgJNE4cssMKuiYUSwgtHu6yKWj9add98tZBWvF9IQcXtHS12FzJpKlfBxsdDJIbCmz2MwBMu6HvCp1HEydzxY6I+8JrjLJAHBg4EEwv8IP65D/eCVbNIZF10jqwkITDCxomfLX4yOdXuJCA+wx90Cms3cP1OiNlLrkrjpJJKm+ru/xzXgX2tkFKrwLm1XoEpSmedEnqwkuSgRSmmE9upN4p72oNoRaya7JK4uOUoyrs1wRC35GXhh8BZ7q5teRCu4gAU6sPWssrdJekwY+SsMIAXAnXyeHyu8jvOsFp1+Ns0pCojZdaf7dfbXwfS6EY6Qdd75wywM/HPB24gk0xnNc0mgOe0p6wybqqPATbGArM+8wUchSUJGWDV8InBfUZ51PvtmrB4ZVZXzAyeXT96QVFIzyV0Y0bAcl6NXQstRRJegtnS2gayiXDr/PM1eK/5kDCD3WzgdPSV+Oh9IIA75GdW7tzHXX99LQJl/L/9G4O9+yxs6BIqzMZSYQDDZ5+quk5hxWK5bIrAu4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+lZAAcH1ylMiq/URrSm9ngwCkBVwiDlKB/ngXDUSruYIJGvaKHHa5WtnCp7f?=
 =?us-ascii?Q?c1IgMA7s3gmKbtW3JDVc1WkBM2oFKVr9Kg6/0VzuK1feastXMPe88y6XVn2M?=
 =?us-ascii?Q?MGSBpvAUHpzlX7JRr23KolWpTLhrNZ0Qp101GvJbaY4V5Tka5uwOtxaGsTNE?=
 =?us-ascii?Q?aAovt5SZelOc7ekJS3h8A142PDeA2006A++1zEmfRkLsCx+7w8CmQXDMpSe9?=
 =?us-ascii?Q?EkAoJ3Ky4bzDY7wHk6XlLHX5cqL8nsEZBYhCKWcMIRVOMcMlpRMlrhGhbXw4?=
 =?us-ascii?Q?QF8p8oxMKGKeSVT1VPYaHN+sYuPj6OtMJuHpLiEiizszsQwxWUvvTtKIqDmf?=
 =?us-ascii?Q?/VRws6eQCOP3Y+PrJuntPup5/DoREU+HZnIwUZdQWG5YQmI3fUicq4o+dK7N?=
 =?us-ascii?Q?iXaxMlM/ViZG8GXTmTn6S7LWWQLdEGn8y1y0ZEr+N2r9uoBNCSS5swk1dbop?=
 =?us-ascii?Q?h1x62h7bT2+fJ9YwP33WHrPH4IXc96cOwwjjk+i3ikwdZjUz3GD3G1l7EARY?=
 =?us-ascii?Q?25Sdn5ZFXI7ti0EN9MUPXm+xjP5oiBVh/qVEfwlqW56r4ksb3zuqUzXyLeQc?=
 =?us-ascii?Q?0B2JY4TyMUzHmuWDlTdRtouEfHroZnSOtnWT52u3xXXE0LQxHvNpJS1N8Evq?=
 =?us-ascii?Q?v/lRPggPqrbCEmqVb8qpgm63i5MdwrGO+q1DUbgECs/LJX1k/BFa6UR5HCRa?=
 =?us-ascii?Q?hVXN1GXRdgExnoAoG2hfZOP8iU29iEgP4PU7Zv99sJKh+bmEbu2u70HT61kH?=
 =?us-ascii?Q?hwRX+fsenMsYsBDudew2C2GnPtUU1YzLjpAXvakyV9MsjL5MXon3h9ZOwzMn?=
 =?us-ascii?Q?+32XStiOMmWGRbbcH9bj5Kxzj0qAkWwsjgKIew7FU6OicXwJILOxU7YS0QwI?=
 =?us-ascii?Q?qDvWKZI00JmlcTAABHA/a7iS4WDwWtDof9X0oJWCLeG6qGnWQ7bPo5i41qXh?=
 =?us-ascii?Q?rlziEMcKH0Jci2kXIB+LAGm3MUg06NshlXLFFeZuERgeVAqavUK2RLVg5Klq?=
 =?us-ascii?Q?0rrCVBX7vTERR2xO8MVlTCAp7fEjEsgK71zBp3KcsT+LD86cPhKOQX7y7JH1?=
 =?us-ascii?Q?XENllbye30CZrir2uIMO1fGZhvdnLXBcWzgDX07kra3Fwb60I5WAugl0Ax7H?=
 =?us-ascii?Q?NfOxftydyHhDdv0QUn3ygWxN2PZg9Qcd1FyJaS71J6npgMc5xdfqH/8tgjGZ?=
 =?us-ascii?Q?Jm8/ls8SNbY0ZcpF4ACwArvxOZFsIZx75VXhDme0S7ziQVccovipoJyR50xD?=
 =?us-ascii?Q?NPUxDnsQCG7+JHHXvaSi4ibSCPvcF3Ywfoi5gyu3Vjn45ClZ+5Qdyuhetvdm?=
 =?us-ascii?Q?mmXIbqu8oR4Tl1ZUwfsCAgMk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b8b1b7-852d-48f3-83e1-08d925c807fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:10.8276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apQeCVPxp20kDafcW0MvacOo/mdKB++y09Oxu8WPa5w81zodgR0xnxG5YbFx/1Zg1mBqVkDI8HvKdzj1ABKeUE+xa5sjX6XBgBYIkbY+v3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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


