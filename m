Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7947E631
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:13:06 +0100 (CET)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QiH-0004HC-PJ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXp-0005O2-GH; Thu, 23 Dec 2021 11:02:17 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:32197 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXl-0005La-NU; Thu, 23 Dec 2021 11:02:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYLDGFHps4sKPO+VZBQTGd5scweg53cczNhauw7nJrqMJXpzezUpW1K38/0RksvFY7Qy203TtmnuCw4rM5+ysDCMrzh5i3UwMVxXaSCnCyjwJm89FONrf9PeFN/SgCo/JcthT9PEL/U2/FWlXPpmiF7Tqvw5sCV+07bdevLK0Ce/+jo3mo+8NpVvp71snJXCBqLB4GfTqTX3mA5lORtYxWIulREzggmIkwreXxEXOY6LStX/38lL/ACJaJqPrxwHr6zvZMO+Z6R3WLlTGOOV0cWQBFRPCa4G1WjSFrXhaAb9AbSzcJDWchFth7D9CTAsTiwKLB5HsLWXKsdZuLNqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYvWbov9Jx46mzSrrOlp3/9EkbNVwe7VQDUQY/L0QQc=;
 b=UuV8h6iOA940HBxAyCpQBlc2DqLjPehntR8Vw7DSGvZ7GsD2FDjkrgIOZqFNfAIKFlG1TVTUgDFnRTB1KNG4folT6DTtoHOkssaEwkb3tbRoMrLKdlUlDeUl+++vuu6pSQ3naSE0XkoOzHlN7yMAQjNAK6i1DBEP+hfqjejU8qrWBLUJu/MlcZr5+1Hxk7k1xQItjD59QuZorN6muQe58EDxWzyL6t9SubWgju/n2p6SmryJxHSZVF8iHY9BofjV20qeHnpH9q5vaHxNiwR9KJZt3Halr5IXUp9/45zox4desNf24iDZTY0jcRFkG2xGFnryhSSEbrux6Bb7Wyn/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYvWbov9Jx46mzSrrOlp3/9EkbNVwe7VQDUQY/L0QQc=;
 b=eZ0p3r97J+jfce5LO8F4pEhn2ef87hf6eQGnHbxXqIqqUV6bL/9XVOEfmrfDk4twfELFhpBP2+y8nyjDWgRmOXumg7lCw+dDm5j4nE9Ag3rDG8aAwqaboMSGObou9fgTkBhDrYd5QpRt81cor7HJJ6dRsjPzeuEOSVS5tvzqZmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:57 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 07/19] iotest 303: explicit compression type
