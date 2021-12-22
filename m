Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41847D765
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:03:27 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06ta-0005hK-NC
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jl-0008PI-VY; Wed, 22 Dec 2021 13:53:18 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:20601 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jj-0004am-To; Wed, 22 Dec 2021 13:53:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8tCTAQF1EI4mfs9ylg05Bq8sLnF6qgTAjO8vZV5Fjo3pPqkO2qU9em8Eya6nUFE9JbbAyempkB4SQXyDqcinBTAw/IdnRPQfqOEt9ysWf7vBPV/A9fZ3yNQtWPYBGS3n9iORIEwYDDLPiBiwpelqtz1NTxeHC7ev49NZlnQ7A7cxk94PdTwipyN6qKVWhMoctorDCZvY3lxt18gP65i1fVaGWaTRm/akprcniE7zcNC5OCB27t32yYSAVIPeForCldSzkaGYSx/mHgM4qy8Lev0KAobTOiv5y/AGev8EWYWGEf6gH4rLib/yoG3mr6Jo7bVenpcMlkDIrittX4WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKHdWI3SpyJn/wYVm/4ls8RTPDQNlwd0U9ZHHaRsgeA=;
 b=nKnrH1Vo6tGxXdFdqWwfK4VWk5hIJm2/Q6kvpqUsf6u8GXMCKyodANmT/DhIdBbgT7en0MqQBR8GhLbRCrM0JqnF0h6KACNOPcMzTan+oQollB6eSj3rs0PdA+SPvk2+1vLciCASWUZkfYHKLtxmdT1fycWhfq/kCzP0LpPguUEjq57Xf12r9RNRxhkK67c3pB07qIvdfNN/UsvR9uktvjlqaVOWGoGe35ZAuI5SxGXnnmAelzi2ftxzjygUirtUByffvoK5gMvFmKdvNvLUmzPol4NOiedGHxjFc2AVXEDF6V4C9OunbnRlZkUCOHhg4hZTl2Ar7be7NokS8oqCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKHdWI3SpyJn/wYVm/4ls8RTPDQNlwd0U9ZHHaRsgeA=;
 b=QQH6AIwJosyUgnraNTwbtZ880beGyuUJm48UzAJf1mxHGMtYTiw5c9zBng8WeXEM9Xg5Jm68cgz2wd29rS/hrwp/ywM4wYRhy4pM8o0et5OptbuMb545+sZJutphKWqu24pwfM+iifFM+WljFjqAVVFmrRB0z0uSHd6P0vCNVw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 7/7] iotests: add nbd-reconnect-on-open test
