Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F170E2F8F97
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:05:25 +0100 (CET)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0thE-0003PT-Tj
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQV-0005OS-K0; Sat, 16 Jan 2021 16:48:07 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:54721 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQS-0007Dt-5T; Sat, 16 Jan 2021 16:48:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFB+2u1DQiEuqfmkbrlfpeIauJZaaUAo0YwEOTTrUncZpdbv0DqKPA0N1KrAy43rQ2GFQsl3W/HtPrU8FyFJu6DaDuex7M/UrcHtqjrNdjIyZPMpU1Uc2nu4wk7M7VyX4tzobbahiGShd8L5qd3ktSne/sVfnQFmZNzjvWUABORRdb57U3IJGuSL4AHV2Jfg9j1ko02qcgtXZ7YH2klPYOyD6auLbF1ukSTetc3mfJ2uWa4sCaDmeHl0gjd3Fvw6QVcfSzN2auWVFhWntpChYijfPYiuDgfTyiIfHWCMEenfWQAnoxVwSk0eK3d8NfVaMk+VDJeJqBsRf9XTqoKKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x6GZjJ5jnFwmlxhATERb76Dj6w3CC8LCUAhlXPjWhk=;
 b=US2LQW0es36k6nFfdnOFoOyOHUj8psbJy0gkJna4gAedPN2VozsNWnLAttiv4B+a5n20O8SuE2CDk5R2CNeaiL5sdB7EHt3ZnLdmj2QUb2tkqDm5PN0BvJTk7lN6NtixnDS7eUUOyjwv2KyS0C58kQbL0wesWkZZTlP+923JTyIhPk7rLFydYgzIEdwqDNhcWRNl3QEDzoyJPUXQ8ywtmJGUg51V9H4tLaGMG524goUHUYBxB4eplf8tJyazLYL5wqclbugJMHK3xV/+TnGyMI/IhgucPYa3tgdELVAMYOxgchRQLX/3dqRZnY1W7FccfHfih4Nl3fZjc8FPY4G9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x6GZjJ5jnFwmlxhATERb76Dj6w3CC8LCUAhlXPjWhk=;
 b=vVBn4Cs657txcOzHduTrczTTyfQuVD6DXeeEgzDlzO/VE0IwnN2ez2se8eoRsHHph0cKAiYeJ8hOeHiCNJVb1EwjFytE3NTso8vzJpQuexK6NvFZdeyhJReVfUqvGgDXeEa/ve4tt3f+Xzk1ILiZ099rhEiQZ3q/VJ+zrDfJFPg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 13/23] iotests: 219: prepare for backup over block-copy
