Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000972B1B8E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:06:52 +0100 (CET)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYmy-0002zX-16
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYgN-0006en-MO; Fri, 13 Nov 2020 08:00:03 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:5175 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kdYgK-0004NL-Q0; Fri, 13 Nov 2020 08:00:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmf3E0dsHtgFQlO+U9BPdNr+M1/dQX2GOSrsFOZyI+bU6oucnLUihcWvHaKRkx9cMkDFAW+u5DLl92Nkoxy1WcP2TR0mZYM4RD9vSzWOOR6aYO4swDYxi6ec9HQKkNOZcGeyeqmGP4cZ5bRGYI9L3RiruSTErR7is62tIbQHfxHtT5RxltukHFqAWhKAaK8Gr+adsPkn2+cyt5fOw29u9w+kVHBqFFeMQPM6Ex2YqBIK7rOQuZVp/4vFFfLRh2RHF+38N6OC3y8hliGc544ZqBfOEo0weoQsQPyS1RMXQqyAolZUqoTplYZNO1yCO6X1Rt9V7xg4wrCrLz01rWB/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gf1noyfbEi9Ep3nQc5Mo6S3uJTqsBrknytwfEZPFJU=;
 b=ZTCCk3v/cnEmLgsUv2SN8i2VUGftvUVXf1BpXaok1Ut5JC2//XbX4YN4g6wCqt5J882+JyodOl33CrB7KlZbqYuywvPSygguBPkdOVc1uLuHvxq6AvF0BrhMtklzL7NKiMw+JwI5YSl6mZQIxbSLMwMZCbyKgmsZSgsskNG04s+HzcG0jer4UiS1G/U+7uYHq93M16CxG4USB8jYylQaQbGwU8X28sFhUSdz3UH9XZqx9sPq9NDCUhGOLCEgh3btW9KjQFOhM+4q3A9NRlpMSK7wT8bVOXBWL9uys+D4+x2TBEsuMYvPaBtYWZsaZ6KlyZ4532jTfbmfCFYIVdenzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gf1noyfbEi9Ep3nQc5Mo6S3uJTqsBrknytwfEZPFJU=;
 b=XsLBh5HhPhZDop9k3mL2Sy03peyBpLXRVivshll/UOhr8x708fMoQ5WsLnEctOqUquxJPYLy8lD0fnsUSJcoPzWnoWLMqs7w/A0FkSaTFUoZxHS0v7iaf9QHNg0Sp3aaMc7vp2bgNk3LKCqhNvLAYODLkM2/r2q1OLv0evAxJCQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 12:59:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 12:59:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 dautovri@hpcdlab.com
