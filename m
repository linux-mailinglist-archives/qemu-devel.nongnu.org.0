Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629E3CF923
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:49:35 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oFi-0002CS-Gv
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5q-0003Gn-K0; Tue, 20 Jul 2021 07:39:22 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5j-00077C-8k; Tue, 20 Jul 2021 07:39:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFYlgP+tw4Lg67oHlgsvBGPCFQI3xRUtOKnoPPNvO9L71IDjCtsFgOjFflFp/IIwaGtXqtt/dKwV3FPvZMQbbcv/NJPvxwdDCTYSBn3A6f2MKZp2RyzXdgbFDDZxxO/qdmB/v2STb64umcvfn7ClPD4EOVbqRxFSjJFpxxYnrcau/rymp1v1RtrLFbqg+HUfN9Tyvel0d7hqbFf2a1wM67NzMOzCdIE+5wWuwzCghVKhdUuKVa5x6QDO7p+Whi01ve/4kF8VhoYIMQ0h5IsuTU492MGs7Ql+6jhDSLA07BL8Q87J1fxSrzRFCwd5F2aKtYfZjftFUH8KdzASXvpSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKOw0YucH6EqXoLykl1ICgkIhGu3RQ/1v3rslXcmr70=;
 b=L3nSkAemQQNTlOTSAypSMytmh3g95rvuy92ItSgIV3MBuByOWcUOKQe/A/zk9w5f3SH7ecS2PNr3R8IvK/9tjuUaKaTk2OqiD3DTBU5PrU95TL/4RC6FjlduwOmAaaoZrUuhMSpErtqwkTmqN0x/CR6EJLrRU8pgRb4AqEXe0Yn3bjiCbK+EDSPnFrn1hw7z4WBvk5NbuvEfBcSFQizTjvfs/vkzkoBZz9gUU63ZWvr8yw8OAvTwYEtFoX/DCD+xT9cIHpRAHcZkN+o0d2KrlUI7OXRSZ+dbsvv8lsPBHIur3b1HrEkDfyGbWkLL/4z7oQW6FBnKiWnBlILMiDxk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKOw0YucH6EqXoLykl1ICgkIhGu3RQ/1v3rslXcmr70=;
 b=aRcb75iLneanxAkubVHAkXlCM6eIH+DrquSnMLQfwaAErWMfHD/JSGRjsOK6wuK4cY/Ugim6WooXO2z7QE0FNSSxtQQCnVTR8JgSUBgOQsRb1ZJBWv1KE0r5zEcf1uegX/zLjYUeesIs/BehG3SgGMZa/QaFKv4FXu9kO2tqFxA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 07/17] iotests.py: filter out successful output of qemu-img
 crate
