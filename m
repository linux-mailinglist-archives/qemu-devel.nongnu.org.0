Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B25A14D0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:49:13 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREAS-0007MV-6T
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtb-0000hy-5m; Thu, 25 Aug 2022 10:31:47 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:43230 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtV-0004oG-Qb; Thu, 25 Aug 2022 10:31:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXriBhO8eYPhSkDfk2fZNN7XTDBxEVRR9U3RQfXe6gxTMZ/gCXh6CClgc8FbunY0vBlcksr9QFJagZKE/Mc0T1cFjulSAu/4CJQTpPyjpQ9Js36uDVhUKt2op+iIqA6UsKzxrkBIDihmIdD2VqSXPwubB5tSw4uikOzdMn93rTH9iqV72pKQRgkW+QkmQ+JuxL5bYF/V3jkWO3zVayi4+tZFKoB27bHJEZi7j+NdlbqYJO7SNNcBfkUIa2uEdXyFkJcq0p0QVIWKozdSdoszJpitz44GVwbUJybA6S5bMQpwSCC44jppLIs666q26hVvWRJZzroQjREhaT/dS1zQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jATsGK6+z1YnaYs5f/VMZNISXlEIgalFXU/VfbK/g0=;
 b=bein5J6NqrKD9jBr7NH3rZSLZz82rmWYuMDR7mD2PznnVMju4hSxyZx98+sOgHZL+wrEnfqffHCuFbjaFBoZ5Z2sCdFC9QFat9N9SrVQc7fb82eHjXFHiA0yrPrUjwBspk7lH4QQOKlP5scmGtS9zwznShjCK0nv6oIyW5ZUcATqysYpUROowDsJhI/IMzoK8F3mHmD4dO1CubykOkRiHC67ha5azxWzDFoqjEN/tfsXPTotDYokVHukzyXgoj81bWYw35hlQjx0Cg9wAaVGOCQE7HV8yhT9o93UX3cCC6bN+KXmMjFtJJEbJDAqVf6jWKqvLK8Hp8badlfJjxddsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jATsGK6+z1YnaYs5f/VMZNISXlEIgalFXU/VfbK/g0=;
 b=ymrvZcr6EvBB8mPDjc6xWamk2npthccKSIUOpK1EUUIy3BYP4csmO/lfbURKeRSu8p3lppmiSdZAhVXwmIHc2DRdxb4sCgQUZw0cJOq1uYYzUCUWSkqpzxU0fun9qlVrXBTYk2aw4hAyVcNOyJpVJiuhjFnj2GDdQkcOoVmekgxD7wZbxhzQ2stO8Aud/RmSbsu1wmhbbQkWkKbKHWbVtFxfcH5fbtnb/HUp/eryjF230XV6tNZm4txGSRpxfgzKpHmiRZvtfpAz5a6QlE65KzuZ9EhxsSHcKN4y1bzaRkDprwHLEoMd5AM+GjkyN5HDE6CNQB1pFhvlvtrQnurS7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:31:19 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:19 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 03/10] parallels: Fix data_end after out-of-image check
