Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7734B0C7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:49:14 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtOM-0003e6-0X
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdy-0000YK-22; Fri, 26 Mar 2021 16:01:18 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:9409 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdt-0006bj-7y; Fri, 26 Mar 2021 16:01:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg7k7EHeCPGCMDFVSuok7WeXZEzbioA+x1QSi6Pp9iW4meEi2VCIWuTee50hs3gx0pKuGOr/w7ImVikcQty8OKZGL5Qv0yF6ZREZVDc6XlBCcmPVs0wXp3GV75k16GgIPZ/3W/Jw71WDJwwgURB1QwFIkdfoOduguNz1FFM2X7VhOc4/14gK/iX6qnh6cygTau3rUbcBHf9Ln3Fhff+XbZFoZskOhLIoyZJjv4Caxp9200VwbqbdeugxuECBTmvvLts26PwgjxJ7/ceCq6XPVPaEt9dyG5aQeM62i57Pe+6T6fJo01p8pM7jlTayDx+ees3Mx+jWE8MARzowOfNNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=bKLrH9vKIyRcqe8ykaeFVbyxcQXPiH+8+8q5pirjj9aUO87gGFFaIxzlGpVvnlLVaORUPwOZaI2Kmi5f6gK7ktdHX/XRsfV6joP7pk4RQxFzWj1Ni+OrENSUjb1CimWeT9kTvQ60lk0z+dCJpV/BHgq1RAPsykp9hFsr+jWZInbFCuIchN8SrnbYHeDWGN92DN9gMSdKsMXdJVU1dFN8omrrKFdqGjay0sL000SqQCQqRBGWW5yItd2HzGHWTAOlc7/Ab9LZID6939fPtT9lzzq7JNZ+NRZuCH156rjgICH6zV4AXvUxnFxOWF14Byy9jVcEkl/LxhpbtQ+RGPfVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=nQaiVc8aijUDZvB3Mu4gXKx6JMB04TEif1zZ3WL2h7Ce8Inm1eVFWGGEzlaHCgKpCWaACiDDPsdqijyIlGA/Oa1xe+6hVg30vjO1vQEi05CDhL4jaqMU1F+mh9mKWz9oZK9s8Hnxep+PbEKJliy7PeFQL2uU6rNh6xOflCnEeWA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 1/6] iotests: add qcow2-discard-during-rewrite
Date: Fri, 26 Mar 2021 23:00:40 +0300
Message-Id: <20210326200045.363290-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de419a73-d137-478f-f884-08d8f091e236
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5877AAFC5068447389A71067C1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7APkokag4HAT9/C1eR57/IuJRHzqMmgbbGY3ucHmkh34RAWQlVjy/kHfA2tyWMe04i2ZQiX5IOWL6asjGl0x61H2z5c0mSKxEw/Cv2zitH5r1DQeDgwHwOGX4fP79jos4qM1137g5cRketKI/bipdPETwt+lyj4hgJRW9OGSTQV14HH+0vUQOKDFtocp/iK7R2lyyOD5IARZBl4G3JollKU7HMfiXpZMmDO/m6JosDCToIId0DupzqeLTD0t878PkOcvwRdrln9XrIqgVFmfCXlx/noJF2QBJH6YxIhz8oCGmM9fGASdFDGY3eCDkv6/IaMdQr6lz+fAH5MABBQdA6FHPWOuJ3/n51Gd0YaMhy6AjNj19T/Ij7YJxh5mUbTVcBGsL2ptkQh038Y00I0Q7fJNm/9aISg6fXyarLGoYxapitWwetrkIMlctY7FXF0b2DYRbWfi51qg2t+pog7Z7kMFM0LzIYmjhKBghPN+hIumMNffdKYiuufm/0gVIrzN1cANhKargw3Mret1oqI6MaeVMT+oSfmNlomn8uPQMH5zDA1cJGkMDlSTUipZ/KPeZOvi+XwdacG8qPO+6/snU2kGoYqXNvsiDjLTUvuaIkmsQ3QsPaPtvDtbopIEV66YnxjT4aRUFJeNr1AYl3qIcnvpt7UMHIuxjEtk4uR0gDGmhfv6+xrkZiQZh1OURJNB16y+hQk6Rb1cf6cL/0DePyZ1JjU4ctCVb+oRVLVMWWWvDzxQDmksvicDYbcfycH86ydqis6ho6z4GoRos2W4u3djp8odP+C1SlEAzDVmsBblRlLk1/E9u8S/gZO8efIt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7FVie/4Y9T/LOPLMczQY5vgrgZr3DplNKZvGpne0jaRCJZtl3Qv3nxhveeJN?=
 =?us-ascii?Q?VV0w/hG89ASJtXMcfALsc9lrB4N6U8vklQIu5qN9l4bAG11XXtfTYWNKFBlZ?=
 =?us-ascii?Q?0NvC4/6EtqJ8zaLW6DqV+XlxBoYJKafVcrNrmGOirDS7LSqVHMTVuXB8tH0L?=
 =?us-ascii?Q?3ZNqe7LMUfX+lBfodDC2XRdrOxQYLXJxFn27whs7hlvb+CeSVweosN4VbPFQ?=
 =?us-ascii?Q?BMVI0W/1fHp2LVUDKQFBZq/E1zYIGrXcfDdvPgW8H+fiLKf4Ow6cmueuia7V?=
 =?us-ascii?Q?EESUkgMAx6LagM+OwFWCBpNv4K46FTpposO1ymimQJU+LnrJcBdIdZzThCgt?=
 =?us-ascii?Q?Juijnd3XtwYB3vdD3kfJbblj2A2cm3AT5Vn2FtqxFx3fEARuCCv9Pq6xFjdX?=
 =?us-ascii?Q?I96uabkBrKIlK9jCXpiOQ9rGkpNfcApICOGDTEOQvpS7nV9M5Av33JaKqBvI?=
 =?us-ascii?Q?FA8NX0Q1MGku5GfvrSC8DDJhqy1hJnaj8QjeZQd3Rso+X/mQSfWUJ2ohfAFL?=
 =?us-ascii?Q?QOtLtLCpL7tRPYOOb1n/1579f/M6NRxjJ0TOVqVOe1VeAhzUIjUF2sPqpd5T?=
 =?us-ascii?Q?bi6HGR1AXJ+mgexKm97ynAveM/6+iquVYCgEqjoKqS9kTfJvRImGoQzIBNxQ?=
 =?us-ascii?Q?/Kb5G7ZEqCchapoADNPEXZ2GOP4pwjsSwlHzjGBQ1g9y2W0V4Z4pK+kThckB?=
 =?us-ascii?Q?nEWrCSi6mq0DwOhUd2qRNv5uLjIHPZRwHyBlqh9nsTmgQEXK0GQyXLdG03OX?=
 =?us-ascii?Q?mDyMbDilNBIMLvtazgY7DujsKnJdMfCNgsyfO3WTkGBHOOlMf/Y17X/QC+5g?=
 =?us-ascii?Q?O61tca1GEytqcbAmZ2BE7pDoSe0q1vKUSpenG8ZdEN0+5D987QWvB0dSknMc?=
 =?us-ascii?Q?2XLHV8wIF2a+maKG0po9gBdY2fATM3qj6eAc8PevuP6ff4mF6gCO6HqQMiW9?=
 =?us-ascii?Q?+42WqSbWXvJ5Pd0NhSixp1XorZJcI0k1rAQwvFOFXHB0YnBqz2IilzMTzuXD?=
 =?us-ascii?Q?PH7oh1SPfFEmVX6wFS1ARo+7GlCfIbtrZ8MKSeGldwVioGkJdhwfgCa4FOMm?=
 =?us-ascii?Q?SddHiOZq+xGMjd+gNIe4yb2a5s1xDN7BYs8DPXRg2Rc/lHxlyxrCkHtgfr4S?=
 =?us-ascii?Q?ivuPAltRcZf8/656rVsl16N65+zsGlTpNcLFqCP19uaJVTCRuXC7F1wV6Cv1?=
 =?us-ascii?Q?7hT3j04GOJtRM94wBKGBWFrCUtCo01PAfmFE0sx0337m1T09LZva5zXQ0KSx?=
 =?us-ascii?Q?QlauDpozHuHtQmd1JqrO3A+/RjN3K7gHeb0eu9xddEPV1hjB71+e5wW/1SX9?=
 =?us-ascii?Q?hWodmow2ZyyoNXUEYYK23g+g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de419a73-d137-478f-f884-08d8f091e236
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:03.0576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EwVa6oS3FK3hZjtyjYfDMR/q5lbRyBv5UOLaFteEzCDD+ry2dcGgRKBdROIPcUk/ZogCSWhop87/8H2s+TgjBjt/UUd6xarKiifCT46ApI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.20.134;
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


