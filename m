Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0278F47E64B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:19:32 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QoV-00088H-3m
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXx-0005pZ-5a; Thu, 23 Dec 2021 11:02:25 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXu-0005KZ-Li; Thu, 23 Dec 2021 11:02:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R94AMfT8QMdn1QN0W2MKJq3AEeQRvUARoKHcdeburAPVzVOzYIhnie5c7TbIp7meQoWbk30kpT+quBvcC+IkAG8fr/2oEQP5byPsesKEbVZlj4TDcKNaN1MG1K7QFzLQL89nmRoCZT2UA0vcOXBjx9N3NSR7z4PZcfhTClw1mg3XUkVJ8OykdG4DgyZDCkZesRIgndKDrxDBiCBLr/Gpyg0GddRIWh1nioRAAelXp+Bv319UeT1j+Jdi8b3B0CjyhiTytKuQe6rbM8AqFlC5MZ2454D3Hd1UgAoxGwFIcsegT4DI4OZx7UXFxDL2XH19BLJI4YL6rA4bnGbzRu8J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX/y5RRgTxN3+SaetWQ1fM1b+d8og1FNDEBJvtslr14=;
 b=eh0QUkWkck7YUprNnwJwFj6OnQ0z+IinBMMIpHvUoo9lXPY/M2CcwrSnc7XTMhRDNM4O4AgcwLJL+nG1cwGjoFgLOjYBcovnmFPHAQUix6/3hRxljZd4FGLBKRuA0YC/7aCUzLQK68HDwpAtkJ2PizTA5t2mZvdtoylng9nRtMFtB4I/zgmBd2Wf7lWuvBdPYgYGlUeH9cehFRJU1Gh1/4vCERnvP7YbAj0A1OCdeyg9TWLD5NdXvOW4wn+9ZE8fs3bjmTNEJjkMXpynjFDZPPUeNU4xktZcYrWskBJf+Hp4enxSIgdsfCBJErwVr2viWTsNkPvJXuhqf3W7lYSIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yX/y5RRgTxN3+SaetWQ1fM1b+d8og1FNDEBJvtslr14=;
 b=ujMDBEANmLZQtTVGm3QZiMh9P6YxV9IRXvnNJ0vd5/Wdm8EiQnc5faujq1QSi71z2H8RifQmCeirKjC1V6q2Eq3aRvSWx/n7NxGlESJRmq8YWiyZ/1W0org7PUShoUbPGAdQuumdBgJEk5UkwF8q3GbgzyfqLrUq4xd5WMmteCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 13/19] iotests/common.rc: introduce _qcow2_dump_header
 helper
