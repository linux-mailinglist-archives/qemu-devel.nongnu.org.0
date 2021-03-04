Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11932D115
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:46:25 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlUu-00053M-8C
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHlTD-0004RM-76; Thu, 04 Mar 2021 05:44:39 -0500
Received: from mail-am6eur05on2117.outbound.protection.outlook.com
 ([40.107.22.117]:31073 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHlTA-0005qS-7x; Thu, 04 Mar 2021 05:44:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcCJgldNOvbkFtYm5fIeq5EaFBp19wdWRn2P+lTRc++zSgw8M9jhMIY//OqeUojnNjIbHT/LKmkRKex965eAgzNsAsqGph8zrFxWa1DK63RDOEw6pJW6YzjlMnKOVxmKXkUHLVq6gXs2UJEGsJQavdSs5JyWb35Vt+fK3aOCceJyy4cOSsPMeWh5xQOeEPKGbHmyvsJCmkr/sThTDvemLz00wJfP4ew+rVyaQWBdYLaleWibOHJEo2RU0kPPL05u9mhLhaxyPSu5IvibVdnjwO/Uhhp5rB4iAZw5siULwJl5sh47fyBZsjMg6VWw8Z0hVNEDiqFUuhIaXJTnoXMYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nERXgoLxESIiiUlcMyPR/pCclKWGXp2v2eyqbGs2qGA=;
 b=TTRWe5Ju9kKOoMR8aQqi+Hwu0ol9Zc2h5nINCriIkUxGHsUjZwFtw61Sml2n5dKZjF0FWcfulBT5rVYWDnSMKlb1B956PssVu4naKb/CbftQ5cle/HrMkI0R+D82QENmTjCtTfqY1MmKl8xZqLIQkyiP9w9gXI8ttrLsnhAXlu1jOtSj19aIu8mdpSGFWvjlA75sC4Cw3p9YiYQVJQnOGDEs4NRaTJtw6REOPvjhgtKacJt/+hGrhEaIMUInSvcJXmI4427yioZyWr8M3CCpOmF0fnY2rRvBZMtI5NQuLuKkeuUD86co9smlmOBOMqKNia64slnS+V2nZ7sg3MOJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nERXgoLxESIiiUlcMyPR/pCclKWGXp2v2eyqbGs2qGA=;
 b=WaQQr0PYjsJAJbc5JMfJGw8mSmwo+9fNyi3aY12wdF5Anl2oIPljrWpf/VTbZyS14nPfe32sN98vPv9SMBsVYj4hkbSy7Fp7iIGyfMwgUhg53AUI6sMmact/Iz9tHtG8mqNYI99LrceHBypxupQ/PymAq27SlV8/4tH847jDTMQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:44:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:44:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 9/8] MAINTAINERS: update Benchmark util: add git tree
