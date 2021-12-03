Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B0467817
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:20:21 +0100 (CET)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8U8-00055j-SH
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ic-00024k-Nd; Fri, 03 Dec 2021 08:08:27 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:40808 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IZ-00071Q-Ht; Fri, 03 Dec 2021 08:08:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Swwg35XuyJeoHEequGLp+Kykd/YTzTbPLCiIFmf4M9a2rp0dJgpQwdUAxKuZtErBwCnea8jESvA6vAnYrPfR4gVgIT7j+pmAY0BtLHLcOFNnbbE4h89/FYOrsF8avoQsOaypRI/T5Wl2wUcCFVDnVjSJhuarqNLDc8w1iLE9FMxAZeYM5CZ4DWVLBdBNicTSKQbTT9y1OJGGPRIRHlzvU6bju84T258/f/F2IwTaMIzNCvqRTXVcSpHmw/LsZBUB41prMJtKLQEj0zS6aSejfYrKIPg0BXc1eNe/oXMtwVD0Ur5/goY6wF0dExUWkX9EdwYPNeXHnoTShVNbyTEkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhvaATUa4cNWT0H3PXZx+a7CCwtxj8QfOSkqKBncPnU=;
 b=dvq7Lc2ALwXmhX8u7pWxFMEEtvCiuUs0Di9lGFwJypH9jzzAKZwdfb9HekczmWLLPvMDyLNwkjUtwktVHDhXG0LaH4Bi3tA+NSI4l6rEN0HQmwMfZFGY1UEnWRmhCGFbak3bbjOrxp+VSRSKlRDWc2G4Qhlb+r2sLzm6pBoLDDVQ/c7L5nOaVhd7RQEMcLhsuptEjHQY5iP2mHBtQlL6cGIcazXqsUVI1tee4ffnR2WGOY/pai35yZNGU9g7nbmAd6ukUV3HdWHzBEYnUh+WvKGzEjUdARuPyizZfy7DeK7nd/aUy5fz7aoFaXvvJcWCXzd7uufJvjT7PM9DPaVaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhvaATUa4cNWT0H3PXZx+a7CCwtxj8QfOSkqKBncPnU=;
 b=OF4udqqVXKFJDZQRXEnYp/S/eyxv5i79mgXme0l4dX27A/6u8izXHIg13iSnFEMhEawmo29yduI63hm36oypAR4FYdjms2A/RfJW0euuKTpKtcj8k89ZwnIoTPjyWBSQnCVTL71R6lY1GGgB+6aklfvcjhCJcaJrkKbOyCMFQVA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 09/19] iotest 302: use img_info_log() helper
