Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129274C6B5A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:56:43 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOedr-0000M5-V6
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNl-0002DU-IQ; Mon, 28 Feb 2022 06:40:01 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNk-0002MY-5C; Mon, 28 Feb 2022 06:40:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5di3QjUgvX/MeXfZ3O0X17nTPFTvVtgH7YRrEtao4VODqFGBkdTdvsLrBhFQRStz3rT8bh4xudG34Mhcct2YECjhq0bFg8UuvaP7VdG8ogzdDYe8AAnuAXBGAEwK4T6ugxiCW+5iVCFGhZMyQ5Xfi2YqCLTkT2OkQIJ2/M1nXXxM3nDznj70cgFUdv5XW0JFI76LYItQHHSnWdXchWPxShSkI/aGYDqJWFV7t9hEMXVqrIFkZoLH8BJ1AyVfa3Uc4w7+HCg0RtH/MZcBvospX9OK1FYbC24nnNFaAj+zqqhSjbyKPPml254j3UELe2sqNh1WIOxLvIerzzjoIWTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfaHUhbRyFa1HNmcSpumz+kghFfvZXfWDVh7vE8MydY=;
 b=EltK3W2WZCS1R0HMnCfxnXeN2i2vSdUN7h+RBlJC4irAoCyPm4wbLGvg3lngp9reHtjIld/30Zdx/24JXRTt4PbT3zmCYDz+lDKcvBzexMgiWx9P65F8QWnvpN3qJp7RM+EWW4sMvLJC50wBBvmIEqX0TgtFALPZwZCgmSVLUCP8dxOdJD9B8u9WzMfwbHb/OZO6JKfh+lvxYptmGyqgmyIslwGLL/h+cGSSyK0JD0E4iHfLxaU3KU+YmKVFkAMCthlVN9qz6bAsnW4EMBla9bsvXBJcRDPk0iu/ZslhKTyqlK+OUsIoIKi6N7yzoxYmTQLn5Mg3adjoxX8aHF15gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfaHUhbRyFa1HNmcSpumz+kghFfvZXfWDVh7vE8MydY=;
 b=Xmw5UO1yeeK215b6xaHVE0NlukpUWaPaLQA3848MAF8mQOawQDH0pvKixIesIPcq8NtpY5CyW13Oq9cC7lcAg4bEL/pTmBL8m4Kx14HIUXzfQZc6ekytGKuNMoL2NwmrTgQvNqKz5jill0Kp03R2Km9cocIyhSqQRKAjMc+HtCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 07/16] block/reqlist: reqlist_find_conflict(): use
 ranges_overlap()
