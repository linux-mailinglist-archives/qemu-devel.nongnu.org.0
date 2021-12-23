Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E315E47E650
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:22:52 +0100 (CET)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qrj-0004Ry-PN
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXx-0005t4-U8; Thu, 23 Dec 2021 11:02:25 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXw-0005Js-Er; Thu, 23 Dec 2021 11:02:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi9ENKajAeWXjYuORrIrB7BdPd6EFMSDF+H6ynjAGis0Hs3UlXzXK0LD1HeXqqiu1oRtAassd5qN+CNffOq3UV2ApwCq9l+FFHBERiHloWUExWl6KgzWxLhNKpVI9vcY2ghN4NCwfQ9xH16QpZRh8+pJIQ8YuryEcVlR/iYgkK2kW/dur3554JpqaV5rUKS2rqbxroWPfv26loGy4isjbs04KCMNz+lfeHRFonbw2XW1HPa1ywNdDWi4G0lBpFPmzw55r69KP/2kP9Whz9sAbNsFp6D5aOr97KJjg5oA1GEM9AVmyft6v4p1y3TzDoN/BaMfKnd0yPRGBRkPLY8G3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNBEUzaEKpyy3EPJPJuLjstFxgZdcUWJxXmmbd+oSZs=;
 b=Rc8xoN1SBnB2lqticOvxvTzTF3iTS2Rbq6PX1rfigDLLwh3KM5uJ/OYMgkJp9khnaYvtdHcAFa1vvrUnvew/HIHX4jT046yRCaXlM8ehPbwwCeluFuA6hEjegQvKlhVwbN8Doq/Em9qcSl41dqg91xmm0o6q9r04H1yaEAe6D0GEpvt9gLV3crP77jluhKbyWA8no718G4DHypYRZi7BWFeuV4ra9VGmK/xfQQ1qEQG4p+fnKYOofpXxz6QUxscLi5Iqi1NcFwDaPl1FPE6YsE1MIHZzP6wCZU2k4hP1JzbVleWPU9q4O7rlgPMfJNkQIJFtNK5G3ggTwmawCjm7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNBEUzaEKpyy3EPJPJuLjstFxgZdcUWJxXmmbd+oSZs=;
 b=KCtTuOXlVXt2qEoDficQYh+nz5ZTJSNzw5PE5wtf3x4hg5X9q65YMbTH5l/lBsuMa3o5RSNtmBvPgXWoRf/S4qLA/9rDrbn/ydBUOtJxTu4R9OYX5PzRee6h4Eow0pkSQwXeq0NrIRdN5EQSYOmAvAdca71nwsnr7TpXpsxCLZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 15/19] iotest 39: use _qcow2_dump_header