Date: Wed, 22 Dec 2021 19:52:48 +0100
Message-Id: <20211222185248.466010-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46e07f55-81b0-4bfc-4f51-08d9c57c48d7
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB58575E08BC5604AD0B9D87C9C17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFAoTKHxpNAF9b9g4NXheIhKvfhs9mFfnrXIRL+1knAw7GCR6AOevmGsQcQfXlBw9ERBvcrYqHY1VTbVsogos0EU/90VB9OM+s+z9QLe4XaF8H3zrNt9an1lEpVqAwzEZa0+XiQL6kzspVsTiXCZXJm1mBnVMA0PR2MsjSmrfgtdRtm+1irvyU22AvgQU9XG/PYu9O6Kv5wCMOG3nOgfmdQEuMQ78OABlMcF3DbCkQq9k2KEdK9c4W7d4OH/793lsN8Z9vTJZNkLnQ0Yq95EOpTdiLHrkAAiWWFxEn4iT480DpwdI+cH1O54ZRTgHN5a4F6ra9X/TWMdoIQhjc7yYxq57M53IOslXTY0/l7I0RsNg9FnaG7FdI5YAEXXsZ3rj8FLEw7r3OU0+WlM3fhaCpQ4VD9xnWDvFta27nsLZgNjb3agQ+L/CrBZy2UoTX7bsK6ob2FyOHdFmXPwRZqzkveLwt7OCFf9XLtamMRV3OxX7NiJFtPh18ffe/MxqmYUIhArUc7rtEjuq5eeCz7rCcEMD9aCM1QD/h/FvuJQGmuYb0By0oME6/Tmyx4gLq7MEfTA4Z54PhJbzawV+oZuox1+woKGiGHiWuDS5fpN0zqXHmoLJ2gjw9OVS7fpJlOEDTYjYe+E2+1u+D6ed+iq//F4kZvsdhhxKucNAqXFW2Dc3x4j+KGoypfm7AIB/UP9b7ujU135VEQEBhze0gQgFYF7iDuOOqnOdC93A4+kxRbJE96/5OEntckTDEG16XdJ0xJeT/EvnbZblUcGVeHmxIz2fAEjK3QxROF5JhKjsL1eyuEN9/2IRzzS6UdM/FhkInPjlUwn3PtAiXezGbMfjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+V8L/gNxTSStdliVb5UfIrmNqE2JtWGZUolgmcHtuza6nYr5GBsd1rtN5ld?=
 =?us-ascii?Q?rJKNMS5U7C0o0rf4lu/va1Y19HFQke9IaGFLdaYiS6IJ9ahe0nObfKYN2vut?=
 =?us-ascii?Q?ZdEiAIYtOqudmnupPKZDCYd2P1/GSgc9AaCm/J/rd0iJw1sySrxWCzsp2JzG?=
 =?us-ascii?Q?gbx1dUJDffj5mnS8ENX9UBH/tqiqCGMBhNB1e+RYBEP/fJLUWXUEVhH4hAoU?=
 =?us-ascii?Q?sLNUaB17r0PcVdkhn4Dc6Za3IOFDWx3ZjEHNiMv3iDqFDzD5qXTw++k7gnIv?=
 =?us-ascii?Q?FxlgccRNdP4Vuv1si921dxncYgLCys2P9UgTeGCKCpOHAy/C0TwnDMaryR4M?=
 =?us-ascii?Q?VC+mpfbGSKZo9muSYRo2vr986+plNS/XGOuWSHJO7aPFi+MDXFHK3Ulvqllo?=
 =?us-ascii?Q?RpuejkvLKhhlWaBj7BOqtE4TfAOdXOQlbCjOChwmXhC5K+NOpZv5Q62cnktw?=
 =?us-ascii?Q?CU9JaHsv+SqmR2i0bvVJF638F79sBcxyUcDVnrWLkfFRtq/40DoIp1tvLMbQ?=
 =?us-ascii?Q?J/6HkN+yX7o0YZBxE2tGaGNILuJZFfd7+Vi/thFjXaAF7gxA+GrHgD0zWhbS?=
 =?us-ascii?Q?HCvhk8FJ3yQIxVl02JpzrB0Asid695Ub14YMrEimGYpFkrQ+7gPDwgxlJEVk?=
 =?us-ascii?Q?kzAkgjS2Pr1YiSImoirdqGSIa4Ve7JO2JpF7cStw0jSvSibPICcev68y/On2?=
 =?us-ascii?Q?Ofm+3235+Jgo/p/mlpkI9TXn9WYqc7YQ4uS6N8gKQ+jON2hZIZSPUDOfagvC?=
 =?us-ascii?Q?eajtP6vod5Yi+Tc/QSPFu2B5vpTcDyWWKQ5dJO+qPNJQ5ymtGmbHdgXXWvRJ?=
 =?us-ascii?Q?7LHZ5FfAtCfQr9pWJG+9h4VBSKIac3Rd5CEOtNgn+g3fCh1QFHuvCyUPpViV?=
 =?us-ascii?Q?5hHJ0/VkHkOFNIyTrMpR/UibpE86m26PeeL4tYLgLsOiPdCSNSvvP8AowjvN?=
 =?us-ascii?Q?jrw3jkWyGfG4RKM0L2O2K7/5FhkXokxey59GAoh3FnbhFdw5SRXIgkrD+EIh?=
 =?us-ascii?Q?Ix/EJ008mjkjCayGr0TxgglTeo+dH4xtJ6NS+EZUVfcGHnV3ptasIfRp2uOJ?=
 =?us-ascii?Q?BYlTnto6i9/Q4YLn61LSzRJ+/CPqZ5ygRat5HoMwZA500nTo7i8c7FIBjp29?=
 =?us-ascii?Q?6ssyXXU220qFDYStNOlfv36p5MZB7Wlml7r24YtZ0g7kkpNcY2ewU0EKIZYs?=
 =?us-ascii?Q?k/dn4GZUvbsmB7WsWRDTWfAtiwtMdb0nVBnhzrDX2/JjKaDYHF0QU5VTLqdd?=
 =?us-ascii?Q?rCoWGMc2JTjzeWQ37oHQMVNyHOmzEGupaRNVSuGsAwXaolM8vXonzL77tyiG?=
 =?us-ascii?Q?7vjMJpm0Ls2kulef98dTAp7n/b7Cd7Rj22P/e0ENJvGfF14syriEdymiT2bZ?=
 =?us-ascii?Q?7fcWM2VAPS58mWGcQuSaqexwoL7e5+GrXpZAipPmnRIDclm4wm1taFvPPzup?=
 =?us-ascii?Q?KkuoUDEuwtF4FcqkmvD/DCxIbzm0gDM7/7tx91P5Kw3u8wYNMhSkgfwpNH8f?=
 =?us-ascii?Q?QUAdxLmhLnD6GUubkS1HWcFYUA+Zqia5FMGbUsW085PsbhKP0vGRhb2jhNUK?=
 =?us-ascii?Q?fxpmPxKFEGwPuJIneiJtTKiloZBDEvPb0a08f+4/RTQpXdwBXqI72sqdi+xi?=
 =?us-ascii?Q?UiS98/LoKVTenzwqhUAWYrpf1a0V2zyt7djFwjinLf/42LC3rlSOfhgjVB1J?=
 =?us-ascii?Q?LT3LtWhT1ijxRyYPW+cSsB6Y0GI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e07f55-81b0-4bfc-4f51-08d9c57c48d7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:03.9572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4feP7CaUcKFo/dc8BY5L1aeRGEfSfeKpCuctnATqSzgOlLgM2KoxsdHRrdFeDT6jL7QvSanSaarudXMQpihHDOMv/xnpM80RxaigyUYJL4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 2 files changed, 82 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
