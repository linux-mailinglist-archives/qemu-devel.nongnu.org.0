Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FD47E645
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:17:36 +0100 (CET)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qmd-0003hz-JZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QY0-0005z0-8E; Thu, 23 Dec 2021 11:02:28 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXy-0005Js-HG; Thu, 23 Dec 2021 11:02:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJ78YIbQr/xi/RZaL2NHOUXZtSlVsR2XJsHVWz93+VV90XbngRz1Mib1IK2tcUFGwIZO5Sd/ZimYQARyE3DUg/w9FNH5jvMdyGosyBG+odE8E7Oq0De3GA77iH1+Qu6bGosP4uZgFiJZzxEbx0toyzNIyXPWiZ24Lkg7DaiYsebZp+EQEpiJiqu/63RWGrAfwyJhAgdn6uTjOnEGI++jtu6oAi3rPt4ctPCS70MtsQmZpfUurCl3inqCm/JiqA574emKKInSmsU6mOY+3LpEUjMBXuThn26h4EHtSMGHMaSQzOzl9xPUF0fI1w/rsydPJugxlWYhJlFYtXo1KyvAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RU88eMYqH5FMqCplfNXc+E/GqCiMwnkaRc630GvQCs=;
 b=ikW4INPSgiLykYBdrIl5HOaEL3A6XbFB8scKgTlXEqrRPvpoTikUgIxG4d7t8PcUN+RM5hzmBPXn2OatQHg6EamJX8zRp2sPeSMBqFqI+G9+BOXQDBhhYYLmEIBpZ1S+sfkNcKevOchIfe01kMc5knT7Pi3rHg6WZRxBAd3VDdDP8Q7uzx5ryvw5EV6BOD9AdtnmXDm9Qdr8O1qaasHRDgAL8f9sCzquOhci2q2b6C0NqTnSutk/4vY5WS4xLLTENg8rG8gnr2h4RHx3OUyKL6HfWirrSBVaqXRnILnhZO9G44Sbce6RerW/uUC+5Ur2S8gSctSlMHvEYerVgdsw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RU88eMYqH5FMqCplfNXc+E/GqCiMwnkaRc630GvQCs=;
 b=jvcKlrdrQkW/emBxXnLU8HJRJrneUmUd79cnGFkAtizBvOTVQzoEiNByq8hBkg34vngqmY23nsz+8R1JFSu+dVvRdFgnNNLZuy9fKiVdwYbAeQgxgF2hwN+QV0egEthSfojQNo8TDfjjlcUDZYlLkfYgbHnJzTNUpUGwvnPZGhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 17/19] iotests 60: more accurate set dirty bit in qcow2
 header