Date: Tue, 20 Jul 2021 14:38:22 +0300
Message-Id: <20210720113832.586428-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27776778-8096-46f7-511c-08d94b72f766
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61194E9F28EC922E2F4F4AD6C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOUMg8hn5qRTv1udd1HoMQmYfxAhWrwhnGr4C3IdHwbDCK/VIbtLVAIMT3dX9N2jmUpuJPK0LxtacM/B2Ob/iMf9phYhUZ/pHgUcX+LbqVC5leeo4qjLWjYSwwPx3uFOIFgarVlobQ+OnhbQ4HlJaerqy3kpa29zCHzqJGC8Y3m1maTxpH9r4OJWOf77bahcUD9lSAy/6LCxlhf3EgoEskH2EOUKyWAwJNJnaoky32/QjPFixznp7fsY736vqHe6GNer5pCnWSnjtnJPZlMliFeajPbwC/IfC09GU5YSiCoXSElLpHcU2eY/1kk5uHa5keUYeewX4Xetsut/psOxKiowmFcBDEUoY+XzaG32IMm7fUCtEe3Q2iwLNR1TDwCGv3SzGgt2i0kY9HoQXAAvrlrJ0XUf/8IGDQBxePY3fqk2MkTegzwuXeBvOxMJAxzRZv6qrJYIgoMlM7meNzhNtFVO3nkl/RSBF0Oj9L63p+Vg+Vqf/YWOfcDtXIGK9SReqWZHRjbvUj2unbug4XT23Hp6nl42Ry04eMdxsqb1+zPqYO2wDiHOWRIq2uwdM6gVwelqcFwn4Ry5bUGmcguQB424bp8zVBb/BTPndZoIUafdDWCnfYyfIZ9QEScWAZfv6W38n+RmdfK++jp/y+2bvX0Cfo17HgIOMFYV9tzzwBY+WFvjoTgXtvQUfDr83kumDs5Bdz91sc9dWGxxp/wwIrBV24KqA6RWoNiwzpGF4xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(30864003)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKYyyGW4BO8/u12cHx88FOa+BsocxuZwDH6Q2miq47cHv4INnv4L9iGmWjc2?=
 =?us-ascii?Q?oT01nH9M35HNvr7gtWMnzygSS8V3BJM+Rfo3I/BURYKrciu9JzTcKNiRxDaQ?=
 =?us-ascii?Q?rw7DXwNHUQZ68+5xEkrprF5aW+KtqRx60c/PqVtuhzHOqi+SLWKwlmZS/kxw?=
 =?us-ascii?Q?r0sNwr6TeG+Xim6+ECju/5FKi1uNAIHCI8vP19Nlgry3BukjAloKETShlCFB?=
 =?us-ascii?Q?m7K3StnH4VlsMdV1Tw0aL3vcDoX/5gKIZE12G/9pdafVOubBee0g4csFs58q?=
 =?us-ascii?Q?OOYugppVgXqr1cfzSRtOSVzwF8HslwaUY7zuNHKYrEdOOrBDAuE5h1WytQrN?=
 =?us-ascii?Q?aSr0qYZXSqFnMPPKiG7UBnXN5qchB+Am+YNYtIhhV/C3GRKsCBwtQtm9YSJY?=
 =?us-ascii?Q?geEMHjQkMOsfB7AQAvv78D4zgDd4GE8oDzIMfFfEV4O7xfB9eKCQZx8kzf4F?=
 =?us-ascii?Q?CnFqh609TZcVYoSSlqO+zSWHp3Kz1ANM1KM+5XBoCGVtGAk8mvXKNI/niWw9?=
 =?us-ascii?Q?XsgPNry1Dm1sGoLVBCsZKmf7XN6JTwwlnQJJEAkE+eMNSwKLxGlvcSht2MWQ?=
 =?us-ascii?Q?EWwUrg7gScYeywnBYQjQE0QFD/bHjQF5krwVevv+shSqbI51rnBy0ID4aryA?=
 =?us-ascii?Q?r5sQ8AFVm6EtUkzz4yhMNkjVhTdDCdKFLSzuHOFwBvKHhriUzkbH/Z5G5tgy?=
 =?us-ascii?Q?zgU3Z93vjggtRFw3OBL2Caf8OyLJmQ8oQpFRQ5RRVnpr0RTinulv4e4tDksT?=
 =?us-ascii?Q?N39BBzpV2IJgTE9qIsE/62LH9MF8mCLkE0eSyvn2cU0lPAHMqbBUWJrk3AbV?=
 =?us-ascii?Q?FWaG+u1O5kqK+yKN+DOlNLm77WtDecFRe89MtDhk9HDOYiE8FHyk6B8msZjv?=
 =?us-ascii?Q?UNKPJk0ZmIMVRqwiiG7QAiTHOadNW0SKaYxv1caMWZttjC/JdHLKi+D6whf3?=
 =?us-ascii?Q?Otd07/TyPSNYUP+SnKHd1I5q6qS6L6Xs8ZaaQyjlzwkjBZqvzUnfT6e1OS96?=
 =?us-ascii?Q?lU2ccS2CS7FZKDqr1CEmAXefIVlbbY+jx/JXHpFnRomaLNrCVei1WyDWNJTJ?=
 =?us-ascii?Q?tIT3Js3tMfBs841CVmy3O1kwKw/xB/EWUJgCccPh+HsHePzlFkJf46+NBocy?=
 =?us-ascii?Q?tDlP9Cd+4ek1KanX41Tyhacsv1dNKtHONx3mG95BdpnMIDOyjKBRGj3KoQGH?=
 =?us-ascii?Q?iTKuAWBG9qR4AHkY0i7+AVYiOsSltOOHorrvM98zjwm2sUx4hxNEDhfIDR6I?=
 =?us-ascii?Q?S2NlVYU5HxDjx3p1fIDePsJX/WaDeb4/0LPgJfzjHGCUrx6ZDjphNTJBFDXF?=
 =?us-ascii?Q?AJvE1Y//0E547kokMxwgH1Yj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27776778-8096-46f7-511c-08d94b72f766
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:00.2003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQqFsCc8Th6Nq32g+g1BNeRdNXmjDAppLAUDlLVPiuZAtisp+nyRmYM+abKYa6ntqoW/GUsq9/nDg8/Yi7XSX+NvwMAqvJS+uX0MwDYUK1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
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

