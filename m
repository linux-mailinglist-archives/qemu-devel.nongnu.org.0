Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315F3DDFC0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:00:33 +0200 (CEST)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdAt-00043Q-FD
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5R-0002fq-9T; Mon, 02 Aug 2021 14:54:53 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:42689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5O-0001pD-6c; Mon, 02 Aug 2021 14:54:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJEfuNEpjrhs0PGBMH7r8aLcXaTbgRh1rAs+fSvj3c/seT5jOzZM1rj8mwiRaFtuptzFgzPh1m84TBneKCGLDUwv9GI/RIdt1siKBzoZxKNLbefMjyPw/GIgLVIeFf1oGPHt7jeoyZQ912f0wGJ07yKG06NvwEN0MEM+NhLNWSnUruNPwj4mJrWzP8lKEhzFOuPABaS0ewmcG0QLdkwC3uAkpwZ60WnVEra3sUFKh8k4W0SGGEEMk/YDB7FIRNAtSrVpWxDY4dx0ylXQN3bABlIT9PLdWxlLPEpMh2qJwWAIyrxc4UZGddvoGHSiimwMioX5H8th4EyqBuaIX31BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+gCIdlP0u2YUbdrRSaOaacj6+4tkS+paGBuF7ciBRM=;
 b=NCcAtlnwgF/B5SYuFD3YYPtjqSMe9AAocGrZCxodlKJoZgJT5HamICBJFi477WRsDdBOWTyecU7ian8iVADAb7fbVtUvRb3/sE7cd2IQbkeXbPNzXydCuV0Xd12O/K0/ZJIAkMVVLxU+MdFhVc/aCSP+SSmpKhlGyE0aCHY1cjmYaZQFJ9ecIvKCiulNc/GwLJOVDYU1xfvt/9m6Ca2rLDn5AlHLtrxFpBu+ZcIWEDiMhBekW6+KQdrNJbNVeI17mLWqzJCCMddk6dNrf/je43KHmZ28dYjB4UoZsXnB2b99SuTuWnreVnPvMsZP0e4miUh9zXaxM/Z0r4705TW8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+gCIdlP0u2YUbdrRSaOaacj6+4tkS+paGBuF7ciBRM=;
 b=QEp7JW3J8+TVGiI5LBdxyx2oBBWby5q3Bd7dpqkMjZ+wt3b/AYtckkI16tbEAubKCJwc5k9rXaKcQMg9qoLqCEDBLXEWphImFuBhxe3Nje1vpBaR3JZ+eptMrHxcWtuecj/pD53fQF1T5qy6ORaVq64VF6Kf9jI65ouMYPYcNCg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 18:54:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 5/8] qdev: improve find_device_state() to distinguish simple
 not found case