Date: Thu, 23 Dec 2021 17:01:32 +0100
Message-Id: <20211223160144.1097696-8-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: e776a8df-f4fe-4569-764c-08d9c62d8bbf
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148B7C553D9462B532E1A98C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tb7qoY37veKY/BO301yWzLuaQpc5E7aIuBbyQEUpoAt0vFbfODA1qEEgL6HZfMZX1mJvSyb9oonH43IjgWvNSYcQp8UZqoyvBmLjDbSoGlCMocC8mBYgjBq0ONdMroMANHi37NrDzC2aunHyuUC0hHT9qh8KJ8D5MBlpdVA2o8Hg93kQlZle+OivLQh/alliwb3rS42/2h1M0MxFYuytuschMjkYV4iciszOGqPjUQanRQnznPVICHsgwnboO5wkefN6/vPdx+1F1RHzKspmC3UhMz0dup+eIZBoSgQhak/0TYUvji0F4ivaHPK25GxLy9nrKOCVO64SKHD/oyqIONVRwJrMfzjg+c/A1UZbvH5zivtnJ9+QnOOWqaR0t6zDEOliKxunMcFoJn1xh01dprLMr03iP1pGSWtACp+6cfADuMDPQ7Mha/jxcAK+0hcXYUxbaIq4XKfxTBXb7GX4lyL3b3H6l4N+iyvQh9Bty30ytYg/7nq2Ud2AciNCBcE2iMKlpAJFogMWDJ+cHVFdka9w1WtJt8bU1HNXLx9x0pvvUD4WhIMekB70SBPI6CzVh5Psmb8cu4wzw3tYNseFC5pNJRs6JzMGFTVVjk63o/lj3XVFd0DQ45mVg1Y1qKiRtZsFuN4RQURvsydmaTwtKUYAq+Nq04UFWRY2xr1d5Zwi3OdKQL27781mHMHg00ORbzDH1ggIZZPN8lv4vp1jgUtOPF9niAJ4VMzBUr8Dw94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?alznftK+V9Owbg2uyClsjM6T2N66VeCSVcTlRkJ6nAze4YtIVK/lAndO3yjm?=
 =?us-ascii?Q?qEy3u4yrJIQGdBLVgdtCliMrW+lgcURoJQqFgFhTM+AbFxRU+ic4m2QyWrym?=
 =?us-ascii?Q?zlBwtJ1KD8vZ30kYvoT70TfDEgHd/X/0IDZiryuR9RwytMKNmh1AxoFaTKdu?=
 =?us-ascii?Q?0kSJTen8pXxjcBUvtrwZjp469RNAvEvQETgJtSpURXCti9l+vMyshtBe/8/3?=
 =?us-ascii?Q?ucKMuAT769pX2IJa/PxR2PKvYe9/q1OwBtm/s7WNKWKHNMB/2Pw4jX8DCO3P?=
 =?us-ascii?Q?sE2fEeFCPpxozEuRxHFbE58uzuPRBcy/t87YunO/fAQGk4Zvp0bvWs0xxwzJ?=
 =?us-ascii?Q?pizcsU3tkKBWqWNz21lpGamvB+9Jua3yfBs4wM5TvtqbgyTTXuIDy8rHBD+1?=
 =?us-ascii?Q?OWmbe0KA7fDn4ESzBNFG//9NX5UoeCVHV05NvEJbdJB0+1PhH3EhRBD11s9O?=
 =?us-ascii?Q?Dr9/pGEnjDRxJTxV6XlBp03LWqbkP9jBvfukOpc/KyTdy4WlNLPNPinmVewV?=
 =?us-ascii?Q?hNMIfWFNSaXfWhArN8M/Xt7BpnaQGxbQ6rQYeLNoY/dlIM4Bv5ZIQNRvOm9W?=
 =?us-ascii?Q?zJWwxeJLtlcrJGttVttXWQ0yW9teRFVW6oSuw0z5aec/XHQMqPJBesx5pPz4?=
 =?us-ascii?Q?y6AG/qp5vQ4F83pReaxvqzJBWT7N3duD09HDf9LWiw3ozMulFLPnj9kXlifL?=
 =?us-ascii?Q?0WNDOoZVPhiPewXtq06oMZwH46svlnVcw1KySfVdlrP+OYBRf9B71qmxMx5p?=
 =?us-ascii?Q?O3XAveJN6q1x8RBOmluVlD9v/DaeYgEfQIMwPwjj5Kxh+zwIQB1wOY1x71Tt?=
 =?us-ascii?Q?leJzn3OiLcIUC7+iL3ChMJNoUC43wCP4G9GsYbWazBaa1itkrqBiqdqepl2m?=
 =?us-ascii?Q?c8+bu2kGl333hZ0IQoIPgQjqy6k70LaTaXYjPQS6qfsgW1/7KIgQ/Tp3WJyx?=
 =?us-ascii?Q?UbOJOc2W20uJ46MmXQ2wHE68jn6xZRrOVrYx935ziFEaqZ79uYNCF59f2jIM?=
 =?us-ascii?Q?ARCJFR8l0AuS0znWfw5LMLeYCnFlf2OucRIfQyRKiFxO8rmF6VPH2UhAcPVc?=
 =?us-ascii?Q?OhJi4uuzCpIdIAW+KqkUwRw7OoK6EUmqJk7mgaMDAz1N/KIdtQuYDDOpKCeC?=
 =?us-ascii?Q?YmLqb9rKdf514zJAnF43cabCfBqFF4hNaiuVPTIVPVap7V6vrK+pu2ahyr4j?=
 =?us-ascii?Q?JiAxiTtoWp52rRUo0QsACUYnXk78O0o7MkPOUM1246idXIat5hX+XslxcFTr?=
 =?us-ascii?Q?ic+xEsrfjhuWYU/8crpT356ZVIQq4ioDq0DqiPLtRNrBzT5w2osEKqMed3l0?=
 =?us-ascii?Q?Rru4IqBxHaJl9meU7mHOXonlS49TktcAlx+n0B9q+s2PATHIIMu+8jeX2ZbA?=
 =?us-ascii?Q?dA7n+tfYNEeOCPYppz+xObDLYDPopsMTL/Wx5ELZhOtJ7sb+aiXQ2g2jqs45?=
 =?us-ascii?Q?zjkcf2/cq8l9CwXQ8LRDc3MUIuEqRdt2bNxbVhcnWN22v3Yf2zcxBhbFGmfL?=
 =?us-ascii?Q?X3D9t2VQ8458khXr16JGRoQnubZDTdwYddxh+FpV5HwvdlS0MiAHiUheZwwU?=
 =?us-ascii?Q?cIicCe1VJbn88zs+FYZ9AYkUmbstfh2b6ZlDfLDePKPPJ0t/uNqXFzaMR5TJ?=
 =?us-ascii?Q?Ogvg3R89GLl0gJEC61I2YrJGI8+xkjMD05H6n9PLnOSpvc0fbuI9AsU4XQtI?=
 =?us-ascii?Q?gpHDTZBsrXMzWbLlX4zPL6YV5bQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e776a8df-f4fe-4569-764c-08d9c62d8bbf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:57.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i9SmImxWrGaODrhgUpl3xIHb3KYCjwUIL3tqjd/IQE4RDm3EobCDcCxMFUyPiiUPVohdlwuRIVCvI5nUfEz9vdxpTbdQCpD7j8LnUXLiBE=
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

