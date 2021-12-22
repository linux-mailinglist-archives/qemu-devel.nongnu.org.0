Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA347D794
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:22:12 +0100 (CET)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Bj-0001MU-Rz
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077f-0007aY-IG
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:18:00 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com
 ([40.107.14.119]:46656 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n077b-0001Jb-RH
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:17:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo3YddyijB6mDZuMLlXQGas8ISRqaCmOG5gw7tCWC/Q46DAVE5smWaSEN+cB8+iyL/w4gNGWEza5h9U5JiTEcYNyPnvBO6i+vGMC7MOv0DpClsyQg3bZYQKJHjKh7L5Ds9oXP7s2qTz4JJAjnMpZCu/RM+PcIzn2dOGFTKDnwnPJ+DP6Ixf0VGGh8W1kr2cIOJ8FNqwQ5G+AxySqL/iL3dMF3RQryb579tAbxdr6i15Kaap9z8vpBKU4hEWwJTIMiTakiEtgiCV2qXcEYhKzBbPrRCmmIS4+Slhm5rQ0x/77GagP97W8HQkufP8KWVxm9/G35mEeKxNmjg0G4FsxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVkvxmXfslKFa7aAHicEUtg8JE/6RDsWCgsb7J2iGN8=;
 b=TtjYt94k2LU9U4fzFxRn8spv+KwuNha89GpxeOoqpbkd3qjtII1VBUBhYrZt1MrA8Trc3T9rtamN4UiOJCkUX4MsAsA/z25zePfpLdASWmD5sqSu8JEB86ehHp6eMxeBo1WVQRXBA9SU/StU4YG6hBjNSv1fyjAlqPJoR8Ro+6LOGNXaAGPk2Au1eQv5PtjWy/e2NW76CVz5eKDPGmedIa5MWc++GzYRKSb3cmXli0PH5A1DMlcsSq+zV1WKfhwzVLhT+ETfedOTnTPW6PE7KZPjGVOeTPg+pfyXG3Kc6JOZ41fT6qs7IOgoWqYCMuUql0XFbmPvDFHAdP4i3GMijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVkvxmXfslKFa7aAHicEUtg8JE/6RDsWCgsb7J2iGN8=;
 b=TqT4T7W48FjBD7EPJS2L++2IGNVp5noQvoTVQpvMCzg7Nr7STt0ePYTtjO0CISc24rmpk0Xu3/8CB5Mr4PgZu4NKhwGJQbKepU/JmX0VpTIiZRiMocWN/qUQQV8RvjnneokaCfNFBbgvyFmU0inu/UzHQgeDiPk0BvkVTqsobWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14; Wed, 22 Dec
 2021 19:17:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 19:17:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, philmd@redhat.com, crosa@redhat.com,
 armbru@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 marcandre.lureau@gmail.com, vsementsov@virtuozzo.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 2/3] qapi/ui: introduce change-vnc-listen
