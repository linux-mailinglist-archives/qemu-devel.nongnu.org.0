Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F72435EE2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:19:14 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVAH-0008Vc-PH
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4R-0001Zr-Mm; Thu, 21 Oct 2021 06:13:12 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:9813 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4P-0004tm-Od; Thu, 21 Oct 2021 06:13:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WL++FuXUz36rcL0/kpnv1eX29XJIg9N+sg2QCsWhJ2DiFxT5L8W6MNbM3jal/ee+oUG9V3TpihSbZF8zch5LLXB67p8+qos2C+AVFBzHYMtZWV6XAVwnXv0HguH0ka7jCt/cAFDbpGzHjxMkgU1NKOgVi6y85V8IxMSHnyqxtak0NgAwyswojqbx0m+InuCKcraIKp+7p+crbedRILQz9Ltcxj8YNWUOEHAkPNgVRdmBJieKaV5nMgprdvTQSTAnWM8qENPOEv0DDr2o5a7lEUUITtRzxKVCaFysGJIkrIgDL2iKab+z36Z9ZqlM+bdPwNvBurId46lJzxb5z11gHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jNns/NsuhT7+AwvW8iFq+MxflD4KTgF1DQ95DSMeMs=;
 b=ezae7YX7KVFRPaT9BBLoFHbc+iw/QBSWMDfn7k4oB0RmekurwJAQAKnbtgjzRGLbgbigVPzQfTfYnqWijBSXiHxda1rxv8Kq8EYpjKEk7lLlstEm3te8A16hUUHmoSLJNmvBGpxkJN48Et018kOFwowikdvpfLMhAwbjLQvUm/hOtv3yV1GdF5MDkqIj+a76AmQLVLMP8qSHzbVRB9Ej0EYTFIpkkEeloNDdrKB703c5XoAOgJmISdraG0T1fPBchzp/KZMydWWjKcHaNqqi3pXKpEvWAFug1MhEt6thtcBfU6I+j6gvGG2w1UGibNsOblxA/7AWA9MZO4+Km/Xwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jNns/NsuhT7+AwvW8iFq+MxflD4KTgF1DQ95DSMeMs=;
 b=m/NsXmrxFhYRa7pOiGfMTNc3Ux7gaIWpPyBqzDJZX5tnkcFRqf8CtWYtBVKhgcQrmlzsFSt0UcUHQNfUYMdk30gLOJHqamRBm+cKuLyHkE3IAs39zNlh8af4t/998qSC3LojhUgxg4RQiYtJmyLR9tpRjxpqaamiOC91cqneaNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 10:12:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 10:12:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 4/4] iotests: add qemu-img-compare-stat test
