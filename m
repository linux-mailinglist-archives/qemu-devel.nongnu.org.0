Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CE40ABC3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:32:07 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5jR-0005fx-NU
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dq-0004Hy-PU; Tue, 14 Sep 2021 06:26:18 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5do-0003Ok-TD; Tue, 14 Sep 2021 06:26:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcZjK9NgAsIDat3ae8C/WCLEvwAo+3dtY8vsiRz5aAjBv68uQFtj/Vz/MzGyMSvLM6pVslVASUzKviypyomhuYfVZFgNV68GwVUOyYefzWdtviifqYs4TrfDEanm19PJ5t/jqYuvsqEMXshInZyObTMc5Z4VvNOyA1k/i5Vcoloc6K3F8zsyI66G/hNs5krtamhNJM2CC1U7Lp2zEvFiRI3XySHCPPNihQf20841AWRQhzKXuFcZoQf4yvL53HntMfIdO2bREYhZubJWACqCkIPoCoLjI1Va8NDXmYYJ0LWKWtOnYw3pN/qp+k4iFRNyOz9h+uPbE2cXJhFv1QZIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Apb2arpVeOqHDJs+z7RI3HGryl/2mDzB8TMmoyJ/ksU=;
 b=fUPag7Rym6/xycQ2KkdJDbWrvXGiBoUj/VJdRa83YSWnJACd9f62DiD7dtQqIIloTsimCk82oKfiNIcuxkhMRB+czDrKNm3hFd8DxzCKUp2KazSzdTRuOI9aeLir6iBF7h32NanlhRRRfC09AgpLygEcYAjYAEGs53eHMYdy5REUnITg5uloAB/GmgUZ5u1nPgygIJaK+BVC1eCZ8dd4qpmvTQV568CUy1m4UwhTJPsvQ7HiyME4DwtZKkxHkqr4iRxvu07C8JQceIYVnravaWXGo7uYCt2UMdfEBQE7EZs8oHA6VevnK+yg1k5V7+bE31HenQ1SUeULM6BdfGnbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apb2arpVeOqHDJs+z7RI3HGryl/2mDzB8TMmoyJ/ksU=;
 b=DJTnG2OGb5Adm7re9uYoRTSmghUCZe7Rq/oCVIXkpAjozBI7U6HQ1rLYhVImPQTpctSl3ouwttUOnGJatNnVRXuJNtFiRhH4fr1h9LYmERYUdKCWg98pMQZ96g/zvZmLstEAcJDrou/k4TYDKFJdN1sS6Yw+GVh3LopqUXHQ60A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 05/17] iotest 303: explicit compression type
