Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F563A2A6C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:37:11 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIzm-0003oU-Fi
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpr-0003Wu-J0; Thu, 10 Jun 2021 07:26:55 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpp-0004QC-Lx; Thu, 10 Jun 2021 07:26:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUesjANlpc+r0kFPlXNV4bjo8VgeMSx+zcM11NlDgS+y6QiVxQjM711ZEKKW1aFmrWzyA8uCAxQaFcYqLg37JBtSiekXtsRf6jZnkWdf0bPRkkw6VMYcpqWfaIBi+iBQMYbaxaPYin+6ztqMXbKfJMb+aN1qwq+tppMa2UaJknW9H/K3DrghbrjzS4zEBDaZGR/l8ce3Kxc16chNe37RoVlp2UgQRFbpx0FjX+fKwlLZ5oWP8JVfv+PQtv5sp8ZIrribWNXT1puil6MJ6YS/XByCj3HkxbgNcyqkWyXcJKNa79/PUSW6+zZRQpfS78dTm+e3aXMxV6LsCChzaxGwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=HzSKPleeECPdMj8scd63KFJJDf+UqeoQQMTz3641H3wQj0BuNJNPDJn0LePg1D043tT2c03PXWgyO6ileHdRPOrbCX1ZbDK+I5FS0t2+dz/pOmn0p2LZmvpH7ZYwCfTz0h9VODPgTW/wijUPtgArJT4G/hx4K3Q+x/Mgqlw03df8N25KTvRz2Fe3trdn5iUYicCuPs91rUGoIvpwxhF471eItq7zmLKFbzErch94burLY3eXFhI/bw4+Bf6AP9ZFHIKDiSqjm8tgVkKcApjn8hI1RDmIMHtq+TDEnDmnDIlBam+jk8bLmnFNbCCIwP2aWvLuN/jfpbjyUv3f8Jl/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=Obr1stsFNnmLEkone/I1wBgo9/HYPYweQFmYyOir1ZqEdRUMQtBKauylCXXsfvWVSEi6ggbeBv8N4Z1RojVzTMN72eOTL0KJ44jA3LGTopxd3v7oEPf59TJFC8j4LBZVH/qN4yxfPv71ggioXhZC9EnKaFRw4x9lg+2pqp3/cUI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 12/35] block/copy-before-write: relax permission
 requirements when no parents
