Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BCF324F84
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:53:58 +0100 (CET)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFDR-0001F8-Ed
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC9-0008En-8e; Thu, 25 Feb 2021 06:52:37 -0500
Received: from mail-eopbgr30137.outbound.protection.outlook.com
 ([40.107.3.137]:1858 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC7-0006sd-9p; Thu, 25 Feb 2021 06:52:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmGNZotrEi39MuhS2rRIJjYULhnloesK/Tt5rTiF1HRv244G9azcXREsuzahC3T/Fblzly1mEzChZ09TsFFDYa+ynen+w8sbW780fZ1M4PuOrZqgn/hkPIwFrG4JJVeyhinUwUjPDXfVfaWbIQxxPOfppdf2VGLQyAFDmcxBavUfmdJfpm7jIOilA+yFcJMBhIYKmoOJ9e40bhFkA9L6KXCeRDWwYhdYcI+roPiIAAUTXJjbJ/79FRcae6PZ9d1xFW8vfWz0TInObo3P7vtYCS0qI1DLDo4ncG+Yj0Lp8k/8+g6yiZ/3/BsMEF//JyOmbwWWnTqwuZjlc0grnyp1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r3DiadWOxkQ42LojADZo+zQt/YAQng9PMqIguR3yA=;
 b=HtSGNpse/Y0KiRmJSovHOTkCLW7gmsXKjUqvdsCrAJu43RUFT47DfbSb2msqMrSsc6sMWuOIpHKxZ5DAu0wfKPyOiGObHrHClc5qB1r82UcSpOkzz0U9a/frveo4zfg8Un2bouLZQepxoyHZARiTAYZyQz6D7Nw938qnFK4LRe5srDGtWjG8edyv5FWqPI3GtFlEm1/kAzuR+vLaSa7jd2ebe6QdpEmEEvpqDfNaxwQpr2SaG7iy4fVBK2RFl8YDOusYHSbs9LhdaherFn4n5WG62vrVeD2rI4QMmA1PHkjaEc3mtB4+9e7fy18m1KT0uH8xQldixsgbcw98JQ3jjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r3DiadWOxkQ42LojADZo+zQt/YAQng9PMqIguR3yA=;
 b=bAf6ePxb4EUvDxonmHArXASOcTY+jBZYMW8cY8Qv/mWwq44056KAk3kj99IrJGNZvk4U4WuPilaHZYV9D6iQCamRj0S+XWt8MtSpS7O6XIsmjRO2njqwCp+5kLTxp80adw99DaT42K1syC0rR1Y7uNhwGLKJWAwtjxnqBz9WpI8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 25 Feb
 2021 11:52:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 11:52:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 2/3] iotests: add qcow2-discard-during-rewrite