The only "feature" of this "Formatting ..." line is that we have to
update it every time we add new option. Let's drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/255.out    |  4 ----
 tests/qemu-iotests/274.out    | 29 -----------------------------
 tests/qemu-iotests/280.out    |  1 -
 tests/qemu-iotests/iotests.py | 10 ++++++++--
 4 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/tests/qemu-iotests/255.out b/tests/qemu-iotests/255.out
index 33b7f22de3..11a05a5213 100644
--- a/tests/qemu-iotests/255.out
+++ b/tests/qemu-iotests/255.out
@@ -3,9 +3,7 @@ Finishing a commit job with background reads
 
 === Create backing chain and start VM ===
 
-Formatting 'TEST_DIR/PID-t.qcow2.mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
 === Start background read requests ===
 
@@ -23,9 +21,7 @@ Closing the VM while a job is being cancelled
 
 === Create images and start VM ===
 
-Formatting 'TEST_DIR/PID-src.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-dst.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 16a95a4850..1d2928e14d 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -1,9 +1,6 @@
 == Commit tests ==
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -66,11 +63,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing HMP commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -98,11 +92,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -136,11 +127,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing qemu-img commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -166,11 +154,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -205,9 +190,7 @@ read 1048576/1048576 bytes at offset 1048576
 
 == Resize tests ==
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=6442450944 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1073741824 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 5368709120
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -224,9 +207,7 @@ read 65536/65536 bytes at offset 5368709120
 { "start": 1073741824, "length": 7516192768, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=metadata ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=34359738368 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=32212254720 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 33285996544
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -248,9 +229,7 @@ read 65536/65536 bytes at offset 33285996544
 { "start": 34896609280, "length": 536870912, "depth": 0, "present": true, "zero": true, "data": false, "offset": 2685075456}]
 
 === preallocation=falloc ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=10485760 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=5242880 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 9437184
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -267,9 +246,7 @@ read 65536/65536 bytes at offset 9437184
 { "start": 5242880, "length": 10485760, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=full ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=16777216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=8388608 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 11534336
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -286,9 +263,7 @@ read 65536/65536 bytes at offset 11534336
 { "start": 8388608, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=393216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=259072 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 259072
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -306,9 +281,7 @@ read 65536/65536 bytes at offset 259072
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=409600 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 344064
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -325,9 +298,7 @@ read 65536/65536 bytes at offset 344064
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=524288 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 446464
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/280.out b/tests/qemu-iotests/280.out
index 09a0f1a7cb..e39164c579 100644
--- a/tests/qemu-iotests/280.out
+++ b/tests/qemu-iotests/280.out
@@ -1,4 +1,3 @@
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
 
 === Launch VM ===
 Enabling migration QMP events on VM...
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 484f616270..857676a329 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -108,7 +108,9 @@ def unarchive_sample_image(sample, fname):
 
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
-                              connect_stderr: bool = True) -> Tuple[str, int]:
+                              connect_stderr: bool = True,
+                              drop_successful_output: bool = False) \
+        -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
@@ -120,6 +122,8 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
             cmd = ' '.join(args)
             sys.stderr.write(f'{tool} received signal \
                                {-subp.returncode}: {cmd}\n')
+        if drop_successful_output and subp.returncode == 0:
+            output = ''
         return (output, subp.returncode)
 
 def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
@@ -164,8 +168,10 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
+    is_create = bool(args and args[0] == 'create')
     full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
-    return qemu_tool_pipe_and_status('qemu-img', full_args)
+    return qemu_tool_pipe_and_status('qemu-img', full_args,
+                                     drop_successful_output=is_create)
 
 def qemu_img(*args: str) -> int:
     '''Run qemu-img and return the exit code'''
-- 
2.29.2