Date: Wed, 22 Dec 2021 20:17:30 +0100
Message-Id: <20211222191731.467706-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1fb7f058-5457-4eab-2fc8-08d9c57fbca4
X-MS-TrafficTypeDiagnostic: AM9PR08MB6290:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB62907566BA1500D2BAC70EACC17D9@AM9PR08MB6290.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jixfIB8/9/sbLGduO6oM74/DqzIspgAVpFrc9ftceQQPS9ImBd+iqiceybORvafXiSWalXL+0PVuGIpTNctY5og5vACcMnlEsOCcyw5Ri2urbynLeqmXbF2X9hkzKFlX0OdauIuSrZQ8HihAomCbOdZLib2iEojCmYDxG0nvRc3VDQPYeRzkCaFPRFIMXmYizv4qbIs6ec1CXvTxwhD7jJ5lHkrWPxoOmEgMLDTIm37a7o+sdwTlgZK9PRLBmD+KJmAgR83yDU3Ni8nf+3PhhgCmH2xLrqACBCerACZZeUvmRDhcxd71sGOX0z6tbkeybzBJjrKRBwCLfbNuaZY2fzYcEAZINbT8pMScG8pkYz5x6DK9tzjSvQ2sBK7rQVFc9WnlCg73CrcrKGUiAZXWA+8G60fVx0rWtJfa47KLsXomYWT4EctF3DZPQocRkKNhffDwiiGUM4zOqwJbwZr2FWV9NkRFccYimyIT4LSJDQFfE4KqdaJx2BUh1lEK0Gvra0Qsitkpa8IgQ4ohbMZ7GBTZz8p5lcNInzlk1REsGar0qoJQAuJsYDKf1pX+KkyZ5llJbqP7/rHhqbXpSn992afg1WklocSRPAQCTgWameurUap324f1chAnfx887XQuwNU2wz4JT1BqN18Z8rnfI7AdYuUXJ4bFQm36T0yxKyLSLvlsJyCa+f3tCHsS15hHhCI70wAsv/NcwYSaLCDk4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(52116002)(38350700002)(38100700002)(6506007)(66476007)(66556008)(2906002)(66946007)(6486002)(8676002)(7416002)(4326008)(36756003)(2616005)(6916009)(5660300002)(86362001)(8936002)(186003)(26005)(1076003)(508600001)(6666004)(83380400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2diWVdRV2tMWWM3Zkx6M3lwNnJMakxlMUFsSThNd3VPUkdvM1MxMStkUEx5?=
 =?utf-8?B?bXZhUXd1L1FLVnBmdk1yUzNGeDFsdXZpN0V6ME9GRFZ3UTlFL1pqMzFob1hO?=
 =?utf-8?B?ZDBkWmJrYkdpclBpOE82ZUFQQUtBcENWb2Joam5MTnhBR1dnV0xkamxidjJl?=
 =?utf-8?B?dzdyOXIyeDY1NGJhdTZ6S2pPYlF5bTVnci9qS2FhWkpxWXdXK1ZrVEgwR2Nh?=
 =?utf-8?B?RGxSYWpiUGN3dGREYkY5UlZjZFcwTnpvVHRQYUVRYzZXbTUyTnRGVFhYZ0Uz?=
 =?utf-8?B?OWM4bjRrZDV0U1o5bVRVSUowb2Q3dFY2aEF3TEVoMCtKS2c1amFDaGl1Q21x?=
 =?utf-8?B?K1VxWHRSSktCb3ZFYSthdFNjVmsvbnhXaU82V1N2Vk5ua1J5dm55U3RlQi9s?=
 =?utf-8?B?aVAwOHJHbzdnUjBzLzY1SnVWRmNFc2VZalJFT2FlMGRHZWpBLys4cWtEeGNq?=
 =?utf-8?B?eEIveEt3QlBpc3d2RjJCajFhNXkxMXp2aStMc1U5azJOeVlSc1BtSXpiNERR?=
 =?utf-8?B?RE1YWThPWHVzMUVNTlpseTBMdTJoTFdwRjRwVEcrWitkVGpOeDlMYlNjME50?=
 =?utf-8?B?b2xxaTlHVlZQWi9SZ1duRnJPRDhNVDcvbkZ0U2dxWmMra2h1aWxuRUZnYnp1?=
 =?utf-8?B?bDRySVoxSUl3d1k4N2QvQ1UvZy9jT3ZwTUpDRkI4QzVZd3orUGRVL3U1ejlt?=
 =?utf-8?B?MkVEUSs5TmRXdTBFaytSbDJwVFJCZkQwT1pPVnpTdUxzZUluYXhscTZTdFVU?=
 =?utf-8?B?aWJRWTFwSWdHVVlDL2ptVmxxQllHbGo3Uk5EaGNEcXFDdlhuWkZqUXd3N1RC?=
 =?utf-8?B?MEl5RUtWVTR5UzcyMjBjblVieDBZMUVRS2p4UmgwcnovdE9yQkt6OFZJODB1?=
 =?utf-8?B?a1JFZ2lCMlFremgwbytCcXVNWWMyRjBvdldjZEwyNTQrNkVGOXlscENlQmhm?=
 =?utf-8?B?SlRJNzRWcHR2NWJEdTRqTHZNUkdZUE5Mb3cxOFhHTE1Lem9nYW9kcnVCei94?=
 =?utf-8?B?S3cxaUx5UXM5TEhLbXZreVBQYUM3cDh5dTczTVN3ekZmdHR0T1VIaWNtdU91?=
 =?utf-8?B?NzRnSUdUZlEySXptaXk0U05zTGxhVUxlTzhkcHoyNHpoVkhPcVhPdEJyMmds?=
 =?utf-8?B?S3BHa0tYRldVOVB6RHZLempXQ0Y0Uk11SzZmNnlDTkU3LzZzWlc4ek5rejBU?=
 =?utf-8?B?YkNOTFd2QWpOWkpVTGVPUmNaeWlGN3ZmNkg4M28vWFZaOG1OWmM0M01hYXNp?=
 =?utf-8?B?d2t3OHozdTFJRnprRllYZDF4ZDlHZVJQUlJZT1pZeEZHN1ZkQmFycXJKUTQy?=
 =?utf-8?B?VHFGSERXWExvV0dRSDFhb0owZ29EWnEyOFhpR0lGbTE4MzBQZmtjeDQxRDdV?=
 =?utf-8?B?N0pDbTJ2U3d5MEV1by8yNWFidEwvQnpHU0JUMy9obVpRWklsSEdoWVVLOTds?=
 =?utf-8?B?TlJoc3JEZ3M4NTVSTW9ISlZ6d0JBZk9GVXo1TVRUTUx6OU1hcGI5cHV3aXJ4?=
 =?utf-8?B?cEJHMUNKbmFYMWRHd1JXQXVPQi93WTcrZk9UZDJKY0VBU0lBVVR5MTNVRkVx?=
 =?utf-8?B?cEtaZDZsc080SDNyS3VxZk54REVjMHY4d0M2R1NxUWVIckVFbXVUcXZVckM0?=
 =?utf-8?B?L2c5SzVsclBGVytnMXUwMG1TWmx1bDRnTkE2VERaL3NHQzJjdWhDU3VVbkpQ?=
 =?utf-8?B?Qlp1NW5DVEpFRHdqRlR1ZW1Md1BlR0s0QWRyRExXU1ZiRlJUblc2WFJUL2o0?=
 =?utf-8?B?SnhHZmVESkdISEJURm1rMDYyVk1Id1Vzc1k5R1VEZnZoQ25RUkl1YnVER01m?=
 =?utf-8?B?bXVLUkxWa3kxZ3hFcDF3MXBwNGNEc1daejB6aDJkL2g1a3dpUHEvVDFSSzA3?=
 =?utf-8?B?aFlpdEZ0WlNzZWw2VW1vTDB0Zlk4Y09uVnZZT3laUU1wNjR3SWNQWmJESnNX?=
 =?utf-8?B?SDEvZW41blRFWGdqVm9PNEJ6aDNGcFQxRGsyZjFvSG53TTZnN3FIUVhKK0VD?=
 =?utf-8?B?bzJuK3FUU2swaS9wTWd2Mmh1TjV0ME5NeUtnR1lsc1F6cUpuRWI3enNEVVVF?=
 =?utf-8?B?VlpZVllXTktWYzBmUVA2ZUtXTUFWQk5SWWthc1l5NytDbkpxb1ZUSFltRUxv?=
 =?utf-8?B?M0VGaUxDckNXVHg3ODBTa3ZZcGxjLzEvUm9ydWwwc21tZTkzYno1eGdsVVdX?=
 =?utf-8?B?cGM5VUVMSEFnRGlQUlRJTThMWXJ0TlV2MnlZdTFRcmxiajlIanpXQVpHdGNo?=
 =?utf-8?Q?x5L+Np5IVS4c4qYnbJsbxqbyjfGa65QQ4vSf+EpPh4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb7f058-5457-4eab-2fc8-08d9c57fbca4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:17:46.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J2b3tsfMJngcveWi4lwrtjnaGg7PcDanwG9p63+g94ijwoPm1HMsd93HQHSYL4S0BzSZcq/QnU/wN+sSh+xxsMT6FhZMiYctnDeKXM+8b0=
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

Add command that can change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/about/removed-features.rst |  3 ++-
 qapi/ui.json                    | 19 +++++++++++++++++++
 ui/vnc.c                        | 26 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index d42c3341de..20e6901a82 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 ``change`` (removed in 6.0)
 '''''''''''''''''''''''''''
 
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or
+``change-vnc-listen`` instead.
 
 ``query-events`` (removed in 6.0)
 '''''''''''''''''''''''''''''''''
diff --git a/qapi/ui.json b/qapi/ui.json
index 2b4371da37..6a586edff1 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1334,3 +1334,22 @@
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
   'boxed' : true }
