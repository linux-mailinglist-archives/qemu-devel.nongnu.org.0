Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA53C47B2BC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:21:45 +0100 (CET)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNI8-00040k-BF
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKq9-0001Al-Cq
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:41 -0500
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:27986 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKq6-0001WG-Es
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYmxnEUEmaA/kZA9AV5cEs/BpAf0Lfpr/h3dcbx4rpl9zmMMCd7PzGqLBx1ThvdEGjMXSmhOv+dIK9TXMAx/UJGSf8vFP+4U4F38qSZ9GWE7W3+43QFJEgmWbA5WROlj6c0uYIoxkIHcWIfqqoVnaCQOndyL3DBaXBz3EEoLxJkNje1sdZaZu3iTAC4NOS7PXMdvILEDOqsZbaF6+VkdO9alDFK05Rl66ILuMAnc3YNjRXo1IOijo324eXbu7/H6cLVos/39jH+0mjo0rUKSF+xhr3jiOh1VlOlP6AnsAFLmgmK8s396fW/CJUaf6nftU2UagfMOepP7ctblJLy73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CnMI/aAArmnUy93C0hZ3gATFrSJ5S9T3MzV/dzejy4=;
 b=hTINrKf87B5X4KqkYhv1cWL7MesxpUDX4/c+AleF4GemEkDuC8D9xh8+UyGQ9ZM+zHeuWF/fDj9P6DIERFpxBhGmbYlbUjoMfR7gDf9kAp7zP2pfwisSygCkkCBdR4cwxtNsRwIcuQTvPeNfS99aon6IvFvDhKWiQ87jz+zzYjZrH8O0vH224BCFp3/eRnX9YVDG/kC7ugeSbVPb3X8MrwDjftSYf8RXbbJkG+KB/uwDqJfAPuQ8bxbqdq3t+IozP9xgoZrEqTkvwGlTEt3Rir9SjwmZzUYS9hbyEojvFPyUjcQjjB/h5to+DTyGt74w2l0Uzkwk3f48+B4qEsbjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CnMI/aAArmnUy93C0hZ3gATFrSJ5S9T3MzV/dzejy4=;
 b=BHrd+x4Dgi0KieFxGv2gc1d6x5qqF5XzjheFK60FshWZIfC8vv1AS3PhM5dLZj3QGRytFww8poh7yiXp9N7seuFI7/ZFrbp72AE8WLTjVmEvz4rOGrtEFrkYPjnJxFwqgvv/Fbgd0SnaHCafeOBHwxJyGFFqHaVpkx6yFEFIQCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB9PR08MB6667.eurprd08.prod.outlook.com (2603:10a6:10:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 15:44:28 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:44:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 1/2] ui/vnc: refactor arrays of addresses to SocketAddressList
