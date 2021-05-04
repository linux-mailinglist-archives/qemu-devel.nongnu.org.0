Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABD372809
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:22:27 +0200 (CEST)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrG6-0004bh-EZ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwH-0000yc-76; Tue, 04 May 2021 05:01:59 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:44193 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwC-0001yk-EU; Tue, 04 May 2021 05:01:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ2OdkZelVN99xQcoVYkHHy6nkdmSA4rbLSrUCIxDmlXHCl6/ZJuIM5VODHipiLJ9ufHV0CrSwgvSA8kk2yhxT9SAxdTXda6PGKtnuDpWtyrOyJJocOchUKBf1L8cZ/mdqyVD/7Ad3A65CS9KqmHIGRvue6nNfuv0ywNMgz4wKT4NcB4KKMpiTVqfw6+9tQe0M+IK7fEPPcNXdrjvQNjR8NNPhoFtFw5MIw/IBbotrOiZgJogksv7aBGYlOJX+jHEED1FNrQfwvJrdevX4bNAhRHwiPmIyAGZhM9IYNbWJ4n+8ORW0nA+35wgVlxXG3OoJoKxMYpnTdVynYKBaBILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RyRQFw5v74uPq4ZCyAOAp31ONUEtdss7wRp6d0Tm6g=;
 b=JZp+rmDvweDxodoYi0PYjrL3cTtJTL0d17jgGTqu3z6VqIeRHdKLoE086X6mmkerjNgUPai7dfhxxYGQn8ojcwVl632TkUFL54G/4YxAf6acPLjPuPP0N6BxWxMAU07Cr1DcaA5YQtWy16fSYoBDADVwB/YiGVPcfKJ569VeunM3xo8M6wbV9kd6eSh2rJDxD3rJrknImrnA8kJV/ahFSWM/2pxBAupZbFEyLhMgNTLlNuaG6R5ovj+zSuaLVqEHFT2GcOiZ5Cj1cd47ZH9kwmikaMALNciOri9VC/af+c8/SsKLK0Kx/bPLWNtp57hze7iSFMcaFrr/eWTfj5bzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RyRQFw5v74uPq4ZCyAOAp31ONUEtdss7wRp6d0Tm6g=;
 b=BHCf4vbRJxHN3l61Kp9fiKAcEgqcGUocp9LbGkoU8teSF6Pwmxml9Rw68KkoINnsCnUvJxdfPs6klj5fFOKJycffXtYyPPUc0ryQMrtDcQCo0e7SfTRzjM5JkT5jwchHyOBbzQQ1osex2rmnFmy4e2z2Ubb+Ca/YHEzQG301pV4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:01:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>