Date: Thu, 23 Dec 2021 17:01:42 +0100
Message-Id: <20211223160144.1097696-18-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: d987bfa7-5758-4694-93ea-08d9c62d8e32
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148F2121E89055D0ADED3B5C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUjjLBRC8dQbojEwXZmsj0Af119b9OxG6mxvT+gpx7h/fRK/msHrpqUIaomNN+Bv+GKtJi+Y7bKb1jbRLuj5ivhEzskvpAvj+a92jMVj+prtRiCswKCNEgHMktO2WTTJpWK+/fS6vdrOZBWmo6g39qqWmfiT8TyxPqj1nQUACxqfY/ner+pBzwYeDQ6+5g6vc7WcFIk1Vrqp0XZUJkbI3yIPzkZwQm4ih7oMmsgTnTxJ4+JDFQKwg/XPozhDX7UPEJyfFH1dYQ0Z0xC2/oLCW/73N9rJ4nk+9hWAMa/mPnhAaPvy5jM2PIsCUfgEncQFdKrwA5kvVL7AF+xuq5diRzpom23MXEpQ6AGy2oFbCsIcvPwkzkJXqga3vu3fvjTKkzTKfhCjbmrNm8EMIjEBA97cSdCykCJYQYvuyOOoSaJKX5AFnXfh9iy2mebPPNIlPh5TnnjAMI/uA+kcp6uRlnpwaG2Uqg0kXKhva6ayh2RmmtzW+LFx4Ry9nz4SFuCfBGXl9Vw4sJq/3BLArgGcsnLI1m3QqpC1ure7OcJKjvNd34RClWp/Wq3n7fmaEziOYeEdja8Bb1IIc/ElLETmWA/Jx5D83M/+Jx3jDNlvLwnlXpTHjZ3EiHmYgx4PnIhND4yHL05lEDpdBSOHwD3/lC8/ulCD4qrHM8+K1xfSSOxzn/9k2n1NWpx9O8hXaASqHdrclE9mdrSFEVDpSAJzKdRnvt4H3FgdgxXFIi+4AXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(4744005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZ0rNEAW8Evm6kzwUQl3JKEeeftWAyouM5PH4lLvA5OUfZbYGPE1HZwsc6F0?=
 =?us-ascii?Q?Fddzdj5esEwzrg07J0ylPN43jwfqG2oHB8/3T4u4gvBnuRh4BRvi23j8IUnO?=
 =?us-ascii?Q?LV/F+9zEffNyWQxn6y60yN9ikGYjCTGABjGSDLBDygGaofbiVlP3JjsQJYJc?=
 =?us-ascii?Q?A6tzFStBbbqiOegZUznRY+9nf8tf9Eyvz9opik9nz0dm/wU/iXGR4HN/VMGa?=
 =?us-ascii?Q?kH3ES1sRkviQ0pS8QRoGVejb+RZAlgiXgOU+KImOiBLKymDhZWz1/Nzjekr5?=
 =?us-ascii?Q?hCGvizAtC3fm9+ywEDYv2dvXUO4UV89Cn6kT4fEcXOkLxMg/Q4RHcTUbQWBS?=
 =?us-ascii?Q?SWzdirKtJOGurPxvdaf5kSifjNIs3gJgBUiBr0W3HjcQqEf/sYk4vwKpTKep?=
 =?us-ascii?Q?A5EE0oS+CiLulIgEK73/Z2mOVn8QvF9VNzqngAt6Rl5wTA6FSUDEjGtOCg7p?=
 =?us-ascii?Q?e6OulCbu6UXVcngoKY6m+wUDpKgVmXoEEgZcPCfB4lOyODw+W+a0PfSU5i+F?=
 =?us-ascii?Q?3pjmj+2A41o/zDPPmoUYzrVejXNc3C7klc9exPuZuF9fnsK5Pl9T1vs26gwE?=
 =?us-ascii?Q?lRFeABB6JipTEFyNyDaaih0t2+8HsjubStRgFGtW6oY78Rt9+wRFU8VMULJR?=
 =?us-ascii?Q?uZEZyB0BS8upwe8EgVaG3ogQscN/m3RSTcX1z8HfDJAR9wAm4V3ofgvepStP?=
 =?us-ascii?Q?6WVpWQzrCNNfIpaEUeAp6muLqI+wp9LO1PqE5L995L26qhmwGQyx5emewVLW?=
 =?us-ascii?Q?Y/yos8PpTIAs8jVEQqe7UUCEdAB7JR2FabCnbTG1KHmb7xBbtAEj2f5hyM3S?=
 =?us-ascii?Q?g9r068hyzG5PWL7wSzEhn5N7ucjdei7QUe9HSAWsaSnXWlCfed2bbXPYnS1O?=
 =?us-ascii?Q?fBJ7EKiod+lpep3eJpkNPd1EIKiPnXO7M5416u8zhvzgn+zQzGiJWUcoyLgY?=
 =?us-ascii?Q?WtlKenUxwrqOtgSar1WnAGk6EYMDn0O78sNqn5NcT1Fluna8prxMNc4/Glj7?=
 =?us-ascii?Q?hH80DVw1PFjM+SBvYVGUCnsjd7ExzMw4p/zzwMW4Q1O42xg7zzab8rhFTSpG?=
 =?us-ascii?Q?z2/8AZrXFPlcjYu2U7cucHur09MYAoOggAUviEz6pEELkhuEqYbxKbRu4fxM?=
 =?us-ascii?Q?5ybipoXj9wrUzBWnCzx6d/ys3JgHfAIU8pfvfJQv524q6hqVN1sLsSitGFSE?=
 =?us-ascii?Q?7+i7Y3giHW3zZx6VLol68mOwwkvH1VHZ+Hd8hmYUD1r1+u710xvHXVWQI66J?=
 =?us-ascii?Q?gnFIBZXAcg+ren0rF+3JW4HwL6T6U2xYrJuQtHDsTYiFwcB7BriZ9r7tOev1?=
 =?us-ascii?Q?rAR+1DoyeDGkqja1aaGYbl5THM1sWRqKzJAc44ZJWktB6qYva8L2jRuCNlhw?=
 =?us-ascii?Q?TWnbD0crGFgcvhGtD2EMoj07yQwud/y8pUv/I326aC42I4cHHTL698ROHT7X?=
 =?us-ascii?Q?ImRS8uewTfwNW8Y8R0In8dFix1A0dOAG9lpYeaxojNpHcMCRw9xPjJRDjFgf?=
 =?us-ascii?Q?zySML7r6BS95Bz6taAZGZPWkUajujDTBIGeJXkYgTsWE+3yZ3j+RCqmzvokG?=
 =?us-ascii?Q?B63TDGfmkEwx7VAq9cXM5RHp3FKr62zOn1oh62K7eASwIXLZwokaN5NOdt/f?=
 =?us-ascii?Q?VfXyWQDFyaJBIp0Kkre7ycZtwgIJzrBTJ/rFbcXhkHA2avdSK3hbGt/meecr?=
 =?us-ascii?Q?4d5bzgZvswrkkBWL1QV4+fto0wo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d987bfa7-5758-4694-93ea-08d9c62d8e32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:01.2705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzb30PBrwP/ho8xdvwOSBrcYcyeAu041w09+S9RmStBRiGqf8v1qgmYxu4KG+cF1bnKfmKAMScDVvdu0xY/RiVmlvEdudZdMeky1Luq2Oto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
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

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.31.1


