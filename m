Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66624B9216
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:07:02 +0100 (CET)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQZq-0001Ee-0Q
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGZ-0003sC-Cr; Wed, 16 Feb 2022 14:47:07 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGC-0006Dk-Pm; Wed, 16 Feb 2022 14:46:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feacJGpDqY8X/YB70M+s7+ZhCXpbbQGxognqouUvhLdDghRFp7Bou4KSO0gIMA+HS1TJkq9IkifZGtKfBJUObnvYDuhrFk001R+pE5B7oXAETIb8cyB4eJ5LcCJyqTLo0JcULDiRY8P9unbNvY3ypK3WNuMW8GScb1f8AfMB/afpcGFreL5LAvDI4MjS8G6tlwbQhySeOn6qNiyoPyUffEUqzInI3Kkeu8n2wP/P0CC2OP/B0BlHjoDAfE8ASeSM2UOH//tX64uGRInipu6/XqIlrBVQptG3QpNL0F5jyOGQCjMii/kPWxnXXTK0vrqBcwf4Hvme5pJA5tjlnPLApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=gd7enrzqtebqk4nGGX6ZvX8MKHJcUa9LDjWCfYj9Yk1CTFx6LJx47C+vEeTbC3rClx7yJQiQsWPF1LJ6TzwmEPWh3Pe5KGqkNycrFlLZ7eRFN04BbYmkSD3r3/WTYUS1BGbdc7SZAjBOM0CMo+WGnbvtudxE5dfl84cQ9a2iXK023rFx3zClza1DOtHLv9T5f4Kyjw6eYE6GB6OUQyRSwtNfRJoPKDRJlVkZ+S7EYdkFEhtgAITaxkljriRMeCHf4QlW3eNVmgyLXGXGLwln6Em4fOMwhlEWOtE0eUFxeP2CzRFc4hsDThw9klabjbXqhCFehpxfezCn5zNE/aw4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwtkRFZsupCHj5xg46xDbUv6v3iJOt4sHv5qvsVGsLU=;
 b=itdyTigYz45nYFJGoopoK0A5btnGMHPC0ZVFp2Kfllcka9LUFQ40mBWfHTWWB3Mthdl6wd4jjQhIcMLsovc3QK+Y1X72xAjIxBw9L62iqWFcQ+LCg4o+uAppY0uBV0CnFOqhgsDGhvruNizG/BwYYD1LJFX44+52xBUYtVSNXnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 09/18] block/reqlist: add reqlist_wait_all()
