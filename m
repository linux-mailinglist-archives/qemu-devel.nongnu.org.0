Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB647E7BD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 19:47:20 +0100 (CET)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0T7W-0007Ln-Rm
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 13:47:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0T0O-0005EP-9v; Thu, 23 Dec 2021 13:39:56 -0500
Received: from mail-db8eur05on2101.outbound.protection.outlook.com
 ([40.107.20.101]:57119 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0T0L-0007fG-EI; Thu, 23 Dec 2021 13:39:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgwIbZDheulZ9i0fh0Eh212BYrwTtiOG8hqD0qi4gAPoK8p+owI9RsuyW6w8pFszHUq3OdwhPg0no69AGO6ihoPtbuSIVnCB+3AOrx9bAjwbtFKZNjkz1SglUBqq3qjLjTAvq/5D06lbO2s6VN2wEFfIIL63vw4bLAx/Pj0as2JUFX+O4V81tw3xfka87+qLB3f+3WJaruxaXYl0a25N6j8Lk22J5teS090H8xHIjfbZcMvLor7OoPOiVlO+nq7gxcipUIsiDzYXzr7KdoGH4YwpC23jfHUti7ys6S6dlG4hkCYFcFjb9RaTYKP2DsLzpqbZUNnGEIAL6zEJ1byCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymQi6oNcuQkCejGUZdD/bNC2J9JyXKwrmqV9kUg6D7s=;
 b=AAR+IidQjMcIk4g/ye8iyWjtgl5YQklenG9xULYyixyWVpENblICQR/9NEgevCMxZrlTu1gjCydVgxSn5MpAJTlMWBGKpQXFiLYqAuHI9n/iqYDBqksyNPizTDs+x/UGUQjmGmtRuYi9VHn4HrzTgCrDpsUFHnuWGO7L0OZlBRkNpS8Lc/VXHJBuGLl33jVm2REWTdSPFoDkWtkHovrXU887drhDhwPDlu+vjIFlxzly6ntqqNTwk3/XlijeiFudIoL4CVeCLDqP4j81tqg8NnfN50b0wbVaMC2Yb3kpnuCWdGwWuWdGa7t2XKshR+u70H1zvKKemZDfAnpsDb7h2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymQi6oNcuQkCejGUZdD/bNC2J9JyXKwrmqV9kUg6D7s=;
 b=vuNpPt5ld17h7oYTLivtAcvW9JzS4lLIz+rxGjNA3pj3Ujp0A1//3+U1opnTYGwRyqqNoewBv75KGlhu/9+aDbtSQt1XnH+ghaG5qdGcP/ME6Wzd2oHdkupxqPhjncmbyxcYtIqi/lRxKoexzSOxEhKTHkNbzJD1GrB3DO/Em/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2180.eurprd08.prod.outlook.com (2603:10a6:200:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 18:39:49 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 18:39:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH] check-block.sh: passthrough -jN flag of make to -j N flag of
 check
Date: Thu, 23 Dec 2021 19:39:33 +0100
Message-Id: <20211223183933.1497037-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b10da1b9-b5af-44a7-2909-08d9c64398ec
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2180:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2180F8F0045B459A22237A4EC17E9@AM4PR0802MB2180.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2gZwhZU8moMJDOaOGmjQy7jc3tDq15+iO6GRy+qhQbWinxwi8WKEsZ+Q7RxiGHVXTIq8KdSvYDg6zKuYgJYmk3QJ7Pg/7x8pAr+6LNQcuB6HAzujHYqqHyK3Cty2Mc0IVKotLeuC8ZlBUnVv6Sw19k6FG6TqHWGEGYfdLaBpeylluCCihoCZfDwGQGSWhcdBLLPe+VKYVbXfW1xTLYoz8nvl9K/jMYbw+akt0rwqlylSXvzzDt2VEW7nYrIrwEjMqWTEuMQk2iVdq790uC/+TFLTTzMKRYIWh2e0KaVKrRU3q7FmRFLAKnDY6ke9Nl/Jej91ztw62Zks0y2h5fb0znh50sIrqv6w/wP5vMbwecmegTZDO+IBFgBrbkTjPfvXGjtqZ2MYf0kziK47cafw0dsXbtjd6cFrP2UsI28JggYMyX3YvoGHC52D/3QTE1pEylsI0XPWaRX4BSGSHKlzS/VKqpVuJF9daifbAr7zDzwFIWbg/5mL9Q4SmCCxP5X/VPWlCwHD2CjFlGtXj1+zdk4yoFX3ufg0Cw4BLCH4ai+h+UuydCDASql86rDJ0nrc0kOVHE4pGRwmAlFCbt1obHtg2I44diNrzXIIzPBQhV23Uq4CFhmpHwpm6Id60LtjtgUQ/t+ONPr8kW8EuIwL1dnOpkDKnpxDA2DBQwXwKb6xKHWpplqk8NaFLroNPNcVdLnxfBCPZmXNwUSug+Xaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(1076003)(5660300002)(66476007)(66556008)(8936002)(6512007)(2616005)(38100700002)(83380400001)(52116002)(86362001)(6916009)(6506007)(26005)(8676002)(186003)(316002)(6666004)(6486002)(508600001)(2906002)(36756003)(107886003)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M75XZb2Bmel0Rvy2aWCtoRN5oFG8xONa/fZp1EWj4djgI2SRNvK/SjFUvvP2?=
 =?us-ascii?Q?QwcC1CaN0J+LnJGOVJGnTKwRiOq9Oy6Ca8kK3PjI99TGn4YNpw2fmfm4zEYN?=
 =?us-ascii?Q?kRs2rfeReb+/EffK8KodRrkvubfpeupSytjdSHUktA8jiYmZLjcljQC2aT2y?=
 =?us-ascii?Q?6Upg0KkP8RbOYmvFkZfkoCvi/789AdpsDbiqRnpWvAcLjq7XScyOB11N67GT?=
 =?us-ascii?Q?LdWKUXw25d7Mt7fsFOyj9hG+KXHtCp8fkwQb3UzqiVVW5j6xPb2WrO7g9IgU?=
 =?us-ascii?Q?uFXs11TiS9Ryd+s5iTX+ZjXDt4AlrvcfAJRl1o5jBS35XewyUB7HGn+O89Si?=
 =?us-ascii?Q?3RJpK1AoL++S+abShQMqZpEwY+2dPdVyeZCsogFyXcqa+8MubLmHyh1m9GAr?=
 =?us-ascii?Q?Hzb7UMmfzXR7zBhvWk4paXJ3qiZUa4eJrAzD/Z8KPVyMAn+sc7cIJWwAToPr?=
 =?us-ascii?Q?IEyry5fqSX0qfzoKFAqZunoQjPtL1lTzzi0SXLjJVUEwpIbmePcaAyJvQtxy?=
 =?us-ascii?Q?hsXzMdtkulYQnljDuUzdAScfFQcCCTo40YjbYxE8MRwRKDEz7zNOcaDqaUv/?=
 =?us-ascii?Q?iePeNiZOQ/e4q6UZDwsblnwOMApximeGEjlHJIhfIAS7jHvyNnIZtGttMJZt?=
 =?us-ascii?Q?gFOe+EjfuWmLcZAFVgu/mx3iIju/AoSEiSoV9tyzMTOax9v/gu7o3r9NorHL?=
 =?us-ascii?Q?7hSM98xLP3h4oLsJUobSiq4JxE+YxzncOmFz9HDAw0zPbMa5Rzlm2zMGdxZA?=
 =?us-ascii?Q?o3IpEYiC+sreR4cIIsi/SzrQ7eU7Kp/1sRhp6fybGRtu1mSUycOrm5qKF17l?=
 =?us-ascii?Q?dNgZDqz8zBw23Rs4BP6yaudkhEQ5OMZWjNVCaLBugrgiKhY45ebigQglzlbE?=
 =?us-ascii?Q?a5tt9svzMTbYvtB9eIVyLbVINtUdU7BLPbgMRxMSXgfC4BLUmtVVG9OBn6j6?=
 =?us-ascii?Q?/bS1wjEnH11omQMko5v5ZG8YZh5UvGxrKdZfVtgvBYSHjTEIPq2kkXUJz6bO?=
 =?us-ascii?Q?EMDPZnqGs/hyB0/7QpMFljxSuZA5dAPs0mQag6tJOpVZlIUDjSEPYbWrTY1U?=
 =?us-ascii?Q?kWLYq9dXwYo2TVJZAtXQC5fHWZobxOHbz/PCysthp/ipk3yxqOEip1j+ZzSK?=
 =?us-ascii?Q?GLoD7w+FQkRSnbLMFuOOWutc27CN/9qQRZ3kb35d8C+G57CwPrZg4v9RpT7R?=
 =?us-ascii?Q?BZKDFAnvFxT1PJdjMe7yemx3fvtc08+dMdq4alsueU865A6S+s/vnAbyK4u2?=
 =?us-ascii?Q?9IlEki1tkI6EBevi+KzCcqj14peXLFYaE4OAQ6jna3tfEH8e8Ids/meTTRtD?=
 =?us-ascii?Q?jQURi8wRx69cLJRZrNkIJAQA/ksJpUMGQf+Us90+Zdsgjj7UDY2PZVZL6rDk?=
 =?us-ascii?Q?ZvbVdoS5Re3OJoCV+EOoD38QYhkLVe+5vSLH9pY8q5vcYW8hJPjnYnJWhXMt?=
 =?us-ascii?Q?1TWf5NM2UN1zsAUwOiiILuvncSBnzftCk3WQw31cm1UH9wYeVQaRnuQ9Vn+t?=
 =?us-ascii?Q?o1LRixnC+YZR395bwguHNpszz5qZGDrYirO3fXU7tBrgX2xDfzxthj6WTlgM?=
 =?us-ascii?Q?MWFGxLDvGYz58vovhzdtJda0PWN5HOx01AIJBiOC8cKWOnECZNEQz4sb3KtP?=
 =?us-ascii?Q?HEmPDjt4e6TDGIWJNiKFHkzZMiSc5kCzeUw9ILVXo+yIhJcesX3VyP/808e+?=
 =?us-ascii?Q?G6oXVQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10da1b9-b5af-44a7-2909-08d9c64398ec
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 18:39:48.5682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycPlA6Nb3JZ4ZXJiEEqJL4/v4bq1gY/2GQ7dT5zfJ4Vqn7NFp+esfKeIl3PHNmJoO0s/Q8cv28VuJn4pZ+JX9rMtONkr57/yjTcoMuRAkDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2180
Received-SPF: pass client-ip=40.107.20.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

This improves performance of running iotests during "make -jN check".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/check-block.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f86cb863de..d98d49ad63 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -74,10 +74,17 @@ cd tests/qemu-iotests
 # QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
 export QEMU_CHECK_BLOCK_AUTO=1
 export PYTHONUTF8=1
+# If make was called with -jN we want to call ./check with -j N. Extract the
+# flag from MAKEFLAGS, so that if it absent (or MAKEFLAGS is not defined), JOBS
+# would be an empty line otherwise JOBS is prepared string of flag with value:
+# "-j N"
+# Note, that the following works even if make was called with "-j N" or even
+# "--jobs N", as all these variants becomes simply "-jN" in MAKEFLAGS variable.
+JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check $JOBS -makecheck -$fmt $group || ret=1
 done
 
 exit $ret
-- 
2.31.1


