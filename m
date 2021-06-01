Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85039788B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:58:43 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7j0-0001nN-UK
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7be-0001nt-Bd; Tue, 01 Jun 2021 12:51:06 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:55602 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7ba-0002AT-V4; Tue, 01 Jun 2021 12:51:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlefsuGQK0EZdB/f8H0XXozd+GEe1fnexeceiTCJCEWvGfKqKoJnn+i6nFWTQ63OriI9LRhLszzeW07AexGC92DU85roLkvASvgEANsQo5T91V3A5T2ylSyqls5rZG0qpCFb6Z/MyBvUg42nNWxfMR1/yJiq0YfNAylQE98Is/kOpK1Z/msf/4OtoRpN0HR4ljsOv+d0segmQT02+NdREulBzSi8b78q1r+RQHRCTT/5Z8CLLGzDjt/JkXDpILGQ3c4W5K0rXxgIQ49ZRK2Tze80upmWQmqfN0+swbZ0DXvuoVaFNxiw/+3A88Xnv/k8CWX592MIOIta5F8nX1TLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=RbCj/MsE0bN5dKoK0Qo2ub+pG7wS5yGfyeF4+FjcH5ZPQsLpmXfxuiXA+y+9CI4d9f9jIDeFQ2ty424yYU/YAJaPdrbHfTIcmoYCF15bJg8mRfe9KLUBX6ir4J/sAASVz9MxT3nttpUdRTjAEd37ZPFNx+BLqfuQL4je24PanGNWTk09BmXGtzvajJZs8j+gmjl2itgW97DgOd2N/aFgqwqv6Un47E0w0nk3hJcqKGtACbRzsGZLr8xfyeWpAC/8V752BJPqjNWlByfkhkGZnIClsnb1h94UiQ4vvBBhST+x/XoFHV2NHGtJgjL7+S1ZI0AUKkZ7wdcaN6N6mDDc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TYk/vlRgkhlvjrVIe+Pk/FNNMZHyvuvS9JwUm7efHQ=;
 b=bzHHgT8k3Inrov4FboPFIHuYiOt48/jIUvZ3yStASA6iLGq539Z6D5wGydBu7q1hS0s7z14ssbZYM6JrH+1+zb1UP3ZjQX7a/UxI82Onaho0oJ/MKASxC0h21bJfJ5P2aY8raUEA91G0us1xW8t/tXDv7nW+MMkirzSxudFhcuc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 05/35] qdev-properties: PropertyInfo: add
 realized_set_allowed field
