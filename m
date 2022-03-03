Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DF4CC68B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:50:55 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrTS-0006UZ-HQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN8-00042A-Lp; Thu, 03 Mar 2022 14:44:23 -0500
Received: from [2a01:111:f400:7d00::710] (port=7585
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN7-0004Xj-4e; Thu, 03 Mar 2022 14:44:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd6UOBthZ+wMoXe2/0Z3WJ6P5ZWvbKbqtZ5a9JwO+vfNAz/8CYcYGPZD371BYYNQ4U+ZGXSPvbhk0ba7qLZSHz9DToLUYUOABp2vf5GYgwQFbd7Wq96enwu2bgD/m2U7+uBvvTg3IhwAW30J0sEYHLmQjzWHF22ufTNTX4Xz1dDSZZjkhIhxAG7mwJBtKPVJwoKhZC860XSGJZHfaJZQ+N15Gy4O+ZfjJgaIH+OXvH+RK/LUEZoAhmIBlTVSRw4vSs85WMeU5xaY4dWKkWoJQ1HxjzsVF4CH962Cop7Q+gvclDuM/iwjnykh+5bXKAasxjqbfbJAOXPNz1N9i7XuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfaHUhbRyFa1HNmcSpumz+kghFfvZXfWDVh7vE8MydY=;
 b=iZvveBAQ61vsxsRzXit86fCZwu2ubUf2eZXlTWhQoBxSvPPVs1KHaFb9R7DsJnRzvI2K6TX1RpSRYGsCGJ9tOPpcWG+WaDUgi/Ylor/v1+y5AD+VI3pcsHe0OapIEpDBtUkUcFcfpQqdDk9pXjRUvQciWbw1yP0N53chax2tn+YwhT7jS7e/fwehoujg2UabF/HP/wCSk2cveWdK1bUicFUfBbxhrXz9tUvTmV9BWb1WFWJMayvbIJoP7EiHFTyObf6mSeIt/T7LDi0mNjugWl0I9+zFNg8FFeU3ijkTzjlTEwjpNknsqzPK9BcK2K0TZVXT5OFkW63/6n5sB6J/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfaHUhbRyFa1HNmcSpumz+kghFfvZXfWDVh7vE8MydY=;
 b=i2LG+FQfnD/4rvTHceUaOYaKLgIm7rwdOL9GRUByi5CtrkEDs/y30FVEE9SRybESzbo++AYIjoDd+Y8w2GsmYZvM/dCH2grADNRpGzVf63wUWXUKWabakjB5nd4k9mLVD+M6Yf7IMUyo93d42auFvluqNB9tnrLAcrnFXwuXwac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 07/16] block/reqlist: reqlist_find_conflict(): use
 ranges_overlap()
