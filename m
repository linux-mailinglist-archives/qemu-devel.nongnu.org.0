Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACB34271C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:45:05 +0100 (CET)
Received: from localhost ([::1]:41500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLzU-0000P8-0R
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwN-0006RD-WA; Fri, 19 Mar 2021 16:41:52 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:30496 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwK-0000lU-CT; Fri, 19 Mar 2021 16:41:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEAV4qObt4XZOXa+CnB3pwYw/ebv0FK2GWKk4lc8ZVasNF17wLKA+1ekZhF7juk9HSsvTtipJz+K2i+6hJWfO+kUEjVqTcN6K+mggVsW6E4f2zjqEBLkVlJ8YVSG5hVg1bCMe+ewgge8inVyLKgkxbg9OtUwywfMIdObOHmsakQYY5MAn3mXZu4eQFZQZjK4qBGvWg1rQhhisSB98nAebAliZCqJieUqmp8O1HvNcqhLG5bfsXiOXhGX9ZSKR9GkOLvpmEh/1mb+fiNgrpHBEPTtc3PA8TVOSfQ5YZm3Sj9oCThGVqUlX3+H8hQitDt0J9AuQ+//j4yJZ6Tb5JCt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBpmVlECAFlI+8BdRb6PIABGkRTgJICyqWJcJjD8wd0=;
 b=QkW6VsOKFkuVki+tNtmtoQRgY9JJslVcAyav1rQgJ9RcrKChtotWPQwbfdbNMpSwe9PHIlNKocxHcjFhqW/ShB2nrfbYH58xvvEOST9iaqVdgF/xPJFMnU4DBkucZHRsXgjpNxNFDFur4NRm7koUmAgf9x7Em3GFtZ4RjunPT9EWeWqM7Tv6whW50JMZQRd9yb2PH/1v5LRXVzfN7zKgqtf4a5I8eiKIXKF4BBDr0r6D5UcyP8SAqt5LABw5ZLGdiL/D6bm+jO/EgZ0a51kS3I0+kjcaHlLEAqJCYZqAh3MJk6GIDEt11ivPkw2V+f43B1JTLOUt0d3qPXto8CKPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBpmVlECAFlI+8BdRb6PIABGkRTgJICyqWJcJjD8wd0=;
 b=radZ2Y9pBUeQnzdsmLBtbJsW340sBXV3hAjUkYGjrQzxfk68EH3qPQHfZEsY8TFMDojx5QH/noMs4dC4f5TxXbg0X3GUykZ8ulJPy+bEYxoOuLaCDfyLw5g01lnQIi/F3Ce5l86haJN1f6Dq7R6TdlyAwQCwDzoBbjmDpXvS1rs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3223.eurprd08.prod.outlook.com (2603:10a6:209:4d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 19 Mar
 2021 20:41:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 20:41:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH 2/2] migrate-bitmaps-postcopy-test: check that we can't remove
 in-flight bitmaps
Date: Fri, 19 Mar 2021 23:41:24 +0300
Message-Id: <20210319204124.364312-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319204124.364312-1-vsementsov@virtuozzo.com>
References: <20210319204124.364312-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:3:d0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 20:41:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 372c96df-b066-48df-d7e4-08d8eb176849
X-MS-TrafficTypeDiagnostic: AM6PR08MB3223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32239178D76BD551EBFF407DC1689@AM6PR08MB3223.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:30;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFaNbDQAbDJgVekfd2bx5Bu/vEE+O2gW81lTgNqHDmb6mXweoQV5pKmT6z+5Ef/Szcc+uuqeQIy3/2tlJx0vRmKcIrniP6IGkyqUrXN1nUTsn7TfpKnHLaCTjv2zryUWuzRTiT3yN3qol9ir+EjRLM9+t04xTSAStQ2dh1qw2XO1ibUGX6fZymvRCbcnMyHu2ojP2ZLKMa13yM+LQOWYrwCKwGysMZ3/VJ9afbVbib4wkb6VqXlKZD2FSvsyK+Ce33Taw7FdnT+FOY0YB2VCkUoYdT9JFGBvZyuWWTsPFmc369HJR/CcDabJaA7P3snqeqHhJ4PD63XVIVHofYy6KuD8z7RNN4kM1jmbsBRUsiwZFdVfzjQnpgfwsVzJMsM7GKqwfzNkzgCW5m1qZCleet1Ybo87dWIbR6mxFeOVguQBUdiaT+kpNu/IXY6/wV2F/p50HsnqQRg4a7xQfxSQYJ/d3xXkJVrseG40vfa6z1Dey4BpjvIvsQs2zHTslKbgsd+QbDor7jCAmgJKI4Ss+I0uhsVWJqAUho5Cl8LERXYmkcH5txKdR+k2DPx+S8psrig/emh0n5/L3GVxS8zpsNsFqdSrcHDMqMtHmWs2gCvYkbJDti5wDjuxX0V/293hfR1MWz41vJ6ug7P0Top9aS0npa8+D8aVDQdAIKn9J/jIaqTS7fsDLYihu6+drhe0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39830400003)(396003)(36756003)(86362001)(2906002)(8676002)(6486002)(52116002)(8936002)(38100700001)(4326008)(83380400001)(6916009)(316002)(26005)(2616005)(66946007)(66476007)(69590400012)(6666004)(7416002)(16526019)(66556008)(6506007)(956004)(478600001)(186003)(5660300002)(6512007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0bZ6HatVfOdbG6sh2aQ7F8CsDSz3ob9fZUZTtpQh7W2jk1VJ7pK7CD9MHdlv?=
 =?us-ascii?Q?+x8ifN5kTMKUUP10DKaxIX2r8aNbqevDX7DT/h4G1sTrFLrH5lWmjuIZvFfQ?=
 =?us-ascii?Q?jnhFHL2BdU+PxNLruwP8l+V1HgGtEqnQCni01Xj0f/rQ1ZRIJrSOCjElQFvV?=
 =?us-ascii?Q?hD9ljAe61JB9JFX50cCqdSaFO5uvnIqOQdDbCZRp0MVaWq9YWgz8pz1xaRi9?=
 =?us-ascii?Q?GEjft4Zw/dfWhim2pToCB5L2xryi6xTaOs3/lXJIhuZme+fzWBPawuqvCY+R?=
 =?us-ascii?Q?1n5Q8XQa2D7t17SQAvJfmDVpu1I40vRWqLinxfZKp7fLO+eUAoEOWs/saAYS?=
 =?us-ascii?Q?d9auMVKzU9mPeQU1pDSFK/Ya0G18DXLaKq2PhKYxifvvuxYwdJA6GirLx7mv?=
 =?us-ascii?Q?ddL+HdBtMlEfeXruKSJ0dOPPHnPf+N7p+rnATXOrCTDy8Mg55kVUJswxCBDl?=
 =?us-ascii?Q?zHdVql5FeRLPKNf0IkVPtKApI/zJuRpWTEEZdPUVS68qWUJCwK689bJUwboF?=
 =?us-ascii?Q?zGkMERk4XuZmNJo2zlZiJYejANfWcQbQoMbTv3WiuZCQ7tMiElzYSK9FvQ7t?=
 =?us-ascii?Q?i8+2fBCtezQrTI1a6GAkKFZfOXQsPbdEiz8rP5gx2w512vZOFjG25yZWryhR?=
 =?us-ascii?Q?k4tZSQKDbPm1CzXI4Bs8HKSiiM7YJbZ1VLxZZ2qI0Pm2LDWOieryniZtXQh1?=
 =?us-ascii?Q?rLEkB+hR96EuEK8GdmvuatZTTLXpWxIJugdk3gzcAoLQggbjbxVGDgvQp5oM?=
 =?us-ascii?Q?SWSwZHDlVoFU7szhglQAC2rbUZS2bUOIZ+DAHs/fRgnJSc9MonKDL502hbPM?=
 =?us-ascii?Q?SIyTP1ki9vv8okGZxRUks+PEKzSwolmAy+1OhJlpvFxh3yd7QSZALEyGM7yp?=
 =?us-ascii?Q?51BVCTpADcPx3HaLL2/k0MF/mMU8CSodPxrvTit8pJu2Upq5RuMtXIOJv5Ay?=
 =?us-ascii?Q?Tz7tY4bF0ix97imKVmITZ/bEYUENvfvUCGoB3o/bat5sFyGwQYZWEZHmEWKw?=
 =?us-ascii?Q?2vhkw8DayJbR6ObnMvWzypvaBUqmVr6YuLCFNvbVgpTvUeyaFm8F1TIk5LDB?=
 =?us-ascii?Q?xoXaq9WeWRtNDUdkZH/a0OsfuES8emgnE3DNuozeffh4xGdZC5WMdmFo6kKJ?=
 =?us-ascii?Q?Xc3Ywu/VxUEFt1ryvMsI6/t8veD++ravNAKejvgJx8o6DDbfxO9Ape1Agzcd?=
 =?us-ascii?Q?2mArIBuStecbkAqRH0ILu59a0WfNSJf6B/Eb0m0Z9edVLv/1Wr0y51WUuTQ5?=
 =?us-ascii?Q?aaz0LPy9CRQ9MLyuWsaWI65jXA+urKHuV6aro1HCIAzMhwubXUOsD53XfWJ7?=
 =?us-ascii?Q?Bj2ukj0EdGxdSEuRIAMunFGr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372c96df-b066-48df-d7e4-08d8eb176849
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 20:41:44.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz2qfZLUwV75lVT0kUI6soLtk6/G/KzCkNK3im0xjO1HbSK3W991qS0Apt99kUkRhamwTVBbxYOrHGi8VTBY1qgRTWq10Ox9gYgxuES4acc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Check that we can't remove bitmaps being migrated on destination vm.
The new check proves that previous commit helps.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index d046ebeb94..7265eea738 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -224,6 +224,15 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.start_postcopy()
 
         self.vm_b_events += self.vm_b.get_qmp_events()
+
+        # Check that we can't remove in-flight bitmaps.
+        for i in range(0, nb_bitmaps):
+            result = self.vm_b.qmp('block-dirty-bitmap-remove',
+                                   node='drive0', name='bitmap{}'.format(i))
+            self.assert_qmp(result, 'error/desc',
+                            ("Bitmap 'bitmap{}' is currently in use by "
+                             "another operation and cannot be used").format(i))
+
         self.vm_b.shutdown()
         # recreate vm_b, so there is no incoming option, which prevents
         # loading bitmaps from disk
-- 
2.29.2


