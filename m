Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD1467844
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:30:00 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8dS-0006yD-Oq
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ic-00024i-L7; Fri, 03 Dec 2021 08:08:27 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IY-00071J-Nw; Fri, 03 Dec 2021 08:08:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjHR+vrOlSz6ItjSZroNuJGiW1lDs++atZZ9NyMYrOPig06yBOv0Ji7zIMC0hi/SLMYNQf0GdMRgczwA9XPTOjTWRg8IBgdNVgSizAoFbjyd1h8yu1z+Tg9Vzt0ISahQNLiN93bOachC25TUS98lPd3f3C269HEQk411ogLPeNRkk+gaUvjKn3YOX2TkpBpq552YGsMH8Ht/TOd0IUlgN2kT4N9L2xrufz8XJNvbd1MOdGoHkgv1ywlC804LKmzeUzKaRSIQUc1HVezXEwuJCkgoDaqdP17z7kntj5p4BoCj2GuI3wYYvint8I21RnLMsLh0QXiI3tZCnRXrkWp30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+zsyEkm9TTfSkavt7bZMWBtcSrBK5Vuea26sBVgX08=;
 b=CrcKUUDHwPAn/MKudo/34OrmKY+GrXnklC/FFBmQZ/uCqYkPPFoKwVqxEegswzAl5So6ZaLkIvZePDwPVX5PieGOl0vRKlHuyKdhG+hfMRVqEPvPnFRoDs1hUsSS1j3A2SXFzo3gml8kYk1yosQSKLvBxBor8PGHDOjqGEjCArasmmft5gDKoNqUwaJ1tx6K6PWmRJb/CoPlfUWz+0ao98pAF1lELonKaxjfr60HnbO94GUHz74slj//cKht+eFvsA9h+XVF6BXpVOrwzwObixi0FgVlk+a4J/PhPlhe32efJYBaEY8WY1rMBouv6EiIF3vPGX+1bYzvGbXN5g85cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+zsyEkm9TTfSkavt7bZMWBtcSrBK5Vuea26sBVgX08=;
 b=cDQZN8FnuYh2INjx5pHqNytfj7WAYCAqIL4yk3ofH6vgVwlVjhfRE8JdgdGm/cUQfzPkXQD0sBtPcLMGo3MV7h35+I/kuaduTZDSB7lr2rXeTEPLAXMccz+n4g9uSHjnicwYWnWhyOc9TfL0Y5yr/t6QXawE5qntDmhIwpwKKz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 07/19] iotests.py: filter out successful output of qemu-img
 create
