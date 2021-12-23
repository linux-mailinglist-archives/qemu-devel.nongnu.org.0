Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2547E636
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:13:59 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qj8-0006Bw-8J
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:13:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXr-0005W9-Mj; Thu, 23 Dec 2021 11:02:19 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:32197 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXq-0005La-0Y; Thu, 23 Dec 2021 11:02:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUb/dtR/knFYu5jv7iNzQvy60/UpdRY6ukHhKtlQOyD+fCVFKH3Of0OY2y/9i1Pco9ickkcJh/G/G9vAjag4q8Twg7hDBwwwc4ojfGsnNqlW81eD85wx7WLDW88HKjvr2M27wLxf4boctJ1WrVl+evnt+VYbkosgzuRFu/Jcqw/FQzsJCXEcRTW8jVI9wZ/ZRJ+xtFsp9rsSlE43bZnosi0pQUoKZmHtzY49cXamrOza9vmZ4Wf87xWAy7CnvQGmR/6q+Xqy5MyCXSvcd04VVsT9yWoE3GtiOXGoXfWHlBWhGO/SZBWzp7onzMGAzBMaTz2142jZbS//3LvwQPYyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhvaATUa4cNWT0H3PXZx+a7CCwtxj8QfOSkqKBncPnU=;
 b=m1Y7LPKxaYm17iKy4MD1ghuPxxS0WYUF5LHmATzIZ79rP8Xdl8a3n2u0r8JNCGwVUVTehR7bc8rqVYCiY0mZZ79E2//8egLUeKvI1ZhAUA3K65tprBChpoh2Rc4q0MFeOh0DfRblvDouCB2b/AyFtxlXJJWa93bplgx6bGHWKeeH0dBYNUMrJnwiVD1mO2iYClbhzCb+K0jCc7DcgFIS8pB9RMN/3maClmqJkAtU7ReGnznWpgNxtROQFHJHlWdQKOsmAD4bzJCipgh2B3zBa2vCXJmqKWGYZx7Z29GgcWKWR0nWtN0VXoKzmxenM1t7/D4UtoyU+X2EEVhYSJ0rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhvaATUa4cNWT0H3PXZx+a7CCwtxj8QfOSkqKBncPnU=;
 b=Y5MQGewdCoi9JaXAeXupOWRjB0jYkd9wBwMN6dNpvLbeC5tkWgLZNSiV/GUE6lEKo7MxGQq7mKdN7156Yl0XcbPwyjHMomZIJWo5O3uTdvFpWgip4ya+c2NDG6T2HvqtND6mnBW7Nk9IoOZSNrAC9cOrxy0FQSR1euN53lA5Tm4=
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
 16:01:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 11/19] iotest 302: use img_info_log() helper