Date: Thu, 21 Oct 2021 12:12:36 +0200
Message-Id: <20211021101236.1144824-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 10:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36adbbb-29cb-4433-32db-08d9947b55c5
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50782B266ED0BC71BEA733CEC1BF9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lR1y4kMmHiPFpbgj6/0ns7Da6I3OqtoTAWXghf7otfHCvgpoXVJBsIP0PvIAOWbG7I+a1WIoouukFs68+DZ+thSyoUPuOEFNdpaxiGgD5UOtUqA+h5RohKakL9OI9uuWKSyOCveVB0Ddd8W1diGptfNZj8GGdE8WwwNuvKzkZgfcnj3mSy3AERCRsAH/RyyXYlLO81jwwzQ2hIX805gUYKcWYINijK1uPsfzQ5XXva43sr1RJrrG6ZSfFn9NfqOeaXq65rOI7zbVhWHT2z6jmNdyl9lj+Y3TOSG+4DXmtWKLXi41bwMTU6Lohpj5dxuDtGsYZJ2ivnRKpQRJ3DuWHamBfmxgQYH2yKTozE/S3NZo+7AtBvt/8INSgOpV4/teULQFaGTwMEhYbOmlKHyw3wtmBBF0OQBc8Ag9N9MPrOptahMNmslV35G4rS/eECC8+OZPIPFX4d9kVSXgHW7HNVJ7g2qrHLomoNFy0ZAG79GOwjOhynhXTo7RAXHg0//GmGESSo6VCkCdz+PBH02MNfKBtv+eKXRibZXQh+ra+XjV/601WNFppxSTnJVt6YSeMIj1VfTUMoBQ5vRc9IR1eyt7+qcVLPIbJy7Yk2LKn6PmSSBzUTsertuW0dqvKeq8QiHQuisG5ulyILJ/txIyTM+cQpM+kynhkCaY7dQMJeNd6khBbxIqB5FYPIKGo4LhFiZmzcJvvlhXQYOXHRSpok3lPA+G/MECPBgyqry2Zo1d1OHS2ImISjMqU+KkqLT096qpCqb0EyfoZ0e5DMfr55p/ThNLYq7TSOqCLAlFpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(107886003)(956004)(66556008)(508600001)(83380400001)(66476007)(6486002)(66946007)(4326008)(86362001)(6512007)(6666004)(6506007)(52116002)(36756003)(316002)(5660300002)(8676002)(186003)(38100700002)(1076003)(2616005)(26005)(38350700002)(6916009)(2906002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sSzaRfvbbEXRMYHtNVS++ty2mlT/CF25Ond79GYPhezPmLc4iVHvDdhWEwYw?=
 =?us-ascii?Q?is1M9XB2TOxNRwSd6yDNR6ob4xSn025tcdoWF8l/aJIL1PkLcAu3cbZ2jCwM?=
 =?us-ascii?Q?1d4s/hASEtpossp4kwMGDaWi/wyaKa4ZWjTRym4yu8IQe7CudK9YGVVHlyaa?=
 =?us-ascii?Q?NfhcFyXjJSa2clrCMBl4tCEaEWlY6jzvYO6wdYAQ0TOLcyh9y0/e5aBq5jrj?=
 =?us-ascii?Q?v/sArHHBKfR+LxzT2fvYA5s7t3K+Z2MijS/1Zrq4/cHg3fBulo6hipm6gOVh?=
 =?us-ascii?Q?37xA+z+j/wLIMAYjMcvOB+aWTgXUq/h+jQw0ZyR0Op48NNcieip6c7ZtZZ5o?=
 =?us-ascii?Q?OFoQzNKFNeurMKS+rmB9UI2koIakASwR1w65MoNnmq4BR0RnPh8f1w+uOQaT?=
 =?us-ascii?Q?UuSlobbpuAmaYapii5GgBddYqfyZ7x7VxSqwWu3fpqcuyV5gVfQ48F4HBtIY?=
 =?us-ascii?Q?SIdn0PDj5yWH4ApwD4qWcarq8khvRBDCVMUoJ+Q0oY0ZSQqpeZ0dY4t2sgUP?=
 =?us-ascii?Q?YLZPM73+UCWWCazf4r4Ef2NTDyUIa+oBHCmI+G12388s2Qe1EyuV87epGIM5?=
 =?us-ascii?Q?ed7i0vvBqXQQszoIN3Coa9fC+LjlVWHfT6GWtJ2Aeuj9LPTyilWM4+2Iw7bi?=
 =?us-ascii?Q?P2F9pGv1BrjgtqGl84UENKbyydmtZVAbpAEZ1TcSQ/kECYzJwnDX3+or/6sn?=
 =?us-ascii?Q?vDFK5WAEHXclFwCF1rVf/8kaX2n9bvXaZ4lng2BMTiUlybgZVoC6UC6tOnP0?=
 =?us-ascii?Q?yHUfkSuz2EMds+N63MYNSvDzVwJSB7qgIxF9IOWRo8tTqguURDcAP0EU1RJM?=
 =?us-ascii?Q?UFq/Anopfyg6W97KeuAT7m6BvvSzeyuzgmZgykmZuEORaemVt80kxfM/K6/J?=
 =?us-ascii?Q?6RmiiW1BLOx/+5JYcqzin/kM1q4vIehfpcJWfb9mjQ4iJWatEllS9EsokKa6?=
 =?us-ascii?Q?AJDVKjk7ozBGkvs8dj2RdeqFA3VegJJ1gsT9zhv4grUrYokH+z2JyIaJhbJD?=
 =?us-ascii?Q?Y64+DwJ7F3ynf5iKoXBDz4uFaSGS4DQPKQ4xp4iwzvmNE6KU7C8yCdfEG99J?=
 =?us-ascii?Q?ZRRRr+aN93bWVuXCj0a2IP2S7wuzTBE8riPZZnC1iizWR99DdERCODzswxGx?=
 =?us-ascii?Q?z6/g2THw/hs0/wZQxHunxT8PYXlcvqa9MGidtCBlAtGqpPog+UYV3xJJP+Md?=
 =?us-ascii?Q?O8aCI21UXegC24xUn5aFQ4oxVOi3nccJqmAD4HSW6Nwmrsl644Y+hMvKj/hp?=
 =?us-ascii?Q?zOhzWnrLxaMFPS3nxrakdgmzj1bVveIsfRi3uVk6ir3gplzoAqIKSLUQHAWd?=
 =?us-ascii?Q?14/LvmlL+xIRIico7YWeWnNeNaApcj2aDu3Fl1BdzN0fq92sUqL7hXZbpJnI?=
 =?us-ascii?Q?dEECBw+MN2ro33lFYK6vbX8K4FlBzBEbI2SD8U1116XekLrQCYSkIzrYuMpZ?=
 =?us-ascii?Q?JeSNPvzfxoG+ai5h8ExyP24i35zeYj+d?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36adbbb-29cb-4433-32db-08d9947b55c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:12:49.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsementsov@virtuozzo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.21.114;
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
2.31.1


