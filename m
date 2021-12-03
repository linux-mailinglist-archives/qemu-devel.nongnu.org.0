Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB084677E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:13:26 +0100 (CET)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8NQ-0005ww-Pa
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ih-00028G-3p; Fri, 03 Dec 2021 08:08:31 -0500
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:63695 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ie-00072T-K4; Fri, 03 Dec 2021 08:08:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLBX9YncTtVL3+DX9HmHDbyyqh150CfDz4lwqSBX1t6BVdufUPXAvWru/+9BJYbeiyjgT1fO1eZCGskYD5H5P8qgmdBRPXfKXxIc5PSb/f4FAkIqxO1YIuhsXBaqkJ9hYI8HPr8VXS3pXeYyTEmDVqlSgqb5yUNbvQ2rT2ZlJbr5Yv8iMWr9ZNEUbMorX45oVIaDpN02LJy+0vxI2NEACTXH3TRyoHMzHQT9MJGYLsmUtt1VdDdeNvHSQ8e7H76CI0UJN1YCXwfpJf4oNy/zyJ4e3ZuKkRjiCOGsvMcvlbCOrCpnfQcQ+t4Xx8K29K4LYcT/FwaxvD4AvYXOC6Z2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zcc+de4kwWv5zmz0NYMY8B2kA70UV3IY6wCEe9/wOQI=;
 b=UfkHlAJNEO0Z5iPRGVd5lkZ2H5xD8dIJF3hs7dmBEZKSsLuiNF7Hxesh+wUmMl7NgX7LNLiVWhWUDy+OKqViqRw+MPSe1e3x3v2dPNoIPZElTw97+TAfZqCxFrbAkacqanRdmdIhlIBRQcjEjJWrFR8FQ/ExqgzidNdFItmuix+ykZvuGfV6Suntnyutbp3owC5x2nv6mexFmIeMi+ia1YgYGOJzOrIpWXPi8lVaqDo+7wRCS9vWXuFgMirOVFW55gPKH4lh6+N3m5j2y3+ODfIlLC3fMzLdxsD3LaglenQCE2PNDp1+gr9s88YyEH4cIpkR3MRk2j0yrxdS7+4i5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcc+de4kwWv5zmz0NYMY8B2kA70UV3IY6wCEe9/wOQI=;
 b=naylNr6LO1+12aIlnLGYQcM86NoQQ+1pw938SkvoX1xCwZyiQkoTLSL2r8su6EtwjJHQkFAb7XHIsMwFTKPrrAr/gpvBvEKIRsdSU1ADScBgKM4N8Ej0JXmXJXl32YLHig3W4QghL8BgHSyIMelsIHz8wALXk/x1y2IIAa3tP7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6968.eurprd08.prod.outlook.com (2603:10a6:20b:417::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Fri, 3 Dec
 2021 13:08:23 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 19/19] iotests: specify some unsupported_imgopts for python
 iotests