Date: Fri,  3 Dec 2021 14:07:25 +0100
Message-Id: <20211203130737.2924594-8-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca210a34-c7c2-4d5e-002b-08d9b65df4c8
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB451561D724113BB54667F1D5C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vPaq44z6I9UF1O8U1lgG+G/xt15bDKE1+xBdbN/PFzd7LzGGKu4nLLfyUiKAH54BTRMyMZpJwFgBSUePN8wm8I+AuWjlIeA7/flUd0imvHUCnFzmKB0ywfyMUFD8Y2sgFNRN6XS1e1WP60oA4XycejGHnPeIdQEm7RLibc8/U19Z855Uowv9aDwvfh44KrMd4FJxCb2OmpUZ1wYRRjCx6l2frHm+s8KjD6abBx0T4/2I3ocV1AbuirWjT06U0ZjIgLtkhRjr3kQjNekOmiG0JyrnGLQs2xoWyvjVWNUbBDpnM6hLLk/ZUTSgxR+7jnMz+DORq6pIQxGi5otb8KrRrBD8xlCr2auj2ooh6b14LH4aROLnkOs8fhfE1vGL7Nv+jZE+faepLG7XAXlpNhAVEyoGpYyL7Lr6gX2UWzgGS1zAddphQtEF/okkSyWXbKTmTXjSl0Hks6y29WS21yg0DuEOyiLmmqKFOJ1BIRKfkDCQqC8C7eEnqoMxzfGyNTKknE1w0/xwyxPN7RrrVv7W5TCZeZYKsacZeXg0bZdyNA04io88f5e4BEEaxKR8QyJ6yqAvFqRfTfsf2XpNz2NpCiLg/TV/7tQV4sNOQyXUp3FjWQvlrgoDokbfI0VlM7jT0zh5amuJCjZbyiMINpRGf9/HarDM8boU/JsztEk5oPrIwmAFBRGv6whWIzHwGZN900fJjGCSSl+QyGGdYd29oms6Cd2xG8Q1RU6lRi3OP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(30864003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M20PeYnUVcICKrcIdK1t4WDnB5zwJICTCWppeXtVOEwSZLxGdI8zUGDRStL4?=
 =?us-ascii?Q?9377HRlw8uX+NzEzlD3SnEPrmvOG1DXJWzTjRR4iagTntfsim9QfeZuQ3czA?=
 =?us-ascii?Q?utmm6sfEXhdalTyBsfd+Vz/+mySQh6GiHPtFkYgHs3ru9pQNsyqxCsaDv6TJ?=
 =?us-ascii?Q?Muwe7zwoxh3nyv7TOammW/Lr53SJG4WMtmKz4206ht7Lrhc1cuFIXkEE1nv+?=
 =?us-ascii?Q?KZksWF4JyLI+p4L/bLvvyQaFF1o1+LZmwSOfbrBRHEWVxU9SfDGHmFvk69iR?=
 =?us-ascii?Q?Gu/jld0ZGC4+1nV71g1vXTrrILgwmnnmiBW9VwYiMcVQWr9zf5nWqV27b5am?=
 =?us-ascii?Q?iFqbo3wK+XiRmMwLO1IoHNMhUnItLcvDhmyrfUsEwAWlrLrZ8qOkmyRK9JKk?=
 =?us-ascii?Q?cCKeCas/wIKiaa7CJwRLnVaOhyiEdfL+KUdOiFuR7l5/FHRQw1cMy1uBDN4i?=
 =?us-ascii?Q?fOTpDHdJa8/lsUJer9ysXnQmo5w22Zpy5S5R/M7Ibez5nWKu2pMsFuykxLBw?=
 =?us-ascii?Q?R1dbZ1VLTbmrozQqtaMzneUtvFYLvVhLXdyQ4KI5L4qrNjWf1t6SON4QkeBA?=
 =?us-ascii?Q?K0zLaUxGvDd2A9vkgwcENrMr+I7q/mZlnkVNB9auijC/PYXocl5RQWVsVQmH?=
 =?us-ascii?Q?DSObvPh/9vbfT3eY1IlMrmcIJeZqtuTYV0NZJ1eEX0DhtBpfxAd1v4qs/vUj?=
 =?us-ascii?Q?kkG6YY3ApHg9FpA1spsrtGGHQXTSNT9esl+1R9+/iNMv49YfV7FaWjcrZN1R?=
 =?us-ascii?Q?UUCrVqt4A7YRV1HQwjCuil3VVyotv97FWhstDGq2frJPxlL5QnqrJsKC5SQl?=
 =?us-ascii?Q?poazNioTYyTphbwvGV0qFLQxbnHuO03akwh76qqYdjjrjy5ESnSqbcYcnW1h?=
 =?us-ascii?Q?hhZcUgbXOrzszLKF7qUNkKYiDjlZL1YmszEcTBTaPP6yCHGMDEkE+BsoVYTk?=
 =?us-ascii?Q?51DuU/nC3uznCgmIZ62phVGWeDCK5OPD5K02dmqs45YolWtRpocGY0k1z+AS?=
 =?us-ascii?Q?irQi+wQlNAI2J4qCTRT9zWKF9Q6xKS7srMV+6FRmB0vaCCYGTK7x7ggpwRiu?=
 =?us-ascii?Q?ddgtx4htGVWAkPX0Ro9trCmXp2aDC3HDAc7hb7mptvF5F2sFOeYQHhJ7zspV?=
 =?us-ascii?Q?odefEV7/42L3ysQ7BAknMJNFxgi/U0qEgDFpsSYWznOIXE9l66obotXmcYF7?=
 =?us-ascii?Q?ReIFaIXkqtN1IkqIDnSzSFzT+bKHqy/Xsg/LLS9nRPs2PJjnHcdiDOsxeLbX?=
 =?us-ascii?Q?eN+1Og5sDBMedFKIUACrVdVroPwy5Q3uKOHNz+a1vBO9tS4kyzOENqLeQLiP?=
 =?us-ascii?Q?2LQk1cGUoaGkQaRaDOFPiyWVqJPeNPcKEKVWQ3GsdCEcWDKegqjIYAx6zBsl?=
 =?us-ascii?Q?LquePkIRbCLEwv7GsOX2jGuhdS8kwq7PyU9RiFEwhCf2kudZ4w4I9y3kK4SR?=
 =?us-ascii?Q?zDBR/i84xWYS55Y2yOsP+qXFeprLkpqvI/GjAj0QsyQ2MiXql4pqLdW6/Cqv?=
 =?us-ascii?Q?yfrR9h+6jE08xzissZ/rx/mxbjIsO+SV4UGDbhbkZSUxXDQmfzJrEtiCLzPl?=
 =?us-ascii?Q?gC0/3XkY3i43m9RYIdhoti7yp7r/aDWi399tY9lJWv+UNe0BTcAnb9eWihYv?=
 =?us-ascii?Q?gjcX9h/Uy23t2LSUzKRSWEwYCHwA9MY8EHRZfBYMbkFy0DXLEAqwSRTsJk6a?=
 =?us-ascii?Q?O0lFQQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca210a34-c7c2-4d5e-002b-08d9b65df4c8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:11.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKGXxG12Dz0e/k3hzKVov/j8u3CpsS89WBHOI8F5SXYRbMYLMLS//5pacfXV1HS2wnGyi+cQMtywE/ZcnX0CfmAoTP+0zFFHFH9JAyGKuhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.107;
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

The only "feature" of this "Formatting ..." line is that we have to
update it every time we add new option. Let's drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/149.out    | 21 ---------------------
 tests/qemu-iotests/237.out    |  3 ---
 tests/qemu-iotests/255.out    |  4 ----
 tests/qemu-iotests/274.out    | 29 -----------------------------
 tests/qemu-iotests/280.out    |  1 -
 tests/qemu-iotests/296.out    | 10 +++-------
 tests/qemu-iotests/iotests.py | 10 ++++++++--
 7 files changed, 11 insertions(+), 67 deletions(-)

diff --git a/tests/qemu-iotests/149.out b/tests/qemu-iotests/149.out
index 6877ab6c4a..ab879596ce 100644
--- a/tests/qemu-iotests/149.out
+++ b/tests/qemu-iotests/149.out
@@ -61,7 +61,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha1.img
 # ================= qemu-img aes-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha1.img qiotest-145-aes-256-xts-plain64-sha1
@@ -181,7 +180,6 @@ unlink TEST_DIR/luks-twofish-256-xts-plain64-sha1.img
 # ================= qemu-img twofish-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-twofish-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=twofish-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-256-xts-plain64-sha1.img qiotest-145-twofish-256-xts-plain64-sha1
@@ -301,7 +299,6 @@ unlink TEST_DIR/luks-serpent-256-xts-plain64-sha1.img
 # ================= qemu-img serpent-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-256-xts-plain64-sha1.img qiotest-145-serpent-256-xts-plain64-sha1
@@ -421,7 +418,6 @@ unlink TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img
 # ================= qemu-img cast5-128-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=cast5-128,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=cast5-128 cipher-mode=cbc ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img qiotest-145-cast5-128-cbc-plain64-sha1
@@ -542,7 +538,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain-sha1.img
 # ================= qemu-img aes-256-cbc-plain-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain-sha1.img qiotest-145-aes-256-cbc-plain-sha1
@@ -662,7 +657,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha1.img qiotest-145-aes-256-cbc-plain64-sha1
@@ -782,7 +776,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=essiv ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img qiotest-145-aes-256-cbc-essiv-sha256-sha1
@@ -902,7 +895,6 @@ unlink TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-xts-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=essiv ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img qiotest-145-aes-256-xts-essiv-sha256-sha1
@@ -1022,7 +1014,6 @@ unlink TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-128-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img qiotest-145-aes-128-xts-plain64-sha256-sha1
@@ -1142,7 +1133,6 @@ unlink TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-192-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-192 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img qiotest-145-aes-192-xts-plain64-sha256-sha1
@@ -1262,7 +1252,6 @@ unlink TEST_DIR/luks-twofish-128-xts-plain64-sha1.img
 # ================= qemu-img twofish-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-128-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-twofish-128-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=twofish-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-128-xts-plain64-sha1.img qiotest-145-twofish-128-xts-plain64-sha1
@@ -1383,7 +1372,6 @@ unlink TEST_DIR/luks-serpent-128-xts-plain64-sha1.img
 # ================= qemu-img serpent-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-128-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-128-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-128-xts-plain64-sha1.img qiotest-145-serpent-128-xts-plain64-sha1
@@ -1503,7 +1491,6 @@ unlink TEST_DIR/luks-serpent-192-xts-plain64-sha1.img
 # ================= qemu-img serpent-192-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-192-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-192-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-192 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-192-xts-plain64-sha1.img qiotest-145-serpent-192-xts-plain64-sha1
@@ -1625,7 +1612,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha224.img
 # ================= qemu-img aes-256-xts-plain64-sha224 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha224 TEST_DIR/luks-aes-256-xts-plain64-sha224.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha224.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha224 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha224.img qiotest-145-aes-256-xts-plain64-sha224
@@ -1745,7 +1731,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha256.img
 # ================= qemu-img aes-256-xts-plain64-sha256 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha256 TEST_DIR/luks-aes-256-xts-plain64-sha256.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha256.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha256 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha256.img qiotest-145-aes-256-xts-plain64-sha256
@@ -1865,7 +1850,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha384.img
 # ================= qemu-img aes-256-xts-plain64-sha384 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha384 TEST_DIR/luks-aes-256-xts-plain64-sha384.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha384.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha384 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha384.img qiotest-145-aes-256-xts-plain64-sha384
@@ -1985,7 +1969,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha512.img
 # ================= qemu-img aes-256-xts-plain64-sha512 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha512 TEST_DIR/luks-aes-256-xts-plain64-sha512.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha512.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha512 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha512.img qiotest-145-aes-256-xts-plain64-sha512
@@ -2105,7 +2088,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img
 # ================= qemu-img aes-256-xts-plain64-ripemd160 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=ripemd160 TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=ripemd160 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img qiotest-145-aes-256-xts-plain64-ripemd160
@@ -2299,7 +2281,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img
 # ================= qemu-img aes-256-xts-plain-sha1-pwallslots =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=c2xvdDE=,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img qiotest-145-aes-256-xts-plain-sha1-pwallslots
@@ -2419,7 +2400,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-auto-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=essiv hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img qiotest-145-aes-256-cbc-essiv-auto-sha1
@@ -2539,7 +2519,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain64 ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img qiotest-145-aes-256-cbc-plain64-sha256-sha1
diff --git a/tests/qemu-iotests/237.out b/tests/qemu-iotests/237.out
index 2f09ff5512..aeb9724492 100644
--- a/tests/qemu-iotests/237.out
+++ b/tests/qemu-iotests/237.out
@@ -129,11 +129,8 @@ Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't
 
 === Other subformats ===
 
-Formatting 'TEST_DIR/PID-t.vmdk.1', fmt=vmdk size=0 compat6=off hwversion=undefined
 
-Formatting 'TEST_DIR/PID-t.vmdk.2', fmt=vmdk size=0 compat6=off hwversion=undefined
 
-Formatting 'TEST_DIR/PID-t.vmdk.3', fmt=vmdk size=0 compat6=off hwversion=undefined
 
 == Missing extent ==
 
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
diff --git a/tests/qemu-iotests/296.out b/tests/qemu-iotests/296.out
index 6c69735604..42205cc981 100644
--- a/tests/qemu-iotests/296.out
+++ b/tests/qemu-iotests/296.out
@@ -1,4 +1,3 @@
-Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
 
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -13,8 +12,7 @@ Job failed: Failed to get shared "consistent read" lock
 qemu-img: Failed to get shared "consistent read" lock
 Is another process using the image [TEST_DIR/test.img]?
 
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 Job failed: Block node is read-only
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -26,12 +24,10 @@ Job failed: Failed to get shared "consistent read" lock
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 {"return": {}}
 {"error": {"class": "GenericError", "desc": "Failed to get \"write\" lock"}}
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 {"return": {}}
 {"return": {}}
 .
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 055b162531..f19f0590f5 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -140,7 +140,9 @@ def unarchive_sample_image(sample, fname):
 
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
-                              connect_stderr: bool = True) -> Tuple[str, int]:
+                              connect_stderr: bool = True,
+                              drop_successful_output: bool = False) \
+        -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
@@ -152,6 +154,8 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
             cmd = ' '.join(args)
             sys.stderr.write(f'{tool} received signal \
                                {-subp.returncode}: {cmd}\n')
+        if drop_successful_output and subp.returncode == 0:
+            output = ''
         return (output, subp.returncode)
 
 def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
@@ -196,8 +200,10 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
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
2.31.1


