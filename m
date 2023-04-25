Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239C6EE230
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI4N-000172-QE; Tue, 25 Apr 2023 08:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI4F-00015Z-MW; Tue, 25 Apr 2023 08:46:47 -0400
Received: from mail-ve1eur01on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::722]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI4C-0000dl-Mp; Tue, 25 Apr 2023 08:46:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDx1JzLVxUU4L5v1DWpnvc7PjCSA5HD/FJB+w0qv05cYMAGyDW9CsLaKCYBecMl8G4gbXheCLL69c4KCxuBM6EvbkDnYMkzujNzKNvQ4vBRYXKr3qFjChUSUMGEQG1QPtzTDKkTNk9+v10jGhZdsFCW399hhn/G4dB1BLWum8eOxMXVyvhfOXsHdPn1oB4iqvfh8peXP4HmBQSgsxXCis0/M2F+Kr0qK/l8ULWulcMTLswnosKdPiDjwbifwMaylzqksh67gLsZxMV0V+Idb5XvI9cw5oAXEZsnG4HIGe9EwLCVsAk3zTfYlTIOUqwG6rh8k5m80xZP5jyUEg/vKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGL7HxMgStalF0Xb+Gap4NMDYI2rDOLd7JEiC6WJGlI=;
 b=mNEB1LAvFqxrXh2h9rY+kfBleBDOS922TZa1A4Wh+vdf2/hTrucmz1zVzeXXRzrxaqsPitsaSb4DL5uKgqVkZRScYhqxLwr+8oUTpm+7k19HWuxkSMZuUWHVE1KQcyQdaEQOq/yIstj46A9mpLfDqB7V0PZcVI6Tw7LfRsGZWL3rQGqMFsDYL96XSMejgqS09Bkp7QiCe9EvwXrAMPdZwe7/QYpGvsuxZc0/ZSU+yg5k/Fjz2Poqas1PpIQ8olRbjV53bdhn2hfv9AVqbmOHjqgDgKP7Bj/15r+kFWkxtF8ex8kjnHRbAmvfSe6qGtqepS4gzMUh49GBjYeITTVcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGL7HxMgStalF0Xb+Gap4NMDYI2rDOLd7JEiC6WJGlI=;
 b=BPgL+SCjx/Yv1zPiXOkKzNXBuWBLs2brmrLt7SSPSpyC0j9ABQzVSpZGedaxFFvgSFDcmsS3uxvKbc23WCxXMLs5cG5pA/tsWMsdWTg7eCJP21HsDQZYX+M7NUSJ2LiYmgfAaa+dMahQo5ZSZ/7W5aTkbMy69D1MuxEy1LBmZm+RH/zYkO8H+zLAF77FxJ10nbxsXxPDzKfjjyVHAaD90/gGHYR04sCAKB+eqcTAeY0sxoiz2NqzGNZiDFFU0cfH+77hdpaajaV7O83YbE9sSuYxFQVLtweC9wf8EfECZjYeLwxf5M0/K1I/EePbUf9tza15/cI2Ax6ysNEqfTGh3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 12:46:36 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:36 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/6] iotests/parallels: Fix test 131 after repair was added to
 parallels_open()
