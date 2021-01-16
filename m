Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BD2F8F8D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:59:42 +0100 (CET)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tbh-0004om-PC
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQU-0005Kg-1b; Sat, 16 Jan 2021 16:48:06 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:11232 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQP-0007As-6B; Sat, 16 Jan 2021 16:48:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikk+EoFzBLX2YWCJYhqYMbM3VdalW1vWf1BCiVkRB2aDvGOCBGQkiUZRYIUjD/bKUOLCxvYEmwuVgH4NVG6pbaOHEYNVlgGZDkTSS4Y1IkcMUKZBhg8ZxcPzBhHA8ssr4wIusNLPM8bPPgJGSCKzHJVRb17nCJFvfxksMoWkZ01KqhWxsxNVdgx6bV+V4E+yNwo2WWPca61pGUyrT2iiic6vHNhaQ2ZGwQorIuTiaE7XwFkMC1pU1IJRxM9xyFOVkPY2ebK/Wo01XuM0i8ulwVnip8tGUxXdBCUsPlyl+s7sfyogtUNcY/qp170ZICDMg314OOEFGWXlO/y3MSORng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBeLVY+zylXGeIvFfa1KHGiqcpiss4iTeAA81oPivNU=;
 b=mt85ckU68xFUVPFBG2hrJE2ACZtdnBoQ00RPK78HaK3mNoSmnFjY5QWRk+WBZkOpNOOcrCr3qz+X2wZsf+QkZKBjIwXfnhyJHEQ9Bz3LgTjVVmpCowN2Zl1xbvGebLWXzvdVPRfKAJJkG8vpeEkkx/o38XR3+0mQB8Lk4A559OsaOGsJgs+kgLj76oUAqOaTxQH5eiH4pSm21YkNjBT1+HldqgcA5SPwlKupTXg/m5f2W89QSDZThlbUPouX29j4xziotkb1hiJcQlpjJ1HaDcjNviKnIScwKRuHUO0l/YTTeYfBXdJAtmhaxv9f5LOYar3H/A1HOSnW14zwXpX5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBeLVY+zylXGeIvFfa1KHGiqcpiss4iTeAA81oPivNU=;
 b=uD3vG8MR/azzfF5SLx301srCgAhZ2RlS6U5VAFYI5v0RuWNriX80JAMg9/xO9ZU6+i7U5BhTwlt9zQs3v4TLvbIh+tqy1ouusES3MRlkBKgHoRk2Yey0dnwVwOPP151atBn1mrHJSGA7qN9q9g+TZ0CVsH36S2Kq6sc5VYBqI+k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 12/23] iotests: 185: prepare for backup over block-copy
