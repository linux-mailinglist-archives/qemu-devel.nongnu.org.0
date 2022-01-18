Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F3492B29
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:26:42 +0100 (CET)
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rJi-0008Sl-2N
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r39-0003aC-EO
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:35 -0500
Received: from mail-db8eur05on2108.outbound.protection.outlook.com
 ([40.107.20.108]:18657 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r37-0000PK-C5
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2A/4iQOA4kSczG1P9KeY5/PCqVFLKlKqa/cTMBzTxRN/whHu3aX029YbQkkY/Ec70BqHqzWisWy7W91gy5mwFzSFl+v3QWoVLul1ZjK2R5xkDOGE3AOBXvh1AvLqu0v8YeudaCA0XG194/w0izu64eVCfD3UM43hQMt3R+SY8m/Fa54grY7FqEa02QXyDSZY08/4HMngFn2qAGa0OMpZ62he1LsXnBOHd1qgUqeSpHROZ2lV3DnmZMUlpzE8biFV5nOSfAnt3vzqFYfsGdPi/wqdeVj0Pt23NcbvAWFY2HBSVqrLelyFKs5ikc8c2RfNaeASFQqCIYtmkezWX0d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwmd9IUTp6EA5vP92DJkcOcyWHbwtF5Z9EDZevcIXyw=;
 b=iYZcH4JQnUFCUroLhQaUrfkN1tKNQ2YSGUi363OY6U+Q0wybu4uRsp9K0+TCj525usEubHXxxj7lXkCDYe7G87U9uJtySVlfrCFycSRknrM4qdAHdczsPAPBa1ymCrzWNpFt2ORErvVc6QZxrdJRE7WMnwiUALT4rxK7iV/7kgo6jRc4XM6rnUWLJajGLEJT5rsB3ngR4rE6nOa0pjjN54Z1aE9LAF7S8kUtHdPPD7/rhf6Qv4TrYdsxMS3L/y+cvcuE/bLamRjHiLzn5jqmTCllYmUbG4qIXpTEkJpOg7x26gwMJXlu60DzE1O4WLm6jg79Jn/Ico4Y3zKXy+UkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwmd9IUTp6EA5vP92DJkcOcyWHbwtF5Z9EDZevcIXyw=;
 b=PA6kLiPOksqbmX3upa1jdld196LeJfGsIZsx++j6UccPiAeYLL2+8P4UErYNzG7//fbhdTUbLp3DrEfXA05LkcizEu/qFfHx3tf5XmsOFzL1/xAyemaGznCEGlkoZkng/PNICwOdOXLUWPUTbNZGr/opb5WzHij86Sh3VthBYuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3953.eurprd08.prod.outlook.com (2603:10a6:208:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 16:09:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 16:09:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, vsementsov@virtuozzo.com, marcandre.lureau@redhat.com
Subject: [PATCH v3 2/3] qapi/ui: display-reload: add possibility to change
 listen address
Date: Tue, 18 Jan 2022 17:09:08 +0100
Message-Id: <20220118160909.2502374-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bccd94be-fc56-4386-1106-08d9da9ce696
X-MS-TrafficTypeDiagnostic: AM0PR08MB3953:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3953E9153425B6B5CDB6AF02C1589@AM0PR08MB3953.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8OLr/mS43AU5+h7Ub2rDx1TsjYSKrCdQ943XpaZ4OfuRtuRtIlbCLv8lMxqC3uYvABD+HoV/Fbr9/qxH+CPqWEgI0ULAFU4Webz7+3c6oxRi1NQHntZdRQ7zla6wjWA9BOlNWnzYCC3l1S0nJV5u7CFVU5Iycu4L179I//9bn3Im4phBraJw3gaOzZRlDb/6uf/wIUEvXESKC51OF/XyV4EoBqfqjDEfjXsP73PK2UsE9kWBIYtpuTe/4CIwzF+2hkdtPgOsf2Gykr8evKALcxu8iJq/Au3/Dk48wuXGGQwEzM8CPz4XiNbGo4IQ35gwzHSioV2sEEvQNJWXZHync6Q5Y8WsLRLUeR+g+bno1u+PDUiJQPh8WPZHCw6vd1UEanU4z3hKIwiGyii+Nl0UgMTk8ls9aASyqhNyfID3HXO0RWC4qO4DZMVQUyk0/a6zYIIxgUiIvsIMMI1vAIuweEn/ZCEAfzIJZ7At2Juy+8ngDTX2tHvARTk7aBx8QZEon1ylkucYKhFv/FabyRBHu/BeYkvEQuON5ZykBKIRPcl+zWFzLXlSb5sc9PiyAY9LPm+cftFN/QtwUAmJko2ii3Z+lL9n64iHRC7gWv60oQD6os79qyep8l3fwJ6oJNLGNe1+Q2YVR4faOR+bDv1XLQA4stf1Px8UwjWtJmX2aYASvVTT4ZUVY9Qo/XiVh6Z5ELZIJD3KRNj8sMENPvtyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(1076003)(66946007)(8676002)(186003)(6506007)(5660300002)(66556008)(38350700002)(4326008)(66476007)(8936002)(26005)(6486002)(86362001)(316002)(6512007)(6666004)(83380400001)(2906002)(38100700002)(508600001)(6916009)(7416002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9maeDuUXddfpFaSfg3HRddaf5meVyBMQtQQA9T1Cy+SOFi4v1y7WpyYGXqPv?=
 =?us-ascii?Q?+8R42AX9JOcFqnUBLy1rK6w1J4RKsQpdfE/fJODKH6lkDx2H6siYAt5Ff6mj?=
 =?us-ascii?Q?uqtcderq4mVbdShJdQMT+oi4kKtALP1xtebyoKfvtjNfOIglWbV91/r9gtFG?=
 =?us-ascii?Q?KiycC2/av/kWLSP+y0oEzfY9FqeSdxrRF9fTngel68OvIyaauN6fjJfqrZGy?=
 =?us-ascii?Q?/ESsNjrblbPeE4Q5aYA8gdCU9AaeiiYijp9zpo5U7JsI9DVUKbbGVt5K2SNZ?=
 =?us-ascii?Q?JVlVfWC7crIf+kVyKnxc2UL59D2dqrPKDc6TO7dXnIzfpMCPDlJqX5NgXGdM?=
 =?us-ascii?Q?CXEyxnU169UqG/yRTiAyEGKln98LRjtqXxZhH7n35DEZcZHQt5kzUZdyNmoK?=
 =?us-ascii?Q?xVtSZ3vXJf8sw7qMeifiBsHod63IigqMcxKEi8JXYgeDhPYseqyyFWQosVe1?=
 =?us-ascii?Q?fs05WGVwp/IlM+vgX8BztdWFpkLKv+OW2t4t9wr+oCZHHdVqIkYcrCv15+YV?=
 =?us-ascii?Q?JGG7iYx0N2MwvEFqApRkF2KK8H2Psip/+4qLR532KUN0aVlWB1Gz1icfOHIN?=
 =?us-ascii?Q?BatlGBOMrKwF0zHs/M52QvTW4Ic4UCK7ipvjwvC+mJyjUEJfyzC9BU23w+3+?=
 =?us-ascii?Q?pH/pLcH0Fl6b4zK+VkBr8K9RGhm/wlp4ucccoLfrqgdIJQYArxIPNoKZt+Bv?=
 =?us-ascii?Q?RUf4chNINBO5VXVadxDKPljzoJDSsahIcDgeksMdUhB0YtJ91nd4M0/Yebp4?=
 =?us-ascii?Q?LrD/9hxlIqVGSi4u1cNRWP1AJ3NQs/UJMBicgM52zCmwOiAjCItncfuI7BI6?=
 =?us-ascii?Q?R/cAPVyf8D2PuG1qCgL7+UemNjV4i/p46GAjNyT8Fw0kTN+MeCKb3n8mBrOq?=
 =?us-ascii?Q?l6duwgpOJ6krawjAbc6G9IzROO+DQ9zhoSkJ7TyvMRxz/epBXbwcaTDq4ka5?=
 =?us-ascii?Q?aW97Q0rQdGpGtbhh9dtLw5FEL7Imb372NJYtlnanFN9qc8TFm3Jmm/iEmqIS?=
 =?us-ascii?Q?s6SBsX6w5N4Dz1sekXiLUTZqo70XcoWomHEH1qXGkPOZW/oZXlmEYgGtO+mQ?=
 =?us-ascii?Q?5tGnYEj9U8+aNUzeAPgnqWwGaLDQPJAF8F9YRetXQ95ecGGTXuK3y1C5kRG+?=
 =?us-ascii?Q?1ny7snrVxdkFW+8qqFWwKlFs2qMIzKYBDpmV9XEsemhJ5no43Y7WPp7ZK5uN?=
 =?us-ascii?Q?2yvtrGBv9cwXd9NZ1cbG1U/vzUlo23xcKWOQLZGpXHaKM0nr3jLUvzmNJc2z?=
 =?us-ascii?Q?JGi3q6Ab7nayPGI1/OBflADQEFLLqujFbgNYhwCtaohnyQ8xBG0hDJF7t66P?=
 =?us-ascii?Q?IL6Z0UiDywSgL4jchxWHjnamrW/RWNAYimhBwmKgDXbWRvrF4WrUeRX+1rh1?=
 =?us-ascii?Q?OZE2K2QU1EVHz9w/YbImEzkks18/8PsV+nOabHaqI44uvJZtyrqszDKe7UEp?=
 =?us-ascii?Q?ClIkuAZHpunBYvkG7N7wTToTawGZDvhqd/nEBTqBgeDaFjDzcB035oedCHjj?=
 =?us-ascii?Q?qhNGCMStSG2kT9wjgTjaBYdzzBHRFfuCJSiq9XoS+bodH1qr7lt2JRe8gj4R?=
 =?us-ascii?Q?88AkLPaywrLOINe2NFZyFSGvMWtFqT55AOpLBYAvHVGCXP5Zk1fyHRLHcfz4?=
 =?us-ascii?Q?ax1dLICtD/OdI4n4q5cLvMQTdclaZHi1PZmYmcLoX5xv+Zu/tQPdKGmfktwr?=
 =?us-ascii?Q?1OdoC4zZz0PwJxZI8Pvqcp4FhBo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccd94be-fc56-4386-1106-08d9da9ce696
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:09:26.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9uTj2QC60+ti7TIfpvcunYQunrDlbatGLUI7M5SFinX/kaG5t82YzziEqACTsOc5jXY5Po15SyyBt081ZH48a+E51hTFpqyUaesbXlc+kU=
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

Add possibility to change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/about/removed-features.rst |  3 ++-
 qapi/ui.json                    |  6 +++++-
 include/ui/console.h            |  2 +-
 monitor/qmp-cmds.c              |  4 +---
 ui/vnc.c                        | 37 ++++++++++++++++++++++++++-------
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4c4da20d0f..b92626a74e 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 ``change`` (removed in 6.0)
 '''''''''''''''''''''''''''
 
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or
+``display-reload`` instead.
 
 ``query-events`` (removed in 6.0)
 '''''''''''''''''''''''''''''''''
diff --git a/qapi/ui.json b/qapi/ui.json
index 9354f4c467..4c4448f378 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1293,12 +1293,16 @@
 # Specify the VNC reload options.
 #
 # @tls-certs: reload tls certs or not.
+# @addresses: If specified, change set of addresses
+#             to listen for connections. Addresses configured
+#             for websockets are not touched. (since 7.0)
 #
 # Since: 6.0
 #
 ##
 { 'struct': 'DisplayReloadOptionsVNC',
-  'data': { '*tls-certs': 'bool' } }
+  'data': { '*tls-certs': 'bool',
+            '*addresses': ['SocketAddress'] } }
 
 ##
 # @DisplayReloadOptions:
diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880..b052027915 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -512,7 +512,7 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
-bool vnc_display_reload_certs(const char *id,  Error **errp);
+bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 14e3beeaaf..ad45baa12b 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -356,9 +356,7 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     switch (arg->type) {
     case DISPLAY_RELOAD_TYPE_VNC:
 #ifdef CONFIG_VNC
-        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
-            vnc_display_reload_certs(NULL, errp);
-        }
+        vnc_display_reload(&arg->u.vnc, errp);
 #else
         error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
 #endif
diff --git a/ui/vnc.c b/ui/vnc.c
index fa0fb736d3..a86bd6335e 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -587,16 +587,10 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
     return prev;
 }
 
-bool vnc_display_reload_certs(const char *id, Error **errp)
+static bool vnc_display_reload_certs(VncDisplay *vd, Error **errp)
 {
-    VncDisplay *vd = vnc_display_find(id);
     QCryptoTLSCredsClass *creds = NULL;
 
-    if (!vd) {
-        error_setg(errp, "Can not find vnc display");
-        return false;
-    }
-
     if (!vd->tlscreds) {
         error_setg(errp, "vnc tls is not enabled");
         return false;
@@ -3973,6 +3967,35 @@ static int vnc_display_listen(VncDisplay *vd,
     return 0;
 }
 
+bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(NULL);
+
+    if (!vd) {
+        error_setg(errp, "Can not find vnc display");
+        return false;
+    }
+
+    if (arg->has_tls_certs && arg->tls_certs) {
+        if (!vnc_display_reload_certs(vd, errp)) {
+            return false;
+        }
+    }
+
+    if (arg->has_addresses) {
+        if (vd->listener) {
+            qio_net_listener_disconnect(vd->listener);
+            object_unref(OBJECT(vd->listener));
+            vd->listener = NULL;
+        }
+
+        if (vnc_display_listen(vd, arg->addresses, NULL, errp) < 0) {
+            return false;
+        }
+    }
+
+    return true;
+}
 
 void vnc_display_open(const char *id, Error **errp)
 {
-- 
2.31.1


