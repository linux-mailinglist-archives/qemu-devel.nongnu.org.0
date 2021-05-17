Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A586F3824C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:52:18 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX6v-0004mh-Ms
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzt-0003bC-Ta; Mon, 17 May 2021 02:45:01 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzq-0001jR-M5; Mon, 17 May 2021 02:45:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wat5xTfP1HUUAwMYmmUxmb1VhBcdFCZp+RYd6dwOzdWgR2ZK6en21dVKFC+Hn0B4ii1IT11o1iKFQ2jJdrp6yivuSW9TSb3G5Awo3wtaYyjcsSHrHLRcLoxSG2FFTfs5XOYeii2PKR9prg93ub3Y6tkbXS7nyiOqVj3Wf9kfWOTPaS69eyZN4mqN8k4CMfkIpJdN02XLZTZdPTZcWBPYys9F7/pWN9BYJRBFKKpEatCB5274b6GyL9w0AvcJ+Lf2lwYQjuj/IdaSJn124Bgaz66j6a5LxLPliavVjCs2Q/95+fu8jgGOMsvBWfh3ljY34a77wXXumzKjRISxRnvc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YegxtiaAeNT9R2Y6VtQBS1yg+abF7zZI0GqYPJNVQ8=;
 b=cUCWFyorfebays7B+7oDgybv6yMi48/ELhoBe6w9Ll6net6u9qhLcLi9VTlKKxiUbJ105GwrTjJu9bOIgGZ7rXj7n/V1rP5xFdPtGmZ5R3c5s9vVm27RE65WOiQlZNdsXebEU4cLPATqStWJBbMsVllh9q3qW2UWmFBvqyfKA4tNgu37Qlh6wdA3Rn4rS+5y5cwl4D1Gvl8VUs99btTFwmcsGfkxiAXMy4jPpC9wZHoNs53ZYfrA4GJBD1SfJBA1jyW+rLdFiMx64AeeIn0JWiMs6VXNTxfrXb+sXNs3A6aGov91tgHotzpSoPDjEUw9KabGp8EAoUqj8vSiSgNwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YegxtiaAeNT9R2Y6VtQBS1yg+abF7zZI0GqYPJNVQ8=;
 b=vm2jfYrdYD9Ur5/c5tcLuDlL5t59N+qu90y5OOcCEgTAD0vOEwL1yN6xI/ZVHeU7ydFv5ez0z4XIbaH+Eotl76BHi6AJJWW7um7Rr+ppYLp57gKFuga68g4gry5ErNhv5fixdaJWb73JYiiwv6DExE9a1kg4Uy6+UQ0KVFLQius=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 03/21] qdev-properties: PropertyInfo: add realized_set_allowed
 field
