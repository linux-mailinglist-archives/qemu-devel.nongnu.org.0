Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E66EE228
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI4H-000156-EE; Tue, 25 Apr 2023 08:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI4A-00014U-RM; Tue, 25 Apr 2023 08:46:42 -0400
Received: from mail-he1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70e]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI48-0000dV-RX; Tue, 25 Apr 2023 08:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSUYyKzhla3kcUg5W+8t3mY+0LIplAOE883hM3904gkWZ+t755LKlGhqQpxpLgEKW2N71imtUmDiHatdK72E0ir2c/bEbXGe47gTPY016mZrc/sfjr0+YRbN7ZZzFRNzqRdytR6d40ZR8L5bYY0Xy/P4zTMEvtZyX528yi5nHfCCrX5ARNwxxBL3U8gMBGHqnilXB+1qASP3I0hK0sr4Cknn0WSozcZQ/oYk7sEX1Vi/ofb+L8Xw24ET94VYCkCvG5uUZrXuySVFI5Ghb9NRAguZj5GhoMXA/L1fvlUDbW447FvuzMMRjVs9FUOGvJDpCLpedlE2MbE+rsHsufV63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C+biTLzNtKfdPkwSBMIbxNZ+DoYLugwnx4JnH826dQ=;
 b=Jb5ai8FKBO4DDIJ8dt8vBxRZ7ZAzYjKnseQaqPdW9FYPTDxAD79PskwCBZKfhU3pOi6HRgOKu7heiN5Bp4BK7/f4YpTXQhaxplZEvs29n7GGaMjP8tPzPIOXBIIJQNso4DBb1libvo0kL6+OnGSDFMGypcBOEFwec2Kh7svZec/bHgVl/8NFRGJg2tGutlprnx6r7Ukne5oxFrJdWKr4upRaqWGN2uW57xsEY/jmHNt13oW06X42SXrcX8OByQXEE1ZUwGIyOJFUl0Fe41Bf9fBZOuutSnUJn0i1jBYFhBycPiML3QG1FoSg7coodNnDk6XbdNpOJRD7h6azkJi7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C+biTLzNtKfdPkwSBMIbxNZ+DoYLugwnx4JnH826dQ=;
 b=W+8gCCaQH0PDQYs7xFEizQUxfaClf21ASPqakt9pliXcKM46oSB3mokILp8mPpRfGAM1RaHPVuqvWAg++xDPfEQKOkIcAtNHoMv5QiGY9icw+rcweTEX9o+d4NDs2TLoxPzKSy4cjNYxlJPLBLzR2RZ/vpcSucFDlPWgAzW+qA9/9oue/FELVzwNT9lR2uacyqGl6DrrfofXU9JMf8+8NjomtDlF9X18i4so9ZXNGPlnaHSVhcYtK7uCT5BArXJs3x6wHzQSTQxx513ywgD+GTFBhLEIL06jb9W3VtM/QnM2j6ueDNwmSx06vQpv+rfiHyaf9BKx97YTpNWJ1z7VNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 12:46:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 3/6] iotests: Add test for BAT entries duplication check
