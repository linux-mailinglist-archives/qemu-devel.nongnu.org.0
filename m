Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4203F5A0A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:46:51 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS54-00017i-1V
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy4-0002SQ-U0; Tue, 24 Aug 2021 04:39:37 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:56386 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy3-0007HX-AR; Tue, 24 Aug 2021 04:39:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfwHYe0e87VLUMMCBZrZGSLmDH8gqsMKEBI1ZvQ1wYKF9D/TXyCwUTwRiTLfZE64+X+bZI9dOppg38ociVpIMWFW2Hv5mDsk635EXbLU8uFlLw57vPMei4sWptrCICqNn6dccpljycktmtusRmJ0uJdmA2cqppxJIUq6IHZ8gmlvB29nQo2t6VeTZW8scDmC4JeXbNbpUfuZ3dXtg87k08ejk1l4djjN4hloZUJHNyteZRb+2DEoWNM0I9M7gOlqa7ZS5PznQQDgEqYN4K1JIULinmjIfQQIF/KcufcEoAMq876ToyhCvmujpRBd+11Udb3273sYBgSGIegnvLZn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=J31WYg24sd5oRJCGVp3Q6Pu7k2iQqbP+FUAcCHMGdmUMRSdzIL2lEEkjVa7pbJq7IGwnToIjJFHpEY9sFxSmZ8qOa2c+e9f4V7pENWoww2VcUxa8pqa1t/1rf7PO2dUA1CRpe+8Wy5Qmp5xatTggFJFoTIeGrDU1/fofg5qajQNfPf0NOFBvUrGllpgyYLapgn0SNvsMTFGlu9+K+YSMB7Ev/2RGSesulqgcrPlbKcwvTLP+KH4M+3IGswqP53Ggrp/Uey8IBNDuTEofX6MjIEF2hNwYxRaerhyIj14x3CypOYKZ3ZdDnke+AeAOsyTpu544sSzuzPZu/x0ujVn99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=PD6OKDFl10QcCs4aMSs5SttsgvH9oiVkIXLpBb0cSl3b0zkxaVR7P8DV6cLA4lqfjLw/R4jdzzrNO8KHIIO2Vb0vPRlmuNl4G4Vh2Km4aLIfZAyl0UCfXqjq2c+2s3n0sg3ZxdbGnfsfZFQ4B7evtKgH9F3eDMuhSmtg8BOyo+I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 03/34] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Tue, 24 Aug 2021 11:38:25 +0300
Message-Id: <20210824083856.17408-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a6475e6-c311-4b91-e0f1-08d966daab20
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65332E9E4D0EBA7EFECD55EFC1C59@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d08I4M37mEDKYNH3SQf1B+S18WPAlk9C/weC4fEqtyJtJvnkGkTv9ybmk8ddcZCpdajVJiPxGbl+/UpcMxMdncb/hBLIdZmc6YiQMf8eInmMefNN9DHHaYWicu0Ag2at1xdVNLm2WLtKDpZ/XT5VKez8y3uJd51/bKOmx4rcBtRvZz6rCFaB5eYMntcTkEFOCIpNMsEooQO1UuyDay7yvGU1vt2cJIARISARRjiaCcFtFxXtAJD8pgUJ2CAfIsUNPB3mwcIN8De1K/plnP+QO15u6FbwE4fUVgT4WtD6tL7EIWGUKFVt/O521qX2qgPu6Rj8aTEYUjDEBCd/lxaeC3jPBjGi5+0MJz5fRjANBFyuGeP/wfAkq6kypZahjB/c664R0qizLCL0R/RJ4ZTjpl8QD2vynQ724h1vfnVO/Gb+Y25SQ3sssXYuxoC1QjjEgmRE3J8Ljrbn07jQFBcUw3F/RY9C/w0qsVK/GBdz1qhfns3rt/LZs06+EIsX/ntn61qU0XNuivbnAp7U+oGDWI4Jk3zlhqfWcGsxamIV8kO5vKRWz3zgEllG7SkW4y/YCrag2SITuhK9XRqEq8o+5DnpviKCZnMgcGMp2+O9hE/GJQZW7G+G8VvTF1EskgUBSeleEeciBtReRjaQ46rghfk5QLRp1Fvjeg8RHIWwJz8JxHlh8UjrFF7cZ2UwznucMRt0Dj8+n8boEsI1HgwE2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(316002)(83380400001)(86362001)(36756003)(4326008)(6512007)(186003)(6486002)(478600001)(1076003)(6666004)(6506007)(26005)(38100700002)(38350700002)(7416002)(52116002)(6916009)(2616005)(8676002)(66476007)(2906002)(5660300002)(66556008)(956004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KWF6tP3fTieqRqrXX6B3Wp4tv1zfmxoometYaIbvNAju+NKMbLcpYcrdfV8/?=
 =?us-ascii?Q?F8/5IXLYFh0lPJPxa/KCaDlX8v6Ey9RnbaprhhOjv045y2HCjlg9QN+NP3eE?=
 =?us-ascii?Q?PmAVcwNPKiVVOQjl1qpxBV+InD2oh/mKaNcCqrRuYAek7dVMPYJyXMFluZez?=
 =?us-ascii?Q?fQgYxM16pskynrWt5Ab3zeEbmlhrw2vgQqx0auxPVHyErdIv2RLcZUE3LBRa?=
 =?us-ascii?Q?6fd1sjy0cc83/Lx7pWpuMvsNTAiqA7VFoUcCtB1cUoJPwtV3l9ArG4tAUli7?=
 =?us-ascii?Q?zPiNgn91e/9ARNvpOD9BTaJ4hKd6fMR6wBfzn31ip9s+e413Ark3bq0k+QgG?=
 =?us-ascii?Q?DJlKQ5UP1Iw0dN3T4uA9tuvv04wE3/PXeYQK1OSLaNm7vTFUuiZt2nlVGzdm?=
 =?us-ascii?Q?3myniJppUndQ2RyqR/k7YoHWgoQ52CBv7tbVQA58MKIuXWHf0L/XbPefDdkX?=
 =?us-ascii?Q?m8+yNATODcziWW1kP7ZWQ4vnx3NhcQfe5wWJ7g1bDUp/CWKoguZQ70EL+R5u?=
 =?us-ascii?Q?XutawxV8PWcYbVik1VjwTt3oBQozhSDj+hSadmjDSXvHKkZMF4dq8VD5Wx7e?=
 =?us-ascii?Q?vlBEV+eo3QYjFsBRhIq2zzbhHQqmKORdEzJ3H9773yf/84bDXWj90cC8/Zg4?=
 =?us-ascii?Q?CykXMs7tQzuXeFo9gYEHjjkggFZGpnS8m5TUl5PIQ6f5WNeaiYh2TS3mjPgj?=
 =?us-ascii?Q?Je32YvoYVUBfMvxxRqnAiInrHFbh3BIVBFE7PTRBU9dXP5wJSbHbZfXBRVw/?=
 =?us-ascii?Q?bLpxJ8Rc79gV0oWqu9GCXW5m/+4AK13PoIbhtYR4hbS6Y83Ebs8A3l/q2A0g?=
 =?us-ascii?Q?mgRAO1LPWmXmN/MdIFTm/MY7tsTvyoXYnsSo9VYxvjRP9BN4RYZnBPwVvBEU?=
 =?us-ascii?Q?IsjznEZIArOgxiC0dw0MfPcZ1ULALBeLX2P4YqRu2jj+p9DpjIzlCbqGeuSM?=
 =?us-ascii?Q?jBvlHjtLruqBQ27U5bn+RnFYbiZVJZ3G4GpmxB5Vr4lt3l+mwCmSgAt1u9mY?=
 =?us-ascii?Q?PTNvETFVP8saOaaSv+XvCEceyhRQ5HWQknvvBzFgU1tQ7rNMddTkaiTG2Vht?=
 =?us-ascii?Q?GzyYiEMk2sXMyZx8JdlFH6ID0hv5846i1OLvo//q8nslFBgQ4JhmizCcwREN?=
 =?us-ascii?Q?sxVpllcc4m/vd/tgIF4L73R167tti6AklJsOhne8jOINeEWOUOBepMzs9gXb?=
 =?us-ascii?Q?j4GKFTH4O+OWl9dlwHekW1ncBmu43gKpnVf6GenC33DOnNVg3ZdoZi6VeROd?=
 =?us-ascii?Q?SbpOAfUQ33v3rsW3vB36bp2OSALPreDTzpXuUY4YdarSTvOHUApv2dkarlKI?=
 =?us-ascii?Q?LjAUDQdzDly6zyaGqlxBmjBL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6475e6-c311-4b91-e0f1-08d966daab20
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:21.0663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8g5yP+4KtmrYQNk5vNGEyJcHHL6kvzPdq/F1Pyex1qEH2VeO1H6t5RR6igVzg9z19PVYjkMc5z7fePTZcSjGVBFyLE0KZWKVn1Utq6NNwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


