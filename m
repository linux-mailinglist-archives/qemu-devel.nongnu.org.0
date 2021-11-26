Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E637845E815
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 07:50:27 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqV3y-0006Oz-Gv
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 01:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqUyt-0004LG-VI
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 01:45:15 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:42434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqUys-0006vV-2d
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 01:45:11 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AQ0tNU6014474;
 Thu, 25 Nov 2021 22:45:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=proofpoint20171006; bh=oOo+FIV+Yv5Y3l+kk6uU+ODMkW/76lz5F9DPWPFhF0I=;
 b=1rUWaWyjNzPWsqb0Byuc+ZIkIZi96kU1t9PNnFTwjhCA75gqRrG79XNLmjOlZgn79R/J
 F1N2YJNjE5zB6QmC6raQudAGoH669I/4IOYz4fI3O5BOQTrnLFIy/nR2SCg5UCorMokd
 ++a94piuYNYzGK1gL+jUT+r91tKj3+VFx3MTfFmL0g9zoDBNZteqHo7p+St3py+lTgBs
 moLBy2vZyLejR8CuN2JxOGSezO+FpXmzQp8dn6hmXC2FOhMjXXNYbM83MsuFlX459yOG
 /3dLIyhPKh7SBCW6hz+OfDTmayZjehBCrX0KaOGWpWTVfz7wtyIJZHf0OWusyPew+Wir Vg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cj9b21gtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 22:45:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJtreh978znkjalemVXfg8eO5KoGoaEgimb87GPwEyk000/vSL1ZS3mrpIHdEomQtm3PeKZj8IsKjshd/cq562pRvTdgh51Auvy4IMyGz5WczOrAkR4dD9BTc97fohvxRPFiqPomGWqgq3zlEEfqT6Ak4CzdYjNL3dpQIRX5J7Zz/obOHdbNgDmLDyd6RtpQcoHJrMfbGNU/FeFIRZn/c4/+/VqVv1axWJqJQYcPKaEIgKrbY/cyMlbjhaxXV2VMEUA3tKonzHLyNnsjwGVSexbsLS1xMGidS4uAhgMFQcnVetlWnLmTKMCn69WoUARZhoZO/IQsfsS4zIIfFVFnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOo+FIV+Yv5Y3l+kk6uU+ODMkW/76lz5F9DPWPFhF0I=;
 b=iHlcPMK3CKqqM2UHhg6SH7AKTIIgU96ELHjyMzD9ZKglt1gHELaJ4LuLMPe56JRVqtFQKbywznrdKnK4ltUo4nvHleUNQTgD9QEnsjg2c5cv2DscPvc7vdBoaXemlGoq94mW2bfBlWmXM/qOW4DZpuwD0iOBMBAauW5xqJH5sYh+zUPh4f0eEx/QVN+Wc4az8eqHhavnTrJ/+f/1rfhkSDqL0xmEPMDMYatABlAQgrDsB4cahYZpRvP8q2qgUX1Q1nEwyHRsrE3ruwSB6/Z6R0e6uDXooT3oX531ARkLHMXhwBrizmyhozE24UZDU4yC5UEd3lWa6+iNbLrhYoSUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7496.namprd02.prod.outlook.com (2603:10b6:510:16::12)
 by PH0PR02MB7605.namprd02.prod.outlook.com (2603:10b6:510:54::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 26 Nov
 2021 06:29:38 +0000
Received: from PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d]) by PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 06:29:37 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] dbus-vmstate: Restrict error checks to registered proxies in
 dbus_get_proxies
Date: Fri, 26 Nov 2021 06:28:34 +0000
Message-Id: <1637908114-29133-1-git-send-email-priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:e::9) To PH0PR02MB7496.namprd02.prod.outlook.com
 (2603:10b6:510:16::12)
