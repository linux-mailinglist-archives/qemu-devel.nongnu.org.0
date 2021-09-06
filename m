Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DE40204D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:09:53 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK07-0007tc-Q2
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxc-0005XQ-Om; Mon, 06 Sep 2021 15:07:17 -0400
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:34209 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxa-0002G7-4K; Mon, 06 Sep 2021 15:07:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPRXeNNdISanqEZtbdNfWiRnMO5Tp3r+oADXKw5NLLsib9wR4xDOSyDsihnLxe8StvqLUysp4z2ER17so5Jov6P9bvfq6piN85tOn8FWIOTp14Ea357eZwecxY1MdlBKfYsL4lp+Z41SuoOn19Z3lnTM+I4UhiZANHfsXZcejzVN6a9j/bItyMvI8fmHDw6GAKkbhNHy8KeubIa8G8jB41wwhzLVQV/3/hYvqwORfOak28PlRt0S0tfujrGy3nzzyKeUok4gep3+kpp1D2wGGcEBdeGknMplqoBs+UvNQvaJAKs6yyDBCosahebVXnruBEtwOBFYFAePKuvOdjbEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=p6A6rdt5gViLesmH5ovI1+VQkhBE9y0YSkimt38CKWo=;
 b=CpdscptlQ5o22/cokwXq2UdZrB+2hEVnefx3z+GH2PQyX6oYnYLvKVvyw6RCnxsqFbEyypfUd5xfbYmSt1VBER5cIJLDGSY/qcGwLirZPjZ730wKwuCrMx7wdbLNdvWsu/TG7YRP6DrXp7OE2ms+E9zrckwfNvb5zA0r6wGrQ+aKsnYaKv0QGkYO5B2Oe9YOdWWckezDdFtI+m+pQS270q2ow6drqsfdLz6e+2Hj4F79nYTo3DPk2B56CKXExIQk0RbSiNXLZgB8IOYRFwgcClqBs+WX6rUbjUXIWDWNX+AbNJvNkkq6o3d+36y++778jJWIK3bX7QcSa+Ntx8YxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6A6rdt5gViLesmH5ovI1+VQkhBE9y0YSkimt38CKWo=;
 b=oyr8xzCvpyG3PHzD3+xWD7m4z+kOrS4MorehQ97Rnk6S3x/0ShC+fX4xvQE9Fcvfpg+N0fccGgGm7MjxEd/gA9j0H10bNE4V6Ey0BpTSeNX8rQQW+59zAUB9xu29F5oD6GI6iFMm374THghpqqu36cwgV8kGPo18fKhD8zYbRK8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 1/9] nbd/client-connection: nbd_co_establish_connection():
 fix non set errp
