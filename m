Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EAB47E62F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:11:13 +0100 (CET)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QgS-0008Tf-2c
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXu-0005fJ-3X; Thu, 23 Dec 2021 11:02:22 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXo-0005KZ-Rp; Thu, 23 Dec 2021 11:02:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfI1ggC4Yjd8cgj5xxM0tNj5tVWE30hNDUBbfz0Sp2DGJlykpcdLl9gTpXNTvSE5HQh6YOSm80W0aM3AT+luVbPS+VAAQK3Q0TKSPDohlDYks1i4oFxpihT7yTr21v96XVae1XpWtBfOae8KQ7bIAVBgEQ4hSuVeSbnR22eN7kIILHLvk12Kfj0Hqk0IXZGT5DdFNjPGI+wTvOz2cjq0CobQ5DmjsaQ4+rNC/eJ37IoTl+osfFCn/Ugh0/SBJzwpZtQThylbngtxP1Y6yPbYAvCPkHTKO2dcfrHXagg3OCkClpYzr2GLFbrq4nuyMgEkhuIfuHTEQHKvwApGiNoZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjQCHljwpc8KaOozU1GtqFJZ/wxePith2kFAjsp3U+s=;
 b=Rptfrw1QbkdZh3my8f3xEG95AVzHmFyNH8FgEH+JSGCC2HexUbaFdoK2t/s8WMhbegGll6criA3ILkTsqaUaAof6D1fA2HR7DPTwbFSyo0cfuWpI7JZ/8eA2WNoBkHgUG2g3I8WfxAxDT4yzdQ17FHfYu2RCiaN4eyUo6Y3F2n/mNVQP7g+oasnt5nhAi9Yik6yzzy3hyNWIXXOld5+AY3seju/D+g6SJx5g0bZt98EVAVIwn5fuw/3aKwdobD5HZIVYOLjjycqNKt6g/znzvJ80ZU0QpEEovKNaEv6jh+0N1ffRWDuuD8b0pKQi0sEYvSWhv8PUMahmxX25SFO07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjQCHljwpc8KaOozU1GtqFJZ/wxePith2kFAjsp3U+s=;
 b=Dv7oa6UItTSfT4unvOm99vpZ7S1hv/vs6PsOdVeILv9Bz51Jj0KU6ZesuP9/8ca2HcJIk2lFItGabbPPXhMx7XLcnUX6IlrxFGxCNFgiFaCMJQzD3RPnRDmHGtT50Zu5h0e8jweT8WjnLJIpnXQPtp7zwYWIG0YP9qM7ezjAgyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 10/19] iotests.py: filter compression type out