Subject: [PULL 6/9] simplebench/bench-backup: support qcow2 source files
Date: Tue,  4 May 2021 12:01:10 +0300
Message-Id: <20210504090113.21311-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44f56405-2cdc-485d-83ef-08d90edb3787
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4280B402BBB615CB485EAB1EC15A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/cTAc1lcDccvazv/VhjJAhylNLUSHTxy7QUtxeNPc6Dn+NjL+MrsgEPCwie1xyjmbcLVFPfWCUUA48+Q465KB4uCiU9lknAjqHw3vs523OQ5L0JTChQiV6+1ehH0A80apLlDF2BgQQ/vGqA5qz3oQ8Y4VVeYyUN585ll0ZeIStmvhGsTIYFuG5gi0xVdZ/yQaBMOpciDlz53cds7TgLs0Bh+V8SVaitiUsJKHiWospY1HQ+UxWC20WqlwUrK80NeTnS2r6+dhWzK6nJ3xDQm1BDVO7RVEAA3zCUBg4kUJJ9h0g74Muhd4FwxCfilYQojtPDlzjG2Nxn7MVHjkGLqxvmaPzXAoH0l3rtHAOrqglvAqJQPoynGnzVWUTVL98t5INfrC4OI1scpoh1GakqmDH4PEIGKMwuAulpjeSdAd+eFKTrtcyDtAnWKUxuEpkMBZ+sYdJQQBL0u95nsqpU5cEx3/3wplnEC9sPQjmLW2aF/gU3sz1/wjrWU4ZmKO6Zggn7sPe540pUcpmdX+ynAuNMsilWtit6O1kfS8zkSZXHRvH8QiTZuJUIuaZu34IYsVbq9xyt5Iv5L6mpW1/q6LlR3AadY9Bqm++LV0Kra7jMAVUFf00H3jRkHtxm7n14/TMyxM6pLBqs9fJTDtQ9RBOu/b1sPpbIRjv5apZil+sCQENCU8gjij0ae5OgDSgS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(1076003)(66556008)(52116002)(6486002)(6666004)(38350700002)(38100700002)(4326008)(66946007)(66476007)(316002)(26005)(5660300002)(36756003)(6916009)(478600001)(8936002)(2906002)(86362001)(16526019)(8676002)(2616005)(6506007)(6512007)(956004)(186003)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OznVVZQ4GD9WXSrE0fjSN2za3iwP2j203qJ6LhvqA+/Y3wJ+y3hn1t7uFcL/?=
 =?us-ascii?Q?kiH9owM27d/IZ3KoKGk9eec6sleu3sKMIygsORuKNF9r7ACHX6lmoGqhCj0W?=
 =?us-ascii?Q?cLYYxRO5IgkHhtfjJV+jM9zK+Y98StG2ON295WK5fFDKu2rm/pJzYCn4L8Ba?=
 =?us-ascii?Q?2CdP/3e0WYHIdStq3yicBva01btxc0SJH9n2CGgF5A5DCstskJ2w2lkDfK/1?=
 =?us-ascii?Q?6t45dS5FnkqicZcjEOIKjztfgcGJjssrvQkiSm49iGl210U+fbqo6h98tBY/?=
 =?us-ascii?Q?FJLcPJMPzxM291ZU1/OmPfFScDjjQDu3/zriiXjkyHJOkU7fE4OOT/MaraYk?=
 =?us-ascii?Q?JWgsvW1/9wlmrNq+YdC8ZfAFCfjCJT8NP/OfMkTMHr+feU9n7HwIMHAOQcah?=
 =?us-ascii?Q?ovdF4oeIbXFONSDn17maax4tjL3Bq/AhA7EdrHPQpje6C7LDszJqZwHZevux?=
 =?us-ascii?Q?X1qPdIJaWEuyGUJFyHfUUM1JCIZPcjii7kU8E6D6MwUtZbgbQNKZZB2zsgsg?=
 =?us-ascii?Q?v/PsEwBwZ0i7oHlUUZmGin0G0CTCHFs/f4abcXSoMlQdGfhResjIvmH0Qpcq?=
 =?us-ascii?Q?8K0Nf0u2THs8dayoGfunXX+I9ckl6qRb/8UnpaNHtxFXaDOkbgPl+zGdBmlP?=
 =?us-ascii?Q?8Dsx1lVOmli4I6yv7qLx8Ox+EibV084fwrRu50t0acLBymy87Ao9+rszIh+8?=
 =?us-ascii?Q?v9W6VIZKgEyz5NG2fNkhELfJwYFv40+bIGxRQ22nCJgEKK6vaDC9xd7j2mqU?=
 =?us-ascii?Q?f8DVsVe2ANJmXeG+ahee20K9ACQDRHU8PNoY3nusvyJ3Vj4OAQvDq1QUC1eN?=
 =?us-ascii?Q?3HTqLuCvDUGrLv1HD49VelyF+Ohi04BDim5ZDklNuPwyq+Jcm6EF9ZhcKiYL?=
 =?us-ascii?Q?BsXNhkiMFou/WhXI6fwMIEz7fOw+TLddyUbidypY7bf6OmH2lBOKe71RvGI3?=
 =?us-ascii?Q?S8b3CEv89DTtyDhUmthkQuBXGkq/4UujCn4NXNyqRBSZVCYxM36ddrIXJXd6?=
 =?us-ascii?Q?x1YvKD5g3wIcBD8NJ1OcBndxOnfdhYmj2w4CLHI3KPDEmq69Nz773vkorou5?=
 =?us-ascii?Q?KXkmvwYRZtk+FC45+NoKFtZE+3GFPBVfoJ4DIT2ubi2CZhlYwdVGC7kok3Jy?=
 =?us-ascii?Q?kZKCwK4oitX2nUGaLDhjhPqKdW0PUml4QJwQ6v8EdfyKNnXmpOyJQDEoDeqO?=
 =?us-ascii?Q?SDbCxg0gD8Ygav6PlpE78ILljGekFBUNr5FzZ3ocFns2L9arPoiZLB/w3sr1?=
 =?us-ascii?Q?dppSGNzufLzrsvfIBdSoOePOsWGOoIRRTKFSbF28kowDVtoIwKRorq5eMJa3?=
 =?us-ascii?Q?D15X5bDTSNET8lVvYPtytAn0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f56405-2cdc-485d-83ef-08d90edb3787
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:34.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeo08aQ87kilDN3vQNn7316icCOMXWOmAG9LFY6K9UTa1ux1PjxeARZJWzDQcKwfQMmS3gi6rLHwSKzPXjQgbZpWn4+MTz6SI9IG7mcXZQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
Received-SPF: pass client-ip=40.107.7.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add support for qcow2 source. New option says to use test-source.qcow2
instead of test-source. Of course, test-source.qcow2 should be
precreated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench-backup.py    | 5 +++++
 scripts/simplebench/bench_block_job.py | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index fbc85f266f..a2120fcbf0 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -58,6 +58,8 @@ def bench(args):
 
         if src == 'nbd':
             source = nbd_drv
+        elif args.qcow2_sources:
+            source = drv_qcow2(drv_file(dirs[src] + '/test-source.qcow2'))
         else:
             source = drv_file(dirs[src] + '/test-source')
 
@@ -199,6 +201,9 @@ def __call__(self, parser, namespace, values, option_string=None):
 Use compressed backup. It automatically means
 automatically creating qcow2 target with
 lazy_refcounts for each test run''', action='store_true')
+    p.add_argument('--qcow2-sources', help='''\
+Use test-source.qcow2 images as sources instead of
+test-source raw images''', action='store_true')
     p.add_argument('--target-cache', help='''\
 Setup cache for target nodes. Options:
    direct: default, use O_DIRECT and aio=native
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 71d2e489c8..4f03c12169 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -88,6 +88,11 @@ def get_image_size(path):
     return json.loads(out)['virtual-size']
 
 
+def get_blockdev_size(obj):
+    img = obj['filename'] if 'filename' in obj else obj['file']['filename']
+    return get_image_size(img)
+
+
 # Bench backup or mirror
 def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
@@ -101,7 +106,7 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
 
         subprocess.run(['qemu-img', 'create', '-f', 'qcow2',
                         target['file']['filename'],
-                        str(get_image_size(source['filename']))],
+                        str(get_blockdev_size(source))],
                        stdout=subprocess.DEVNULL,
                        stderr=subprocess.DEVNULL, check=True)
 
-- 
2.29.2


