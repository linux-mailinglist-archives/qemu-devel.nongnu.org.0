Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA964677FA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:17:28 +0100 (CET)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8RM-0002RZ-1B
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IX-0001up-4B; Fri, 03 Dec 2021 08:08:21 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:40808 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IV-00071Q-2R; Fri, 03 Dec 2021 08:08:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKJxXAsulvEqfUEzkvrUJpta+BSsivI6dsi6ysqK8zHlS8mwNFDNV7/1HMnVHiIMhcpA0eWl2kQ9Wdf9OLdDP5k94QGFt3mt/Vf+ARU8KF7XZL3N2T5Rdr+izTaKEEdr22LdNhlZW/WPlTxS3yciBNSjzZnQPotJG6sLFt5QJzT3cDSAt9ACivUcW9Wcqv0Ah3twvwRCQ8VG6T5cMhn9ByNM5XF6nweygXwki/fjSQnC9aWM1T7MwTLY7Tsix3+tnxW7WmoSm+cPC9oQy0RwU1riOJqBX47iyEy93Rha7bmivoXQZzne315oqJBFgXv06N7P/YHFyy73/R9YoTrgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZkd26KhLQd1bfutxli+O+3gDTMF6MIWX5aBAH9rcLg=;
 b=LWGsx6HJ9LuwJCVfDhM78E6O3K+byLAdqAwKcI4X8SCVgXi+PO2XDkQME3FblI+OZa/D/eX9Bwp2aviZn+alrLGUumXtEVvfd1o8T0Q8HNxH4ZONqmc4wvdbp30HEK1XCHD2kPVpombOP4yyRzpYoNz5HPtuPkOon4gYx4oZjEOZXcmpi1SpNWm+RrhNwltq/2Vugl7lhlMvV9huRde+xB3kMwi7npmMUpk1XAIloWQalCp3z5U6RWDYoMR9sl1Sg9SRbHq39F9B6jGvzRYx6UXtbOvAUQ/IUzPWNIgoMEapktl9HhF9CZ2O3BeERsool7tpzIkV/8SW8zk2CxW80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZkd26KhLQd1bfutxli+O+3gDTMF6MIWX5aBAH9rcLg=;
 b=rf9alGBwacN4/XHsmWQBityKkNqeZutVc+4RIhkXzcoCArpmRMHmspwVJ5k7qlLiqz/apAfXFXQXAqSsjCLtWGqtz1vyscR+ojN8+5MeuCxwCOuPVy9OhOsGEFKHMGN72cSG5Mv+EK3xUBtT5gQt53wUn20K8NqsAIJP5E9jT+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 08/19] iotests.py: filter compression type out