Date: Fri,  3 Dec 2021 14:07:37 +0100
Message-Id: <20211203130737.2924594-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1dd4e17-85d1-4132-9b28-08d9b65dfbc7
X-MS-TrafficTypeDiagnostic: AM9PR08MB6968:
X-Microsoft-Antispam-PRVS: <AM9PR08MB696808F32F003D183FFD0F20C16A9@AM9PR08MB6968.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wozcubGQFQa0ytv+EpyiPsOJTlTNBJtt+J8IRsSb9IgL+QK87yqISXlNGSzS7Rb7B7pqXXQYYjD5hQtz6edqdcDxnmn6aZQTbE26DljG5u7kWIBUYYNwPJ7aI2a9NewHvIR1It8ztp/EUxipFNBwn8U6geQ9iHcOijrNguSDw4T20jIA41Rm3R0ohM1SeuZFvo4oFKnjOTOZXhKUc2wj7YnIG+DeFxds3FQ99aOJspb4dIFn03XHlzGpqyNDVKsklgwxoUyu3pgxUkYyxEwZXVJiE52GNK8K/ptU1tzIf8l0aD8Wyekz8daSHzAJL0nIs3BFIq7L+OaIC8DoqeJqVnTDmfYNdjbORvY8sl8u8RHkafPaYNZr+bYpUWBoZ6Sh1UR78pZxQM3FZr0DiwWjvIobMzrgcGemo7S94WRqyXfzCvFYYwSPJ2x7OH50PMBUzaeutGdjutQm1LYzLxgs1j786heuqMKP+nRo0MM9qI0KHH2CQLhoLZKfRBUMxEC8o+qyeYr3ATfV7BLHVCJOh6zajUZYkrK5iHp1yQzpSx3YMUrZYmKM4cn5FXkwjavDpw1VFjnxt4XVlRX6P/208TxpHqm3iszr84LBb6fO49y2eJa6w4YsJuO7L0OH7Z+tnHkYn965REkesBgK4dgTslfzHACFsCcALKyOd7HM+vYMWfeFD35BsWN+qCbT5O4NJDiBXJAsLVrcReytRwWL0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(1076003)(6666004)(6486002)(8936002)(2616005)(52116002)(86362001)(316002)(6506007)(508600001)(956004)(6512007)(5660300002)(2906002)(4326008)(38350700002)(186003)(38100700002)(66556008)(66946007)(8676002)(66476007)(6916009)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?robtl1/3QwzGHoVwyXTZiKoPprs5gWhDe59VwZ02MqbCWxv4UGaJOgOHmgF6?=
 =?us-ascii?Q?JUu1BjM9X8eb2oShlFnuTpTu85SW0ywR+3+pvN/xwaXGuo/igjWJJFCH911V?=
 =?us-ascii?Q?0e/J79uiQbbq8NhgFYY7qjFqBTooN7C837nqE5s082yQMmEaCNw6bQG0YkvM?=
 =?us-ascii?Q?jv0zTEp+wfMU6obDnNdScfqFEC3mbz092BngDpSuecqbOAxJtVUUx+CtlOpJ?=
 =?us-ascii?Q?audTw/c6+SbyySfFSV+duQALZLoFBQ0rxXgCGL2DNYBiYBbuvPHY23QLn9ER?=
 =?us-ascii?Q?bR7wMEY4zNL8u8apJYqDFWzTqF6icAV5UGJhLasJ0AvJx1ikYmJrwL8PUPuy?=
 =?us-ascii?Q?OmJo0WQSE7EQWJysO88/Auw+wKMYo9ssyt6GzifJZ5MexbQUvNpbwFzG+bCj?=
 =?us-ascii?Q?+eYpyllOfhR5iC4HSpKXKaC8BuvtU9xJB4pqaApc5BloFoQb3cHN7YkUZYsj?=
 =?us-ascii?Q?EviJvJ7exKGwhwDRgYgM0VNXbIZhAoHI5s1ZD+oYn5kh7F1y+VUEgCwqzFN+?=
 =?us-ascii?Q?Vtu80MRXygi5BBjC5fHwNNQ5ChLWleeKB16hMdbAhFPHJnmgRYDHQGM+dcuu?=
 =?us-ascii?Q?wcgQpQ6vhpdgq4M4fL7BFbqAKpoWhhOzhTGT4TQ1YBpnvLl2vSA6RxFmDThX?=
 =?us-ascii?Q?gRkMixQ+JbmKSC7RboEUgaYRyg71mqctwksWl/IcDt5OfsLG7bleYXDUBY7I?=
 =?us-ascii?Q?SG103TPYRcGIwIhkn4s6jVd1q6/WwJPJBpfMV2Ry1rpPnChY1fttShYRybSa?=
 =?us-ascii?Q?ZtuHIwtfoifh429cZ0bZjoiGG5ZrJHykS24Iy7koUwizL4/08DgjSAjmED8z?=
 =?us-ascii?Q?uQrt36iXiFy82dGEf+TdgCNPc62yl7mMN6qBraZvYTl3AtHr2MkBxPnTVomJ?=
 =?us-ascii?Q?CQ20tqvO7d1+JKQ/DSLVpSH28+E5U7Yi1WkUE0uXchPREtN5Iyy4A3f9S/BU?=
 =?us-ascii?Q?GjCJV9TegHZmQR4t/lAybWCj2mmk8hK7uBV0omVlUAretlZX8iGY5s99At6N?=
 =?us-ascii?Q?jq6beTWbAfF+1rHl9rQEbSu0Cvrjqwlxizp006MKktZm4aoXGsA8H51VnlVE?=
 =?us-ascii?Q?jIGRKQTEc/kOBY0D1OstGTwzyd1cFyJtOXXvaUXYPSoWeyExPKw7Ep2LhhMP?=
 =?us-ascii?Q?fWcEULGAyhNHAZQ7kbTPI/hEKtKtsjEgCCrzpt8rQSX1XS8ABqGJGfTQZn8Q?=
 =?us-ascii?Q?wutRQqJaRl+qJoJzjkQ9DSt7y29fRV16X+TYKt/5RoJYH/LsGC2Kri4OGNDw?=
 =?us-ascii?Q?+cDP9uIVCy9kV1fsH9ek3eHV3qo6RwjAImbp+1wUFlUQ/1dZ0DsKL08qPwDn?=
 =?us-ascii?Q?FBZBxqIDdsQOiP1hjOlN7GzTLRmdSxiCPmEj0S7Qz4ZeqP3zGQia4qu7zevJ?=
 =?us-ascii?Q?lPtYO67lOqJ2QQWFbWDcQ5VTqro+GuIjLWoRxSybT63VEMlhe2zbULQTmBgV?=
 =?us-ascii?Q?RE6SA+bJzTzIThpf2RMmwvLSeihxKcNpVGhPcqJJ+yUYP3VbuYrZIfxx2iSW?=
 =?us-ascii?Q?MwkF7Z7FOK3vIwx5v23FngmwMICjVPNVF9H7//Hx/NCMUOVrZdQrq8lxbq4/?=
 =?us-ascii?Q?Pgl5QMygpf66eyDUAKsjzqhe+7srFy3tFs7DDVp1WVdLXPHT7HAVEvWZAoYL?=
 =?us-ascii?Q?i4HKscyBW1k2w2pl1TB8uCh+BkfVJD1/0aR+PD+5PkAQx7KEJ4R/PGjsWEBn?=
 =?us-ascii?Q?+0ps6g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dd4e17-85d1-4132-9b28-08d9b65dfbc7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:22.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYqmShh+I/sWf0GrHB7FFiNoa+QUD6llwe3YxAwT8xQ2uUsb0rnUjn75WHznHDcFPuOfepxS7HEQosF25FR1h6k9qBcoKle2OI4kdTfp+3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6968
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We support IMGOPTS for python iotests now. Still a lot of tests are
unprepared to common IMGOPTS that are used with bash iotests. So we
should define corresponding unsupported_imgopts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/044                                 | 3 ++-
 tests/qemu-iotests/065                                 | 3 ++-
 tests/qemu-iotests/163                                 | 3 ++-
 tests/qemu-iotests/165                                 | 3 ++-
 tests/qemu-iotests/196                                 | 3 ++-
 tests/qemu-iotests/242                                 | 3 ++-
 tests/qemu-iotests/246                                 | 3 ++-
 tests/qemu-iotests/254                                 | 3 ++-
 tests/qemu-iotests/260                                 | 4 ++--
 tests/qemu-iotests/274                                 | 3 ++-
 tests/qemu-iotests/281                                 | 3 ++-
 tests/qemu-iotests/303                                 | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-test          | 3 ++-
 tests/qemu-iotests/tests/migrate-during-backup         | 3 ++-
 tests/qemu-iotests/tests/remove-bitmap-from-backing    | 3 ++-
 16 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 714329eb16..a5ee9a7ded 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -118,4 +118,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 if __name__ == '__main__':
     iotests.activate_logging()
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 4b3c5c6c8c..f7c1b68dad 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -139,4 +139,5 @@ TestQMP = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index dedce8ef43..0b00df519c 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -169,4 +169,5 @@ ShrinkBaseClass = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['raw', 'qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index ce499946b8..144cf4a7de 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -157,4 +157,5 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 2451515094..fe93ebd760 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -65,4 +65,5 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index a9b27668c2..8cdf02e8d9 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -26,7 +26,8 @@ from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
     file_path, img_info_log, log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_protocols=['file'])