Date: Sun, 17 Jan 2021 00:46:54 +0300
Message-Id: <20210116214705.822267-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51d204bb-783a-4f5a-5b48-08d8ba686059
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542C5429E44AE1FF4F9AACBC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+UefO2/xcjRvZjE8xlkXSd+h1idzqdGM5XHGFlIEcjl/G2NWJDMoVgblOR/IIkuxiTma5XCL6KzlDdRUfANCCPh3oInC+rDNLH/ZaSCgDmyg2hb1Am0LYUiUsX/D/MA2zLt5ZphZp+1bgE/eHLi938OADMHicGdooiqBmneQy9PkV4j44Erkx3qPyykheNEk5U9F7tgWdi6yG5QJOuDXk4EXSPJqLVYnboCsEMkBWKJmV8Gr5Lh5LAWlTJk8eNUuZCNYzts58Yl+F5nwOBop6OFGXNS/BzX50VtrS3Y/szIwh9wl0+5MMmT9LrBRyhak4QRsGZFqUDChDxcrnxpIjkl06BJQq+66MDqqITnmU5/0EPCi+tdZ0c3ozjFtaqoUIvt1EOsQn2qcGyDPK8ptij63an9k7TAEk7oZSAeuwz9XuesK3n62xJn0unnmrndi4zz3xg3OccT9z740bQoSu6e7BGPO+Bs9OzjXBAzj8MoSzUsdzokxEShD1lqpP7zSd0ZWAjkjBf6syRA+lHi1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WFqAp8fuJ0+FnQ+Yu+Eqghxjmd+iUPU2FOypT3AkRrqGag/LOtPV/VwPB9Ay?=
 =?us-ascii?Q?XOSVQy7GGgF4XpohbWoa7k+ou2W21xmix3Yn9rneL5Rqaf2nyQAofawnBgMn?=
 =?us-ascii?Q?TRJhKhFT+FdMHCVOS6EOsSv4pLkESvR2f1PElAyPpB+bTcGVmvndSLlbHQll?=
 =?us-ascii?Q?6I9aGORPO3IKETk3tefZedeB/7pqp6LK7DCV3/KQcWhdJPRWZXTni9n4codq?=
 =?us-ascii?Q?UurYlBWeEnVKoikKj4NYwwX4VEZQ9Jm8CZZl0wPJKWWTVC2VRW8TsLudaL/u?=
 =?us-ascii?Q?6Z2vYI35agTJh8x/XBZvBYWdvzLj57dMJcHCs4p1Lw6WpOmyA85WMsUDEjBn?=
 =?us-ascii?Q?OuFHwkqNTnpZpQ8lAqMcve7mSGyzJmPsvDmHLZLq0Fx1hleoj3DQyjhpjqMl?=
 =?us-ascii?Q?aD6gYj+9GApFt68qa1RrWY5SNC795Jno3GlClVxZxPRpEFV0hKQDTjkC3Nug?=
 =?us-ascii?Q?URF4i18WeVODHcGXdRocYo1d3QQ7mdKKYP0Vav9iP+vphEx1cGmzv4uDNlPz?=
 =?us-ascii?Q?rE3QO8+sYc77+uKYjsWIlzEUdfcQcLOSFtMYsZ74yyvOhJFd5bMJC8Tnc6IQ?=
 =?us-ascii?Q?U+PVs4MBZhiF/24LdMujtxQJ59saLpr1KyLwmkKJUC3rTxhpfu3Cgq+uIN73?=
 =?us-ascii?Q?M+LuFWGXyISCfBn0swD2WO0BGC2MUUYisZajsZ9ZGf7C6XhZpR6EWeD9Np7m?=
 =?us-ascii?Q?/AHP6LpkNawwYhtnDjFTxtdW+OazceO6/mizIA6YbgQbIMD6vluJja0g3TZC?=
 =?us-ascii?Q?JFlRo/CARx1hEvd/wnOkRTZpJwZ8B9rf5wCh0X03nBX4UYq+pW7u37VG9NUG?=
 =?us-ascii?Q?rlW+/nWP6mmhhtWqclAUHeM+ogNH7laRHyqnShMGE8rVXZ5JhyWqQxtrAYj8?=
 =?us-ascii?Q?N5uWgs2XpdZ264MVMImOvYCWhyvNwO+xyJvaPTPxy616Ab/LaZ3Mv8jVv7FZ?=
 =?us-ascii?Q?mpjMQBOlhE0lj2h994DwLSL65V+XoyiH7idOcZA9FbOld2frBE+ocjg3xVbE?=
 =?us-ascii?Q?3sb/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d204bb-783a-4f5a-5b48-08d8ba686059
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:53.0620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tMrnN2QeRIMiBKGZc9DFDmq53PqGcjTV7+KNQzxBzxrV5O2kH8XCkNHgmuys/NZBwxjLCIQKWdEkigZrM73D5VVOkBfZQ/D08rPp1p5P78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The further change of moving backup to be a one block-copy call will
make copying chunk-size and cluster-size two separate things. So, even
with 64k cluster sized qcow2 image, default chunk would be 1M.
185 test however assumes, that with speed limited to 64K, one iteration
would result in offset=64K. It will change, as first iteration would
result in offset=1M independently of speed.

So, let's explicitly specify, what test wants: set max-chunk to 64K, so
that one iteration is 64K. Note, that we don't need to limit
max-workers, as block-copy rate limiter will handle the situation and
wouldn't start new workers when speed limit is obviously reached.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/185     | 3 ++-
 tests/qemu-iotests/185.out | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index fd5e6ebe11..0efadcbf62 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -182,7 +182,8 @@ _send_qemu_cmd $h \
                       'target': '$TEST_IMG.copy',
                       'format': '$IMGFMT',
                       'sync': 'full',
-                      'speed': 65536 } }" \
+                      'speed': 65536,
+                      'x-perf': {'max-chunk': 65536} } }" \
     "return"
 
 # If we don't sleep here 'quit' command races with disk I/O
diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
index eab55d22bf..9dedc8eacb 100644
--- a/tests/qemu-iotests/185.out
+++ b/tests/qemu-iotests/185.out
@@ -88,7 +88,8 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off
                       'target': 'TEST_DIR/t.IMGFMT.copy',
                       'format': 'IMGFMT',
                       'sync': 'full',
-                      'speed': 65536 } }
+                      'speed': 65536,
+                      'x-perf': { 'max-chunk': 65536 } } }
 Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk"}}
-- 
2.29.2


