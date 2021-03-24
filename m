Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B66348352
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:00:57 +0100 (CET)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAca-0006kQ-7C
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU4-0006Zl-MV; Wed, 24 Mar 2021 16:52:08 -0400
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:48878 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU1-0005Mt-Uf; Wed, 24 Mar 2021 16:52:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bit78dJVnVetoXrfg3nPQvPqxiyo7jk52tGYLZ4IT++Tv3k0+Gehs8kW3T7WkXSwGp75rXC9Blff09RCxGLwOe52/+5y3ikrVP8JuBqqFbMEx99kEAMYVQTcV+Gi+uZu71/R9dK03jYgsgcSgi//nKuX/VOKX9lL3nH+qYip3OeYWkuZauysPm15Yvg+m8qncvBu1KQAPK7wcgmBJQRaW9u27gNiIcO0TYfq+C0fAs8wH9VRxRMm+x5yRerUj4ve5tcI1Rt5iK7EkNwvv1R/RyuKr1Ew+/EAINJjK8HAMglegcirMt4zOydtuXENzk2ac8BIJKVkkAVv6mzPxUmgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbEdRNIJXRhrWJlivHwWZnJS0yOnfYFGDcVcJmqq3XQ=;
 b=Wtpx8Ad/qwEBwBgO13OQQZ+6Y92LQ3a4zlqfGkX69bieSyDUCjIuEq8InCy8V2PMEimh8t71HBqzIEpRnw5sJvN+aXSveJ3QlFts1tccbR+Ag31/TGosZiOYEL4yx19mYcXnZCU+aVOWKpf+Vlqiu7Ze0VTihG1dZeGdhN52W8XHzf/HQ/CnYChfe/M3fiKIqAcob5vP691HV0nBvF4xsY6xSs4JHhXAlAw7Kd2XvTJ8znAPicVRWfevjNvJxzYvPwcRGagFXdO4bvzF/HI9bmX7Rci3mVr2Sg+bDv1/Yu//u29DWZ5j5+AHRI7vn577hpbciNhcAKjQesQ20OOXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbEdRNIJXRhrWJlivHwWZnJS0yOnfYFGDcVcJmqq3XQ=;
 b=a1GPKFTn/IuqksVtB74oTCVHwj222h1iyhZYE4TKTYIaBwAcZ87jewhU/tLaWvg/T4lToz0vC8q4KBAfzGjAwA7PVRYYATDFPKH45xY+za0ZGk34akhFG3Qrkdyvt0SWPr4dETbkboaxXkj0qKiIg99yb0aStyo4U8tlegj7Ths=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 08/11] block/io: allow 64bit write-zeroes requests
