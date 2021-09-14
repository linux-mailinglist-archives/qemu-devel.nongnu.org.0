Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039240ABF6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:44:32 +0200 (CEST)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5vT-0002KR-44
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5eC-0005Ua-HR; Tue, 14 Sep 2021 06:26:40 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e9-0003Ok-OC; Tue, 14 Sep 2021 06:26:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKwQPrxECsqxjeC8uUxvaRmaEwJmWRzBrOhPT/sAsQmoWfgQis+6J4nOR+oNsbDEYLwIbooCDdnFEvD6LH33BRpBwwvjbLPRBW5P7Q6JBX+we4B1shwhAXg3Ahzq+TGOaTWUiljwWoEXHOHkcIx6YCeoKxyytcBVh3/XJOavHQUrvWk84G+89LphVQT5NHlIU97+pJCYRwzdfnuiHs4g60Wlp5CPab5OQD9MTiShxG00lx8Id6mpRMh6rjtX1ll35I2FQJXFGOBTaOoQeghh5X2kA11JUqUUxxZblfCqSlLDfFdPG1VX2+WEMhUsWorxL/db+tU6eEBKUz2hQM/tMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fxKaLB/XgD+NXm2hC62O/cmA6Y+0xQ9MU6xjOOr886U=;
 b=jtDX7v7+xEw8ZldUnsVZetmeEH5OKs9uUd+0AEkV/pzt904dTydzin+RJu4+DTfVwUCHaaDONErTGaxqGHw3SOUIA07L77p9DzeoGUcHbnq8RY/2fb8b4F+Z1Xoz0ULOswGTF12NLqdkuQqTM+JAYFg/rJ4nmBR0RoGNE+Tialk8gY19JmOsZw2EwJXao3zt/a2a2mDJ0nnuWfgG2bfO/3qdBck698eWt0JEYOzkqKv9ariVgTqemawIMMFnLY4rParJxX05OQwnDcRzE2siF/JZXoUhxWXbptRbZM7hOIoHJaSJNCEysPNp8vSozXQpJpp7/wWIE+LZL2iipcvY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxKaLB/XgD+NXm2hC62O/cmA6Y+0xQ9MU6xjOOr886U=;
 b=XgN6IIOt5wSKr2YgCRoxI4wKbJdP8KhcmeKuX3SWAQWcOAyGRvraPc85Wwm/bNDCtTrt0wMNRsULZUV4yp4Wcz+3y0qCqSpJCeJ13bjYRvXg2j3fZSx1efwIznEpzDgI4m/vVdbTRLzv/KWkjD1++9MPsC4ollq19PhYR8UvVBM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 16/17] iotest 214: explicit compression type