Date: Thu, 23 Dec 2021 17:01:36 +0100
Message-Id: <20211223160144.1097696-12-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d4bbe42-75cd-4607-3017-08d9c62d8cb5
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148941BE39EC91865883FF4C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AlhaqP6cF5sSLpx8xlMw+Kd/XVEYxkeedTOzlLa+6d1Cw1fiyL3Wdk+jFuJPZYVJVBeH3TiB/+hdGYeoULVEG2KBt9TQbhknLvHbIeuXTYPV56JvNmyXSGd6iei+0Ijg6vmYxiyTyT5Jk4mj0y+7dyf23kQhiFkh0rqseusbTMdG7wA3pneliBJFsZyMu4HGL9Hk1DpqtQhj7Nq7M/dsEaeOGpRqJHCyYKQwW8e1mhIAjLWNhITSUulosQeQ387RsJZc+/gtp5wwZAyjPT+vut06RKPbmodzF5nl51kfWlBr5RPHNGKEMVVJBCbEfso9zW4AGcCz7nNO2+/DIE2f5T/I1N6glLGfjqQ6jCMAlGcCJnzhNb1A1aFFWjIU9ZbgFyDQrJ6t2o2FMrVBm5590AxxRvpoAapP5pli0OoPO/fBsD5HcXmwsZdAbw5bDlAODfifUtWeul6AxzoFPlv0+1qztR+DcT5tHRRcqcqFDsWQZ6eNR462LgIBsfSoyTXkR0KGwywFBN8tQCjyaILRrI+SBEyIoIIK8xofEn2DhF5WOjFOUMa//NBSoNYtGxO6onD4twoNMlUN+ON11WiNnzHcQKqNr8P4pfI1w/tfy4WwigwRMEJ77zJDF4jOHQ+rWwHWUomKPVpCmuGzMLa+EExSxxMDZo7b4YZ3UPhZX4ntmaXdeTDin9v6Y/gsbq9ZO7DcJ8lrUCLJTwViNYrmZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7AaDVDYO43H6WQM1nDsovnwFqzD22a8gP7zdDI/rO8dt5bUWHSZOuMjhcFO1?=
 =?us-ascii?Q?nYqlaZJbmzpFp+e5KzI5jgRajpNM1vTyEzyXJI+Nb0CAy7I5Q5b0zq3TeFWn?=
 =?us-ascii?Q?X3st9PmXqQ/GAlNMEMhHoa1wkyaWNRReLKQjkWUO6zM4dL7KXNnKHm8i+xH6?=
 =?us-ascii?Q?TacJuXGlUYd6A3ts9N0lBK/p6PF2bTBYGGlznGUz+N54nreyYrUEhpifvkUu?=
 =?us-ascii?Q?r0X4zgtkGbWhpbqIyPmoDhputAYDwx9IEMZJiGfnjQdjWbZfHGwHAg3HGeUD?=
 =?us-ascii?Q?QUS8wnll/JJfrUb+bQiCEyP6n26IDjDz3yhJZrkcAdlcRUIbiWprCOSvrZl7?=
 =?us-ascii?Q?YIMwfZgtzNvGBSz72Eh7K68MRg+/32lvJNi2g2GEjVs6++TZzXfFwj6Zk6do?=
 =?us-ascii?Q?+oNDymsTTtL2Pc5pZHoBWDvZDZ+CBYZ5XiSu7ePycaaNYxOuJtODHRU+QMnu?=
 =?us-ascii?Q?CnGst8NhKFly5GhogPQT6+D38JLwgFgKsIrPuwRK8YpjSzdF0LJwwc6+IGAg?=
 =?us-ascii?Q?JAIl9JOa5q1yaQKIPZASXNt/QSlcfyGJ+gd4wbwTJse9/B7bxxHflLucDIFV?=
 =?us-ascii?Q?ERqu0/YUFmQ7u/4Oo+2S1PoJYqk/bHvggHVsaA4TMQq3CRe3dRHyi0PcPcAt?=
 =?us-ascii?Q?rbLGFMaXVHE7ZG/nWXYlNNNkvs60oVvnqVRHKreZwDaRDRy1lGOU+Gs1VeDP?=
 =?us-ascii?Q?qDPLzf4nofQnNdccaMvrrHnmyMVKyWPMWAmNlam3JbciaWZw6gakm18r8H7b?=
 =?us-ascii?Q?Tm3oYc0uP0o+CnDqQq9sTpU7eQKhfUo8NDoXYs/BedZoB9v004Qs7kKCvjH3?=
 =?us-ascii?Q?XAtfHvAGmvMdL6l1O/d2zu1yQxywf5v/leNwnhSuUc9o+pfXs3gv1zfPEWZW?=
 =?us-ascii?Q?mLRxp2H47SUhA8UGofYZEjxzF7e33A6ACASKWGnisS6o7mN5NyCou+5YFcr5?=
 =?us-ascii?Q?6zwRFFNUOFH5ptSQc3WVjxv1CPuTC0NCV7bIc9eK1KUtTIEoaw3aLGir8+EK?=
 =?us-ascii?Q?G2m61m3ax9Ov2O0tjbdAX6MqeL7ZgGcPjp8fcnovPcEEyyKBaoFMqtC8FJ16?=
 =?us-ascii?Q?F46XdK2B0KNCvm7tzcdJLWOEntxGOGi4dDOkmTG5l817pgbn/TXA5DRNYS5Y?=
 =?us-ascii?Q?ExPOI7fjalNnswn+Inu4QX2ggdjNuzudFZ14wXluhD/scCqCCGTykzuXUG7U?=
 =?us-ascii?Q?8lB9jM+hM9ToKj7cat1Yb1lvPBTauE7L+W9Y6Ti/rdHpeuzYWd7U1TolaR8Q?=
 =?us-ascii?Q?MNVpQ8wt1cq07EF6Yp0KoYXll+Qg7MWPj7xKtaBnhPqtQys7XVnlsiSE1Isl?=
 =?us-ascii?Q?q101LCReNT7aI7PrrJQPfJFiWLRMtyb1B/gXaBbsJpHou2BanetiSgG6wOHF?=
 =?us-ascii?Q?cJrbYPwCn5KKao3+Qb3rnUr9FJT/I1FU5GF9MVMDlO6SOePaq2liRgEtL1yt?=
 =?us-ascii?Q?mDvjsaVRUufe+8aGuqAVqW+1eu559X/QMLbR8/62BxkFQWQIQsD9eOlj1gQu?=
 =?us-ascii?Q?ffUNHZKzwnIhw0jkitkIHGsBTong41n9QRPjv+6D9cmUQhd5R77jBGBnoNc4?=
 =?us-ascii?Q?SxgK5ViVabefXxT52onv+bFZiTBG8AggZosjD8fvuLv97JN5Kb2AfVB3tzlb?=
 =?us-ascii?Q?6c0OATHywmLZdq1YVjG/NBDr3bycT0tyjTUMbidDQ5+N/zS+DwsvzpoUsSC9?=
 =?us-ascii?Q?EqftWm37kMkMIIvDlRGYyLr5gJE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4bbe42-75cd-4607-3017-08d9c62d8cb5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:58.7554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdF0azUmei4mXtwJPg+tGdZKJ1qFEeYQAIoGBg6cJgMTZJHFsKD/lSkOTaVzrylO9BfxjRR81WrmiXqLU0LoD0w3Oo4jEZU9KsdPv5E7xJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Instead of qemu_img_log("info", ..) use generic helper img_info_log().