Date: Wed, 24 Mar 2021 23:51:29 +0300
Message-Id: <20210324205132.464899-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 963270f4-253d-4ec1-4533-08d8ef06aa6a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904ADDB1FBEF627F50FA3DCC1639@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fbXRO1EARGOcPA5sVXg/29CMRXRFymI19jNQe7/qLfC9HBusDmb4mdMiBbzH2ljIYNrzGoB4UhLefItsyevm5RFc8978N1KMy4kAc5uI6krDVuMUN8WxO4lIOgfKJQn5gmKpCaUCVzIXhsRKZH9rSX8XLObyNJOqgqxXHpz3ZLJ/cqNuRZLhlWRBT7rYg2ozz0+f1yds4XhxP+4jGTrDLYmC2GGZD/BiaOf4S274GVSdsipW8gy3ZrybW5UJuDtd32TikhCdPMWs/IzxDPse8VkZG8fSOHx9NtWdVkf/9bECBS9vqOZtSsv8yJ1Q4KSi86ozJ6o3tL5Uk+UQ6laXEfN14hDyF0MlLFY9lC+Wav7ki4YkbVavncx+tOzvuH5h6i5Y1QOF13FIMdM7OA87JEAhKPQXVCpdHenhy4733rlClQ41RHRfJCBofplBqmGfGFKvJJSzEpeK5jbddaQg7wUnxqTpEjwYJ/aT2vfJqKfx0b9IFiYmC9wz+lx/0tdXDWn5jOzq6jscw3jJjrOuLVg7IaHcIENpmlQro7kbFbUKGcvw8IHZ/0mHSbuVVIB3UmN02/1XnSjJpLHR9gEi0dNbdwyhTyicW6JEJl2ipa87Dpk6vulYlvd7gJ7twgkR9s1fUvlgU2sNsLZHBOE/vdzemqLK5nP+htqGY61NBuiKu37jcn3a3SayJ7faxB2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(38100700001)(16526019)(478600001)(6916009)(8936002)(8676002)(186003)(26005)(52116002)(316002)(36756003)(2616005)(6506007)(4326008)(5660300002)(956004)(69590400012)(6486002)(1076003)(6666004)(2906002)(66946007)(6512007)(86362001)(83380400001)(7416002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fiKmfF2VXUrSBZYhDuHT8tmDvMjhqgeC72DyxmzcEcHClSj+DXn+v8vjvDlS?=
 =?us-ascii?Q?SWPFc2zkSiIb2ynsZPZu6RwbRmMenpzc8Wg+rInaaLdM4WhEyanTy3wJkFsi?=
 =?us-ascii?Q?80Vfafn2NYhB1e4BNli4iiUPfEILFJTxqx66hhGr/voZg7OFVNlcwijhwZ8L?=
 =?us-ascii?Q?2/SJYjIHBPgWdD6OKpXf3eAW/PANgbzu+lUYA+m9ttHUMaoMfFNhytKJSPCV?=
 =?us-ascii?Q?Ofg2VpmQi1q/J7s6Rpv/s/cxgrqwdDlUZa32x3B6loN8Kq0jluF/9B9dLB4V?=
 =?us-ascii?Q?SA5im1sur4cBNb5X/viUmWajk2y1DsUxJxn/e8R0k7trCQHfaUEUHrSFS1/8?=
 =?us-ascii?Q?1rcXxq/wy9D2WOq5KggPt5DLdbMchzRLLZKj+qkAGnOwP8znBBbkAmXk6vYo?=
 =?us-ascii?Q?3C5BSvKTWjGRxR1I0RBWkkvUIa+wo0hvLFLljQC5G0qIq/dYpU+FNvuFJSvp?=
 =?us-ascii?Q?q8U7h3cDqF5LABPTNEuQsbfiThz1AinPrRT65Lgdg5HV+AF7jfrIEs48l4Rm?=
 =?us-ascii?Q?+FlLc4Ps3fo6hUSlM61gzevmhoNoqkZ3wi8M6j/FbntThPrsm7HL4oCIp9/3?=
 =?us-ascii?Q?wZgtvxJkkeeBpdLyZamwBt1DSZoAV8oPL1u5uHW4W+xIT7OolWjt0jSWe1AS?=
 =?us-ascii?Q?Joe2TlfpPGegbJKUvg5EGk6N6Ki/+JiZbrsDODH26XQRA5MTcmR4Atd5D+cc?=
 =?us-ascii?Q?YjScHeRhX6gFK/jjbGVk7E2eu9GfwDC4AN+jieFVvsbjhsWZ270YsGJpjtQY?=
 =?us-ascii?Q?O6a9lGyT3y5Ck44O+Oa4mkEB5WNyHt4sPgH6dtzSWlCCmZsXokQF/texA2oX?=
 =?us-ascii?Q?gdZZuO6JDoS6EHTvOPUv0wLEulj/KZDcyfic3tkfqeJ1VI24HmtRXogOVH3w?=
 =?us-ascii?Q?DX0VaNB6kajSFJNArJWLV8e9wHU9gwy/zqFai3IFGQXrnx9saPtVvUPNjawt?=
 =?us-ascii?Q?0lPb8DheAepMh0l5vDTgY1foPgvPj7Cf7F16XBhZNsr0OqD1qotFmeDMTzsS?=
 =?us-ascii?Q?TmXQtu6RjlGPHuyVijsR5/sc2eljtOOuu/xZJeHbGdm6doOIeucm2X6ZfihT?=
 =?us-ascii?Q?sm6Z4ymP7Kf7zbf6N87s218mPdHAynCR6X7Mr0+/hOpgQHblVHRBy5zLExm0?=
 =?us-ascii?Q?A+9YRmNT77U04AqnfC/N9HBVAJdbwSMLpzvIi6GRMMAZmdE0iwvRSIuiVb0M?=
 =?us-ascii?Q?DTRp6cHyDua2atxLdePQtE1s/MezZbT7s3bdYqBBR/KCpsMoKgQLSsE35WQf?=
 =?us-ascii?Q?S0ssKLJI+1vCkNTgrr7peLlcrVr2BMudorE+b/Wl+2meNUzOEdN099B5tGIX?=
 =?us-ascii?Q?Lhl4dy0WwLlFBG6OrGCiMHgX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963270f4-253d-4ec1-4533-08d8ef06aa6a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:58.2123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXpFNFMY/ofNf4QWvmpHN6KVX4snVkxoHaEJsJ1FUUYOFRAmwgHvsSTgl+HkFxOkwQ8JE25tL5WjEtUiM0Jd9uOSHj6Q4fpoZyxnouw2SOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.14.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now, when all drivers are updated by previous commit, we can drop two
last limiters on write-zeroes path: INT_MAX in
bdrv_co_do_pwrite_zeroes() and bdrv_check_request32() in
bdrv_co_pwritev_part().

Now everything is prepared for implementing incredibly cool and fast
big-write-zeroes in NBD and qcow2. And any other driver which wants it
of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 79e600af27..a3c2b7740c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1836,7 +1836,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
+                                            INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
@@ -2212,7 +2213,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    if (flags & BDRV_REQ_ZERO_WRITE) {
+        ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
+    } else {
+        ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    }
     if (ret < 0) {
         return ret;
     }
-- 
2.29.2