Date: Mon,  6 Sep 2021 22:06:46 +0300
Message-Id: <20210906190654.183421-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 135c5abe-12cd-4188-6f50-08d9716986c2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60381C3D3B50D8A0F820AB00C1D29@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rNoXdSx8wOd/xglWE951AhA7v6xvoif8sLNTUBGO7WCTT1teGmp2qe+v5+0qkm8qHVvQDr8Hv1+CEOIl6OjojCO6eExebPIY8MtHuw7FOA7KAK6kN0DGkKRWksASbwPvkMi5sH01tHgB9sFq0m5rgni/040eotwVv9nb8PkAiOzrKtvfLJ5Dt6pN6iVhYVTYcdzzl/Ep7U/dMETWeQIa7IyyAslSl6D2lwbXPfrT88U7SXoYo4HqfTqUpbQ3uyZBRj3Qi93TgbUIFpcn87nE3IvYNuN0OAe8sIFXsE17czwaeJxuCJcIWe5de6DO8ggHTslRSQeg9o4Vxv5bZmJk5L/5WKA/nnHxwM/AUC74anTDuQe8pir4aTuoulYaN6ZrzlJqHAZwaX3epxiwx5+hgPhC6EVDze/a63pltv7kysZMLOnZAcx1lxjegFJj8l9QrbPSm/+waBGTlnjhApXbL8KACeigzWg8U8UlTFvM469bNmrguxF89V3sOxW4Cv1WDZY4dXunzrN3SLCuKiMW5/WXcFn2gj5H0wSrSfUiv07n6CBTzbsInjvfCYcya5vTeXvnO0jR7ThzjXIfax1IQijEUaFWECg++DvGpENYbo63+GBwGhZD9ocvtnk3v6qDfbNNMsnZKjjRkjt/7xxCwwSZ39dUWAy1oSfa3YxvxlVMllSUZdH34SKdQZCAhSroK+GEypuIYAZLH301YPT3tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(6916009)(8676002)(6666004)(2906002)(956004)(26005)(66476007)(66556008)(66946007)(6512007)(186003)(5660300002)(316002)(52116002)(6506007)(4744005)(4326008)(508600001)(2616005)(83380400001)(38350700002)(107886003)(1076003)(38100700002)(36756003)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pEZUuyr+eL3ZfPXhMcB3XeAqbgO1aXzpEN2AcMclE2/uNOrTGGmRHydmUHX?=
 =?us-ascii?Q?RJx2eMaf4eDb11IUaiQpsZ2CLPTiD3MCD2YRIxOmPqLKAQyMPVCPqgEz4Opk?=
 =?us-ascii?Q?sO8bNTqxZpalVRKO2vH5JvZRULPstLqsk4M/BGNwnXyBvpcLFsqrwmb1L7li?=
 =?us-ascii?Q?GPz3HfWKtLRs8ThRPGa0DYe1TFgx/09+lPWtKydzWtPKZ6+MQTjsX8e+CDVh?=
 =?us-ascii?Q?O9l9yvrF1J8l2KUumkiIjHuKJBjNygkMUfgCmj5g6yOTy54sQNueSDKc+luC?=
 =?us-ascii?Q?P9zAKC/QGLyhevXaCY5+NzSsk1AKlU6YYRFktjpKHbUKwd1FSQmoD+NdKV/M?=
 =?us-ascii?Q?tMtiU83/AuO6fDFg7pIt7krG2Y7eHSxeOzAhCSjWSmWABm4wpV6snXbugiue?=
 =?us-ascii?Q?3NdZMa4/SESPwE3jQezWxIK+p1UnA4ApORjpUAyTM9WGDHVi7DvBN+gEIvqO?=
 =?us-ascii?Q?t5Sabtc9hO89ypQJSzM8DPWIlTZ//BkkUhfLdgT7kz242iWUkQhwEf3M3mXP?=
 =?us-ascii?Q?Ny2QykVCrBzZt66dMPTjhYqk9/0ygBemcBCxYhRj3Ai08GDfDoMp97ZBupKI?=
 =?us-ascii?Q?BcUFm6h3X2baEH5XdHnExW+C3qNxQX22euNIzeMRYH+j1U+hfUcOsD/GetZe?=
 =?us-ascii?Q?1XgnIrCi35N8am19DIW6fS+C8wz1pFWRfYE/ggieZ2QujPZlGPQCJyXqYBcP?=
 =?us-ascii?Q?KO701G6L1K5AXT4BrTwfF6fi2qLB+rclQ4NGCzxyqXv+E/b710Jfd9uen3ma?=
 =?us-ascii?Q?hLKjSJd8xC51WXKs+9jjrLNYmbd3WiuPq0Wtl8TZDIqzmmgAT5JPPTu1ZV2M?=
 =?us-ascii?Q?unLhDOqnZcA+sI5cnH29mPd4LXfvminRdVQcaly37QttOQSk1qMhEr2N30gI?=
 =?us-ascii?Q?D8DkMAnLtLIYpowd2IRhAdig62XGtKaBZD6BmXvTTTZDPB21SeAiIu5NpwyG?=
 =?us-ascii?Q?HxWFCg4BWUtN1pfSsRTsxmXD7IjMS4hpb5fl+0/cTgeikGpnzZjYK26E5OMo?=
 =?us-ascii?Q?GNVVxeWuPZ+iDH45MeSJW0gPf9fqnF/Mz81l1gWK0Sagg/40srSfrXGzfKsm?=
 =?us-ascii?Q?9k1HdMjlKbvdy/HvZszhCF6JHlL7cR6hGnOmbMyS4MoH4TtfZlVo8MzfJepa?=
 =?us-ascii?Q?WJ1O+QVSeSzhiTNZHcnr2KPsX8AgYKXQZdxemYQlprCOTd3+C2aTPvRSP8fC?=
 =?us-ascii?Q?VJtRhA6qvEsOK4DjHxk0pgSvtCg7fpoigKwIB959Aige5bzPr6qBMSJEeC0u?=
 =?us-ascii?Q?FuKNi622o3yttgOq4rkDIvCpYYwecJidVjOiNW68ydHXeHRy5/9wShc+R4Rh?=
 =?us-ascii?Q?C8scsB8vVN8LNf+a90V1hsTr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135c5abe-12cd-4188-6f50-08d9716986c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:09.8260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArngqNIlUiOtz5fJnfnpDCKkL3PJnVyrOE0M6miOxHFRAXYZfAk/+dYDxpE5QfMOyvsSk5opwXT2pAwy1WDLrgwgeu2wuksFxoLSSGtg8Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.20.98;
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

When we don't have a connection and blocking is false, we return NULL
but don't set errp. That's wrong.

We have two paths for calling nbd_co_establish_connection():

1. nbd_open() -> nbd_do_establish_connection() -> ...
  but that will never set blocking=false

2. nbd_reconnect_attempt() -> nbd_co_do_establish_connection() -> ...
  but that uses errp=NULL

So, we are safe with our wrong errp policy in
nbd_co_establish_connection(). Still let's fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 7123b1e189..695f855754 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -318,6 +318,7 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
         }
 
         if (!blocking) {
+            error_setg(errp, "No connection at the moment");
             return NULL;
         }
 
-- 
2.29.2


