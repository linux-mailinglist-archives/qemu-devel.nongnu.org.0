Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B038192D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:49:44 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhufn-0001Q8-9L
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue0-0006pp-3m; Sat, 15 May 2021 09:47:52 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:13825 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudx-00039c-35; Sat, 15 May 2021 09:47:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE0pyQBp/Ak9LIAQN0SalgqFOqGA4Keoa6gmLB2EU14VQZa0AN5RMXIElAIgHK+0WEvZd20iiiD5AlOSV2IbUlv98d6vqmKYEzlxx0X3Lu+DvIMoVmDKXE2GS9J1mhhkaW6SX+H2TvLc8k4Ffex6XA4guvQB8UX6MMw8ka8GosxERJ5fZXPJlb23Xg2rf8KXdQKp99IBHRnywD9S0Q+IJpr+Ij2qHraCjwOvsNtJOKlCvwDMHOszbWIfigaU2QbjDQyBNjE0R19KngQIC+0b42Hk0brbVC1aLF5Ca64tBOgk8nq8CzMAc89uJZxOlhLL5WZFOk9G0m4fstAIIi6//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DID9Wt2919PeAG3tSV9IqVl3RZ3jPyqkgHq9Wc9LP3w=;
 b=hQQ6qucx88OhxNQiOfVhKlfw0fdAVtCRXDgAslmk1Pg+V4aFiQT/RPc6YSWY5woWbGaA0nTxNhMoNeMwKM47IgFn5bbW83FrlzvtMpTeQX4Z/sP7NP7CQxwq0nMpE4Xbv1x47uaQC0RtAlD+dsAaPPIMXP/KVabhDejJlLchaKB3C5BJII2PAjQp4SaWmzTjN1d4Bm3srVT+dmcDxn/Ft8icLuxIAyfWRBCHdm1C5fWVtoHQnH4Cr8qNW8FcL+BivfFrvE8XJq4JoOD0ZQOKR9amhEVtYXqLNLFm1OSUuU5CP3lg3A62EHLRPQAKsxXoZhJMIR1hb+zcagVJVK0DjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DID9Wt2919PeAG3tSV9IqVl3RZ3jPyqkgHq9Wc9LP3w=;
 b=NBIsx67uIsMkRf/rvJd9oXV4XkSnPoTXZT5Qv6Z876PNLiGpa/fS21KOAClkif3rQu/Jdl29dV3BKHDNHJe99gxFdILWEwWmZ+bfwPyeQXLmK+I1tOzCdfZ9SbRDFU+ZFFO4xu1my6phtd+O+x+PGNQIO0COAScgKo0gW8u4nBg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 4/9] block: bdrv_reopen_parse_backing(): don't check frozen
 child