Date: Wed, 16 Feb 2022 20:46:08 +0100
Message-Id: <20220216194617.126484-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db266209-abc2-4e19-1b8f-08d9f18509db
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851DC08809D1DE331C95331C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: louF7vqY3MLwRnBhMvoi6Y/4ND9rl03CDXyXgo4MbnoZmMXlCavuD37phI4kFB6Gnp2IjRrJHQPBdBZ/CSIdSq3uXzDKaD0WtLr6Y6yf5VwgSme05kGaagGCsDauRHXhnaBsIZnh8KtK4OQYyhYsGmmR9+OGlmEmUXB/+RhAqwsIDbidQQOt6b2Gk0qV92KMI+/qq8UmSsX2W8E0HAZUGR7/LCDDGsLSZ6DGSYAMr6W66q53/QxWr504ZJIHZCr8WD0sVUEJoWAJmwrYHjH4r8f4SJPPs0mVpGV+2FiuF2AvMKQ52YIWg2qMt/Mok0N6KwcD+j5n/Home5VX9clCMaG3LO0hKlWAEdxEBwt89pxYVQbPhq3fSc7Ln0AlJIFFLHBE6bIGBzc+g2BlLvZk9zx56v1MtDkxQJsSwcXFCgfYZNFmLQ3HP1/q71jgORE1Fs1NCltAz1RvJa0BC3HxT7+n7TAjd8PmGh3fMpm/GuIbEyx/nhqasjBYmOm4h7wfNDNo6oqHo29CSwajiwtWSvqhzZ/Hv8TyocPQYMBXVYziQj9jclOvTKNmtvUoVC3RBlOJaDGav86/hrnmwWhj3hyQK2jiXAXdpS+zYn/WKrOr6ZwHohK1rnqoPa3v3kxDVbo+d+Ln4n7dEykZWFvJj4QlhpN48J/XMjbSJwXGsn4FbSi9lsJrcTKNY7icrpNNdzHH3O8n57NBXxnRp7eZfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Du+qJanFesRzcmAJ4vYjE6f8pt+QbKppx7C1ylKl0yRzdpMqLqwcab2rBgfv?=
 =?us-ascii?Q?9M9QU0YRsgB5V1ZocUwQBnYWrn17KAw6tkntKjrljhMjIB6vCile2P7Ds0JD?=
 =?us-ascii?Q?j9VdVQTiF732z4exYjj+5zvoPO0ciSJSRJAHomAfJ9pBsM/nIQQ8KlpPWUG0?=
 =?us-ascii?Q?pRtwxU+oCOV9KdR3HArWrCTSWMTkaiiuH247fl7Y2l0XfY7xRsJfQSCsp9yj?=
 =?us-ascii?Q?l2hulx8Hai6NzE5cy9X/lq1JFXPx/w015K8mM9IJdIn3GnHIT9U2wxG/Xm15?=
 =?us-ascii?Q?0zOsL+NiD6C38yCsme6CLnhnpNoLMViIXZJPYEmYsXe8DOrkcH3ylPlZA8by?=
 =?us-ascii?Q?+C0KBgW/5QrmGLLaF4U4/6cRF7GN35Rd21xFNY9QmBllXimm39wo7qi2QnOV?=
 =?us-ascii?Q?WPswXB+1eZ9P4/u+xaGzOD7A5VB1S4eKQNVZYuhDlRGBQ5YLejWkMdqWySgq?=
 =?us-ascii?Q?5ZaPEemvS+6tlZLBRU6pgv+m26j6xPNWK7sa1ym1EjnWwqF7gj5iGJD4CcOT?=
 =?us-ascii?Q?eEGELmYjpO8y69CfMvIB69VZG2oVZC2AaNLsr0FlJFtAwHgqPxsm7MD0gfd7?=
 =?us-ascii?Q?JOiHuxKI3aVLojvrC1vEjJOz9CO7xgPcl7amZiG4yDGfewYMV0bHq2sBPEID?=
 =?us-ascii?Q?5WpHrAuKj6LqkEjmnasvELiwsMYLcFkrl4yJW5J9PurIu+iFwXynlvMYI5KX?=
 =?us-ascii?Q?/E6GYRsLPOZNKDXGhDXn6mvE536fKFwHoWDU5nfAo9p02GzYMzm2y2iwHxOB?=
 =?us-ascii?Q?Vc+71c6At+GBvqrhQyiqAjZEqm6S5E4QO/gkI4EItDhT8WOAJlq9J/IB6WWe?=
 =?us-ascii?Q?jDGcnGJ2CD6hH9ZfePC860rropijfRlzC4OEMSVTz932v8KzQosOEAcNBWq0?=
 =?us-ascii?Q?py6ct86+tVaaAuf7aoBP9GxB0ycwOSHq+zJA6f0UPtLPJ3MoxZF/aXSl8cwm?=
 =?us-ascii?Q?UCXH/pzSic6F258Q7mByz/7CqJ7C8wj5+FbVl9mh30uWsFmzk1NjFdz0m3CA?=
 =?us-ascii?Q?HMSnx4ezNmsiJ+vpEH0LT9h0+f70Gw8jwVDqhMCpIzR1GP2junt1x/VSTJYJ?=
 =?us-ascii?Q?LE3QqOfLwR/PN89zgNAtIP6j+ZgTNPJEQTqGKydJjFDe1qyVfejbFiaRA6rH?=
 =?us-ascii?Q?pHsfZLC97rECil3VsfhAfqF264E1eX7/3G5vxavTCUkHrlhQ7MXHiV8pWd2t?=
 =?us-ascii?Q?6HJwMutwDthTeqKBZy/aV1BXoCwz1THjtl8AZGgls88JJtozrnF/Z9EgGZH/?=
 =?us-ascii?Q?utt8jHONR+KXG1w9iOYNo6Z4hF9NIoAMeDffSQ1D3GgVgZwFtu70neGxgv0S?=
 =?us-ascii?Q?ygHjYaIZD7onilvorBM1yRvqJp9JxqB4CxVG7IjEplKPLkg2WaAsDHOSrzF3?=
 =?us-ascii?Q?fx6Cvszq/p1o+RQ2l9xhv4ReUKlZlhibUvZ0iZmG6bO24y/62A7AvkRGcxPN?=
 =?us-ascii?Q?3Mu64JEpqUMt1vrjaex64E4bAWbuGiVhHdFD24FrCWJ186s2t4aFhVUkpzmk?=
 =?us-ascii?Q?8HeeSxr5FRt8V8jM3guEhNlQneisFo0N+11Xhek/skvecrGcYnjZ68pTNL12?=
 =?us-ascii?Q?A1UlJfBj1w/B5+8/Ty0jDiYxMTdD5w6R67qVxU/H7nhgzFoF6KEY6wKT9Tir?=
 =?us-ascii?Q?nopry2z6G+7f+lPXzHdCwuTi48C9ZNhhdT+1njXXOvhXE8jLKveBm77nclZO?=
 =?us-ascii?Q?X5mZ7w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db266209-abc2-4e19-1b8f-08d9f18509db
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:38.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbXzE0fDO8XnmjjjwvsTS7AZ9Kexr8saKhxPzqFj/CAcCY88L5FHs0dDdVJSMXV7sDua4GJvnn9K8axp771hgcGxyxvg7PbbrWOHOK6i+eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index 0fa1eef259..5253497bae 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loop, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (maybe some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 09fecbd48c..08cb57cfa4 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -58,6 +58,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req->bytes) {
-- 
2.31.1