Date: Fri,  3 Dec 2021 14:07:27 +0100
Message-Id: <20211203130737.2924594-10-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4cc7ce3-a13e-4c4f-2010-08d9b65df612
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515D445A354515E2B1F5910C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fuQdrYWfv/z1XuVNBSQKICJDrvqYfgFdGhMiLOcsl5kwYkPDn6kfpQHnRMcD/vIzK0jz0Zgh7F3smtde+Ny432IWoyyJifmdwJmn/DOHQSncMlzzo3EKZ6sE7yqZsmyjlR7FBLtWdKlOGHvMfAxGm8YUVyJpcvd2PXIqW6yKBcWrMr+BmRUWarnVVJy7PdzNiD00UGKZ3AqPVJmNYIPlcQns+6V2eYu1istFxuZInS8700IRSeNlYJNwFyTuHe7cKgbRTXFyqXk/L4BTM+4ECKOd811vd7EMVH5UagdqMfRu/jmP+A4Fc+No/E09s4r3A68z/ePHxbKpr5+ZA8TvjXtgdYlHKmoqI7I8vsBYYE4uWT6RHgCqFIaBiLT++VByOYtjpxvffyvKJnhv8Q6SfclX2HCOVBt4Hk27R+0mY0zIyoLwe/Yx7fGaOdwZ9m2Ph7Sh0uMVoDvG9+GsFrI80M5wJYhgLrUx2sXyWethLp3wdDFkiQdITrimg1vOXYdL9r1znb3sJAv9RtOrgpOyv5pWcZY8qOUHngfKZFiOI4SRA8iWalgi0Nrw0eErhnhy1/BxAq0BA27GJN9F0zL2FFKXa16FBz6oKp4//J6ZWTAK3H1lhCIRiHt4DrOYOA3WTqqEZW8wHulpnXZBNPR0OX1ScYJWeNUBE1V3RJ+tGgCxiZcWVMC6ObchK/71KWCOMopZTWgp4eoIOWMpg0Xj5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4N+C18K0vVSqav9pW8ajo4j+Vrh/5FU0JWfPvuGas3Sf+Fh55uB29fc+Tddo?=
 =?us-ascii?Q?X8ZXDWECJezes3kEZgXiCezXz2WnheZTXEmJ77LxE6Q2EKNX3DhsZ3Udlx9v?=
 =?us-ascii?Q?6oNfvuTzNnBBJo57uyvkoHHGk01gJ5h31+7DZewUKqY1JqfdeacZl5K2DVLN?=
 =?us-ascii?Q?KQyp8Th+cSU3to9YsFhVSXBUlSqL0DTeYt/yOACKt9OljOnm73Avny1dPZmI?=
 =?us-ascii?Q?8FqyUiyEI1XotAfTm3ViM4K5GpOFwZLr7SP5X4JvzP4lW+wgcJjhdXd2AS8p?=
 =?us-ascii?Q?NC8IwNnYUN/nfjE/qaswW5vYKyetwOcz9NZKfMwYvxvFPf/g/FA1O0q+svPj?=
 =?us-ascii?Q?gIzW/OQO/FBDIDCc7LsmDrFJb/4m07nGsSOBnsD8m4x4NHIXEaCpkY6+EGlU?=
 =?us-ascii?Q?urI5mx1BHe5fPVoNP8fKX9EuGgjENHc9zQcpraaw7irKveFqlHJkOpLQlSXR?=
 =?us-ascii?Q?UDXcFabVcjBhjCx3EXUy1B1rvfBJIhfhU1RtX2k7m7M9LEHiHoIgpQECxEpM?=
 =?us-ascii?Q?osYKV1GC5diP4Gb4kD39ZrC01+DrFz+6YALkVt6o3mJ6SucAxTYUotV6vR9g?=
 =?us-ascii?Q?e0O+Yq41RxrPsZsqY8v73t6KPoW403bs9DmYktKlywzI07oOq2O0dKv4b+5v?=
 =?us-ascii?Q?cKE7znZSxj0YgpujMdA6EgBIuPXLqz18nEHiw2vuEAFhkGb9NnkJrycMQCUn?=
 =?us-ascii?Q?6bWjAjo2xRpBnUWVShyaFRIH4Lbfg8Y80qtJFRGHIt2TuWbK2laB71+IPfxG?=
 =?us-ascii?Q?VzRAx6HKzUP0gisXmTH+BA/0cusbO2I3wJX/ZprJko7r+Obf+Ew1d4/EN5nQ?=
 =?us-ascii?Q?cj50m/qkRjkFw4s5ydKf3VIEBf0KZJzSttSoOj/xEvAYdwcdgoMeh/NI+EOI?=
 =?us-ascii?Q?TMwRwhDOW6BkSXGvMBQqHCaDHEzsZNMXdRarlJrpU9ze/FyB6vobWiK4SwXO?=
 =?us-ascii?Q?AzYpv2Qdl0J7+RLJHYHQk1SL6L43gHJCA0ZzLlADkrjEmavHwpT773somEOS?=
 =?us-ascii?Q?jLnqKpDZq1MUVbVib9QS6xLOA32sGypoEdmXM+UlOCMmHi6MzFwGXSwyAN1+?=
 =?us-ascii?Q?UJmdLeaBxlUm+HG3oAmlR18mdngjQf0UBoAGBfYNKLn2O8JdaAAjM63WYcmH?=
 =?us-ascii?Q?5Ppm2WriT2P2MkT7cyGkDFPsnW8lfenCbwBs/0tP3KopbzNh3tWu8eGtu/D1?=
 =?us-ascii?Q?IZVxBuLwUqojU6GAdnUiEevGpmbF5GRERLuEccTLZWHQNtbNcWtXvgUb7bWt?=
 =?us-ascii?Q?MG2eFPBMoTWpKC/3SqIyTfH+McoF+sOKxjKZXDHaRNW+Dk6mm6z0Ju+EZJRE?=
 =?us-ascii?Q?AxpOra1YgJVYqnUHddilXWOtUaeaVmyqZh85lRYqQhAtxMC8q9/1A7T68EL/?=
 =?us-ascii?Q?UJ6MP2JG1En7GLn36Z80e2ij+zodQdTjXI0eEljjFGxL9hFHXcWcDzEocXRW?=
 =?us-ascii?Q?+Pbp4bvhjwxuwIlYS2PpSJuEKi/MGHnJu1aTXKx7f8MzWXHiqqjanN9WT8Bd?=
 =?us-ascii?Q?dbbCy+q1h7TyQxQnqnuDEEpOdOM6U1JyI4JDeEnDBj8NFBQUy8PF3eqNbOG8?=
 =?us-ascii?Q?+MXPOeLuRlI92NOKiNvoAAtjJrp0Jvd3wbTPsOkivUqXBg0ydUWwsNQ8UMGt?=
 =?us-ascii?Q?XKPsAgtxWFXszagzMfj372sTBrIoQyESTO4C3CbSqV8upAXmbVm9yK9AEIB3?=
 =?us-ascii?Q?Re+M+w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cc7ce3-a13e-4c4f-2010-08d9b65df612
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:13.2534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhjIVBUzZturPVlhMGCtCjq6oFHDHIYb+yAiFZHTZ3EjgX6ak6vZqFZ45KY9TSOUwismQ9m7Ua2AX83aLbg28f6dvT7kb66PtW8WhPdU6ts=
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