Date: Thu, 25 Feb 2021 14:52:04 +0300
Message-Id: <20210225115205.249923-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225115205.249923-1-vsementsov@virtuozzo.com>
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR09CA0074.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR09CA0074.eurprd09.prod.outlook.com (2603:10a6:7:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 11:52:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2571dd9a-522c-4601-7fba-08d8d983cf98
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB600840E146E4D4BFCE6DE864C19E9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvW8HfMx8b7JrrrtI2woGlFU8GM7i8EAaHcRy2r25mI3Vte9IJnLySprVG1HyxZ2wMWLuQs358qtchnL96Nq7AV7GkK4YfHXEAxR8KZLwo8MA3xnDE45da0/dd/KIHIfJnDTe2t+aO3eJ4YYBA0Ahd7jesvP10DvQ2Oct9iLBSFPLK/a53ijNggmP3gJMdsteodCzC/ywkGZTLlOIW5wIy86X6qsOPiW5leOLZ/F4e2pz7LLAQUWIcZfe6vmm0QEugf460m0PdUZvo+qDp+ki7mhbJUcy/d6ogOM+4VI60shelboPxGQwWJjUtHAmg1jAm9EjlmIArUROFpF3SUiclTEQ5A8S8dexL9E46lxX6ZAkkHPZ8TadL9smRpH9bZ+ZJ98ayEce5Njfg0q5LiMx3jCFK9ZxXrCijDnysAwNTafN84SvNpSrVURUTZfM0fRxQX2YamE+JH2pL2RUi/RDZ5wGBF/RE/MSDK8ibkska6fBQk0xnzdVg6PHtg1WSHi+ceIrtcRRgoI1jUPnRp/JRe+avOaYQpGHlnuQ9wVyGhfuee+Jw4pVtj+elmr5lM3BZnCFnBHt52eReQ1MyDZnenU1j0CSHJHnxHl+PYQDJhC5hwiq3zwbEcELtzwD+5PKoU8/TJwDD5ACkOAnLe0TmWTJJU++08Mrcwfz+l4tpZc5KW/FgfEEnC3qT9ca54hQVP0dvlLKdJ4JfeBYFe2+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(83380400001)(36756003)(186003)(8676002)(16526019)(6666004)(478600001)(1076003)(5660300002)(69590400012)(86362001)(4326008)(6486002)(52116002)(6506007)(66556008)(107886003)(26005)(6512007)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(66946007)(66476007)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zOSPCNVr8a29yXU203RW8qir42CO8i1M9Geo7A8uWQjViq2QGZAe9+ZbHlnj?=
 =?us-ascii?Q?FgL2aNYD2oChi9pUQ6++NsWYpgtpoCZ/DskRxlMzVmEnVnaUCLUbeLUJeYE7?=
 =?us-ascii?Q?54BtqbZ9iwN6MDouGmYabRurX1XCA8BKFQRZT8JpqT/i7w/5eNBDHMxnqRvX?=
 =?us-ascii?Q?U3HGO/Ep2Ks1D1gKL3ib/tEl2DSxjCciQLGnDZMCYhvkQKW6TQb0/2xl0kAH?=
 =?us-ascii?Q?IGKl6IU6Ph0Cj1UlSDKi/GqD6tSJNxsuCbC5GM//jDQT5BlnL+QivldBiAh/?=
 =?us-ascii?Q?aIatq5XPOna4QX+viavuTrmajQKfb9UxPqqW8a3U2j3UUq+xg4iZHR1QcacI?=
 =?us-ascii?Q?aplNbFgIPyUNdV+7twqIMfsRZ/IMVA4gnRWqlgYgIW8VX4UHNp9TYy+2xygI?=
 =?us-ascii?Q?1DMCteZNSBqQIJCOBWuzSlKR7KDdPlAa/1RWyjUyjWDxcQxsaC3WAjc6HyPK?=
 =?us-ascii?Q?QMxkFFHbbhGnQZ4jWOezRz/H2qEPJRcisBMOFFuDmtmvv5PQJn/Gl05P4uVV?=
 =?us-ascii?Q?ctY4uwnN7wsnYEFmGASqCyAJRe7JLvyd/o9s/gmDR9bQ6teRYGBijUxzqslI?=
 =?us-ascii?Q?FPwtmAjJWiSDzgEPmBnrFL8sm9OX953sx+libx7ws/Ufev2NFGnZvyl1Ie19?=
 =?us-ascii?Q?clllDKFVVBkySzamASiwi/9+ZO77jkqgZuOuy9xWsMDgHm+jQqpp0Faj5CTC?=
 =?us-ascii?Q?aLuMGBcruRLwk2NmJyFjRVgcr8qJAXnvd0AcW4WkNkNdBEiYUIXydLWRdHcd?=
 =?us-ascii?Q?9p5nZEyPCeDYR7odrJeBJHtIbqxT1Z5hv04KbeE/tbamkhh4mbJJUH5QDRfF?=
 =?us-ascii?Q?Nx3WSmYahOI/tpsC75BztXJFyh/dXPcN0TlAwVmc0PN0ctazt96lyINQfLc1?=
 =?us-ascii?Q?GBoBuHPyAJH8CIcrlNSB37Q44yF6jsP3yUI8IcLgtBrZ7nR6EP8qAa+nBBf7?=
 =?us-ascii?Q?ILF4b1oqLq9Q6HS7FM1wEXdvUgtpvtkt8Aa132yohCDVgkiuJ9bAxWLpRK5O?=
 =?us-ascii?Q?od9ZqLp44j6HNghmHi06DD4iM3eOe4gQuWjvuw2qLwGVMM8y2ArYhLl5cfD0?=
 =?us-ascii?Q?yMsN6p2yZA2Q+7BTMidDnDIwiMfjZ/+w7zORwe326STU0xgoDW2yII7FdEyx?=
 =?us-ascii?Q?ccWTEko76zyTpzdoSxSTZ7kPjrnu/fcP2IB9TW61Edo4HBxU2RqCpmic+vNl?=
 =?us-ascii?Q?+9wQ9dE54wFfyPuf/vZ/hoBJraNunCmbX4OFECvGCc2Ue4dH9+Dkrn8t7/F/?=
 =?us-ascii?Q?s28noHbBHN6draU3Bc8n+IKpWTPcEqGlt2GPJVxK7rd2go0qGqaTN9sTAIXU?=
 =?us-ascii?Q?Vy0IUT47P3acVCnExRhcojK5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2571dd9a-522c-4601-7fba-08d8d983cf98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:52:22.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 994+Gm1oH3Wq+J/edJHz9cpAKD0+49NBQNH7+e203i9tZnIKCJNGejHgfp/nH1bdO6x3tDJp7tQ/YyATKlYBQUzw0eIpDmTFEPwUhUeGb/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.3.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
 .../tests/qcow2-discard-during-rewrite        | 99 +++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    | 17 ++++
 2 files changed, 116 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
new file mode 100755
index 0000000000..dd9964ef3f
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -0,0 +1,99 @@
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
+aio_discard 0 64K
+EOF
+
+# Now discard must be blocked by discard_rw_lock.
+# Prior to introducing of discard_rw_lock discard
+# will run and discard the cluster we are writing
+# to. Give it a chance to do it.
+sleep 1
+
+# Write another cluster. Data writing should be
+# blocked by discard_rw_lock (as we have pending
+# writer). Prior to introducing of the lock this
+# write will allocate same cluster that was
+# discarded and successfully write to it.
+# Give it a chance.
+cat <<EOF
+aio_write -P 3 128K 64K
+EOF
+
+# a chance for write to finish
+sleep 1
+
+cat <<EOF
+resume A
+EOF
+
+# On good scenario wait for
+# 1. finish first write
+# 2. finish discard
+# 3. finish second write
+# On bad scenario discard and second write are finished,
+# wait only for first write, which will pollute data
+# of second write
+sleep 1
+
+cat <<EOF
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
index 0000000000..dd54e928a6
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
@@ -0,0 +1,17 @@
+QA output created by qcow2-discard-during-rewrite
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Suspended request 'A'
+blkdebug: Resuming request 'A'
+discarded 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.29.2