img_info_log() has smarter logic. For example it use filter_img_info()
to filter output, which in turns filter a compression type. So it will
help us in future when we implement a possibility to use zstd
compression by default (with help of some runtime config file or maybe
build option). For now to test you should recompile qemu with a small
addition into block/qcow2.c before
"if (qcow2_opts->has_compression_type":

    if (!qcow2_opts->has_compression_type && version >= 3) {
        qcow2_opts->has_compression_type = true;
        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
    }

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/302     | 4 +++-
 tests/qemu-iotests/302.out | 7 +++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
index 5695af4914..a6d79e727b 100755
--- a/tests/qemu-iotests/302
+++ b/tests/qemu-iotests/302
@@ -34,6 +34,7 @@ from iotests import (
     qemu_img_measure,
     qemu_io,
     qemu_nbd_popen,
+    img_info_log,
 )
 
 iotests.script_initialize(supported_fmts=["qcow2"])
@@ -88,6 +89,7 @@ with tarfile.open(tar_file, "w") as tar:
             tar_file):
 
         iotests.log("=== Target image info ===")
+        # Not img_info_log as it enforces imgfmt, but now we print info on raw
         qemu_img_log("info", nbd_uri)
 
         qemu_img(
@@ -99,7 +101,7 @@ with tarfile.open(tar_file, "w") as tar:
             nbd_uri)
 
         iotests.log("=== Converted image info ===")
-        qemu_img_log("info", nbd_uri)
+        img_info_log(nbd_uri)
 
         iotests.log("=== Converted image check ===")
         qemu_img_log("check", nbd_uri)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index e2f6077e83..3e7c281b91 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 
 === Converted image info ===
-image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-file format: qcow2
+image: TEST_IMG
+file format: IMGFMT
 virtual size: 1 GiB (1073741824 bytes)
-disk size: unavailable
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
-- 
2.31.1


