Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85786307F1F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:08:53 +0100 (CET)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Db2-0008SJ-8S
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5DX5-0006W5-7Y; Thu, 28 Jan 2021 15:04:47 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:9358 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5DWy-00079C-1D; Thu, 28 Jan 2021 15:04:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFJ/fnO7bRC1tjifrFRd8Fh9B9civLQqNfCmMQewO3Cx+T7Gr3Swq2uvf2TDaYmsFGm3tJ6KJZ21ypmIe1J7Qz79rc2l7t58ady29d6emCaG5BC1+WudKFLkgdu1CAebcYZKs0X4wMcz4Gv6X13pnft7nkpnKbhJz1koCSbJMzfTIxyITb/kuaHz97nHkwG7XaVAWPt/Tr1bj21iqEaZ5qVCLESVWALvq4odQj0IDa4tVO3hBpFEIFLwwPgBQQ9f1U8YcnwEYpbCQPCJfy1T+lfDDZEh0AWyAP5sEQVImXjkzNwBIQdVjIe0du/UqPEY2JyweTN537U5vEsjg03SFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duP/SJfzC4etTLOgW2cDlum6MmJQp+sYVJrROPXgp2k=;
 b=k6zrZ1gOeTFTeJ3rhiGeZmv7uk2Ka0vcqu4PxjOVxJfj+Dxve048qOz8DTh7XqDB9CP255XC67OkeM0a6FOeRZfNnCoSn/aC0SVywsByQTiPhVl5nYRHPy9pJuHRqiIABzIpeKKAT7XDUEtAxnmI4fAbhKTOwl4atN9GGxRRDM5MrELZWbf7HO7SroyRz9sbSgSod7imQq/AGkhOS265c55F8Vkesldh+3ZnAm9eS2xY2Q5rjW6UqVjMMn/opHpqexrjBIfkSP8QOBNJMEJpyff49FLgv339cZE1y6DxgXXY6eFrOyHpTHxKN/sLGtq7skQb7q732HC22PvWuLe2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duP/SJfzC4etTLOgW2cDlum6MmJQp+sYVJrROPXgp2k=;
 b=gk0X5ywPGm+Ds42SaDALLSboncceJ+KSfx6kikpsV9SUB/sMCq3pO2ocvLPLHGG4FkiBmOV52fOZaOaZtsLk//1pmB0qUZT6xnk/Fw7BaCVSo5u6m+ZwMaPEqoAKozQ/wkFaEtNPzkfYMvdtFhuWRB81Jss43vT+VA06rq0Z+4Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 28 Jan
 2021 20:04:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 20:04:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/297: pylint: ignore too many statements