+
+##
+# @change-vnc-listen:
+#
+# Change set of addresses to listen for connections.
+#
+# @id: vnc display identifier
+#
+# @addresses: list of addresses for listen at
+#
+# @websockets: list of addresses to listen with websockets
+#
+# Since: 7.0
+#
+##
+{ 'command': 'change-vnc-listen',
+  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
+            '*websockets': ['SocketAddress'] },
+  'if': 'CONFIG_VNC' }
diff --git a/ui/vnc.c b/ui/vnc.c
index e8430531c0..d7d0d255fc 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4212,6 +4212,32 @@ fail:
     vnc_display_close(vd);
 }
 
+void qmp_change_vnc_listen(const char *id, SocketAddressList *addresses,
+                           bool has_websockets, SocketAddressList *websockets,
+                           Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(id);
+
+    if (!vd) {
+        error_setg(errp, "VNC display '%s' not active", id);
+        return;
+    }
+
+    if (vd->listener) {
+        qio_net_listener_disconnect(vd->listener);
+        object_unref(OBJECT(vd->listener));
+    }
+    vd->listener = NULL;
+
+    if (vd->wslistener) {
+        qio_net_listener_disconnect(vd->wslistener);
+        object_unref(OBJECT(vd->wslistener));
+    }
+    vd->wslistener = NULL;
+
+    vnc_display_listen(vd, addresses, websockets, errp);
+}
+
 void vnc_display_add_client(const char *id, int csock, bool skipauth)
 {
     VncDisplay *vd = vnc_display_find(id);
-- 
2.31.1


