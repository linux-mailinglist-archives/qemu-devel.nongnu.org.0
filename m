Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B738B1B9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:29:28 +0200 (CEST)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjfz-0003Bl-1T
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZQ-0005TB-LX; Thu, 20 May 2021 10:22:40 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:23648 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZO-0005Yx-Qe; Thu, 20 May 2021 10:22:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2mDLhZQtIHTMPyen9K3ok8C7tSsTysLdCXbmzEl7N6tPL4+SeLDG9D8sU08cPax7QtKnpdazvbzkYLnnzfnAkBUrsmcrh32urNZKz7gON/4c+psZrYd5kde4IjDGkqcJABz/h4Kc5T1mLyLXTwAVAgquj4/Pjkl0A8n5GpIcZ/rHQ06888C1hNFyH2nlLKwy2J04iSeXCgvoavIwxGNJdd9WYte83Ts2RsKSKQ4wJMM1UMLnjo6r6MlV9wqkqZOxHBvaOlwgp1J05bgIMKIYaAiGXGRSMMysvJgtpgPlsOOBTV0OZa7qWQBG97huiSFXzTF7HUZzjqhMRe0R0bvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzDbbNYEnbdBoSVH23LkmSfDqFedKSi8vW+/wTVhglY=;
 b=UbX8hJSefybfEfV+l7BS1UzFkJJMOqRUd/6yifoBglR+dtKiUUPWyYvxSmTnlnxrQJGLNCvlJzk8sYfPzPcJAo4Ya2PUgYfbQPICFHjFXAb5U/yCzgBjSKkomkzNH7yrpUo/g4GRUXDydM8Tx9LsTbD8SXhi3VYSh7dScakUt9tOzi2jtiNGlsBoBLn5gxvVd3JFnjgY6LS73fYoE1VPQ9wXXV+5+0q+bWqOUpOv9SDHBa12b3a+d5DBH0ugAqlTVyyoD6dUA863YGJMoXNlkEaSMtGGK56uOOEAY6QaFnLxAiVvHiICkZabM/7sceoPsK7A6SQfzcKnLvoUyCVevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzDbbNYEnbdBoSVH23LkmSfDqFedKSi8vW+/wTVhglY=;
 b=EY+2S6W2UYSbvf5pLgQNnftr/HgXdX1QEifCmnljJl8sNcTRNjAMcmX06brFJODTmFKqq5b25jR6qedmw+2zfU/VU4cw+B45t44bRxic3O/3bLBokun0tuIIfWH1zr/xYEw8sl34+XShbCDx/lanUeKgSAcsziFEuQbDT+9LFaQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 05/33] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Thu, 20 May 2021 17:21:37 +0300
