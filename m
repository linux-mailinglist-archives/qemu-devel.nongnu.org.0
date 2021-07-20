Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CC3CF943
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:58:29 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oOK-0007BC-TZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o69-0003dt-7H; Tue, 20 Jul 2021 07:39:41 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o67-0007CC-Iw; Tue, 20 Jul 2021 07:39:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XP9vsBUYxWgwrhjiRu/0qD6sUWO10g/dwsUDhdjtg4V2pJN9Z+erYFMKuTYkBOXLhSyiR5U4eNFJEwB2eBR8W9w0H3Yu8X12mzKXb1GLn/fP/Dbek0dEXWsMTgDiKpco1aM6EO2L07cOlnfxYaz0VWhHxiPKAHxvWgl/WuQonzByfBX+pXC7oIvzlyEqBjF5b4rjrvtPG3nqoStWETN8LtgKxMnd87450kWzVR5lj+gn/doSr52L42fzJrf1U6j2Va8FxoWs0gHoi4sI0A0rhae/q6rgebzitimcUOJ9755DZ0+viZ2Mb79Sxsp6R7b5Ts1Gr0xgxNuj8fKSba5m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxKaLB/XgD+NXm2hC62O/cmA6Y+0xQ9MU6xjOOr886U=;
 b=j28wwHGps2/nWdBVcWPwZ0FtWr9V03ahRUm0+lqvVCeWAhGRq33ynRFMaw+L3mFnmaTIHzT0Bx0NMlLlhE2glSB28mEieQqf73B2qe1z+7VVlona3BbwJjiYepBF6vsj5fyZeB3+Z01XYL3fIn97m+IwTZa8O9dOPXfaSi79SaMkCPRtMc8dc5/W96fvzJYkuIiqxN4n1qF5EIHv1h3VotMX5C3Ed7rt26eMUWubji/YerCaOa+jU6pi1vO1fqTHhnqiGwhNUwQdcX9iuLFMck4vi2nlD5mOpxnnCuMS/Lc/NldWr8BRiP2bRObpHgVZH98MFY++4anb/xG1nHRrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxKaLB/XgD+NXm2hC62O/cmA6Y+0xQ9MU6xjOOr886U=;
 b=Sp6uj5LxIWbtKyR8pGxIopqfHuwiVCNvyvuzPg12+ivb96gHA39s8WV2L25EBvC6d6F080CBLSEHN0YiiF7202kxZayYpDvMvISYM1jADN4PEqscF+H0QkwxFZEoU2GSQdIywFpK3wWgitNbuk0nAy3beBRh4SxTWI0wxfbDLIo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 16/17] iotest 214: explicit compression type
