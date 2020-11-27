Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2972C6835
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:51:38 +0100 (CET)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif61-0006uY-Ob
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0x-0001B3-Bv; Fri, 27 Nov 2020 09:46:23 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0q-0003Ef-7K; Fri, 27 Nov 2020 09:46:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJgMSB4w7L0KnnVEYv9uBebV8MuPp1PRG+7KrFRwBcaanTESUPU5QhHuUpYYAPEclmDhYb+QMRwmFYu5wNetd+KmVFdhHi/sJaCp48Z9WCSPwvvzh2ini8qzzHTZtR7EiLuWSTMaa4f9Dd6gUJ4m6tlkUvW6w5ABhyizIYr8iL9h/+nibEtBXzfR6pUsFyQWSqXLc30gnjciek46cIjh0xCIPA+hf2l9QFaWRRzenRkQmnZRvzUx6c+3G5Ql9ZuGkgoHtgfQ4hC19CSmiKO07A1Wy2eqH31A7LSNgqKivCIL21be9c2pxY7iB2m70qeOOOSFJAAMTE5y6kBi1H55nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIS8cwgBONL4tI4036tCYRJxD4MF4VPh7HKMzjOLboo=;
 b=MCbCHeyosAVs8FiGzfcAAQrkAh0hsPa+t9ujgNFVV9wH11ipbcuwHnW9hC3vDdmGvnTKYxEcZIrJn10sUS0dsneeFszl0QZlRYb1zFN/6LZXpyzY9yb7rNWZEMsaFnLdXEEoy1Ia3QVotG7BaIt44XjcFF2fX6+8/DNbM/FIYmRsGBloPeZiOO1mqbQ6DvIuQ0WbsSg4Wz+xAflYB03UWgOWPu+UtDBmnw85rHfIQ1SCKWHulalJofrJQDVHGBaZ4r9jxWsxBTX2ykh7iFA6N9+VHxjXpkoO3AbwV/g9nBuciUY/zNkjCA1Rf4D1AHZzqXaHFveUFMZq30n+cOU45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIS8cwgBONL4tI4036tCYRJxD4MF4VPh7HKMzjOLboo=;
 b=Gzve1X6eH+mu3qDn4uhRhxMNFqMjViwPcHB2E3CptPo6z/vEY5hGJcGYtlg+EH2BWrDeSAIl2kxQI5YL4tv1ej6SD1d76gZa5Vn8xKZJYia3aGgjOoUHFZe0ZekLohUcqtwq+cXDY9tohy4PfNGFMaKAGo/mwTusjomSfdNpY1g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 13/36] block: rewrite bdrv_child_try_set_perm() using
 bdrv_refresh_perms()
