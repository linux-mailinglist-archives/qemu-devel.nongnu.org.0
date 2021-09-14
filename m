Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B319240ABFC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:47:12 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5y3-0006LC-FP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5eC-0005Tu-8D; Tue, 14 Sep 2021 06:26:40 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:28801 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e9-0003UG-E4; Tue, 14 Sep 2021 06:26:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPyqfxGb/HiwdnjXgv/8h+g97nL4UzYovAX5v49XkTyzC4vLxYxxnAnLaVjDIWHW4rVzbwW39f1vhrpocZZAbFU+NNS28dkH4Iv9HTBRQJ5EWspBdKtbIzMmkKWv7vhXkSRode3mBxcxoK6fGoA7Ro4ku8RMy75dud5IPr95on3Q6WztpKi4Vojk9TuGKRJHTsc1wfmZonjkcPWVgqS2nBBy6JVrklmRxkLPoIzK9l5mPeGx9seE+JeLvpezO6PbosRc1O0/Nluj7HpIrMKFTezfRl7QrpMD1yi4xj+7CmajrBVKgbMy2ca4NEkCW5x4RzdjnZl1/yDlqr9roD00sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=DflGnfCnKJ7R5aFFDbKXwyt7+W6Mg0/R8lONJLIquVM=;
 b=GYgX0/hvX/HaRbJKkxjMEq+WrDzVMjDQm6VNHKxSfHofKVKJVc1zXxC59ZTKWEqrqhYlMeqgWY/1UN//U+9tU9XpcrGNEwUP3Fy9clNhRaHip5+aN8RotmFqtnQMCVmU1MRrVyl6mRe1zyRqR+w00B+WQVsaGjAhzin/oemaQxGdgaONdQI6qFRSw8bwkXlky25J1KTSoKmB+xhA5uR0yxT9js7gCxxL8SyEPim1rqB2Kq10pUOVCZFwUMuAgANoS7ksvLULyscAfpHocMGVZVDA07WJoFOnVDbW4lEKn5WUsY1+peupUfdga6jjMS0W3KeeWj7Uzezc9TIKgs29Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DflGnfCnKJ7R5aFFDbKXwyt7+W6Mg0/R8lONJLIquVM=;
 b=qbrx9Cpu33/H9j92ca30rzmue8/kjYRYbX8BSJZKloWn1fdbCMI3Nw/b/+qrV117SeHjHVFBSPo4uG5nIt+H+nkt3PK4cxVvz9XmZie+kh5aMOxFGjFblklzCYeneb9eLlf4oDiExlKLbJPqvfKDAeoVSKA0Xg2met56GynSpew=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 15/17] iotests 60: more accurate set dirty bit in qcow2
 header
