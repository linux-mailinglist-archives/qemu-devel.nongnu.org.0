Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902C398A3E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:13:41 +0200 (CEST)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQgm-0003JN-6y
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf0-0000Eg-C7; Wed, 02 Jun 2021 09:11:52 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQeu-00035G-T9; Wed, 02 Jun 2021 09:11:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJ9QglZMihA/bXHgz9UzJ8P1dfoZsSPznF6vKYLAqvxxCrvxds0ihzTotozTZClvKwnSozsDtsMBrUL8wOuIHpqQnjyrgwle4weBLEhRxWVTyrMaTSU4LW9Mla07MOeYskBs0xoLFuhFTwxTa7iugLznXBjFwjZCIn+zsDonvwceaqETI8pAqfCi3X7vqmR7/Ul0NRhfhSR/rg+TTgPyREXi4o6RYGeTs4aHWzNeseTlCvutfm7Ggn5RZcESqPQVgs/n7T1MOgrc4BBAsQd756zpFRgvww+VAmBgpYz0cd+4OBWY+CLm64CE3kO2+WDHZUx6kD87U8S0QsfBk5vI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=Fi6wi+1QR7JWXMfP3lg0T9ZNwUru5KlpkQBBUqOoXMo/2VixgtxL8Uix2GWWNtWQuowOG8x1vhNsgW9r6hsXsQZOyNMu2YViz4iRi1WYLl43whihCYmm3xnnR0ZXz1SsuBhNGOXuiMta0W7K8xza6E2cVgvX0h5GpX9ymVRhM/3w3HQ1nx0LnPOsY3tkgoiCDwm4SitW2f+JE2hLBC7jEWj/Viuu1mLzneFNo9OJgxIVZIE7go7jO1ztMXriFRRpLzuttHuMC2yWlZYrW4Se2xRCdy4cFbCsfui74RUJB1n3bxKWnD6t2vbSNqkNENmR5MwMMKH9FnIG/+f1mreppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=XsNgD4XZk1CEI9uER2n9INLaFDbndkot3BpSEH0tY1UOHYTtTGHTtyL6GMXfgoqMrSdcAhx6FqwxpJ63qMsu96I2SaI0c56Q8479GKqmRbyNc9nlJ32yqsS0PLvDcMw9bHvi547fhiB0sLNm8AQcmAKSChBoCETh9XoCTSDnnS4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 05/35] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Wed,  2 Jun 2021 16:10:38 +0300
Message-Id: <20210602131108.74979-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48cd3e5-fee2-4e8f-cf46-08d925c7f149
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376BC14D8D4484D5860A775C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5cVex7hb9C5yy1EhPpkpQ5y1kPXe200eeYoWs7almjn8kcu2IA5HaTtS8IHjYvL21VtD0wV9b1R+B5aE5N+pobUFM+vLw+9C8nz0tbAFoE+vuSpSpNIkV2geztqrSpEtJcEoHxTRDB8UVs/jHHyN0huiq0T2okFoLTw5CEij6ilhti8MuULq2/wWpn7noZA+rTWXYpEUGyONwx48zBpoqGzlcEVAAXSJHQMMCFWgYx773Vq/pk9rugC44CRJYmm6f3quUiBby3AmQ7Hn/SF6jrGi9jpHWps0g8JzGfCD9QxejHZOczYbDc3Ej1CQui5+cFIXkMCv1GIot3fHEKxuZQ3y6ITHO11IcSLibPgAWjFLJBQgr7C+0KoPjulLNE9E01JjoTQQZlNV5m1c9VVPaKxlTZPveYddb0gaX3P2Cf0s0GepD+VUUv/BrZK9I6/3KzEl9RUtmbGXxXdrZKLYNwKLUgRVKwaYwFEkzMrY6TxZrCetN6QixEi4WflNVv5akrXnvjhvBNiclKA8ZC0z449+aK9WZfuE9EU0NFTSJFHMEG5avuF1LRfY0giwV9LIa6iOhsNntjS/WSKoV4YdeoZCkhz5s0UIl5+lEVNjFmT/UdqelkTJEwYR1luSKIxKesJVy+WmiXjqqAfxCioEPQ4JPDREVVLWxgLri2MqoUrbEV07lMzsi2r4h3t0xKzd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RHL3O3Z0vlb+QrERsKTbreMi5K82Egx11kyYY3MtJ8eW9K9U9nQaDJFgh4WZ?=
 =?us-ascii?Q?u7UrsOupO4jJRMBXVL583murQJA0N5hi0Zo88YFYti63rgLxpQwOLaQrwJ4S?=
 =?us-ascii?Q?489Sng+ZpvekxDyiGBrc+YnkNUSfeSHo82iPVJB8M8i7g4ZrGGDwByum3p0b?=
 =?us-ascii?Q?0rNQRiQax1+PgeBwAXRR/Ip3Q1b4zsAMO6MoMgR0J58UItDaMCfcWUchtrx1?=
 =?us-ascii?Q?eAucCoCajnk34SU2UjQfNVmhgtWyCteXv5U6N/cJTUG5A4vWQetC1DwvAiUV?=
 =?us-ascii?Q?wFXyDo+oPYxQ8fvesI2P8ktWLA3jixKFTtFsvYFEJ2/mnbTJlIFi0zbp0VXK?=
 =?us-ascii?Q?/SQIaoeqKRkG/A4K27eHU6P4iqIYLzdO0+yk/jz6ZoL9kxaewGgqIVkXKyO4?=
 =?us-ascii?Q?I9ONqLNXktuK+Xst0VC9tEEDPnc3nF264x9kGB+tVgP4g9CWkrKazNUUPhjy?=
 =?us-ascii?Q?yRJVhM7HVdB8j1N788ciNDK+Q2Yx1kZBN+Uqs0mAXGcMUr46JcEm+6Lly6RL?=
 =?us-ascii?Q?LO1C1fbSYmYHwWt2LwG+e7+gFrJa6OVYRGtuIac7yJGbwf4DrPVdKWloOUag?=
 =?us-ascii?Q?a0C/0wX34HHFUob2iOYGMeWZDfq2PlAnuHTT4p75mcmfRlMRrsCctn0viYx9?=
 =?us-ascii?Q?udLQs5Cb2le8LOKkRx70CZohJxwFUlwdFgDv2FlpOW6OnBM81hm/tME9jZ9o?=
 =?us-ascii?Q?uBiYKduAvucjCdFO6ng/HUzjMIY2rg7eDBP2uyZt61NH9XkmshCLbQzYt6uA?=
 =?us-ascii?Q?SwsC41TM1uWV/7SefozqJjpMoOdy7YE2MjBqLr58DEeX57VfwOpdB4gvixWH?=
 =?us-ascii?Q?yzRDS8BzLZd/0jcTbizqjyB5xX0ktiGjS5UXVIBwq4p/HBk+oiVf6TiyWM/D?=
 =?us-ascii?Q?5vAD6e8YPFfOzF5Di3s1xc6k9GVjML+ump44M8C/4tV72q9rMbYSi7XP0ATF?=
 =?us-ascii?Q?Vl8V58AOG4mWY4j1m8/1odwBcVvDSzn8qtAwBS6DhtJv9MNkxfuSO4oqzCPN?=
 =?us-ascii?Q?P8axioN0gdqzRklIro5AKNG7IjR6OuVBwEiG2ilxq9zqZ7ZHarfDHq7Nl1Ji?=
 =?us-ascii?Q?IFa/21yKpFZh6dWpEHnvHNzLd6jthmrFopomtc8D4IO0aTKTp+HQrYV8GAUt?=
 =?us-ascii?Q?91R4woUcbTNPtP3LXx66zHKksGxLpB2wsxXFbKlwHksn6z1ZksRuxuRALeq4?=
 =?us-ascii?Q?HHiFwEERkGczYqxgMMi4/qHN+4OBywzfZGSA06ysEn8n4SOWAjESlc7yDV1a?=
 =?us-ascii?Q?Pz1HXnDLMTKx5Sz1IOMvGcTce27+LO/0YJMPldbTmSQtbCH4zRxJoOBpVYsi?=
 =?us-ascii?Q?wxZWELtE95hTU7j8w7HyXm9E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48cd3e5-fee2-4e8f-cf46-08d925c7f149
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:32.7696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG2Kh7bPUZV1ZXHF/7aIqpDSa44aU6PYIYptHvj/el0Ks4REslUc+05jQPBWS9b9aTQdW+W5s/8TVmD+G5NDGhL5Uwq6Y6lhQefjzfG1oEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add field, so property can declare support for setting the property
when device is realized. To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/hw/qdev-properties.h | 1 +
 hw/core/qdev-properties.c    | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ef97d60ce..f7925f67d0 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -32,6 +32,7 @@ struct PropertyInfo {
     const char *name;
     const char *description;
     const QEnumLookup *enum_table;
+    bool realized_set_allowed; /* allow setting property on realized device */
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 50f40949f5..c34aac6ebc 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -26,11 +26,11 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
 
 /* returns: true if property is allowed to be set, false otherwise */
 static bool qdev_prop_allow_set(Object *obj, const char *name,
-                                Error **errp)
+                                const PropertyInfo *info, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
 
-    if (dev->realized) {
+    if (dev->realized && !info->realized_set_allowed) {
         qdev_prop_set_after_realize(dev, name, errp);
         return false;
     }
@@ -79,7 +79,7 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
 {
     Property *prop = opaque;
 
-    if (!qdev_prop_allow_set(obj, name, errp)) {
+    if (!qdev_prop_allow_set(obj, name, prop->info, errp)) {
         return;
     }
 
-- 
2.29.2