Date: Thu, 23 Dec 2021 17:01:35 +0100
Message-Id: <20211223160144.1097696-11-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 657eeb9c-0565-48ed-79e1-08d9c62d8c6d
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148A4883A4B4D4CF10E5045C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqS9qE1njY8U8z+ZR6YIKZjE0UDLIhSmfgmgzG2nMfuyXxanqjTz/QQGbtMRKywX/W66HejcdAqDo3npplakI8mNgrXb4BG3s3vVw+GWa2qr5JeM4SeWauRKdaA91FxJIdvWtlaB5n/X9gzTJzDn5qyi5cz2N3IzSZLVpR56JFeTKFzwcmdMCV5zEubVi9thu6r/KhZbd5vhADuByoRFRcSTe4nRdl3hiFanWielsObnKBXWtWoRapabHzHwO3iGCLp24Xk1chTlXptAdbck7Zu05oUdSAaypKPxjsvQ21oOOeTrGMzhm0PoS5tVjjBFVAj+gVO12DiqM1+EA87pjJO2zNxHi1UXWfKf/EyS9GDAm7xHEzrL6rwyJH2Hu5CTYQNjfsY1UWvyzBtlmJBHtkOciUyxRt185WR9TA4I5MjFCE9VG9YYAesqLrjY2HBsM7TdaFYemo5TFAYPZUJW0QouvtT15CMc7nZjuLPVOKEdybPVf5LMOyHkd2lyUyN4MqKAXOoZlfr5jxDc47kNLN/IiXynLwjOkPhSXlJSP2rXbWA8LUWE2CSyIA4JuAxTce9kwbjpjy4lWxeyzey0iEPaTrnxebs4KCcSBz3FNkgGQOfpB5BXyqRcClyWE2RhF64EhZERnDNnNiAvP25LL5Gop5cstBfRq1k09aK1g/mF4jnBwwxVTx9Pu4OB9K58cn9L4AMWzlafk5J0cbWqYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nzbtkvk4V/35vzXVlbt7IABzCEgD0lESNTSCw6bTelIQEythtLw+LYilUTT0?=
 =?us-ascii?Q?+LVO9uTQFQKsnUybxiH8s+IU518+Lr/Rhw9ZKyeICeiS/lErbswZnnvLuSeC?=
 =?us-ascii?Q?EK5GIf/AQZLXV906XQxi3kQs3DkQjCq4SI24IfQ7tfHz9CVobkpiVVlVbw3U?=
 =?us-ascii?Q?I0P+oSk6l6yKEkWpTzGGPZbDddqvx/6UJECpXdjz46fqWPM3sMlaJs4XoO82?=
 =?us-ascii?Q?ZMepavNqNXc0PyaazNUiPggTOeCNA/o2ye3IdLRbA9mhd44ECzSRBWsf02JG?=
 =?us-ascii?Q?tI/pUUkzFoUsBGKiaRe5oQhnlHfKxGc/+VsRdMpPNWvhTWDpSlIpayJWwmAA?=
 =?us-ascii?Q?SF3Jv6FXaHtHoiiF35+HRMx8h4lJZ2gFVy9wd3gR/YIYZgk7uY/ei+UirgSv?=
 =?us-ascii?Q?sRM9X6upp5L5fDhNQPX0L1CmHq4dhh8WOqTru/Ulz3aHWw61sxN0aJT61dPC?=
 =?us-ascii?Q?nznYpIHnUztKoLYlfS6CPHgs6PztlM+F3BnP5BCOlCRr1e0PZHQ/mEBRPxZS?=
 =?us-ascii?Q?7mhmOFGYNCUa+nHRj8KpM0k7w4Z44USPs6iz9K/oM75llbNHC49cYq/9CxMx?=
 =?us-ascii?Q?dGa6oO+ckyspLaOcaf1InrXTu0aYVBcp5tWPtyBDiU3RpS4zl+npcyUp07Y4?=
 =?us-ascii?Q?jg9eCDFGuGrNpJO40ThaKVXy7/aXhvnAHzsjh3lByp3qKGRc2XA//a08shUD?=
 =?us-ascii?Q?L2CNixuwRBTxfDiDXPpHDom/3udp+I4Hvs7k8qfrXl5cVRGrbbsA+D8RnI+g?=
 =?us-ascii?Q?btEvDIj2/fizKvot6JxH2mJ6fGqCdFR5i6JP3vJF0AG5C5rEPX9m3sj2juKj?=
 =?us-ascii?Q?JhRTjbbjbysb1oCtw0gtjhzQJk8qinP/Ko5JrDj04KXCZpiD/yTCtovOB1l9?=
 =?us-ascii?Q?Lzh7OXTwfD0Sl/fwGoYmF+SXZleg5koCyXJNmwvPUWnQ6MTe+Xj5piLZ8sQ8?=
 =?us-ascii?Q?sRjmo1K5//lPmNAFsX6prd8UaXAf59DkgG259DKhH04OxZbdAWqOFKYYpUVw?=
 =?us-ascii?Q?OAKblt3dM/9lexg0XzkKPER/FOosH3Lg9f++gkyS27FEQsIVeqknu5+UX10T?=
 =?us-ascii?Q?oiGfC5t4zlt9QCj6oKv0DZ68d7USlAmleZnKuJyE3J5pigc6sFTKUZssrNKw?=
 =?us-ascii?Q?V7Kf8AxRDk3Rwu6Y4bMveQHn7HjJzQ1wyZx2CFWEsiu2XjJmO/EF59UJ478s?=
 =?us-ascii?Q?5Nckl1NQJ05ktXZYx3JDdyf6a/y730z9f7Tmk4xfekxdgjqwnNFbKfEfe/o0?=
 =?us-ascii?Q?dkQOezu8J7T7Qv+TWxU65WzGrW7IVRxMmGrf6cOWHqahxKyXW8UjgfmFb7pv?=
 =?us-ascii?Q?QAC8BCeVL1yNYULAgXgbBnCyTxr/n+U8+32M2NZ7xef0P5M+KsBKY/0/YIy8?=
 =?us-ascii?Q?i/Vc9Q2alP8x5/FnTclTgPyfh9VmTVqEXMF5k2EhsGTx5nyaXl1FMt8/TpQW?=
 =?us-ascii?Q?X6iI8KVI+jbT6035LLdmeHOOCOSzT/I1NqBYI7YVpDiVN+6x1wE2y7She5Ii?=
 =?us-ascii?Q?SVT9mkuKifmHn8reMP7PYqIx3900fYcCfJiL6/VBm8MYDjJ4ochOT0XXIZ8g?=
 =?us-ascii?Q?2Gjrp7Qly8TSw1N+jNso28eE0vIHn+4YrhG38fD8YcWr/bIFvdiiP62P3OAa?=
 =?us-ascii?Q?fBymBrqY3ySZ3WtCER9bHeQR2VzkVKGONaeFUU9dSq/KhESmiuRLN/gl1gNR?=
 =?us-ascii?Q?SF5Hdh808iFlhFydgX2fYlXz/Gw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657eeb9c-0565-48ed-79e1-08d9c62d8c6d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:58.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6fr8hgn+us3TntlouJ9aJ0rHhkQKVYEEvfV73Ci6tfoJdRxpvO6SwmsCwfk1ZOz84lokYfR9fKH7x81iYweQ4/pQpWrvwRU9vGt0jKIiF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type) and it's in bash.
