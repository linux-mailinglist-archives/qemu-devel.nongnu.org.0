Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312882F8F9E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:11:21 +0100 (CET)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tmy-0002cT-9J
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQd-0005jp-08; Sat, 16 Jan 2021 16:48:15 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:11232 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQb-0007As-6A; Sat, 16 Jan 2021 16:48:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SObKYMBIedtTQcmcRatkk6zMJBTrN80Nyl5+YM9C2Iy/QAHA2T2z2eDbS/CePWd+xiKEwgMNdQ3bropAqzC65qhwJgizHsh9byi/U2WkDBNgaDcRJQpQ1rPCQ/jjMBU77ydPihE//O5n7/IO/Hn/C+JrZso4KyhBqqW3MWLXq7Lf8YXMxX7Cy1nVx+sGuADKLopLH0T5iG21WMT3Rr9ykYRWpcEhjc1JWwdkGbRC0X+8nd6T1cjzlwijP6TAnYb006Zogk8OlEiXOt0m+KS9z2QDvjvQwuwLmhTtzQPeSc6YBx3ZG+EINv53jNTK1/mn8y3C+j77v9UDQMXFNY27Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSAB+AUXjdCkJa7CKJRSpf6l8yeWA8atvK8iMfkywts=;
 b=LUM+vSRYIEE+UK0xr4UobhHMrmlatvGly9OuVQLoTqvQFxV5PkZVukFhHTcqkI3W4m082EJg+Ewkwv8ZIvDqlOWuTXMhYQsn6wEjj4AGpkyxlUpLrrsOaHO5EijI4GPYbkdY5IQprSJkM2loro9N3vQG3sGlpJaUVMq+LHf+ro5yxs5ZQkeVP+qrM+EgqiDWHpAlI+L+q0rzRgG5p1T1pqS4uyIbqRxHBh6ydMZKAlwFoYPBFDtfqZPTgy0dVMeo4ZmjutAoz0i68F87sZI++7yh4rzROH5bVQNOf5ITB1MqtwWb0GqpzzR+BjF3XSMOwbcSD8qqrVgUI61IGRP5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSAB+AUXjdCkJa7CKJRSpf6l8yeWA8atvK8iMfkywts=;
 b=YSWRBlkRlmxlUDh5yykPpcEwFE6alczqS5/hwZHakvLjF/CVfPeFcHPWYxaZmR6sh9m2sRWgMhpVNaR9JPNXW5jWPrJdr8edoBFuG79jgSsQ2Z+K8zwOzrGZ/UozQALYqJnFYpiAkCQDlm0UKoS4VaNz6pJTJn+HkhjyrLaPIFk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:48:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:48:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 21/23] simplebench/bench_block_job: use correct shebang
 line with python3
