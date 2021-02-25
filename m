Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43B324DAE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:12:48 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDdX-00008U-JZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDc6-0006f0-2d; Thu, 25 Feb 2021 05:11:18 -0500
Received: from mail-eopbgr10128.outbound.protection.outlook.com
 ([40.107.1.128]:44612 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFDc0-0006il-Ub; Thu, 25 Feb 2021 05:11:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTGCeVHEB8unz5oGbgj/g5RqwflpQWynOfM7N9WZMRbBEmIjiEwKYEFp2ScQmRI0JZaWv0r7aaWh1nLBbELrlYaJ1QtC2amrmk5EhZAXHKp81It1nNxTcPw59VFDztaIUU8FaVvpWX0zDb6JvDrwwEM7c71R1uRSKO2iG9BYep6z+wUuWM2gtHx9Y71r9r0xANiZMNkxf0ozhcGJX0YY+kETq8l+YoXMHHsKBjz8SaMZcxiibtOhvpQ78td3X+z9sikPVnRe7vtGnDm69a/ELLQg4aRHx9Ex94JsVMmb+c8EIg0sPGZMHTXwuzuQ05JvO4nurTyoSj8aaqikdKBnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=hAUNGdHPTHKtMIEGuUY0bttligjnUQRaQLQVWsHn6zZRD43b4pyyT+FDwe1hB5wSN4jBWU4ivQ+aTkKxxkxONmAJgCRDynhmCqrv/vHCGC/tVBfCT/dum829fUIZMjL6bw12VRg5as04bSsSuBdfccSpILxW8Y14yTdUxEGp53NYjN2ISP2+ZohxVNHKI80enfwrvYLZMYEOEaz1wzjLfKnxkRdHhYqGYXWWCr/PBtiPujO/cb7KeBCvtG9cruGhCAIoPODdguD5NxCdkIJ4l1kSqbfqN2KDtazBL6g35ItKypqEQkvsVVBbHjFjmv5n3H1zxCvkSI6O3P6wmw2RCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=euS9U3N/vKBY5ZVxiTmBqQ4PzoMg9jO5FmYdXk2Gb2gVwQ5L17ZAtdqSneWHs7c5jVjv5L67iTEAGpvcmytrJTviaitX0q+MaSfkO7nEBO8Er8ZHd6TJTIpMDaBv41ziGe4m4O3+2heQBSyI6vIR/G/ZzJj0VWvY7VnMQjy3Wzg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 25 Feb
 2021 10:11:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 10:11:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH v1 1/2] iotests: add qcow2-discard-during-rewrite
