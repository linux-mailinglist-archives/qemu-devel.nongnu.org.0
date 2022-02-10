Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B834B12CC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:32:51 +0100 (CET)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICND-0001WO-J4
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:32:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAjn-0001EY-KP
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:47:59 -0500
Received: from [2a01:111:f400:fe0c::702] (port=44267
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAjl-00038U-JN
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:47:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwzxvabF9aEv0FuusY7eT5S7vyHYMR8mHsrYrnvwxSLCa6UdKAilP586+eV44OGuhVfCsgH35vRJjVgpkEVEylfZ/In42ZeUuFc9Ud6ouOyZhB/GW1xnHySd7kpnUw+YDW1k8ADkWQpHHsZXOC8MVWHVlP6O7Bx1M9XUow2Mpkrxu7SxTngwJF6dBwvshEf7EHH70dXqMaxrxqmSMamGgFsPCXcd/7TVMoQexkR6ew7SM6UxXWddfzzLjR4LP6j9BYDhvEAKMF8mXtopX0qXASaW8pilyHnft6xPKGaW84NHQk/qDUACbrmF82Hc99LMkbAr1Kd2wLUOXLZvES9mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9qLf2HmZWferDuV6qhpZKzALdt2LF+VsCTyvCRhCQE=;
 b=MCuwrlaAqU5vGpUGMxJzm9kv1zXgM9uQIWpxkWMOQv+nWl2tRYHFn4NAp+MplTY/KPQj6JviMQKE1TLMlUEbQj7qmS2gbdVzWApFkXPaiL9LYCv7Xpy7Y13YdYr0P5Ywb7KuWYabgRhZomvGKxEsmJ20Ygj1dl5Ev8Y70uXskM623v0cpBYC/MbtE5n52zGGPJNrVQfkMH+EdFgF+7oZ5XFhO5W6k5prOTSqDiBw2UKaBJCXQWM0+IQkc532SSzDRPSaPUK8pGM7TQd/XgkFgq/EtLWob86fZon8asH9H7zLhhibEwQpHvDiWDMAdbLXSBA7TRvEW0WTrbS52wW1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9qLf2HmZWferDuV6qhpZKzALdt2LF+VsCTyvCRhCQE=;
 b=OJo6sY2O9pN323Jgrpb/Gg2tUUJCSfzoeK7FrOszmiVvVK+eLciLeirI5iSjwPhiOEOcHQHZIxdVUCZznb8mcYPtesbYY4VDIWJFFxSsHA5n0hSEzDF8rIP7ev5h8xO9t0onMePVU/WlXPEvGALvNmKOUkvMFfrQRoQnBA26BVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 14:15:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:15:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 vsementsov@virtuozzo.com, berrange@redhat.com, marcandre.lureau@redhat.com
Subject: [PATCH v4 2/3] qapi/ui: display-update: add possibility to change
 listen address
Date: Thu, 10 Feb 2022 15:14:56 +0100
Message-Id: <20220210141457.539582-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210141457.539582-1-vsementsov@virtuozzo.com>
References: <20220210141457.539582-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c27e64c-3eee-4376-8788-08d9ec9fbfec
X-MS-TrafficTypeDiagnostic: AM7PR08MB5413:EE_
X-Microsoft-Antispam-PRVS: <AM7PR08MB5413CAAD7F127A018295C094C12F9@AM7PR08MB5413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bOVVJPm1tIo4hSCdSu+HkNQ5ejPUdJq6FrjdHUty9xVwPvH0coOwvsD82tUTlew37nRtTIsGnekhZG0+mUti7/SdKcrSoiIf6ndsu4pbDNr9e5G1EsE9XevyCMkH7pSRcOYZ3ypZk46mM8bp4/k9I5DeBqrBqXxkIfZMdSDuxjy9hbfFNfGA+j6ooj/PA3SYHBdHTh4wVG7Nz+vfytY5wZ+gPfNJZxS5FwUePMMrKAVj1Gv7kRQvSpjW3f8PcWkN0Vv9Ei2qXHBKtggEI9wzc9DnebQxMACajxiTe+4pEQWdd2/Kkig0hNJ8PUBVC+QiGDdmJGtSeD1Jq9CL+DtOsqcuGjLXKbOfj6NogfNd4rKEnEOtuSycgHq3qPNfPhn+tb3NqN9h48+ZIt9iWFovYF3pSUKzSIjCixL7oP5iypM9VfqD/zCPAt7aYb3dPfzEMO/MwDzsVo+EMp/2oE48sa3bu6zrgWefmIzjU0+O+sUpDPyLAYIMLrIpHTlghll4SyiHyCSm0eY4lGCIj2UwqKOO+z7m7Zc2jdpfSVi2VMFoUkR6MpoHmxYLRo5/nVJ8yi2khlJyJ9UnMOo2tiGm9hE1htL5RVgssDI90lH3ZLF6Zi8UIOsb+YTPVwS2LGBHQZpdxzwYNtdLmlgkIlwMK1hDq3HMLCIsNWqPu7yk59WFjHLSK+PEHaTrdPkrzOL9ByDF/zDrL2o4O/FZKxXQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(52116002)(2616005)(15650500001)(2906002)(6506007)(38100700002)(316002)(86362001)(6916009)(38350700002)(66946007)(1076003)(66556008)(66476007)(4326008)(8676002)(5660300002)(8936002)(6486002)(6512007)(83380400001)(7416002)(6666004)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w4HBc6q6IYyU1A4Ig2dtTQ3FdB7CtaaG+xVzr+l15tE7VWWcVpmMfC+ts2Yc?=
 =?us-ascii?Q?6s53bzz/CXKErhtSP/aM2lKSpHdLEz+AXNkxtogkT7y1Q5C4o15OjjstIBz4?=
 =?us-ascii?Q?zO2zAOPbLauzPcHAKt4MzGNBOaBTMj7pjSNPtu3FZVcgPoLiDjj+AOgt4+0y?=
 =?us-ascii?Q?uOzkoZbelhjJeGx9QGdGnufkvUzwejlznxbRBq6GD0eaj6yOyu+CHAtnxmnj?=
 =?us-ascii?Q?zH2oP1M9LLYuakEE90EjRpbDAVb/sl7NWvQ/BEs6sptjnfBbHma/rNHoOnnE?=
 =?us-ascii?Q?kBi9msC3U2iDYLnHhGkAwcgaf2x0LBupT4xTUTTi8RqwG/DFdkagGKk/uPFH?=
 =?us-ascii?Q?mpchihKqnwo1FFDe3ac9RffFvcdixeTlUnYMopbW6aIIJrfgjDqxJPVza/XB?=
 =?us-ascii?Q?YexULOOWcpMSo+BndYwwkIM2imclrZ1JjD+5ULlVtABtdbhdgtKfhiaDm6uh?=
 =?us-ascii?Q?MZTEHnmj3xUayj9Cpw6UDmUaCCFflWJVMMOuhY+B47lWGOCvwMQaagZo02/Z?=
 =?us-ascii?Q?QgLTSd/MxuLCAM+84O349hHgtt31iF7KU9wAITy4uCWfOf1QQSg2JLAgJ1rf?=
 =?us-ascii?Q?51jwsDpqHihB3y6p48oZ4USKxNKuiBdsqDOlA2Aj92HyMhL0hmR/FfdbJYzL?=
 =?us-ascii?Q?5dxGyv0i594LyujoczAO/+XL8yojRm04joz5pSYKZ+Woi3LHP7VfVImPt0sN?=
 =?us-ascii?Q?Ol5JIEmNsr2g92kECfFQqOHScSkq9cw7O13KlXyK9/VSqQ3fxLFDEaJjxPuA?=
 =?us-ascii?Q?WGdG1WrdqBUkt1jC9hUKu2F8UnwKJ4rKGhH47CUZcXTKDLmc1uB9K1tYROOS?=
 =?us-ascii?Q?EkGRApjall5Akk7xyvDxdvdtQzQCB3TMr9M2ALYJ7iJlIKGO3H4Btkfbj0V/?=
 =?us-ascii?Q?F8HyQxqgY6w1i+rjyTEzxAaVrmLma/wvteYbJZHtgCf065rEu/ngg4FuuTds?=
 =?us-ascii?Q?Y1FAC7AZQcmOZSsb516D48pSj2Zi4FTwg+pYgHgh5bAE/mGg6q5gEtNMNysO?=
 =?us-ascii?Q?nPmh+NVLAu6pXQJeh/7WxC9Jbkdh4jiUgS5vOmFlfUZ4F4S4xsJOGT5cP59X?=
 =?us-ascii?Q?YYCQ+PjZahHUh/vZ5Y0ueruftrRAIMMg+svQqRrDIkmDGmQ6Wedm6HG+mE9v?=
 =?us-ascii?Q?/fHShyaYp28vnbPhrwEmIAldDAiaMct8eOBzOlpT5DFq3RlgLAjtGeXFaY2h?=
 =?us-ascii?Q?a+qZH4wIDqpZNVRMWeUqOvBog1FnXh1/azIS1z+p4Wgqu8aWCwq9el5GIwYU?=
 =?us-ascii?Q?7n6OY6J8a4FA5ZcvyujdSMg84pJiD2RNF+vOFvKreoovR0yiER1epnUHaji4?=
 =?us-ascii?Q?5FUJIlrVYNPvoLjFfkIhbmDwoomRdI6HCI/OmYjtvjqXN/aSlO/bdtA5e/ao?=
 =?us-ascii?Q?rY/gc1ZnG4Uk5gq0XjDIV6OvrE9w8ehtd7/VzRL27ECCan+/8gASuXUtJCSP?=
 =?us-ascii?Q?y3vtyOFJEVFY/2s+kmvnq7QAQ1T8Qx0waPGa75vZD7rATXwAf0LtKewLBQrS?=
 =?us-ascii?Q?BXBHOvySjevAG19+YhKz/BYbEKUIjHUYtnVTg583iOCWLi5Sh+p0dBMf+3vF?=
 =?us-ascii?Q?wIMGTZpeeRw3aTkFhbzbcH5dg7bdCcnJc4lL5jvwz+dIkZBzFyrmrB0+jToO?=
 =?us-ascii?Q?eALn4Avupknbc/ODV2W3QgEzSCdZaSBsZdu2Sy8OWlDrwaPpeGt7arjer5hB?=
 =?us-ascii?Q?4p/aJA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c27e64c-3eee-4376-8788-08d9ec9fbfec
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:15:11.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jcb5RbNPbeyeCIxIKFNAx1ZycEWiH1Snu2thOFunTCFxL3PF/AIhvPni5gWZU4Bi6dA95mLSIfSb25xk2+Bi419OJRlNF/XSGsK+MTt8ayM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::702
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::702;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Add possibility to change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/about/removed-features.rst |  3 +-
 qapi/ui.json                    | 65 +++++++++++++++++++++++++++++++++
 include/ui/console.h            |  1 +
 monitor/qmp-cmds.c              | 15 ++++++++
 ui/vnc.c                        | 23 ++++++++++++
 5 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4c4da20d0f..63aba60873 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 ``change`` (removed in 6.0)
 '''''''''''''''''''''''''''
 
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or
+``display-update`` instead.
 
 ``query-events`` (removed in 6.0)
 '''''''''''''''''''''''''''''''''
diff --git a/qapi/ui.json b/qapi/ui.json
index 9354f4c467..a0851eeefa 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1334,3 +1334,68 @@
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
   'boxed' : true }
