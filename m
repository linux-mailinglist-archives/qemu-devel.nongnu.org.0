Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128AB492B1A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:21:39 +0100 (CET)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rEo-00027L-6I
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r37-0003WL-Dg
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:33 -0500
Received: from mail-db8eur05on2108.outbound.protection.outlook.com
 ([40.107.20.108]:18657 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r34-0000PK-Fl
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVIZ8gE/4+I9pfsHdVxvLIdoEnd32Fa8hFQPRftSzknx82BzECQyiNW39lqPcRK4LShiEQoTkK3BW/d1fMNkh9pbGXrsT8ml4Z3uFfkRm6H3Qt8nUVq92rKFSfB/V9LYF0sDVqNntbAkdIetK+UBZZBxYg/oOzCV1R5YfFyqkZWIc+KpehVF45TT8T1ivFmWAjAnV6sFixqmHTMGFbAYMvgPgua357v7LfZW0jaTHOe0tipBOYqbvVjop1X+A0jfwWUVyofT4TjJnSVvUDCqGF9Ctt34vP89SntjF2AyhOlOfgk3bVNMGhPbAarmAZil8FBQM12ASWsSuGAJ5p01ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hh2PRLmUmjZ26xsg29vPn8mXmfObsC/LzeFTayHCok=;
 b=EM3cFcTPAsgyseGSZWCx9UH0F4gE5qlJC5yhUdDpUQA0xoquIUrOmzPA4tT6N49j8da6vLgQx1Jwnf5YAKte+6I0g4/uoF36IUi5t190xnc87r89Z6T59xY1Z5zt2pLSlhXo/Ha7Xc1qqA19/PUxQ7NEsi31wxZgmAIy+kKZ0IZ8AoFT2SfIRfNQhBC6yBL61waFc5Vzo6SWwExw8oax+Ik9mA1LsrSEqgk6KseRQQz5aIFbbvhvsK2hKoPAAwCzsuNSih1AUL6KaknBQcAC/2vJbLo167BwWjQBTpbgHtPy6IBOyNQaV7GRiyM0PRPamEIxXQwqfsAYoHpU6uQppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hh2PRLmUmjZ26xsg29vPn8mXmfObsC/LzeFTayHCok=;
 b=IqXeGe0+raILO8ORUhhnCxR9o2HNpjk5VqLm3kkUHahH7zO8YJ2ySaxH9x863pB9GgyPneefk1OFkZ+eEde+VfFuWRk7X6F7CtaLv1SkE9R0GC9Zv9EFktHSq6EPZ5umJXc1sN5tRe51IGX4lqhGjCb0rswOnRoRhn6ZqTgT86I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3953.eurprd08.prod.outlook.com (2603:10a6:208:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 16:09:26 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 16:09:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, vsementsov@virtuozzo.com, marcandre.lureau@redhat.com
Subject: [PATCH v3 1/3] ui/vnc: refactor arrays of addresses to
 SocketAddressList
Date: Tue, 18 Jan 2022 17:09:07 +0100
Message-Id: <20220118160909.2502374-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fee97db-506e-43e7-c3f2-08d9da9ce612
X-MS-TrafficTypeDiagnostic: AM0PR08MB3953:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB39536B3EBA6048AE1D829F5AC1589@AM0PR08MB3953.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72rzlETaF4shwVKCL+K5cO022b3WoMRcafWo8YQcxwawqoOuSlJptkR1XjtVTSAPYweIjbCiEd4wvhwDL8rptJjLMS6xRr/lZ+sUdh8WUzGPR2jqPnxkpI5eNPIcLE4dfmZg1mO1EVUA5DvTnndlTtLt+iQGTboeILDd0OJNpjfCfBYZcmP/S+0n+p7mp0t31946AwephnjhYb4ZICzUxRmUodYAYbUCGfaZhNG0CxHCcOuI7c1D2Pe16rP6jLhQoQwPjyYY1Dhd2xBNRVT+0qVJluqUM/5xJ5ndR3WtlM8CgHXDt/OYn65yqvyU7Z8H4tikZV/Y5L2uKTuBGlKsX4CMTCLt8Md9ZgqF87aIkeT9psTWAGieRYcLTVSXs5c7R6xps/a6WHk//nVc2JAldIwIjBY4aTS8rymQVffwQv78xTrrJiO37iuHGQUHrCgMCyYk9c8OSve8hITKwfgDxoKUfKhwyHNlCaFSS5jaeqrToyAB6nzCp5iYIDSrSODz+1Wcs/hN8ozzG+3B27EnlH4EhnNXgO9Z4QwOTqHzmFWkvk7ofLkhVCXNl8zVQOUP+cayKmwZbrnauKSvucWHksFkJG7yj0RojAoGpMFZDTtWiuYB9hsW+ST85Am1BT9sy/2F+oiEKPdBlZm9NGIHfUCFWyIme5bsgaZv2sbqsetWni66TqBPqm1cAyI7Pdn6UY5r6otuNYQ0SYIKZfRjKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(1076003)(66946007)(8676002)(186003)(6506007)(5660300002)(66556008)(38350700002)(4326008)(66476007)(8936002)(26005)(6486002)(86362001)(316002)(6512007)(6666004)(83380400001)(2906002)(38100700002)(508600001)(6916009)(7416002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZreDdIL200U2d5NC9ESmg5bGdEelBYVGF6VFB3V253WFNLY01scERCK0hU?=
 =?utf-8?B?YXZJUWVSTEVOQ0tHOXNQODRNRElyWDgzVzF3VUp4bDVETWd2NmZCbGRETi82?=
 =?utf-8?B?djZ1ZzFxSGJBTERZQmdtRGNrM202OWw5MGpoVlFaUVp1Tm1vL1p4R1A4N2p6?=
 =?utf-8?B?TTN2S21RaUhZUWVaY1JTVGhLNFBXZXhEMm5JMGNScStYQ2xhTEo2MXptOU1S?=
 =?utf-8?B?NXhoQnlVekMvZHQ3V0M5M3p5Ny9CaHpwNUd0VDJkV0lKaTBXZ2tLOGtrUlpT?=
 =?utf-8?B?Zk9hRVR4VXhFbTg5RWVXcFNuTXJvK1phdUU3Yjc2b0FCcXZoblhJL3NYQ2FW?=
 =?utf-8?B?aGI0ZnRZRzY5YjNSZjhuMmpPOUxzYVk3TDl5cmhkSG03OUFCUytGdWpPQlpu?=
 =?utf-8?B?cHZwaStpb0dGV21NRGkyZURvM3A1RFMzY3RMY0U0b1B0UGk0MjhRT21oZmRj?=
 =?utf-8?B?c3k2b3V3di9CaG5uNkFyaEJmT0lCOFV3S3hXL0Y1Q2IrUFlFbWxHNXFTbHlG?=
 =?utf-8?B?MldLVmhQUE1xTDk5UHFYaGxCQmx2SmNPTERGTmRFQ3FBbmFYNDBrbVkwVVc0?=
 =?utf-8?B?THJvd1pCUW5QUmFSQ1pIOW4wb2xwNHgzYU5oSExMR3RxQkxUMnlVZFMxTVEy?=
 =?utf-8?B?cGpyNjZsWjJsaFpQSllzU1E2OVN5cE5sR0VUa0EyRDV5Z2dmNnVjY0hGQkFk?=
 =?utf-8?B?WWo3UGJzSE1DNk9YYXZhVm9lYm5IbXF3N2p2ZmtmRTg4cm5QcFFYY2o5NnYw?=
 =?utf-8?B?N2o2RUNOM3J5aExpcng1ZW1lbHpEWS8zUCtMRUI0Mk8xSUVlM2p6OUJSNUU5?=
 =?utf-8?B?NGFTWXVjeC9pSEIrbHpxVFNnNW9hMjhpL2RpQWFYcUZBL0dJMkJiRXZGYTkz?=
 =?utf-8?B?RHBodUtsSlJNMzdXdEh1dW9VVUlJWjA0ZmhoK1BjZnVrblF0YmxmWFh0ajE3?=
 =?utf-8?B?SDRpR04rM214eTVPMytoajBJYnN6VmVoNVQzVVUwbk5nMEFYYTh4RHRTTkxG?=
 =?utf-8?B?bEFLVThQZ0kzbm02VHIvbXpNZGxmenVhRjExdUxJVEhoWitmeDRkT3k2WVpC?=
 =?utf-8?B?VlFVOU1GVDd0dDVmQms4aERFeGgySW5XVGdYbDVFblhnaUxyR1dZaWZhbHFY?=
 =?utf-8?B?WUhEK3o5aTRWMHZneHVIS2FRRm5UVkZIekFSM2pMYkhWN0RGS0pCS3hrR0Yv?=
 =?utf-8?B?blNJTGFHRDlnYmN6bHdLTlZSdHZhMWdTSytqU0VRRldpdHVYaE9YQmlGenVO?=
 =?utf-8?B?UWM2RHN5end0SVhrNUNMMzhZeThJRWNkZ2RONzc2ZlI2M0lHWm1tWEdlQ0JX?=
 =?utf-8?B?UmYxSUwwSGd5ay9kNlVoVzlOcEdHOHM3eGNEdXJBeldVQ2tjN3BLQ2k2OE85?=
 =?utf-8?B?NXVDc0xGdU42bnFYSEw5RDBDbTRybjNSUWpGaXcwUWV3bDFzQ0UwdDBPNmZJ?=
 =?utf-8?B?VitGc0tCeDZaQ3Q0NkZHcDVjU0NmcXdOak1tZ29XeWdxb1htVFQrejIrYlJH?=
 =?utf-8?B?aFVOTko2NDVmcG9zV2lJZWZOOHdRdEFXWGZyRTllSjFyZ05uQy9UelZpYzlO?=
 =?utf-8?B?MGFSQ2hpZmFGV3FMSDk2VDdQLzk4VW1hNjdxTFY2bU9ZL2NzZ0dYNWtiNXZY?=
 =?utf-8?B?RzJEZi9oZzN3MDI1NlVvUmxxbnFlb0dBOWJ3SFJNa1ArQlQzQVBTdkh2ZkVM?=
 =?utf-8?B?NUxmZ0lTM3N2ejJOdHk5dzg1MEFtZHcySGhERUhZbTExNzlZZDRxQUNpYkEw?=
 =?utf-8?B?SGY4cGVuQ2hvakdOMjlzVWVvWGhDa1BQRUtqeW83TlQ5ZjU5NXZTM0VqRW9W?=
 =?utf-8?B?Zk5KQ0hqNDczbEdsYWdXWUkxdzVJNUp1K3pjK2JGQ0E3N2hlYVhqV2tQY2Fh?=
 =?utf-8?B?L2pnRmNpa2VVRTZ4WGt2WVE2WGVRUEJ5Nk4xelBUcEJodC9udUFaS1gvL2NG?=
 =?utf-8?B?SDhUQUNQVUhsRHlrYzBPSU9DdEM3T3RCcEF4Tmc0bjRGdldNays1azdpSWg1?=
 =?utf-8?B?NTdsYjdZK2lLSExNMzFuTWZIb3J6ZWUraTBFRVRlcU5xU3BuM1d6dUFiOUU1?=
 =?utf-8?B?WjBackJjd1pSUHZ6bXphYStUdEwrZHZld0pZNDlmZXNQaE5oT0FVam9BR3o4?=
 =?utf-8?B?WURQdE9pSHQrUStkdCtrU1BvamdLV3NNS3JMWW0vSDVpRUk1Qy92RzVJd1Bs?=
 =?utf-8?B?T01PV1hzanZSSEpLUllBWkpPZ3JXUGxMZitDeHFxd1F4MFFRbkhGR3hnSjZs?=
 =?utf-8?Q?j33Fy4nYrb8ecNH7II85kr83sHFot7bkBpxOyljRO4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fee97db-506e-43e7-c3f2-08d9da9ce612
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:09:26.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7N8HhptquOFf8AadINjjIAB1V02E3Ro9i59bm20oMTsfff2D1F5XeNa6ZwRMxwcTmwBH6PY3lZIoZdRW8LJq3ZuHksXyJS4wvjzAyx+2DN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3953
Received-SPF: pass client-ip=40.107.20.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use SocketAddressList instead of dynamic arrays.
Benefits:
 - Automatic cleanup: don't need specific freeing function and drop
   some gotos.
 - Less indirection: no triple asterix anymore!
 - Prepare for the following commit, which will reuse new interface of
   vnc_display_listen().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
 1 file changed, 51 insertions(+), 78 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedc..fa0fb736d3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3812,30 +3812,19 @@ static int vnc_display_get_address(const char *addrstr,
     return ret;
 }
 
-static void vnc_free_addresses(SocketAddress ***retsaddr,
-                               size_t *retnsaddr)
-{
-    size_t i;
-
-    for (i = 0; i < *retnsaddr; i++) {
-        qapi_free_SocketAddress((*retsaddr)[i]);
-    }
-    g_free(*retsaddr);
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-}
-
 static int vnc_display_get_addresses(QemuOpts *opts,
                                      bool reverse,
-                                     SocketAddress ***retsaddr,
-                                     size_t *retnsaddr,
-                                     SocketAddress ***retwsaddr,
-                                     size_t *retnwsaddr,
+                                     SocketAddressList **saddr_list_ret,
+                                     SocketAddressList **wsaddr_list_ret,
                                      Error **errp)
 {
     SocketAddress *saddr = NULL;
     SocketAddress *wsaddr = NULL;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    SocketAddressList **saddr_tail = &saddr_list;
+    SocketAddress *single_saddr = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
+    SocketAddressList **wsaddr_tail = &wsaddr_list;
     QemuOptsIter addriter;
     const char *addr;
     int to = qemu_opt_get_number(opts, "to", 0);
@@ -3844,23 +3833,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
     bool ipv4 = qemu_opt_get_bool(opts, "ipv4", false);
     bool ipv6 = qemu_opt_get_bool(opts, "ipv6", false);
     int displaynum = -1;
-    int ret = -1;
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-    *retwsaddr = NULL;
-    *retnwsaddr = 0;
 
     addr = qemu_opt_get(opts, "vnc");
     if (addr == NULL || g_str_equal(addr, "none")) {
-        ret = 0;
-        goto cleanup;
+        return 0;
     }
     if (qemu_opt_get(opts, "websocket") &&
         !qcrypto_hash_supports(QCRYPTO_HASH_ALG_SHA1)) {
         error_setg(errp,
                    "SHA1 hash support is required for websockets");
-        goto cleanup;
+        return -1;
     }
 
     qemu_opt_iter_init(&addriter, opts, "vnc");
@@ -3871,7 +3853,7 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                      ipv4, ipv6,
                                      &saddr, errp);
         if (rv < 0) {
-            goto cleanup;
+            return -1;
         }
         /* Historical compat - first listen address can be used
          * to set the default websocket port
@@ -3879,13 +3861,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
         if (displaynum == -1) {
             displaynum = rv;
         }
-        *retsaddr = g_renew(SocketAddress *, *retsaddr, *retnsaddr + 1);
-        (*retsaddr)[(*retnsaddr)++] = saddr;
+        QAPI_LIST_APPEND(saddr_tail, saddr);
     }
 
-    /* If we had multiple primary displays, we don't do defaults
-     * for websocket, and require explicit config instead. */
-    if (*retnsaddr > 1) {
+    if (saddr_list && !saddr_list->next) {
+        single_saddr = saddr_list->value;
+    } else {
+        /*
+         * If we had multiple primary displays, we don't do defaults
+         * for websocket, and require explicit config instead.
+         */
         displaynum = -1;
     }
 
@@ -3895,57 +3880,50 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                     has_ipv4, has_ipv6,
                                     ipv4, ipv6,
                                     &wsaddr, errp) < 0) {
-            goto cleanup;
+            return -1;
         }
 
         /* Historical compat - if only a single listen address was
          * provided, then this is used to set the default listen
          * address for websocket too
          */
-        if (*retnsaddr == 1 &&
-            (*retsaddr)[0]->type == SOCKET_ADDRESS_TYPE_INET &&
+        if (single_saddr &&
+            single_saddr->type == SOCKET_ADDRESS_TYPE_INET &&
             wsaddr->type == SOCKET_ADDRESS_TYPE_INET &&
             g_str_equal(wsaddr->u.inet.host, "") &&
-            !g_str_equal((*retsaddr)[0]->u.inet.host, "")) {
+            !g_str_equal(single_saddr->u.inet.host, "")) {
             g_free(wsaddr->u.inet.host);
-            wsaddr->u.inet.host = g_strdup((*retsaddr)[0]->u.inet.host);
+            wsaddr->u.inet.host = g_strdup(single_saddr->u.inet.host);
         }
 
-        *retwsaddr = g_renew(SocketAddress *, *retwsaddr, *retnwsaddr + 1);
-        (*retwsaddr)[(*retnwsaddr)++] = wsaddr;
+        QAPI_LIST_APPEND(wsaddr_tail, wsaddr);
     }
 
-    ret = 0;
- cleanup:
-    if (ret < 0) {
-        vnc_free_addresses(retsaddr, retnsaddr);
-        vnc_free_addresses(retwsaddr, retnwsaddr);
-    }
-    return ret;
+    *saddr_list_ret = g_steal_pointer(&saddr_list);
+    *wsaddr_list_ret = g_steal_pointer(&wsaddr_list);
+    return 0;
 }
 
 static int vnc_display_connect(VncDisplay *vd,
-                               SocketAddress **saddr,
-                               size_t nsaddr,
-                               SocketAddress **wsaddr,
-                               size_t nwsaddr,
+                               SocketAddressList *saddr_list,
+                               SocketAddressList *wsaddr_list,
                                Error **errp)
 {
     /* connect to viewer */
     QIOChannelSocket *sioc = NULL;
-    if (nwsaddr != 0) {
+    if (wsaddr_list) {
         error_setg(errp, "Cannot use websockets in reverse mode");
         return -1;
     }
-    if (nsaddr != 1) {
+    if (!saddr_list || saddr_list->next) {
         error_setg(errp, "Expected a single address in reverse mode");
         return -1;
     }
     /* TODO SOCKET_ADDRESS_TYPE_FD when fd has AF_UNIX */
-    vd->is_unix = saddr[0]->type == SOCKET_ADDRESS_TYPE_UNIX;
+    vd->is_unix = saddr_list->value->type == SOCKET_ADDRESS_TYPE_UNIX;
     sioc = qio_channel_socket_new();
     qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
-    if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, saddr_list->value, errp) < 0) {
         object_unref(OBJECT(sioc));
         return -1;
     }
@@ -3956,20 +3934,18 @@ static int vnc_display_connect(VncDisplay *vd,
 
 
 static int vnc_display_listen(VncDisplay *vd,
-                              SocketAddress **saddr,
-                              size_t nsaddr,
-                              SocketAddress **wsaddr,
-                              size_t nwsaddr,
+                              SocketAddressList *saddr_list,
+                              SocketAddressList *wsaddr_list,
                               Error **errp)
 {
-    size_t i;
+    SocketAddressList *el;
 
-    if (nsaddr) {
+    if (saddr_list) {
         vd->listener = qio_net_listener_new();
         qio_net_listener_set_name(vd->listener, "vnc-listen");
-        for (i = 0; i < nsaddr; i++) {
+        for (el = saddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->listener,
-                                           saddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -3979,12 +3955,12 @@ static int vnc_display_listen(VncDisplay *vd,
                                          vnc_listen_io, vd, NULL);
     }
 
-    if (nwsaddr) {
+    if (wsaddr_list) {
         vd->wslistener = qio_net_listener_new();
         qio_net_listener_set_name(vd->wslistener, "vnc-ws-listen");
-        for (i = 0; i < nwsaddr; i++) {
+        for (el = wsaddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->wslistener,
-                                           wsaddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -4002,8 +3978,8 @@ void vnc_display_open(const char *id, Error **errp)
 {
     VncDisplay *vd = vnc_display_find(id);
     QemuOpts *opts = qemu_opts_find(&qemu_vnc_opts, id);
-    SocketAddress **saddr = NULL, **wsaddr = NULL;
-    size_t nsaddr, nwsaddr;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
     const char *share, *device_id;
     QemuConsole *con;
     bool password = false;
@@ -4028,8 +4004,8 @@ void vnc_display_open(const char *id, Error **errp)
     }
 
     reverse = qemu_opt_get_bool(opts, "reverse", false);
-    if (vnc_display_get_addresses(opts, reverse, &saddr, &nsaddr,
-                                  &wsaddr, &nwsaddr, errp) < 0) {
+    if (vnc_display_get_addresses(opts, reverse, &saddr_list, &wsaddr_list,
+                                  errp) < 0) {
         goto fail;
     }
 
@@ -4211,16 +4187,16 @@ void vnc_display_open(const char *id, Error **errp)
     }
     qkbd_state_set_delay(vd->kbd, key_delay_ms);
 
-    if (saddr == NULL) {
-        goto cleanup;
+    if (saddr_list == NULL) {
+        return;
     }
 
     if (reverse) {
-        if (vnc_display_connect(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_connect(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     } else {
-        if (vnc_display_listen(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_listen(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     }
@@ -4229,14 +4205,11 @@ void vnc_display_open(const char *id, Error **errp)
         vnc_display_print_local_addr(vd);
     }
 
- cleanup:
-    vnc_free_addresses(&saddr, &nsaddr);
-    vnc_free_addresses(&wsaddr, &nwsaddr);
+    /* Success */
     return;
 
 fail:
     vnc_display_close(vd);
-    goto cleanup;
 }
 
 void vnc_display_add_client(const char *id, int csock, bool skipauth)
-- 
2.31.1


