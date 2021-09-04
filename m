Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D52400C1D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:29:32 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYXr-000191-Pv
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTa-0002Wd-Fi; Sat, 04 Sep 2021 12:25:06 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTY-0007GP-JL; Sat, 04 Sep 2021 12:25:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM7yPTKv+GK193PcPYPOtAr08mvVb3g63NDhlz0DJenxBgUWjYuWaFWTm7xbFfNv0Ym3btvidCIU2GwOCZkisKFoF6NqdGTUpKHVUgqKzM8JehNHYEjNYsy/M659IIHAGqF26uVBUcH8WK4cB9piduXggzpaDW9C0ITusBALwLmhGjuqLaHyCiGqaltGUuPsLTofZU6bZBu6h4nZD5drgwDf9uFgYRZVlANY9WHakwnrdnmiib/Bm5uJVt4EjAEpi3LH/WVEaxH3xQKct2+0t493Niq3TGu0ve8lUYKQ6nVbRsuxpTfaLrYQNvFY7rKKmjbaMp2vCft/+IRsp/xrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=JtG4xI0lCvzV9V9FohbbSLK2QMs0s6H2IQ0t2DvXy1Afnz7AU7ARYi25EceAuK4qFtc93xB8ix/tenuutwHv2A1kcToWidKnF39mIVvbNNaLt7AsDrjQKBkBbabdu+gXoa6y2F+Zi2JUVixBrro5Qm3nJK5ol+o4R7+ommjvh7Fuj69Q13PzT8bt2K990Qu25kKsx3FZDbBPwbQnlZ+RNXdRn6b7aU1QgMEchlj9NLRxt7BZcq6vRFQqic257SVxMB6PhRJpfWEOBiX9/iFJWur/4pjcznNyPvpNA6Fa7vR+obvPlRB0YlgrZnyhPK6egOKFtzkvXTVfHhhV7/+4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=p35T+IVplt6q1WYD1mZg6sgmEc3d//qja/V0pjpaSSE/B7/BAMUFpirPhjLxdnNVw+buA5sDiwSctsviNQeg9RRRnfDUC+rBy+NjnVbtEwt71L8rO60/kV645bGH905ZpGMEJq50Gd0dGwoQUgo9wsJTbk4NQN9dSq2UaelcMsg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:24:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:24:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 03/11] iotests: add qcow2-discard-during-rewrite
Date: Sat,  4 Sep 2021 19:24:20 +0300
Message-Id: <20210904162428.222008-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:24:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5ee6d7-89b3-488c-ecea-08d96fc0889c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69045936A33831EB3ECEA0CAC1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8HL8bAtNVY/tewHn8O6+Gzx77utvbBCd8eAWxsIkCcy27of0hJXtvBOQCqHAxhiOE3FpT/M4wbUiqr1rKRM428PXCyPQMZqImPsXi3Vg97VO3Lze47266XJk4Y5VRhkpkIDGI4LrhDVkBCjSflTfLivYybh36GsLnG6ZHZZq/oi8j6dvM/CldXHEdlzudEHKkMOe9agjfQFDUgsYcsK9RkBtlfFre6VwmiPUbGCLBSJbQ1JgTJSh5JHrDACd+KUXhGQUq5J+3FjHqFLlXsUEdmseTUGmGwjuh4WjVvSvk1a40tzP68Lu6AT6LplzRvhV3TQvMhJp+WYY3ZDHwXkSIZTZyNKu0o966Kqsov2ezxmdPoX0GSxP9KDzr99T7FYIz76S33PpRK2TcXTuAEwjEwLzMXzPVqrcBUpJN5TN+3akFCm83tZGtEpAKuo8KBSvdrNuMin42Yfos/WI3AKUkRdgq/MQeplcn5W1c9OPXBy9upHX5+eByYvwEhtqE1uAG0nVp4MVE5MajkDbgeO4F9w4/MGAyhU473Lco185cW0FNhcrmBlmjF356Vl7Ihy8nq1QFvyIndE5Gm0YmLuDvnHcA3N8sEVJd87y00HyvVKKSNNNqRxGB6ZH2kM6Chresld2RtPGGqjhCaVxacJ8KRPEXyD3d6FFv+hjaSsOQuo+z3GpIFQpwsYU/Wb97WwzPUVf6F3LCFiKnEql5IB6kZ8hsHF5N1+dJuAv4zieKKjZ/fgqYSCxeqFH3/zg74/ZHMuCp2rF0RGXGLGL6rq4Cf6M0IzhNY71edn4AXSucLYfu7dCPUJQGbfGaKAxOGCZt44z0wFMHELNFC8U/XbKuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3ic+ZHSs2yuGHreoqC+nn3aHNr4SWzuNa4y2rmaCzq6Jx0k0Qx82ElSfiKe?=
 =?us-ascii?Q?VZK0QhTc9Xse38qcDmEz4Eb2LbFTpaHcKANXcN3QlI9EUbqWp89igRaUsbvD?=
 =?us-ascii?Q?nv0pVBFF7T6qDF0q8te/j0PdniziIVfnBv4jUTky+GeDW2D2CrTMH91+xh+J?=
 =?us-ascii?Q?J+2SpoFouUE0qF8c/EE5CmqQqA6nJmNfKFbcL7xmBvxNJ50x7FQifxjU18ed?=
 =?us-ascii?Q?1MpGQXFXiLotx4ziOo7l0ZfHzC31xeQeHgp/X3XxJ0e7Bt9ZISpzQSDrNaxl?=
 =?us-ascii?Q?Hap84vOea7DOpTNoJZJexZmm/63kScBX1U22IqEOYSqn3uQOYzMkN/L3sVsr?=
 =?us-ascii?Q?R3DLUQgiqFLsKdO+Y+wBgjYdwA4Y6MjVVDC5wvvd5ulBAKsDrFDU6Pc8RImi?=
 =?us-ascii?Q?+gCty4Lzl7Ek4FAIby2MTaaDO/ie8oS9pldN18nMcVGt6RJ6SCBbkG9kBQOR?=
 =?us-ascii?Q?xwwwHgBXlKNTlO41N6G4y8ZP5oLQDaBl/w53H9TjDD3VpQ0wwyiyHizMj2+0?=
 =?us-ascii?Q?h3Lhu2W25BWjwzc+tHB28LqWd2KKzkxKyD+MsHc4EmeBG6+TpI2kgZXxgQcD?=
 =?us-ascii?Q?vA4WZXZQpQkrOTND30MlebmIL77iZH6IMVSfYWLZQ9WWj1T6v7TKhNmSFC8C?=
 =?us-ascii?Q?3ef4Wt05Zb0PcQZEa9LwGEwqKi6p6yUW41BMqaoXkOfHoa5QE08ExBm+ifu8?=
 =?us-ascii?Q?3QTVc2xY51rccHJ6WD0Ftoz2Q1WafvAdlZaaLbNvQPJCTIAa2Nu4a8ORl6zy?=
 =?us-ascii?Q?6+9VSQ7I7a8+qeJ12jiCqpDtzOsIMTmRk9YaeY7wRe9Mx+td224Zw9nPYWz7?=
 =?us-ascii?Q?N8wEa98OwylT5B/QrJcTaiN47zPJeCBwaxE1Wl7nFoQhmeWyrOc0iRXcuVzI?=
 =?us-ascii?Q?8nXU5vWJSoHU8z57c5MKSiHYTDbfmM3x5l/wm53cqYhNMAOV714sC7k1N52m?=
 =?us-ascii?Q?8QCXxFlnfPSBP5a5H5JpzspOzvAA6xuYdcP9vc+0+4PsVB10mdytBK7WOh4m?=
 =?us-ascii?Q?1sw/HiiAWl7QRUrLNUvhZ6lYaTtU4ZujjS19eFqzfK3nI/V29/R/uG6azesb?=
 =?us-ascii?Q?rxb9FFf3hARp596QIs9ONrBIUdfPqJSPEvlv2MMOFpL1n0uMrQWDRbgiAomk?=
 =?us-ascii?Q?2+FYsI5K3Ww78iG2n5ojqw1s1L+E43tzdULhKNBbpUxJ+3uRx2rPJKGbyyzP?=
 =?us-ascii?Q?A920go7XLQzkjTxCGq+if6l8mhbCj6ghbaihLqP+mnnVWG+dcj0UWFBVgsEv?=
 =?us-ascii?Q?yCnlEgO58hm2jpn/ZxhipJQWXVPI4O3DNMZe6R/AkNg5BX8g0Tx1b+esBQPN?=
 =?us-ascii?Q?w50iFDWWMTdD99QEf9eUowQm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5ee6d7-89b3-488c-ecea-08d96fc0889c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:24:56.7090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7z81eAvtOsQUxZ8hki3QkWTK9jQNDfebti7RwlogeUKfukXg2e6+kx6Wf6icM7GB27+WY8gLXtltHu5qpmbb2kbdFrhsyO4oO9Wlr+xNE4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
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


