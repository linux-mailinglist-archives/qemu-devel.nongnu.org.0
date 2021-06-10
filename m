Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CA3A2A70
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:38:18 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ0q-0006fK-WF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpn-0003ET-99; Thu, 10 Jun 2021 07:26:51 -0400
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103]:32352 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpk-0004Na-TT; Thu, 10 Jun 2021 07:26:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKTe00fsthR1IyODGWeVSdaIutVq70JFYdA3weQp5l2XKIS2Y3kGtUKNQ1DV83FIX/Pe7tfjSfQz2+NqF/AbsE2AxzX7Lx/5mWW0LtwpcvmUM7NErWAN8cOXYnTSqMPsb5tbkHlY5jn0wGT4rhVM0aIIFLYqKEUO136a4TlJ6bwzISrpShbuLT5MO3AMNoMlj393Ohn/yScdmmwglMk8+4/Gnr3vz8xWHdRMXOF3DesQFhLwzUQT2Vz094fC5obFOyJS8Lo9BvpUvzT0wt47wgmdPE7QVFLlp6HoSxph3aDFSSQDeJCQyL/j1rkGIdLsClYZoDednR2Ta3zRsgiJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=BTYRjQOMLRyfRd9FwINpd6tBkT1gOiaN+dYCZHAfpPxfzO93HjLWUEI7TDhGzCEGCkm0NyK+x9HaEV0EhuOsyUh24M7KTk0yCXazdKXm0Vq2loBQ+dMubmktmv1reOIvJujWn+A+KJwA9hHroup4sF+LhoTzwUJQHA7GNCQ54QW1scfuJBrh7oR0evSqjiSHdLPQwLTACrUveQR9MM0YFjjsz7YKP4j8pgb8tyDJwTHI2Y+7SGv0PB+BH/W+HcguRfU042WEf8RZRGX1qlD3o6zvpFwgs2utzVkwSd1HKZwVj/82o6FLW2tpHfX1GcgdcfFUbwsXVf5A1I90XMXoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=SACj9SR8jlgZb7Ko41XaWgIGuprWetif5XncVYDnn1t2XN0CLxDWKOHZPyNlvX6H68772EmJ+4uNFcwfvbU9rKobBel/OR+yC/h3Klq+d+WlKtwJJ3Tpmkl/MiSo7aU6ibV+1lmbV+emLbqDCF2nb5Se49dEEjWTIfS2R4sQk7A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 05/35] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Thu, 10 Jun 2021 14:25:48 +0300
Message-Id: <20210610112618.127378-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca2b60d5-4bcb-46c9-2c38-08d92c029d58
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3960EDA6F7E096856790238FC1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5ChlF7ESx+WN8iRyi//IcKVGnj/RHCwrF0mjXzdOoxAOQ2tLZIrgPB7guVVOYqLpboTBdlce7+Xp1fs2SdXqh3Za2mBOifaMqSIofdufp+EKgCfoh+3usyHmRuM0zZuBmnMsNvDhFguYzfoxKeP5Afzlxt8nFinNtp9KKOtStdjLTbVTIhHZL2oiPXzLXVE4OskJQMsSZBT9i2ekb/39+wGly3AAHQVjKTMSX/sOIGr9GafK8G7iMy6lA0BFZn9o1hnSRxtVcuie5fCxIQpqk3AiryXqwGuPtTiKfdrqHV9SkZ8vhZiDENpDOyvEk6oigPAd0SsSMrcdHoQYoLaDhmXvsnOp1utTSL24ckeCJ49elFEhn/tEgFiBbEPnHjQBf2pHsEJWcy8yAwCvfvQpC76FaZNiQONOzfoIptKnP82AAndhV/smh4UGWz4XzHVGsUoCiNXH11Eb4n9VRZKQSP6XtYHtdH4T+5WHka3X7MYo8hU6GiyBAgZ4ZoJpGP8eYxgqXPyeZ86P+cWWFVn8elW8klpstaWdRHs89k+0wSjH4CFuDAVRotN2P1+mt7dTIPZ48Nz7VfhVEh5g9EqdwSlkMQgC9iCj59befgz3YVyhLRo+mzKMyVZCNBDXEkWaBp3ugx7jPp2QcGaIkDspOSaHMMcKsY8xrdsR8br+GqEL5w/qspB9HTsiY8uJYFv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(54906003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1bjq5u06dCYcr6XdxZ3UsGrctuoZsrGvBV9eI4u7r/BdQfN1KI9R7SV5yjES?=
 =?us-ascii?Q?Ni9KaRaBKh5LSHlKNqesaWidZSGnbqKTfzMZMAyv2FiHRCDTZY34MH3UqHxA?=
 =?us-ascii?Q?jcnfXDEYAAGLVZpcztRu3L6wXrtqx/+i1AEwxtHaRAPho9QusAizD/JBkOEw?=
 =?us-ascii?Q?B1eB98dGzYT2S628Kgy6Wh8Y4JHUitNE/R55EKoHcUH8V6uKX5kju7OXtiTM?=
 =?us-ascii?Q?09Sa6ltfT6aU1wwKwptjLiK1ShrjBU7Tr6Aiu1qFiE+X5bZwZE+NPtM4SqH7?=
 =?us-ascii?Q?gdY+WFZbEND3sWbSvKKlqOOhqVrV2RECxwMoKtqfB3jXgdlM6RvVbAfkx80k?=
 =?us-ascii?Q?W75Fzys1/0Ap33Z+gSO0dUfSjSg7md+18nJW+vKjEocSOWiMLvue2z7/0lTJ?=
 =?us-ascii?Q?ODYbrdcf6wjrO5tP1uh+SmmS/GkQQEAKKRPzOvGfnX/lNyTJGh4BhYoEby/a?=
 =?us-ascii?Q?uktqtqdjKpjfT2GCvQNYlIPgXyXw0deh3tY9P78kRJCDGTzyF96vMl4JGJOt?=
 =?us-ascii?Q?EFIqEIS8J7LAjDaAvmFD8nPlSJdE/snNpG72TosubGb8a8j7JiBd5l0iuYsc?=
 =?us-ascii?Q?4NgSWSs4u9Y8gss7EKF0QSwPVMfkYIdyMCTHNHMQYEVBBLTGMLbeZywLHFRN?=
 =?us-ascii?Q?2msLorZqS6/Wa/Rqf+3R1Az7PX9Z37ofD0QPxP5224U0QMaIcbhtaudOvf3z?=
 =?us-ascii?Q?zEemptDmcUzXQU/dUwmVUIHsZmFoS3tq8WBpP6vGLwWCGjr/JHY3ttrQQWhf?=
 =?us-ascii?Q?jLyXDkJ4DG/4uLNUtcDU//F/6W3TV5ntqKlV2mSm79q2qOlRx7SRtzrevT4A?=
 =?us-ascii?Q?DoFsA3L5wIsd3vOMTKHK8R+1dLPxulPZwFkrlnPMyefsoCiIa76OhiP0b7va?=
 =?us-ascii?Q?T7g1eh6edbhHpkL5+yPzwjWEh0/7rI4POfmiPalSyX5XvI5OynVNQYILXfo2?=
 =?us-ascii?Q?OhAA4Q4dGTHNkIQelsVWLHhcbMJpyH39X8KWWfdxx8WZu8EZ+KGm6fsy7DZG?=
 =?us-ascii?Q?Xxb7PDJJj798hHqUZpsmZjjE977EyBlBviIZYd4GxrAaXiovZx1Fg7g0lOBf?=
 =?us-ascii?Q?wemUbwO6+bmoOCNaKmNZnA/yxC4Wxzz+OonLshLecWL9r5E9cUAydceQf4m1?=
 =?us-ascii?Q?wWONV4Xp5W+nRe1P9kp8VuMum+NvqftDxEURyHgXkiweugMV3QvFxjVLOso2?=
 =?us-ascii?Q?D1XZWMkdwjOeOXuQ+lvzrNZw0FAcvQBBQzFCFusWNjDNpLPuzH7hC8xHBEP/?=
 =?us-ascii?Q?pobljybelpYNoIvSg9fWypvArQumcPptP++Ogvw/lFmQDL9HTLDLgNkA9jLU?=
 =?us-ascii?Q?LLVv+bIk9R+ld3Kdoxw0z8Zt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2b60d5-4bcb-46c9-2c38-08d92c029d58
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:39.2357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ioD/lsGaRsNhUaqDMijeA65mogxABJ5FDPgZit+Gt9pBZahyuSWa4q4UjOr4qklByINv9mi+3s3TJaxUkjuPh0EJYlOHdcD9ubUdJkFlRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