new file mode 100755
index 0000000000..8be721a24f
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open
@@ -0,0 +1,71 @@
+#!/usr/bin/env python3
+#
+# Test nbd reconnect on open
+#
+# Copyright (c) 2020 Virtuozzo International GmbH
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
+import time
+
+import iotests
+from iotests import qemu_img_create, file_path, qemu_io_popen, qemu_nbd, \
+    qemu_io_log, log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+disk, nbd_sock = file_path('disk', 'nbd-sock')
+
+
+def create_args(open_timeout):
+    return ['--image-opts', '-c', 'read 0 1M',
+            f'driver=nbd,open-timeout={open_timeout},'
+            f'server.type=unix,server.path={nbd_sock}']
+
+
+def check_fail_to_connect(open_timeout):
+    log(f'Check fail to connect with {open_timeout} seconds of timeout')
+
+    start_t = time.time()
+    qemu_io_log(*create_args(open_timeout))
+    delta_t = time.time() - start_t
+
+    max_delta = open_timeout + 0.2
+    if open_timeout <= delta_t <= max_delta:
+        log(f'qemu_io finished in {open_timeout}..{max_delta} seconds, OK')
+    else:
+        note = 'too early' if delta_t < open_timeout else 'too long'
+        log(f'qemu_io finished in {delta_t:.1f} seconds, {note}')
+
+
+qemu_img_create('-f', iotests.imgfmt, disk, '1M')
+
+# Start NBD client when NBD server is not yet running. It should not fail, but
+# wait for 5 seconds for the server to be available.
+client = qemu_io_popen(*create_args(5))
+
+time.sleep(1)
+qemu_nbd('-k', nbd_sock, '-f', iotests.imgfmt, disk)
+
+# client should succeed
+log(client.communicate()[0], filters=[iotests.filter_qemu_io])
+
+# Server was started without --persistent flag, so it should be off now. Let's
+# check it and at the same time check that with open-timeout=0 client fails
+# immediately.
+check_fail_to_connect(0)
+
+# Check that we will fail after non-zero timeout if server is still unavailable
+check_fail_to_connect(1)
diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open.out b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
new file mode 100644
index 0000000000..a35ae30ea4
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
@@ -0,0 +1,11 @@
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+Check fail to connect with 0 seconds of timeout
+qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+
+qemu_io finished in 0..0.2 seconds, OK
+Check fail to connect with 1 seconds of timeout
+qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+
+qemu_io finished in 1..1.2 seconds, OK
-- 
2.31.1


