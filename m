Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20C597405
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:19:27 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLlN-0004JR-U8
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNF-000724-Mb; Wed, 17 Aug 2022 11:54:29 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:65374 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLND-0001M7-VP; Wed, 17 Aug 2022 11:54:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcWC7ob+xRC0Yq4+eIX8mEq76bYeIogB31AQOFBJ3bqNUK/CRyXkgA1O3VtSTbwVtVorm9kNe4NWZ8dn2z11QUdMRv484Bb9HZm7ZitBT8m8WZqxVvy43WMovCJkwXr4vDsUZORkbFY76URvnUXGRfKqlJkuepDf29fKw9sKdnWTUiiqcFI2EzKmtpkafgXVmU5f/Lhiqr6usmlkxO9rusvlRTkNJoiqnBjT63UwHkZy+/dixH60CTvMnaRbHnw1d+shwH7QvXSvMaEpbVuAVu7JBn+/VY9MgplKfxql160knMhtW2V/38HUp3401lx0+WsiJU+XYFm0qk/9lQR77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7lJOtTCoBtOhh9OoW9Jg1WbG/3EUp6jj13m+UFxdX0=;
 b=dhORGOuPbTw2ViNWLRXxeHMI5KhUzsJgYM1YRNZ8DAoUNnFm/Zk+xHh9YXumaaC74kIuljV63ZXLMaLRQpTVH0yb3JuWo/IG2a5VEHGbBqhXJmb95e5YdL/UCIvQRP0KfanNdF4Ziz8fEKeSj4sxK6zPu0elb4LWrfCbeJIPgt5yqd1vuBsYlkWwWo0mcZ89GY0tXXaHBJHAm+M2+nL0SF7awn0l9O9ZFeGYl/2TeqFShK3AE3aQrFXyS62IzNj8OV5IxtxExhKjgT0+zDXBrLGMjnN+EppFu+6WR8mIymISZKfvpkovx/5aJQOczC/7snh3Ofi+0b3oYqDgYYmm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7lJOtTCoBtOhh9OoW9Jg1WbG/3EUp6jj13m+UFxdX0=;
 b=tuez65odbSSr92oy+7YsDC+Zq9BZeJ/iCGJb/pXagpEDrQ4fttXFcDOSd0NWCTwTvCeUYuuaSQLH0XRjJDSHv1PDqL/eaQYQHECMOQ8w697V2Z153MUhLcTf8xxkvmU46sg8c7oboI/mp0vMS+zMPlpdGGGYcIjSt1isKQFT4kg90PxoDa+CyDmmZcCGArkfnnDscRbQ0Xea3ZW/u3oy3PRohEiRYWzNAUFnBX1gIV5xjVdmLKfa1fe1gF/owgG6cPSGVr4R2IjrG8weBdakdSFsHGp9sXPjP5nl/vlEPyf5/1I7RButSnS6xKlVofz4JrM/sQfwoVJjhb5wu5eOLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:15 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:15 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 08/10] iotests: Add test for BAT entries duplication check
