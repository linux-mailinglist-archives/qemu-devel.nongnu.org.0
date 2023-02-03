Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B56893A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsLm-0000U8-Jj; Fri, 03 Feb 2023 04:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLl-0000Tf-1F; Fri, 03 Feb 2023 04:27:17 -0500
Received: from mail-db5eur01on0701.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::701]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsLj-0005Cv-E4; Fri, 03 Feb 2023 04:27:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W515EQSHABGktqqN1lsTfmoPvPs+BX8dZF4cJTZM+KeTSWIC294C6a4Yl1ovS8wQZEX1EbCs35hlBCmm2BFJ39s0TvlrRTs0N7ODOana9NpcZD8d8gcxyu45JWWNoFe6Y8uTUymjgeis1sLk3iIeDRcbcUUjysGpN/K31868rcfJ5Wdu5EkYn2Yk/ZPp7UbC8LIx0YMMdQv7JOdqN74irAi1Stxl50n6jw1V5CC8ShYCPGC1XiTZsMLJbwHnOdeT++yl9YsDxsDqOCXFOEBFncmZu0TWgyIstBEIBjyVQxWSMbullPZ+GNG8MbH72hfT9aWMTxG57f4P9PqDrWOF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCYhNxWlDaht7BFFH/S+KYxEhYgTPUk7CzHDsW3HmDQ=;
 b=bf5EtwOvRTLjp/PNyfTHXQWb+oRiQqcncxzEHJnai1UXluEJ8i94jbogfqY84BEOOcfvmGHgJjrBy4SAU3oxWVe6e9zDPfYq87kC9slNbBeIE3KMkMgbE0AJFnNnw/mJUPkAWUUqlsYlcE9FSaTDfhHX/I59Z5bhnruHhGipY100cAeIGzE3aQC5tfLIMMgufioOMTjqDFUol62OF0l1AvDpuV6aGO33eerZ9/jXlk9m7sYYPomE0kmk9HFt/PFQ2WDMjmCKKasSgTZuCjrAwX0BPNyNKn1Ll/bX/MLLo3R6Z+dGb/zsavxDH+3B14ld/hQ6rYOnbtaeTze+krBU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCYhNxWlDaht7BFFH/S+KYxEhYgTPUk7CzHDsW3HmDQ=;
 b=qK525tzcuFthjAJKeJ2fz1m5iR6mP/fGlGC4UiO+WApk7M0eEgEUZA3EdYrRzxaRqjECz4yGLhAQcdWXQ5CIlIPHC/OMWN5OsjFTjhqG7lhvVeH5iepTYJEDqbzv526Qogioxb5zoaoxc3V9B66eoSURpS24mZeY9oyvAZl3aaLkgOKFqYZdgvld1AQ7ylIUv4vbHdHlAdNSTtYWmH5kSTMRcKwAb8MpDjVq7KvwV0b5k6Lag0aKEy1RhyIlrYIH9dKX+F+jq9XxSuN4lLL2Eqr6j9VxxnOg2VXlOa+FijraZBucuBcuNBtSDkuYU1y57PELGbIHXoYDxgnBYJbDhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAVPR08MB9356.eurprd08.prod.outlook.com (2603:10a6:102:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 09:27:04 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:27:04 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 1/5] parallels: Incorrect data end calculation in
 parallels_open()
