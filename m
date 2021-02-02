Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D630BEDD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:57:36 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vFP-0002eB-6Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v94-0001mx-38; Tue, 02 Feb 2021 07:51:02 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v92-0001yT-BJ; Tue, 02 Feb 2021 07:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnOmo1meEK/flP5fC3NQVv4ngqVItwY0sS8mF1EZKeLZD+lkQCTVKB1DHWhrQEyMtPWJNPzDjZbox84hoO7EvzP1vprBqkJyJ+AxpmHTvFVTQQQOuQmvIftRxA4SyddLzj/6HblcNM51O/BWbWPCMwyZ9Jn/+Gt0vW0eXBmfWLjoFcwL9qzESd+Ec0FwXj//uKT4JW4OuFUFQka/TvWt1K9cONZccmDVGpyn9Kxk/cNwiAXDOxZB0qc6ElkTeBSeEGaKCzq7eKoEeukkWgHOull31H/zqHz7S842IuqTvVEjKuuA+4RdptSMDY942hiiqnBdmcpuDNNnyThv2X6BEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=Pu9MIjzCWCbVbZVkygQtev2IZcecRT9HrClsihI9jQ541DeqRhN2bKDjLSA8Nvd/wWoTaHxLHLm2PCKf1NFpkVZhWiZmrVnpBn0b7+QDkEEiCQzKZcaNLFZh5hYmGMxq2SCxw1sNDV51Ox5fJAV1u7SH+4m/sekJVo3Gqao0qijPIPUe6m079uv2ys/e/k3ayyG2MTrMLu6d+vxyptgdBmHaYoZs2lzbC2cU41yw5slhDsnHkLBLLKM9f93NzKQ9SeylppHzGYiJbbu6fwCgFmp0k12NMbpaTyeeWQ/0it7UhWDxRVoGJO4fgdXpHBUwavkOi2lelW53cvyljm3AlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FU1664aVX+pnGTs5I3ebsQYqWxMt5W4q4y1UON+dME=;
 b=m4GU99Lu+hAVmb9D+nVc8Duaqc9VxRMoyTVJEfowfUOg1nl73Xp/7hpJ7wr9MDFfmdMh1H3xQ4Nf1zKkASsQ676rXs0TxnK0BBEtLANCMGfFP0fHf1fy6MgLJTBLAXYrq6Qbg6xzBPm1Ml+3KG4eFpe7SI1paR20qjp+vSWvBUg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 12/14] block/qcow2: simplify qcow2_co_invalidate_cache()