Date: Tue, 25 Apr 2023 14:46:20 +0200
Message-Id: <20230425124620.241022-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
References: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e8841-e9c5-456f-b5ed-08db458b1b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7yaG7CJ5zF7E/8F8fxL4MQpD1axwwU2SN8UtyAaV5BAiGa0ZeLFcZPc9gJeXDEfomNyVuNd6/FCd97seQ7gmsSqY4O9erAJPLMv+OgjiH0UjrnootzfSd0uLXDABT7p2vZqTpxIzdXVEt8YT16bV/R7mmdRdG4K1pFeHXMw1oZUKBheC2gpuQYuixYJ34AE2Tki3/u8w7x+5yQkaOtNy/vS+1oihv6/IE/+GXz0jqRWoptTdAUOdG8wPgQL/9Hk6rpTIqeHlLdqRD2JyYHLzOmtBHmqoFO7mU7UGntzbx+LX9ma/1di7mCYltA7x+Wjz9UFP94Z3keKQSIe80TATa8FnvggQvbL5owcbLU1+8eJvQmAdTdHZvtiCmTGA1zOEtxSHGHuGzCeLzTtemOfa8x+wR1dCCPjgdpkTalnzCpCghMRiDONiuaB19dc5sSQ0oKmiH8+gDWHPEF2xBHPDUtmCKWzq+TDUsDa5ZE3Oyg1k20kFTVvtvAasRXUC8Gl2cE8c6xP1z51e7IyESDT0+NM874Fu4QmzWhI3hanSFIpFSGoHJVnuA8IljDR5ajxcwr0MNei/k3kpxyPWQg+mdKj9kSb351IKlx+tCBzbhuSkmBZhGzZCsPL7mAQYMaaSUcugNcHvE7wGnIirfqnPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(83380400001)(478600001)(52116002)(6486002)(6666004)(2616005)(6512007)(1076003)(26005)(6506007)(186003)(5660300002)(44832011)(36756003)(38350700002)(38100700002)(66946007)(66556008)(4326008)(6916009)(66476007)(41300700001)(86362001)(2906002)(8936002)(316002)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mMiGt+UzBFdilW249ZAiEj5/5OW//6K34BiAEpEM+CCwDh8X7fELHtCzoQ5?=
 =?us-ascii?Q?u6gVU52lhAV+rs/wIW4u2CSWc6EvNw3WfDIJPaf9ezXSmmedtdr67t+pHvsZ?=
 =?us-ascii?Q?wJMd/dIwnlk4xxI/j6alUo8UAPcR2Zaoe2VesKRBMKsLdPnlaDzouC+T7F0N?=
 =?us-ascii?Q?imxtVTqREiDb39cU5mEmafBtgjPG2lUetAVUxhWNiySq/qGxbfCW1mzE1eov?=
 =?us-ascii?Q?kS0CElLAqdgFygO/57FgizVwKAyvNpS4O1UtNyp+omij+rbdOjBt/8A+DW+B?=
 =?us-ascii?Q?Z8ijkSUV1cVx4039OYx/QRxq1i0Mf014CwDNyq1uM49B8fDz1zeylIrUEvdU?=
 =?us-ascii?Q?NKASTLMkpTpXixgMHhZme6vde7J82b0MXWOF15e8XbiUWksdGSCxSOV1S+dD?=
 =?us-ascii?Q?JTXcAP48Ib1/byBleU0imoBFmtkclrON61AhYUBaLpAC02ssg1DpSSZaLVwq?=
 =?us-ascii?Q?guyNwN8peNeC4HQ7PHgNprsZbdnWMgQwPqOoKMucAM+I5hPkxHyqx5qz76CW?=
 =?us-ascii?Q?o6lXXDszXbYqnl2WsWqARyUydQitMiz5AcruBwPo9yJkTPR7WAFenoSdQrCK?=
 =?us-ascii?Q?xAJHS7X0Yk1Ihun7NL89nG+TCbG6ekc+SEtfnwhstPambqF5FgsxD+LkDeE8?=
 =?us-ascii?Q?o5tqCrLJMVYnE4oMzc3HGw0SHjd0WxRAkZ0uQL7e5LgMn4mfuF5jzxYC2VAN?=
 =?us-ascii?Q?q6LPwxNrecoR22X2vPZEdfiS7OD223oGurPSF1+sXBpni7qRzMb0zwxOM/NN?=
 =?us-ascii?Q?OxTRVglr9nsGbrQICqkSoT0rCHYgv6lzoPvvtjS8oDAmm/5tVy7inmlzyfv/?=
 =?us-ascii?Q?YNOHj9yLK/3ljpWSYA8uZKxpPBstGhjTEFlrdyl20HF+6qXz2b1RwfdOYV3t?=
 =?us-ascii?Q?7iXl5iy3BKFxEx3sM7wFydm2WncJpiJJzN9nntVxIEw28HBU4KG2jNZsqcGU?=
 =?us-ascii?Q?Dd9UQWSRgDmT43v63/DSSgKZlUmaFyKn+qLSHgH6lj+Q2P39L+S7O+VkRLuz?=
 =?us-ascii?Q?csbCqO4aD0B4KyDDP0HWYu6w7Gt4rna+0zRFYcWhiwNjlQhaMxmW7p/0WSW9?=
 =?us-ascii?Q?ZK3pXTA5WwvT7GNQu48HMX7KKGHburf+Bl2N/MCPCjDCb4JE/677+na8H+OQ?=
 =?us-ascii?Q?g9Hrenn9BohVIaFC6iscgbtPxwQvPIgTm8I+HKUFtOYSQhF3QQtgH2XY1ebq?=
 =?us-ascii?Q?RCYDbnigXMA0jiIn8wFxQPo49CdZmoQsS22BCS9FbyJYi4ZY0VqH7DL89OaE?=
 =?us-ascii?Q?O//syuyCAaKGbnzcnYyVZ9SYfcrRQtC5JeJqNgEz7M/zksQlxrDvTTnuT1rP?=
 =?us-ascii?Q?XmYsnW6wSxtuE7qX0ksSfVJnYXCwQqe0JQ+LKLooldP7zFYglXJH0HlBQaQa?=
 =?us-ascii?Q?nmpKYwGutuf0FQoMtkSfsA5ksTE6WalYsyeNOaAUK/UdEmIN2ZUYPi9yx1Zb?=
 =?us-ascii?Q?+xvu4LzGEDxQMMhrM8o+0MHw0JJjpDx24Fnly4dawWDxEocLy6wKKcsoV/jt?=
 =?us-ascii?Q?jy9bmWpAgM0dbzK5xIiU6El0i4DOqcblJO1Vsd/QBmKrIL4XPt5HGohHZLfn?=
 =?us-ascii?Q?+K5FlawHdzTegSBXN4drtrFq0S9/et5oTxgAnCdqRhiOYHCwSG6bH/UBMLAF?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e8841-e9c5-456f-b5ed-08db458b1b48
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:36.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm44tN9cCe/7FrvNoot0ok7b3b9NrFVWd7gl59d14xg6hDD4M0xfIVzjW3DTdDg7muD9DOGDlsHNRXr+errVSKWBnG3Mh6wxjYvqU0LnusY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Received-SPF: pass client-ip=2a01:111:f400:fe1f::722;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Images repairing in parallels_open() was added, thus parallels tests fail.
Access to an image leads to repairing the image. Further image check don't
detect any corruption. Remove reads after image creation in test 131.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/131     |  6 ++----
 tests/qemu-iotests/131.out | 15 ++-------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index 78ef238c64..57fe1e5577 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -69,11 +69,9 @@ echo == check that there is no trash after written ==
 echo == check that there is no trash before written ==
 { $QEMU_IO -c "read -P 0 0 $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
-echo "== Corrupt image =="
+echo "== corrupt image =="
 poke_file "$TEST_IMG" "$inuse_offset" "\x59\x6e\x6f\x74"
-{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
-_check_test_img
-_check_test_img -r all
+echo "== read corrupted image with repairing =="
 { $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== allocate with backing =="
diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
index 98017a067e..d2904578df 100644
--- a/tests/qemu-iotests/131.out
+++ b/tests/qemu-iotests/131.out
@@ -21,20 +21,9 @@ read 524288/524288 bytes at offset 2621440
 == check that there is no trash before written ==
 read 524288/524288 bytes at offset 0
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-== Corrupt image ==
-qemu-io: can't open device TEST_DIR/t.parallels: parallels: Image was not closed correctly; cannot be opened read/write
-ERROR image was not closed correctly
-
-1 errors were found on the image.
-Data may be corrupted, or further writes to the image may corrupt it.
+== corrupt image ==
+== read corrupted image with repairing ==
 Repairing image was not closed correctly
-The following inconsistencies were found and repaired:
-
-    0 leaked clusters
-    1 corruptions
-
-Double checking the fixed image now...
-No errors were found on the image.
 read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == allocate with backing ==
-- 
2.34.1


