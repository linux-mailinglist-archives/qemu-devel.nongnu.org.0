Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A73D0C5D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:19:53 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69KS-0000k8-Vt
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697S-000787-OF; Wed, 21 Jul 2021 06:06:26 -0400
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:9313 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697Q-00020O-AD; Wed, 21 Jul 2021 06:06:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la+zHlXUkPVi0Dn/0bYCijVYXIlufSi1qlw1pN6vRfsYrX3PfZ59i7wgaySw0CEtt9tB2gtHcAT7Uk3N0pTVMl62TTONd7sc/0O1/NZV8DQsezLDx5yBtac/cUzS9uMzWkE5tpBci5WtawOfYMs0KJw68cmvGRCb3bHyR9ohQb1JFa/oIOME0/0KPmzWZIrtQaPDUTU1MRn8CT2iYQm07p4d0EpDoOa9PCKOqN+EWjJKRy7zVYsxM5Hwg43qNv+czskOd4oaFmWMzpAb5X1EpO7+aoBy4B+x0aBGhxziIprG8ZYkcKWGj7oej8xqwdj5mbGkBHRTTol+n5qz7s82RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=a+afDjw6IyG2FFnwEpkqbYR4yA5N4rXYUg2jXp6JxLkhg/AQuOARjPJv8+t6DjNV6PtGVbLRoNHfhr6e8zWzZPE4M2ye+gGz8l7PhZYlGSlSaP12hG6gTHP2uJUmTzywwKoIuoq2CFXmYiFIzfeFB6UMrg7vgM8Jp9nh1KHexWo3Fun1sqrCDa84EoWB89f1q74hD+PITwenzg0jb/ms6kh4e0o/keRqLCeoY/w+LnlR4d85DvhXRbpc+pSFWDu+MsTday/pzoogNFhtS2qB4UTCgNUXmQajkVRQe/b/UnQzln4vyNPaInkMf53HvNdaMYgqY0qQy1+4BMn8Q7W6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=tGW3NX907O9ly6kM/b1QSh/mq/tImpw4ZXkAl3LJ/FZvtYxPVxlBFTR+wD95nEBvr2SREQXUoTm7ySawilu+x5QBKTtOxQMdGKwXeR3jyeV8sKm8Wzb/gD9VqnztJsyEL7jJhVEZzoGqeNc6dN/SXCDO0y+rRwuIvOhWp7l2+88=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 03/33] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Wed, 21 Jul 2021 13:05:25 +0300
Message-Id: <20210721100555.45594-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e8459c-311d-4a4a-3a51-08d94c2f2c3f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168E6331338ACB9E9467E79C1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXr/2bX04083/fLXR6RovylTMJyDkCbka8+MAQswraCSP522R3gOG3duv4UNaTG+iYflExkeigr2mNXPSKteFcaQPMteMkJdAv9ylISQltswMlu6Q4KzHTFCFwYcGKldLXefDkKS42B0uCWYzIBQ+cKfSvttQhXTto3Cig8xJ7cnS0GPKDgvP0QOQg85hjQ+2kDh/h642Xmii1hUJC/Vg1hrbFg32+8dUQBDg04fgeQJbJS5okbis8fecadsadI2adIl0f21j30PdxaDIIHSRNVALYqYak+yFUmyGr/FHjoEsRZ26UYll45XYkg0A9gcVZ8ubNOcWvkWkxAuYK/0scQYwQp3XaCzK5IBJldMrz355yaOU1L9u6nY/wn+BNK9IgQiiFg5328uknaUYlKMfm9IdOrcND5rVsk/LXPofCrMFumRaNoDGYhihgF+n1mrpFkcsXHbIIATo+Pi0Ww4FPYXDohmkDFaqH6Giqq9qainz2Qm1nhkyNDvCWip1HGqU3qQFRm46rXlBd9s8kLYtHL6rkI2J3HW/Ae2As4rxJolOfT/Fg5ODOWmcCo2BFkJaEvHdrMkxfQa6/dvtfNrqNUNZvENDvHEuqL3g2oPlNNv34HfkVA4us2/H7qV/BMUy1/ocEyWFyHe1gFfsOqsqpAn4DJDjn+D6BLOo2MplprvR/mDuyc8H3F4gXCzPs9cKS0bceSwcwCoWZEiAB8FOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iaf+LlAr7JcgcYHV0L2wvsxlH67vyJWzWcKqEAM6OmO1SHbcRCyx3izantVv?=
 =?us-ascii?Q?0bnjK8YfUacThs3JcY8XbidqaaUCw8vrFt89Mos4ZjMbiz2smpcZPR9fH197?=
 =?us-ascii?Q?IULNe+OAtP/6ZmzqAouhpIwzZDz9fUB0IgzLAC6HgRlHUnP2R9W9+BYpPJhA?=
 =?us-ascii?Q?Vv9UZY8IQ4tisyAYWvI6C6yv4rhuWFBsNMcJuNa7Pha0jp2gHstvJNJK9S8g?=
 =?us-ascii?Q?O4+df3cbg7OzRjwBQMl21BKRlFySTJ2MUXPg8342aEpKQVDIR7Bg3ZCjygk2?=
 =?us-ascii?Q?oqlge4F/iYPzLWDECE+5AvfMvQQpKf+9FFEy2GL7h/jpAHGUOGHC5rY2BtiR?=
 =?us-ascii?Q?W4r9B8WtNz24lZZW1kStsUX/89oij/D31SDEOk1Y32jX4OqAv0bI1I7yQP3a?=
 =?us-ascii?Q?wbGDT/pZAzub88X2E9t2ePmIpqCXmuafBJeQHkLCnf7SYXN1wv8MubPfOb/F?=
 =?us-ascii?Q?/EHoOIGhV3S5NblsRcsjhk8jb+H+Y0fMMe/aTlc+tDtaU9KT61vVYBTuCC7h?=
 =?us-ascii?Q?AMGE/+EFZGMZSjmnR8CMomNHKeSGtw2pzsE+rHxu/iizanM3pzsPC9DhJ2Hc?=
 =?us-ascii?Q?dnunOVBN6nb2ka2dOjZ+asy6dbrtgd0DwA2vBkBUf0WBAE46a2gENGHFWInS?=
 =?us-ascii?Q?XJDfQ6aJTjub0Ba3ulZA8TDxuZ5nQYK/km1z9UW/uawBEuPmhJQF01zWxF2/?=
 =?us-ascii?Q?ylI4lzzVUDJcWx9sJAV2ATg3bKGNMHdDAPDHNAA+Yk5SS14v7Cx4cuIY1Qp2?=
 =?us-ascii?Q?gyTQW3YlCqFvsJhBrh5dzZR0KLK2DBWsGmpkj2hLAB9Kn7VnmpB1cjgHkhMV?=
 =?us-ascii?Q?UlQBq5e1uGE7TlklINezANA/N0qvzAhcsPZELROTcHczdCNI08BWhP++ggZf?=
 =?us-ascii?Q?G39qqRTN7H/xDg7H+i6hMG19x9A+gg3q4lurkRUrEbtf4ohkrnFv2ghdNF/9?=
 =?us-ascii?Q?07V9Qxf/hxMNB75mpQjIxhAwUVRoZ4odsDiyrsWXP7VB7Nsl6yeQwNa6/oWw?=
 =?us-ascii?Q?x2DE0UHYLGpdL3shXUrAVrJLWws5W1jijI+rxSAx89wK7u+g/f1Lo/Lx/P3m?=
 =?us-ascii?Q?N5kf8BKAZK5X604a75FMh/KwFa9xB6yw8GhJN51IgNbqHeamFiYxT++vji4P?=
 =?us-ascii?Q?vLDTHMQjd3gU1BOWFhJKahq6Fqgqk1wdYSmXV9zaDk+vO3G/KcFoInzQaWJi?=
 =?us-ascii?Q?XoWBqaZr/KADpUvGjN4HEl/zLRaCdx+ruMAp27CQeuigqOC420hadhOgXlJ8?=
 =?us-ascii?Q?daYeDoNdpJqXe856wrA65qLjilMlW9h8o4ZIMnNEt9ivLXwpaCoTxG7pIqyq?=
 =?us-ascii?Q?Y2JxGkPiQNtwuBKN+63pp4mz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e8459c-311d-4a4a-3a51-08d94c2f2c3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:14.0325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dkv3tJ5m4c8Bf0Azd1+8dgymF/sFxA9EtMIB3KHSX3EL7qV0s/MeX8nyJBFfac8zBum3v7vjb19qY+K2TKjMTaSyBMQeAFwIEDYVmXPKjAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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