Date: Tue, 14 Sep 2021 13:25:45 +0300
Message-Id: <20210914102547.83963-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41a7d10f-570e-4ec4-9d53-08d9776a196a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB607124F13D3657F7E2053248C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8h436gTCThAiL5B653sXMAQr5g8tCRTwlTgQhGZOyud3ByNNWw8u/cXhfMAlkidBkYAd/u/tbUz8jF2DxDGjUh0GC+8x4xDnxxcpYig3mOCLlPnYNvWk4GVcrAbTs8n7xCVuGqlV2cQh5EEVlAOAGGHhNWCX7WWCKrflH3K36tLZqCzJfD4A8GuTAETQD8Ewv7rzDdKZgXSBM8loffk1QQIaADzRykjN1vYVTBvjIeZcBmQvaXfhxmOeM1aBMVphBuGVv8j4vaIGIWD0XeoBkzXk92NKukA1mG3raybAgvgA0QYIoljuDcmQ2f5hoL9DBnlJrwB7UZq4qhzQQjw9vNPzak1b73jcx6076uM/ZPE/vnpEcIeCvJLkHTX0axOthNszdaHsj9OpZpDBqE0tZ62teGkjeYQOcQ2n0zUGtZ6Yd9Fw+nzoKrEq1P5q6Y3sUUxFAAfqbBMb36JaCQS160aiVBKnOSlCwtSiYYJbMe159amFtohvp2iKavuSi3ZW1lImYxFrjfVufdlv8TLk/BChseUbMAXMX7bno+IDKO7IPTXXXz9EsklUp6F1oeLWB2vcW68ipyIVyhipOmmUPaXcKhEIOK12QeHuFmwBkvY+/xRsFerrw0QDjNZ6KPeuUhh55g6u3FlEX4z6cMEPMwL2epXJMqD0JMwpKybJCZcxRLkWGmMUwBr4HrzZKEXHYFZblT4hnCNosLYx0QksOPwChYYoJwMKV9YXRdxzzLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(4744005)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hl3xvqiVscmBTuPplkkehfPkkgmdwHBnbLhhc+HAHZ2KqaufxnhiTcP4bAbL?=
 =?us-ascii?Q?ZSJj9157FQNo+sDD0aHdxRDllE3MYohfFrhfO0H2246qKWb8KmuwM+C22DKQ?=
 =?us-ascii?Q?YdCmD1RXnVCeft7pccZAkG39m4m59N/zeZ3fiYQmsDUkypU4BrpFxJFjNT4s?=
 =?us-ascii?Q?ijBim/gUV/KsEXTxwKAQCJr07dCWiOY0V+P7hubUsEL+7vSYeLJ17kshpNlc?=
 =?us-ascii?Q?XR6A3W4WfouuEEBhQEakUMkLMzJlI97tOifGYs/nFUz3T20qiRUhevqf2oHA?=
 =?us-ascii?Q?eJvf288O1jEQlfR/9ump8c6y97u7U5POez5lvz4tehkTf+Raf8N5AE6Kxao3?=
 =?us-ascii?Q?F9ZJVuuZ2JlcWBix6CAmUVIdSSh75y+/ULZJ3i4Z5MXrZ8mYli1DoMt33fEV?=
 =?us-ascii?Q?T2oJp1Gmb4bN++JuXJ2NdBMukVv3zFKdYYbI5XhfvZTBuTIuBLbNKXqYoS7n?=
 =?us-ascii?Q?sD1jy5vMcou5psLs6dKCaDfowspBqWYmYqeMlhO/P5XsjfzcaOaqFQdoAdbq?=
 =?us-ascii?Q?ShyoBk047LmiBxcrE6qo3VWKZwyD5GuSI0n/Tk/AsOHSabmWjSPwwtn2EDlM?=
 =?us-ascii?Q?PVl1Poy+ghaXP0Q6tlH7TXGqjj7XgxVgs2lHePH6VGJsPs5nIRgeawhxDN1s?=
 =?us-ascii?Q?2vUXUqg2Rdj3pXi09tNwKxn+o5BIf7cKBEd/0Iqw3kb5br+mvbjn/QUYZ2PT?=
 =?us-ascii?Q?W+mhjSysaqTsTUj9JwGYiamIBpq0H31OnbU44xgzHe6ZM9GZLc3o6LnMi7Pn?=
 =?us-ascii?Q?29/HCm9MReZBtaT6Nk9CiNtJJlXPajA3aPU9+eRpOYa1Y+19ZoHlFiN49CWG?=
 =?us-ascii?Q?KSw+6XFQQXLB4D/xXIOIm+62+QbDG5C63k3AuGrnilZ6DRYvJ4k9vl5D7WBJ?=
 =?us-ascii?Q?4QMlBM4ZWDdY5liivBgm9hVLQej9IG12wv3JC9Ic0ANpck07WoCEHC0EEIOP?=
 =?us-ascii?Q?NmHB0p8pcAG4oTwuB18A849epZ0HbB04pFyP7UYRH/ipDvzWnpUumBl71hrV?=
 =?us-ascii?Q?LUHD1r0gXxCmtIDJnO1SD1LucD0pE1myHUDM0mGvhDEVpEgzY1T5cgMX8SYG?=
 =?us-ascii?Q?ACUG0FGY6hqGFsMeHBRhXXlt1ik9pBilGx14TmMSg0Ak8O2plM7bpI5qEv+C?=
 =?us-ascii?Q?5Q30Idy1myWgIlHv7hIwe6w24p0y1l3ZKY/A8Z3VQ4Q+z+oCU6HuYLTcVwEw?=
 =?us-ascii?Q?RS/mk0AUkbHjJbwNVuy+m2nzQZttcW9JP36acH3c16bk/MWnYmRA5EZtOWOl?=
 =?us-ascii?Q?VAguJTXqcHkH8+NHga50jHdEDn7W+ejhi9CWd1h0SpfnrgPSJ1mQpkPDBi/j?=
 =?us-ascii?Q?VtKv9aO8letu0FSXg3mDVZN7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a7d10f-570e-4ec4-9d53-08d9776a196a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:22.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXXKb2bXnfSH3GkPaNrtIaMSKuehAGiVBjG2+k32P6XD8ftInFilZx+O5deiMv7QUmVX9UGEJ+dcNvH8NalVA8OAKpcNfO8Mvp/eWI08KCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.21.115;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.29.2