Date: Sun, 17 Jan 2021 00:47:03 +0300
Message-Id: <20210116214705.822267-22-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 21:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3603280a-0fe2-4e6e-19c1-08d8ba686556
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542E05A15F7632DF9E3C51CC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7W9yPCmy8TxNwnrIOW1ljZSp4U42AIAmK0010IfFNHxWTIvP74zjZ+VefXv486VzbfqpFpIyKcqlppPq8HuS4o+fzz+u4dhdzL1HZm9fGJyOsSMN4nCmcr68VDipvqpvV0GW7R71aVapJjAZpRayKkAJmDZ13ZiQGnZxod8XBD9Mm/291bVrQABjbHwK+IjpdbcwHiWIusW0lVbgbF6r098I5cjSI26ryiJwYn8qRbWYao/WCYBYrmcZZbvnvk/0uUMzTHz2cX91ghSwxJZMUuzXcUFMMSo5/RJk0O3tA81AbGbPeSBApZGdgX0euETu8wohidMXnnO7vHzMsi+Bf2cvK/GW/IcHYox1gY4xwCz7QgguoWunyH5cZZ8HvUOtdcdpzhv7exe4uZwDRZKnoj+6Mc9jp4rgkwEildKo9+UEMN+y3cbENyZSC22Ra09JFrhHpit7fgW+VlpKps+y4/lS9BFZ5QbesEnHkZUGW43x3AK77X3OZyJsba44KZ5eJFHb7cD+JjkA0E3HuxlsWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(4744005)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xByZiw/nF3poRJPurjxWKPuheZwjAhW6vyo6/28QJ3ePIA/r2vlaBbJUOQ3v?=
 =?us-ascii?Q?6pNzPbqtkilAtVlEHVM/M+b0R231UDVznqotLFF36mpuCB7ceiXP8koSw6d0?=
 =?us-ascii?Q?0MNJUw6qGHGXoj32zziZgbsvpm48ejtMsabEf3OkSZ/q2IchEtKMuVX22nCJ?=
 =?us-ascii?Q?16aQ41X8l8Rzr9Y/7qyoZk37k0GHnEOLS06r4/343uaIKi8PvIgO2o4kTsiI?=
 =?us-ascii?Q?W4OWbV5/eUFRqDBDsBsOXpB+EzmMZSNLVYzor3t+TGVi3kOfwT2m979lepUG?=
 =?us-ascii?Q?NKbKjY1OEZQ281g2hKg93GiHYEY0aCtb8QQNlrwLdW5H367NIWMFQouwLtke?=
 =?us-ascii?Q?OMT9wvPaSlehInMDgWiu07DqLIvIfhgcZ0aCfYuOP7++j5z7eINhPWLm7PIx?=
 =?us-ascii?Q?HBDbo5iTBra2wP4x/7xgmgWTL6fPCIUMC8euMERiBqdGxzM29oRw0UinIfm9?=
 =?us-ascii?Q?4IS9TqBWlO0DK6JDl3v+fcZ7d+QEa36Sk2MeCRDgIrKJAJ0FZlGl+nTdDiOC?=
 =?us-ascii?Q?jPsOltVuYno0nQ7nXao0UdEyAJToU2imZrOfDBADF/0eAw9/I/NyINN1tDT1?=
 =?us-ascii?Q?x2IhbXLqFYnsNusg14cHo3LP5CYRNSqXhlDBqQtV2I/zwwekYadCqF761ExK?=
 =?us-ascii?Q?4YqkOzHO75NlcGKoFAtJwQuOU+v7zehrLNyc/IVkmyzadfPljwfGB9HZbJwO?=
 =?us-ascii?Q?dRsx6loYwL8SFm/56MLLBDkYmBlN3HzJCbvIGNgbl64lseVIy+piYQcZaz1F?=
 =?us-ascii?Q?+I8oJ7cQL06VE0UldcHfQdcK0eCLo1KuW9/elGvo2fBaHnIQBOfPzcdTkdO1?=
 =?us-ascii?Q?MlW+BTAts6I7kDUOo9K9VlV7apBY0v9ptepjUIz33LZ+oMdB08aIdVnfBDXT?=
 =?us-ascii?Q?pk1azD1VlugtiYjYYU2xrCHTVp6oESf3O+niPfgzfHWLViqwKFYx2Ka29DTt?=
 =?us-ascii?Q?MztbLYDg49/irB6KqV1tv+yORzlMJTdeJGXRUYFWFUT0ZqaU8QBeh6fMYuac?=
 =?us-ascii?Q?Ms5c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3603280a-0fe2-4e6e-19c1-08d8ba686556
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:48:01.4194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkQ22z0rXsFdsMqP4LzmsP1PIA7qeJ5ks9fcgAUOgzu9K+LbmcsS18+gLL3xCAj3l8uhHhalqovmjiroam6XR4LdkM/rmF3sgwIHmm6BccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.90;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench_block_job.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 9808d696cf..a0dda1dc4e 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Benchmark block jobs
 #
-- 
2.29.2


