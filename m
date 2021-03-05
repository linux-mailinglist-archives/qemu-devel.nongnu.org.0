Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A8932F2C4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:36:50 +0100 (CET)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFJh-00028B-Az
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMW-0004my-1M; Fri, 05 Mar 2021 12:35:40 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMU-0005C4-0t; Fri, 05 Mar 2021 12:35:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOiNeRriohHXg8wlftsSnnPWfMXP03xx3mpeyMCs6kird8t6NBZ5YJsYXqOecIHhmeHxrnwuTB8o3cQI1MQB7LH5SiRineIRIivWfPKaX2tl4u7r9xKoiiBimzuMPvrLyCyh4+lVJDa82ocLxCy2iHqq3szpvPK6NPCyU0LDWIqEKfwqf8zFYuNJSaDpJYMwrzSzeSnXIjSDHsf7U6VQZlmnKGyIXG+Tqu2EoyGKpmD0lAxaRGe6GApEJZnBg3fH0ysAYnzTpTXr4+BbyoHGk0CrVKD1B8LIX/nW2ee1sQxXlo2gVUMOkagHkD83bz/ythkG9AWLtltIC3ZCBHXi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=Xk6pZYc52P6Mr8Pr0WR5sDTco15/WDONDFAGTREV4X5VSbyFeWE7ZdT0wIv6a5d56q7h4569OJ34jSXa54XblQMbq40S1aOt5jrJQ17GzraFSma8Om91/4gpI0GxZ67/45+R3NpcUk/WYI5A6KPgMsKpq9DYxHhvsWIKqDuSxMdsROvq5e4Klzk0bBd8c7ZcxzVtcKV9RGLD5tMPnBHJ7c1wHy4sBes3wBy1rJjCjmIpATiHrMtXDub+8rQawTTTYO8RJ+PSsyFeb5gBi+LCFJ8Mxr8ubMum1CZTWKGKmWCYwoR3MqD3jNmJWs53DLhYupQVaEj3EES3p6UKmxeykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=t0vYq4dlB6otliWusoBSiLhMX4LoGLUMXN3mmc4iX29n6mRVUrI0HlNB4EZfrZQ4kOGL4/C2yml5YXNO148Vqh7QF5eE2gQjYMMTOOvZQ+qSyI5bRS61/qvV6DjWXBlZ9p1kfaGEWLWwE5nd/XYGou5j1WI+bUSXMxI6L0HQGHc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 2/6] iotests: add qcow2-discard-during-rewrite
Date: Fri,  5 Mar 2021 20:35:03 +0300
Message-Id: <20210305173507.393137-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb09c3f9-4313-4d06-6278-08d8dffd0fd8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4408C10BF5158F2F0A041F2AC1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrFI6hczVfJQ472FMlivgjBHm/3mNc89moELM9Cn9oy3zCkHeMSBJnyUp5M9AUfEgGM0UUu//5wzt6QYPsvhK9NTa3OKHv4Q2wBB3NxgXG80+PaiveTfnbXGUGbCmpw79JafYER0xSKtzhrTHv0QRZhO5G2CzeY8L8xPUhc337M9XKDOdFHD0uyQAS3u/M/L5UP03Pn+kyfHn+aBApTC2PRxOcXnMYk1iVgvAleNqmqgFljGmLjIy6fmsEeTFjDPWjtZo/d6XFbP0lEX4gMLrU7fIv4PGL1QV7yUYNJ/7czsJsLh25ELnjOVPbjMhNg3N34RcCevYplRu0kmegVJvtMJ0WaQyCv4ZI9HZ51qEhpwGlWZCCxCARxot+klEVOLV4ybliu7I7RDD0DHP2P1ghXHuh3dma9Z/VO+d6/gQa9KlcDDEyOAwjmRIGyd2TND2Mntlg9ams113oF4kJCBnpht+m1X9tw5xo2AhQJQr9V4MlFd7/vrEHCIktTTFtt1S8JIZ+18PUJ9M7E+IYy9jLpErC0avgRm2T+gLG62D7+hIyPzfcFD46uDNxe6/fYoZgIZZwsibCauPIUKy2eSVg0oQlxS2Xqrdi37zeNhcyhZsRoog/dfXljSj8MmiZtUU6lDWCKzkkmWmMYfZdVHXawKtDO5taGWXajBuy56wzCWo371wrj+ibdj600htERRXwxPogB6pKX7QI793bm6JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(86362001)(5660300002)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?49nsfyEgaMwBsFKsz9zfV7gXo0PrYEM+2FdjUv5mleWq36KRrrycyfVKYZd9?=
 =?us-ascii?Q?BKgs1Xbn2IgxdSDxin/pc1iSwUPVyqjyUO5LQTjjzQVYSKx6bWZKjRo0D7ne?=
 =?us-ascii?Q?7TDsZ2GiTPhuQjljsC+C2fbYHw8B8u3eH6egpbk5Xj4F1eEG1AjQkvIaELj/?=
 =?us-ascii?Q?vdeB5lCZT31MnYQQQojsbq/fRGfyaXSeYdhxX1M2rXUOTB4eurwamegX4UMV?=
 =?us-ascii?Q?s5RvzOB5VECRrP4G5imYugJycyVsEgXClUFFJb71IjSZEj6vLiiQ+M2FuJHr?=
 =?us-ascii?Q?Cd/qHwXjgwRjQGmbqNK+yZRh6DLR4f9S7K/dnOOCHkTsxcPpN9ibLVWKCndO?=
 =?us-ascii?Q?im7inexKkg7qL9aF7lbigFuBHUTW0otRawzow6kuXvgmmtRVWcsfKfiNBIym?=
 =?us-ascii?Q?eaR4j6h2IP+0ygQ+hAWjP2e8gl2NIE4NqnaH2hfAFpDk4SWlbtYvRPEHIfmn?=
 =?us-ascii?Q?oEZxtbM75r3zXDivGeHYiRfoZ57MrCpnLvYXUuCeo5Breav2jhrmMWlPcqsn?=
 =?us-ascii?Q?nrux7reCIuhBWLfDEi8+oWWOwXGKDqTKhoLyQD4DNZ8g3W2x9lKDyNCzwh/Z?=
 =?us-ascii?Q?YaSbiVxgwpLuQbkQ5TTTT0Vsi3q13VM+/rwTgkPGP17dDUb5LWoJ74RLjpo1?=
 =?us-ascii?Q?yyF1tbXGbTk5beLzzlw7pjfKIJ0LN2pDcdXzW6w8zjTInEKOrJMAyvt0tRsS?=
 =?us-ascii?Q?esQS44hxrI74qG2QRonpCc73XajM1bIot1N7g0mabIJ1Y2SHp9O9K4QePUR0?=
 =?us-ascii?Q?R9TwjVmizsvV8zQly3gHKSBXLcvks0sxhCGAim3tGBs/NcN43xTKZ6plJpaH?=
 =?us-ascii?Q?whjRJwmanOddCcWbeDDSaJjMFFUxj9Qh7ROH8MuS9Kny/T4s8h4erkvVgDcJ?=
 =?us-ascii?Q?uQBVEpvxegzV/hbdXgepOBvOKmYyH55D5PAaF1KXfsyFjjhfuaGPsInnvdAm?=
 =?us-ascii?Q?4FOS+SiLrkacsaE10oNHjs3WYkfvrtoQckKLfezpzTnQykv/mbC7Unc8OopU?=
 =?us-ascii?Q?krUrSZKHlSYMFoGYKVSZ7IJlPQaOg9dV3pymKsULRg3wA94+KIhisuwwy0js?=
 =?us-ascii?Q?YjgtKQ6Rggp9+ACNixftKUvnQUh2zqg8k6uCSGKlE3jdA/sbNK0R6BAFNLsB?=
 =?us-ascii?Q?wS6WWTUnHSaaY0xD1M7fuXziYUV+XdnX8e3b02YPABo8jw71TQz1FY6EOXtL?=
 =?us-ascii?Q?oPNQYydbxYXo+0BZ0QgPy0Lg9TJW0EXK7lNxwPeUOOjrbkNQMI6c5ISYdKCN?=
 =?us-ascii?Q?OaB8tFgKcnjwkx31m41wWbN045eyolXpeGYWAR5nFuxkd/T4wC2KhYRby1Ws?=
 =?us-ascii?Q?uzEkaKDKQ1O6qqjK7quKW1Vh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb09c3f9-4313-4d06-6278-08d8dffd0fd8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:26.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+XEAk/JEV+hHh8VNCINx1s+d4LWYKs/1k48rcULCRfE0NDpe2I3rp456kmRv1C1sIrJ+QnXpSyVRKPaG6CRE24zg9zf36EUXHZn4uQxDbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Simple test:
 - start writing to allocated cluster A
 - discard this cluster
 - write to another unallocated cluster B (it's allocated in same place
   where A was allocated)
 - continue writing to A