So for now we can safely filter out compression type in all qcow2
tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/206.out    | 10 +++++-----
 tests/qemu-iotests/242.out    | 10 +++++-----
 tests/qemu-iotests/274.out    | 10 +++++-----
 tests/qemu-iotests/iotests.py |  2 ++
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index 80cd274223..7e95694777 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -18,7 +18,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -42,7 +42,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -66,7 +66,7 @@ virtual size: 32 MiB (33554432 bytes)
 cluster_size: 2097152
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 1
     corrupt: false
@@ -92,7 +92,7 @@ backing file: TEST_IMG.base
 backing file format: IMGFMT
 Format specific information:
     compat: 0.10
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     refcount bits: 16
 
 === Successful image creation (encrypted) ===
@@ -109,7 +109,7 @@ encrypted: yes
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     encrypt:
diff --git a/tests/qemu-iotests/242.out b/tests/qemu-iotests/242.out
index 3759c99284..ce231424a7 100644
--- a/tests/qemu-iotests/242.out
+++ b/tests/qemu-iotests/242.out
@@ -12,7 +12,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -34,7 +34,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -68,7 +68,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -110,7 +110,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -161,7 +161,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 1d2928e14d..1ce40d839a 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -50,7 +50,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -79,7 +79,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -114,7 +114,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -141,7 +141,7 @@ virtual size: 2 MiB (2097152 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -176,7 +176,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4bb740634d..2cbb13d67a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -486,6 +486,8 @@ def filter_img_info(output, filename):
                       'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
                       line)
         line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
+        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                      line)
         lines.append(line)
     return '\n'.join(lines)
 
-- 
2.31.1