Date: Sat, 15 May 2021 16:47:00 +0300
Message-Id: <20210515134705.433604-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 343c715b-8be0-465d-6315-08d917a7fa3c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206B2234E2F0CFD5772900EC12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RhVP5bseIIdwFxpMJxham+9ypGDGcxb4Oag4fmBA1GXO6b94XiAZQK9NpHjE8RZVfkxciZnXf5aEWDJEr17xIfrbleBb7BYoZy2yB4VDE7L+TWsnQKckRAMbNoMYLOiWLFWoSdGa5d9ftkU+N8l9PARsretCUOnyL0ZJEvGKtbAG4zXkJZS2UxsiVhkDzkvMxYOky2T4p5Ap3A6J6dS7WQ+EQc3Cz+nq6O0NdopRmVT8IT8W1LKnDRXKWUcC2JwBJ6neZA7wIGwD/xkLOFiQHXgHYX8/+d2qGDwxI+jc7ZQa932jVrdj1VsFDEYefiPlyepo6FWxdW6AAVWHrmIX1TwVVkCYiYZMi0LtDZUXx2+12GixfqAYO5X4oKuS69Ck3cluwY0xYTx7h0GW2JJag5lbsPSc1ufEyX1He5GFWk3erjfVnoWTSi70OEkDTM2w7gJfNtAIX3GD6HdxAY84Iwru+c84W/jxP7hgxZbK8jFSPmc5f3HVuRRpp8gw9w2zwZw3QdqMwI8g0A9DumqpXvr2ZS1tytEhX7AGtXycGc864gwpLOX0F/FPsy1dj8W4929T101/YCBp1pv8VtKCE1ooBjCWLwoP0ltp1eurbjxZ7CS6eqjtIhSr+0QNxVSFjiElwxvVqDZJCIMit+WzdkQX/NuzBainkoXslRuo+v46ZV1gaVEr4UTphZbPs347
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cDEsri5Py03GOlp8xB3UpBnkXdws7a6S1O014JpAZiuoNtH+/SxJsmM1dFiW?=
 =?us-ascii?Q?wVP++iYpCOX9meEJHaKJEQGrDgNv5mJotKs9Gr3XFoqMwvqlqmHYRR8o9jkN?=
 =?us-ascii?Q?rU0EJdc2/ZmF+bqMKJT21YNbABwaw0c2J3roo9eKB2SmFKjaq5ljmpI07lgw?=
 =?us-ascii?Q?I8TY68TMFTxcnIRBotAiuL0CkjKBeEtD1tIrqUZfwDyv0G6/Q7/fAiVtDiC8?=
 =?us-ascii?Q?zERUGkSCSPfheYuJeeMQSm0OtXKSUA3KwBnOMp6+qbMsp7rgom5ggGagso3K?=
 =?us-ascii?Q?gJU+X2XwHiEyaltW4BekDMuA0JM72SoSQRu8BnPTxtTkM03J+m+EeLJDy5J9?=
 =?us-ascii?Q?CKbe2GjtKg961n/jE8xfxQFo0zdGlOdgrSEpfJnqr4h1s63SeQqP2NKNs+mK?=
 =?us-ascii?Q?f57IO34LGndnSe3a4Qn9AdsiO4iolDfBnDlIRUSfYn1/HkMZ3judeF4nY0Q2?=
 =?us-ascii?Q?II41Hk8JJtWZJjbtQPpLpPmp99smEGNKBlmOA+LNNy5u8h+PgUjUxzhR27e1?=
 =?us-ascii?Q?vcVcO9bdr9VWHIqk/Kw2wRdt5Z8Jn8IeoHCVuKuVigyti38StcTb6JlfbDTs?=
 =?us-ascii?Q?uAFNHSB6qrg1jbL+9JYEhCS0lUIZe3/ianKFFs/bKl/HvnlOJfoN2t8Ziluo?=
 =?us-ascii?Q?MccOmSBQd0P4Lmq3VwTcXeX6oPEztYP4VRHCOXVLX2FZcarto2+pkmzGMEUT?=
 =?us-ascii?Q?fG28pLaPWgZHAt4VDNJPzhSYqWxOlt8QcgG7zu5CqSd3qRTaq3OOiaj3OWYR?=
 =?us-ascii?Q?Kw/hb+iUTxN5fmnGmteW2nfUsjNLfx+9t2MTMDc7heCraGb5RpsWsCsnfo57?=
 =?us-ascii?Q?bsZ8qZCSd9HWmnA58v/FqEmOfDz5mBkN6km5oq0gaIhAmP2oqxL8tlmAJtp4?=
 =?us-ascii?Q?SK9q18gPv+bKQTor00Sq5MdZ2LSDMmOl/o0V5TQjMRWYHDBBmDIX0FOnX4TM?=
 =?us-ascii?Q?1AqE6RWPx0xOL31/q5jEHyybKiyvI6LyvNxRdhs7CLZDHTdGxkyRjDGDQlZo?=
 =?us-ascii?Q?p8NfZskxEUfkk/ZzjZRc5x6SXKn9ER4iOPHrdWWqhpTElbKHuxTLKvZgrAdY?=
 =?us-ascii?Q?nOp5qk4XiFbPyVt87BJqlcLJgHbhXmh99pQCFPG2BiAElD+nxMPD4ke0kvfb?=
 =?us-ascii?Q?3Y7bpb/a8MwJKhW2Yp5WhZq3uC2/MxnieVP3HVoDI5eohOuc9UHVazIwF/pd?=
 =?us-ascii?Q?Tu8VNsQUgEAsyTxaJExoRDdPPEfdZLZaWr6VufXs1yj5dWs0EinG7MhyuO+J?=
 =?us-ascii?Q?1Mvsq8wJ1Vw+KIHsitH3pFO0CIeAfS/KAFsP7h8uyBPmLpv3EGezTrHpRK4S?=
 =?us-ascii?Q?FMSSfmVHCUG5oJoS/rTSJY6T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343c715b-8be0-465d-6315-08d917a7fa3c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:27.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: po7ZASqpbeEUdlJURwOkZZs+SxPP5I+vVlwIC7YdtsjCeOf+/FfNilGaKn6294ygR2hHi1jffDhQOQp2qRlW9dy0O2rZPU+BmMEG8ac2YAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

bdrv_set_backing_noperm() takes care of it (actual check is in
bdrv_set_file_or_backing_noperm()), so we don't need to check it here.

While being here, improve error message a bit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 14 +-------------
 tests/qemu-iotests/245 |  8 ++++----
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 4e18bc3177..bfa497813b 100644
--- a/block.c
+++ b/block.c
@@ -4283,19 +4283,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                        "an implicit backing file", bs->node_name);
             return -EPERM;
         }
-        /*
-         * Check if the backing link that we want to replace is frozen.
-         * Note that
-         * bdrv_filter_or_cow_child(overlay_bs) == overlay_bs->backing,
-         * because we know that overlay_bs == bs, and that @bs
-         * either is a filter that uses ->backing or a COW format BDS
-         * with bs->drv->supports_backing == true.
-         */
-        if (bdrv_is_backing_chain_frozen(overlay_bs,
-                                         child_bs(overlay_bs->backing), errp))
-        {
-            return -EPERM;
-        }
+
         reopen_state->replace_backing_bs = true;
         reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
         ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index fc5297e268..c7d671366a 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -878,7 +878,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the stream job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         self.vm.run_job('stream0', auto_finalize = False, auto_dismiss = True)
 
@@ -910,7 +910,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
         self.reopen(opts['backing'], {'read-only': False},
-                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
+                    "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
@@ -933,11 +933,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         event = self.vm.event_wait(name='BLOCK_JOB_READY')
         self.assert_qmp(event, 'data/device', 'commit0')
-- 
2.29.2


