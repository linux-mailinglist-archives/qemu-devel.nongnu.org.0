Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32A3D0C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:37:46 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69bl-0004CG-0S
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697t-0008JQ-FT; Wed, 21 Jul 2021 06:06:53 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:11108 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697r-0002Gy-Nk; Wed, 21 Jul 2021 06:06:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2gaKtZppOG6FQWhQuZgfzHMUOwwoIk6+wkO1ARtH9vtmaHOI9N6GEA1T+ssjxCZKFRLbQAvvTw0ct22viOlOyYWALyYr2A2r894TqB1a00uOS3vmQs8JANsTQ6T01N7nQDcJ7dDkflAuY8EjhbIEHoHSteH7OEjmNi/pRv+aYg8EwI0yhfr4BOMWlAiEOvKYDNYswLuxvEV/DyHYeJhmtnubuSzA9TSodaFeEky48BpdKEq6qBy3WFeOIXm05jFwvy6yb3yXhkIZF6UMx6hZyx2yGm13yUBx3AtIo91itgB7++PpbOB2fqGAqpKLslMoEySJFXJqkzO0wWgKKnTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=a3s4f92QYKqDaBjAZR2uNDAVcSnA2feoDE1rOZyh5KaC+7YCAd+J05LqFIr+rwPU9srAxn8vdVj3idW1Y5inKQ1um3wDjSKwRvDfp0HG7E0V4n/8koLfxrCX3Fc3XnvY06qk0l9pH16EOUcQ1LhXm5B/jzgpuLlUHlOrqiebM5vy+8LhIcucyUlh+jqEP/iKRM1OsxMguu0OmvO26NpRnOxeHmYFjHDLsdwzixlPMAA3c8eR8LbSZnwTnnguPVYLewChZL2XpiR1UV2a7acrRHA3fM2zmsT3cOrtTKlMiDThBtbmSe4yAN4P7kLxn3XgG/OHjf3k4mlxWPCYfSSpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=oVwPz3+4LzC7t30wzQP6VHFQSr8nbfmml4eDHziuWXkDojPf+TlnXW629pCzFlUuUSKWnUP+MuKRn1DWeaH90JmEO9HY+Vi35ffm2yxAMJKTomdTY/2NL5e0p95B4g4Y0+w9ykZAcQRg7ihK1lIg2hqbAL4sgCXzD2CNVp3/Edo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 24/33] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Wed, 21 Jul 2021 13:05:46 +0300
Message-Id: <20210721100555.45594-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f56234d-711d-42f4-710e-08d94c2f3df7
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494FDDFA3922C4A9ABEA191C1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vr/TPvrkjm9vF6CJwbfXogGRwFVkxf0XMfb4iNGfbMfT2LJ0PIKZveJVGgwAsx6+OxveQgt9+9M1EIAVn6X5lqJ1yLo3bx60b2WnqY70BEkAR/tRoO5TrEvsw4CywkjIQZmAStTTnToDVxSlb1b0Jm5thiE6bWOQ0oNJoSSXAULVwxCG5JbzbdJ1lq7qnHAeQa2MmxHaKCFddw0RzHReJ8pRfSPG8Mk3khSo0MaKdGycPJm4McnSzY0s12gx166R9UMK/5Z13YAGIBHQgM3ItKm1f9pzeilq0u4718+X5tY0qXhYNCvis0aTJfnTCT8kMTihlFVs/+T4tKtBrHVowjhQJCK4XkaJblkM2maHJaGsnU/jh4umeVVhWe6QrMdVhYcYu1stJGZqWbCRCUlTYGSX7svbgj1G9xbKKUvbCVO+ZBp0f4NajwwsDF4QO1mdq467c0VC/FUGOK9LK5+MYqfiad55kqzif2am1SXIF/6oy69RPjWd3kpkd+SEAj8/+H7z19JJJ7Uji5dgQJuS/QESPSBn9nxNPmg3BDhgWbbvhDl4FO9YHMjbouIMBe4s0Bkc7bBKqaLjvVkhFXayUnDzNdqMlqe22lGlE0QUHVkEZWhrT7uq6ob6W7eKe1WEMn8zkkvuldlIsgYpEADZnaAhG1elSXFIe/DXas7IjMVwquMpTFUVukWBEEw/yfhoU4UkURA8u+w4mfbTtiuC9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4TZ9S7KctH46DizYyfP+vChwbC56D1PaLMJ/w4Gqxga7unz5v8zV6d5xLZw?=
 =?us-ascii?Q?Fp3zmPKVf/+hXHwYk+7jlTrPcxCCzZQnDGe7YoVeknGQXjmwCsaZ+Mc/0nrM?=
 =?us-ascii?Q?cSh5FgSYar8CUe8ALMOJ4qHeNyXbbAs5seIQfmukzrfTnSLzGmZUNqlW3fzU?=
 =?us-ascii?Q?SnaxT5QpprZGQYOm0s0MG1Gjsyu012CG/wJo/Tn1UWJZvUoibeFEGehCNceN?=
 =?us-ascii?Q?og6KCzjqWBvc+B0ghiyniRpKdxDm2k4lhCipjMM8tpwEBeaTv6nRb+OOJ6g0?=
 =?us-ascii?Q?JMc+UfZ1WiEzuLM/1jv1WZwjv2Bo8CN78c94elUIWN9IhK4yJJx4dgKvjuDs?=
 =?us-ascii?Q?cM7/KHoxJDHOoaMOWcg0gb/zItIvWpysfF+Q/PFrVDB0vs+CUc7IizXHnj5d?=
 =?us-ascii?Q?OouxNFuG3i+0fm8PaW6kwodMi5yrtdpwQy1Qsu3wlhFdb86t/i9Gu337NbUK?=
 =?us-ascii?Q?uBZWDchmLBygFptXcrRHLJIj2mtiqBVHDXH4vfT4TtOwmoZCccK9si4+N52P?=
 =?us-ascii?Q?LSFxBXHTbSf/CuJnIyx1pRbB1SLoRMlZP+dM5V9ZHd3i5l3qngVhppcBWb6T?=
 =?us-ascii?Q?aBWg65GaWcvj8Y7Png3gvyofMZZAFZoJemh7P9f9EDB6ylipccX2Axr0wMsJ?=
 =?us-ascii?Q?P+9UBN5zK+z3l6qdhSzEY4kNHDydGeYUSfdosM904ufGwiH/mhixcb1lOhHu?=
 =?us-ascii?Q?tB32JhrIrbJUEuEenL80/LyM0/m0q+GvoYTwH/ycf0H58AE4LEJL581SADzT?=
 =?us-ascii?Q?BNOqxrGouhCHieX6s80Z2RQn7uLXQL6Qs7VmiVC6mJXEaUvhvSy4CfZURbWJ?=
 =?us-ascii?Q?/pS/TrTYhNfau9LC7gR97UYfKhVTti54KK7hG410I9Ey9tVngOYGXkMC0hSK?=
 =?us-ascii?Q?AtpoEWQxDk3ff7Owi4q55ImYc4Xb/3r37BCQDR+0zlvW9tkClMHglMyl9bxq?=
 =?us-ascii?Q?xDpzdhOSuOtSc0TyhisjFzFczcSTTvD0UmS0H5Bu+Vg1Zft8dPamigGGQGcV?=
 =?us-ascii?Q?bMzrbBxtUGgqWYlQ5XAzlqTgUB8skfe4RGTjTvmQ1YGoN7gzNQgcHKKePBd7?=
 =?us-ascii?Q?M/iONboQVhwrRdFvmP29nz4Ly6F1rxy9VyinncvnDt9kqHydBgAd3vMHDLxV?=
 =?us-ascii?Q?RcyKmz/0el/Cx0g4mSdEKfPj5RCSLDMiN8gC3jUMfUvk+A1tfP2UKtaaB37a?=
 =?us-ascii?Q?Auer5dkVBOWl11uJxwGxhvbJY+/6QpwJSFc6rYRkEgZXX9gPHtzrd4FjnQXZ?=
 =?us-ascii?Q?mk2hnFCl5EB4bwGspPWiAQoOwM7w2yfEfATV7BRjEFYdMSR34zunfybcXoAX?=
 =?us-ascii?Q?LfByVmlIgAU7p5C70cO7XnsD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f56234d-711d-42f4-710e-08d94c2f3df7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:43.7541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLZ4KAFXh99kIQqzmyThCBc+7U6W5zU3y250A4XUxlsqgMqgvB/X7+NRQ2LBngVEme4FGNoCIsj22IvYTwhT1YNGfG8mAFM2Z0JrPo+Y7G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
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

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 5eab31aeec..ce1e130c13 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -572,11 +572,21 @@ def _qmp_args(cls, conv_keys: bool,
         return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPMessage:
         """
         Invoke a QMP command and return the response dict
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-- 
2.29.2