Date: Wed, 17 Aug 2022 17:53:59 +0200
Message-Id: <20220817155401.2045492-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f4f8723-e008-46c9-9dbb-08da8068bc97
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDqgGxBgHYBLOHb0woxUNxAc3sMjqTPOWGGL8DdCUqdCXLxwphee6LTIjLqAD+NWyzue+DGoVbzb1c6UaJxjor9bYsXUxRBfGIwrryTKsn+QO1MdK3uG0i6GoPJdQgRE1dOez6RDHPxgLO031G1I1Rl4zjeL2mcIMPD0itiB13cBIJHoIOPykLw0QSA8eJBSCOHbuR/BWqPEc78hFQbv21FEnJFJuB5SCvG5eiHj5sYHsyCfn5V60lelzLiAFQ+000ysQz4BAunO7tnbUDAXJIcCV+trUgxPmqVFqxZS6W0ldfFItSboRizypiQ4s+cbsCklrASB9OmRUaolX/SjgIjepycuUyoKBGB2UIBE0gDy0yqk1fA9k1uyyXXxo19on52pWwL6jl2jBZzcqkJt7pXnGKe/RbxxGfCh+MFaILH7zrHAJ03grSSo8y6h+nHFyrj4MP1TmJfLPOiv960Q3w4/uCT65/cmttAI7ohCOOwJ9parUxxLB1T3xnPrXxe5/QbfcK9wLs5nvx85ovHuG/tN3XMgmUEcQdhWXpdu/oM5ARJNzDEDCY/nEFVRGS2sxH+UEorP3HU8EsaiNlF82yLpEJN7IdA1TwAJxS9Qr9xfIMlofrSMUJmhAq3lXM90cfAH6de3Xdp6jsOZR6eLLbm3F4N5J+DP0zl0pE5566ssNk62uRaL9t8iBqrL3csjmAnyOaN+xV34ZCIBCAETAlVCntrrCioMKkD9DSiHxHAYTJ7sSae8dQ/C+dHp6beRP9joUYskH+AVGg7B1qkKU9J1PcAT2Vnri3/fl1AhATVagHAF4hZLb/T3lUNT5Sti
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hB9Kuzkin1liAoxD0SJFoDlg9LVu9bDADrDFf/mhSSCabM+1gJECto5U5hH9?=
 =?us-ascii?Q?YCVzxCtBg2fPMtuE4T6z5qBYxVisqlwVzReeWcdVz2EhUy1lU5w+iRBYK3u0?=
 =?us-ascii?Q?EZ/n1cqjJsSbBfiWq2Y8AUFOoUS40/AnRm5x+9wFJLIXGeNri8hykjg4ZJjx?=
 =?us-ascii?Q?WFnI6CwfjEa0oVj6o7s/Ksi5d1t/YX45PfwTogAzGR5f4quvj0jT30ATGVcd?=
 =?us-ascii?Q?mJEJtAV7TOadhf7pXSQSOt1bRT4CST9YgUuFIqHNOoZey3Mq2ZDWaiOqURIk?=
 =?us-ascii?Q?1FGjHqwhginwBjQBMwCdZ2ZS8ctegEcacyKxPrkYWljqnBxFaHIK9Qqg9ya/?=
 =?us-ascii?Q?UHHEBsDtujvr/pb4VwaPtZdN0LEguBlc/wnNioSIxXRWyLC5ycJpYP6Y0Adr?=
 =?us-ascii?Q?pLIdLKJFWrIyZ1Ut5HC/ofqrmEXVySYBX9hflpkZxtrqadrPeQBoy+i8a1sw?=
 =?us-ascii?Q?7lXinbz5kleMaIz/lBpJ/8CgczE12Po/HfEg8ZTG1X7TdIt4filuM4ShOyDb?=
 =?us-ascii?Q?7WtKYpAs3goc5ORfQrZVYCkRablotbpaj+FDw+21gONfCmWtmjeT9h2xMCd2?=
 =?us-ascii?Q?7uAYpe3GMUVFyM5PlSffs5+iEwd/t76kmptoxw409itcm1ayCRdjMALSj4gX?=
 =?us-ascii?Q?fr9Fu3MAlqQB2vsVuJrhjREpTCfPKQsyk+xIznFl4R0XAfdCjLCZI9jBalHm?=
 =?us-ascii?Q?Tj8XDUFqVhE7Aqc/EdlOdrmHRSrVwKT+PWDQO/7islus4Rg6+YQqwdjOfegx?=
 =?us-ascii?Q?QkVQFoxYnEOfvwnWZEGpjlq5VxHAn/Wh0YJLCUyBMFvdnWXOC2qmINYgEYIZ?=
 =?us-ascii?Q?hzp48CuoReNUw2W9xo1uNfc3DGIaosxJD/ezHCd9THxRz4xqpOXrGeXSoGwX?=
 =?us-ascii?Q?qPUzCg5apr3meGhWX5fud89737vJAft+5pnoFzZfXW7bPTLlZWMubt8UrpVL?=
 =?us-ascii?Q?IfvL/xni993j95R/yhAK2kb16eVXDyDipwbqEBVjx8ioIWHN0Xj51+xud6qQ?=
 =?us-ascii?Q?FAgg+0hTHhbQ3CpbdxQ/LZJ0d8nmToKt3pDm7LxQgY39BOemv+uayTlk1/dz?=
 =?us-ascii?Q?tSUiC+ma9j/J1OgnhXnQ+8Vq+nxmyJ4ItVwdRRYvWjXcABz3SvDy1iFBuKe4?=
 =?us-ascii?Q?KCbpWorU34MUcqCJrxY9Ye0qUv1LBRIxnDIik0S6CIpzPYus2LTbNCDxBkP1?=
 =?us-ascii?Q?03OFaTYxoSWXHcbO0ZWhat1OoJ5S+/HyLWOA+9yfIotUdiwb9ZrTsu65BO0a?=
 =?us-ascii?Q?HI45zb+C4Xr+TY4RMOXHFpwCTG5WTJ97uGQdXvq9pzqVgioYKT4yL2UEDSSJ?=
 =?us-ascii?Q?4lUYYUGMP2HJeYKevT/gcCnd0J8TCIIa4YkImDvB99j/VBHOKITIfIVQOCPf?=
 =?us-ascii?Q?ROxws1cnE/rIsmUmRLLhPMJtNz0qqMl1pogPRZyaIg8mA9hv2H6ZA3TqQLvC?=
 =?us-ascii?Q?GhMZFVsiv9qx9VK0+xemTVp/HMAe2AZ1gy7Be0s2YiHWK0ya4kTQQ8yoCbSt?=
 =?us-ascii?Q?omQ/c/3QT1y3YE5uVafR801NChEJeckUErJrhxh7qgfQVYWYkUkJ/4GpIL0X?=
 =?us-ascii?Q?EUX21xLtqaXga2Yc07P6kU9bFu+uNFiuMds87hDF/VBETH1WyHTIw5epf7mM?=
 =?us-ascii?Q?9/bekLuIH7ukctvK1Kb0iis=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4f8723-e008-46c9-9dbb-08da8068bc97
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:15.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2qKUBnGxVUvL1rWzkFesNEP0A4y748le2eLmA5+PqlEt96knQPcEUz8APYutTEk4Ui8MV0cnFW4jyhdvibvD5CJZ5boE6srUd6/Wa0Xwig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the image with a pattern and write another pattern
in the second cluster. Corrupt the image and check if the pattern
changes. Repair the image and check the patterns on guest
and host sides.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 31 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 31 +++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
index a793b8c2fe..64d9f9c273 100755
--- a/tests/qemu-iotests/tests/parallels-checks
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -98,6 +98,37 @@ echo "file size: $file_size"
 echo "== check last cluster =="
 { $QEMU_IO -c "read -P 0x11 $LAST_CLUSTER_OFF $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
+# Clear image
+_make_test_img $SIZE
+
+echo "== TEST DUPLICATION CHECK =="
+
+echo "== write pattern to whole image =="
+{ $QEMU_IO -c "write -P 0x11 0 $SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== write another pattern to second cluster =="
+{ $QEMU_IO -c "write -P 0x55 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== check second cluster =="
+{ $QEMU_IO -c "read -P 0x55 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== corrupt image =="
+poke_file "$TEST_IMG" "$(($BAT_OFFSET + 4))" "\x01\x00\x00\x00"
+
+echo "== check second cluster =="
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== repair image =="
+_check_test_img -r all
+
+echo "== check second cluster =="
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== check first cluster on host =="
+printf "content: 0x%02x\n" `peek_file_le $TEST_IMG $(($CLUSTER_SIZE)) 1`
+
+echo "== check second cluster on host =="
+printf "content: 0x%02x\n" `peek_file_le $TEST_IMG $(($CLUSTER_SIZE)) 1`
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
index fa0fca953e..725420875a 100644
--- a/tests/qemu-iotests/tests/parallels-checks.out
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -41,4 +41,35 @@ file size: 2097152
 == check last cluster ==
 read 1048576/1048576 bytes at offset 3145728
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+== TEST DUPLICATION CHECK ==
+== write pattern to whole image ==
+wrote 4194304/4194304 bytes at offset 0
+4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== write another pattern to second cluster ==
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== check second cluster ==
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== corrupt image ==
+== check second cluster ==
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== repair image ==
+Repairing duplicate offset in BAT entry 1
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+== check second cluster ==
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== check first cluster on host ==
+content: 0x11
+== check second cluster on host ==
+content: 0x11
 *** done
-- 
2.34.1


