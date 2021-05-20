Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A130E38B1AA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:25:19 +0200 (CEST)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjby-0008VT-Jz
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZL-0005HP-Hn; Thu, 20 May 2021 10:22:35 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:23648 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZE-0005Yx-QT; Thu, 20 May 2021 10:22:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuRP1VU8ZAks+CWir1UpyKbxDKCp6ic9yBqrJLcruE9bI44QkD+sD9Vo23GJVdFJ/6Bd0wilsKIhkOPtibp4NfQqBY/9fVLFbeT0J9gA5xi0tS76jV4BcO/NHstlB5o2sxn3FC35jw6jSNt6P133dOfPbUBAfo1XIiJc94taA79+77uru5VwKUliJzypH6go0768YVkq76ZSwMQvJFLRsvMj3P4wONk5n05jxPy+wygC2d44VdrFweQdl/lKiuzI00CC43hVkZwERUKQIhkvmNawTLtn5blXENNhMgj7RpwZ7v8qnVgdlS280/svNN4DW6DtPl4YHB4P+fm1HhnGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsKTYdUhfz5aXAPxnR4e3EH6X9KCoJ/fdrQ6tP9RJ7A=;
 b=lTJUiRgXxDv62+Z58bPcsmmGCMSP7IrUDYElHqbgYeKjjci3IJNgYw+B2iU2tZPkKG0lhU0CuKwOJfRGrLEWuyP1ieUEwsqCKrWmQDQ4RzIc+Ioh+2vUJQgBx0jaTBqRJ4eI5FM8yqYj4GkE7xBtfElpjicp3WPcLcJcpnnc4OTGXOeoJ0q9ZN7Wiu9ALfyYng4CcsTPy7+XesKbsV2M7ATeD7HON73Dd83UltU0cb7eisdV870I7qmNOrRjJKRBhz4GgYJiQDRlxH+Q+BqFvLqBokPp0l0p0VJ1LsedxYNpsoPHoKsX8eyLX9EkVsVXoT2BPaCOqhfhRyIiqfyDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsKTYdUhfz5aXAPxnR4e3EH6X9KCoJ/fdrQ6tP9RJ7A=;
 b=Phkrc8MxpGOW8goGuyEB7cUfBV2hHC0cPDVZ1nsDh2HSWp3delebNT6DsmV2eBgdaDdjkxRtWvwXIGsChAMMVfezxIwG2ERtpA5PbOwx5tqQtgNiG20al+F52Auuji8ngqsJlX9oCoPC1I2u2+0KB6bUnk5Vc3hKoMqknBNcpk8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 02/33] block: comment graph-modifying function not updating
 permissions
