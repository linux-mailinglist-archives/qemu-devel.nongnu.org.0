Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFAA59BCDC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:30:31 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3lO-0004vO-C1
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NZ-000624-2s; Mon, 22 Aug 2022 05:05:53 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:44801 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NX-0006xe-Hz; Mon, 22 Aug 2022 05:05:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIL4iwnUrAlYWs/gSBCOBC6Mkd7R+ArWQsi+2RIPPXT7/AoIefWMewU6YzbmYwzTaezNHIm08jSfFNWZv1WWM3Y0ZdCRVPW/qPeAZihpyexBInUVTI6cVgmqJANQC+Dd7ghniKeDB7Jbl9ynhTkva1e/T8neyTo+3QyQTu4jLU1jMsgEz72+Owb8jp51JjmVngV8QClwo0psfPxVa+WMJXhOA7DB9NenlL/lmMN/uw530hAeaxu52com8B8DiZVQCxecTOgbYXG3HFTw1D7VDfrR6Y7CLQUwQK+z+NbQ4lLN9X4zLXEL+qlVaGqY/25OBqEyZZ0nb6/SsVwA0mlmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UsiwBXCTJRDf6V2FL4tt9kbiVXailcT0LYAP1hwVqo=;
 b=ELhStOqEL8Z/PsNKbjtuNPDr4bFhbK8D3GqAbCsYidxsTzH4EtFlTuT8YSkD48QWDRwJRhEmy9N5RM1G6HtJGdUZ315ypj69f0zoPZ/MEPZHiPUQLq9WnsLD8a3Dk4D+UTSyZcYamw6e+s1ZgTvOM0lUpz4gVoQhAl2vzXmNFEwDLfx+5ZqaqhXpnpYcRXjpVTEdipg1mYWOKwwdwuTqHAlDwKi4yavV6dW41kVAGXIigSuz0U86D8Ww+ycB4JZIuIG7fEoqoD9qiAc2bmC+l+n+ksCPDLnzFSFkK/LjFj46vQdCuBDpGaAlDLwFv6sD16K4LX0GltVVXH34gfa4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UsiwBXCTJRDf6V2FL4tt9kbiVXailcT0LYAP1hwVqo=;
 b=BRTqnNFn0HJcvkhNsSkYht648Al/gd4ejXhfZF2kUhbvEHW3Um/jZBJIhYYoB+eszZUdO+2LsAh2kBOP825iW8zR13B0S9ayB5cyTks0Mz0BVOnxNeLgCrp6sqzK8Ga4O9CMvO/teKdMI5Ilkl5mEkmBqMLHMDR7CnnSZxgA/0ggw8fcVLW+1kvLLuxe+cPj3ImjBixAAUnSzmjpwXtnA/A2/+/gNRzFigBv9r52PGSWElPmP8JjtQM/JpeX+6f6bfgKa2dgRYQOsQoac10zGCbPcfD4ZBdegbrhhA9UJITC0AcJoy6EEp6hJEgXGd/gIEOz4qjBlBLCkUMp72tbdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Date: Mon, 22 Aug 2022 11:05:10 +0200