Date: Mon,  2 Aug 2021 21:54:13 +0300
Message-Id: <20210802185416.50877-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdfaba5d-f219-466b-54ac-08d955e6fd7e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4405D48F6ED8057D9C2AF7B1C1EF9@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUDPXWY3SZEkylaRf5WywLpo3fLBL2SLdxk1K/ZnHhPsI6cudwMNVBBE/ZDq8jC78GZtY6ttW5JD5J44kCZOIhMlJ2O03WdI4ifxLeDmdW4QLSsS0XZ+L/+IofLfCwMyMvIPaGnAvYBjQbFJmX9QYsy4aglWTOGt+a/hh4HabVD7vuvabw3KbCRz1l/6vf4bMnYgJila51ySJWTtRufQCl0KsVQ8TaDY2aVsVF7K8x6UeWqT3+Lev9yF7Ui10tlvWNAXT6qYEvmMwAeTNgz9hKFtEZTYPCzJjeMj7oHvzqeC29bCqwqckl0BCvB1QUDXs9Yh55pJsZoxu3KBxfVQ6v63z6ElLbaOz9zo1utVJQHj2dPZr5329C6jYQiS4nnyrBtDid1U64k4wex+4tfUFyWwRxQP4epDq+6+iTuaragvWJItuw4mwIbx85btQle6ODUOc9UtpZjoYczyXkXzrnfMWzl0vSkCn8wVgffovcIgLMNhmJIoJIMHj271qcpMgmmZkGZyqzZ0WgmYkfF87XY4ioQku6nKaEL4oqG9ClUbYP5VFOgEc0EHyArNEMDj3IgzkGJmkTp9RZ8oKqd+wJ+M/rLJTNAa3PMM6pnVw2ipnnDuxDsj/NDJoa2s0sglsc22WObTw/3nWSij1fxYq7amC9oQzHyXszYhJ84NjTOrTSAyLfCh0BnK69b4HQNt02zOH0Y2n4aTevpZ+D7ehg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(186003)(2906002)(316002)(5660300002)(26005)(6916009)(2616005)(956004)(38100700002)(7416002)(38350700002)(4326008)(36756003)(86362001)(6512007)(66476007)(66946007)(66556008)(8936002)(6486002)(478600001)(1076003)(6506007)(8676002)(83380400001)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ts3vMJhu2GZgK58TpZ4fqP1+ehEvOkHPgLbSGRm21Kd2L9o+5ouHbrGXRQpr?=
 =?us-ascii?Q?14mnyrEK9h783OemnZTQxb4ISX2DjtOf03wi+9V8IYdXEboqwQluk+zBQy4t?=
 =?us-ascii?Q?5i3KL86T6kJDHipJIlbLyV2oNUjj2m0Cst4yKXEgOcWAR2ICl140L+fBbmX1?=
 =?us-ascii?Q?6fZfbKBNLNkkDpgfX5Z7AAMEYWaN+ztYU9bHKRaxVRLaJY94asK31LVVuZkj?=
 =?us-ascii?Q?rBAVRDQWNS3S08ksiLoxQxAzfNBJ2QdQ2Ztf6Mf8B6HZuDqU3SpLbDLHwwr2?=
 =?us-ascii?Q?l0ETgG6dsY9IF/8rZWSgyPb/9kzgtJm/1RNM/aR33bWNzRg7KDDTgclYfr0j?=
 =?us-ascii?Q?cv4UBv/b2gHyG7pg4B5ZKtbd+sKxkfxBidr9fXpgx9pI20LjPinmJSZACMpJ?=
 =?us-ascii?Q?mbqu9EITy3JwivRuC6Gr8dYfNFvmsGEgnufEHxKnXmjfuDL0IVW6EeTqBv4c?=
 =?us-ascii?Q?X9A0zthjgDm2LZozBZxVuALs1sYvT398psZmu/zqLNNbppM+oI7WgNDJFd1+?=
 =?us-ascii?Q?qgaJE93vW+mL/e3ony+pGxRy0vD/o6x41gpBMG9YY1nIKYiAEMUnnLILGbS4?=
 =?us-ascii?Q?BDOUgbEl1c4cz3CgPwWlD3xs+6vtxj13YvkVIvyO5oyloZGmVCV+HtHevKoM?=
 =?us-ascii?Q?aGpkRYgXJveKw3kAOEtSTcL2aFJ39ABGO4XrNI21WmuCh9ys9iT+0LJztzlQ?=
 =?us-ascii?Q?l/T0JmhYr1pvyjktgEzCIi7HdBpxUknOLIYKryBnWXGagXv404tamTMWg/dC?=
 =?us-ascii?Q?sBJQEhlGlm/XSh2aD1WVCHQrsmnHOy7qDEEakXMbUJJ/P0S71zIdP8FE24G3?=
 =?us-ascii?Q?t7t2rYVRbLt2w3Ul6OXHv18SuW1aU00fxQc+f6qbnZ/yO3LuZTNWmcQDRTTj?=
 =?us-ascii?Q?RYk12i1XrNhKjCN76xAyS9KfPJEJ8j1yIJeXM9iQjKuAAGQGMkWrqnXbdJ16?=
 =?us-ascii?Q?mWcrhPTAlLPLKkOM7ik77FrBL6XPj93yb7D72lLcPwsogYwJiFxiS4y+LTUj?=
 =?us-ascii?Q?zsApirauQWlSUQVhBT7fJlYEiu0CBV9DExCHBOOl1y3e9gO5mEQFB+91zppr?=
 =?us-ascii?Q?w/b97eYPXK7w7uWaI/RTebojogsc1BqPaZ0XECpz+zmHkqdDxXik8zlmCJEC?=
 =?us-ascii?Q?V69uf/FCM5NbFn01OvGuV42iT6EfAd6DwFIGoJ/g0Yr8X/IebAlZgqOPn8tN?=
 =?us-ascii?Q?f+ebVlc7nBs2MBupw1JArpgwWJNxMVfAQTve0axFEcVcSr9oQiaHIFrwk0Zy?=
 =?us-ascii?Q?JjzLAMSYnTiYUoJtf1ElDZX+cbOUb9Q8dBG49/NpdyqqmntatZeclRudFiDw?=
 =?us-ascii?Q?xSTUl6LBLweKfZY8hnUCTQIC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfaba5d-f219-466b-54ac-08d955e6fd7e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:43.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDj34qlxU/JqQgRUSPmAH78CFcAbR35VFoamZ/SVJC93FBpS2Ssno0iA/jLofn7pnNK9XDQlLi7XMmNfrqqJgiEeWf9PXe98LbaqF5C1R5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We'll need this for realizing qdev_find_child() in the next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 softmmu/qdev-monitor.c | 48 +++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d82..0117989009 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -819,7 +819,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     object_unref(OBJECT(dev));
 }
 