Date: Tue, 14 Sep 2021 13:25:46 +0300
Message-Id: <20210914102547.83963-17-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41a7643-7e44-43e3-c0da-08d9776a1a0f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB607176021D44471BC5DE68C0C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtGVqf+zO7z3jmipCWdxmyttujZTgWyGGZxU7Wzv4vm2PBqtwOSuMy2/hrL7GmXW3HFCjVirC6BeTdlzTJ6ynMF3czqMD0CrQzOub5HI2Nxs01m94inDoYHxOV56fvAL0MrqtTy4Rz1HBh11UKFQF3QhWXjlBxzFO/81WitJTH4+ED4Q/JT+UNHwEfv/5AWgjtBitwgxqsY1Mg2QgvAOi0utiiyRNaohS5HysDsschhByle8ryfbLIc7D9hIlR+ljXBhG9GTBtWXhccjcxZzWvPBwkIpRF6xZntfWoK00jPxFfN5J3d5i32UrSf4aNOzgZwongCkHNWDcKSJgFjJbGKdrVVP8CwfGiV/wGEv0OIFTrLTBqyQSKlZMzQmz7jnLD5UjnK18jDft7mTHuU8R+2k3OuuI1DWyUuJNBtjcnpQ99aZb9J9spEIe1vOpbwRCbtVCEVfKurtL4SHpwRsOdXUmgxOhsRRkbmuBh1/rQmOy2O9NlZMnixIVu2/GpCB9Tpd0UlVc7/CcR4eAdNVkM6EF7IeAYv4jnxD1LSaev9AANmqpMAF0W3koF/hLMCuzTqJj5xGrvYfke07X5nXHn+QzqHRJgFJz+DWbvJWVs/4Caht5bT3babUb+WkEwPBbCor9gHqX+jtzB687hYzYhdmhfjh1jSonF5Bqv+BZ4siscLIE2JwYOWqivg9TKSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(4744005)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UbD82UUKbVRP9F2+haP6tH74ajRD4nkfuOBKC+I3UAVpjmhHhDReQdslO/at?=
 =?us-ascii?Q?jMDQKTG4GuVQqyxHwYMbODT+LykZtE7y54T4k07fPusnnmzNYyuvaL7pLG70?=
 =?us-ascii?Q?12qUW5uBDU0xYscFG43Q2EI82Nwkxu/Cu8aoF+Cv0BUWuQzOGYd/tkV8hId1?=
 =?us-ascii?Q?zUPrD/0e0YewdGdx/57UENWXy2g+Jlr86cURMyBERUY+t6rxz47oCXyAwL0x?=
 =?us-ascii?Q?ZmyJJY7d5hc0tLz7DsZtogUpc9Ks5KrobDOWp+2FyjXATGKcknZUNEpfA8Fc?=
 =?us-ascii?Q?WZNEtxVfHEj615qjLUM8cHqN1Db+G8F4/4U35B7BCfAVPYEp/uK8B1OrLVKC?=
 =?us-ascii?Q?kq/p1LArjvJp+pXqRIKljFX/pDkvdE0h/Ur3q2e/yjhAhwbS8qco3hP1JLnW?=
 =?us-ascii?Q?Tr1V7UrNedKZrUO0DoDF2rdQu1KMHb5J9NcGUWvwCZm0q03yjXyC/xhnCaEh?=
 =?us-ascii?Q?lvefoYA9nlqxixH/sI43G7gXpURyRF3VsEjfkgjdIKwRdvrQMbInKyD4R4Bk?=
 =?us-ascii?Q?/Zt8iLyIf9xsUC2K+J8X6dhga2zVSlM7yrHzadbZ8wkLdiib26kuwGcd+OpS?=
 =?us-ascii?Q?9YnY4jNZDtcNxsUrzdGuADYbdGYOo6Kc2HtfLKk1or6CaREpCfP6WNftmjR9?=
 =?us-ascii?Q?hLCfjMb3FkGhEsGPLVHRkCTyKY7O6Gk4QsrJaJPZOlAaHJQ3xPMCMKZuiO0l?=
 =?us-ascii?Q?lRxXe7SM+xsKSgF2lqZgSYRy5ewiB1ja3KXw7dd3j4rM+Qi6okSiCkAgQNsO?=
 =?us-ascii?Q?Yb1ZZ0m4nutiXQojkCnm6UfUd7BfJVxVU9mFlfdnvvxBYFG8YgBzs3jSNimJ?=
 =?us-ascii?Q?wa6TS1Y6BErOOQK4WJMsRuPjslhobppOdRTT38JPZALT7ncAEsXqGzZRI7Rc?=
 =?us-ascii?Q?xVaGofyfbbIModjCMVpelqhu29Y2xJMUZeYfVAklzwSZC+2TqmKjIc9n0yZr?=
 =?us-ascii?Q?LFtNP2o7EI72rN3FBHS9MLOL3pKfNVW8KDF8Xnfzgx0tnR3dZ3le3BxRgcWi?=
 =?us-ascii?Q?5OeG1AQsKAtzYU637xsHZBdh1rOl/D0VeJA9kCjb+obFrxehK8Qqw3DKzK6p?=
 =?us-ascii?Q?DeCkjjhMZpvgq+Rakk6XFzLi6UN2c41cZlE8Ksq9M/G4QU0Q49DB1q6n4JF6?=
 =?us-ascii?Q?8UK1UR3HIES8kVTaoz1hwCCx2jGsh72Pp8GpwSDsrBiuTG/DBOHnb8V6cLoK?=
 =?us-ascii?Q?FZV3ZRNt0tJGbDYshPz1alKqsPk1M5Q7jhsgGRjHf7sxbfxCAvQm81uXPdk0?=
 =?us-ascii?Q?aRVw2/nyqqNoq9usL/pPsIecEccK2Be7be+wxONxxzBjCMB6rnBUMr19+5ys?=
 =?us-ascii?Q?uU6wim+xsjag0hYMDB6pZ86c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41a7643-7e44-43e3-c0da-08d9776a1a0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:23.8578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu7RHmlxt9w0qtQHYoVq3xez7wJeNakKCvN5KHt4CrOgJPQAb+VP493uSp3NBZmc5JDbE9RND/CzWS/vPhRj2IqIlVZkquPE1MrNLsXkYSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

The test-case "Corrupted size field in compressed cluster descriptor"
heavily depends on zlib compression type. So, make it explicit. This
way test passes with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/214 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..c66e246ba2 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -51,7 +51,7 @@ echo
 # The L2 entries of the two compressed clusters are located at
 # 0x800000 and 0x800008, their original values are 0x4008000000a00000
 # and 0x4008000000a00802 (5 sectors for compressed data each).
-_make_test_img 8M -o cluster_size=2M
+_make_test_img 8M -o cluster_size=2M,compression_type=zlib
 $QEMU_IO -c "write -c -P 0x11 0 2M" -c "write -c -P 0x11 2M 2M" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 
-- 
2.29.2