Date: Mon, 17 May 2021 09:44:10 +0300
Message-Id: <20210517064428.16223-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d1305e-4436-4312-4bed-08d918ff442e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33829CF992CC4BB8EEC800A2C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sore2cIERSfeQYDCAaHj9HOhRO2MHeSdbSyDOBwufss2lcp/apMUdxQqNfY1qNjXhLXGXS+GVy3M0ITS4+Dqp2P7SUWXTqEcH7jgEozR2cNoX0u9d6JQ9rfnY1TPUUHjSVRE+ZWVLjqpcxOnwE1vva1T5MQBTLBygySxFGWzuV4pU1toHDmQuY9I/3qg5BB0kzyqo0cXQZYScoCjVpTzGMKqu4ikbyIOrjRTgeJ02gi72gxLG6NqRxBizVKXio4A9m8G2qGbsWt4ey/zZ7phTVYbSxa4njTlJVhsV3b+AoNIe121TyML7gV9arIAL8mGHTFLqsA/rpafJt9Y6gpmyQTcQUZuqqcOgeCMsjoW69+s6HpN/3wl+vjBX4YoDfSyyX2YOX1IiKx4Pe3j/P+gPgCSNe5yQMmGpN+Z7IAb1DGJT647IuDQafscFcXaWDnPVN1KD2dXndApRbCrynwiVogJZKre8yAFbRCst/0ez88pIzUBPreYodAgJMOggDaFtZQcMbGUKhN6uyeao37zHMDr+adE/M8JvqjQ26vYP4oWzHRK2njWUeuN2bcWN+SU+11lgoE89ACoioJcE/m4Jpgnu0aGMjgtgwM+fGWjc2VovozaJ+9Z39IWZzWAT5ha3Qbd1doHpi1hbfCcScTuqXm9g6TdSj2DpYvfbviF80SNX3kNL0xIfj3RLpvRqhW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QZr2QSLRa4hZtKhpvIn27DJbpWE0yVIZcm1Wi6WmQUo5fp+fzhZfj+GccK7Z?=
 =?us-ascii?Q?aQpsH0y1Fzx8/ZwFIuRiaJ8bwF7kyT3MkA+WKLoidoXRL/q7KlgnOPJGD2k4?=
 =?us-ascii?Q?zZmXwSUCv5dUdQ6ocKlBGupBpe8BC8Zd7rfAYzjmBd7CUGbgvVTZdZ72DL4t?=
 =?us-ascii?Q?bd2g6dYoqTDnP56RB+RQe/YI2C70cjckpASVaPcnJxJkV4rSWPBCPKuCb9fl?=
 =?us-ascii?Q?SQt7Y7j2Tfi3/tcj/bfEm9kglNfpB+tfNG6ky7KheoGLvyarCZKtjgipyVT6?=
 =?us-ascii?Q?RVHc1iR6Y8QdAFIoTUe8JnKogavY6Fm99qGHSrYFg+H5ZNDpCTR7Ih04HnFg?=
 =?us-ascii?Q?xcUhkRjanOlOKZk3f0m/9ibRmCAGyGd2snJVcbiGICRsSAP7EkJLgGI2P70E?=
 =?us-ascii?Q?Az9nyzkU8Q4HOT3CuRdOz4H/DWqEMlXtbtJtzhSJ2VwThC/MiLKaP6cpq0XV?=
 =?us-ascii?Q?h9yTrOztqgKsRGC26017Z5b0Hu7mXa/kTqIQv+379pYuG/CNubbL3Z5chk9w?=
 =?us-ascii?Q?wFSfa3C7cOPRAC+XJRRxRcvz+Dh0k71ckcsIyqPSa4WLszA2vC5ZG7Kkg35o?=
 =?us-ascii?Q?Tkh7HCjl2faRlIUGchGAoFxlhMncZWXU2qY8jnSjYp580fiBVr1n8MwO69dZ?=
 =?us-ascii?Q?RhEMxMIiSd7b6o/qDzO+i1cwYiIb8WlnGHraM7aQPm0dtw5BcLzkfENdKAre?=
 =?us-ascii?Q?Tp+XzMbu1B+fgUInrZWpnAXZbZMub593fV2Gnk5R/nLDjx235L89qVmZ5l5s?=
 =?us-ascii?Q?5ppkTsyTPrARBUZzmz6mlLnO1BT3DXluV+d3RlbK1T2HaHtrvyOuBnEjNHy5?=
 =?us-ascii?Q?1VkykxDrmkBxSXd2ja5dY6p9hPbuDjrMBKurNSNg12r0Xsj+MUl/mcT5YJBt?=
 =?us-ascii?Q?bHs1SAmigUmDVAoZyFfezvAu8N3wjKYOh/3bh7zTBa62MYXTG/DFYW91O1kM?=
 =?us-ascii?Q?NuqFNja/tJMWz1SYSxZQ1gCaYQKfG34IabZD4MheOQtk7iwIaqvr6+MEGO2G?=
 =?us-ascii?Q?7xb3bpuftsv/X7xIK7vdBHnoY35Qm7jASMdwBtlTLhsEkWaQANk1GTLBvCwc?=
 =?us-ascii?Q?N4IeE4J/An2ia/aPvGX/13g6Fmobg3437AaUlMu19i0fQo2k03+W2IRSF3Qj?=
 =?us-ascii?Q?Jeu7cmsUqyClDVf7s2FT0JiLyNE5DkidMu6Z2VrTyXike8fJlg8exnTV3om1?=
 =?us-ascii?Q?Ms7KPMX1A1fqtKSrCqJcl2XQTzaZZ6vmS3NC91DSLFDeztnlk5+oDD8N77M+?=
 =?us-ascii?Q?3L916yacNGUFhGBZDWeMC+2vKMnEyiGk11IOGXtGA8L9TP5Fx+Fjjgfy2OeR?=
 =?us-ascii?Q?waU0c0TjLWJgeYerJtbpnF90?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d1305e-4436-4312-4bed-08d918ff442e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:49.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ6okdANMKJFZkbJSdbvDto8oPkF6MLwmp7WoETGjGj1MAuWprx8XFF2CLOC7jyqMobhI1hTjMJisr7BW2xObCBt87FVkywQjf2Qd2vhkRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
index 0ef97d60ce..007e1f69f4 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -32,6 +32,7 @@ struct PropertyInfo {
     const char *name;
     const char *description;
     const QEnumLookup *enum_table;
+    bool realized_set_allowed;
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