Date: Tue,  1 Jun 2021 19:49:56 +0300
Message-Id: <20210601165026.326877-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c8f1de-2aac-4548-5bcb-08d9251d68fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44714614012734A4BF3DE486C13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlEOIpiKhry61R7snVIPWtV6yRI/puuhQRmtdZ8uZeU/8/oZazupJ88Og4nqO8y2jmR4NKGvr9nCm9IPE0D+IixT9hJOh1tUMoOHymb1bMWKbi760VwaHAuPWzXxPiDM6l4kSQz3+suKEt20NRnN2NTTvMca1GqqQcX1A5FbKju7CKHQcXRfd0C14vdCvv30ZTxXQhlPTJaHo2MNCQp1eXfAjigg1fZueU6BB3zgbqOBJD9VFQVzFESQP0dMmp0HM1Of+Zlhhe5G5jES3Y+nap3B5S1TCXG5+WmmObAvUTp1sgZFKApeWloQFC3jCkyTI35QjyKiqsjvYqOberJwr0SpWojLLJoOJ256zV/NX1VxFpsis8Qi9vx2X7Vzr7lyRxuo49WPH4Nkj1y43ygx55DKTlWY4PfW6k1JCTLeq8nTiira2od0PjsLPNSPAsdfb1wAcJKdHOv9SPvJVIP+ybvqgYP50LyWJEg9u7kOndfAZFZ/1y6gLMuGYclgdQM4TY2aCQkvbVjYep4tL3yhVs1ssJFzp+3AEiiiL9k9OU/RdgskodYTol3JFgYUidxTeWn1OH7t/7M7O0h1keunlr4tl//cQSXPSkmO3qNNVQhZGFS8+N8zMxeyfQCrwtewpi5YOwHa8salMIT9Tj1qlEpRR88UkrdxegwVDV6DQf1emoCTnTmeM2RrbPIDlH4Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?h8NC72yak7AIErxBArCE/HdyBoTePcbCTH1sv4fPPIdzu0kBV9tkvbXFZQOS?=
 =?us-ascii?Q?qrh6X6KxRIoSmC78jA6FxVGwqA7jrvD5n/RWWpW/0m7OMgw1HZXGxftJrgXv?=
 =?us-ascii?Q?+Wv+y4UBTCk6GbN2x8J72zpfOR0blBc+xecUcKqnPvP742GKglaq1jIhYfpa?=
 =?us-ascii?Q?3As2GvQJcKpnYafi7Mikt1xVjlQxmT+IcqHpHfsi5npWUO7iskut/x6TKVkT?=
 =?us-ascii?Q?PoG+jANaD5jVdlnFQcQxqpdDgomXmbHxlKz3YOy8KK/gxKxdJVskqEYCtmYq?=
 =?us-ascii?Q?/Tp0fT81k7AyoeOmKCOu4hjmuOsm2wh9w5mdH29xm3bCffGTJh2ZWq86HjWJ?=
 =?us-ascii?Q?NzkD9i42Mvoj2IfggDeP94WjjcjhN8T2YAoXxQ3MxAWpLvx++VXB/Ak6h+fO?=
 =?us-ascii?Q?uN/H9jFb/Nq6ScV72+utkyyy2gbt8S+/Bgp/Bx6qp5c+MJXdV1o72Cr2g03L?=
 =?us-ascii?Q?cJ0B45hjtU1YInjrwj+fk4yGQUKnroGJKCVKN9VHCmKk+Ptzl6khS7IiX1Zz?=
 =?us-ascii?Q?/nDtTdrmq2vDjU2+PMo0rGz10Ecv+63PSMOKe+uIUSv05wTRU5Yx5kd8PbuJ?=
 =?us-ascii?Q?hwWt50UsutU8PTKb5H0MfgFCjQSZ4wfPIGJUja1qTOArr7lGyWSMCP732dpo?=
 =?us-ascii?Q?51VsQGReqYiRPvwoyr6crIeU2+3Ciipy3loB7MjcGbqcw/Yvj4xH2muTlSgD?=
 =?us-ascii?Q?S6/CmiJbqPVkloROip1g77HkWzQ7i+6MpvShlCi4B/592PejB/qRJup1uCUb?=
 =?us-ascii?Q?w5fxxB8SIe8F9jmxah1SCCXMeIzLmBpNOL+zGPGT5TDzc/eJGm5kWmEVSUCo?=
 =?us-ascii?Q?uS46mknT6wTRfHijdUUhhTkugnT5X/LQRItbnZXKORExzrO95lEaA0z54k/+?=
 =?us-ascii?Q?/DTFmka8HkxLjYFzhD5ouO7PhoYvlqrcyPQRYiok13Rkxk8NGiOuqjq+Az34?=
 =?us-ascii?Q?7f4F8bMZsQJ1nPokR5D6DduiYLu++yqYxjs+EiZvwX98e90NP32x6We+XI6j?=
 =?us-ascii?Q?2cZXcolHmGOc9ObkTPONzOqBPSQtn5Cdcicw02YHETXKERrtLiG9EpDvm/aD?=
 =?us-ascii?Q?ZKaIrICdfkFNFTG/wx/rrJQPQU2Ih704GpxRxFe/1+p65oMKax+jPJshABJ+?=
 =?us-ascii?Q?lnYEaVb/9BJim3dXcFF8Be/sbHXEoUmUW7VqeeRqilrhQJdTcgqAfNuO+R6e?=
 =?us-ascii?Q?uds9xLw4CDC3kpKrWSb7Fly8fvTEp+0TM8Xv+aKoTQa3tkp4vtFvSMkVa+9W?=
 =?us-ascii?Q?3qwZ/MHhsrP0BeVwpGX1WCr5nqR6pNJpi7XpxeTYgczX9RcrB4D372j3bimU?=
 =?us-ascii?Q?iDnaPjFc0WZ6NMekUCGtbkfr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c8f1de-2aac-4548-5bcb-08d9251d68fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:49.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpvApeBI+SwppWg4DlQsyBrpkWgIivMFKj7KSXu5KLmDmotZERckPmTSdveCOBvvslE7cPV4L/GRNZFruTNluE0ehmj0KKqLWRU7Jbkm/Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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