Date: Tue, 14 Sep 2021 13:25:35 +0300
Message-Id: <20210914102547.83963-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0010e26e-5100-494c-fff5-08d9776a12fc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60717531695FD03F368875C6C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dN7bZVgiZExFM2fPCkfSQq85spGBmp0AJZ4cZsgPsttQD41uva98wDZoBehE7fHW6heTcEVhfQxAVzhHlGE5neZcMmgmjnvIZKETrOg2js+OHlyx0bqHKswo1IMkeJ+gd7hvLF4vt28SfGuNZ8XX0ACOL/uCVqACTi/uNTij1/gLa4P1jeBUJF1mmA3FAnlEShbG4zmt2K2yPdRKke0A1nCDm/asnIi3YCdUt/xpe/QpWms20vvJ7+mtfL3AUzApVNt9A1x90/MapBxiy0sJ3RZaVop8JoFGo11nWKARsjHYv/ouaBkUbNFRPoKCcXrbKon4FIMd0at2H+uHu9LumZAjd/pX51tjh7lsI3c6EDdR6/sk+Xnc5djyENYoY2Ekz3yZQdZcPRfwkg5VuA/lGmJ1sHAXAme8WnmlBp1NImzJiApj5i/jmzHF73iTzNatgGfoGz5z5otuXoPXVYvO8HOxyGs3ktSEVpJYp7x8nDysPIIdXhuH3XUXJl8PMKyxAqsCHWZXl3IU3lk+YJdfiSMH1PWo3wzm8lckIdxunQuVJScGYKfCgboKj+q3Gwm8D/kC9t45XyhTte3/Z4nlqY7EFPyy+0TKkpUWOFo8/JYa5GB+2RIx4GsWkzrIB0MrQ9zpegAdtJXS1m9D8QTTrxV6+0fuOcLXei/xZkviInL5F51T09h/uFA+jUIMNdpvoe2WwmhfrnfhH0++ChQscISwO/M8Ak5gV8oU8mGik0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ViySHOqqtThbsxRZ5rzMCW1G1zJHechUX94GWg4QIB7Z6a14vAefro2c/6sj?=
 =?us-ascii?Q?muoyGW2K2VG6rLiWz+S6ZW4E3A9/u+i9zVUHnQi0U2VLuigOgwmWaZHQ66Sv?=
 =?us-ascii?Q?nL66HpJhE5j43GxNKRrvJk7CVmQ8qa15zYbJ7dXgq4t+WhdmaVnqM9VCYsVJ?=
 =?us-ascii?Q?HSDVbq2cL6P5Di+7bV5ClCcSf5t2Pgxk2F+bDmQzP+7S5tFzIwrxi47cRUvX?=
 =?us-ascii?Q?sHkKr5CVx5o2vGabnNsY8A/Hxc57+qn99cdPZTXiXs/9Ghx9qkE73wFckzvx?=
 =?us-ascii?Q?9m6TSbDjyWCAHg33ovonS7s3ZIlJLW/2fcPjEJ8y5b6hcvnUBilFUlT2NW6y?=
 =?us-ascii?Q?QRtkJJuPbiaWjz0hFpplISjVTcjPlhSclCbWVWZaMfyPVjk2gTENDJxWMhJK?=
 =?us-ascii?Q?8tJQErw9TeHBiXf7CoWdtZiAZj3hVLosRpsv0sgsFV+6n6I2RrM2qEltN2ZJ?=
 =?us-ascii?Q?5qXdzbjYVyKCR7Mx8JCdYIs4HBCSVxT9ETrUvaeE9zo5on3BGd1U76nI0gt7?=
 =?us-ascii?Q?UTZI8gt2o253VMgArFVZlMEvcpN/j2SjHncqC95nDrb5sepH6jgVF23ZbM4N?=
 =?us-ascii?Q?+IFx/IHGeZpLDz2ZAhTVny40kMlfFw0Ho7u9606jPK+KZIw4hnRDJ3DJeoo2?=
 =?us-ascii?Q?ewq7oxiNmwwEUpUAknJxzdLEHa1wxAKCgwMneY1vkHu0246z/OrqiZja0Oij?=
 =?us-ascii?Q?YQtHuN8M6ocamYjfU8IVjdRYJLRBNpUkVM23rU6293OdeyKGvA+HmLtozWbJ?=
 =?us-ascii?Q?jYzP8soqrFGMG16T4w+AjyTHzpmhgQeigL1tfVFSad7kZB1qLIBjRZG9yY3i?=
 =?us-ascii?Q?9ZX3Pje6KUFkbKQOESEv68UyppAMWm6fOUPqLjimfKIpIgS57roKUTl/7ve3?=
 =?us-ascii?Q?IzrDmXdRtbbPscuaPotYcn04OfIUUfzlGSBcEAEi03rDJ6scOFDZLDx4fStJ?=
 =?us-ascii?Q?Vz3uKAKT9AcJ99krzgBWlmrGDvTrKtCyjRbrxx4fuYFLuU+yqbA9/JtJzpa+?=
 =?us-ascii?Q?n0Vn3OOXZTMIFAK4JSMP7S7JYqowU9N6bl//NhU4PKr8yPLZTxnvoqXEKYWf?=
 =?us-ascii?Q?yvo5ZUI77wHanFNnGBCCGYemjHSIm6TBJJalHffVyCr7V0dmJK0RDDXeSpOo?=
 =?us-ascii?Q?QEwqf/ZAELtQQOrIkAFicpwljUErxfYby6Zfek99nFYvpYIEfCRyU+RuduGL?=
 =?us-ascii?Q?n6GH5uKHy+wGq13vcW9QeTUfq5hg3MQTcU4Z020bWWKXLbImJCUwWQeBRShL?=
 =?us-ascii?Q?kd1k+NNZhlN87Cht+VPGaW5iRdXcqN4Z+5il4HXii9klMg4wzVHf7XkvOPkc?=
 =?us-ascii?Q?fhzdy1dJXcw6CARyMZRqomoz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0010e26e-5100-494c-fff5-08d9776a12fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:11.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsObtvBCf9xyholdJ/TTrJbRWd/JMS2gFb6loFhePc6B65oZ5UQOvj//HxW965+ij2Txta1Mt3beJ23Bf3oOIUrJzkERpQPTZ+VXIiUNF/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

The test prints qcow2 header fields which depends on chosen compression
type. So, let's be explicit in what compression type we want and
independent of IMGOPTS. Test both existing compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/303     | 25 ++++++++++++++++---------
 tests/qemu-iotests/303.out | 30 +++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 425544c064..9dee2bdfb8 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -53,12 +53,19 @@ def add_bitmap(num, begin, end, disabled):
     log('')
 
 
-qemu_img_create('-f', iotests.imgfmt, disk, '10M')
-
-add_bitmap(1, 0, 6, False)
-add_bitmap(2, 6, 8, True)
-dump = ['./qcow2.py', disk, 'dump-header']
-subprocess.run(dump)
-# Dump the metadata in JSON format
-dump.append('-j')
-subprocess.run(dump)
+def test(compression_type: str, json_output: bool) -> None:
+    qemu_img_create('-f', iotests.imgfmt,
+                    '-o', f'compression_type={compression_type}',
+                    disk, '10M')
+    add_bitmap(1, 0, 6, False)
+    add_bitmap(2, 6, 8, True)
+
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
2.29.2