Date: Mon, 20 Dec 2021 16:44:17 +0100
Message-Id: <20211220154418.1554279-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ad09b9e-9688-44cc-3203-08d9c3cf9b59
X-MS-TrafficTypeDiagnostic: DB9PR08MB6667:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB66674D810197E9D857066D0EC17B9@DB9PR08MB6667.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRB9hDrqz6S+C4fDoE+XaxwhX3rMtgAvaBrqNkdYvgcZx6o2KT+h7vN9sFZ1NOpCduQNodV1T0b8AgJOvswdl1N9o8SxkJOf2HApvWoHiihnrpEAHE008eADSi6EdUfaQ4hHAOiVGAYmbzfY3rEMlkCEPhGEqD/zHZSl4qjYJZpIA3vz0Z/5vbCP3ECEOXDhadGVLLQLGQ0tJRHlUx9l1ag1ZmtxhVg+In+3+pCbeWu7Idj2dpFcX3hjprzDbPrespJUYPiS6k0/4QT59o2wrckKFOngay64aJuui/42Lw+032yqnferRntacZ95fIH8llV1DAOJ6IK4fuOfD0roKNIikHwl+3AwWdjOCQ0xSgd+a4MZGatmc1vaVeSc0racj7ZAMOCRQe/mJoVbgHmWatxn69FgE2AwA+1LE7coSl4ZTkC6NYDhZnoqinM3+dDhfSQVwY2wZqDgEFWCRyuJ6Su4QMfRjH5DhbAZjc09wbi4H0iLdKVZA6wkLp3sqXGvl+CEgFgHJzQM224FNiRncFXaOCcj+k0rZ1FAOYVJyURIkgFAyrw8n8LY+Kcfm6P2XNYaA2k7hWIataJbK1gCBrbSHPseWDoVkoIzMmaYFsNB/aEJtq6Ho9AqumrSrROrCdajMX2irv3o6ZU5exuiK0mroVDXCM7aERELGbyU9R0kPsV6RHBDfBZVDuMG9TskChONamd75d40qOpbEbOvzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(6512007)(316002)(6486002)(4326008)(8936002)(2906002)(8676002)(66946007)(26005)(38100700002)(38350700002)(508600001)(52116002)(2616005)(5660300002)(6916009)(86362001)(1076003)(6506007)(83380400001)(107886003)(6666004)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mgh1IUcUPQDl/yf2OeDvwX86+SO91QAjmChEHj1+QvNkzBNQTRambisN9REb?=
 =?us-ascii?Q?kDKcoZ5vRe1S883wutJ4dT1mP4nOcBA+bJJ6VxhjWnxWQvAaLZM8J8i/haT5?=
 =?us-ascii?Q?8Kb9MKE/u9fqbqnnEeN56mUWNaxJQY4/sep3Y3S3zuH+kgYuQejru2F8L9ZI?=
 =?us-ascii?Q?NeCGOyLKkAXOfS8MdisrYq07kh/s8dHGWPi8MiwPj1Ph5kTDUmpX4HAsc5Fr?=
 =?us-ascii?Q?o+Q7l8eFG0vi+Memp41YapE2vjhDg9EErbORDRt/BPKcouXH0l/200kjAoQN?=
 =?us-ascii?Q?3rSSSU2DD/TmrP9U7kYiX+KBLCULIaLkXoWyyJXXBBpSKU+hsk4Flt6ryDXQ?=
 =?us-ascii?Q?BJQAw79qwzLHy2tv/ujfkzlpHod2ZSpF0FIPAb0M8df9pYOQ//bF6qPUQR+D?=
 =?us-ascii?Q?/wj34iwMqN+kyLsEhSEL0pw19Le39+9b65+GWb8+PDVnSri99GgZ+8PJKokC?=
 =?us-ascii?Q?1yeJyrWQr3z0CZzr0gabdG98DH9sEbWSf957BglCogwJ8d3E8R9uqePv3VCs?=
 =?us-ascii?Q?ZZL73PsZ7M7Ho2gFWRJ4adw/aNLEEAU6xrbdqox8ntOig4XI0+MFswF3DlY5?=
 =?us-ascii?Q?7SWVpeuM0z76jyk5OMz1TjIyaJlOC9vMgsyzRcALeFeNtkOxGWxgmcnSPOyp?=
 =?us-ascii?Q?VA9s6iLVV4f/THw8iqBBpnqEHo+VI3XmoGuMiHhDvHHLdchaEqWu5y0/+LDW?=
 =?us-ascii?Q?LkW0EwORCz0ohxYT8glcDeWU73kWzBJvLaQEiBPt631++clBP10SpnVMANZ9?=
 =?us-ascii?Q?67CQoAV3wo7EcQK508Qz3a1ldQPY3IP9SiVbxGYfV1P1ixM6bJbaUvS3CqjO?=
 =?us-ascii?Q?1aaopxGvdrQ4BD1BrPhSBrn7RkI38wXHo1KHUr+EJoJ2MdKWg25mkIq+uiyh?=
 =?us-ascii?Q?htLFPDhL3y7fk8Eri1oBOi0xfjgPzPJ9Dq1kLUvl3uKz2NLKpWqbPn51q7/a?=
 =?us-ascii?Q?Pvs4O+bJbTj4SYvHoIIoGRgMGXIiqbyCzvDC5JrXDHnbAeTTCleyZmJA7AlQ?=
 =?us-ascii?Q?g40T7a5kIyhqAzZ6ppTiTXyrAdSGVZ0jCA6X32z/JB4rSbBeTihT7CKvlspp?=
 =?us-ascii?Q?uVFTaluhyAZEuFhej4Mc7DJo3piuCypGCVh05iXSEj80qQErC9UAxNnXdSd6?=
 =?us-ascii?Q?ZNDQGluQP6eoYImxegavxfmpEEKsvq1w3QQqO1EXeGopM3YViNYSibkoNNXl?=
 =?us-ascii?Q?T3VV9FqzOcTY19GooK6Calgo3jQKAKn3BE2odXha3oDGZGR6aU3Uwol/5RfK?=
 =?us-ascii?Q?k77bPsfTNhtnwwuHl+9IS59ilpx00QQI2lZokArCPYMgbyNozlF+4pNDvBn3?=
 =?us-ascii?Q?pWQSHRiutiu0pW7K9dlzqXkLhVgV7drDYo6RrHYaplLPgqyENoD1jPXYpur6?=
 =?us-ascii?Q?erfuT/aGq2eB+xCW8tTziSzHQ5MSZ0otOT7OB7c4lELsk0UN4PIOUdNIY0a7?=
 =?us-ascii?Q?C9x96aYUknzcjArH6XG2sr3JT0p96P7BWWVUJ5SgYujhA47M4gpJQpP5A7Cl?=
 =?us-ascii?Q?qS2IXYh4q+1CoOrsMdCytwPHFgdgOfkxAbh+rpgNGp7dR1c0uTLnoHLohLbP?=
 =?us-ascii?Q?uzGc18d4mPMd/ciDSlDJ7c6RE4TaAspYdSGJnC+NESL9TGqkiLOOdyGSuOAh?=
 =?us-ascii?Q?OveeWTpx7XY9hpqP5mzWAGSRdFyw74659mnNYA4lYbCDea4/sWg3/TyyotBf?=
 =?us-ascii?Q?ZQdPd4KK11iFXDOjjfFw3/G6L5g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad09b9e-9688-44cc-3203-08d9c3cf9b59
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 15:44:28.5970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYusfkcCrSgvQsM8PooimpeVFVQRIsDghPMmYUUBYQyK5tmkbc4Xbr8Us1DQczhx4jp2dX0CUNKRg7Y0qJ49ZW7vgNXMZcBAZMYUE5wNpSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6667
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
---
 ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
 1 file changed, 51 insertions(+), 78 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index af02522e84..c9e26c70df 100644
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


