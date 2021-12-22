Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDEE47D795
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:22:14 +0100 (CET)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Bl-0001Pr-Qf
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077b-0007Yb-I5
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:17:55 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:46656 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077Z-0001Jb-FQ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:17:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igNdMIYTRbHqZV2xKPPkeaxy1Lgfp10ea+0Or75/C4UscSeQnghGLYhH75VI679pOmAbfu1aKFznMiWVqOsDdswseqRzl9tiMung6CPu2WK5GoDYU025WjD1jd0i1VdKbvRmEudgdZT86PzTMpAlMEvreYMVhBNKa1NSDwdGIXl04kkZNmvEF5W5KWoCoBLSoPbVVdrBQRduEGnyBT4FfENvSCDt0Q8TwwK4GVMNCaRI8Oi6/6WozXUFYePDMyTHgzURWxRuH9StH4AkPPRtzpLVOX/oe3X1ahn4Mo5/Rvd9aeSGiDQ5R21reo4HgJ9lrZyzU++xXDvzc458O2Jfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NxReX+zZB11T3FWg1GzCru/y1F/eQ929AsgbRqO0ro=;
 b=B1oXTxpcbgGfMAtFn67B7e6l/rrVAEHc1scXPnUL+MacwuQZWNXvqXYpYg+0bQcH1+1015F66wNZ+GTQgdTLt7aWymLBlP6OKPScuC6JYXxJJAHumxxh31u0Dsf0/Ej1U0N2WK8/hz5qwleYpvx+WcETCE/aVd4ZbzRIzbqLCCjAf07B2r2/Lcn8zzMldZgSuApIGhKRyjayHAsGt6v1dbkXuc/cY5ivJCj0q9z4QfFh5kVtKXOxyol8ZWk0wtPKuObD6oLf+gzTlHdeva6BEUCj69Q/GxYgGR56mSVJycvBR/iXHaV5i3T2SrKNWoWqTkGnQo1CKqLNJxEz5o36YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NxReX+zZB11T3FWg1GzCru/y1F/eQ929AsgbRqO0ro=;
 b=IzA7CGLXWJ6ihV9UOh4Rg6r0+YqSMT+MFpIWTs8Eq0VDnL09LHzur/mnPHGC5/RegG2jm4tpDqwH7eckOTtwQ05rxnbZHu8Gi2uGzmFL0yrmp3GNXabHewe8NT2C7UqLujvIRBdR63tGYGOYiM9VYRO5z44kvgrTdmvbUXelnBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Wed, 22 Dec
 2021 19:17:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 19:17:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, philmd@redhat.com, crosa@redhat.com,
 armbru@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 marcandre.lureau@gmail.com, vsementsov@virtuozzo.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 1/3] ui/vnc: refactor arrays of addresses to
 SocketAddressList