Message-Id: <20220822090517.2289697-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd4c777-de48-4ef9-ae80-08da841d7632
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/H+IRolFE/0XfOaiLq0cF7ApYVlaqF6OYSDKVkTI4WaEnvhRojmuKn0uON5JV97pYkhM3BP5PTnnK6RkayqGzjbpbUD+0T8VvGEIA+ZM+NcvGWuTBc5VRyuCxJBC8hPSTbNzeND1PdGGFP0F9kSmmIawXSpGstSC2uxBSBQhUrm/UlrH8JWEy8ni7Kq4uEXLoDfBOkguXskoTUKRCtPmgax1HIeVuTYzI1ee93oqu03HxboIze5HDSylMXaX1STERE0eJ0A7ddApi+ZYsUyKvKsPPQLpifH10TT+G9jRYMSXp87vPLkkyrTphjLMN5LXptNStOao4S1rgJErpVr2SQR+a20cVsSyvIhMCs6e6Tn33VOwnpjqmvwEefQDPde7RjhHsF731FahpwcqE5u8Hg9qXhgDICxxHFkp0J/Sp+hVaOLWtBo7M67iO7ziHDGpZEa0NB9Sj6EN4i8rBa6LrflO+AypxzyogNJSjs89Lnva1PSMBl0FLFR8sgsEEq7w2ZaPm3prVRGfBpMgk63SO6eFGU9imuBy8eMQgtxL2cJoaEzUDcIjF9xw6yyf8aIedwUmesDP9PzX+FCXVfanczu4a3Dqfp4STmPKaD/l/OeDIJnVVAdFXbQhKqWIAQ9twT07fQGBgLXyV5fpRhf8aXBHNqY3lRItRzscnvDYvh9VjURUAbVTb0q5IxGI+YFpv4YNTN9X1OMT9mVbADU+Y64+nzkk1gW3tsV8gabs52qU1CmIj4OVCBmPae5EV7XzOVfxUrCRhlW3A6lJfHEYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(4744005)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0nRnZEQXs7xBVUNaXWXcegxBAoXIgfBfPo+G9YYMh6mzhvzyfxAo/M0ZoX1I?=
 =?us-ascii?Q?rKU3SfKSK1kvoZBcWxoUkQKhwBUduxcD6Tx9kDvTB1yxsPDByOkaPIma6dOL?=
 =?us-ascii?Q?B1xxtb8uljvmt3vVYG04zQjoxQNfsumM32AGGiXt7cVzXjOSQkCAnlZX44bF?=
 =?us-ascii?Q?nmyWG053As8umpy1Y0NxVmXCQMzLaPkGZmbOFgHzo/AUZvWgef/+T7++5Ok7?=
 =?us-ascii?Q?yypttvC6fLchMYpH1tp/tLV/n5cXmkcqm0h+4Z5alFICEIPWVli9xlIiDcz0?=
 =?us-ascii?Q?q4kTnT/pTrI80RDMvBn4HCTp/NU/dI3sTLKUKvp37jPwhcKHGwXVgJpZ2rsl?=
 =?us-ascii?Q?RJYtrQfgIM5VKnrMMAyGOb/Bp503sqyhOlhAMVe3c0WHhHX9vpZpfRxV6EGv?=
 =?us-ascii?Q?Pskk3wMXRocrjFhKYdAZnCMYC7vpKmgdtrnzhYzcb3ziac5dVjYSyd6i3+ml?=
 =?us-ascii?Q?18LwJUS6NPwbGoaVPHgbTqT5PEehlgGgUgwJOJaZfw8CDJheCphRxSwgRLgd?=
 =?us-ascii?Q?3AcwvZJCs9GxeA4P3V7D3YobyF9S3qBGyHEV0fifVmrXlKDMwQ953Ci3II4S?=
 =?us-ascii?Q?8kooM0CE+BdOFK6sttAzeVM6dY6uw/+9y+YE9H+uLXJ4KiMg9JhS/ATbBWe+?=
 =?us-ascii?Q?k8RQQgsvI9X1YIMSnm41UoS2WiwgJriuaAB+eTn5xDMMgPuN5fYy1d/fZiyX?=
 =?us-ascii?Q?dBeKCiSXgvLANaU5+OJ3lfwcKdFK37IYTVZZ3j/+q3Jok87a9CXR9lGKHHkk?=
 =?us-ascii?Q?5dvfEXd+7JD4rm3yRWkZS4m7AIMJD+gSZDWXBP0p0qcG/BMo000zsVFzfEU+?=
 =?us-ascii?Q?JfZnNCqvOwtxSE3ySibBnGGvGWfBjVhpqMWn2xQEYVYGTEjXlFOJhn2Nder5?=
 =?us-ascii?Q?fkW+lLx2dgw6v+3MRGvtp9txS+17TKCbHRLBwj5PQ3InWQZvjHeWH3VS/an0?=
 =?us-ascii?Q?C7xVbkpRW1xcJ27JHZUx5E59B9NSzn9Vr2nFzODS7GE4MqyDPtKHNABUkJvR?=
 =?us-ascii?Q?+CWFr4lJzWpT+oupC4wiaAC2HSUa2cNgX/iksouTCNhEuoUWfeVoGFuUZajH?=
 =?us-ascii?Q?S6eqOlI50yyDhqq/UEqDakChhSY1hvENghbuWjdtCHa//pLcyKVSDFUP6p2J?=
 =?us-ascii?Q?YqYs87Zj8ZVJ58/q0m8R8Plupi0weMgLrDPGQEqDgA+J0lUXLmRU63qckn3e?=
 =?us-ascii?Q?TGBSamBPGXNb3Wgc0Y3G9Z6DAiRv/elcLP3gtTbIfqf3DuG+VCRE+HNy7YQR?=
 =?us-ascii?Q?+Pec7ADHBvm28mh9LnR3nmshIAJVvAN4sdtChWH0FclhmoC5pQfGmgLs9h1p?=
 =?us-ascii?Q?tITkKZe0ypMtwZ73HabCLTAm1lX1EvGHeW3HvQLl4Ecg8BIEjHKgGYWfpBfX?=
 =?us-ascii?Q?2CBQTKctliL4IOWirwislG4zQa3Ovoj2vxO/ey+tc+SMKhVA+Lkt6TjhDXSf?=
 =?us-ascii?Q?o1s67Z5GDo9eEYACeLSn7DrfnWf3bSlyrSdroCplZNAZEPDL8AiE693dtaY8?=
 =?us-ascii?Q?l5wRC/X5M/DqMEzrLWON1KZS4wRkVspg6AJoZlTpNNv3OSiwDwDQE+0F4Xwt?=
 =?us-ascii?Q?06QphAWkKqPnNvR84or23p6+cddRBe2Ji+ClhIH6yTqiBaNBHvewHrRf84YY?=
 =?us-ascii?Q?Fu7hThRBHQJTXjXUGeWudBw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd4c777-de48-4ef9-ae80-08da841d7632
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:29.9703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xa3Cw785QfkziXzsXYN3UnW22nOIGdMT0peZPD0i8X3QGwj5tTSPtIYcEpvXT3LCW+NZ6STs8tVFUnWOs2IIhYNI1SFxAehLJRoVHDPZ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.133;
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

Make data_end pointing to the end of the last cluster if a leak was fixed.
Otherwise set the file size to data_end.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index c245ca35cd..2be56871bc 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -513,7 +513,15 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->leaks_fixed += count;
         }
     }
-
+    /*
+     * If res->image_end_offset less than the file size,
+     * a leak was fixed and we should set the new offset to s->data_end.
+     * Otherwise set the file size to s->data_end.
+     */
+    if (res->image_end_offset < size && fix & BDRV_FIX_LEAKS) {
+        size = res->image_end_offset;
+    }
+    s->data_end = size >> BDRV_SECTOR_BITS;
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


