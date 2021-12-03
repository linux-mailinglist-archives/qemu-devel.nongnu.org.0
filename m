Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D356467ED1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:30:10 +0100 (CET)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFC5-0006Bo-Gy
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:30:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8p-0000qc-Ep; Fri, 03 Dec 2021 15:26:48 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:27177 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8m-0001ct-Af; Fri, 03 Dec 2021 15:26:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLa7iLdRcbdIVek6WAxkWvIsbVOlMR37agdBbQIKrnTOCpKX5sK46zA2yL2466TaKtJjJ1ns5SYWCnOO0wFKND6iBcvewYsHQsLcF/rkAFSWK0HBUgucdaCWb+tBoMUgJb2pHRPUFEZwxrbcG2iS2PrkWEu83eEoZ407XDDquG63JVcMqJLS/RgcoZMLnPiQIALXraDcTqKVWRlmrw/8R/xumOAHebqlKYG/ymyAm8ZbO3cmnjC/jlAm8pKmHPqg/W/uhRgRB7sp0K/HZwiE9OO18ruOyyuQCaAcaBbnY7D6rhJ2nKsxFfJ+qrIfFe+U+lPyrVoZz1T5OUCn1lAkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJoqopGf5qGIUuiqezCBrSKaFk9Ff2/5/1VjSep6xyA=;
 b=PQsfIPEkbu5UaOFYg5hR3/7NDLeEz1Cy3/WzzHqcqMobFF2BE1FM4r2hmIHduCr5F1ynSWauZ67CJdmp1ABroMIh4D99Sf3PKpZVgVi+4JdGwhoDfRlYKaPzYSsg7DhMiMLaliGJFi0gt///pgitxdYvx8CGkRYNAWZr+zIQiYURcootvTpxuQpgG5j9NV3HmuK/YLC7sMZCl1M9tRrM11aebzQY7ZPy1/9yG0z6EpwEcL0jItIrPa2S3YJf7c3rUMCdZ1cqXQTShCB5QHDKOSTaeZ9Xc75Tq4sT0PxnWOnHl5lX5wH2LdC56z0l6JrEhWRCoJGKKuhPucFitf8hMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJoqopGf5qGIUuiqezCBrSKaFk9Ff2/5/1VjSep6xyA=;
 b=enHTp8YwLzxtTalkrDBmSGJ2ugC41eRqy2Q7gHkIB32+fBIyAYlJSLu76h8utJuhf/zEK4fP+nN6bSS6qpm7WoFlH45qS0NA1UYR03TXd+4adKw9uuDXiqVvsKLrCEU+EXK1SrROtCzRMPZH6XJP+JplYRaFux70tzu8gJ78ShU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 20:26:24 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 11/14] Revert "block: Restructure
 remove_file_or_backing_child()"