Date: Fri,  3 Dec 2021 14:07:26 +0100
Message-Id: <20211203130737.2924594-9-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38338dc8-bdc0-47c2-4a76-08d9b65df56d
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45153EDBA3A7F52AFA4B9BB5C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZJU7z2q9nmE0a0tFqXz+pN29mtJYrK/ahxlWKVByI+K9qMBu5RC8s/dJeEu4E+qymQEMuiVBQ4/7wcaWtO9usgPor0g49O48AoJDX+IavjrEj/41ITWbzz/dhoI7Z13xb/Q6TWrrFUruj6ObEC8z6rC2G5FYyifv95cdeAv08pg6wngTCmFld27cnN/HdS0hCqurA5zElpGzbUoJGtsM6gBqHx9xb7RtKquLdJwSzoxWocexoI6g8wCb8mlYUeiqjna4kq2b5V8dIrjWkb9GJWZLT5gjwBRapUGDOVI8V06T4lIbD7VIgERymC7cDb1fGIYHodIAx0aiqaGcXrZr9a1v4UyTpGaxIQddaO0PFguVBDx8i755NB5bBXcdB+0yeimTr+gRNlDkpoMOyq2CoQh1+JLiedVIuMiDOZmD3rsb+fQqo4HZ9tnCFn3BjUWNoYsFbko1yabWYnyVRs/enZN+GQbAW3da5e8Vz9o81uErNvjnPHDblSVHKNUiGtYhJjwClaAN+Xwe2o/ba0GCJrNDRxMBeVwbNRL00t6pfy+4eyiTjj4VMM33VScgjHsmqg4wrhdp8yic27dSn873D/fhVncQEWtDr8Wx+AsKhfCK2z6j3HhQpYTOjuM9Csqp1quX0FEuOhLHEfeapSDpwZHKsNdjWburFycDDPrUZyq4ZUErzXHiyQ3e9R2nRINMlLgF4kCxuCQrOBVC0f7gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uirZ1jYOZRj4IqGEWeya1krlXnW7erGjbxIHqiONhcBOSZNcXGU8emt6InLw?=
 =?us-ascii?Q?I53JIU0Z10jgKdyyPScg5LohFxtQaYLjTqIwuKTXeNgX0S39sOAhGKuapbV9?=
 =?us-ascii?Q?2WqXgjWmc+5R7duWs/r4eRRI94djPrY5WGqAFpDWsTdZXyFe+IhrI0vxFcQK?=
 =?us-ascii?Q?/IY5pLvYvFAkd3A/VyGqHQIXNNJgxGKVtktAv7I1DORX9m4kZX1RrCDi4j2z?=
 =?us-ascii?Q?j3uqY/cOld4qbNa3xeLl0P6KVdCnblJagCiaAGu7a7v1bs6IocKSHEHUh7It?=
 =?us-ascii?Q?w8h973rdInDRl8COZZoIrZZG86npkJJksSk8Z+26pZJLl27BEoZ/T0/Z7wtE?=
 =?us-ascii?Q?r3QmUts9kYYv+nQM1WZgs+FqVwQEoNAC3Om7n62KmnlxMMiz+DYxwOT55Tzg?=
 =?us-ascii?Q?yydeUeGXnmeplDoaXME4hr2niCh+c1OrzzGTwOvu8hz+Y5N2iX/UZR7YGlxe?=
 =?us-ascii?Q?FoykHdXY2gGQCSS6lBQu5ArQrJqG3sM6yEnVtss2MT2XUIsuEq/2aKuXxlgo?=
 =?us-ascii?Q?MV5glmrQhxSEEucbuWORKpIKP/LwOc1WZfHDfNvsHwN15HmT60B5ifbR4H3o?=
 =?us-ascii?Q?gbVRpjBZIZZNHkPrynxScLRRK6f4Xh0ep8/wZ7rpY6Npeahu+KevQHifRMsE?=
 =?us-ascii?Q?3/RYkurvkluXB6TMN9RIxvJyFuMV6dm/q7dMeNn+91sKiTK0xcya8quJEViQ?=
 =?us-ascii?Q?2OXdABcqB7CGZ2j+EMMnHvsQPqu5Rn0NvahCJ7Rb9N2V8Evu7bN5kdpmXtEB?=
 =?us-ascii?Q?YhCvm80lQqkKjCJ8CXzZdIgUyvReS2NpW/B6YUlNIHFqj7aC4N+REqrgBVqQ?=
 =?us-ascii?Q?hmn9O/lHT8nsQd+ZJEcwLXS28DGNCphX8WqCif84BQhVjrDmKr/AEqs9phgG?=
 =?us-ascii?Q?KLnwbk0IrjJQPqZR/u/ITdQgUVjXOfwMoaeaJ89kzWTKXtYH3YuWLNtuRT24?=
 =?us-ascii?Q?wr9GfNoXeCb46HPaEssG5KBjKRwDKtudgCC5dG9vGiZxEAM43hehzRZ9cR4Q?=
 =?us-ascii?Q?XoZNfJQu249egWFRy8m4DCMu0XfughGqOv4diSUfaj6DC/PDNGpYlgoJ/BWi?=
 =?us-ascii?Q?vXZeL+cGXxV83a3savCLUjkTHUXT4ARgM59+Bs6pxIn+SL5JGdrvA9fikOpL?=
 =?us-ascii?Q?8dU1L05lGgl8TpR94UdnDozx5fHZp3pdQ0NhadwAeGLv4+IKsKUtmS5vLZir?=
 =?us-ascii?Q?MC8C058ZZgDpQgG9XbiOpxc0D7G6T35sq9bJNnSAReLToSnqcwC7CDb+WCo9?=
 =?us-ascii?Q?W9DapGpoN8pZqBIkKlhGMCkmKez3SUZp3dsqGSlAYWK4VwaxmzkuUewtl33D?=
 =?us-ascii?Q?P8qUPqNfbUv2QEJUsIIVP1uWGwh0MG5ct2ED0WaJPbfqvaneC/3vpDbt5tW2?=
 =?us-ascii?Q?I/CEQUhUVMAFfB7B9A3KTGBb0Brtk5cJu29CEYJJ7jMIEGUigRfYfONQayJl?=
 =?us-ascii?Q?PQQlzITN+qWUpsm7FM55NZSrWfByDd9uZkUHCfO54qAAU9DgJZ4rA7z+11Cp?=
 =?us-ascii?Q?u/CbbpGuTFhbcZ/QfFbJZ3jNsi2wQhdTq7UlYVkEd855TMmnqkmi0t0Z57za?=
 =?us-ascii?Q?+Rl+rLar36yu59pnh7vl10RzFaqqdNocHoBbYURNxEfTnv/B9QBLeLEHWzXE?=
 =?us-ascii?Q?kpMIC4omdKkE24nqrLzvSGN5iwrL1eHLyvRSE+dO5WkTZUWMYsMUvNbZJ29W?=
 =?us-ascii?Q?+HTqrA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38338dc8-bdc0-47c2-4a76-08d9b65df56d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:11.9223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fiu4mcL6zro37nMALYXMaKv5ndPbjCIMyM/gkMtP9b94IY3zYUNCx2EYpUhq5f0Pmd6g3Nct38YOkzofpXgYoHDCxL+OTp5KSUpzlT++7rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
index f19f0590f5..903686b402 100644
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


