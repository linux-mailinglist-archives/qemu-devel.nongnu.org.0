Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FE2B83C2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:27:28 +0100 (CET)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSAx-000406-9t
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpL-0004i5-3t; Wed, 18 Nov 2020 13:05:13 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpI-0008Qn-Q5; Wed, 18 Nov 2020 13:05:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9LFQsM3KJDc3BEW23QPoBGsMVsJUzzaUMgXTD4CLdWFL/UZO9NbgOe4fYSOgqsjGPbk+y2KENJn4jtsrARtq5cieeySu/zHKLBErbOW97wXYHJeOzSNVzhMYbRS6oe1ddwJy8DmAGAeCVs0vHqlzViYnSYmMwaOZV1OktZiLe8SXEqBlBpqcHAMg88OIS3EkXZjd5yY+UtiuKtkz8gl3/vav/MZDMONwrPi3pz77kgbpMpHMsm0vLFfrrDiMwx5ReRhsFqAEuJHb0qwi6xVs+srSBzf/dtNVtwPLzlYL8yjNgaeRmR6ac5vb1+BnsrRA6sBlKqT+V4PNsmjmqfiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPjt0kInIECsQgGe/qcum92Xm09EG7DNn3GWRUibcig=;
 b=Mqc77g0U5WRQwMejUvjoH5zpnBxfRuaB+AIN52VnqXu6Fm5cP56NGFJr646tDSl2d5m/QX3hpraXRwRr2Bbd5UwuakDYRjEhiBpLQu1wViubuDOjgsOqzw0AFwpFniXle/JSJdEoMwhu2VteH8eRVvEeiFzSflsxRPAe6LP9xuwsj2ANMGk6uMiNNu3jypw4pkY92B+SoxOUz9JEARduLtUn+F4qvkcYL1UBkujz+qlGZupGW27yBkdpkKZWhRvpSnSw8sBzCSyBASaASzWaEnqzqLTu3nZzAVVZyKfKCP6avKyKjuuQgbrIRTsooqyeY2cv68RFNHm01pJGdxOI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPjt0kInIECsQgGe/qcum92Xm09EG7DNn3GWRUibcig=;
 b=SD255RLUy4uuxheqbN7jLhwmmpZKEgcyI1wrBxshu/CbSWPBv7YunTDK9bw6Z+99RauoLDNvpOZh9lQkg4zGewfH3N6ViQeB6Umj0hQ2VCbP9vXfnlwY3fidyU2R7Oy2KS1VKAXy7sJ7jnETeRr27MyEaNFJdJaLlEPVJlnXPoY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 06/11] iotests/264: fix style
Date: Wed, 18 Nov 2020 21:04:28 +0300
Message-Id: <20201118180433.11931-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 152eb984-d6b0-4af2-86f0-08d88bec71dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912F682FBE7E104AB592616C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcvRa4GxIjlWH6xokOH6vBweV5HSIacB6btujowAOmxbvl2Ib95SyoOGMUSdBgDUNgZInmMfkLZRUBAoMSl1gqJKSszZ1YxBdZuSbaJ2McWmOyYURjNuErY0rYkuuUiDuq9b8UeqjbWj7dLIHErBrHg6Fjy1j57BjSzx7rGc/YWqnEy3/fmDAakVgNnTN2hjOzl+REtLnwXECW1FRxMr5MkoYoDLCO0t0llsHh1yNcJUJlyJuYfSn6iwMAAOLCMcUoW9rwohkSmyh0m/FbK5TmxS/NURpEvR02N3vZIIDuWhoSg7hZcwb+/UFxSVxbPmvoWLJxjCPrHEBjdcVtTVgdei9nZa9jdTPf/RdQEgUKtMdbWZbdqDj4aDQEQtvN1v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: zEYso+7dW4QaD16O9uACw+dspYSnBfTZIfohHdxncMj+uAh1JC+PnId1j6RGNeD95DyI3v0yH5hMtLj3T37+3lWMGjpWdeTDuhvUQ4N+NYSvyZBtPU+yCM1fN2XDQcA7T9F53rAANQEKmOPy80fnFnQw8Ym7uxOreNEMvQCALAsAg7d3m03XCLh5zJ2O4ES7XHh8EJaRqXDLVPsYunLDXYOsAq+6RlM/DqkGqHDpduxz9WCIW2MeVkhpxyQmoYi35OX4IwzeGwL6RVuFUR9YjIRas22XuzG9LxtzYAVSQT7tViUgh6JsaB+ccI+j0/bk00eJqnT+IDCDNBY69W2XmxlFdS9Os5JtnuRVUMkIwAVdZhtKX+7a4Nz7GwnYybeZXPP4Hz/rduPXreCMVqxoERST6hnmQYUrU3bRukoAE2VM4zWcWJIE80A+nIEtkVimp2igriNnWNSGZxOU91k5XUtelasnhQmiMuW66BFYcbJaiz5M57sVsRa+0hVVcx7K6XODtunilBEgb2SNr5ZmCZVX9RSJQIKiWiaOdVE+y7XTYyplcsG4IbpTvWEYr6ACgb/T9C6cGkTW03aQcWFEodWs0nZ9RsCxv0AfpWY31mrw8ema/BKwqZfo9tpD+orx+p67popTeUXwl2tvEy55ZA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152eb984-d6b0-4af2-86f0-08d88bec71dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:51.3304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTxc3nAZZjYi8Neexj0DKD88jLJjf8o8IBpvPUSAmVwsoKEzh8OzTocSgsK6Nl1WJ9yJjuoM0GyKZLsH60+WPcyoKWiC8bYl3ToR089k+Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:46
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Fix long line, extra import and one mypy complaint about incompatible
int and float.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/264 | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 666f164ed8..0e8b213657 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -21,8 +21,7 @@
 import time
 
 import iotests
-from iotests import qemu_img_create, qemu_io_silent_check, file_path, \
-        qemu_nbd_popen, log
+from iotests import qemu_img_create, file_path, qemu_nbd_popen, log
 
 iotests.script_initialize(
     supported_fmts=['qcow2'],
@@ -31,7 +30,7 @@ iotests.script_initialize(
 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
 size = 5 * 1024 * 1024
-wait_limit = 3
+wait_limit = 3.0
 wait_step = 0.2
 
 qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
@@ -48,11 +47,11 @@ with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
                   'file': {'driver': 'nbd',
                            'server': {'type': 'unix', 'path': nbd_sock},
                            'reconnect-delay': 10}})
-    vm.qmp_log('blockdev-backup', device='drive0', sync='full', target='backup0',
-               speed=(1 * 1024 * 1024))
+    vm.qmp_log('blockdev-backup', device='drive0', sync='full',
+               target='backup0', speed=(1 * 1024 * 1024))
 
     # Wait for some progress
-    t = 0
+    t = 0.0
     while t < wait_limit:
         jobs = vm.qmp('query-block-jobs')['return']
         if jobs and jobs[0]['offset'] > 0:
-- 
2.21.3