For now last action pollutes cluster B which is a bug fixed by the
following commit.

For now, add test to "disabled" group, so that it doesn't run
automatically.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/qcow2-discard-during-rewrite        | 72 +++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    | 21 ++++++
 2 files changed, 93 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
new file mode 100755
index 0000000000..7f0d8a107a
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -0,0 +1,72 @@
+#!/usr/bin/env bash
+# group: quick disabled
+#
+# Test discarding (and reusing) host cluster during writing data to it.
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
+# creator
+owner=vsementsov@virtuozzo.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./../common.rc
+. ./../common.filter
+
+_supported_fmt qcow2
+_supported_proto file fuse
+_supported_os Linux
+
+size=1M
+_make_test_img $size
+
+(
+cat <<EOF
+write -P 1 0 64K
+
+break pwritev A
+aio_write -P 2 0 64K
+wait_break A
+
+discard 0 64K
+write -P 3 128K 64K
+read -P 3 128K 64K
+
+break pwritev_done B
+resume A
+wait_break B
+resume B
+
+read -P 0 0 64K
+read -P 3 128K 64K
+EOF
+) | $QEMU_IO blkdebug::$TEST_IMG | _filter_qemu_io
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
new file mode 100644
index 0000000000..8e75b2fbff
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
@@ -0,0 +1,21 @@
+QA output created by qcow2-discard-during-rewrite
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Suspended request 'A'
+discard 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Resuming request 'A'
+blkdebug: Suspended request 'B'
+blkdebug: Resuming request 'B'
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.29.2


