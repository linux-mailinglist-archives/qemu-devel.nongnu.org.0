Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6424131B8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:35:54 +0200 (CEST)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd7x-0001rs-6x
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctp-0001rn-Rd; Tue, 21 Sep 2021 06:21:17 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctn-0002LA-4F; Tue, 21 Sep 2021 06:21:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cakLbVwLOIeF1gyEV2gPc97nKITRAjLudbZBjmT68tKE7xJLmkzURilnlLmAa1UMf3JJHFnETjunuJe5J/mg+fdYgwWWtSWfy3QQk/KvOlN1rNjEHLJpwUyptmjhxugIgxP3DboVamKQgBx+QnYT1wmFO0d3TdZ7E6e7su73coQJCUJwVxfQKQKcV1pYPd9A+r1EbmeD8M2IW+x4P7QgNUV80i2Ju2xAvYuVUYPCaLJLAyJirlcV4k/o/PNzcZjMzT5i2ak2ndsu7J9MU3Ti370WnXKeyc9ZQdcxIphQbljPtk65h9FnmjP9rUcTRfEw2GqYBx6hI12/u+MZVczo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VIXJutVACpokyHPbm1tWI3UYIF9w7tCcMxrb0wrbD2Q=;
 b=hXG1Bk5YiC8GSjLxdTM3+pAF6gx2UlsygqHxqU7K4zsBQcgRJQqUSyGwn9O+pyabyC56D+lpCScrWwjbElOI9ZpdxMnPiX1aRX1DaAaA9xPB+xFv1nLHxL/DHgnuyZoQVhmUlkEQ1PdLSEDNcUOcQ5BllQYOs7zsIlLijoOv9uAToThsjc1gDVuJjwDLaNQqZxyJH1KLgVLvaW8WLbV5BIDUT1212lF1wO/esNGqIIgAQFKm3BhgKQvn+N9BXo4orqf8B8nr+LDA5sBABWObUkK3Ho5FP6/XOcCjM/XoMa3EbqI0e+yYmdbU8plIVpnE1ZGm7/D2MRV/RajJllPHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIXJutVACpokyHPbm1tWI3UYIF9w7tCcMxrb0wrbD2Q=;
 b=kdfsQlDOrKfPRn1xNH01wCzZLbvG0Nvkw8hQBf6oAGIVPGhptV2IiACsQ1GTEjaVU5/7tMi48s305fOigHGq99x+SzpWxUmGZBhCVO/fsNRVjCwkosmrDbuA+iXG7sW9zZNaMZruKoAFguo4+wei4lfQVtDJLQRkNCQdIVSjfnY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PULL 12/12] iotests: Add mirror-ready-cancel-error test