Date: Tue, 20 Jul 2021 14:38:31 +0300
Message-Id: <20210720113832.586428-17-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bf5cd6-1dcb-4d31-92f8-08d94b72ff86
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119FEA63070A828EB9D9A13C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQIw8mVbF8crGhz2EXGEYVdVWNjsRrakdO5ohZqvgp+SpB1cYDx6X97hTx8inoUeigs0GM6klxD0ReeQLfdQgGEn9W8db0HYvz0bz+jp1Aie0eBG1mLduAyZzHZVaUAo8BMTbjg5WP1VnSz5e505Y9xWpkYPu/uvQbUSCa7bH7E5M8e0uZcq431oSzyxuzRvmrBXx4XliYKQzPTcnu9CR9l20iETqapoiBcl08PILblbh+JBQlNSNxttwRiw0lqhNBPooTOmH40c13ErgqX9xCPsFd3tOgMnIPAfqleTNedI7ksaNR5u0DwkeTySkn8XKmfMML6KqiqYm8Sd72iIWq2jhPGacRVkyACdplQXiANIXRxPJeSDVM0zjkecAyYrNNjC6cOUcbOG7nyuwUj8AyP0147SO0n/K468OvyLaVCZA4Pwsic13j4HzHFvh3mUdyiby+57wP+qTbc73NToBw/SXU/3KjPtFqnKmyPhT0I23HSoejp0UhF462TJ3h6kb81ibqEYmccq5TDdun1OiXyrB6eoH8K7oK1iNCUXjgoImJS/4RXL3KRynEQwtaTYtKpg7rBoM/9sabTyel7W8KnvjCGI0ypGdm/6O+dpHQFH3nopvgugB+S9/AxLL5lA+gPkiWzSGJdNZVI5shYiTQGxYCwQMgwaUzD85/X5MwkOdrblnV20EP4h8D5HzMCG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(4744005)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L1he8FTPklCqFuxbqmGS5RXd+I7YTNgRPayeozXzfQ96rpFzRCkkDHXBAaFD?=
 =?us-ascii?Q?x8qCJGwyV35xAN5ITw41yhQ/mFLj6KC59lSaAmIyK6uz5LhY6c/t9C35/I5j?=
 =?us-ascii?Q?0FrhYxWU5LN4Unr+IKE/T2uiG3z+gLhcUx2DMFP5SYb6RA2zRGcLw0ptReNT?=
 =?us-ascii?Q?hIuZASiAYrr9S1lPwEGjp0AAmb3ziGdBOie93dS1JrFrO7xCiDnonY/56wrh?=
 =?us-ascii?Q?4rFB5TXtSsOfet18axxfHnDdmzGNx/yLxjWJodq9kGWSX5qUPcrBwL4DMk8C?=
 =?us-ascii?Q?6mWVKKoe5S/ABpy1bWUm1sBMSaIVYxhrLULzrHmV0dT7LakVLQprPPrFb5xN?=
 =?us-ascii?Q?spa91ilBaYYMdLKevumFzCpEUFAPC8DwQUJ0yCJz7zkEumcHbrE6pyuCeAMT?=
 =?us-ascii?Q?hZ8BUw4UgZ2JRth8JF5Ypmz6wihL2pp5o5ic0WWurQF+Cgwbb1CZiHYOynD7?=
 =?us-ascii?Q?+QfL3vMZ4chNO6I2NyC+SoqGS5rrwaiHVDz4MEuTzSDUpQdtBVLm08aBqafP?=
 =?us-ascii?Q?seJJkadU0HKqsu41qEvbBYyczLkGOnY99z6pKp5n6vBDVoVrJgoX1FR58lOe?=
 =?us-ascii?Q?WfMLe7M/fiqNG1BS11OLFM0dUk/C8rl74ASZm++x8Sez3M0OCVUxcGrR/Hb7?=
 =?us-ascii?Q?bjDiFByE2F51n0mqRTqkNBL8af1CI8uUppPc7IH6hFI4iyV+ga2u6jbSuAbt?=
 =?us-ascii?Q?5NvHZniGauCeG/t2dgqjDH7kYUe3v0jjRzI8qUwdLWnvEpRHNtbJ3udSDbIg?=
 =?us-ascii?Q?RkHA4GtbeJLTfN7hfc19pKzEhZPCvJJT96mB2TnCkCcoelnQthTFklOwCKME?=
 =?us-ascii?Q?61cLBu2S68giMZv5T7pDSDXl2+mxy6LE4zrNJSi/lhsBDP9gyO/9Qt7B8OWx?=
 =?us-ascii?Q?qECpakQqwazpbeLKDd+ctW2xbVCc5GvEQDb30mADvurd2BTTqtPBND/xIREX?=
 =?us-ascii?Q?L08iMfMvHgeYEAvPmCaU59pvyq2E3CmmKQGQh0B2a8CqTBYlBJQGXm7ixEw3?=
 =?us-ascii?Q?BO5NSJTQFfVc7vGjIwhX4WDyyLIMiEb1B/0fWGCdd9TYCbO4ZG/vKAhD2MtN?=
 =?us-ascii?Q?ZWJPBlg0XArcFYgHqHxU7WaV5ac4t5hcD8Qyp+nA5bxwoyecQXGaljZ8vJ6W?=
 =?us-ascii?Q?n7DK7QOo6TcaMhPa06Jc7mswPNRWNp/Rd3CbHMny8z1fPDYjS/qI5OdJpP3k?=
 =?us-ascii?Q?ovSaICH+nVhxsyegI+nCD2PikE4Sevc91jITm1NnvpKq2JYz21V7vKMgOptY?=
 =?us-ascii?Q?q2s3M26WkgyUqxV3Vpy0q6vD1lkWPubRqU8pCEwM9VbnToEaPImWwEEDGCNj?=
 =?us-ascii?Q?wkFVIjIyYEMAa8/57CeGwmTF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bf5cd6-1dcb-4d31-92f8-08d94b72ff86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:13.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3qSzGGLsrHb/QUUyTnIlv6Z97SMfpSTxVxu8ZTGj9+JFyXrG3TEZwp3pYBYVn0JI+H6VG/TZBCxz9OplHKufHRjM3/NTFkRtSFIkIdwxL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
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

The test-case "Corrupted size field in compressed cluster descriptor"
heavily depends on zlib compression type. So, make it explicit. This
way test passes with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/214 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..c66e246ba2 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -51,7 +51,7 @@ echo
 # The L2 entries of the two compressed clusters are located at
 # 0x800000 and 0x800008, their original values are 0x4008000000a00000
 # and 0x4008000000a00802 (5 sectors for compressed data each).
-_make_test_img 8M -o cluster_size=2M
+_make_test_img 8M -o cluster_size=2M,compression_type=zlib
 $QEMU_IO -c "write -c -P 0x11 0 2M" -c "write -c -P 0x11 2M 2M" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 
-- 
2.29.2