Date: Sun, 17 Jan 2021 00:46:55 +0300
Message-Id: <20210116214705.822267-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d270884-1212-4620-774f-08d8ba6860e8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354270D268C882515F9038FCC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCxKd3XNho34Q19D29pCxtN0Ok5SwxYwOWqFA2L2RsINgIqK8HHWSXNxIzAicFnKtDqY4BM2TstRmhppcvD6dk04ylg0zZ+ULFCftbzhU60d8gQgEw5NxUKTP+zDCkFVAbSe4E8xmxRAWqBy8tJbxhLIUlUurwCHTWZBYHaLQJPXmnfOcmC3kGKoXe+WS0I1iBgceVN1NTNr9EIdjUjhYdGFzgGuTxpnCKKsvEOy7cF2a3l0XECmYUqydF1btENkxcJ2j+TBXP6pSRRTFX+8YNTvVcSpUKNdcRru6ApOjI4jtRhTNBEzGq/iBqMqV/Xo6L31Zl9F5B/ANNVM1yqWVDnyP//aldXbXoQJ5M4dylTxptqtrEDiY9dinHbWzyu1hoq9HmVjkB9kTFajfr0B5TASa5FRiz2f+vSiT3B30jMqScUPSVnneh7+JUsv8NK/5yxtFa1V401RIPI3OrruTqu4n9ESDC78CkO0+m+8HRTScR3sMQB4CuJu4+JWoMoXZ5usJHxVkLXMzKfdYcqFxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x//L/sxFsnIr8SaOeXNJzxOi/T3pVcTgfDA7tdJiazYhw53Ytg28T7FujjFi?=
 =?us-ascii?Q?QxX2ZT4fbmfoOs0OvPzvD77IVQVDKzvQ3/sieuiCthLbzt5UzuQZAnmphi56?=
 =?us-ascii?Q?W27cPHgbWiAF42fGtOUsLNWt/8ey62sLJrubjN/Hw8BlZ7hsYQIPh1OaCEKk?=
 =?us-ascii?Q?WlyocZU8/tuRijC2AJBdtaZBIRTIM4cpUrd5CIu6X+M5dHA7P1yMg86ATsyj?=
 =?us-ascii?Q?DWVz2sVQuugMPSGM+tTttWwunU64wac1IK0ZxQk2jl52AtOGGDlQTmdQ8zOY?=
 =?us-ascii?Q?eFE6LyoaNZV643DKjAZwZvsNDhlFT/Kz8C7zwWGnE6S0zOThKmz9OLROeetM?=
 =?us-ascii?Q?MCqblSfPE5midvp6bvgImvjD8SCtxd6odJZQ0tXw2Sn++Y2cWK1PBZJJ+5v1?=
 =?us-ascii?Q?S/XEG4unBmNOV+T8vhMxmZi7xdOCMhhPiELLYHlVPnGoBLUqQadb1Y397r3d?=
 =?us-ascii?Q?pKBT3WvdHs4sEfXVUXPWkfKzZWbPFmGxvOHobJ+sAJiGhSPu+sQO5VzNUh5n?=
 =?us-ascii?Q?U+iUSdTImVmAGWHVGtEqCRtBl5jjmCIxvieicTvBOkj/iEDNnoHWa0BcO318?=
 =?us-ascii?Q?g58veb1+RuXTjiWcW3pV0O06Zol3ubHsACtLKbegeidVtjaPlzwKhhAFBkQu?=
 =?us-ascii?Q?Lg9jiqKENYOp8A3hxo2PXu9U7RW44l3xQGZH+engngiv1XVV9AdoVqDFihK/?=
 =?us-ascii?Q?VU+ixOdJJcEjVhtvPL9XUoppaviItb1GepFi1UAVxHGzNBXCLBilwEtv1cUh?=
 =?us-ascii?Q?IBzMdsd0RSVenJlFzJMy2+5QpF1H1HynBzAC871WHq2A+HyZGz2RYc13JZyL?=
 =?us-ascii?Q?6tH2Gwtk01RZ6OAzRCG8Rly++VmjG0VNZghUyB+LQXpJtMX9x2pPZeZHCzDk?=
 =?us-ascii?Q?9HElYapqR+Ao+fMAClaJCQv9mYmiUTArgncgJvR9r75jZjzDXFviv08iEUu5?=
 =?us-ascii?Q?jkm4CrSZxUt1F0T6M12rJkfaRWE8qPGwkrExGxZaq+ZISN/2d9gm/W0NtRue?=
 =?us-ascii?Q?BJR9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d270884-1212-4620-774f-08d8ba6860e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:53.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heA56z5f4Kx8GOqPqh3A4sz5t7BpNYcEItk34r6nHrYKIWYy6nW5+li7GbO+rwdhNesTDZFMgBGy2uYDiMH3QiqC2S/zdUwsFM/nP7UzMyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The further change of moving backup to be a one block-copy call will
make copying chunk-size and cluster-size two separate things. So, even
with 64k cluster sized qcow2 image, default chunk would be 1M.
Test 219 depends on specified chunk-size. Update it for explicit
chunk-size for backup as for mirror.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/219 | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/219 b/tests/qemu-iotests/219
index db272c5249..d7b177bf09 100755
--- a/tests/qemu-iotests/219
+++ b/tests/qemu-iotests/219
@@ -203,13 +203,13 @@ with iotests.FilePath('disk.img') as disk_path, \
     # but related to this also automatic state transitions like job
     # completion), but still get pause points often enough to avoid making this
     # test very slow, it's important to have the right ratio between speed and
-    # buf_size.
+    # copy-chunk-size.
     #
-    # For backup, buf_size is hard-coded to the source image cluster size (64k),
-    # so we'll pick the same for mirror. The slice time, i.e. the granularity
-    # of the rate limiting is 100ms. With a speed of 256k per second, we can
-    # get four pause points per second. This gives us 250ms per iteration,
-    # which should be enough to stay deterministic.
+    # Chose 64k copy-chunk-size both for mirror (by buf_size) and backup (by
+    # x-max-chunk). The slice time, i.e. the granularity of the rate limiting
+    # is 100ms. With a speed of 256k per second, we can get four pause points
+    # per second. This gives us 250ms per iteration, which should be enough to
+    # stay deterministic.
 
     test_job_lifecycle(vm, 'drive-mirror', has_ready=True, job_args={
         'device': 'drive0-node',
@@ -226,6 +226,7 @@ with iotests.FilePath('disk.img') as disk_path, \
                 'target': copy_path,
                 'sync': 'full',
                 'speed': 262144,
+                'x-perf': {'max-chunk': 65536},
                 'auto-finalize': auto_finalize,
                 'auto-dismiss': auto_dismiss,
             })
-- 
2.29.2


