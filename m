Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4153DFE5D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:49:55 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDX8-0000q3-Mf
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMR-0004bp-Vp; Wed, 04 Aug 2021 05:38:52 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:22757 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMQ-0005wf-Fv; Wed, 04 Aug 2021 05:38:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdOVNN0C77z5J/otJIrx2jnL2a3pBPs+5XrfIAS+QJqXFnwQZnjsbIj4lilyYctAsAykzoV7hOpaycGtLZ2Q5YPxAS9ShTu1Ow45OGGXFz2UPy7NViQ2s7EfApXhFE8kzZHdtlw5NObzlMsUnarBxcuq+HZsEZnstq4IDKEuB4ChbOgLa363rl+soSYCOhRKbB8YxV0HUL/xVoSj+DQvEjEAjhgv4DVy9mGl3Ie2BHbtV2yS+45/YjN9Bammf31iDQgTCHK6J7ZN0QrgeF8qjzt1uNsPhM3AFwRGx3hdl7yIcl9ozkzPgc6L82lmyg/7pGtAFd+G0Je9R/ImXC7O5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=LEgBw2w9vDhgQj1D+YPUBnMAHBHfhXcO0jJQrl00JKavggcL2VFKbD15N07gTZSQBExgFSQSCgV3QH1YHwGjLwl7h8QSXetejUBMpgv8lCH5CU+am8E6t0Ntc8M6WGblchxoeBd2jVv1bD/RXB91VXlYku+/USqNtCHL1uB/snEhzTt7wGSohFlxx0A/KQ4c0tESmcCec9qIrGOh5Ige/hJw2ITECcpwnX75iu6VlFbz7jJMISzXmo8hTrMkq5L2l4q/V9TX4t0STsWSmDbgFEhekdUl32hctsIYNi4ut3QFvhZMHwqivoMNwzEmOwymvdLMswOc5ucj/5EbNkPdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=lyPibjoiBSetJ+UHI5VU5bsAR+lkswUim/jFynWFCSHR5KJWTm5tfBo/sFGE/660IDoW7lNq2Y1mUxaWJSWmmuvKwwo+d0CvYBpjAhrU4I/g4xsBhoQILGNBQ/JnvhrQ4Sjs9WzU/0pS4JIusQeXStxqV/yGyv9XA8TY8DMn0Gk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 09:38:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 03/33] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Wed,  4 Aug 2021 12:37:43 +0300
Message-Id: <20210804093813.20688-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ac07b52-e8d7-44fb-53e0-08d9572ba3c2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36221AA77DB58557CDEE9347C1F19@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n3GsJradjfMO4jm81AAZABQT9Vls0P/LP9NbJ90QNTQknEBN+uCLrQZlyClSuZtoTLwDYeRmA2dPKoaomkPCKRDJ0Chnkabt5/HnHRHvBIlvFffqXjEBtKC4YptvwqmPVqE2g/4/WoWbcVGErqhPcfJT0hzrYfVNwb/gfemKdfKFH0zV6JM7XSB3k3W/A0nyGwgZIMxMgZN4Q1+84Fp1R0g4407U4VCT611f5JghzisyGndBEfoMN6rXkKW01FZu0JglAoGJvmIT1rX/ctrheKIH1V3mbaw4nWgAdF6isG5D+96KZVwzZ5OnAS+XvG4HWEEGZAjRu0vDZDF/Fm9cwPhSJDjCG5fqWdZw6WJIo2VdvQWemlyilkEqL29hamujV0itFn3/U6+RdPtRlgvhzyRHvQHRIIP9jjiGNQP4/mDKm23wsIo+XRhZ+hARB4c7PsROe+XCmxm5i8cILLYwqkBbgrhaeMD6xeeQ4qquOl32Ddet1VTwoSy9/zfM83qwYqSFgUbLaLHjWBoo+W/U91d0cEMRL9gT9jxmU3MZBFtK56xrD4YEy4ozXTDZQg1ITSxcFFtaz77S781YblPkGFvKGbLwtPqrRts2dx/dR+CGJplcIxS1AIZCTbzCYOBw3+lGIFNOb9Nc4KNqVzu1jxNKKnJ+02Gm6c24ntctKjGONkxBSJDlAokol7ZHeF64CLj+oBONv3aaKrvn0mRNoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(4326008)(1076003)(26005)(8936002)(8676002)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(7416002)(2616005)(6506007)(956004)(86362001)(186003)(36756003)(38350700002)(6512007)(52116002)(478600001)(38100700002)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vAWNP+5pcjcd2DrEbHeYUIdAtG/WnWyvf/i7ZORnAaNtim9JBbKvI4pVIjy/?=
 =?us-ascii?Q?og5g0az9K4LaS1Xr/5rwNf3ekX+K8Dbog9gew2Zxzw4uK3NLHX237OM1vl3P?=
 =?us-ascii?Q?GinRdNM5aSDZteSI/c3L7oK96yMunwryu8VuW/ptZ1j7Qxv1HS0or9XkxBsu?=
 =?us-ascii?Q?8/Ynu4Rv6BYJmq62OLz3LTOx+Ttr+aIo4UXqy5YbQSB0e+3HgsnBSptMda9y?=
 =?us-ascii?Q?DB3p1/moFLA3q1VmqiA/l0LhLuGycjG06nCvKlSkfq6Edna4YxKXTOJ+wAms?=
 =?us-ascii?Q?yaaCoVqFMuOqU9qnHCFohr7lW8hibeBO2WGafRQ9IUwq4tWtUxN+PxufiJaj?=
 =?us-ascii?Q?ZkS+Ql1lyCHKyCXqgdN2YLBMWneoRj2z+fH/R1PjEOgQZmT8dhHMjqjhldCV?=
 =?us-ascii?Q?2eI7//tyVmKf8R5WYPY8aT4Setxs+6uNr18/JwBuhwykMQFdU6C8fZGwgjP3?=
 =?us-ascii?Q?ucSlYhmrSq5Ke5GahRrOLsdQ2m+XnjaXLbMj+AnFibuuseaALm/QqpLT//Lj?=
 =?us-ascii?Q?Zv48iHMctCUEhMWKUeF6FwmD+qzzLC5WS/K7f5B5HxEU8xNZgichVbsZcyeX?=
 =?us-ascii?Q?FfkyNJmLvFfvQ8v6b7tKyvMV8yTcf6FaVQpWMDKw9MgX8tYs3pqapImVs5d3?=
 =?us-ascii?Q?vl39LBeVOavRR2Dsj7C8vtqA3m042uVZC7rqA3oLFpYXHAEGo2Sm5oYIuYtg?=
 =?us-ascii?Q?EoLPF6h7xtqzFO3rtCx47zPfFSeWX774BboOK+xmNg/zcilARpFnikcJ7oLe?=
 =?us-ascii?Q?oYQnNzx9kRtewsy27dJEJi7yjoUdBocjrJ4nD7egIdyxwf1GMg9zIEpWG97X?=
 =?us-ascii?Q?Va/vYaTS9tHDzNynqUtMdhiUNe9JWMKh+/0LCqrnb7FrjBh9XH61TD5KRWeD?=
 =?us-ascii?Q?INP+CXGgGlws+mVYvPDAyNY7PZyhpwfvrKCCAmIGj/sijFi/LKvTskMU540S?=
 =?us-ascii?Q?QnBZ7JJhSJQ+2Vexey9VTHsbXO84nOm0cIYWNhpOZReldssxpptV4raB1LGA?=
 =?us-ascii?Q?sAGQAthmpi86dXl0ddWXCWZuhlygcyvw7sC+uthkV88KeVDJNutZibOuEmVo?=
 =?us-ascii?Q?8TDRiixTHnI2sDY/s0Q1G/aPwH6trtuM0VJ07QiCjzXFtHSerBAsEgmA/+KM?=
 =?us-ascii?Q?mK4gj4P51XdcU95yytnUYZl1njgvG+C8e9L1RZnyoy9MiCrNQ2MqYgptMuJ5?=
 =?us-ascii?Q?ICg09do159tA9tmnXIIOfnHMpX3BjTINZ3utRVO+H6A47VU6S2u+rg57gi7p?=
 =?us-ascii?Q?Yq/jHSAhip/svkrJvUbSGOvhjdWeF+liQ6Y1d2w7bDEYlCq835pTaxneQM/Q?=
 =?us-ascii?Q?5z0vUiwIgBdiHBuKnHcbm/0D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac07b52-e8d7-44fb-53e0-08d9572ba3c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:39.3751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYP84TZjthJHtjTSTCG5TVl4jIS7nlwBwBwW9tPwClFGjuJHsXhDPWzGfBK9xlGvm6Q3tdZU64DnhsnA4e/RzvN/HL8CzlB/hRsXG5JXk0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