Date: Tue, 25 Apr 2023 14:46:16 +0200
Message-Id: <20230425124620.241022-4-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 129c4c86-f3bb-4106-d686-08db458b183a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /reR8pFACKrPpm2cl32zW04UgUgZkXM6HkoHsw4XLcViyccKletIi9xNPE+0pifi2raShhw2DTPro3kIwD0qpXVMMhncOI2jlVD9vrc16P6AXsX8dgw6/gWw3YS9U3rO8tmRi2QVMbmy8qnJgLw9yMXxLAVD23MPJ7KvAQxIaQHYamMBiPacwqLcjnPx+x/97V7nu1elsVNI+v3SIcH05s3dW9oKFYxugcYYA7Lzc6nXagTQHmsDUnPoOg2An6ohm7G4X8KFIHIdPrtrLXyJjI7zNmAVifxxo6//TyhRDHW7mYW2WwgA1oWJDDtssZ0Nyb1VNzWAKuSpz+b/0qDq5ZszliZlzBiURp5KNr5i4twqFxVCE39ZNcoOaIr6yNbDQ7J3NqCYb7nRTxIoNW4eeD8sjk/4v+7a3iWa4AN3xHi7F4HgMRKnjBiX34ZRQEv8zxllhyxJtVRl/znhINEdd/eAvFt7mMU0WInr4SboisYjo2K1zMFzhF2CyChd3EqSoHNdcJdUID5a0FiHxLf7UUIwftKoyc6OvdIxoezqAhkICa0GgqHx1sV15xmUNCMNiDldUPTl1BocCFDc2bVrGeu2Gp1WLWQvWPCd0biHYD6nmJqXXZMQjFYRcGjAphWGcm6WIBlnmIhXZw6M/Lgttw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(52116002)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(1076003)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(44832011)(5660300002)(38350700002)(38100700002)(36756003)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4DH1vl8iuo4MVUd9UbDObYg0R8xp/OBBoHiKMKV1zWti+ccIePzFxlTBXbpX?=
 =?us-ascii?Q?d7T3viLSnOWR3fOc85tuRBdIVvLIJkFRETrvleL7SOjKCHnu71tf/fNWa9TZ?=
 =?us-ascii?Q?8C1kn89HtavsN4l7sxeQrZ/Zs1fiVIfxrYo0uUFm4yfrA+hawtiTGXEzYySM?=
 =?us-ascii?Q?UhNL9xwVMCs9TeMvv2tvOdU7V5awSUEYQqx70ip6qLuPaa8HaPflWtMjsBN6?=
 =?us-ascii?Q?RxAVJ5Q/gmAlkHfF/dac2KPWHBJhAYpv96FJNMUyjB6lvz+8u/3jkxo3Sqhs?=
 =?us-ascii?Q?0RRrPkMfPMp6rr9fj5gWdYxvT7LhqFkeUrBI5AxsrPlg2dUSoC7qco65z8JK?=
 =?us-ascii?Q?8jW/vSpljYd6X8T2JVFzffDHFJcSCKw7udZvqO7dC9LPWB11ctDvJvHZ+8BZ?=
 =?us-ascii?Q?93u/aGTc0ahaAQIsxajisStOamlXZp7uG7Q+i7Sc1XsG5PAvP14XW9QocjVu?=
 =?us-ascii?Q?HHjzav+f4mkcH1vaLwWw8Hn1Ga+IUtrqYDSyfNbz0uQp1bdnQT3+KKckOOZW?=
 =?us-ascii?Q?6gTYnEobgXenIvrLrja8Tl4O+DYzmQB4Wzx49HK26oUz6de9HDlQNI8qCfZO?=
 =?us-ascii?Q?3aabyvWtG/+IMB2k8lKdM7d88Y29jCTMkuylj+rsOkLEBUte+43zmXT1Q7/G?=
 =?us-ascii?Q?BwA8/00uG3MJdSPyBoFAP2ffErzIOmcYIXYN/1KE92AFhX7+z5q2x0UE9cJG?=
 =?us-ascii?Q?fflYppI07imv0IkDuNRZ8uEFTraGHux0JBbifjETwRAaIUzg1iddvgDb0Nl1?=
 =?us-ascii?Q?rJ/0XSTSJQtCPX2zYd8AT8XyCZfyKKBelFuYCpKG4i0D5+BxKkDHw6EzBM5I?=
 =?us-ascii?Q?4aTqfm5j5hPEBB7BKDlozdRyyhg2v0iUy+pLPC7XXhb/5VPlXOSEGjhamxFm?=
 =?us-ascii?Q?rGN0Du9SMrshQy85gDtLKYMuYBUqJGpIu7Tt4Nzc/rwKrn9a/zyDNa5NRkEY?=
 =?us-ascii?Q?Ga1Z70tMEPqB/qJiLT2LbUTkr4D+OxspSULiiqyfD/geuSeMt4nNfru8bgzA?=
 =?us-ascii?Q?+dN7hhtgrgP2R2uuKAuJwCROe3zEbUdGPmI+9r46f1787vQRiRQXFhWCMkAI?=
 =?us-ascii?Q?plE6FhSqaPTQJLiMAZ1clJka0EqcVycGK1jbFEPbqyLfi5JyBBEO64xt3Ce5?=
 =?us-ascii?Q?Tk9HvH9ut2/VAhwCCYgaRrFCMikayMMVrRLkEicKOwK6SxhoyfajsPBAqyg+?=
 =?us-ascii?Q?ZqbyXDaAWeThWhO3HGHRGlCu9gqIYojwDz3s5mLTW1xvAfv1hp7OxoBbcmnP?=
 =?us-ascii?Q?+ype9E0U9dZb9OKUt7Hr04wkJntHtBQERh/Cn8ZT6s7POnzXQTwDBQ6NKMVo?=
 =?us-ascii?Q?infVlt90P0L4HGxEJv+rwPMpagBDdSBvPG+pyumwQGeyOzMhyky98ZkHl2t7?=
 =?us-ascii?Q?Xuzil3BRKtzrvusd7bJPrPMuRVqJsIgBQSC0cua8FqgPL2T9zvHf5l4mlajK?=
 =?us-ascii?Q?MAQd4wXbtQDxyV+kPe5ElmQ9r+G9ZN79q/VbH4gAYCqb6SVuYlOQKbobypQ7?=
 =?us-ascii?Q?hUSJEfAMf9P2Nwji7VpBvxqLbGonVbtCzDbsDS77rAOyOzvUbgqu7Wb/IpVI?=
 =?us-ascii?Q?jyb5e/Gfjl3dYDBsGXvFXDQXQibwwBBColhKyth+izrPfOo5OFVfinwcFKly?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129c4c86-f3bb-4106-d686-08db458b183a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:31.3767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcLBsa/4ajLfAS0B6L14K7yYSenym27naxIrV8H8NoaI3iviFHw/4Oj/PhMAZ6vD+UIgeb14UVQ0FWHMZKRstqCHzmZ4ypbTsOo5FvtrV88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9410
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Fill a parallels image with a pattern and write another pattern to the
second cluster. Corrupt the image and check if the pattern changes. Repair
the image and check the patterns on guest and host sides.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 32 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 31 ++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
index 8be282fabe..8a63c3daf4 100755
--- a/tests/qemu-iotests/tests/parallels-checks
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -92,6 +92,38 @@ echo "file size: $file_size"
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
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
index f2cb6dde85..b747bba1f3 100644
--- a/tests/qemu-iotests/tests/parallels-checks.out
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -31,4 +31,35 @@ file size: 2097152
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