Date: Fri,  3 Feb 2023 10:26:52 +0100
Message-Id: <20230203092656.2221598-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
References: <20230203092656.2221598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0099.eurprd09.prod.outlook.com
 (2603:10a6:803:78::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAVPR08MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2a1083-ab3d-4cbe-0f1a-08db05c8cfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJuQ7dj1d1Va4qjA9f2ikw4Y9fky0dscMtNXjcPtuLWrbVEyWvHAAQwKkuaxQRJgtqh9pSspONyI8irjNMifTtWZckJS9omynW9d4Db6n46umZU9R2p8cLh4f7PHtarf+3qDtrvHSUaMgZbueEra/75qbeoeUClgEMBt/Zv4sDXs9qMhVDf1j3iMFXJBXlgQLvGHqnvqS+eWiJMVP90uvU9YfDkga61YGMvxHCDsD8u7K6+Jt3iQ3g0TttOAMEBXEGH7YdtOMP0BX1ccURRbUL2qIgSSlxKW8dzkNvjiRAzTjDlMEx2k9f7GaiSXUTtgceYqxdkjTIp8FGUMtC8Yfox9F/pUfd6F0hTkhSWqS8RcOUP6+BHwP6ITDh0bySvHF0aB19a0ZJ/X4VG2+goAnFJJjidbBuzcc2h1sRRonUfdV4jSkJ7hPRkwOPH4NBmMuE0LsZVIJr7uaan39Pmhuh3SNS5JzLE51uT4TAnqPLdlQuiRjAkIHNsjkEoiB5OcutFYc1aEBYNAIdTLrn9ZlLoJk2f6umVFPrCCER5d3HZDBHfaYIh6NIMr0MQ/UUO2AzD2iEGomK4rOJcIxWMiCxPm+PLdbjt1e9JMOR7meGf2CgxBh960QQkbEVHkM8T2FLFXhs/1SrhgUVv7h+Ti902sqBf938RdsivvyyOvbfocF39GR3OzaeQhHbqclwr4Jr3JvJ+j5Z/PR+nJG4edFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199018)(478600001)(52116002)(2616005)(44832011)(36756003)(6486002)(5660300002)(2906002)(8936002)(316002)(86362001)(4326008)(38350700002)(8676002)(6916009)(66476007)(6506007)(1076003)(66556008)(186003)(38100700002)(26005)(66946007)(6512007)(41300700001)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFrP7m3vVCf17/SLFWyxIJkyJRVcNq7B077MCoOWUuO2mpVyCG38gGEfIzFy?=
 =?us-ascii?Q?z5s8fZ3OMDBxoJo5t6tbY/TbeAvVMGqhaKWOZhFjatiNhSDIvqh0E8EkxmNd?=
 =?us-ascii?Q?q2YH8TAhP85BUBNYTClExXvgc8HtQF9LpOeqJEl47uh06jHwRdZkKgeZqBW4?=
 =?us-ascii?Q?G+JsDpshzyWgBClIUzOua6SK0lL9XIMT9DljeVgdGSKOF6m70+AX8cNHuseQ?=
 =?us-ascii?Q?5udkI7CoWme0dS+LDG2x/BnTcV5n+b0qnoNB1v2kcXZblsdZaEaEOXAYuU8U?=
 =?us-ascii?Q?C3txhqntiwtxm+DxTmYAmADdgp0MEAfWD16H5DEXJ7pgcnsK4rlDQzr4Ixbg?=
 =?us-ascii?Q?BkJD0MSSxCE6U09WyHvdny7RP42gLtVou5OxxvuqfcFrvN0ttBx4e5HfvGA/?=
 =?us-ascii?Q?wDkpZZCmC66CJShGOyeNqCLruZ6PErii37mhFoHyPIcktLfMBVa8c7Uimegx?=
 =?us-ascii?Q?6b9j3YmB4H5/KSbYsQWzV5GgwHQ6xNpPIWKLP6+McQtvRUa5Fkcf92Z01Bd2?=
 =?us-ascii?Q?MZrt8uiUu2r07UWmubS8EDFs/VA2ts7kltwYZmnQ+JxL08cB4h9xHOZieZl/?=
 =?us-ascii?Q?4W8zcpNCz5wZ2LSMW6gHWsWaW66nKwX9ri3Tz9dzhqNn859P+HgRmUPJIh5X?=
 =?us-ascii?Q?fP2ZxFHL/WlhIs5w5LTqTAlReFANfPSZFXxhVtCknizCPCJsmP/oGHT6FmKs?=
 =?us-ascii?Q?DKjeJmMw5ymEY6F2qNV5n/MLNvBnbYejJRBPJ4Zsgs4I7HRx5DH9/kB1IDrC?=
 =?us-ascii?Q?IAZMXFQpLERy7iRViLGJzOiZjcbK5tJUZibb9dcKHIn1v0V8bTxmFLQA4Ck5?=
 =?us-ascii?Q?q8ihgdspHnF/gYi2z2ccwM7asQa5taBRd/OZchP74eUTu0R1H9sT/golftFv?=
 =?us-ascii?Q?L9lv1Xnod+QW1IoAOAsdaJHNlGAEoFuqEVm9oaEndzRhbQMhcsOGcZr9C8PH?=
 =?us-ascii?Q?GcFMX+uPtpSLW0vM1DQ47dLk8MevlSDfh92qoH100H/UHRkI/ALjIhud+B+q?=
 =?us-ascii?Q?Eait6qFel24GqJcTe21d13HRBrgkqzz3RdoR2HCdpcLzJulh3KMN6RO0cEPo?=
 =?us-ascii?Q?/CoVecxt2ESs466SQXbNWePKcft9slhFW4mQMz8F8Mo4V1vkgrzdAjiNIGtZ?=
 =?us-ascii?Q?6d2mMylDbQWtev6oY1SPGcJfLcYl1OjvGLTehjXNvMUNMpgyU3pg4jo1YeqW?=
 =?us-ascii?Q?hOkMjq+Ww47Bw9wfuTFJ+e4ofe6Qukwu8hi7bS5lz3iinVsZfa8lr8fOSdK3?=
 =?us-ascii?Q?0jIr2s/2jwfivfI0dx82zZV+d/WDw+Nkc5jIZajYbp885a6/6/vl9GJHg0ay?=
 =?us-ascii?Q?wbXEr6AjnSYiqUz3WB7g85M9ylKPRevj3eg2+jHyC3kh4d2IaLzQM/b2Q9PP?=
 =?us-ascii?Q?frqBMpc1y8bhHDDriBkliMZen2nslcWNS175MnNTORTnIP3iqf9LS0kyA3zU?=
 =?us-ascii?Q?XElkNlkcdrjqq1MpHl9w1JNXKpoJO5HIa9wbcWUWXb81Kz11WeQscevWKiP5?=
 =?us-ascii?Q?uWyK1E5YnaU0KSD93arI7Sf2gTCrnj4DdxPdZI24V1ySmmde+7aPGi0mxVI5?=
 =?us-ascii?Q?1/NqGgjfrNQXwR4zqg8oDVjlJUNMLgiFsW5HXBj3o8JmrLgvplgaTY1tbtbD?=
 =?us-ascii?Q?FfhD1My+4hhb+4udjNSig94=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2a1083-ab3d-4cbe-0f1a-08db05c8cfd0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:27:04.2892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CKBWzEblowGQxOd2gIsvKAsluia8p+n9QUE8zPr8Ijftkjs0m+c0Sar2MlX3M7bgNwTUCu0NIVmlVziURmifXZiDu7qlQm2pQkTeuEu+Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9356
