Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B23398A96
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:31:42 +0200 (CEST)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQyD-0001f2-3j
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfW-0001Sz-N8; Wed, 02 Jun 2021 09:12:22 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfU-0003M9-EX; Wed, 02 Jun 2021 09:12:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4VwzBOC78cvAnk3ZrvUmr07iflr83MGb7yGNAteD6IfV9UVmDpgy5EBXDpnYlku3APW8L/3PpoSy+qRaFiFEQvG9tK9gSsHkCZbz72ybK0ZaeSXEHMIgRMRwZ1c7ZBPRSFrksWTkXP1pBuHVRqhjlpRM+qEHbHCGt99fa1QvpwceMxpIlXUr/Vz5Gja+i0m0W17FH8YNMCU7Sh/viF0S2dgzuyCv8stEJ+ShMwfxRsLzzQjZa4XGGp/B9wU3DG9t0dq66lcL21wquQSRcHX4uh6pMqZNcz11S3TbDBgENDW6EsqceZY5CTfryq4kATjDSYb/DWFUcxXgsJ975Jm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=Pr9RzOqNvO2Oj2YSoxJtWvz1VvPUzS0marwJHr2U9izzDvEBI4IRoT9M2z7zavq1o5L7dXRByVHGpceSz2vH227K3Ti5RUqbua3CnAD17FAR33vbn1FwZZo9RxqWynw+qO/L30HBQRNw5WUSPliTNhyobnSMkqLRxbwWspMTt3cp/5ltYUI3QTaDyPl9dLFS/aS2EdtJaqBvC410FWbapQPNd4EMK37xf/VWOjEnxxlv6EbdruplKMjPdpijXge6uIRJUMZq1sl7VMARF3EWGwc9Lh8MlBqs3H+uS7d8tURYP/JhQyhFg309Oc8XQ4D6NpZpmkgHVngpvbJ7Jtu6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=MFN+vQ9YhPQpsrRz25ymA2SHcXDiCYkjB+4fsdSr58my0sjQf62DwJXw0NUezazLb1VkrePbig+jH4b7cccMBtsYNolX4/l9MnhCXjlqBeUD6aHIO/MqQAikHO6OpQB4ekh5xY4WyVDPYVouGDrcF7GnWB5uH7xYO+aptvxbxW4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 24/35] qapi: publish copy-before-write filter
Date: Wed,  2 Jun 2021 16:10:57 +0300
Message-Id: <20210602131108.74979-25-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0de80d0e-7adc-4c32-6ff2-08d925c80144
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66931BFD854F14EA69E64B32C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djaVYk949fEtFdr7KD7/i8PEbQTdzvI3ahcRqulLjuQTY2I7M1lvM9dgc/8rMpSNALE7Yd/APyx2kMNel9N6pkuP475kfynGB3M8jYCgBIzjgbUVqTDPcYeYrTRyagAXuyv5ftORyjthBFCh+HTRR8vURFMj2y9bEtPbETQhdK1aHMgcZPtvQO3HVsH4A87D7jQDAdHgBTaygHdAB3+Pszy3yGwTbtPrEKPy6EUoDArjNvCMiZOUZFAO/OSvsvC44xBY2YrOO/DfV2AoYY+ywKiVYTtANWbPar5CPtVEA67CWJdp6lAL6aMJETgmKki1Wwhe+hApw6Gnr1fM18u4SFfPJ9J7VZz48bb9GJmMRthrKYYWOBtMJBGD5SLKGqaSS6+NcGTIn+6fB03wDmG84/x6Dg92OA3Na6jLiFD4pDSg3/c2q2hXf7kQjX5/N7BwvuMRxY17FmBYRg8otIqwVCFgwLGdgTj2+2fNniieSGhdSdL0bI7I4p/HySKOM1nw0jYUwHezIsVYRoJFcoEDJQgycvXvhxo0Yo6qQjE1h+RcckTZ7r2nEcbAwFskIzfb6UnhnmDStwNXBXjCnDgzybE6fbrtOFaD0XUlENj77OYmIKDZ1g6k2jMwBUqmmmtkhRggwgYpFfxXn1LXjrSYsTRPVTMA9kOS32+htcZrZiXSZO3B2n9vqoha9WARbQsC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OqwnZ4e6XySRC71GNjH/aHVtTBP0maVjkVTchKYl408nbtICvdbcCppZBmrA?=
 =?us-ascii?Q?Gm64lYj+z4NS+XxDMXA/yLyEJR6q0GS3NPuXCeXBj++xqsirccUhmy35hDhL?=
 =?us-ascii?Q?+CAOuDIZOOdjVt61+gmpT93jE+iW+kfht8jzBZaiEmhvOH0muT7XzD7abRs3?=
 =?us-ascii?Q?HAdz++QcMLKtzcPK2xX6yO8jNnKGK8MPgjbKf39iZXCiCXVYVtTf84biFMlh?=
 =?us-ascii?Q?0Ed0FIa6pXKVYpBr8CrAD8gECl7+Dudlm7fYrbM8wZE321vtwrRUeIY/B74P?=
 =?us-ascii?Q?HuJHrvDelAc2Afu/jVU0/Ji3fcrMgXvB57qT6CVWObvEEUeRZmyCnzz5w97L?=
 =?us-ascii?Q?CLYhmMKTFU7R1I00kuYOIqYyOVOTj3lj4BlX2T7dalSgvQZRPSpuzqofpm97?=
 =?us-ascii?Q?9hMsw61SJGrYVzUGtPM0c646iwDx5R9WB2n+pJNILVKHuLFFvDl2z2e+EH5Z?=
 =?us-ascii?Q?JWfOoF6tgJdLo2nXfKN9Yy4znWeMxeRr72JGURZWoY808RlqHYJbLJpSGx1F?=
 =?us-ascii?Q?JUxhgo7NHEZFb/H+8D1YUFDyolJwjhIx51B5gRXzqU0kNttCTZYCLGzg4n4S?=
 =?us-ascii?Q?KQT/FRGvR6RK0C8vVjlqhtNftKwPc+6voQftlYZYdqXiQtqGPKpJT/RwU/Mc?=
 =?us-ascii?Q?vvLDtj5mFASJJt8X/lTsh9fv3hle/frXhWiqVeqR6R2h0do8mw1qMK7CM649?=
 =?us-ascii?Q?tcOoq7BTt8bxSU0loCHjH6R9Scw0O12zh1uhYUiY6p6TJST+Jfp1LWm1JJtJ?=
 =?us-ascii?Q?uWlZXxv1pHeIpDQx9tU9bPFqHRo57dblMmSMHdgBQJAhLTKHXkcj9F7FFatu?=
 =?us-ascii?Q?mSkGihLbsFAnlckQETTTBVWdDVQjzoV3rVEXGIwoYGCjd42zA3++QioziOQx?=
 =?us-ascii?Q?JIfnmrpf1yaLkrEPXUNZgLksjzp+qe3/PU+FBvALuj1XTrenM5osyfbv61yx?=
 =?us-ascii?Q?kKEx1aIG7AmIGlc0bdgllGgdKWW6rrW3DE9v/q2yfqXQdjS8qAXf0hOqg5K6?=
 =?us-ascii?Q?XLsLOI17eXWgp/2/RzafSAnx/INmzo0UGivFq5mF8CNf01qr5hZLVVVVrN49?=
 =?us-ascii?Q?rVCzju/y72Q8jsBHuWrdu5HHM3vL3WEzr1fpvEUJVb9t29btrNh4A1PMJOt4?=
 =?us-ascii?Q?6O4hYPHF6XdUHOItFme29xAW5prTDjU8qEWHtZjewbDE3qyL/UHcTBNi46b3?=
 =?us-ascii?Q?leZVjG7PqZJVHf1fC1AHpLv8YdcH6a7zpXEQB6eq2+gNjGIv0uIaZ+SIP+aP?=
 =?us-ascii?Q?Y0KtO7Oz0Zm8Qh16r0D6OZW1e8cictia+ar6zHhdTncfDAOoXVENbiJknu6F?=
 =?us-ascii?Q?YOvCKZjGqpTgaztsUzUjgMP9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de80d0e-7adc-4c32-6ff2-08d925c80144
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:59.6048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6rAsEHlv6ZBGkVnB0hwfJgaa1btYrWMb2MBChP3nP79VtxQcrFXqGJ0wAFenAPIm9i5lAmres/3b3uhSRv5EXcPhuzm2alI43/3VstRqkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..6c1ce86235 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2808,15 +2808,17 @@
 # @blklogwrites: Since 3.0
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
+# @copy-before-write: Since 6.1
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
-            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
-            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
-            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
+            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
+            'file', 'ftp', 'ftps', 'gluster', 'host_cdrom', 'host_device',
+            'http', 'https', 'iscsi', 'luks', 'nbd', 'nfs', 'null-aio',
+            'null-co', 'nvme', 'parallels', 'preallocate', 'qcow', 'qcow2',
+            'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
@@ -3937,6 +3939,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @BlockdevOptionsCbw:
+#
+# Driver specific block device options for the copy-before-write driver,
+# which does so called copy-before-write operations: when data is
+# written to the filter, the filter firstly reads corresponding blocks
+# from its file child and copies them to @target child. After successful
+# copying the write request is propagated to file child. If copying
+# failed, the original write request is failed too and no data is written
+# to file child.
+#
+# @target: The target for copy-before-write operations.
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevOptionsCbw',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'target': 'BlockdevRef' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -3989,6 +4010,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
+      'copy-before-write':'BlockdevOptionsCbw',
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
-- 
2.29.2