Date: Fri,  3 Dec 2021 21:25:50 +0100
Message-Id: <20211203202553.3231580-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed72f4eb-b148-4be8-03af-08d9b69b2cf2
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB406881FB080FA0814B889EB7C16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:41;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyjzl9Xj/C9J+LcDYh/AIaY8lQVlVfGUgtiG4pw/f5woUklAyZTlZwULW9LXm80HnPkC7BSvcD2u938sXJJbVTRT4w0h/uc3ytSqKFD6KyqRePSuuqbKKw9c6RoBPd1/iOzF6WIqELjixEJjHFZMlziEtkP5BhqJJVBxgGa3r57px13HnfQRaBeIMgcNuukKTWJmrTnEBtSDkuMl0HCKPVoHo2AgkouS5CL8FRUUGRJM2/LZwUOKn5nhONdn/+Ypeaupg+ez9WRZvM7+aEqVTTbjhTGgV4gEpVj3bmNLZuOYiBHPcD7Ti3Yq8OFUitNBjnGlUwHSfIzij+G6vU4HJO/7i1yem7jTDHJ66LJxxW8EaF/ZtSbdzelEXCW/NRIUqe7YBfAmY17V3j6HDdpMBEnj9IYupqaavUg+yj2mtzrim8EZ3Dk+ExICb5EO8yyESeTF31INL8KS6sC0DRvPGnHJS2CHUNAFOUgbN6HoGstPyNK4j+ic4LeDQrplGPi0ovKy45yvZYUoaZ70rGox9GaHdbHiO2VIzogrF4hkSrziLOXVoLrnu/cTybYWYSMlUBpqOwdIAfNeN95c6VqCSrHhZeY7u80tivsmODCF0wWVya+kmK29H2smGBqDGDKlHwo6GNUUSLCUZ/S9gz2g4YStFKz4FG7bCRbGaBvT+OaKkQuVyiWm+gsFuwoBCIcOLjadzj9GA8p0SDyoryzTwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(956004)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CMFoazRZ4ttC2HHDyCHeNSlAeqVJtOx8mUIdRwtHxw16AEp65nE5hCDx8w9G?=
 =?us-ascii?Q?ClJssg90IWQUoV0aTmTUZGt/l9lVU9z/h2UN+8EUvdNQNLVPGhn1yq5LxMaA?=
 =?us-ascii?Q?BZboRbT/qfk29Jq18QnxaPh1/cANvmoIJMUAjFF6SBXAOR1zUtEhb6V533hQ?=
 =?us-ascii?Q?JYUaPwX37ovrsyqRcSZ519CtfMgSkm2pm2uJJaThtK0Zt7ElCKRzcuGj4OVg?=
 =?us-ascii?Q?Ls65idPvTKlhjui+Yb6QIgLOGV7StW41sFoQVom98ZbfNNT0AHbqeK297QCN?=
 =?us-ascii?Q?My+II8CjAvCNoHb/+t9XQg4sxVsfSZNSHINOgv7GCi7EPgyCtM/dtUTLzltu?=
 =?us-ascii?Q?407HnYh/ncAsy4CvXZuTo6UVpVU4KqyuyEukfnNTW0H/jfas7eUGyXO7giJI?=
 =?us-ascii?Q?E4nkJpVFnZT5y9hJp1JCz3eoq93cSosWfe7WoiouHvaH2sJKicVOAtSU1kOK?=
 =?us-ascii?Q?jdnDbt5QpW6HX9Wv/urhhRc/Nmyd4Utxt1gfhJrrNFFxjToskPTATMtT6ZH8?=
 =?us-ascii?Q?kc/IfjBpkJwWJjUxs5nKWdH97E2sWGGXriO3M4X4uEOOJbrOZzaIp2uZVyGL?=
 =?us-ascii?Q?FA+emPd8+uFOlTsBobkwdWduM6HN8a4C5kA/ogTYt3fpnxCC11ao2uMQQAM/?=
 =?us-ascii?Q?Bv368dLGQIBThQsNdGKQDgrpD5bawGvwE15VrkZ9Du5Nh5FnUNKUY8gSANWa?=
 =?us-ascii?Q?fhXFa+7oY2HkxkEp6Qp8GzCyaLt4DqKt2Si/NCx5u0YbOYmUr3L74iCIYm1c?=
 =?us-ascii?Q?nDlsfFVSOtDm5QFAJj6uQtayzekgShKUC12Mzztq3HMEkF3FBy7GAeLAj8yW?=
 =?us-ascii?Q?XqVp20TRG48b0TQt57GxLpI3qXekfgdTrc859BJL5/JeeiQ1JdD95DrzxIOA?=
 =?us-ascii?Q?xw7J3PVHxDPkUWye/ZPNxQyi0b2PINQdYTipCL6tsxZthuLCJeZfGhAkdWWx?=
 =?us-ascii?Q?a1W1t2i0adA2oOqJvpedxNs+figU0CX7UiYCPpYhwNT0zYWMjJox4Iz453wf?=
 =?us-ascii?Q?bbtJ0ACL1XCUB4UIG6K7MQrhdKN5ClY6hwBlhwW+OJVh1dwgdF09DFmzgCeX?=
 =?us-ascii?Q?htrjwyyInS1LwQxEOiA70un5c9Oke7I1heGBMnxgpPE9MrLEhuQBqr32G7Nc?=
 =?us-ascii?Q?UkDAF+jW7VTPTXHyYc+OhuoMMHNA6yL0jzgq/gkoKCs3j8JpI5dMQYw3Lxuh?=
 =?us-ascii?Q?psJKLeaLpmqxKd62fxOzTYvIPARRgcEuOEAlUykyhHAwoYVT2MvILpt2mzwz?=
 =?us-ascii?Q?b6YjXEyjD4bWaEhgchwIaSjXbekJftNnMF3S6Y26WMtk8918+grUUf6briqG?=
 =?us-ascii?Q?h6RcwGNsDrcMAiXO6KY8Jwnh6jtPs8truyZVfLDkSZuiHsdPuVzRiqR8lXB3?=
 =?us-ascii?Q?QzDZSwOaKU1EcjSpZoELjz5lbZtKT8KxTdL8xL8uDblPox11O2tlGVTE1i1I?=
 =?us-ascii?Q?UmWAXhiCBsM3iasElH5uive3YgQdjy7sTDG1y+NVOA+RAhieUw7idcWLl27I?=
 =?us-ascii?Q?0cOK+YdyFmawfhQ3XWG1IClGX/ODdXNgx8pENp0RMa8SxLh+D57ByY43hNlL?=
 =?us-ascii?Q?+Nbxr5kRkzM2QeFPmLcB85sXuDg02//mbwatO1Ey104JIvZMbIctM7Va8+Wk?=
 =?us-ascii?Q?VjerkBEMTlJD0NARcxMsFoDD8gp1qQx+JWbtpg6FOQkE22lqROgn53gYyCQ2?=
 =?us-ascii?Q?qiABMA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed72f4eb-b148-4be8-03af-08d9b69b2cf2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:24.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guxqf16rVDahMBtZsljIlT6NWOLIIf7kr3rbZhcLT9fKqSgfF2L8qUYPQ2F1K8nvoMvJz36KF4H4KT1kBFFFUkhfwFA5WGaw87lGk1YQTuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.7.109;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 562bda8bb41879eeda0bd484dd3d55134579b28e.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 3eec53796b..2ba95f71b9 100644
--- a/block.c
+++ b/block.c
@@ -4908,33 +4908,30 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
+    assert(child == bs->backing || child == bs->file);
+
     if (!child) {
         return;
     }
 
-    if (child == bs->backing) {
-        childp = &bs->backing;
-    } else if (child == bs->file) {
-        childp = &bs->file;
-    } else {
-        g_assert_not_reached();
-    }
-
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (childp == &bs->backing),
+        .is_backing = (child == bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    *childp = NULL;
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
 }
 
 /*
-- 
2.31.1