MIME-Version: 1.0
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 PH0PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Fri, 26 Nov 2021 06:29:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de394cf-f7ac-48fb-0efc-08d9b0a61e9c
X-MS-TrafficTypeDiagnostic: PH0PR02MB7605:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7605E5588F5A2CBAA5596AAB83639@PH0PR02MB7605.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMDcmdc11OX+FaESfHOHOXXRxQsnhNhZBXCakmbmXTxbV12N2S95z9ciK0XnsMnogeeyD6efYQ0PInVbM/ZgoV7YYo+7Bfqf8dwiHcBgZTBDAU5Fah2/heTh45JeNB1Wwzhif9hBmbt9oEHujeYPvL6jA5qPjF2HrNI3f/Q/OZhWBXgXhsdlNatm6N1AUXOzzaZvkIMOgz0CY4RvJBIFqm6ZZ1shKI3TvbWJlpXLH9TXIjj6GGaXMd3SBtVbJSuwYE517QwVC7kP603FNvL6SD245ag3wHwmMg26ozCW4z9zvrsPg1p2wFUrY8XhAjdVzhtSyxpQxCngjwErpoFJCJGkU+rBOn18hLUyAWHLlgG0nx+sha/e30t/GsJpq3DgiUcwFU5h5spZW7xO7ai2+6kh99qKt9XUP8l9EY1RTSLo02aAAWDKJvl0sysP3PDjs50qGHirHoFrOct6CszeQh3+Bw2m4qTiekPzJiyN/SysGBXKmzS2qhPXbzkkC4VJr9jcGnkK4RJi2M/ZpJBqyyleZBZ1vfB5JQEleTWJXMPBQsTd7KHuLqvuhPliyoGdCdrX9F6zieHDu3Ij6mtE+ufHujhX953T/XUlpHxMaUf308wKhcZzI5WOJN3NGFoyl+zzF4IFv/kRq0IkRJRooVRs33kgfe2JZUUyRnBQIHHOAyDeYqOlxQP0tRVnRmEMvjHIia0/7uBX8jc9W9F3VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7496.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(66556008)(66476007)(6916009)(44832011)(508600001)(8676002)(86362001)(26005)(36756003)(2906002)(6486002)(54906003)(956004)(66946007)(2616005)(8936002)(83380400001)(186003)(52116002)(4326008)(5660300002)(38350700002)(7696005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/64byuZ4oxFyQME2NFKbXv9x7/Q7A4Zxo0iGiFbAb8RDXvR4WC73xjwKEfz?=
 =?us-ascii?Q?oZDfgPVwiDHwC+uoQtCNwl5nXBgz+zjWmae596flVv/YHWT+YjeM/clI2zqq?=
 =?us-ascii?Q?tfrSI4la+2Pstg8YS9bqY/r9BZXPdc7faByJcH8wGfPQI0cAbaHmkpJEZDo9?=
 =?us-ascii?Q?COKaAIxT5T2as4P6vnwVPJJoultbiZoatlfRuPHJ0wOGMHB2sW22gtMxsIHS?=
 =?us-ascii?Q?pp7yE6F+Qy9C06BR6wT5M0m4EQODJzjZ6rZAwNgvvSFWRLzTdJoctZC+X/Tn?=
 =?us-ascii?Q?gQG+0TyUJcprESkBQOuhNmvgLrV2MQluOIDhzGzKV76aW95EY310Pj+2qgB2?=
 =?us-ascii?Q?iEKryT85//eFRIyBKUEHYtoSLL5kCfySafNtajO0BHkddaAY2Io0seAqX8y9?=
 =?us-ascii?Q?Am6P+mQkFniWY3jL0ef8H4M81ZiISj5iOe1KqJbVoGMm6/PV1oozP5LF1CSf?=
 =?us-ascii?Q?trUQ8E8T9Agz8pVwwSHnqOc+VzD/wMEXK7+nH3UAdY/sROobHWYRXIQD0OJX?=
 =?us-ascii?Q?l3EfNBfuQ00DXdj4aL7ovutV5aTv3SMjwyvMy3M94wWWocCJsIePzbCXdTy1?=
 =?us-ascii?Q?Dk9vePFmANKGgcwlwEudAcYqeJKxWWAK9ClJPifPErkhEa0h4QEOhGGW0/+c?=
 =?us-ascii?Q?llyFVpitjCvUkflWUChke4D8ETtrIxmGd4bxUyOhakAmngXtcjpX5HKA5uk3?=
 =?us-ascii?Q?4+mA+RWLN3Ud+b3aJntI9jgzCRrPKxLTNBh6DtdyPp0ujcOoqfIOkFTI+fBX?=
 =?us-ascii?Q?cON5Jk4gR0gsmNAH4CgEvWOAUEv5qh3icnMpX+RJ7Chpf3lp9a7SUrjjRKfM?=
 =?us-ascii?Q?RViNCzi4UERnM4LRtUoKKrBN5NYJ90AHW5BFsZRAJpU/0m4TKfJPDgA6UmUi?=
 =?us-ascii?Q?0k5ntG9Ew4m+kwtD/41NDNQXYZsC6gAyj9uZ37eSmGyp5HI5XqlN9lMtrTd9?=
 =?us-ascii?Q?QYG7kDCkuK0QnNx56jVi6FaBs14wmkJbI/xunl4ZkzOsUljYrwYK4BYTZa0Q?=
 =?us-ascii?Q?3BTajTcpgl8AN6c+91KOJYGjHayrvg37+RE/sh5gh3Pbbfxaa3uka0ZB5u9h?=
 =?us-ascii?Q?G/tGUoxmuzNxkNRrj8jZ18RKDI2P/3mrq16feb5qA1eT0j/Y4ZS5ZtBvap0Y?=
 =?us-ascii?Q?C8JRneGiXMOFF+n1Kg0YqoTlMNOU37BRToSvvPd6dG6YCcPmXaFDAylySaE6?=
 =?us-ascii?Q?5ik4JwYQRw/6e/iQfF4tFXMpRirCZ5BKpavLeMt6NJ7//hzXxODmvNZrStcT?=
 =?us-ascii?Q?Ls5AEug/GYZ4xWn4TIXJZ6whmOvu70Z9mqeTY4t9GU0h8bz/OHp+L6C/nDug?=
 =?us-ascii?Q?UfCo71rDUat1nzGCic+NabtAqPxUh1kI/z1DfVPCovSns5jKAC1bTgsEGXcm?=
 =?us-ascii?Q?orenbAKH+M7rLI0aoPKNb/3E0ZkxC7o4t6AVDaT4ntz998DpD865WC5y7c+2?=
 =?us-ascii?Q?3WRwCDcnWz0U0lqnvf++4PoWV3pfcxGC8jMYY10FxRtE3zdOkTB7+ke4cpFC?=
 =?us-ascii?Q?bYUimJ8oZPuD1Lvb6cntg1ccSUWopS1xwlrwyXbeENFUSZjT3X42DUylsKRA?=
 =?us-ascii?Q?Lpc2Wa6cmTw2SmOpfJfx9quVGskDaeMzvBkfu3/icpY7jWKIMxMFg6S3xv1+?=
 =?us-ascii?Q?XFnAueuBvapcNSUPBcQQDHb2lULNiFuGPbV3xqyteLdW10l2C7fln/TChaNn?=
 =?us-ascii?Q?2vbbTGAmDi3HYvKyGWQahVtij9k=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de394cf-f7ac-48fb-0efc-08d9b0a61e9c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7496.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 06:29:37.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9TvdBi8H3UbtHt9bnY38DwPJ6c48yKV/Rmrh5lYqGg9u7U6ocDYEViV/uo4ucW/n1CJTn33xQ0vYFTzA8Gooi0aT7bgAQ6rtv7Gg4xwe4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7605
X-Proofpoint-ORIG-GUID: 8zwJJa3JzK2bHKm41AnYxP31vyFgAQ5E
X-Proofpoint-GUID: 8zwJJa3JzK2bHKm41AnYxP31vyFgAQ5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_02,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of dbus_get_proxies to construct the proxies corresponding to the
IDs registered to dbus-vmstate.

Currenty, this function returns an error in case there is any failure
while instantiating proxy for "all" the names on dbus.

Ideally this function should error out only if it is not able to find and
validate the proxies registered to the backend otherwise any offending
process(for eg: the process purposefully may not export its Id property on
the dbus) may connect to the dbus and can lead to migration failures.

This commit ensures that dbus_get_proxies returns an error if it is not
able to find and validate the proxies of interest(the IDs registered
during the dbus-vmstate instantiation).

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
---
 backends/dbus-vmstate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 9cfd758c42..ec86b5bac2 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -114,14 +114,13 @@ dbus_get_proxies(DBusVMState *self, GError **err)
                     "org.qemu.VMState1",
                     NULL, err);
         if (!proxy) {
-            return NULL;
+            continue;
         }
 
         result = g_dbus_proxy_get_cached_property(proxy, "Id");
         if (!result) {
-            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
-                                "VMState Id property is missing.");
-            return NULL;
+            g_clear_object(&proxy);
+            continue;
         }
 
         id = g_variant_dup_string(result, &size);
-- 
2.30.1 (Apple Git-130)