Date: Thu, 23 Dec 2021 17:01:40 +0100
Message-Id: <20211223160144.1097696-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39102ebe-4d2b-4d5e-f6a5-08d9c62d8dbd
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148C1970A116160AFCB3D7CC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VMknRlT/LyxPfG3u7zV6zOVqqh80NDpynbJQtLreFZXAWSk00ggyM4HucKmuc+Bdnl9QeZjnFVsKJLSbkM4C4hzXdQjE5EQ+C0U0qwMBsd/r7hSv+uSiJP5EE7GhDC7ZE8uAIrjSzpRU22m1mZNFW6Rsvhct7fuhdlRdkD2JGkAaUq0RPXXrJbL2iHgSe5b2J/QRHf6JL/pUwlF/fZ9mFX1Ctr5EsND3Tl4coQMNcJDuEM8hIS+bemq3JOa10n7vXnvLyIPs6s57blDMilHs12g4utlKf+ky036dMniELMk/S9OZyu+Z4RTctTE6Eo3ptHzDV1bklvzGnSRgYshez8E/6gl34TUBolpql7W84cmATj9B+u+Ga693PRtU/OyNzXTqLv/UnKuYAsKOpjOl0f7MwtWy66ChMtrmimglTSNCQWpy8yLTFBd+ehWsyEqDFxyb1YnN/bEYIDDU13sMGX3nCwT5Ymk+htci7JlKgRwnoPCcKceE+2GwhWlMFr01pXaj2GNH0o0KrzPo3Bwi4y6lIJUkRzTSQtOG+q4XOiviZVOIwq+faNbJQrHwtqpZ8eFh9XBxXJ9uzm6/3SQKGuiVwhekeZkWGyYTmkqFb0Xh38YxHRLtbYQtY/Ljf/38wQ1vdelSJVQ/7S8G9Jsw6M84gsiVN3ONQ9B6dMRJg6S1UXVLUm+kZ4v8qZNd9zwchts5pocfoVZgr7ff3nOAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(4744005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7079WHfgFJkLSBw4cC//bat7ncC1MdiQn0cqX/O0opkTGI3K9akSB2NP6zYF?=
 =?us-ascii?Q?fxAZrCkLCn2ZakG9BuDLPelOnxsvDMG1lwsB2Ed4s+9LMmuFTXFXTCA0PUOS?=
 =?us-ascii?Q?NQQwrjCRwVvcpZ1dPHBWlINjxpZ5KOBZhdPd6vrVXH7286KLp7kx9qZDhw9z?=
 =?us-ascii?Q?+A+ni9qbUJwYiWtRoCWbDi1Jbzn6D3r6E4u0qmY08grxv+WQBIphFeDFYCJw?=
 =?us-ascii?Q?uW+o2OvrWh35NnV0vbj2ZS+3wC/ZPsvgAP/VhKAMgan23sVBkQAEBZ6BtuE+?=
 =?us-ascii?Q?46Q4mxPatOCrn7DdDtPPUj3CivSj+a6SVx/YH6ILcalWsRGuUOco7Q3oidJY?=
 =?us-ascii?Q?8kpeeN+JhubGjEHc9aTeiorXs47ms6n6yOWMhlz/yEr/E//n5ygA0O8j9N6C?=
 =?us-ascii?Q?zdgzsoDvAntlQHZXDTjzXnFVZvJOiqoHSxqrDEdYUEPDlaQ4E0hY26LDQ9pH?=
 =?us-ascii?Q?G3CKrzmMHERi/EoO6KwebsiLmB3k+WWGcGeZsTeJJtyd4HyIIXDuAKn72JPr?=
 =?us-ascii?Q?1D1X7+aLGH4AQgfI+syTStjigEtoIB2tA8XNzJAX0Z9jd2xp9tYnH0UHCj2k?=
 =?us-ascii?Q?0RAaIJj0Pfpa2jS2D24yUwejuBEwj2lV4VjGQsgOcTwxnmmc6AqWJSh+8doz?=
 =?us-ascii?Q?DpOE40q1wBESzYMmeHKPMtdYK2ApGz/wo+/kOcJDurF+MQIuAyZTF4pkK9pu?=
 =?us-ascii?Q?SUbWx0cv5CHCcq69v+K3Up2Lc3uaM6D/sc5j7G0xYrGMannXyukuDklALIlv?=
 =?us-ascii?Q?pEyBiXlD3qUtGuc4DH6PsVC85P3fvc0H3g7q3Vgkhx7vZEG9WuNy/rlA6xni?=
 =?us-ascii?Q?M8k+4sRlxzIAuxrienDjxY43OnphT3TZKr5gr/P+rswxztDwwCyNeu82QwOx?=
 =?us-ascii?Q?dITtO00eCzyFoor4gK8qBmcpxPrBiViV7kYNGVc36ZqHafrnqzcrBYtJKSTr?=
 =?us-ascii?Q?rD28KG2zPPTi7ZbUmnRg9DUb/MpQspTkzn54mpPBo2xwis2iaCZ6vJT21/5P?=
 =?us-ascii?Q?fFGI/lTcaa1PFX/bJvjg76iWW7vGtRpElCU+q+dbzfopbG5X1NgJm9N74Q4b?=
 =?us-ascii?Q?LB0IX4uH5HSADmCx1sgqCCq8JGy1gkS3k/pQtVlP3TmFEOIokV8GVR6ZuSqw?=
 =?us-ascii?Q?sLbeDuquB2saoAr8ERLCNhA0mn7Vt0ISjD402FIYtPT4eAqc/v0zsarVtKER?=
 =?us-ascii?Q?eiPmJGv2toRzuzpko+nqN34TEBRRvpz/S/pMYGILa+i4DIXZ6MI4uH3Plsu9?=
 =?us-ascii?Q?2a+z7lAOi7d6u5J3T5w1MQklRqmX82y62tkO+PiGsD5c00UBpopWMuk8kTeR?=
 =?us-ascii?Q?QvZpitBZlmoHvf0SnQ2LfN615+IXG79SNv/faVrxbuZiWK50cJSsS77v9UgU?=
 =?us-ascii?Q?lW3wTKkxtP84w/nwWp1ezj4GawQFTq7cncSlZ7pjKAMEpiP9MlFiJ3EMXgiA?=
 =?us-ascii?Q?HlZuAKPg1VR+7q8Ws3V15YHSVb3oef/rRikNlbSY2PpwKRck9EYoNzBK34Ln?=
 =?us-ascii?Q?VS5OmIWc22GunzYA8beAM/MAK2Hi2tW7jrSDX+Lbg7x7Umnnt0Dq3ixJAL33?=
 =?us-ascii?Q?xCz7+rG9+L7xUalC060as1nvG6s4x8H9I/HAQXo42VBZemjVngpc7YuE1iCo?=
 =?us-ascii?Q?m7wiRsIZhrUlIDdyvIIfIbJzKcYTiCYLUVsxnfqyrgHG1ckfIXwo90UcyZoz?=
 =?us-ascii?Q?XWWz/bq1GYDho4lu8eE+0vzpDqw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39102ebe-4d2b-4d5e-f6a5-08d9c62d8dbd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:00.4438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESUBRW7Of3T6JGsbXPr2dPDKSGrtPv0tQjIdxbXZub2/3Vx3y8zbjwNj9sqfv5FzRFaLc/Dx/atLOJPRXIktbpVISUajrmNDJMtSdMfrmfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

_qcow2_dump_header has filter for compression type, so this change
makes test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/039 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 8e783a8380..00d379cde2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -142,7 +142,7 @@ $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
 _qcow2_dump_header | grep incompatible_features
-$PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
+_qcow2_dump_header "$TEST_IMG".base | grep incompatible_features
 
 _check_test_img
 TEST_IMG="$TEST_IMG".base _check_test_img
-- 
2.31.1