Subject: [PATCH 5/5] iotests: add test for prl-xml format
Date: Fri, 13 Nov 2020 15:58:48 +0300
Message-Id: <20201113125848.20498-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201113125848.20498-1-vsementsov@virtuozzo.com>
References: <20201113125848.20498-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM4PR0902CA0003.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.71) by
 AM4PR0902CA0003.eurprd09.prod.outlook.com (2603:10a6:200:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 12:59:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bcbc170-efbd-4f11-9927-08d887d3e7c9
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58770C35C4A7EE3DEE6B0A11C1E60@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4qAZcwel2PLMHbR/Vdph0QwZFp5PYVx04mPOJCwNLtBlG7irURmi2ZSW3nEv/xLCY/5yXOjAki/LIsVcxmwUcupVGalyAUxhVeaGT/eDMtfZvEDpGx2JlE7kRJl7sCuWzHrKwTnbiXAgRow9D0UK4EX1g8is6tb2+C0YFEEHApdNbTDS6v0t8+e02Ze/xwQVaz8yfHhGVfTovxEoiVoDHBcPsMO+z524nx5hyppEdennogfMFf610m/vy+5W00MalbIL8reXF6WbIun9GU3h4kY7x5OjsKhIS8NMbeDooS4+Vc/kT5EEoH0KNLTw2a3eo2pUy1oGd5Me4PVw18NuCaoE5i3KiftaErExmBNUUeZpnyHDslLZE9521o4hbv/7LS0bciHfh6m0Vky2IpS1zuHNQNVum/NSlyT59b16Mj9LHtZhU65hAwM0ZLWzQmLul5Zd0C+/MATwAh6t/3fcTW0pftMXkF9jP6My188cTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(66476007)(6916009)(26005)(83380400001)(30864003)(8676002)(478600001)(52116002)(6506007)(86362001)(956004)(2616005)(66556008)(8936002)(1076003)(5660300002)(316002)(66946007)(16526019)(2906002)(186003)(6666004)(4326008)(6486002)(19627235002)(36756003)(6512007)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Y2zGmGBEGNrPTufEhvRPr+hgDBz/ApasquKmnt40TJNP0y6nmULsXeyavEd6ZshCzE5WfeT0w/Mmz2SafV3Rh1iLXvGb/6+94THzY/4jHPDIma2jxv0h65OLfz8KV/F0kl3hyLSCDs03aMtNs8QnUccq0awxRRNHy6NVhd0MSE3/bZ4CevVxtOMI8XHEQekBCSOgvosyJqdQ5KagbZTrwBXMfUPD0oVQQDWL1FdBOHsbbeCE7UivPXJ3QoiKxpyqchiwOfJnyKXjR8rWStXb/C00YbU417ZhwPbyQ4w00ed0QaSl8sReNye3dNfN+VJl5BsJJALsFLAjJ9xg+avSm68RqCvq/5ja7cvfDX7kjTYGDyL5sQUK4eOd+nqoR/kkizxSaAhauMVvDBykNoTUL2IKkhJJLYcCouXkTBnGl95sPXa5QlSwhXRMxYxPVvZ2J31Zd5iBQnzcGv3oV0hUk08EkpD+8M5m5DmX1GdP1sTR+xo97ZiMUWtfqPSBk271gMpyWpmoBd/R0X+WhjXoWFHNEFV2pQGMGYc7bjykt+fRQ7/MdKgvuQrANg/v6VdOct/s2vWUSv0EghaM7cFjNpnupQ+Phxjf5Qhqd6gMGzH6ElsNStHlXvUwUcFWA2Gg+LBBaltuDIA0fAxdHk2CQQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcbc170-efbd-4f11-9927-08d887d3e7c9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 12:59:07.1514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnpmS0Dtd++emswUZlILLQ8epXfKtExIljuyBcYmdsWKJc5ZrYTMRl0xSiBvw+QGCKHXnKoYC0oFVqWlV12gTtzErF7zYsXEkuPaiiL6hT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 07:59:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

From: Edgar Kaziakhmedov <edgar.kaziakhmedov@virtuozzo.com>

Signed-off-by: Edgar Kaziakhmedov <edgar.kaziakhmedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/164                        |  98 ++++++++++++++++++
 tests/qemu-iotests/164.out                    |  54 ++++++++++
 tests/qemu-iotests/check                      |   7 ++
 tests/qemu-iotests/group                      |   1 +
 .../prl-xml/DiskDescriptor.xml.bz2            | Bin 0 -> 457 bytes
 .../sample_images/prl-xml/Snapshots.xml.bz2   | Bin 0 -> 307 bytes
 ...aabe3-6958-40ff-92a7-860e329aab41}.hds.bz2 | Bin 0 -> 93 bytes
 ...476cf-d62e-45d1-b355-86feca91376e}.hds.bz2 | Bin 0 -> 93 bytes
 8 files changed, 160 insertions(+)
 create mode 100755 tests/qemu-iotests/164
 create mode 100644 tests/qemu-iotests/164.out
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/DiskDescriptor.xml.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/Snapshots.xml.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/parallels.{5fbaabe3-6958-40ff-92a7-860e329aab41}.hds.bz2
 create mode 100644 tests/qemu-iotests/sample_images/prl-xml/parallels.{986476cf-d62e-45d1-b355-86feca91376e}.hds.bz2

