Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763C41C618
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:51:20 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZzT-0001Yi-Gu
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjb-0000RG-PT; Wed, 29 Sep 2021 09:34:55 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:35945 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mVZjZ-0008EY-Nn; Wed, 29 Sep 2021 09:34:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJPW1OJba91oGZwTXm5tqqed07e+ZtNVStyapD8nsCl8MQ+W09cUMV3oMWEYCPlfMv9kFbtu+vqz4YBqlxuIXRx4/3udAvrsNdBDSQlb6c1VaqxO514zJhlqipZW7L8F9/Ns++2spwwpmOqhZjmBQ8V/uSUC3RD4pT9AVMtPhkHjLYOnAf58qu5GGAok39/KT0NSsjKaj8LVa4NMk4pQfgXY21ZHBetbmlEMRk4+3kuXK80lm1tz1uiAXAGo3EME4jLXP7SMGe5d/OyDRJCbn6IF31F/tmAVjOpqscrbw569sh/8It7UBUxqNI0Pvm3Rh+QJA7T0u4htWbB4TKsXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Y3LdQRnJ2QTA5eAUOlppRohMvM7bxUAqSZp8XXErlgs=;
 b=MOx1jcKx+QX1RK/Fr6yhppVlrvxVEbR8sVKYTut9sbwq+hnuy+3OnVaP2c675cLzNsDXpdepgqc5WE5W1mFdA1DAxwce5NaegTuhA7ZcYza8CZQKGz0wqD7Au4xClaYixNpSTFmz1JG/Dys8TmrMaQQZATmbVo6XQYgMt9yUEqJ2kj9RqD2iaDum/pcOXrIOWicj/ThWyYvv51zRponP2tPXTV1M0BOwsSa28wN8KKT9/9G6zj6ael3t1I1OAl+B9UwZ7eWMw+5tDb4wiAM1cYVV3/XVsavWqF6b/5fTj4Ui8abAz1etOhxdXV102s3lPkVUo52YqOAAU5JM6KrAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3LdQRnJ2QTA5eAUOlppRohMvM7bxUAqSZp8XXErlgs=;
 b=tVvZrt/XOlkVCNXl1RbfdYP56qHcbFyu5BG8QZ+XXaN9OltR8Wg8xn+alOxLVBtsflnGu+QBZNB6gTzheSXEqY8DNITnxyAp2E0AIFoEuEQ41HstV1abKlNHdrUQeOV6cl4hXxE2dm1LBDnB85Si9VnSgSkhyGqTmoI+odM4X2E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4022.eurprd08.prod.outlook.com (2603:10a6:20b:b0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:34:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 13:34:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 4/4] iotests: add qemu-img-compare-stat test
