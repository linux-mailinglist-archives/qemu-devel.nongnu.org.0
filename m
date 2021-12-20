Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379BC47B2C3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:25:04 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNLK-0001c9-O7
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:25:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKqD-0001H0-EF
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:45 -0500
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:27986 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKq9-0001WG-ME
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixxfj9pw9WSo7jJCYNJe749AjB/IPXSdygTlvVFlnAoa9RkCRwI7O8cKdvqQXuCIKzMf18yW9AIT6JQ8SpHpc8G3si94se0ybpY2Kc+0mePylyQgyerOGj5SSVOaKA9QzoCMZqJ9WF+8y1apmBjGmynKHs1Ae9lCLAomm9dVpKoaJJtm8R8vGLSgKKGYzpt4WjLhQm2J8FEjtaQ08afWtJF/pFI/DDExVLdPfxhH1DbDjCAHDKAt1lbPiFvJhuP1OsdmbpkapdlIdJ9mDkSyrZmUz5/AKDi5cxiEya00THkbqkG3ztrUWHRx2MMqNVll1/gvoWBcJnxz3WyWOccQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXZIMgf5ZaWJrBQHxaCTQWydZL/B81ToI3lISfFL6V0=;
 b=RVyNhWgvmUX9oXDvNUaBFxUJTkoXQJasop7FvRw3ktddVxA7znq0Ck95ctmGWH/hMe0nKfxM3UjN6eTjnpF6KrwjMnKG7tnlT7I1a9iTdOrULo5NPnVn3gavR0C/D9rj1ORf57KInNSN0TbgFUUKH6PLQ5BbuYRYUnrE1Pu6wY7RAF3bGwwWvwh410ka1IPe7uwkuRO8imTVMW0lRC4ApC96tR37AQl1ecCR5jgFOItyRzZLjkDvSn969Oj1lzSQz13+FuSrR4lq5Hs6VpzPsSghmiiZGgL/knMs4CIiVsFcqz7AjCQHAwVDa9lIUMiJTB80BwDXvSk8gziZb4KjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXZIMgf5ZaWJrBQHxaCTQWydZL/B81ToI3lISfFL6V0=;
 b=hWea0h9hNb1iPXvg4Y4pSw5OdrEbjyns8I/omjcveFeMQwMmTpwTHryxzgsIrru/0ofSquoqdJ3FR1z0nRyvj/02YU53DGYX4Idw7JyubCm3lj+PIKj4VKt3WAb5GpLHFx+JZki+cxhO3K/+q/pPBCxaawaAt4WLTDfp/35Dg7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB9PR08MB6667.eurprd08.prod.outlook.com (2603:10a6:10:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 15:44:29 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:44:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
Date: Mon, 20 Dec 2021 16:44:18 +0100
Message-Id: <20211220154418.1554279-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0f309cb9-bb1c-42d0-31d7-08d9c3cf9bef
X-MS-TrafficTypeDiagnostic: DB9PR08MB6667:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB6667AFAE93F2D574A583B369C17B9@DB9PR08MB6667.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4fUHhn3O/m1mOvHsmPc8TstpAZYY/fMixnAntpCUrM5aZW9P1B5innoUvetkwJybGFK3QxBdB1SyqI57ijLumc5yfUCePk09VIl3j7V0vMed6WEj1RxFQ2ZCjDKAUWfFqmFw6re03hw/9ORBuHMVELan7g2u09CBe5jmfkZc7R+1nP3Uqz1GQjO75Vx9BfGegFJo2090SSIwdZxEvNF8BRnuG+HExkMis5NayG7JLoQ3+wuPBeKOKYhCM9ica//pIx3OPeOWyM9K++uLBMYE1YWfvCSsZbdkBR7Py9Vt5XR6tOF/yh4JxL+MtyxMDyGVJLYFaBxzVUuiZSJ8T4ouyZcBGHyAvWD4fsr7P6nyGKrrve11r2QPl/kx53rVCVl8G10BhnsCj0FQYePyHZ/YTuSwjnstCAW99qiq+t2vzGE7/xVK4vqNYFchzOXkY38UbmF7dDRHAZvMwpzoYvqbwZN5ClICC4aJRijxcsIAeE+EjnHfyCryA9A5xdAszAxUIYwRbNJkI7qeEB/9jJFt7a3vQOgIDuuPsWtuzUyffmyUXWvuW5qjVHwLnJzZKhNeppU+UFiqJYnL9XehkEgrLzKwTaUvJN6NvPVnmO+BRJT7Xgs/s8jZCUxPnyxmI1kedNZnIwRj/62hH+UnoJ+dNFXEKQHHz6bBq+Jt9eYF3grXjeAngqxifjLxafmcAu+AVgEpFgMQReA8aIk461RpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(6512007)(316002)(6486002)(4326008)(8936002)(2906002)(8676002)(66946007)(26005)(38100700002)(38350700002)(508600001)(52116002)(2616005)(5660300002)(6916009)(86362001)(1076003)(6506007)(83380400001)(107886003)(6666004)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LjXto/lJ/EuqRpUBGMe0yiSUXwVq/UZFog/IekTujeiG8zjzj5VBmj+t/yvs?=
 =?us-ascii?Q?f5sCPKe2QklIkb4lj1on4sg3OHkBZgtx8cMLSDifZs4fIffHlx5OiRME5IFm?=
 =?us-ascii?Q?SZish9auJBUylGGcgZH8S/3eCNF1OC2AhphKjxRH4EMyROmlvz/vmWCbuNt7?=
 =?us-ascii?Q?mKKWYqNNQGkpcJ33VYK5ZSeWpHEgBeF4GWUrtdC2bUvs3a5dG1xh+zxxPv3y?=
 =?us-ascii?Q?I2i/qzedU1f3VJvCS/0Q7t/YQrwxvOadvJUS9dPwMNmAcMsn/X+cQQVfBFub?=
 =?us-ascii?Q?4z8n1GSeUAwb5dqh73FrSdQrDfBP854DmdEWVhGQ6xDI/9jdiSvqYoKYz/FP?=
 =?us-ascii?Q?N+9qpyo8QujyNZUPDlFUoPvYltfGJcEGnu4dyJTBk5esUe7JAJ8ufH1lN/dw?=
 =?us-ascii?Q?L8BTgPBTyq0SrAXUpm27/Dq/0Dt4a8FAn2NmVnpDl8S/atxMT30+TD/wmC+f?=
 =?us-ascii?Q?zeUuI248jTS34r5r79HlPVmwdVZd+ZVeXoF4bkdChZ7kDAaA4C06ykLALbfH?=
 =?us-ascii?Q?U93cpz7rF6LkUw0tjCD8aiHSzcrrXRR+/BmQq4d7IFSagBXoOQFiNrvUmULX?=
 =?us-ascii?Q?qESIWxX/E4DT6qCcQzEXzbPkGJ584sN0qfYwHAtppw7St0Z7RguyORJhJxNm?=
 =?us-ascii?Q?GPDvXmA1luP8GGDWpNBRHWtzwD6ptKqVJkRixKGsIVziK0wqXNlxxGGndeAn?=
 =?us-ascii?Q?WNJGbECTiJ3e1gGpS0bMjTKWSzIuilS6HVt4pr6CqoefUSxJbEejHbRKWQwu?=
 =?us-ascii?Q?5eygMoJIkeghJ7Bu3lFWThvLSMc3/h/22HCm1hWwDF8ZGjJXK7McUTg5XXzB?=
 =?us-ascii?Q?qLdy7qHK2OFDhT4Vk5E5HNAGC20I/C+3M0iO2p1g5CG7HQLk8iNXcbKkfbhf?=
 =?us-ascii?Q?LiINZgZ81Vb0M0LO8+waTSmA7UtBvBspLItgX2t+2Cqgv+aGqPuWNF4r5Am4?=
 =?us-ascii?Q?x+puNxtXUjKWOipMMUX/kZR2E3dQ9l4pRlaNW8n7mlp/xqBAu7EEfhEIDxmk?=
 =?us-ascii?Q?uMqp47xXdoYrvXdn9NieNOTuFBCQslCBi+MGDB/sjE8krqnRCuCYeMwPA9Lh?=
 =?us-ascii?Q?rbtFHHSO5Cr4ERjl++uGdp5UcSGSPPdDz+ul2BwIq/qEqG77WN9p9RIzOJSW?=
 =?us-ascii?Q?ii+zlUGQ6gv7JbhiUqb1obR/sJIfA8zxZnD0Lq8JbtKVbxnxvdrI89pokv92?=
 =?us-ascii?Q?8D+RdOuI70yDhqR4QJ2JUcA0dV/4wYCId4LZhc+xsVhq/QiQLekpn9e0C90z?=
 =?us-ascii?Q?c31GIp0EVkILd2z7VXlaIDMVKj9Y4tTCzWkeIgft8I/zoG4CNOfETuGsHLYU?=
 =?us-ascii?Q?zQrwDWrazXyDFPxyQ7PoOTrPG3vmVe6DMow/AiSNI6egNrmQDQgb/uIOT0ke?=
 =?us-ascii?Q?fRFgmZxRPc55O41ktoGVMBed//cK+IGLTrRP90/gMSpFFq5PLA52d235LUeA?=
 =?us-ascii?Q?ZgEX27u2c9ugtqASFsdsK3InkLF0ZXAnPj9VRTzhizVgZr9MzGSa5NamFHQ0?=
 =?us-ascii?Q?wouVfrZkkTxEFvB+jNZO/NKv6HfThlBsxDjj8xbiGqGUi9w5yFVWhV1E+5u0?=
 =?us-ascii?Q?DHXlNtps4iZ5XEDudDTXZPMZ1SOC9AbFcOoDMFQ23ukAqWeSscgIe+FfDWu6?=
 =?us-ascii?Q?+BtAP/M3rk7kGVkwnl7792oR295FIHo0QycDtOyQ6BmtUfSzBzR2auXdiERw?=
 =?us-ascii?Q?CnhgeQ5cG03urfjAdbMPDaP2spA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f309cb9-bb1c-42d0-31d7-08d9c3cf9bef
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 15:44:29.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmyTukw5LD0zzFz+n5J8uBhz81ZT/EQkoDTXmQrAEHzotCli/g6HyQohaWgg+YXCjJLjT8AztHkIvfhzsXmBna/Oo7i79CWlgzQK8TWGUOc=
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

Add command that can change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/about/removed-features.rst |  3 ++-
 qapi/ui.json                    | 12 ++++++++++++
 ui/vnc.c                        | 26 ++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

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
index d7567ac866..14e6fe0b4c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1304,3 +1304,15 @@
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
   'boxed' : true }
+
+##
+# @change-vnc-listen:
+#
+# Change set of addresses to listen for connections.
+#
+# Since: 7.0
+#
+##
+{ 'command': 'change-vnc-listen',
+  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
+            '*websockets': ['SocketAddress'] } }
diff --git a/ui/vnc.c b/ui/vnc.c
index c9e26c70df..69bbf3b6f6 100644
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