-static DeviceState *find_device_state(const char *id, Error **errp)
+/*
+ * Returns: 1 when found, @dev set
+ *          0 not found, @dev and @errp untouched
+ *         <0 error, or id is ambiguous, @errp set
+ */
+static int find_device_state(const char *id, DeviceState **dev, Error **errp)
 {
     Object *obj;
 
@@ -835,17 +840,16 @@ static DeviceState *find_device_state(const char *id, Error **errp)
     }
 
     if (!obj) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", id);
-        return NULL;
+        return 0;
     }
 
     if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
         error_setg(errp, "%s is not a hotpluggable device", id);
-        return NULL;
+        return -EINVAL;
     }
 
-    return DEVICE(obj);
+    *dev = DEVICE(obj);
+    return 1;
 }
 
 void qdev_unplug(DeviceState *dev, Error **errp)
@@ -894,16 +898,25 @@ void qdev_unplug(DeviceState *dev, Error **errp)
 
 void qmp_device_del(const char *id, Error **errp)
 {
-    DeviceState *dev = find_device_state(id, errp);
-    if (dev != NULL) {
-        if (dev->pending_deleted_event) {
-            error_setg(errp, "Device %s is already in the "
-                             "process of unplug", id);
-            return;
+    int ret;
+    DeviceState *dev;
+
+    ret = find_device_state(id, &dev, errp);
+    if (ret <= 0) {
+        if (ret == 0) {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                      "Device '%s' not found", id);
         }
+        return;
+    }
 
-        qdev_unplug(dev, errp);
+    if (dev->pending_deleted_event) {
+        error_setg(errp, "Device %s is already in the "
+                         "process of unplug", id);
+        return;
     }
+
+    qdev_unplug(dev, errp);
 }
 
 void hmp_device_add(Monitor *mon, const QDict *qdict)
@@ -925,11 +938,16 @@ void hmp_device_del(Monitor *mon, const QDict *qdict)
 
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
 {
+    int ret;
     DeviceState *dev;
     BlockBackend *blk;
 
-    dev = find_device_state(id, errp);
-    if (dev == NULL) {
+    ret = find_device_state(id, &dev, errp);
+    if (ret <= 0) {
+        if (ret == 0) {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                      "Device '%s' not found", id);
+        }
         return NULL;
     }
 
-- 
2.29.2