Date: Tue, 21 Sep 2021 13:20:17 +0300
Message-Id: <20210921102017.273679-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 745d1ddf-c427-4c44-24de-08d97ce97a9d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66315CE25C707068DE8D403FC1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AyK/kWpFDWFCHVO8ng4nFPX7FoUB4if5+g0PONO5pKRQixeASLxd04+TrqRNWjcIov3Tn6+wpSkmRK1hL+RW+37F7BcRQRWpvMlS4pP44nr62HM9PICeGUfq5oJJN2GdWudVOVHq8KNRFH2akdt3+hJsVsP7Pl5zUL3G9I4myLkqqIgH62OI66poETCAEUNvvMWcMRGOy+vGo2F1f7iymTlKChKDfnn1CWtS2mjrHQOq1KajYXQ45H60vqW8B0CMO0Gbatcg1clOhwByPUvof9+EMmagrSPwjgOTNkgmKe+o62SyvQlpslSSp/y1vXl568SUdUgH4cWwVLm7gPYjzhyuk9WMg7AWGWLE4GcMT9CnatfdgAzeCwf/lSHKWfOeAsnBAsUeDEs3p0MDNgPL1F3sYyZrWIS8wo7iwMIASgWTCG1zPUutuRXLQOU11IdEzf8Hi2CgLqmaEAWsUBkrNMuQQ9yOTS29qilhJ5EKFEqkFu78451DNItNe7BoN27T2vMDYUKCeYXO2ht3OWx55+Oh9JmimSCEVJdluwz/WHuJe/5cHQkiygDKhxTvliZd4bKDwcZUWs6ta30TWMFjpLhPPfGOy0VSq46asyC4fsSak5TBH0hEhhQ6WTUBdRXFTXSRBDJzQuL1le23md/zv5uzHdyrMqjuqJ9sPCtWHQ+P1zqHbCqGOcSgO2hXq/YZhjaZ5S6m3azWDZSk5O6FYD6p3gdc3cVQNqg0FfTgNFWBI+Uv6zea6AU19vUoWxBgn+zJGDjL0VTrmjWUfB0zbberekWdKbnUfFsNFRd3fnhjsME4LnOP3t9N4Ajh/WAJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2caC+qn5ds8/Dj1MUzKVCVxvmN0jC1Pd0GVX5XylHzOteakDBUjHvBJyJ+rk?=
 =?us-ascii?Q?lolG06tfRxECfd+OH3v94VzI7OzwwV8gHQKLtZDXVjdQSbOk244j1R6uhKV7?=
 =?us-ascii?Q?64tReO1fUMdw2FuTiZtGZsPNA8eRzLOtVWMAYBJiL4SZ3A9IX4CYKl/mEYCJ?=
 =?us-ascii?Q?/2xuy8Mbi6Zud7gecoO2JKHpKeBgbUt7/UquplmJaO7JOFFndxWDfiRj5mfM?=
 =?us-ascii?Q?tQt/41X8qrbMa+grsV5MczLYX+WCymZVpMIuEpKBsc8iLXfcjOpBDHfTzMmm?=
 =?us-ascii?Q?pKTHqgpspdbuHmdkr/iK/Gk6W5DixLM8TCxyzPQl36W3Nb3theH/Mw8xCN6W?=
 =?us-ascii?Q?ZUqYxrDznJifY7Suieuu+gTdo1CAT5wXU+FfgJAbjsr+yasuhuIDLEMehruR?=
 =?us-ascii?Q?xTXW39V5KWMs1sQCg9b7MGuwxbov7J6GPPvpW3pV4WeC1by3zzFgjej4QmPW?=
 =?us-ascii?Q?wMVKyx9JUAXrLKL0CxKH9YvIOVuz1TGqhNpRp9kPIlPJVidBLVm6zKjqKjMr?=
 =?us-ascii?Q?x9tU+jtb8FmtSNF8z/2sVXMjFNCK41q6oVr4lSii9tyqG34BJ7OSHA4j5Y2b?=
 =?us-ascii?Q?kecykWsQWkENujpv+nyUWrVqoCaRPwJNbL3+S4h7kCfHvUgNiyB+aJSs5PuG?=
 =?us-ascii?Q?2H3uu27N+0ZU/prwC9KPbMBTDNJO4fIhsgbGBm9nz1yDz8cajXXh9OW4Akve?=
 =?us-ascii?Q?X9+X8mZAlzJk/i+R/twZBH9Zy1xIFTmScAcL8U2NUX/lMFywKvcSbVoKeLjg?=
 =?us-ascii?Q?s4ZzBimdEGSUdFjIU8oFxU9VWKrwQoSRz9eTm7NyaLkskZPOIhskAbG1YxOu?=
 =?us-ascii?Q?A3xHhIJBfFbQ1U4itSayBDK5qYlvQjsa+aDP7qLaf/tVIlUsQ+rDw6tpSPuY?=
 =?us-ascii?Q?RZAjJmbIWMVwphVfAXpvZ0DdygnbukoQF8jM1Oi5mvVUeD1z23XwwJEyt6sh?=
 =?us-ascii?Q?61thqY+HcaJxJfVGjojTbYNmawn2PLD9aYfHRVvUmwZc+CFtj/kuSxGY3n5p?=
 =?us-ascii?Q?oS7/soLCLYlnup/X7R7jhW2DSGvpw8ZY5R5SAKf3IVnsWFk+ZZXQ568AEKY0?=
 =?us-ascii?Q?sVZbnxSscb/LAhf2SZeSYVFPpL5lGP44bWI+ELKa+Yx1CNkq35t/1RyJQA2H?=
 =?us-ascii?Q?dHqlaMntOmkjCMSjo9lmjfjB7M1+rws22WZwyIwbqdqHw13x2sGnNHy/SW/8?=
 =?us-ascii?Q?Fv8KV6GoiQH2eKybnbcd44Rn7ezcLjOCumvlI8AHJvbB5rZpf7qc+R1hyYzH?=
 =?us-ascii?Q?CADSkHxsxHfCbJvIf80/f5rxg8hvwciSS7/bXGcglvspOf6CRpGbkCBwwW/5?=
 =?us-ascii?Q?6eRA5VlV7y4GwZCwAjWAjeGc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745d1ddf-c427-4c44-24de-08d97ce97a9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:47.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RlQoKE2BKXnxD5LayYQKkvpJb693vJkpkbcA6/bkiepvv2jOA2WXcXx/X53eWrLHgRC10yblrN474t8vxqia49sKjahvZS1jLVqslBh5t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