Date: Fri, 27 Nov 2020 17:44:59 +0300
Message-Id: <20201127144522.29991-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1223cb31-5827-4cdf-75bd-08d892e32019
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50784C91807CEAC199029591C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu4Te7kaE5Ps9uqS+g9IPisZmEc/hK7cgnnQ0p3Ae3oqI+VCOqgD5j99c1ztfJh2ITrwUGN1ocdjDBtTU5C5kRJ/FPp/mxTRAouIPZORZtjdZ6vGZ2JIYgQR34DZ43nEQ76qWDXzcvvBcYxC3qy+DUVod7gRMf/+snsBXmPabiFcKtf/BQ8O+BGsVtveczTYJblWToM7XKzHnrNFx5HrRkfWRsJnuBMl6EgxaZ7N8jL2Hbx9dDk5xQ4iKtRlbqDdKSGnztEB9pYIcLkJEPqZBx7Ziiej8/no6eOZZPwm9qemrIPzGkv0esR4qKdHKVukauKhHEzbISVScNXoBrg20JYVulmGvRCK1mP6x54lKu1kEjbAs1O73HOSxnZWSNLz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U8LP5iE603wSih+cS1PVJYRG1KLhcApSj7QIaMHJQXNjQLGGIm7Z7fOzFs0m?=
 =?us-ascii?Q?qgo+nWO1dOPHypSmcxczvL6hKyMf9z5FXRdG2pjgDV6wDEz8ANI0XrH5A7g8?=
 =?us-ascii?Q?vatOXCvZ7tA+CwB0hLUd8uugy3rJdm/fROKQCfjatIDZv5fCxNrgFMqlOMS0?=
 =?us-ascii?Q?B1Z0dn9rJVpxMGFI5XQWQFE+Ol7ip0nFQeyPOg0fLQv+fiEgIOhDvyP0aWGe?=
 =?us-ascii?Q?ns1RR2qtWaj5KCc4NzmuWyDTDvkDYYTk5NYPxflhbzCj+tDwNm4Bx9exehiW?=
 =?us-ascii?Q?4P73BBReh6rvMFzc/vVtZhseHinPeO/sEiUVuoJiOVQ4+AzSIObyN2YCOM1a?=
 =?us-ascii?Q?NRtp4AlW2zAogsm4OFJe4GzqtbTZy9hNxSG7VwulIlj31+4nK6iiabVD7LBL?=
 =?us-ascii?Q?97443ncgKUCrCZBIz/ac5dNx/jOWmVMeJi9cQhFXTg/B7/3i/aAtvJsFcgcV?=
 =?us-ascii?Q?cgbIsUMtVN+cNcwGXAnDSx7k1vaW2o6AgeBj4EV9Woay5EZkHKAZPlyBtpER?=
 =?us-ascii?Q?EquGyBndgpfeNBSFSCb+raNV/Ldh7X12ScwBNBQBE+7Ci+IsonQtTyMJ0Nso?=
 =?us-ascii?Q?XPOcAwM5WM86hzKbMhrmtajcy/qRXJPX4yOh0Ev0rQEsokb7xd69ZFtAqC44?=
 =?us-ascii?Q?Co1iQ2MLivoqP66CEMrz3gNS/n2hRTvq7qiIeRqrPgQcRs7kH1d79umxSHhm?=
 =?us-ascii?Q?BCLSpCVVlRTC/4OdTOwYxB4zjQm8Boh//bO7cyX6+wt6HgvjQBfiN4fddJOQ?=
 =?us-ascii?Q?xo15AHrDiDEdlImglEvs6OKoqhPJXIFH60ePlniTGu3CuJD9x1yoaWoC/J3x?=
 =?us-ascii?Q?hVtCXDpSbQuikCr6ew1LKB973/aJbhFiY+IhOfx9W0BF6QsQse88shA6Vw57?=
 =?us-ascii?Q?kk+ND23LVJQXVUTxYMNrPCffInUibc+ikhQWi1khy/dcszBgK2PYjOuJCUtQ?=
 =?us-ascii?Q?EioqqRBSmTNd0pBdj7XhPQZKqcTYtM1GTBDZFxhAr5ffsUruMeOIENgMh1Q7?=
 =?us-ascii?Q?UnoN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1223cb31-5827-4cdf-75bd-08d892e32019
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:46.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5XhVUz+XqFFrezX+mt+lk7GM3f/GsNUTdsaqhKCDJfC2KdqAfBXakvYR1lNffAD2UmD1tOQ6mQyxzoxhiDUBMlOeIDFfyvK56thfTEJIe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
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

We are going to drop recursive bdrv_child_* functions, so stop use them
in bdrv_child_try_set_perm() as a first step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 7267b4a3e9..82786ebe1f 100644
--- a/block.c
+++ b/block.c
@@ -2394,11 +2394,16 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
     Error *local_err = NULL;
+    GSList *tran = NULL;
     int ret;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
+    bdrv_child_set_perm_safe(c, perm, shared, &tran);
+
+    ret = bdrv_refresh_perms(c->bs, &local_err);
+
+    tran_finalize(tran, ret);
+
     if (ret < 0) {
-        bdrv_child_abort_perm_update(c);
         if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
             /* tighten permissions */
             error_propagate(errp, local_err);
@@ -2412,12 +2417,9 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
             error_free(local_err);
             ret = 0;
         }
-        return ret;
     }
 
-    bdrv_child_set_perm(c);
-
-    return 0;
+    return ret;
 }
 
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
-- 
2.21.3