Date: Thu, 25 Feb 2021 13:10:38 +0300
Message-Id: <20210225101039.165730-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225101039.165730-1-vsementsov@virtuozzo.com>
References: <20210225101039.165730-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:3:76::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:3:76::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 10:11:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aded124-d2a6-473b-e52a-08d8d975aaba
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5381D4FC1DACE315EA8879FCC19E9@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5J3YoSmiG+DNad094luRidjR05/CURzDH3aT1BW1R/dK5+p09Ud0x0WNEDxp39FMK+7Epe47CmQL6TI8E3CdhhXYD5XC17JDh0LqBLzuez2EA6t695Y8VtFbflBbvZxMr67YFUjv/kceRsc1xhQzGJft6b5P2N8gmZ6B3wI2E37FvUqckFpZ60VsturZBNSakYqy5noXKlA7osGgOpqDBsBc82Cn4T4bXbh+w32GPxP/uRuWezPxnMNOkQoI35VpSeUqUwd+S587Wl06mvGr+55RgrjXezl4rnIjDI134GduktzYElnQmWZAUYgmdUC0ViuSIW0zRNdwGZDFaAn0XiSjq00C4U0eCmaawN5645UwRFZHPw/87lOliMcUYY6lFUYumf0r/0vGWP7U7v4GdrhzSLHqO28lYXutiTuWSzFpciNkKoIeAz4kXnDpU611AYqnieacocCsBa+aNsORrdEPjrKetqAxBFfNykykfGlkOm8ros0zSVV+aOvLcJ7DizPkn/y+eBWdmC7073+VBavhX4FJ+lnzkUfOyrpU/3s5eIV1HDzOAD5Dn3+El/ZopVli1AFVDynZlvaFmZ3VUcL81SoLbECb+vWb3vmVWNhQRftlAtj1BW+7TVTmZRJxoHAD7Sl1F32x9GrBzaEgQnnvvQ+BLUEOajwXVhoxQlNiit2dgp9qrPMoYZxD8UZLq64dknxBLG/wluPmaDUog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39830400003)(376002)(136003)(8936002)(186003)(86362001)(107886003)(956004)(52116002)(8676002)(6486002)(5660300002)(1076003)(83380400001)(478600001)(2616005)(16526019)(66946007)(316002)(66476007)(26005)(6916009)(66556008)(6666004)(6506007)(69590400012)(2906002)(36756003)(6512007)(4326008)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0RU16ebu2BlADFD2aW/76catXeSEtiL4QF+gSuZMmln4kjWj2ogteYANnHjw?=
 =?us-ascii?Q?WWywLxBtbTzfMfbPMMzHGR3FED8olE1VBjk5m/8wkRMoSUYX+OloUrX7QS9X?=
 =?us-ascii?Q?Ojznj+AkvSKo5ZUvm6Yt3xs6zKZgdjcuZ23oWXeaUcFWtbiZEEl3hRxPXR04?=
 =?us-ascii?Q?Jywil2sj6RM6sZVgylZ1RY2HxNh9WS/p57R6kOS8w53KiYcTvv14oeRot/U3?=
 =?us-ascii?Q?E9pobq6p2sGjxtzNm36wnadI8npPxpcWeHWIjIivAQ/sx6dgERq7S4Tf4HPP?=
 =?us-ascii?Q?g1ea3VjT0EPFxG+9unnWWJXJrIaVnYcAnY/aaDvrOQ0wzb5hJwYt3NrFdHXN?=
 =?us-ascii?Q?NoAdz8JWJKAIPf8P0guvdiXAiS5gykR5CsSisCCDZlJ7t1YO4Y9iGaDcqFPn?=
 =?us-ascii?Q?puFwytpmoCWcZIJ5vAX6ihKh57nERYANpR+e0M24gQDHKL+OlzCE8SqnZr0u?=
 =?us-ascii?Q?tEVZPwwpZXhECf8JBQgXdommrO8wmXRiN2sz6RHCdEZ04xYD7jycT2XBPRFO?=
 =?us-ascii?Q?YGLnhh3RTb+m5zXx4VXqkQL4gnp9c8/8P+zEbDfE0faTQbo0Qf4nvm9ccbMf?=
 =?us-ascii?Q?XcU+6hEtDYg2Va0XqkvxZwxEvjFWaoETCq3Gj7yO25cWw7uLjCPO4Jug43/q?=
 =?us-ascii?Q?Jgw1+Q6294yg0BRb04BA5+TE6XiVYdVcwa/sIAF3t9jV6f8m/hjgaeJrgfAW?=
 =?us-ascii?Q?1dxfvnqjw3H+DY95ulM0xjwjG75vPfSDn5wixMamXLrHCmpFL2J1psmCgLG5?=
 =?us-ascii?Q?3A5r0/C852TZLM2vmzdJ9OJRLTJLxYgD47p5DOvpZ8+zdOMKqKaU2rgjPLSa?=
 =?us-ascii?Q?PRq6WSsK+8Vfb/IBkXPhkaXdT6sLkhDc7TF29uNaGtJs8ba6AMXdePn1rJum?=
 =?us-ascii?Q?WTQ6ZQqg9t9blI/iO/+NLP0w4oDzsHNQtxCBn+/262dDG2sKzq6uzwaE7fPB?=
 =?us-ascii?Q?xnNAtC6wHPz2IpVLJR4zpqH7T4cmDOiBONEarDwYGIsTZrYZm+GxDeXBJIfy?=
 =?us-ascii?Q?FiMooytmMrwDzJgokCB5kuoNBhZKRnpzZenrmE9AHnX0+B3T40DZn6eEFvGm?=
 =?us-ascii?Q?waCTOUQS9N72XsBbEvHkhZkf0CUeuI3LkfR7/CVt94VpmdY74WgUMnQk3INs?=
 =?us-ascii?Q?AQBMir4Ag2TjmlG7mc027TvILOunKH/nKasMNpRQmPA/H/OFFtL7A0uFFwFU?=
 =?us-ascii?Q?63EDoTfV9909elRujItmzc0B28T9zHqmA87tCnR5ZaYCM0NXsux7rqPBN1pw?=
 =?us-ascii?Q?eI8pOQ1w+tu5f61kWblH0V+kUqzw8qguraVBZWw2KTCgmkrrHY4sU0yiwxWv?=
 =?us-ascii?Q?WgxVSkCYH6cLEXv026B8ockA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aded124-d2a6-473b-e52a-08d8d975aaba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:11:07.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cimOgr4Kl8NVSVnkXhp2ZDiPg7bJ/Umgok9V+3zU9n3zeFqCOzYjuqNabS83aDwKhUNv8ni2th8oURNHYzluVVHdJjh8fCHtf0vX/18v4z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.1.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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