Date: Thu,  3 Mar 2022 20:43:40 +0100
Message-Id: <20220303194349.2304213-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b655ecd5-f2de-4e60-e8a5-08d9fd4e2f98
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB47362A776213A30B78D5C447C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWFMXbDEAuMdRsjrmZVhm4oGzyvG2RO7VeENwo8k9pVKI5rY9rwcthEWmxhWqicxpCO08eJNjZrzS8RnMALb05PWSIGT4qbCUGt7EIzKVbuznkdlNAi9K6EfaPHX1CdMa0gMg8R1+jfHzkiDN7XUQ1g6gIGRvYGHXP+gyR4J+fOf45yoeibyEpM7yerHoqr0qjLJY/LyYmozZJGUiCGLzaRy8GDEL+MStWRfxChcMB+vwE0gwXPgEzRblPNt6zRyCcO9z6hv2NnYP2TFVgbergyBdfMEOLoekdw+xL88pvvT/wbe3lpyfUyCDbS75xpOOSRxWPjlFYPg6JA6PI0tslrQUg5dPlIy0Hr6s2rC6FL4dD6tt5L/9R8RGWaFU3kD2ekZgK/wN5In0qqPF/Q/YM6mr5TpndUKv3EYyC61gGJG3guQetypL83dp6HnrvcELeZ99DRgAFh22GHrULmh83fWB9b7bRgDBk8WNLd8aYU/mPagI2994t/g/VKsT9pB7G6KEbzq1UEHkH+zvFOPGcBwKuF2L6pBnpQNFAhYY6nKBPY7xBVmCofIL571nD6oZJ8gXWXarm5XsL4vrx8iqmoLTC/9BDrsCKJv5skyqfe57Wo4a49KUgsa160JWHgtfHy9zmGxmNwMA6Va+x1bsJy8U9bf79mlAYvXnQy8tq155AwuGc/3Co3w9POg1A48uXCVE+/dbki2S1KwBdgPPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(4744005)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+abzVjYIvRxZObYbsJ5PtqOOlfZi8V6eEVdcnfSklhGgD2J6LVXjZVTmq9Kh?=
 =?us-ascii?Q?lr/LjAUyPgsz8lknFnAP17eGNAzjTXCnmN4S/cAX00vi/QYdYiZFJ6pI5+K5?=
 =?us-ascii?Q?H9vdzQ7Sx/wChtqsnHs6pH2bczSLUIhFxfZ9Z2Dn7a1fUr/9owDMufhZjosh?=
 =?us-ascii?Q?l1M8VFIa2JcyHFATAZ0kpu3Cn3JK5tXCxheWUWz/eaLzxrDxe0vX2ZpE4N1z?=
 =?us-ascii?Q?dRWNjZegmPYdN6yrml+JKSKztNDVbOUE3CGeZHyZ7kyIXIkQtLZKiehnuV4M?=
 =?us-ascii?Q?07bEHWKz0dE5m+CC6Lx+3DvvCERteqT8LtSpw4HfLd34faxHAFMJgFnqeDV3?=
 =?us-ascii?Q?o6bX23y+SnLHrfTp+chyYpGvu2bzq7MDJCSKL+p9uT+qRk2sF/hrHXPWcjAV?=
 =?us-ascii?Q?zyK8X+GFY/RsKyXq+IV8/OZ+RQ3G0iCtcbw8/lYgSaZHYEFQNn3sxO0TaMf9?=
 =?us-ascii?Q?8rFuB3Wg2ZJtBKFMShsDKbd8llD+T58puVcKv8PYkfgsoa1ycV5Pj8X+hZj7?=
 =?us-ascii?Q?Lt9NcXgN+bdnbhysRK7Hf1rkioSKfd4rEXcmO4Rwo8lC1/aHa5R5r4z+02Dl?=
 =?us-ascii?Q?hTPwu+oqht7gXCtK41IHS6bf/4LTCpHlxOLUxUxyjHfV+71mD37s8MFZ4IlP?=
 =?us-ascii?Q?DaUmhEe8oJ9zIyIb92d6Cp6/dOvRTXUGegFUhCOUNZRQ27Vq9r2zgrlNXXqg?=
 =?us-ascii?Q?b4XpoSELfTOxA9kHZPhfohW8H4gzyO+ob1C688soRIsEvjolnLY8i7Hw7qV6?=
 =?us-ascii?Q?vxce7BMvyKA2ysCSDh2HVr6Gy2uoRZeQ+l5lhLegJNgIt4PkPYoFxJMZOOaK?=
 =?us-ascii?Q?7rZ2Cqp2oVCVN2J2+EsLDTD7gK7POY0a4AFItICwEi+yFnc26ABvOT6PJxYB?=
 =?us-ascii?Q?EMXIPnQ3h9L9wlNavpuqqdrDnYZWPY04SaqRh1JNwaKWO0dfZQ6IqRfpsUIP?=
 =?us-ascii?Q?H3zrnV8DHtTTGLr9BQllQKBLYHqZVio75tdlOlibFtnBFxww/weAg7EQW0ke?=
 =?us-ascii?Q?mIALEtN9fE7ebg2ugBM8s/uxxdOFww6d33zig+1USruIYigiV66hcO3mwJV8?=
 =?us-ascii?Q?aTEibpgEm1iq6ie/Jqnh8lsIVoUw8bnbTXk2UKGr1cmZmr/RW5CRSo30qZpS?=
 =?us-ascii?Q?3E0cvgRRAMFKUnKmGoinYbHbNaxGUkjGf4HLyf1apb+6X0cqs13JLTYXYdWt?=
 =?us-ascii?Q?4UqfWzzyJalX+u8j3T1b6pOEfPCqXsJYvSUiBVsF1+XfCloliyFs+QydiVAv?=
 =?us-ascii?Q?D6yRxxX/mA0sUHGoTp/QZfW/k0H5cY1xhr47RjHou010VLKJZU5TUI60+QEP?=
 =?us-ascii?Q?T/zBdevbrGoXEfZRfqLnh4MD55bENBNdmutF76CI4OYVIeWiaa8NnmbgNzSG?=
 =?us-ascii?Q?hMpVHrvuYv6gNqf8caCN+Lz87pPdCzZVTdXYnrAaOxk/3tmuIOcyKoBMsnin?=
 =?us-ascii?Q?AdXyALlfGA5tqnaD0HobBiPC0Bt2uVqbMPHq91SJ4Qfsi1KJ3AkrQVmUi/Oc?=
 =?us-ascii?Q?nBlBkUf0NmoXQux+DyiGKocG+EnzFaHNp7iFg8UyhVVWtJv2EM8wTZdDhcqa?=
 =?us-ascii?Q?Kk530HS1FER+vGjWBWYHtwTFVBbI6CAxbL0jL3xfTCoApcv0ad3oxVVyqGxS?=
 =?us-ascii?Q?0sY3WF2KOJbjcTnafTRI0bGlSIdOI5Iy4ujQ/pLK14Vzb3nP9yJD9neShQHk?=
 =?us-ascii?Q?spTdDw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b655ecd5-f2de-4e60-e8a5-08d9fd4e2f98
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:09.9024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qV3yE9YA7BnR3ApAhQ/cz6+zQKJoXcuChffSQMVCtaK6VneizEEJVeiKQbdac/I/Jqxv1zwhvHtZIBBClGZlVpmS86BiNqbxv/05okgxeHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Let's reuse convenient helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/reqlist.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..09fecbd48c 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 
 #include "block/reqlist.h"
 
@@ -35,7 +36,7 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
     BlockReq *r;
 
     QLIST_FOREACH(r, reqs, list) {
-        if (offset + bytes > r->offset && offset < r->offset + r->bytes) {
+        if (ranges_overlap(offset, bytes, r->offset, r->bytes)) {
             return r;
         }
     }
-- 
2.31.1


