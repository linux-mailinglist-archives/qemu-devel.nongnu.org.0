Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505D2F8D7C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:55:53 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0m3U-00053s-MA
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltF-0003JW-BV; Sat, 16 Jan 2021 08:45:17 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:25243 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltD-0007aO-LE; Sat, 16 Jan 2021 08:45:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STI0ZzwvtkOweZ4HOlCo6YikKUIf+AIhQN2xF+Ce6/CGI7VEdYsCDJI5YTzoUzlTd+hwEcux7IzPFv+6wVIoVAmieh/ENFju1f/Qp8pDVcr86/pZ/aJYtj3SMfKRs9ipbTrCSV+ATZSQjLcyUsUyeVYbVPJ3I+MxkA8HNgZmmfk+i9cLw5lB+03oCe57IZtryfdD9jOOfQ2pdcmOASYH//hvldi248zREEABzGXF0zcamh0M2MoKL7k7sGub6LSGYg6GWF/a741DyIIoC5xxar8wP0tm/rOes6g4EcH6g0/JrqQRw4NVhDc1HYmCdai8YU+7cABnqvPaPcmAiPEAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=YthnjLwiDPTopWkbelTncm4T0v6U1pMdVsQVqBJmKw+147hoiCHM9BaE/zJxo5lPQyhLZxxss/534jBCUlzV0K941mfRsfiqovQMmxnWRwjvNNVqCvLiFRqs7YRyptGFATOEN0JQvfwhwtTmqcUUBzouBq9AzVHiSCP+lKT+hGKZBszQlvBy665GFWu83en3LJj+/0SVDoAX9FCzfpXxVrkAGTQc1tg6/8GCIuebz9ENy0FXJa7oiUeyIt2HVhjKCbVfxKi9HTqpcmEoseD6O8h+jRgcYjB7/605d0dS0S+281B8ML1onwYJAC63U5Dtv9TIrXogXZDC1rjeq/k8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=K553P4yGU9IirwCitODzCXjqekXQ+7RfJgaDleuBNPdcnZkHrTKF/G1l2G9/EKzsTL9lxN+Xapd+TbxlFI6Rjp4J7846KIOuzT/szMVUpXY9rR3Y3+/4RvAioucQ8ylbZdxMDrmtjY462uuFQYvWPOvneMuzB3ZjI1v5MQ9umcI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 13:45:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 11/11] iotests: rename and move 169 and 199 tests
Date: Sat, 16 Jan 2021 16:44:24 +0300
Message-Id: <20210116134424.82867-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 887b734e-17a3-4e2e-def7-08d8ba24f252
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622F770C0027AA6452EBA2EC1A60@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crKOTF91fMFvno7S+oCdapZ9OGbYTWzxHOk73+KsAiUahMgGRwdS57c2z9vEIT5uCabARb+Rya5hLEutK44O0qO2NirLvDC9GeS+meYdcSGNGxFyGCna4V2zuZsvqyv0sEYHnuqS9cpkHV0UFxZPkElQx/9YuPTalqKSvTeNiIk8gEM39t8LZ8ckbUE7OXEeQ12ubOXNXekjAE1Mc9WX1BccWHH15kehNEpUW2Qz4hIkmGGLygCLdgk17JRpFHjmuVQ1oGnEzlMbZ6HwM5/HIOh6tFVa1w9MHx0SQ0FIdISE4FbW3BvRqO+1/5pSJ84RDbhcyuaOxl33QXpoqhanWovCMBwd2Sww5aitLM0nNN4+akOCBjC6WdLzf90VzrRFXt20NGKM8RP8eEjbmOFulA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(366004)(136003)(376002)(6666004)(6512007)(2616005)(6916009)(2906002)(956004)(186003)(66476007)(66556008)(66946007)(26005)(5660300002)(6506007)(1076003)(8676002)(4326008)(86362001)(316002)(478600001)(6486002)(8936002)(83380400001)(52116002)(36756003)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X4sXj2VWaN4NRVXV8uCrbeJDDwX6py7cf/dO/bYOyre2gh7HOhQhjuWuNEqY?=
 =?us-ascii?Q?ul7fYM8PKYKmQcXcJ7Yxdovj9twxDojWDatNqjPuku7VqIgTmdq8OktaTkMv?=
 =?us-ascii?Q?u3/OwL1OVkXvZAQHBMCttTKodxeMUtzcvhYjAgyW5I1XgFEng3Zjm2tJaW7R?=
 =?us-ascii?Q?7u0yDOUVFWV5rrqH/evgV/e/dF9t78LJnv93pb4RZDxIqE3+3nxG/ntiEg0B?=
 =?us-ascii?Q?+A8C6c13oQzKkWMYWiCthBu0KEvw1ysbmQ//DSURLg/g1UvcR+rBuoa5rvCs?=
 =?us-ascii?Q?p5aBvy3WFpUmsQUe625lehGhwWGZFycdQb49ve30seaTxjTpLJ7AH6nEQgHv?=
 =?us-ascii?Q?js/NVDAJQtvZdwuWp4ZxXu27whzlR9HYos90Me1mkNdNUHZuo4MExl36y03Z?=
 =?us-ascii?Q?ew1w6dXAt1c1PR9Jq4UM0gAaxAIE2tKpVERLYj/v5Y4I7N5vZSX1sP/8hfpP?=
 =?us-ascii?Q?qfUIw2/hrRxivAiXyzd8bfZvWd6kGMYfP7U3wDdCiXWzRKtEPyRhRabQ3+YX?=
 =?us-ascii?Q?lI9wZcacsvx+/hwNQ6x3iL5krsOwJFwK7wB1D6FXyMfmxDvR6/rqs24+fWJl?=
 =?us-ascii?Q?tk1cv/PkdBnMsjtBVEn7fCipXdaKEQxq8bbTiszls5qarURPrMxnwc2YhSDZ?=
 =?us-ascii?Q?RXl5FYujSHoFkRfSn7hCBs61rK7IgN6Eld7YMSuCV2sxpV7iBz+zLgkhxSTm?=
 =?us-ascii?Q?Rx3gNJzBP5XNOa0DJPd69xTCHN+u6ZoBDc4U22w24bIAzKIl3Awkq+3UtuX8?=
 =?us-ascii?Q?Qf6RNkCh8L1ia+lCuRpEesEGal9zXpvRkKCf+SR8XgPti0cj+yqa9SnQ69dT?=
 =?us-ascii?Q?EIW5enzf7NO3YR7S6HRsh3q3BzL5CLQRFO85Q8cvW5UsF3BX3l2/VAVG35HY?=
 =?us-ascii?Q?RJyalkAMhtpN0IM34QEUnwpF2piZVSsfnBGRfC6uwboOLEoh124V47ZeD2I5?=
 =?us-ascii?Q?1mOvuYJs25VvaYS2UqeZVefqWFMfpjdokN6jMigf1fXokkNFOyfC4R/nMCyG?=
 =?us-ascii?Q?pLI0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887b734e-17a3-4e2e-def7-08d8ba24f252
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:12.1758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtQvLL84SOxvd6OeFzD3gFElFc2KCqyDRPeh0Qxir0YYLVFMYT8bxMCmFsGhZF5ePqx5PSMAAZkE5jDk/xL+E9oOQ1oep4Ks1otqhm4taH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename bitmaps migration tests and move them to tests subdirectory to
demonstrate new human-friendly test naming.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
 .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
 tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
 tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
similarity index 100%
rename from tests/qemu-iotests/199
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
similarity index 100%
rename from tests/qemu-iotests/199.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
similarity index 100%
rename from tests/qemu-iotests/169
rename to tests/qemu-iotests/tests/migrate-bitmaps-test
diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
similarity index 100%
rename from tests/qemu-iotests/169.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out
-- 
2.29.2