Date: Thu, 28 Jan 2021 23:04:17 +0300
Message-Id: <20210128200417.303775-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.105]
X-ClientProxiedBy: AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.105) by
 AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 20:04:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82296fb6-b8ff-48f1-d6b5-08d8c3c7efe5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6568C68A7CBFEFCAE609C389C1BA9@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z1qVKmuNhbyMniIVppzlbDWuEOT9gSe31liutBeHvBimXfty7sonTAmDlThTMR8Vm3HWjPCvxgoVDN2fr0/uGpT7b99oB2X1ECsuSKa5nB8QC9Ep1/UgsUAjGH3Rx8GKTyuKch1uU6FeVV5hF5blRkLioS4BPnYiVkXtDJvOa/TH5iJWn3wKY8oAjpF7c7r7JIgn2ZjzvvErbWG+sZkmDhujlGeS1J/40xmvXhEjOyWTRbl9r9YimHig8hT1r08cD0W4PkcaHueiVTf3WisY+8CrH//qr7EVNWILf3Rh6+c6jJ61CGnrmjV8kSzJSBOvaZeRP/zrLkNtvtMVf8R/u1jVopJDyKxMoatx/c3/liSv+eaNd82SvuBmnqPCh9n3NHupABjEdwLRr1R/Ymxu1AmoUErytIRZ2r+Jd+r5MP/6Ucq+BBggrPN5DelEG13W2HlliVHfQ83Mjsi9xs9hrKobCve4j10dN+Mhw99vwzbSym2L5Gnax52TCDaVDnK9QL1SCRQZK3Z0jLBmyTk6zToW229ZSDSB5ApWDqosdZUr93IidlcjvuT19W25v7W1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(6666004)(6512007)(6916009)(52116002)(6486002)(86362001)(2906002)(478600001)(8936002)(4744005)(4326008)(8676002)(316002)(66946007)(26005)(66556008)(66476007)(2616005)(1076003)(956004)(186003)(36756003)(83380400001)(6506007)(16526019)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ED4FYb2o6x+FTV5SNFT5Y680d0fHIu2v56S3cTnk0fZCW3EHCy+eJ5eEpj9R?=
 =?us-ascii?Q?yHWilgzrJI563N3GYzebFbOj9+sp12LblnL29cSlh5tRXDi0RS/3CYd3QPOz?=
 =?us-ascii?Q?3k2VxLnXZpGVsCyqGSBXpeejGD+cgjNSApW4vICUE2Xx7HjaVfhhJien43CN?=
 =?us-ascii?Q?cPTa+L5Rdza0ZErrJi/oS2NMxwxWCe0jzWXfpcwn8eF4jYc7GnQTTGKrtFTA?=
 =?us-ascii?Q?xOFEdEAmUMMKzTXjNqNryiB76MJT+UXu/XWBfc5XkmTp7X/UIBaV3InMBaUK?=
 =?us-ascii?Q?2sW6a5PNKIi9Q2KRqMd9u4QqbDszwdb5y0FQGX9tfNO2u6JXv4Eg8dNWoNns?=
 =?us-ascii?Q?bmu62ld9KrYt1HkykSyBgpRrVY2nJC+PZTklO9p/o2TbYstrmnCuXQ1ZtXMH?=
 =?us-ascii?Q?pImOSlCuVhHdqfeD/Pz4zTwFymes+CBIo41zZVY7xc2VWKwR0CFDk3VLRuXJ?=
 =?us-ascii?Q?vDbKSUGH7nWcnGbb+3uiWU28q5zyZFDxqUyBWJ5aZjWtqS1UhBx7Zazw3laL?=
 =?us-ascii?Q?rlGdMtNUgZfOeyQddc3SixhF6CVGM0rerntVMjlWhvu4jd/QLy1QqTwYCshd?=
 =?us-ascii?Q?4g8ATbKTqzjv0Zfv3HMsyYFNb9bWYGPDGHN6UIVHXJ0ZwPAJcAkwOQZ5n0MT?=
 =?us-ascii?Q?bKGHwkRlp0jLV9YvLyB1gMMNKbbC/zOqlPnR/XqQd17V+AKd2Q/Z8tDki+Ko?=
 =?us-ascii?Q?DmSULs2emanmOzDVs0pcvHd/hR07BDwapZ9dTzvUFavdppwcPpVY+YhwGqI/?=
 =?us-ascii?Q?sHvafDWJUDyNgpVgvUtGslW7q1J22a6yI91gFRMVcbuCoTh3UD4APmG31tG/?=
 =?us-ascii?Q?aRuW5gTichOzx/wTwSnYfPkqP8fsvUqvKI/nTZPs3AX2d/7P/I79xG0BDNuf?=
 =?us-ascii?Q?RLH+yM5/otEq2L6yUselg1MtZw1SslozWgUWzLk1n4KUs9Fr5GQcqIOUhCQ6?=
 =?us-ascii?Q?ejkZvfOdhRANT5aoAkbXMZBRlNMAWlvOuEFCwWdb02RWxvkRLywUIv7LOr1J?=
 =?us-ascii?Q?qWBF8sbqg3WzIa8ei/X+xC/v+Wk2ldNPTCan7ITDL6525BYMGADPDUT/r72E?=
 =?us-ascii?Q?iaX1KaGK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82296fb6-b8ff-48f1-d6b5-08d8c3c7efe5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 20:04:36.5174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KLaHeOIKu491vfCCZ8iwZebeBC27EhirIEtDRQ//yE4WlOS659t/KheXHez1h7m19uVIuN38K/PQK0Y/WyV/qDEzgQiZNhkoxkLLNdOGLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ignore two complains, which now lead to 297 failure on testenv.py and
testrunner.py.

Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a37910b42d..3e3e0e34aa 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -73,7 +73,9 @@ def run_linters():
         env['PYTHONPATH'] += os.pathsep + qemu_module_path
     except KeyError:
         env['PYTHONPATH'] = qemu_module_path
-    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
+    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX',
+                    '--disable=too-many-return-statements',
+                    '--disable=too-many-statements', *files),
                    env=env, check=False)
 
     print('=== mypy ===')
-- 
2.29.2