Received-SPF: pass client-ip=2a01:111:f400:fe02::701;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The BDRVParallelsState structure contains data_end field that is measured
in sectors. In parallels_open() initially this field is set by data_off
field from parallels image header.

According to the parallels format documentation, data_off field contains
an offset, in sectors, from the start of the file to the start of the
data area. For "WithoutFreeSpace" images: if data_off is zero, the offset
is calculated as the end of the BAT table plus some padding to ensure
sector size alignment.

The parallels_open() function has code for handling zero value in
data_off, but in the result data_end contains the offset in bytes.

Replace the alignment to sector size by division by sector size and fix
the comparision with s->header_size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8ff7d55c96..9b09022f06 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -861,9 +861,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->data_end = le32_to_cpu(ph.data_off);
     if (s->data_end == 0) {
-        s->data_end = ROUND_UP(bat_entry_off(s->bat_size), BDRV_SECTOR_SIZE);
+        s->data_end = DIV_ROUND_UP(size, BDRV_SECTOR_SIZE);
     }
-    if (s->data_end < s->header_size) {
+    if (s->data_end < (s->header_size >> BDRV_SECTOR_BITS)) {
         /* there is not enough unused space to fit to block align between BAT
            and actual data. We can't avoid read-modify-write... */
         s->header_size = size;
-- 
2.34.1