+
+##
+# @DisplayUpdateType:
+#
+# Available DisplayUpdate types.
+#
+# @vnc: VNC display
+#
+# Since: 7.0
+#
+##
+{ 'enum': 'DisplayUpdateType',
+  'data': ['vnc'] }
+
+##
+# @DisplayUpdateOptionsVNC:
+#
+# Specify the VNC reload options.
+#
+# @addresses: If specified, change set of addresses
+#             to listen for connections. Addresses configured
+#             for websockets are not touched.
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'DisplayUpdateOptionsVNC',
+  'data': { '*addresses': ['SocketAddress'] } }
+
+##
+# @DisplayUpdateOptions:
+#
+# Options of the display configuration reload.
+#
+# @type: Specify the display type.
+#
+# Since: 7.0
+#
+##
+{ 'union': 'DisplayUpdateOptions',
+  'base': {'type': 'DisplayUpdateType'},
+  'discriminator': 'type',
+  'data': { 'vnc': 'DisplayUpdateOptionsVNC' } }
+
+##
+# @display-update:
+#
+# Update display configuration.
+#
+# Returns: Nothing on success.
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "display-reload",
+#      "arguments": { "type": "vnc", "addresses":
+#                     [ { "type": "inet", "host": "0.0.0.0",
+#                         "port": "5901" } ] } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-update',
+  'data': 'DisplayUpdateOptions',
+  'boxed' : true }
diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880..45f2ed4e2c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -513,6 +513,7 @@ int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
 bool vnc_display_reload_certs(const char *id,  Error **errp);
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db4d186448..246c8c1202 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -368,6 +368,21 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     }
 }
 
+void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_UPDATE_TYPE_VNC:
+#ifdef CONFIG_VNC
+        vnc_display_update(&arg->u.vnc, errp);
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
+
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
diff --git a/ui/vnc.c b/ui/vnc.c
index fa0fb736d3..c57146d9f8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3973,6 +3973,29 @@ static int vnc_display_listen(VncDisplay *vd,
     return 0;
 }
 
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(NULL);
+
+    if (!vd) {
+        error_setg(errp, "Can not find vnc display");
+        return false;
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