Message-Id: <20210520142205.607501-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a90f6d-cdef-451a-dcb2-08d91b9ab328
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009371FEF733BBE3EE1FB6EC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BH0cQtrRTu08FA4F07BwG4rJtP8B5Elg9TpI87lYm7V+p6vOh44WRl4mtmojqSjvfd+EPHLNa41XFPqPhwCOltoR2GUQUEU6FfqQY76xtLGxYvytYcE4uLsTn+F+mW0UVxlsZAfXapjzMj/WfinL0U2DuuWgSdMfdKUTj96LmJLmUQa+NVQy0fCtN96GO00FKdrNEskaeBniXRjD9lDRJW3+amZRPaCHAiPLqNt078rEuuBKPHUorAqawQOXNchVxgYIwSVbWtOM31wiKLsrsXcnxW0aWCnnFIzii6tdwrjfdgHNfUtixlOWJgboyyKb0x47v9bUPxIYbdU4b7M4MP05LpSmWdQDGw890wNbVQHtFaXxS/8wml/3okHL5UvEE27cGoR6i2DYfOstZSF+dySxkv5rPr4/LZityIkRrmhkzI6xL77lD0cBB3ZId5QfOnhlgk23utIexRMyCGM0KoFlbfsRBQXItzziVd4xiWmcAnqqnHIxwUZiWw9XssTODS2yMofIPdUshZ265jzQR5UhbyAkCkX8S74PfXISdiAnFMX5+m86Fjq/vlwjUQnylHTOIlbSIhyeu1yn4ljLqscB8WVDYvuJ7pMJr2+pcDzOdvrejhZcAD4bUw+ULw2W31bQP0zEuj5OKtqTtz/WwwXfqMQjOpUW4uB39ODKeedsycNVGnOtE+wQB6uGcvuT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ziioi9qmdrR2Kgj2mlX+2ud/gVBE/28aINtK+MzXBPI9F6c0derFrneXvXoG?=
 =?us-ascii?Q?4nCFIzLw4YQmOU57yTirjIQDIWw3fwbxvo7uNaveiiBrXSMm6gIq7/BA1zzE?=
 =?us-ascii?Q?ckTzpRA26cwC9q5K9o39g7LFinAVkraJ+pdZg9CYHKJRBbQ2Fdmc3AdGuNqJ?=
 =?us-ascii?Q?+W+ytySjsg48kXW9bR5mDMzO42cvz2j1i37ApN56omkoTtq8B/taQmbgMEJk?=
 =?us-ascii?Q?5Vg1z9BM1oQh0Vl8tPGwm/G9B/+cvZn1o+fosERsB0Ito/qAODvMDXRvKH4m?=
 =?us-ascii?Q?ESMwCVFZGdxZ0OL3LFJHTs287mKeENC2D8FFhZeb1LXPAeTiVxItIUxLC/lw?=
 =?us-ascii?Q?8+NhN5Es2epv6ldcGx8JL0Cyd0/2FB1E0SG3uFlVH0PrFgLKPLmGdkaQuaRT?=
 =?us-ascii?Q?tC8z3XG0ohfMyNS3Xp9GsBb/1c81guMd/a6YumBwDGBDhGYl4wQZzI56UlTJ?=
 =?us-ascii?Q?zgsu9pwF6mRW9uwu25ppteIW3Zon2inRtFncTayhukIjImYnyz+h2VKZ84l+?=
 =?us-ascii?Q?jwBkeXvIDtS5p/ZFgTUO5V4X1x6nW9xed9pUitDbcZrO4zKOLTugCjHNRqnp?=
 =?us-ascii?Q?2uWjL1gkR+lDszPEG119/ZyxC4/4vKpWHoYTTclgfKhICgzW6FEb/7w7MYRR?=
 =?us-ascii?Q?xYPAv3O3hJ+hLUv3UosQG3gPHsH8jW501WboRULWoIKxTp+xz550dilv6X5y?=
 =?us-ascii?Q?RUZ2rrbpfvwKszDGR04iXmacWU5eTW936NUVPzCLlYyQ+UaUXGsCamr141H4?=
 =?us-ascii?Q?xuHVnPm6XW96PFTCNvoPjQLGHm9y3ezy9g1+2Hm3gPSOpU5ItFuWNfRMTXYq?=
 =?us-ascii?Q?oJQL3o46DqJZOdRsqfF7b7/8SXKfGTMl8AHa0zW46Vu6I5s63Qv3ZDE6O+p+?=
 =?us-ascii?Q?QTqadN9I35r3qh0IvaalywmzZYsCuwN/yalczI20tgSIU0Y8eGjkL43oVtIN?=
 =?us-ascii?Q?rifubll7x5M7yE9apZiQ9w+cA3UYFkv0l97m+Dy7P3FPXH2dxZgNZbfoPq+l?=
 =?us-ascii?Q?yAL0p6GwX7RRDoagbbG/7bHVB8ScmLQcbhcB1cNXANthoXGFuCWc//iEf8iP?=
 =?us-ascii?Q?d37u733Z4owNkIQ31sZbT2SOLb3tNThBn+bsn4Tt+lEYrBlRrzkky/KPlQA+?=
 =?us-ascii?Q?cBKHozx9Vt5jcEhEnKF1lj1O8BRTLCaV61bK0lU0PbkwIqZ99bq5aIgmWuVm?=
 =?us-ascii?Q?OjqyhdLJzKFbaTAAsBOuo9n7IcY0nFDcDN5A148yO7Ko6ftJ9+L159xrK6t7?=
 =?us-ascii?Q?+Up1fqV12mCtQrBbUOzDberaKv3gbyOhbU2o31yJqyvjwnxphjXctEjXsk6W?=
 =?us-ascii?Q?zmz185rrsX71DWA2yjgJBylk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a90f6d-cdef-451a-dcb2-08d91b9ab328
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:29.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBwXlASC/eYF/QhFPn7D3hM0wjxQ13E+FDj3but9pt9VtJp2wmEmTYMBeGHQANhHjv8xTcf+kia49F4VpFlqoP9MpUu6CzpSBEaB3H9VWlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.115;
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

Add field, so property can declare support for setting the property
when device is realized. To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