Date: Wed, 22 Dec 2021 20:17:29 +0100
Message-Id: <20211222191731.467706-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222191731.467706-1-vsementsov@virtuozzo.com>
References: <20211222191731.467706-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6580cb13-aa70-47d8-25ed-08d9c57fbbde
X-MS-TrafficTypeDiagnostic: AM9PR08MB6290:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB62901BB3C2D01B53AE51555EC17D9@AM9PR08MB6290.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4A9C5fS3r02l9AkiLsGJ3gZeMKiVpw1xa82M8PkmC9IzB2rEJycZa2KBjLPDWdI32JzGHq4V4owRbgj2YlnTXIO6mmMlRBUVaqXklQLXj2i342MExlackZhCS8k11pevlP/OLHftCYAc6fBU9Xvi16UcuxjHPWw39EKLAWJ3sJXscaRs/67AAvKtXgR477372UfEMeAuaeJr7oVV5uU1oR6tzGYOT+uAfouSSie26kXY5mBYqDMkelb1g1f/tHyY290vdr7F0BZaElLhQHFRl6SGQGDq7fxqV8jHAlrTvP3UQO7OpIzHPjj75dqiEmRJAzquHOBW8VuEyZETpCIWFYrPldJscz+xf+xX9WO+OPKG0SCkOvx4oEQZfhAxgaddFa7MEaVQBtsySXNJ9pFKZgJYScBcFnEn2+6RL+BGCVBQvJtUMMMRP2FF21OYOW03V4jB4RAJORIDpVRWeSUqyx9tykYof+Z04xeE2tt+WCyar3NsDpKYcHa9phHIYpR1vyXomzeCIznLdu4bKq6QesZWMCrbx0YF/8JK2R9tspXgU2BWQKHQSrYgxKmjRcld2KRMffeWdvvkRHvObWzX6QIlX5pA3z2YSp9HdZpASao0V8L8E7mp/RkBIlyJwBt6fpguD47DryijxzXg5/M7FAk5ZyPIXMribaPQVjCQpAJP31FNlqe044tzkkrzhk6mj46Cbpj8vOfvB1In7LrAIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(52116002)(38350700002)(38100700002)(6506007)(66476007)(66556008)(2906002)(66946007)(6486002)(8676002)(7416002)(4326008)(36756003)(2616005)(6916009)(5660300002)(86362001)(8936002)(186003)(26005)(1076003)(508600001)(6666004)(83380400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjloVVQ0dE9Xd1lxNTgwSUlLV2U0QTJRb3VmS2RBYlJ1NzdQVVIvV3JtNHUr?=
 =?utf-8?B?VnMwWVpCQ0pnMmg5Vjl3ck9DeGdkdHh4Nkk2aXNyMzlkZ0IrdjdkV3Z4dk5G?=
 =?utf-8?B?MW9nQlpqWm8rMkZKdzV0WkJZRk9SQUwxYjJZWVVMVkEwOWpwWEpxRy9yMjNS?=
 =?utf-8?B?a2J5eFpjNEFUY05Rc0tKV1NnK3p2aFMvekNJTzJSWnFDei96T1h6WFJhSFZw?=
 =?utf-8?B?SW1MR1dheTBtZkJ5WXBUQ3lnK0xvLzFnNXptUUJyc09vaG5Lay9LckNxNkVC?=
 =?utf-8?B?NmR5eDVDN1VTSm5VNTN1VU81Tko1Q2pIWDA4RDh0d0tWVG5Pc3NnNXFPajVl?=
 =?utf-8?B?dUNpME5taEVwYVZhTVlkc3ZEK3A2c1JsWUt0V2hXZmxFMXpLRjl3T3ZZNEdI?=
 =?utf-8?B?cTE0VXR6S3pwemVsdmtmMkJ2amd3U1ZuN256Q2kyNXBIZUIrRVZyNGgxb3ZL?=
 =?utf-8?B?R0RpSHBhN09kQk5Zb3RuZnJrK2lIam0rREhYbmhiZmdSRmZlOFN2N1NtWTRY?=
 =?utf-8?B?czd4YjdlcGMyUFgyUDlyazFsSjVvL0FRTW1JMkNBWjM3citFd0U0SVdoMmFD?=
 =?utf-8?B?ZWZKRERXUEhFVVU4VXNsTG1oZ3JBVTZoQ0p0MU1vZXdQNExaRHYvNGsrclBa?=
 =?utf-8?B?OTNDTHpZa2xWSHp5bjM5Uk02MS8rYmZFSWJ1TlFkVEp2d2plOUV0anAvd0kr?=
 =?utf-8?B?dE1XVVhFK3NIUU1xT0RCRFVzMHh4TjRGUFRxZU1TSTd6VnZjb3lpNUZqQWI1?=
 =?utf-8?B?UThySmNWNG44ZFRhZjhyQTV2QmFNK2lDdWJpUHlpRmxSc2R5QzRoa0d6NXE4?=
 =?utf-8?B?cWtVNUpJTGZiajhvRjRVanowVm0xYVNEWXZ1dCt5VDlNRmpXaXU3bHpNTlU4?=
 =?utf-8?B?OE9TWU1oU1ovd29palZnai9rbG9pRWlRSnkvN1ZidG1CWFRiNGRTUHY2bUho?=
 =?utf-8?B?M1V2bUlpRUpqT1pYQnRoL2FUZ2ZoaWV0VkU4OWswVXZtWEFFeUNsT1JpakhW?=
 =?utf-8?B?RG5pZ3NUYVpGYUpzYlhCQVV5eFA5amxuZzJlRWVPY2RKVTdDUHoxckFGVWY2?=
 =?utf-8?B?T1FZSTJ0L1ZYUldEbjNMOFNYZzBNTDZPbEFyS1ljR2IrM0VKcFhOZGlLVEFM?=
 =?utf-8?B?Z2l6WFlFZHFZQnRsTlNDb1BSZ2s1ZkxaSUJHYVRrMHNrTDhBcnd5eXhxdWYv?=
 =?utf-8?B?UVpsQmV2U3ltSGw0N2xTUzJCMFZReE42eXZ6SE9ueUc0MSswdkN5cERYYmFM?=
 =?utf-8?B?ay9TUGpFYXZTWS9mY1lEVUFIdnhPQ2pZQmNhNGt4SVptU01vUjJ6Nk40SzRz?=
 =?utf-8?B?UEFHUVFNYUxPYkN5SG5BV1RjY05RZVpSNEF3V2czTktvQUxmZnRFbUNxVUNv?=
 =?utf-8?B?WW55QlpLQ25PV0F2SnhOWFRsYy9aTkJkNnFQOTNRcXBMUGNqQ29WcXJDbVVj?=
 =?utf-8?B?eUJ0QjJ1d1VIM1MwWUliTjlUNVJxMWxIYm1nemthY0h4QjZpNzhpSExwaDE4?=
 =?utf-8?B?ODN2WWZmUTFJV1NpZW4zNDJldEh1ZW5kaEx2RVFsVi9JRmxEeEI5Z0ZKZTM5?=
 =?utf-8?B?VU1uSVlMQ2tlS0VjSW1TSmVXUVprZ0hSOVFRMWZRZzVIcENXaEI3Vmw4aFB1?=
 =?utf-8?B?UGF4RXBGSUhFeW9PRnVSTHpuZzc2STk1eC9HNFBsS0tmZTM5MVdMaXdJODFY?=
 =?utf-8?B?VTBrSzVMblA2VlpLWDZ3clVZM0JqditBeGt3WmJYcklMS0tvK2lJanlCT2ll?=
 =?utf-8?B?enlOcytld3hUQTdLTWUyc05mbEhKeDFsWkd4eEVYZWp0RFFvNWZWb0lRaHJy?=
 =?utf-8?B?L0J3QTJjOHRzQjJCR3NIOHZJaWJkSjdtSGE4aEkvdi9kSUJnZUFyeU9VdSt0?=
 =?utf-8?B?MUN4amY3V0xUaHBRODI5MTFmdDYrSjUvdUI5K2MwR2dUTTVSY2dDZnJsc2l3?=
 =?utf-8?B?TTRaaHhldktsWm5aWmFaY2NoVGZrZWN4ZlNkaktLVlV1TFRqUzIxMmhnaHF6?=
 =?utf-8?B?RGlSazBPczZiZmZ3MDdSRzkrLy9ML2cxU1lYTkRsTnB1R3Znb1U0dHFTMktx?=
 =?utf-8?B?cUVHRDA5ZUFpb1MxVVA5cVlYVkFMZXhwQndGd2tiMkozcmlHa2NIWS83Wm1p?=
 =?utf-8?B?YzRwdXA5ampiSWNadXlkN1dScXlzK1IraEE0NlViaCtGSkMzQUZscGZwZmha?=
 =?utf-8?B?dXhZVkV6T0N3eGdIakMrOThWVDQ2NmN2QVdlK1JkdjVKN241eElkdjdFUUpW?=
 =?utf-8?Q?2KKXB5ifuK1TCcro8tlX+tk3uQVwR1McVysfvmIbVQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6580cb13-aa70-47d8-25ed-08d9c57fbbde
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:17:45.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf5Ectp28Avoov/Q7VIenA2xNaDHajmE8ukTef205vQte3JDTZMcA8QUj/QsQt5Zeg5A9rVtAk+HjZA9YwFfM6J9eT3m4TfTDFvNWMjLNfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
Received-SPF: pass client-ip=40.107.14.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
index 1ed1c7efc6..e8430531c0 100644
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