Date: Thu, 20 May 2021 17:21:34 +0300
Message-Id: <20210520142205.607501-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a64a62c6-787d-436b-79fc-08d91b9ab0a5
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009200F8DD4D0D017E8E0BAC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eENwWCQ9De7PxNM5rW40qtOhILOMROsejpTN7ObHkl8/PfANqKgx5k8ECyZ40e0I824B4JxhBW7ktgTFgZZo1ChksPzuiPvGfbrRcgueTwynI5bQgLuE7nEpjBQN1tEBJiSkrT5Fgxf6ynhSUi2YdhrwLGp8H0LtcjFd2YryIK4VwAp3SydqE356InibspqTFScwrndFpLmvuZe/FHtWSQua2Rkb6vbfG1dWuUBRDbUQnkbRnvoarCg3fp54Q7k4Z1cSzYgkgDqQwfnTHl18sTv0xBAkJLx/jHz+pgS9C3cl6ePpaNXlxT8XlLISWmIV5DzxEZ/CaEE76o3XcToK6P2WVJU+7qlw3L7ewl8VlxGaqiL242MNUnTlpLQjV2ciJ9plOe4Txdhpw0bOXoCUQcUDFe48Uc8DOSV2+TqI1WNVeBTPWukxe8AeYhKEsu+6YAPIbwWOzVbfw6+CVORKdBHLcqEVIBmOOT3Fwg0DN3V2Ta7MGw3/iUsar3Bgk84Oqprl0+JzoOyO0GDbnQHy8s4v1l0LxWmbF6rUdSFdLi6FTU4ZD9OhBgIvU2v5KvIDIca2RqfUxsBle7KmXOOeyGgBtI2h7hQQNtkMOpv3mAMWDzd6Ra+CCpB1Gu0hV+tu0+nekSacRPnEbvU63glBhkY9n5OHsUst79quQVvlbwOoNmtK7bKdIlXGsUPGo9b6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oeA6Ix8vCtOSsLWonKw+hyg9EQ6Rh2GUtxVxHOWpaSbOUv+KALVVMzhV3Yqj?=
 =?us-ascii?Q?BMoB3zHM6/PIeAjdDoPinajLjfjZXwdCUac8qUc4SqQpwDBcbRn31yLIQlma?=
 =?us-ascii?Q?vuMeaBKxXNb1VpduW/ocTWc4zTZGTcRWYAXqBQDZA0eC9fhD1d1+u5fdZ9Yu?=
 =?us-ascii?Q?2jZ4JOvcsjCMhD5xNjDJ5/YiMOMM0dsEhaSoRiRsxa3VvXz+Vid6QJEjd5Ar?=
 =?us-ascii?Q?p03eb1Q2Ilh/M3Jw/GWhb5BVDo0Aqu+FqnDBU64iEicj5d2/jjPubqsusA22?=
 =?us-ascii?Q?Ri2uc+HBYUDoXpWFv0kRqcAdC1ZrjYCgLQ51uNVWCgvXoTApltWW3TKJLMRh?=
 =?us-ascii?Q?97N6oEhLSZigDNw1CaCzkGEYjz0S3YK8pKXdiBlXFtzZ62AtIwNokLZjNs98?=
 =?us-ascii?Q?La2pAo/hWYGNqIAhaTRIX5hal5kVKWiIbX9kZq1JP8KMO9xg7pjnqVbhdbwz?=
 =?us-ascii?Q?vxwswGOMJGcr1+W1H/a8AHrHShE6mXOry95BYLagGSAEX8wkwMBWeiXol3NY?=
 =?us-ascii?Q?/XG9yMr7TJLQV1H7vDiQvAx3LWNIocIXplzH2ZzkUmeEPVEUU38ziBTttDgQ?=
 =?us-ascii?Q?z4bP5NEvkvhp/kJKmr3Ls28HB06F8i4x+hxOcN4FzwqS7HaDFfM3pLg66J7H?=
 =?us-ascii?Q?/iZ+iHybi90VzJmwCAAjy3IpUWNct9Mi5zBoIubXW2at/6cY1KOnNeSrLKkJ?=
 =?us-ascii?Q?nvqtEuvkC/APKoH1l2SfvlmGA97LDK71un+USzlrOdRfIupFyVmSuo4y3o5m?=
 =?us-ascii?Q?n9LKRegdSOKNKkDvDdpVi/SE6pSZYsM0IVzYNjReg5/j/qYcHe4CQ/yY9IGf?=
 =?us-ascii?Q?3Wzi8tS078EU5+uE/PwSW7gwqoyHnsqv2+AHl/4/L5RM5P8s3y2yG54dwcFN?=
 =?us-ascii?Q?2ewGHz98nyR/66dRzlr4xmRKFYr9vUz03BNoLgQzZBw9tFXqeOCLRU01IUty?=
 =?us-ascii?Q?JR+VIn3Ik3ixiIqrfkNrX+kSkK0nQXreAbibalXaLiscSx79L21FYQhCcEZj?=
 =?us-ascii?Q?s3H3lvIOnyems6kcTMSdBWfVrhfms75SF/dVc4plSj5TExSAzmC6145gBLiY?=
 =?us-ascii?Q?W+GqXdg7W4ZeulM6UKBNpW5Py155sDPCAyrZDfDHZvMvH3BYRNfED8SiGXA/?=
 =?us-ascii?Q?l8Vy5fAxVy4IxIWbwFT/YRWUDb8Rv4BkgnFxTku6kMVosRBsd3JQoTxFXyJb?=
 =?us-ascii?Q?uBqB2Vx29z7EkTmhORWxWHPDUst9/PEscMERjS0nxo/u2ywP5u/B/6W/SJgv?=
 =?us-ascii?Q?EpD5OL2OhfpRsgc4AxYjg/oWW3cFhhysQsralpNymXfrGV3+JNPdEcCFy9WO?=
 =?us-ascii?Q?DrXylNwqTpx2YHhEfJb6ALsW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a62c6-787d-436b-79fc-08d91b9ab0a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:25.3289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFMcsEmmJccpRaOtrBVojcTwJD0lPMOkbC5PZ1Nhmz66dtwFFtUwwrdHJJbnMM6C4oapc5E4j93z5c5xM3i+JG3HKvvyCFVBbyIyv23zLbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block.c b/block.c
index 384413c578..8aabfb03ec 100644
--- a/block.c
+++ b/block.c
@@ -2762,6 +2762,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2836,6 +2838,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/* Function doesn't update permissions, caller is responsible for this. */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
@@ -3097,6 +3100,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
@@ -4775,6 +4780,8 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * A function to remove backing-chain child of @bs if exists: cow child for
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
-- 
2.29.2