Date: Thu, 23 Dec 2021 17:01:38 +0100
Message-Id: <20211223160144.1097696-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43de1d0-573e-4632-98a0-08d9c62d8d46
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB614872AA3F95F86011FCDB2FC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W30Je/VI0Btxmcfm3Mwf+OaTlNqLHJUiMluM31D2fn9QVH2AP8wYk3QfY8DuVw4rzuTmuMV0uREdzozrrGVTfyClxwZF0wjAYCJkvRjUHYuLOdfRn4QvLgpm3aEUXAx2Wfywj5MGFwlAIF3rXXfI4WfRgygVdkVkObiQFYUe1rzD9WnttQXLHE12gjU0t0Cvy9Kq+ocdc7EtXOenqumXYC/WGhMjHbWCFmydctAzBVeFumCbiKOZVFFNHJ3+a17AQuOiFFxzQ1kwQULQdFBeMTcwVYkPZL0HSo7nVpNvB80YmfKeKserHoY0KFJmF1ViF42NblqTay3W0+ldELYlRZn0GuNxnGs8qHHCmZ9OaunHZP7dsC9UjBEh2koI8BVTgC2bay6Kgt6L0yG9SwRPU9vmADxnt1KgcClipgRy/fnnB9KzvoLQSTskjQ1a2cK/vabhu7eEHGD5Cj5PR6ilnBVc/RLnIf5TRq4EvrME8KTYB7k1cBvw/eXHMUslxKmrXbNHpjlfEYbahE8P/lybAjCul96UJz0NSm+E3i5vE43SggtF9eXbgMLKEMk7MtviA71NH6DZI7AhA1akAmpktOB/UG1QnZhMYAyxpIGUQYMoIcxgGqFM162NUCjZEVeVZCcitP4O/ho27aBGYuHzo4fSzd08fng+ihX8rNy0GF3ctkdxAojilZkbDPhutgxG1pxZQVtuRfI1+4Hw2eyOFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(6506007)(2616005)(6916009)(26005)(4744005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yNBkTW4biUqSXMknuqbnX4TJlkH/i57MaOPOHGTSG2w0WP5Bn2tC86+M5nYd?=
 =?us-ascii?Q?Jye47VZhFDTLm0Nci4ginnq8cDa1DhO2yKut2ZfmIeCm+MrBlbRIblJiPVlV?=
 =?us-ascii?Q?7Vp2SzWuBxHblTwvw2JV8jJarLaNkXmtgdQKLauO3oybDzvwBFN285nbd8gA?=
 =?us-ascii?Q?VhsOg/7p0jCjlRZ6EzliVo6uBQvCTs6+Ug3teIhQsqqlpkphcTE5wIPMSzOO?=
 =?us-ascii?Q?Vpvf/8RAVfM6DG+CCAW8Ir6k727t9WIEt1xWlb+EViZv/0H80wi7pmdAuT8t?=
 =?us-ascii?Q?E0FWuyVfFVZBfZWM62hY5kKtfQg+gyfF32ZUs8PncTJCAW7VV51QgHpQzZ6N?=
 =?us-ascii?Q?6vwuo5xM/OfmkNuiywMcYdAbh/F/Sqt4qiqgIzCONA2+KOQCvqDcS+WUj6CP?=
 =?us-ascii?Q?bW6zrJgFGSsU+LrLv3WAj6wqoy5j6lRA0EYEk0KeVArdrnoyz8rbCf0erpIj?=
 =?us-ascii?Q?XOYyxTst6yUaNXgbxdSFIcnY9tZfouVsI+SBu5ntRleWvzeZDI1cCh6qCJEC?=
 =?us-ascii?Q?R8DGxc4Ck/O8y54tY+hpZrtOALn8M17cSWd3zPIKVzt3EaEDcpQTk7aFkR/i?=
 =?us-ascii?Q?NrL8CYAyWLpH8DwpSIwXHsI321kaj82Yz4fxuLl3tMzyKgMN1fkan6Jth0VS?=
 =?us-ascii?Q?5VC/ePfSq/Uo4uuqXXObTo2gWLThDHBdnBFFb4XfCuqh9U5Jdf/X6XImqiIP?=
 =?us-ascii?Q?igXo73yj50UYrvoqhBsRS6tQYAtY4AnDZWY9T2psucqt4QfuZVydgR//caha?=
 =?us-ascii?Q?ldj0R2PN17CjQ02V02d/hp9/3j5zfwGaMYoqJCxXmqMA4M91zAGdih//OSOD?=
 =?us-ascii?Q?tjS5zlcNtCfY+i2dHalbqjdqQJ0lmjIBvXTcgL/uHtdbpHgO1XaTy56unagk?=
 =?us-ascii?Q?ZAKFYvVDQ2Yo55RJQ2hWPM9djQeoP5eEzbI+jaIvOqsrapu0NkfTXf4mYpjm?=
 =?us-ascii?Q?mHozP+3I0srJTq+TqNNpxNHNyg/pyYpQdlW+16mQ4bx1+C57PzggVG3fWCGw?=
 =?us-ascii?Q?i8081Dcs0wbecejhwVUaoSSYpLSDshcTvWyl1Xqs1vHcS0xRZQejIzXRVT6B?=
 =?us-ascii?Q?7/S2sFSxQtw3msrtjA9fNrCHf54iTH68GzUqwWNVwzdJqJXBenjnE1HTFABK?=
 =?us-ascii?Q?+59Xl5n8AaWdG4Mt6K86cWnv2bWYMFGy1aQ6qF1fcEdZRdgQUp0dUh0QRxg8?=
 =?us-ascii?Q?CdVPe+Zvw4wwTP2+qxIP+25EwDMpMNVroebV9Ez6in3QkEz5Q5QWaCNlh+3X?=
 =?us-ascii?Q?oXX5wfYo4JaIOVp5Ii0SlpmcuLvSX0K7LUPnrHV3YJ/pFnlcO9iIxF6R/9xR?=
 =?us-ascii?Q?5/onCAtMr171rblmw3j0PQvA1rn76KOgPrabi3cTaJ/D9t9PAgBMdJO9+N6O?=
 =?us-ascii?Q?Cie1RIjGirNILV872cFDCOaxpbCXzeFGoKVou9YZP7KQK433QS5Kp5cYIwMC?=
 =?us-ascii?Q?4IkvMTpoe4+rx2mTSfHAkuU3wX181MxNo2nG/Zsl/u5okkqPWfJJ7ZjsWle0?=
 =?us-ascii?Q?EnfouWu4NJe4hf9zHLifJrq04YH4brbimFkxBqj3tEYiO66f74z2UKwtZ4zF?=
 =?us-ascii?Q?azJOn/drnH62blQEY67sfGn4l5bYqy4SJC/pvK9Xuj5otqN9+esNHsQuzwiu?=
 =?us-ascii?Q?Oyb1Hg9ioSJBpwe29kmTbmjiwQJh6MJ7pi0R7Mib0BKzO80v36psG5JX5YpL?=
 =?us-ascii?Q?tC0+JZgu2DReGsJyUhSofEHpPVo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43de1d0-573e-4632-98a0-08d9c62d8d46
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:59.6458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVmqfGZ9dccg0gZKcGC0xSedS2tfV9F9g6aqLRI+3IIs+rU+NY+aG7g05QEzR6f8i1u05EDjhgVMXXPk5AzexKUI3XtvIla0XW0EwQNszY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We'll use it in tests instead of explicit qcow2.py. Then we are going
to add some filtering in _qcow2_dump_header.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index d8582454de..5dea310ea0 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -996,5 +996,15 @@ _require_one_device_of()
     _notrun "$* not available"
 }
 
+_qcow2_dump_header()
+{
+    img="$1"
+    if [ -z "$img" ]; then
+        img="$TEST_IMG"
+    fi
+
+    $PYTHON qcow2.py "$img" dump-header
+}
+
 # make sure this script returns success
 true
-- 
2.31.1