Date: Thu, 25 Aug 2022 16:31:02 +0200
Message-Id: <20220825143109.176582-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab4a5d3-6cdb-449e-bf3c-08da86a679ad
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vj4S73XAAzDrJvRGVsiRvxcUGpuNAc/9nWCL//CbmkF2F7khF3823rJmWwaQvXh17xLJfVufESPIDT/N9nuavcDRnCraesudYR2yprKk/GnyWbprhBII0d+ciGDImOcuCVd140FC1NLTWdgKew09C2SyVuGQhA2vXrc0WmovxN/Jph4LRwgR4j4x2RINDZjBDBKXA+lQlPgPXPX/+7lHLvbwMm/8f9W3cvepmq50sY1w/OY3/37JAj9bTpXFPoM1hmXgX2888zL6icIxZTiOKSaWMqUlURIB0AIt0MZSLwZnkg/evhs8/0QcYLhIBSzX7hTU5MW9r2kYdrldkiLB9wwAsNDjb2dpm0ktOG6Nb22WeNJxF0FlWQ1sgOa6M8DAujr2vSr8S6QDivsxUn4pmMnBMIVyLd3rrmh6mePTW/MJDu2u9S6YWUHH97+7BWng2DlES5ssnloLKnrD/WQahLOHDgBy7I4WEUN9k3qGd1LhblBvqfxd+50QwB3IT1dcaahZs1EnGAxKAmgH79X/8h1GkrFt32CO2kQW0prvS9RBnO28DwdEwVIr+2WlQ4g+zwjI8vj0GZf2fKARi2OoJf4dj//CgCD5v0XSNcsUMxQ+4GOdZXB4WObGBKqEoicrKlUNpgtfYhFS48KInMDKIp854hI7K53XyR1MxkvzhXYryNaf0+SGzw3SJwBtSHDsOhj2EybQO5DGeR7mXg8tCHxBQmOgVLvxexl4K5HvfO44spz+MCqlBE2yXdXNbymK71o+tf0ZH4R5ae5A/WY3ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(36756003)(83380400001)(4744005)(186003)(1076003)(2616005)(6506007)(6512007)(5660300002)(52116002)(2906002)(26005)(44832011)(478600001)(38100700002)(38350700002)(8676002)(6916009)(316002)(66946007)(4326008)(86362001)(66556008)(6666004)(66476007)(8936002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYKJ4fS745uy9D4rg6AR4CeZFhe1pNpha0Fej7IU51iaJqMzzLLRdkgdKX3e?=
 =?us-ascii?Q?5SBdUXWazTdLmf4VyAZFlJZJ+7qcSVUDIDbSGdOXppj7jPpi+SjlGHN1Kq91?=
 =?us-ascii?Q?D9LWzKIej6cyrDt5kfCqamlibho15ckn9M//LQCn5DsC4i1riP+BOw5XwxaY?=
 =?us-ascii?Q?Zf8gnX4MEDceL/dIKBoBdUbjDnwIzQ2OSL1RGbXaHV7aEc7NuEIHQ3qSFy3s?=
 =?us-ascii?Q?q/IanmBk8ksibXBA36nADfEWrOxqwsmtc3Vy2cF2IwqsMXCzH8jlxQAXsKgX?=
 =?us-ascii?Q?dao8kQBGo3rLYx+ndlBa9UFScMqG0umJgcgH7hcaHMla3fuM9wnMmbYZw6t7?=
 =?us-ascii?Q?At4bY6DOgM6uFKG+cNdx1GdklDb/xgoqrkgv6a4XgVbO97TAzgJkYIJsqhhU?=
 =?us-ascii?Q?JfCSE/FwY2U4NcnjzjNvgiZNHlKziUdl/CENk0AOy7wi0Ag6FhyEnrTlRbh2?=
 =?us-ascii?Q?1vmKLxYkru8xu/wz5TO60kcOq2LrF9TXPfjp+WH9jhs0LI6LEDftXCMVSImK?=
 =?us-ascii?Q?QKbRzSZtk4jUSgQCPk1THCZzmQGJJ6ejLT43wQ3osiBA4/6M3X03GqpuWyEs?=
 =?us-ascii?Q?jLn88dD+2WilDheS/sFbonuPbIdRqjGDfED9VAOIWvcoQHnOsD4LzxP5XMb1?=
 =?us-ascii?Q?/fRTyVw1HKcKVYkBb2rSlNaKbEEbcFt6wIhF6/4/pL2ur2X+7xpR+eT/j6nn?=
 =?us-ascii?Q?kluJpYzKYWCtMuPVOMtA78BMloi6lB5PH3iI49NvNtYTuKGI9oE55dfgjrJZ?=
 =?us-ascii?Q?oLGWVhb7rRNZprI4Pf+9ys+9bCpytKnrVq50I0kBt0rQui51PjGQoT9JznXP?=
 =?us-ascii?Q?XsghyRUGVV8xgYAimy4MklG5Na9AH1vDVsNLysbr/JPW5z4bUbFUAD29OUUL?=
 =?us-ascii?Q?g9wMEKVD11UT71LOSrrENfq+WJ8wKzNQ5/aKQGw+InJ8YYfHLj0sZzvPe621?=
 =?us-ascii?Q?T9Cqo04M01iM+OR68ZuaN499+X1se2409jC8nYubvJ6u8kq5bF+2LdHcSZLz?=
 =?us-ascii?Q?I2HhdNJkl9Mfre5qH7VLwHp3sTkcbAA09ryNtOOSU+fCqvFGy8UW5Eygtjkt?=
 =?us-ascii?Q?XQsZh4Ur44EiA/wVDz4qsSdlGH6uu27qKdNQN5Sx01wZnwH3cXlzbdXodVR6?=
 =?us-ascii?Q?I/+A/NBn0sJrn0UkD5mHCTc8dkbtyDnDdTjsblQ8YtbOrS7tMI8oNQJ+FnHa?=
 =?us-ascii?Q?fBnhv1XZHPq4d44uWaIqFp/ICdGTv7SEULO6uvgktUD6BBG4XqOECRRXbr0i?=
 =?us-ascii?Q?X8yVIEs08UkuFTdEoLHbwWWsM5J1LJt91RTh08RDC4vPTHWefWYwSpsjNOZ0?=
 =?us-ascii?Q?21BkJOYX+Bjj17Wv9RIqX1fSUcHQDJw00A33AesQ5gfmzFPlmZ0g4N/JzyxX?=
 =?us-ascii?Q?VkfE5P1wxRe2v8SUZOpcK2K03PTj48Nw/QH8tNQmgONJextTv754HJrSOMt5?=
 =?us-ascii?Q?v6muocVzcbxQLLllYoBViG8wTZe+ewtAHK51gHtiTpU1nawO62QZkwPDbeD9?=
 =?us-ascii?Q?4tHsfkFjLFUXC4UvcdQNibkQJKp46js+NkPkBJYcgqx77iuxyAV87iU+U4n7?=
 =?us-ascii?Q?XKrb28c8cY+eHtroN3ikcI5LtDRyXElE5QQ/1QUgPNov6ynnUgVIJh87nQEU?=
 =?us-ascii?Q?AYsyTep0nNtbwHPCMyyBXAI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab4a5d3-6cdb-449e-bf3c-08da86a679ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:19.2514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De34/IgWESD9CTruPI/RsDGZjta6CH6zRVdAAeQCQw0ZBW76jPlOostZYWY+HnmG+kmnUS3Z6Dw26MrUubKP0O/Tt67QF/ZZ7rDxU13EGG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Received-SPF: pass client-ip=40.107.21.96;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Set data_end to the end of the last cluster inside the image.
In such a way we can be shure that corrupted offsets in the BAT
can't affect on the image size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 7e8cdbbc3a..c1ff8bb5f0 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -514,6 +514,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
+    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