Date: Wed, 29 Sep 2021 16:34:27 +0300
Message-Id: <20210929133427.44923-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210929133427.44923-1-vsementsov@virtuozzo.com>
References: <20210929133427.44923-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.227) by
 HE1PR0102CA0012.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:34:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8742b35f-d570-46ce-74e9-08d9834de6b2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4022:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40226F22C9A8E7C82CFC2671C1A99@AM6PR08MB4022.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aN2rKzUI1RQN/d1k+D7yWPRXObzZBsh1iE/K0dGjQcbY1kQBupqeBQ1DFNmOfknk2n60HEJmjZqUrM0Nh9wHFpb+pceWeqeRozDvwox8rO/rkvxlkj150FP8q7tZyi63Bm0h1UbEOlS3vj4JH0RvcWhZmYg2+q/c3bsl31y04UuYfPTCU1mdxNH4xm38t1v0jKkkMKUZ4d0ii8lUuflE8r6KbLFJvfq2ICFgkV4J4RuCJtJB4dhw1GGDLqEiHbB9Q6F90ff91QRAI6kC3ejtjSJ/+amzlIIFtofODzJqOjRauWStsU/F6Kz/7hI4v4K/SBBSAca6Wi7YkSW349eGfBfLSbdi+sjdkNZUmBiy1j8KwMkYp5PaaP+Zzi2dtHVEIY7qh5wy8nz5Wgk0npg5SpAVw2MV3jdmtj4ZzVZizyJwyR4jzY3rJsbaa+T3Ny2SQ2qQpE6dsSY+oshTVf9Zk3AoGaKv4V5qwHsIXHNTEJWqL3Ft9foWI4UJcIzuVziamY5IvqTMcDIlWm/C9JRNHo7Kw0LS22rKFqPS6FSq4JhvrEkHO+6t+kfJOw0ftR5MUjz7jlO0eS23W2qKE69HZ/sA8Ia/roF7kgVzHWaAQ4FN4Y6sceW8226ehv4/uv59ogpmm7OnmXl0g8S9CXnwkvvETagethmD0812zeOTQJXbr/hOIsdxDQHwnXYmbwfhjgDb6S4hyyuBhW656K7Wiag5/N4EcWvvgoWMTDgvK255/dr65rsAGLc7NyKDaaBOGdxT4pXmMO3MFobbRSq+dXxzm1O68w+Q8cZPDFVds76rYuNCO+9jrv4W4nY+v/xm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38350700002)(38100700002)(8936002)(956004)(52116002)(6916009)(8676002)(6666004)(6512007)(26005)(6486002)(2616005)(1076003)(107886003)(2906002)(83380400001)(4326008)(508600001)(36756003)(66946007)(6506007)(316002)(66556008)(66476007)(186003)(5660300002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NtE+LQnPOQX7fdJgzUTjbnsg0G1Wn9GvYI1uoD4kc4Y1UVz6IqKCy12a3nin?=
 =?us-ascii?Q?p5FXqOMxWaPO6yJTSsvEGCjEeOoSl0MZjVSw1vSmc0id/duqSMuEPgkzGzz5?=
 =?us-ascii?Q?iq5uRDEQZ1JCKpDzai/VzqKs+qZG3nnTy10FzNx0T1j2DWkY2A3WSALzSHo1?=
 =?us-ascii?Q?1f8NBASBSWGBORRsf+SmAOG3JOU9PcZrex2asAFlnATmqt+j3MNdzlbRcWkU?=
 =?us-ascii?Q?7UddR2D3iE9WjUBwJUdhaHhSPHQrgiG0cC+deWZ8xcfG4aPUncuk2ns9SYI9?=
 =?us-ascii?Q?feoKzmltpdAoGDxrpW9SWgeYdYwSbh/yZR0kfM8htmErJko2iCVCjZ3ed4ro?=
 =?us-ascii?Q?cTuYRVza2Z/TGV1x/hEn8v8FGAKan0QcPx6r6Ye9PnyYNoUyji3VhsmxgzTC?=
 =?us-ascii?Q?mahhJ4XHk9726IcGGmRt7pRyYKYGvyHQwG9dxciKiQTfLsQRj0d3cO7lVZLD?=
 =?us-ascii?Q?6fxi0vdB8L51nqE4g8e9awDqoQ532C3L3zPz+xOhov5QwkwTZkFBOISW/6VK?=
 =?us-ascii?Q?1jrQHtjtF6OJ3HLPf9Hc/2xMru6OTcH1GxNAwY21wCnRYndwsX8lqpNf7d5F?=
 =?us-ascii?Q?3psDW9+S3STR6X9G87eIbI8pt6vu0CeQ4hkcxumu449PBxDfwy5Xx/HdKbpz?=
 =?us-ascii?Q?xN/2V5KUASyEwYT0fi8HDOovuizjlAp3Ezh44uwS5DgfkLmzFnCUyyuFfwYj?=
 =?us-ascii?Q?elpUPMUqKJ/ZJJA6OkCXdHFWLRga9J+YYPikOpyMaZFgesPVnB+zoSp5ODW/?=
 =?us-ascii?Q?qRy4HHe6CfFDhfpJwYicovi+brieix5BK8TuGuznDqsHOKUIQH+Y7uvkdsjF?=
 =?us-ascii?Q?kb40w8t6fMaP0y9xirxk3OAExwQCLe4Y7sOJC6Dzex6lC2Yvexso9RemawTF?=
 =?us-ascii?Q?lGr/LyXHEeDHgk7fpicF2jMrrQMU6Lui0dehMDM86tOcd3aoBF9LB4LpJzQj?=
 =?us-ascii?Q?zO1ewYMAbxtyTNYtKm6+pEQRXhSnvg7/VpTmTSr9hFZp2M6aL/pl9djQHlCO?=
 =?us-ascii?Q?Xyfr1H2In3Ot0LdrgmuBHYu3K4xSXOTqwOw+GVbX1Jisljm7GK8vH9X5JOQN?=
 =?us-ascii?Q?DIGjSy5W3KuQCMB5MFpFgkOojct3I5/MO68gXASaZFb9nUpwqaZ1fpWnTe4L?=
 =?us-ascii?Q?yqvS24XDMhoo6nCm/2om+dr9ccaGWyWRpMFLo5LSi2u0sUuO36EcWo66BQCz?=
 =?us-ascii?Q?VJy5Al+TdhfJei8DHFeABRspVozNxbuBIhAMDri8osO1pbbjtQ/MA8FgGFjl?=
 =?us-ascii?Q?uGHrE0iRGJHHj8Mf5NHbG0HwRHyq4RvZBuc0/bQV9UF6YcUHMWT6Zpg5xRU3?=
 =?us-ascii?Q?WVczuP+X4V0P4d7K4Mx6cuf7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8742b35f-d570-46ce-74e9-08d9834de6b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:34:45.7712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBpNE9ZynjFkGv7ysvIGfKu2mxbB6T3aiQeii5kWMao9RZw3V18QuOvj4GT2rzNc6m79LkSgQsU3udaKTPjAxW9geQ8+s0b+RxQo6cuwidY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4022
Received-SPF: pass client-ip=40.107.21.104;
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

Test new feature qemu-img compare --stat.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../qemu-iotests/tests/qemu-img-compare-stat  |  88 +++++++++++++++
 .../tests/qemu-img-compare-stat.out           | 106 ++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
 create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

diff --git a/tests/qemu-iotests/tests/qemu-img-compare-stat b/tests/qemu-iotests/tests/qemu-img-compare-stat
new file mode 100755
index 0000000000..e2c0bcc7ef
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-compare-stat
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+#
+# Test qemu-img compare --stat
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+from iotests import qemu_img_create, qemu_io, qemu_img_log, log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+a, b, c = iotests.file_path('a', 'b', 'c')
+
+log('= compare two images =\n')
+
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '1M')
+
+# equal data and zero
+qemu_io('-c', 'write -z 0 64K', a)
+qemu_io('-c', 'write -P 0 0 64K', b)
+
+# different data
+qemu_io('-c', 'write -P 1 64K 64K', a)
+qemu_io('-c', 'write -P 0 64K 64K', b)
+
+# equal data
+qemu_io('-c', 'write -P 2 128K 64K', a)
+qemu_io('-c', 'write -P 2 128K 64K', b)
+
+# equal unallocated and allocated zero
+qemu_io('-c', 'write -z 192K 64K', b)
+
+# unequal data and unallocated zero
+qemu_io('-c', 'write -P 3 256K 64K', a)
+
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare two increments =\n')
+
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, '-b', a, '-F', iotests.imgfmt, b, '1M')
+qemu_img_create('-f', iotests.imgfmt, '-b', b, '-F', iotests.imgfmt, c, '1M')
+
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 64K', b)
+qemu_io('-c', 'write -P 3 64K 64K', c)
+qemu_img_log('compare', '--stat', b, c)
+
+log('\n= compare two increments with --shallow=\n')
+qemu_img_log('compare', '--stat', '--shallow', b, c)
+
+log('\n= compare images of different size =\n')
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '2M')
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 1M', b)
+qemu_io('-c', 'write -P 1 1M 64K', b)
+qemu_io('-c', f'write -z {1024 + 64 * 2}K 64K', b)
+qemu_io('-c', f'write -P 0 {1024 + 64 * 3}K 64K', b)
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare images with only 512 bytes different =\n')
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '1M')
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 512', b)
+qemu_io('-c', f'write -P 1 512 {1024 * 1024 - 512}', b)
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare images with only 512 bytes different, block-size=4K =\n')
+qemu_img_log('compare', '--stat', '--block-size', '4K', a, b)
+
+log('\n= end =')
diff --git a/tests/qemu-iotests/tests/qemu-img-compare-stat.out b/tests/qemu-iotests/tests/qemu-img-compare-stat.out
new file mode 100644
index 0000000000..0dec76feb6
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-compare-stat.out
@@ -0,0 +1,106 @@
+= compare two images =
+
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z__ -> _Z__ 720896 bytes (704 KiB) 68.8%
+_Z__ -> _ZA_ 65536 bytes (64 KiB) 6.2%
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+_ZA_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+Unequal:
+D_A_ -> _Z__ 65536 bytes (64 KiB) 6.2%
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare two increments =
+
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 983040 bytes (960 KiB) 93.8%
+
+Unequal:
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare two increments with --shallow=
+
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z__ -> _Z__ 917504 bytes (896 KiB) 87.5%
+
+Unequal:
+_Z__ -> D_A_ 65536 bytes (64 KiB) 6.2%
+D_A_ -> _Z__ 65536 bytes (64 KiB) 6.2%
+
+
+= compare images of different size =
+
+Warning: Image size mismatch!
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z_E -> _Z__ 851968 bytes (832 KiB) 40.6%
+_Z_E -> D_A_ 65536 bytes (64 KiB) 3.1%
+_Z_E -> _ZA_ 65536 bytes (64 KiB) 3.1%
+
+Unequal:
+D_A_ -> D_A_ 1048576 bytes (1 MiB) 50.0%
+_Z_E -> D_A_ 65536 bytes (64 KiB) 3.1%
+
+
+= compare images with only 512 bytes different =
+
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 983040 bytes (960 KiB) 93.8%
+
+Unequal:
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare images with only 512 bytes different, block-size=4K =
+
+Compare stats:
+Agenda
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 1044480 bytes (0.996 MiB) 99.6%
+
+Unequal:
+D_A_ -> D_A_ 4096 bytes (4 KiB) 0.4%
+
+
+= end =
-- 
2.29.2


