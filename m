Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04347E622
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:05:20 +0100 (CET)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qaj-0008Ry-VR
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXf-00050t-Az; Thu, 23 Dec 2021 11:02:07 -0500
Received: from mail-eopbgr150094.outbound.protection.outlook.com
 ([40.107.15.94]:1607 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXd-0005Ky-LF; Thu, 23 Dec 2021 11:02:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc7K7bEPBgA4mHiuPwFrB51NCb4EwnsSdhVSZW75IbPM/FdfCtzJCNtz/g+aEeuBnr1+IJNC4Vkl08DYhzFP5axnySvmITXjlVvYfoBqRsiqA4Y0xh95U/Vbmv5Km45YG4wlPwK+syeMIKMMTEYdULrYvZ2jWj3RngxLnwp2rCYnmF91hwmkFKeo+FJ2zKnY/xdZlocLbvHdpMPa2myPcJ9yspL1aMIZXqmVT4pcj5wtBd6OQJk6MHiydFRb/8A3ZkLYBwiTgafhQpksmHSNUZZal8qSR0j0VFMqin10TvcuI8ywX681Gt7XPlKSbpLjtJxigSqvdwfbzUKZuC5uRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMwXdZz7gBViyPMoWfGcrwQnD0M52NhNqrghnGxkZ4o=;
 b=PjKuB54fRaLLr1KLEWmhb2sjvE+KXmOExDAwKrm6G2TsOhkzqiwRzm/mldfxec2KtTy27qcWdoi6eTymOyZAGOdt+X2iJslS/mtZQ/oMnxmEZmJvwW1O/V65HZTCVyg/88UU9supAxoyPxFo6Z1LWYxdwpvyeCO7n/+Z+BuGm5GlT8eQjgv9m6ViyiBgtEb36kYQPPzaqmiNr+0WG2npRhlEiO8wy8BMjpMdwUNEebYarb6BKyQNvPfvaBu5YutdDnd4sKrKbmpzai2rzr1LLgOTvjA/0FfH4DpTDraEl54Kk5dvTsL15ZuvyNP415mLZJSLQuocRQUVGD3zGIhc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMwXdZz7gBViyPMoWfGcrwQnD0M52NhNqrghnGxkZ4o=;
 b=al6gwt770dnkCPdS0sLudc2PC9gkXY1KqQvffunY1qEhLq9eOgDHR2AaHEgkOsTTR13mHqAFfKqBjNaOoEhZdvVFHLTrUXbbGikkjYGelKOlmCjdGuGCkaUtyDZtD9OmZwSlu8pmSFw8ZGBsfWSVz22U5zIC+GM3ejy8ZHPxmfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4147.eurprd08.prod.outlook.com (2603:10a6:208:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:02 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 19/19] iotests: declare lack of support for compresion_type
 in IMGOPTS
Date: Thu, 23 Dec 2021 17:01:44 +0100
Message-Id: <20211223160144.1097696-20-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b9a010c1-6d38-4cc4-2630-08d9c62d8eac
X-MS-TrafficTypeDiagnostic: AM0PR08MB4147:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4147A5BFAEA5A10F58363B37C17E9@AM0PR08MB4147.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSekYwJ6C29hAINBH63sIOemiq3HjpCv4/bJQ2oNbn+P4R8MGF5uuC99k6JHb60e2n0Q0IJp7PYkFynSE9Mg5dXiQEiBOTGPWlB5bc3U650TzVv2BI4caDaT7x7mUuEIEz8LR6yb6WThOpOQE0xkSCDx9XH9xdiG0aksgLxLjFkNrp6rESMGW5ZJ6NeBwUNePXgkjYp8+J6iF9lpjpLK1Mzq13oLnQu8cVcg2LSvp17/JLzwmjH0ykz9EOuodzAiXnF/DwEAoF0mA/qI3u7d2nmq/ii7mDOvzNUB9AxERcuCHZhawAiDIALHkvPhC72AP14MFhnamOWexgnyaPDLwjffPoVg5blEIp0YL2VJPF4a6M7k33HpaFqhDtGrW9hQOSPgnPmC5xsfewcngarsn1s0ZZKDdkjhTDTk2xj2pSYkMds/1GWssI9PUrefuH3asJr3LiVEQjyGllfmVlw3U5wC2nnoK0gcIXc9iNmEX6Dd18lJVoHbeaLDwi/azXkO+wbkUwC2jkYTg/R2xQFyldxWZCg21Ci4zldE6XcUUL7kF1pH3F+mCU3GqxZg36v2o0YVgSe5E4K3zu0tRt+4u2bsNPSu4vDtK527t3zTnUDhLEjguxXZuZsLyK+KwwR3lLidCpEO3F78DaRn7F4+tg+/Yn6APTxO5qFPMFxWrvd64xNxWnz7i6WyEPl3qHmD5jAaZKdzhdKDywpK6qtVPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(26005)(36756003)(508600001)(2906002)(6666004)(86362001)(1076003)(8936002)(316002)(52116002)(8676002)(6916009)(2616005)(5660300002)(6512007)(6486002)(38100700002)(66946007)(38350700002)(4326008)(66476007)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUxeYnSbzrFbxM37o0XQowdj5SZsWo8XboNS0YopCdaNxJgRc03tZviz1iD5?=
 =?us-ascii?Q?cb+MDFDjOL4Zi8lyTaX6u3rUe2iQ+VXMbJkF6VFm4qVMucPyYtVwZYBheHiC?=
 =?us-ascii?Q?tsZLQNkXrYmZl5V1ptThs2ZqLsmvjto0tCWPnAL2/yq+rvEvD/zw93xK70ke?=
 =?us-ascii?Q?8L9EB5PdaT/Gca2zYoz6HQSRsJrm9mk5qzRiGwZKuea6FwUSx7Qnr0V7Vw6c?=
 =?us-ascii?Q?Vpkk+OM2Tl/4nRRfL/hcL0pWipmLlg4c2IuV1wykezW/eQIeuDDZXBcdNkby?=
 =?us-ascii?Q?kdMTxaAiHFne/0mOdNBPpt6Ky5h0REO6wfjqHyS4RQuSqsLiv89U+3IifnE8?=
 =?us-ascii?Q?3lRzXlM3vg5BCHxw51XWaVDc5MN5sS0sY0O3ah3PsecwVG8eUeSakhdw3+nG?=
 =?us-ascii?Q?FJvqzAsxZriC4MTollr6Joz1zBhS2yfujha2vmzxtz9E/ol/yfhFG6vtuY3t?=
 =?us-ascii?Q?ykQLfh8j+V/rZbVL0c/XVtxVrdAf27PiIM+BXV/hmVi10C7lTcsBPSUDY2Wv?=
 =?us-ascii?Q?xT0g9JBW+R1gLrC3uoxlbDPPTQBq6vbfokm2QhfbQ33klFPYcpFzIHnE1Qp8?=
 =?us-ascii?Q?/oi8uOiDZjKbKKPu2rMZtsRu5MzScZd0HsS/j+4j5Vu7wDyjIrQ0DJALBz5Y?=
 =?us-ascii?Q?AxcMmu90i3O62RXSwdVMfnDDMYkKNlDgQLijnAsCEdjNZJ42fadTmhJZIfS+?=
 =?us-ascii?Q?t4N5766ttpxG8X1wGCYuqfHFceHGdivH8d++PniACLeHVMotEqoHlToUEHYR?=
 =?us-ascii?Q?T4/8l/7m9f6kQZWpLxdlnXWwgQu+XjOfgYd/uXwpKV934wtliUxbWD0ZFeFr?=
 =?us-ascii?Q?8Y4dAETkQsNdcW+jkBJyz1Utf8Dk9dip3nOlKj3pndLrDS3JaQnxLB372EHZ?=
 =?us-ascii?Q?lGaV0Q0VUiyRg67Z2hWKk0FDCGodtmyzgXPm4NdxdIPuXL8naanbVj0nNhS0?=
 =?us-ascii?Q?hL0YL9cZGKFe0mxPlMq7zz/r6KHD8ri5L83FTSm6vAwbGjkWvdkyGdPbK+Lz?=
 =?us-ascii?Q?mXePBFeBhQYxDfYSpsWtFTtCzwT1w7Dmd/EZubvDbwYp6MjlY+HTA3mnttwr?=
 =?us-ascii?Q?9kxO7FRETzHJ4Hc9sdqKj3XhXiTkWIaHlSngXNgjuz+cXmOOL6t7thUefPM5?=
 =?us-ascii?Q?vaMNRwSr0WecyjLeZi3mubeOtMR6OA0rokWrcC/qNjHVKOxU+RDl+ywfGFOa?=
 =?us-ascii?Q?e0Sjuwm9cwuaQaqH0avDjT4KUJMU5lfRyWfqhgEn0eU3cD5CgNHb5Zvyu4/j?=
 =?us-ascii?Q?9XC927nohKk65orNRxMRHoCyYsvszyVaIithNo9sjrQg1l/61r+NG35pNEfk?=
 =?us-ascii?Q?2Tody+/7cmjT+nZoNdh9Rhf2m+TUJbNWo9iiX9nadbDmuikH1r1vdMhlyTJe?=
 =?us-ascii?Q?Ax/J2suHV8Tiw+I5x/S+Nb5czghycCSwE2fa32x9ZmMCgppxRhQ78WGXKcu2?=
 =?us-ascii?Q?d2fNg+6DJlj7pzCsow45/8V/7JFQr/TUpjLcpWLqvtr9BPmW2jT7/5/7xjo2?=
 =?us-ascii?Q?r/vJ1k5xuQFNjXQdW2nUEWZWYi3OaUH9PhMamwJMpeKP5FnNQuRGzvq7Pqlp?=
 =?us-ascii?Q?nrPHTWmcE9AP0IQGEivHEJPnQGBr21jQwXp8StJM342X+fFpIUVPTtPwp4lC?=
 =?us-ascii?Q?X5SLSWYRk+rPOzHl5nljLm9OrOtbqH81CphQ9muY5eNRCn30vv5hYUsJroPo?=
 =?us-ascii?Q?wNCHC1tUvZCocp6dPFFa+sAk28g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a010c1-6d38-4cc4-2630-08d9c62d8eac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:02.0204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzw2TjUbjNt54dTYBYkwKS0IhkGHqTysnPSSsopEszl5WfiK9BEQkG5KOR/lT/KRPh9b0mhvlfjjPzxaM3Wl+0/4aC/Us2coruRIX3tGLsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Received-SPF: pass client-ip=40.107.15.94;
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

compression_type can't be used if we want to create image with
compat=0.10. So, skip these tests, not many of them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/031 | 5 +++--
 tests/qemu-iotests/051 | 5 +++--
 tests/qemu-iotests/061 | 6 +++++-
 tests/qemu-iotests/112 | 3 ++-
 tests/qemu-iotests/290 | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 648112f796..ee587b1606 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -42,8 +42,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 # We want to test compat=0.10, which does not support external data
-# files or refcount widths other than 16
-_unsupported_imgopts data_file 'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
+# files or refcount widths other than 16 or compression type
+_unsupported_imgopts data_file compression_type \
+    'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
 
 CLUSTER_SIZE=65536
 
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 1d2fa93a11..da93587039 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -41,8 +41,9 @@ _supported_fmt qcow2
 _supported_proto file
 # A compat=0.10 image is created in this test which does not support anything
 # other than refcount_bits=16;
-# it also will not support an external data file
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
+# it also will not support an external data file and compression type
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    compression_type
 _require_drivers nbd
 
 do_run_qemu()
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 70edf1a163..513fbec14c 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -48,7 +48,11 @@ _supported_os Linux
 # not work with it;
 # we have explicit tests for various cluster sizes, the remaining tests
 # require the default 64k cluster
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file cluster_size
+# we don't have explicit tests for zstd qcow2 compression type, as zstd may be
+# not compiled in. And we can't create compat images with comression type
+# extension
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    cluster_size compression_type
 
 echo
 echo "=== Testing version downgrade with zero expansion ==="
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 07ac74fb2c..5333212993 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -43,7 +43,8 @@ _supported_proto file fuse
 # This test will set refcount_bits on its own which would conflict with the
 # manual setting; compat will be overridden as well;
 # and external data files do not work well with our refcount testing
-_unsupported_imgopts refcount_bits 'compat=0.10' data_file
+# also, compression type is not supported with compat=0.10 used in test
+_unsupported_imgopts refcount_bits 'compat=0.10' data_file compression_type
 
 print_refcount_bits()
 {
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
index ed80da2685..776b59de1b 100755
--- a/tests/qemu-iotests/290
+++ b/tests/qemu-iotests/290
@@ -41,7 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 _supported_os Linux
-_unsupported_imgopts 'compat=0.10' refcount_bits data_file
+_unsupported_imgopts 'compat=0.10' refcount_bits data_file compression_type
 
 echo
 echo "### Test 'qemu-io -c discard' on a QCOW2 image without a backing file"
-- 
2.31.1