Date: Tue,  2 Feb 2021 15:49:54 +0300
Message-Id: <20210202124956.63146-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd267e3a-4112-45ea-33a3-08d8c779283e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544A6B0CDA59F19B0663459C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXZI6q2Wohtcm1nORwkF1GKJ0QcSpbpdlsK5csiWSFgEYhUPb5nS7mj3gw/fVu4dzqV23GSo3YqHoryGBGm2z8eQvkXtrR4p428l4zyIoSllpKzkR5RlhzTSpEjfeyID0PYO9fVnS6zalUxXYVm1W5MX7sVq5LTIYXFGnaIxP0ZFmcBFo5cht2QSW4u8qYn6mhiCIqpieA59F8QqHwIo6sGRdiSzBgJdaUSv0OTEzObQR7zfsXS9jXnCKYd6CA+Xisquc9IkZBlWdENRr22wjlONijqPuOTDeILzoNiXhX9o5tf0pNtxitz++Lx00aoNCZ1BBtml8SAF2gEKezerfKGoI9rI40DyCbVBlbD9rg8eKF2K8fnfMl2AuBHK1Auy52QetLI8P/7c3wMMo6OpOCVuVZGULXWVJDUcmVKQmS7k7GriWw1KKLaREyycfsPjWjn0uG1nWCD6Xop3gnLyOC1eBam1AvGJhNy/qoABYqjK87sTbdyVSasEObrG99w+hhmU9DI53z9vqdpnbSpRJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7kRidK3jow4BUsI/MCtZxknB4D3GKTO3RjLPo8O5EI6ypuktUUdV9I8vkakU?=
 =?us-ascii?Q?HLExsJNrH4OF9ptWTykNage2naGSIphMCKYTqMDxFIFn/ytRASob/HVf6adR?=
 =?us-ascii?Q?L7fEY9i3y12yg7iLRbpQMmdSyHG/Imkg5yMYpzyCqQq2n7kZLDrDEw16Y1wH?=
 =?us-ascii?Q?nJh7lmyFprVhXcWy4f0HZdlJVyyB7820MrC72ZkvUKnmF2ivS9U8SXQklOVu?=
 =?us-ascii?Q?fdVSsgQG2oF7AiFNlalF//2Cp32BPg7cc5kySeGHDU7ZtTM2bSMKxV5hMFZ0?=
 =?us-ascii?Q?fuy4U937S8FjDUaBWag0ZSTDQ2TJh2pGFztucMxihlaySGIaZUJhECD8ejL2?=
 =?us-ascii?Q?HmeYvNxNs6XxibrpAhr5mMHrJYkGtbBy/4gCNTQeoTcsFo7tDpcOuyjpyqZp?=
 =?us-ascii?Q?jMfHa/etud7VcL/sPncVXq7k9lfOFXenFlreiz5vJYHD4+Fe723knHfoeWyG?=
 =?us-ascii?Q?EbFwArT/9vnvq6KURrQPAgCxDFNoiDHzAfstAvycIFvbzR8dDk39sMFX7M5u?=
 =?us-ascii?Q?/8M51SKzEpekSP4man7a6uDqvxbnggdaTtv5UEcJV3k6ak6iIlrz3SPF/ZPb?=
 =?us-ascii?Q?073eqia/7VT4G1/KBHMZVP1HxVH57H/L7SWMEzoE8HmQDkOIn1O2RB9flGJ+?=
 =?us-ascii?Q?KkvS8naknlRgxjJ2dhgKebGsB1GTT3BC0Rx83gQAFS5tR0zmQ8F3esX+UoLi?=
 =?us-ascii?Q?z7TfJs7jYSBrzw01NX4avKXjwiKLIgo3DsAF3OVNFV1tYUJwuziRfI656dzb?=
 =?us-ascii?Q?tbMTsAW2E4Y5879ZVgS9DsW/qLsPBKZasPu6hJP/gdHVvvUWAqeA+YvqbuTX?=
 =?us-ascii?Q?8+dAyppwNI71F4HRIB1Z8QZjt4WONOAbLi7wWEV6y3VSnWHuCj2V53tya31R?=
 =?us-ascii?Q?kMsiL9PiNHUPZZHDtAnWmgdZNDC473GP/EZu1e4iFOTCIymwazQV4q1QT+MD?=
 =?us-ascii?Q?/g2fnoyT3K//ck/lT1iU4geurFG2f8NmH5GPR0XXy5ZrW2gbytYdhy+g/b3r?=
 =?us-ascii?Q?0RdnsVTXwcwzZJBE+jHeJDmCBaFJLgQFWKvD/yPA/YJYQmk/Mrr6+foVcGTj?=
 =?us-ascii?Q?p5bxbhiz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd267e3a-4112-45ea-33a3-08d8c779283e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:45.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRP+HBZu2BvW7BHwAEkSW1NhDIGCv1FvHjWt2gyvyf0VxfGWBe+SU6SQSA2weZi76CYKD2PJwJPKriyIe8uYVe91E/56KTr1k4l4K0fNwNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.120;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2_do_open correctly sets errp on each failure path. So, we can
simplify code in qcow2_co_invalidate_cache() and drop explicit error
propagation.

Add ERRP_GUARD() as mandated by the documentation in
include/qapi/error.h so that error_prepend() is actually called even if
errp is &error_fatal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qcow2.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 2e0e050997..436bcf0a97 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2715,11 +2715,11 @@ static void qcow2_close(BlockDriverState *bs)
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
                                                    Error **errp)
 {
+    ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
     int flags = s->flags;
     QCryptoBlock *crypto = NULL;
     QDict *options;
-    Error *local_err = NULL;
     int ret;
 
     /*
@@ -2737,16 +2737,11 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
 
     flags &= ~BDRV_O_INACTIVE;
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_do_open(bs, options, flags, &local_err);
+    ret = qcow2_do_open(bs, options, flags, errp);
     qemu_co_mutex_unlock(&s->lock);
     qobject_unref(options);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "Could not reopen qcow2 layer: ");
-        bs->drv = NULL;
-        return;
-    } else if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not reopen qcow2 layer");
+    if (ret < 0) {
+        error_prepend(errp, "Could not reopen qcow2 layer: ");
         bs->drv = NULL;
         return;
     }
-- 
2.29.2