Date: Thu, 10 Jun 2021 14:25:55 +0300
Message-Id: <20210610112618.127378-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa12c79-63d1-4b69-9e2e-08d92c02a1da
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338190323168C061EE5DED1CC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtEp/49Mlc8tkUqKZRVDXTFtiw//Cvu9/7F0N5tEDJ/vfp7RV9ieiSK3dqrBtg1GIrHv3jzdUzwpuFSu2De0BTVwaSiOUrgEXaDPmBjoSCYm59+mc9DdT0HaPqtmaWdv98hJt4wZ+NfqJpNbQBiXZ52wZgTZzP0NJUjKKEV7YM8eaElrQBBm4rED96eelAz2XutELspGGPW/lu5fKDicXsglVukcb95f3t/iHhZ8Eo7KzFHtFW4g/uAPdKZxf+YUOmZXfM3IJcskodZlElwCjDZRhbevj+TuS9oimIlaGnzHAGL7NQWSAmJaSL7dRkyIedug+7EHs995iL5OpQPkKp/n7ahQgyM9Vl7HuF61B+qkFhhhZVdIwgwinzgZLh84gTqqgiI1CyakQn3IW7M0p8s9Q5rZGGFcEwqOjTnZQQO47DyFHeHEFOHHx3CSF51eP1BqmRsgbD9s7U7GjUMS8ij7yi4aVMALQfC8AknnJMs8N8sM4zti8YlB4KruRPdFUkGamawoZoLmuF2WvcI2V7Y0Zij9cP21DfVobqTqTaC46nx4unMt5RhvIXHDYBCw4RrdTnL0Hm0pA4omnrWfhRyHKrmT0/DW6RKY4K+zp5eFRUtUXL1t/KR2UWUgkH1ozn8et7dI6lu1B7TE8eS5+nW/EW6PmBUZ4zDQwvBRsH4nqCAn/a1tbKuwa3HWtsP2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q3yuBp7f+k3hz3JCmCqieFHSWarE1VunYTHcFUls1VsEJWTx0U/4tIuEVafz?=
 =?us-ascii?Q?wraZzAwR5MKFR2UxoLb+X2ACnXoyBVtkXRBDbugWx0Ra6u/Tzl5AhHfcxbde?=
 =?us-ascii?Q?ANQaU3z195UWW69WgVWYc0ayMN9fjkKK1KTsRJJSQi29ixi5Dxdr2mvuTwum?=
 =?us-ascii?Q?NL4L7NyFiHlaD4fuY4zwXXu0eBtKmTPcaWayuCBR8al2gBFc7gVngWWBAce9?=
 =?us-ascii?Q?hxjn1X2y5n7RfJS7lM6nObko+EjV1nqps6ckaeygaZmnCTqnqSJqUM7md/BM?=
 =?us-ascii?Q?lP0eTbaA8NStksyJUovqS5xbDr2CFIMTRvZXxr0Tatz3+m6SSGvytDMpOq9m?=
 =?us-ascii?Q?yWTk91S1206IsGB/xEXTeogiQSzI/9l2TUm1KeGqERSQG1sApSjekIMp4vts?=
 =?us-ascii?Q?r4fgps067UG46OW2MRRftF20URW8RthDK323JINsiv/KViHMxVo7FqyByvj2?=
 =?us-ascii?Q?HMqitCy0+Xf51hEDVLj2MVXNEJPg3df9NL7PR/jEj3cC+XSAEEyimpjHbddz?=
 =?us-ascii?Q?rvEyHxFT0ILIddKIBNvjMS4Pd9mPItXQ5dCpgMTcjfB/ef05KQc4IxdTqGyb?=
 =?us-ascii?Q?gbczU6QwNMFdonCaUZV0hUbq+58KivvB1R3rraYG0O6oMYr+PVMY2Bl7U4Am?=
 =?us-ascii?Q?jfhT0LhfA6jGoObJ6VxBNivu/DpIMtnUsdOt2Uuh0SwdWo42r2VEmDy6jGNB?=
 =?us-ascii?Q?N7eMP1NMgOL3jqI7y8yWe27+4T+in/jCDHWyJTR1pSTHynUjdHpaX/m5Vdd9?=
 =?us-ascii?Q?/plfEUaZSb3lKckvEQWtlVxGxewDGUDFwbm7GCAFELncitjtK60yfgn/P8aB?=
 =?us-ascii?Q?iKiA61PxjhOejedDRG2NEysTnhD0VL30LDpLGTlxK8+TZ+/Q7NKeZata3RGl?=
 =?us-ascii?Q?8+jRjGN+Fww8VOlpzAfrNvgRrmv+tIIPsc6cxNrXleuYUYDIFYWZmm/txvqM?=
 =?us-ascii?Q?lEOncrwWbLWFdUmO8DaMSQME0sPRkBtezLBANvgNwObdGQNXeI3k+g9r8KJR?=
 =?us-ascii?Q?M5W+u07mL5hvzeDbjFZ3fLKxpiohajf0ZT344L7YVjqWbgiUXRTHOhJcYhk0?=
 =?us-ascii?Q?9wD8rPWVPXZzG5pIuZZlmsXwAD4dKpDkiP0ZGkpCWNMkwmmsW9IbTBryDUHi?=
 =?us-ascii?Q?69bEwTPlGkV5wBp34lbCMUkAs62V7Js5EnJCyIuvl3hmQSig4UAZGfGbEkJL?=
 =?us-ascii?Q?EuY85RUwzcgO+Dji9kXBahlU7z5HUPXQKyHNaLbYMwsPegi1o9eBYeEgXKUn?=
 =?us-ascii?Q?mCHp7MZ1eUb7uqMc7y2y2MFf/SaE2fbFXfoymHXvIwxOYGqtPS8Y/EUughsU?=
 =?us-ascii?Q?04UMSSjCOnH/s/wDlXgg/wRt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa12c79-63d1-4b69-9e2e-08d92c02a1da
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:46.8045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd/GNrGlWnVkptiD7dvLQficsh2LShvj5N8bnWb5zMjyig0Xr1IHL0mbLvAz33iq2/7m0pHxGbsM5LEz3ytYRIWjcoC+gMQJsUK7Wyf3bwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a7996d54db..2a51cc64e4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index f2b7219632..5bb75952ef 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