Date: Mon, 28 Feb 2022 12:39:18 +0100
Message-Id: <20220228113927.1852146-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b4c89a-3229-400b-5bab-08d9faaf07cb
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22722DB7D2600894C02A1230C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eL3geYWBPkpArWH9bhvCxT8H+cXXL8SRpaj5Gs9Fulem19sF3rUgl16YRcx+7I99uIwx/pLFVvUZxaHnYvl8cOwfodEJxitLfMKRRqsigcDDjPDNszvy4B+rJwwtWCJVq+78vTKQvLeUupbTCM/J8Ff8l2B+wZsoL867TrjUbp7jLNqfp8kR7L/VdxK62T/2z2XjwACaKLYtktu452cRKw6TY2XI7KPdw9erOvrVpDwBByvwoSQBC/y0e7dgkk7y4ZZA6wyeqc5QztyTwaj6AyvtJ5pOm7DgZZloyrx0e09MLD76HVSqI1T6iYtvWKsnUAk67skwV5G9F/A/pub7YER23ioLq9bcw51ZSKxusyv+7K6NuBqmczzyt+tyxZ5tuzGd9XzxWKUTQ6Uk0xzM5n0JYTzZNFjZ5WskZLMznnVMSvf8t4WyyLDO1LbBCvxCpBWC17XfQDnpcvIi5foSDcBPnn3mXWCgEqiLN2NPmNvX4ZCTxZOHG72/NuqJfMsSGHtoIdE78QNskkErr4NwIxrpTu7Jek9FKt4i2f7UNlKY2ug+Vn+OsViyouHPw4fYNeQRY6WuCNJnhydWMNAkwh2j/L5C5c1xLn96y0CHaMdH5dWw1GvcwOFaMPWJAgDHQuYCuQSs38MjZOSH1jdlB9tb4hqrkQJejnZ1bKquDCClOXk9gU2Q2fsS4cJwWBlrn5Bdii65KoPx9PWZzAFzlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4744005)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L8u6wKt3HOQHBb+M2XYfBJcvcYY8vQusKk+qQ6MrBwO+G1oz0ZXj41ZnYcdn?=
 =?us-ascii?Q?r+nCwnurmCVSXXyHxLe8z9PhsBsomag2pm5MBySVe2V/oZG7/dFWDqhMY19M?=
 =?us-ascii?Q?3qeIfvtSjd7M0bebIo54phRF8VrCsG/JlOy6WSPfnzEebxO9tOsSfW1+0G5i?=
 =?us-ascii?Q?x0YRr2LwX/DNBIBb90XqdSAS3IZY+xSHfTGUhjhtdo6Zur1en2oM2W0y9qAe?=
 =?us-ascii?Q?5ZGTUQA2VyM7USB9CO2zJJCxA+hwQJRxkqemKukOpSmvTdgXJdJWElnhi2oU?=
 =?us-ascii?Q?YDfHsE4zWu/6nuosLaUMuGAt8lhbCHBdtRJD+K46wcGgMLrbY/7Qyw0Uasa5?=
 =?us-ascii?Q?RKpg7wj40gP8SpyFdvLUY8rchuV9MqcUGAxA3MKOl+vmwGr+DY2skJsUlpeB?=
 =?us-ascii?Q?sZ3npV29xQmcn0rxSiANROIXMyk5b7gkOHA8qIQqG8ezHoe4xZikK5nA7N2K?=
 =?us-ascii?Q?2bZ4cHKkV51//wP47GNiOEahPasb5EKbqfDCay+LbVygdIY9/AU26vCTIdbV?=
 =?us-ascii?Q?zvmkWYC6GSs9nfNwcGLB2643RxYzuBc1ma5xb9b9u0kzRiswLhLhCflAC6Bc?=
 =?us-ascii?Q?pnlRFxMMJ300IvCV2QVWrWQNSOHNVVgp84m81wAhQL8hPWfYvlePUrM6h3zZ?=
 =?us-ascii?Q?eH2SpW2zVwXREF20tP63pGMfVfMW1rrVfg8az7Eu/VrVEfFr0EGJ1mVo7YpJ?=
 =?us-ascii?Q?oGmlzMPTYbag36KM7Yr6SFczjRMhkMPIcIKRNnYnKZHi+HBfnFFJGcy9G+jV?=
 =?us-ascii?Q?uFc+kbAYt0rAM/Cc6fUtVrjk39+2yoi+Mk5ZNdLgxSNELyOC2AA/nGbNvJbZ?=
 =?us-ascii?Q?iYaAgAK0zp9kA7NzMY+9wU0fbchHX9VFlYdtyMYkYyopWz5i4eJfBgcXIy4r?=
 =?us-ascii?Q?jaNy9HKoEtZ+xCdgwNc5+qH8nqGYyfp8A8shxOkapBxmM0dnhkOHFf08VwJt?=
 =?us-ascii?Q?5fjTdaM9lCggCNn4pgvu3xQfX+bbY2VV6htPU7BCWM3A+JeZl1HUCkEJ3wn7?=
 =?us-ascii?Q?Y5p5oFhOOfipxi6nuTDF5lNWL/m6V0mcgakERkMLTiKihvHDebZLOp6ga0X3?=
 =?us-ascii?Q?eBrLd/E2brc2CBCZKOD4bClP+7PZy7zhpadK99nQwb1eSJQQM6H1SuQFnXSs?=
 =?us-ascii?Q?60lZvgTXgHeXlSpposAqIWH/WCeo4tysY+tzcGKW4KE5smuq5f1wAoZqvTQs?=
 =?us-ascii?Q?qVD8BQOgE7Ub55+j5boTgeS6zH2yzfzq7r9s2fEfRExoWKM45uolwKXfdbH9?=
 =?us-ascii?Q?ZO0v1MypC5lpqhTWSyB+++FjdGRF6Y7SMfqT+BPTcXPk+fid0VbM+B0KlpJa?=
 =?us-ascii?Q?PWsALxrGEkGrgc+tuzJdsrcPLdcPxeh6GZbeA8Zjp5pJw8/Ji+9dYTDhzVLa?=
 =?us-ascii?Q?0hsVoqm9druEfUA9UXZoUtl0xom8p6EPHRgl9HqEU44dhJ054A3H9JmWWMAG?=
 =?us-ascii?Q?SoRw/1ZJzJWKy7NOtiUVZZrxPozihqQH+Ozy5HJIT0Y2n1WFhb+lj0KRIJNd?=
 =?us-ascii?Q?awtexbSWaIU8bYCY/0tcp1SkL+gF4YLD1kgWmRgQ36evOCsG5wbSwQZIPNWj?=
 =?us-ascii?Q?S6w2AV32c2y4tVNmZfqgmuYgLncVBPqZMpeja4STch/JxMKZgIs0IibViwvF?=
 =?us-ascii?Q?LPVdnzb6+rd6r4/ZsJidH6l97TutK0F0hNAHeL6x2i1D6jgORhZfFVmK6AfB?=
 =?us-ascii?Q?It0REQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b4c89a-3229-400b-5bab-08d9faaf07cb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:50.8811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH8ajQJ/mUEzkKTvmKl6hEDJH+yvrfJTTrRWmkaEXpilbNWogw+5fca+fvMThGBkOycOmCjyYW/l9g4tx8JqVZTJwJ3IplrpXsO+Sn/EzVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