The test prints qcow2 header fields which depends on chosen compression
type. So, let's be explicit in what compression type we want and
independent of IMGOPTS. Test both existing compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/303     | 23 +++++++++++++++--------
 tests/qemu-iotests/303.out | 30 +++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 475cb5428d..16c2e10827 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -54,12 +54,19 @@ def add_bitmap(num, begin, end, disabled):
     log('')
 
 
-qemu_img_create('-f', iotests.imgfmt, disk, '10M')
+def test(compression_type: str, json_output: bool) -> None:
+    qemu_img_create('-f', iotests.imgfmt,
+                    '-o', f'compression_type={compression_type}',
+                    disk, '10M')
+    add_bitmap(1, 0, 6, False)
+    add_bitmap(2, 6, 8, True)
 
-add_bitmap(1, 0, 6, False)
-add_bitmap(2, 6, 8, True)
-dump = ['./qcow2.py', disk, 'dump-header']
-subprocess.run(dump)
-# Dump the metadata in JSON format
-dump.append('-j')
-subprocess.run(dump)
+    cmd = ['./qcow2.py', disk, 'dump-header']
+    if json_output:
+        cmd.append('-j')
+
+    subprocess.run(cmd)
+
+
+test('zlib', False)
+test('zstd', True)
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
index 7c16998587..b3c70827b7 100644
--- a/tests/qemu-iotests/303.out
+++ b/tests/qemu-iotests/303.out
@@ -80,6 +80,34 @@ extra_data_size           0
 Bitmap table   type            size         offset
 0              all-zeroes      0            0
 
+Add bitmap 1
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 2097152
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 4194304
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 5242880
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+Add bitmap 2
+wrote 1048576/1048576 bytes at offset 6291456
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 7340032
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 {
     "magic": 1363560955,
     "version": 3,
@@ -94,7 +122,7 @@ Bitmap table   type            size         offset
     "refcount_table_clusters": 1,
     "nb_snapshots": 0,
     "snapshot_offset": 0,
-    "incompatible_features": 0,
+    "incompatible_features": 8,
     "compatible_features": 0,
     "autoclear_features": 1,
     "refcount_order": 4,
-- 
2.31.1