+                          supported_protocols=['file'],
+                          unsupported_imgopts=['refcount_bits', 'compat=0.10'])
 
 disk = file_path('disk')
 chunk = 256 * 1024
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index 5932a0e8a9..a6fef31e1a 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -23,7 +23,8 @@
 import iotests
 from iotests import log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat=0.10'])
 size = 64 * 1024 * 1024 * 1024
 gran_small = 32 * 1024
 gran_large = 128 * 1024
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 108bf5f894..5f08541214 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -22,7 +22,8 @@
 import iotests
 from iotests import qemu_img_create, file_path, log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat=0.10'])
 
 disk, top = file_path('disk', 'top')
 size = 1024 * 1024
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 2ec64a9b99..c7b701a094 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -23,8 +23,8 @@ import iotests
 from iotests import qemu_img_create, file_path, log, filter_qmp_event
 
 iotests.script_initialize(
-    supported_fmts=['qcow2']
-)
+    supported_fmts=['qcow2'],
+    unsupported_imgopts=['compat=0.10'])
 
 base, top = file_path('base', 'top')
 size = 64 * 1024 * 3
diff --git a/tests/qemu-iotests/274 b/tests/qemu-iotests/274
index caab008e07..70a2f9573b 100755
--- a/tests/qemu-iotests/274
+++ b/tests/qemu-iotests/274
@@ -23,7 +23,8 @@
 import iotests
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_platforms=['linux'])
+                          supported_platforms=['linux'],
+                          unsupported_imgopts=['refcount_bits', 'compat=0.10'])
 
 size_short = 1 * 1024 * 1024
 size_long = 2 * 1024 * 1024
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 956698083f..66e0aa91c9 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -245,4 +245,5 @@ class TestBlockdevBackupAbort(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 9dee2bdfb8..d621d37b82 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -23,7 +23,8 @@ import iotests
 import subprocess
 from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['refcount_bits', 'compat=0.10'])
 
 disk = file_path('disk')
 chunk = 1024 * 1024
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index 00ebb5c251..0e89fc1dc0 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -272,4 +272,5 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index c23df3d75c..a6a6437c62 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -307,7 +307,8 @@ def main() -> None:
 
     iotests.main(
         supported_fmts=['qcow2'],
-        supported_protocols=['file']
+        supported_protocols=['file'],
+        unsupported_imgopts=['compat=0.10']
     )
 
 
diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index 34103229ee..12cc4dde2e 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -94,4 +94,5 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat=0.10'])
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 8d48fc0f3c..da4d0b9c7e 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -21,7 +21,8 @@
 import iotests
 from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat=0.10'])
 
 top, base = iotests.file_path('top', 'base')
 size = '1M'
-- 
2.31.1


