Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C6682A82
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrs-0003Pa-RL; Tue, 31 Jan 2023 05:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrq-0003OV-3s; Tue, 31 Jan 2023 05:27:58 -0500
Received: from mail-vi1eur04on2130.outbound.protection.outlook.com
 ([40.107.8.130] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnro-0006VK-MT; Tue, 31 Jan 2023 05:27:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/lVgieWk0CUBrIlULQBBPZPgzxvfw0LcC2HQ+iZwlpT9cc0BxKUeAhBOYx1srr3GTH7PACAlF9RpkHAIJ0awc6knGnkOpVjmGB+dkFbTgxyShKy7ynLfbOEJjX528m7OLULD4GRX5tYpWhl+bf4SpjG4ry5kB+55gVhy7lniLBXVtIXJ0gps/UF0gncB6jnLf82RDUza9S97lEMhfhBJEpBmhX+uKwwQwQxnP7dy9WDceaLPHO13kNsFXd8NeHNwnCrGjiUJ2WqWIhmZN4+J6fFex/KpvM4k1rQxBmiFN5G9xrJECpWmM7oZfGjTzi8bU1fFPlEwaL/CCvjEgeUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvz6ScsGUgHavI95St+g9I9z/gAbgo+9V0WdlrmWipI=;
 b=QfCJJiwtAZkD8dirwukne7hZ6wbvmiiDebR+vcj5U5TBJintNnqSU6sKgugfzg2kfKVKYlOPOezja5MsQh921V0cjwNHfopJmN8gpwL9Ll0qOwHbvKgu05X6wpUI0R/coI6DRcV8PPoF4slm/6882q7zdYKz7YUrFZN/7XfHcHC3lDINQHK86Nh6Bnl7KZ/HEwsTm0dJOR7AKMQwxbDh8xj3lakjAv85LafijgkFaTQ6BEedWYFf3HLgMEMKyZJt7Q8AU1zB4lc/ruNtZea4Hi/Z0ifCPpodQUvxsJIR+jgIrPQbgo8aDE5tEl0Gzm9iThddLNAN+bPnCJO3BfseBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvz6ScsGUgHavI95St+g9I9z/gAbgo+9V0WdlrmWipI=;
 b=skoRjEhdZKv9z60XVVugEePg7Zf3WPkc4Qw7wiiejobJ7By3tg+YE1230MQSR5bQ78tn0La7hskoiBF7zUJHphn0OrWs2p9NSfTZlIinjp9XCilj4EtXrmNOoYKy9JiTekd9Nt3s7+b7dxt1SOPx4SmwL/ljqHgJAMVf2PzAGeBbl5ragrLrrTwFpBc+dvth9h/Vlc3726PbXkYvceeZz9q4L1JvZonh4MqqRJ8f9ZKB+n6xuvmVrmDdxwN3w88fQTtK0/VfIbSmMm+g8YBuFzGTEoYAvmX2+g/mHl/62grcbp6m+JO3uZ5ZWpTGKK9IOpLO4Csrtgqu4Up05d/xHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB8615.eurprd08.prod.outlook.com (2603:10a6:10:401::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:27:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 03/12] parallels: Fix image_end_offset and data_end after
 out-of-image check
Date: Tue, 31 Jan 2023 11:27:27 +0100
Message-Id: <20230131102736.2127945-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e5b01a-aa25-4991-c2a6-08db0375cc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVhn8Ve/mPfL6sBmmOTnidsysyM3fRh4kTUkoVK8GzXSjzggjh6/6v2hAftVPZ9BbGw2usq/2sHk4GnK8I9/8C3aTjb2VAOOmA9PuSqFC6d/RgOzFAagPevpOOSxg3IoABVmTsdNhfcg5Xcz7CBSXKryLIT4cMxLgwEL1EkjBDSskX/WjQ/6DqZh9ZAZEnV1PyiIGjGwqPSxrsjm6yTAXDvL1/+AnI/D0fwulTJ4eKJW4txK0HZdc0CoHn8OgRP0W+JT3fAqiz1rmRljNbNk0gQu/u0K6uc0OJKtzRwp94MX4tzMocElXwug1yBMVTVTFpVzm1lY5M9MAK5QvV3HU54Gxdw4Vr/OP7Byep/EJ95KlqGnyNHc7r72W1eMsdTZ2/cIPZtQtwaYJ0610XKTXW/7cSf3qFnNPDNmS6w9IXle/SkgmqalJOnEisJUXK8njQsofE5A1oZvVhxms7Xt0NbljTTxnyeoSOXgXUpf17vxfJCQSOV2P0ZMrUWmfFXZdQUYq5Towtk6dCGXBOmFe1pUGhiHAvVbPs9Tgn2AsIWl7igm4AQE+tWou4NAqtVYQFfmL13LZl6cstSRoi+gTBKLynuL9EgPaOEaKdnD4gNkI9xpmBpzeOk343Luv6N/TgdN5KsL2InFxnWMZDLioSOG4wDjBsTXHiXjuvxrdotDOqYSnxyHHZ95zUODAPMB9ZKUddFTiPS/X9klOCErLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199018)(4744005)(44832011)(5660300002)(2906002)(8936002)(41300700001)(6916009)(2616005)(66556008)(8676002)(478600001)(52116002)(4326008)(316002)(38350700002)(6512007)(38100700002)(6486002)(66476007)(86362001)(83380400001)(186003)(26005)(36756003)(6506007)(6666004)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+r+yjLbl+7++fD/WcOmn72CnM27gWGEVvduE7CJJb2+MMNCyrEhi80pt/2o3?=
 =?us-ascii?Q?pweOXENQujr7OQVuC0pIChmMdW8s0ZWeCZ09F0OkrTADZTe++IEGxAMBQv3G?=
 =?us-ascii?Q?9h+5Z8aWKofdWJl46Z9TdzE8I1GpW8UiPR4B/wjOhYv5SJSsXMlg+fcsJjZc?=
 =?us-ascii?Q?P02A2N+ABImYqfxXUohrgpyJHlO17tzSnZEADOHeqsewePPUcKZvAQaMLeeR?=
 =?us-ascii?Q?EJgoY8Uglb+ZYh1qI3O4FAdjiKnCHLuPiKv9EmW12cTOcGuF7v8Sk16utJmW?=
 =?us-ascii?Q?0sVduDbqCWp5PbF2P4LByiWd+hnB96LVYPddDY/A11iipfiif03XR1ypweeP?=
 =?us-ascii?Q?GMlbNfYSRiTC61Zh6BzAU5MM8vftHEzEFP374KKSPEgK/54A4EcvsvjQmEG0?=
 =?us-ascii?Q?mU/67LWiIsn8Qo4xmE48eQ/TR/xqqkmDL465hMw5lsQJ9cw+qJzhsEzVtm92?=
 =?us-ascii?Q?ZHkkJ4gxPhoQRc78d9DyMQr4SZaE8BB3axJS75hcOCKY8LyDPUY0SOnYBED8?=
 =?us-ascii?Q?WzG5pQbKmISqeitR2cAKp6VfB3/umDtl5aDxHHBerFULfKI9d41L8G1tKXyY?=
 =?us-ascii?Q?I7FG7TkoYoA/nSy3vJLzqG4Vw3yfGKotiFxTunKhwfmkYT0BQaOsxQmmxrix?=
 =?us-ascii?Q?SET4O1p5nJb+/iBM8zCPYfNNcQ9wfcVctl9m0eplWaVrmNOk8jXB1Z5KD3G4?=
 =?us-ascii?Q?EtmW6EqlKpMeyzJedZHK7I+7pIoJ6rMnZBReXf+dRZnzpOc1aKJjHLPwsrle?=
 =?us-ascii?Q?qYl57sDC//exaSRPaVv/Ulv8Rtmbyk/ZAP3y1KUqgYwl5JipNhOO4fVNu4Pq?=
 =?us-ascii?Q?C7YMhTejGSIbw8tRgSVw1P6ptDtMGrBRspu7C2wGjuYeNA/4lRl3e/Eg+uLi?=
 =?us-ascii?Q?5HDYIqeiylhHwi2d58BlgfOLzjP+e31F2bScc5HZ8uS8MutS21nCR6L4rf9s?=
 =?us-ascii?Q?SZ1sUfIJ94e9NJ0dDMdzarHg6xJFFJlVg/qEPAqLScLN5nFvwJ3ZlidtS2bO?=
 =?us-ascii?Q?ZIQXQkuhSMKej+DwcLXUs8slHZdGdBGLR+h5/rgaWjZNJWT+s1NIVqa6HTgS?=
 =?us-ascii?Q?K+yYS1Kw/2Fbh7DzK6LrWT6vvhACNPCJxZ6y8EixOvnsTumszReKXeUhqs1I?=
 =?us-ascii?Q?BSkvr5ULY9WYoXNJf0xBuLyST8pFJ93/mI3T4XWlxlgsZM5hsWOyULRwrLUC?=
 =?us-ascii?Q?WtrDaafxNExXA3ctR821zHzilj87aUd5Xe6i4aLYDqU2eiuk1tqAta/CSM4V?=
 =?us-ascii?Q?x/w5moy7vz5VVXPaWhckyRcRzs5S8+BM5I85MoHxHgSuna6XtpnTJPNPOXL5?=
 =?us-ascii?Q?cyO5UsntCV1sfh3aiyk2QawuQiBJkZUSAde+uqs45cRuzb4wD0YIewFXGRVd?=
 =?us-ascii?Q?hLuiy7TeJzQ8ZPh8sS0f9Ph72mlB4eCGoOyrV+ThYabRwjK/AKd/jLxv38Fk?=
 =?us-ascii?Q?TEgTudzz85VtPNeFnjc7aGLklV/g7Xade2IfkLGPpJ0cXOLNFFVr2GaMYv+/?=
 =?us-ascii?Q?BUgxZIIiKr6SYIgsdbkLpMLJq5UpiMAyOwwCgKi6+jAf6ZLO42FRrQEN9kGK?=
 =?us-ascii?Q?Kkn4R0zmWnSGeZzsvMf51geTx2QqyY54nvOtZ182uz0NqUZANIHQFwOyArWG?=
 =?us-ascii?Q?HHU7mmWpPUXhzGJ5m6Xcc5M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e5b01a-aa25-4991-c2a6-08db0375cc62
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:47.9700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3qRqAKakQo7l5wqhGa7gFIhIg4EREee1exshcZMzMq42o2oUnDBbLGpSKe46t+wo08YfEGJ3sb4bLTjw5b62Nsmd+WtMMeUHecLpB8nVYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8615
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Set data_end to the end of the last cluster inside the image. In such a
way we can be sure that corrupted offsets in the BAT can't affect on the
image size. If there are no allocated clusters set image_end_offset by
data_end.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 436b36bbd9..2ed7cca249 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -488,7 +488,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    res->image_end_offset = high_off + s->cluster_size;
+    if (high_off == 0) {
+        res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
+    } else {
+        res->image_end_offset = high_off + s->cluster_size;
+        s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+    }
+
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1