Test what happens when there is an I/O error after a mirror job in the
READY phase has been cancelled.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-13-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/mirror-ready-cancel-error           | 143 ++++++++++++++++++
 .../tests/mirror-ready-cancel-error.out       |   5 +
 2 files changed, 148 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/mirror-ready-cancel-error
 create mode 100644 tests/qemu-iotests/tests/mirror-ready-cancel-error.out

diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
new file mode 100755
index 0000000000..f2dc88881f
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -0,0 +1,143 @@
+#!/usr/bin/env python3
+# group: rw quick
+#
+# Test what happens when errors occur to a mirror job after it has
+# been cancelled in the READY phase
+#
+# Copyright (C) 2021 Red Hat, Inc.
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
+import os
+import iotests
+
+
+image_size = 1 * 1024 * 1024
+source = os.path.join(iotests.test_dir, 'source.img')
+target = os.path.join(iotests.test_dir, 'target.img')
+
+
+class TestMirrorReadyCancelError(iotests.QMPTestCase):
+    def setUp(self) -> None:
+        assert iotests.qemu_img_create('-f', iotests.imgfmt, source,
+                                       str(image_size)) == 0
+        assert iotests.qemu_img_create('-f', iotests.imgfmt, target,
+                                       str(image_size)) == 0
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+    def tearDown(self) -> None:
+        self.vm.shutdown()
+        os.remove(source)
+        os.remove(target)
+
+    def add_blockdevs(self, once: bool) -> None:
+        res = self.vm.qmp('blockdev-add',
+                          **{'node-name': 'source',
+                             'driver': iotests.imgfmt,
+                             'file': {
+                                 'driver': 'file',
+                                 'filename': source
+                             }})
+        self.assert_qmp(res, 'return', {})
+
+        # blkdebug notes:
+        # Enter state 2 on the first flush, which happens before the
+        # job enters the READY state.  The second flush will happen
+        # when the job is about to complete, and we want that one to
+        # fail.
+        res = self.vm.qmp('blockdev-add',
+                          **{'node-name': 'target',
+                             'driver': iotests.imgfmt,
+                             'file': {
+                                 'driver': 'blkdebug',
+                                 'image': {
+                                     'driver': 'file',
+                                     'filename': target
+                                 },
+                                 'set-state': [{
+                                     'event': 'flush_to_disk',
+                                     'state': 1,
+                                     'new_state': 2
+                                 }],
+                                 'inject-error': [{
+                                     'event': 'flush_to_disk',
+                                     'once': once,
+                                     'immediately': True,
+                                     'state': 2
+                                 }]}})
+        self.assert_qmp(res, 'return', {})
+
+    def start_mirror(self) -> None:
+        res = self.vm.qmp('blockdev-mirror',
+                          job_id='mirror',
+                          device='source',
+                          target='target',
+                          filter_node_name='mirror-top',
+                          sync='full',
+                          on_target_error='stop')
+        self.assert_qmp(res, 'return', {})
+
+    def cancel_mirror_with_error(self) -> None:
+        self.vm.event_wait('BLOCK_JOB_READY')
+
+        # Write something so will not leave the job immediately, but
+        # flush first (which will fail, thanks to blkdebug)
+        res = self.vm.qmp('human-monitor-command',
+                          command_line='qemu-io mirror-top "write 0 64k"')
+        self.assert_qmp(res, 'return', '')
+
+        # Drain status change events
+        while self.vm.event_wait('JOB_STATUS_CHANGE', timeout=0.0) is not None:
+            pass
+
+        res = self.vm.qmp('block-job-cancel', device='mirror')
+        self.assert_qmp(res, 'return', {})
+
+        self.vm.event_wait('BLOCK_JOB_ERROR')
+
+    def test_transient_error(self) -> None:
+        self.add_blockdevs(True)
+        self.start_mirror()
+        self.cancel_mirror_with_error()
+
+        while True:
+            e = self.vm.event_wait('JOB_STATUS_CHANGE')
+            if e['data']['status'] == 'standby':
+                # Transient error, try again
+                self.vm.qmp('block-job-resume', device='mirror')
+            elif e['data']['status'] == 'null':
+                break
+
+    def test_persistent_error(self) -> None:
+        self.add_blockdevs(False)
+        self.start_mirror()
+        self.cancel_mirror_with_error()
+
+        while True:
+            e = self.vm.event_wait('JOB_STATUS_CHANGE')
+            if e['data']['status'] == 'standby':
+                # Persistent error, no point in continuing
+                self.vm.qmp('block-job-cancel', device='mirror', force=True)
+            elif e['data']['status'] == 'null':
+                break
+
+
+if __name__ == '__main__':
+    # LUKS would require special key-secret handling in add_blockdevs()
+    iotests.main(supported_fmts=['generic'],
+                 unsupported_fmts=['luks'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error.out b/tests/qemu-iotests/tests/mirror-ready-cancel-error.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.29.2