Date: Thu,  4 Mar 2021 13:44:07 +0300
Message-Id: <20210304104407.21544-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304101738.20248-1-vsementsov@virtuozzo.com>
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1PR05CA0295.eurprd05.prod.outlook.com
 (2603:10a6:7:93::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1PR05CA0295.eurprd05.prod.outlook.com (2603:10a6:7:93::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:44:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c5123d1-7388-4d63-79fd-08d8defa7ae3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4166D4B4C46DAD6B525583FEC1979@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +b5M8VVhkCN8H49Vyg8/yUd4Q8VryE5iYCVleblK5YJG0ATqP7HfwM7yB8HICzTmTS7p5TvV/3Vxh/e1y4OinspftA03dgcav5c+Q5hi8OViS7FilMl8xnLTld2A+vZVrysDgjYEf0FVM16xMw2JgYwIhLvn/p6HCitglS47gFw9pzEEZMsmxj4rp6FUyomrz2cP1vyKRYlT/fNxG75/xBUGNCX4/i0UAZ2sh3yXcV3thezWLJEC6dh+NWX2+dAqOhCf6QM5vD7X3ZMDrGfoIn7jYx6Lv5LXSydDaiuC0SkcMpFuVYa4x4YkfldD1MpVL2rk0L4Upw/zcKPsJHSsKKWXvULu+UnQvCtxupq9r5uMrfeV/NN+jQR8JAbNHzbJ2PWn5ouEnO4fQm5ZnfoU/Rqofp6qmx0P6oSU/ELxXkAD6hpjdienQonhvokmLX7FbVfp4qvAQkBUQHXvUElCTWgPc5A/k7/k5Kf8Iq3WwmPvFjGijgIW0/P3QHp7LMiEVipePk33dyD7qBamco8tomF2nK0yQALeToS9axiUjMRiDHjUlrFIhyOf3dVhlNTHnaZsp9CbzSt7s7MOW5vgMYMH6kwqnbccTo1Tm4PjGgVZjnzIagsnEJ6dsU0wQZKWbvxynKiQyodqYVpHyt5s+uaWbRlRqld8FyBhetIdAug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39840400004)(346002)(66556008)(316002)(6506007)(66476007)(6486002)(4744005)(66946007)(6666004)(86362001)(5660300002)(966005)(956004)(2616005)(4326008)(478600001)(8676002)(69590400012)(186003)(52116002)(36756003)(16526019)(6916009)(6512007)(8936002)(26005)(1076003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5UZLqDzsfRxddyqn18xuHgHyEW3UHbSm/T3OM1A29/HUCNBVJaMkKvLEt0AS?=
 =?us-ascii?Q?YDgnLjI4DA0e7SoUH4RghodMduPbiOUWs7jW3OifdNk8h8wsVD69NbeOJb0W?=
 =?us-ascii?Q?MscJCi/y49ks0iLv0Bch77fhdy4Rxf6Ep9fQFgpMffa/YmxVTh27B/gx/Yxa?=
 =?us-ascii?Q?LbxFWD5HzBKHZA9Nlw31GGcav//zi3T4kMvCU6X6WU4FekfWAnIBlO9TQFyH?=
 =?us-ascii?Q?bTp9VGD9Ww43Rt1or6kKmupPW9dLX0Krvz2KV1WL/Cyh97pEjUj+wUlMuH9O?=
 =?us-ascii?Q?ZlAGzzo3PoeqgkxdU5Rcp2AtUvL0JI1gkv1BSkj4+YG7NhPNIDXdXOTpSiRk?=
 =?us-ascii?Q?6/X7o5MLk/XvEaQnxPaAI8/UB3pLDJL4tJLgh4ol6T0YhH+ZRak7/4jVdnmk?=
 =?us-ascii?Q?/pdnc500Jrf03IJWtEYcEkfEJPMOwwcbAiTpgcyF4XujDvL+eUSKKobUrgXn?=
 =?us-ascii?Q?nnUECMnnd6BOhFEl3C0NzWbWIJelrRzGhB31hZHv5L0mJRPV5TvFwyX2pdx3?=
 =?us-ascii?Q?3ooXJKGb5hPJxPlmm6Q+Spyl+CQnezGykMx0eYpKASZsll5DWf4G/+6erE7k?=
 =?us-ascii?Q?AYJDhLWSRDh0ZOtIlZtm6V+CahIKFEfxZ4BPwWNm1pAVd2LpwiSgMgpJnmrW?=
 =?us-ascii?Q?xCYSU90pBb1pRQ97uR9rp1wIPdRE1iu91wLTYxVvUBaDKVwmjJ1Kv3gkHX2v?=
 =?us-ascii?Q?pIASQ7OGcrNTkRiLiJqw68XzHtFKBGkEj0vH+bwecBmNh05+UefPFEPovOBL?=
 =?us-ascii?Q?2S7EQlTGwcFVyxZF2j9CajsEOtfpGm7Enwj0HwpSjpmOg8SPyuRhjDIIcqnn?=
 =?us-ascii?Q?fAQfA9d52ExkEWmmQydKw0hHt/Av8eJWRknywsB1XYATFd1kP4b+X1sX9gFX?=
 =?us-ascii?Q?ZF+70Y0tLaD4hAl60CAYKMIrutzx/LZPBWIvUmkuRg/kBoGnd+eC+zYTH/hy?=
 =?us-ascii?Q?bAFnIlyMeUhoAr4qVyysVbKoRV8dshqELin6qQRO0UuXNSI2iyUl2nZSiEcI?=
 =?us-ascii?Q?YNc4e4+U6lb+2fNQWzEL5I7CwMOLmeNw7QAJmh+ipvVDAhNeQE0n2IshevyX?=
 =?us-ascii?Q?HM5LWAtRbAxwRrdtxWmJuKK/VioeVBva1I/9cFeewUTtmHq7AfrBDS9WKiDn?=
 =?us-ascii?Q?VyvdeNyVCqSAKNsHTD0sKpMlZj9GPLhYNlOKnbrxOGuEkGgwZv4DsT8WjtPc?=
 =?us-ascii?Q?ykVlxHwZR3FjPeNcCKmYiqsWJyvnbCKj00W1y7RthEjggVT13KZEYnoMtVV0?=
 =?us-ascii?Q?fpkagGQh6mqPefFBNm2h3SktVaw31KtnnMb2AItCytOWMLD93TBELrzq1a5y?=
 =?us-ascii?Q?urGG8fgDkYGisE4L8nlR9L9c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5123d1-7388-4d63-79fd-08d8defa7ae3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:44:26.2677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+NkIWkTWhikQHBzKoOZ3tnFrNhakAbCeibmukz38+aoxJ+AOtkq9vJyD4HEkEPkHBLaxEYfC34pBctpHFIFN7ywTql6/H2uIxEfdZ6zsQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.22.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1f..642c1c8a46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2484,6 +2484,7 @@ Benchmark util
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 S: Maintained
 F: scripts/simplebench/
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
 
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
-- 
2.29.2