diff --git a/tests/qemu-iotests/164 b/tests/qemu-iotests/164
new file mode 100755
index 0000000000..a55ab5d7d8
--- /dev/null
+++ b/tests/qemu-iotests/164
@@ -0,0 +1,98 @@
+#!/bin/bash
+#
+# prl-xml format validation test
+#
+# Copyright (C) 2017 Edgar Kaziakhmedov <edgar.kaziakhmedov@virtuozzo.com>
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
+owner=edgar.kaziakhmedov@virtuozzo.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+here=`pwd`
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _rm_test_img "$TEST_DIR/$PRL_XML_DIR/$CUR_IMAGE"
+    _rm_test_img "$TEST_DIR/$PRL_XML_DIR/$BACK_IMAGE"
+    _rm_test_img "$TEST_DIR/$PRL_XML_DIR/$SNAP_LIST"
+    _cleanup_test_img
+    rmdir "$TEST_DIR/$PRL_XML_DIR"
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt prl-xml
+_supported_proto file
+_supported_os Linux
+
+inuse_offset=$((0x2c))
+
+PRL_XML_DIR="prl-xml"
+mkdir "$TEST_DIR/$PRL_XML_DIR"
+CUR_IMAGE="parallels.{5fbaabe3-6958-40ff-92a7-860e329aab41}.hds"
+BACK_IMAGE="parallels.{986476cf-d62e-45d1-b355-86feca91376e}.hds"
+SNAP_LIST="Snapshots.xml"
+XML_IMG="DiskDescriptor.xml"
+size=128M
+CLUSTER_SIZE=64k
+IMGFMT=prl-xml
+_use_sample_img "$PRL_XML_DIR/$CUR_IMAGE.bz2"
+_use_sample_img "$PRL_XML_DIR/$BACK_IMAGE.bz2"
+_use_sample_img "$PRL_XML_DIR/$SNAP_LIST.bz2"
+_use_sample_img "$PRL_XML_DIR/$XML_IMG.bz2"
+
+echo == read empty image ==
+{ $QEMU_IO -c "read -P 0 32k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == write more than 1 block in a row ==
+{ $QEMU_IO -c "write -P 0x11 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == read less than block ==
+{ $QEMU_IO -c "read -P 0x69 32k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == read exactly 1 block ==
+{ $QEMU_IO -c "read -P 0x69 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == read more than 1 block ==
+{ $QEMU_IO -c "read -P 0x69 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == check that there is no trash after written ==
+{ $QEMU_IO -c "read -P 0 160k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == check that there is no trash before written ==
+{ $QEMU_IO -c "read -P 0 0 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == write the whole disk ==
+{ $QEMU_IO -c "write -P 0x45 0 2M" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == read the whole disk ==
+{ $QEMU_IO -c "read -P 0x45 0 2M" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == check that there is error while write out of range ==
+{ $QEMU_IO -c "write -P 0 2M 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+echo == check that there is error while disk size is less than data written ==
+{ $QEMU_IO -c "write -P 0x45 0 3M" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== Corrupt image =="
+poke_file "$TEST_DIR/$PRL_XML_DIR/$CUR_IMAGE" "$inuse_offset" "\x59\x6e\x6f\x74"
+{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+# as it is a block filter, we change driver format
+_check_test_img
+_check_test_img -r all
+{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/164.out b/tests/qemu-iotests/164.out
new file mode 100644
index 0000000000..777c0c2c1c
--- /dev/null
+++ b/tests/qemu-iotests/164.out
@@ -0,0 +1,54 @@
+QA output created by 164
+== read empty image ==
+read 65536/65536 bytes at offset 32768
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== write more than 1 block in a row ==
+wrote 131072/131072 bytes at offset 32768
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== read less than block ==
+Pattern verification failed at offset 32768, 32768 bytes
+read 32768/32768 bytes at offset 32768
+32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== read exactly 1 block ==
+Pattern verification failed at offset 65536, 65536 bytes
+read 65536/65536 bytes at offset 65536
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== read more than 1 block ==
+Pattern verification failed at offset 32768, 131072 bytes
+read 131072/131072 bytes at offset 32768
+128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== check that there is no trash after written ==
+read 32768/32768 bytes at offset 163840
+32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== check that there is no trash before written ==
+read 32768/32768 bytes at offset 0
+32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== write the whole disk ==
+wrote 2097152/2097152 bytes at offset 0
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== read the whole disk ==
+read 2097152/2097152 bytes at offset 0
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== check that there is error while write out of range ==
+write failed: Input/output error
+== check that there is error while disk size is less than data written ==
+write failed: Input/output error
+== Corrupt image ==
+can't open device TEST_DIR/prl-xml/DiskDescriptor.xml: parallels: Image was not closed correctly; cannot be opened read/write
+Can't open top image
+ERROR image was not closed correctly
+
+1 errors were found on the image.
+Data may be corrupted, or further writes to the image may corrupt it.
+Repairing image was not closed correctly
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+Pattern verification failed at offset 65536, 65536 bytes
+read 65536/65536 bytes at offset 65536
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index e6b6ff7a04..0a87c8d840 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -229,6 +229,7 @@ image format options
     -bochs              test bochs
     -cloop              test cloop
     -parallels          test parallels
+    -prl-xml            test prl-xml
     -qcow               test qcow
     -qcow2              test qcow2
     -qed                test qed
@@ -288,6 +289,12 @@ testlist options
             xpand=false
             ;;
 
+        -prl-xml)
+            IMGFMT=prl-xml
+            IMGFMT_GENERIC=false
+            xpand=false
+            ;;
+
         -qcow)
             IMGFMT=qcow
             xpand=false
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index a2dfe79d86..d22853fed6 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -168,6 +168,7 @@
 160 rw auto quick
 162 auto quick
 163 rw auto quick
+164 rw auto quick
 165 rw auto quick
 170 rw auto quick
 171 rw auto quick
diff --git a/tests/qemu-iotests/sample_images/prl-xml/DiskDescriptor.xml.bz2 b/tests/qemu-iotests/sample_images/prl-xml/DiskDescriptor.xml.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..08dad3b4a9c980e931bc0b1d128bf931754a0730
GIT binary patch
literal 457
zcmV;)0XF_ZT4*^jL0KkKSrF;;(*OYXUw}kZPy_$xpWsgbzwh08Kmq%XS_EJK00000
z00050<x}*N)Bpg{pa1{>0FhFe>Y92HlRY3t1k)x7iM22Qsv;FVpa3SCYG^bXG{_8|
zrfN!{Cd7v_5J(9M0s}_dWC~Q2$^q`CQ9GkqB)PntA`y-oQij;)JNjE(B9Y*5aV@eZ
zNm#hli#yE)7^1NyrcFiV@r278BPk{EYaYR2-xv$bF@i7>S(f6lk}@&{M@|-=EDInh
z1TQdzVh>8Vid!*P!6c*$Ae_l29fvPb-K|eJV1RjPLW4O6g5X2eSUs4Sk}gILzRBoP
zpHePXvokW4>Jvg~PXZ{SSoaK&ZH+Ou+Zm`9dCH>;i})omFSQhX*`7S5GZHtsEf=>w
z1@YYz7*4~Ij?&_cOOoQ={;YNEHAluO=lD$;(-cuvUM(k+scFz|XL9qg!Mwv9P4QDi
zZfryL&S!Erw6rX7Q7R#ko6NZ8#&UYgdr7g++-G_%Jw_LzuB3a>_GL3NF_MS1iYl0^
z6I+QmlSNwC6>a&aGBB|%l=PU|mZaQ)`TG;NQwaRAwJ&DIPvBk26yZWZL#NYBA5X_~

literal 0
HcmV?d00001

diff --git a/tests/qemu-iotests/sample_images/prl-xml/Snapshots.xml.bz2 b/tests/qemu-iotests/sample_images/prl-xml/Snapshots.xml.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..b5d80ae94d4500b1b19f3439dc5e953383797c6f
GIT binary patch
literal 307
zcmV-30nGkFT4*^jL0KkKSxpAo!2keSUw}kVa0CDMtRYMaKj+`dFaafl45Vb#^oG(j
z!Ww#j1Juv}&}yEUO*J$z4FF*QqfCtlsip-~(t(pxG&KMKXlV5qfO$lMX&?jw2v8-q
z1`8?>TaY|qfYis;LeUupdT2xBtur^&?vpdx7R17+oiv%}2wGIw-)zxJLr_^;oRJC4
z2#6Ap!Nu!vRP96>_M1>58rRKl2SU7pU?xx5wYliRwKUL%LTSn&49HEuR+X$}sk5@T
z=xr(7)RvMJ8`AEc%m$-oFQzoR=yQk}&wu2md@z{{n6N7=p=AGC+I1H@3>iwz8Wyyr
zWa1$U^GSrJhB+xNlJ>S-MI_qG1yW`~MP9ZklRCtzNpT7YFCZ1HaF+M+cO+AV2?Wq>
FtPtE<hb{mB

literal 0
HcmV?d00001

diff --git a/tests/qemu-iotests/sample_images/prl-xml/parallels.{5fbaabe3-6958-40ff-92a7-860e329aab41}.hds.bz2 b/tests/qemu-iotests/sample_images/prl-xml/parallels.{5fbaabe3-6958-40ff-92a7-860e329aab41}.hds.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..174c8ba055fc1a24b91f179670fd15b53e00efdd
GIT binary patch
literal 93
zcmV-j0HXgwT4*^jL0KkKS=)oU7yuwJ=Yr6{KmY>(2!JYJ)<6It00<xeR3$(r5vF9&
zDv_iB08MQ#q9On-S)$Yk0W=~I07sO2y<D>Emf9jW8MFZ406H$@ig2MJw+D1EabX`c

literal 0
HcmV?d00001

diff --git a/tests/qemu-iotests/sample_images/prl-xml/parallels.{986476cf-d62e-45d1-b355-86feca91376e}.hds.bz2 b/tests/qemu-iotests/sample_images/prl-xml/parallels.{986476cf-d62e-45d1-b355-86feca91376e}.hds.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..174c8ba055fc1a24b91f179670fd15b53e00efdd
GIT binary patch
literal 93
zcmV-j0HXgwT4*^jL0KkKS=)oU7yuwJ=Yr6{KmY>(2!JYJ)<6It00<xeR3$(r5vF9&
zDv_iB08MQ#q9On-S)$Yk0W=~I07sO2y<D>Emf9jW8MFZ406H$@ig2MJw+D1EabX`c

literal 0
HcmV?d00001

-- 
2.21.3


