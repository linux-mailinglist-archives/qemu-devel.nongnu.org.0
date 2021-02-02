Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6930BEDA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:56:02 +0100 (CET)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vDt-0008GG-PN
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8q-0001Hi-VF; Tue, 02 Feb 2021 07:50:50 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8o-0001yT-AQ; Tue, 02 Feb 2021 07:50:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGX4LEIP5Z0hA6vNINcokI9u9yMrM+ASgBOlG9AroxvLiHE6Q7AYT4NbflIPMTHuSsmIqwYdDU1PYDGmMINmng3O04wuUoBws9I/LryLoPTnndIzwcnqmGfq2sGW/LdBWLijZLKOF1purH2R/bpMyCjFnIBCTdCCHetAlmw4ufzLU7dVcODFUYX71dWLGeEf00vZ6/9SetDBlrIO4vxBIuthsN7JktmMRdzV9z/wS8v6+q7/s8YNqnfZDmZham/ZXfFJs3f060+B4GD2nXf2ONVkx7WKE07JQNu3bLrgmZcxMZ4EJcvbv9gMa/FInULlqjD/JYJVXsmF+7r4pBPtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=Ty3RC9Gn89XNnv1V303HZsBqTs/J9NpAU/Wpz17/1uewh4/i+HuumqlTkJYS9k1LDB7N2eQRIp4Oj7RnpIrhLspsCSblQYd9IQRXZTiyAPqxGiJPxEG6FHM+EuFL93i1X3dyNoPoVh9XH7BQ5SLun2m1EBFVAzhdL3IMn7LBPcLOgsOvfw1Z3tk0SjH02BvveX/WJVanvzd6JKutJJ6/Lh1duyD+uvplFIOMw0+53PRsqK3rDf25ynVH33RO5MPwgawA6OToAZ84OUkARoBqeC1etAhiMgw/r5xi9G7eom+7/wOI0wWPWghxaTG41BA3T81lW64p7aJgsMoEvVThjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=tYoSanXx22F+G9aTWrvZKQ/cy3AoCym7kr0oAFC/zya+j7xbLu5E0meDwME9LDwhCgdnntDd7Qa0Z6C33PmsbmmVeziF5o8Uw4N+NtSyY5Pq1xmnE/qzC6mlN5Wpkum/h/MhSWz0cSv8wM/U1mmZdMPNVr5qoaQSrfvNK64fLF8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 06/14] block/mirror: drop extra error propagation in
 commit_active_start()
Date: Tue,  2 Feb 2021 15:49:48 +0300
Message-Id: <20210202124956.63146-7-vsementsov@virtuozzo.com>
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
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abdb8be2-80b5-425e-967c-08d8c7792403
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544BDEFE4C19A5A94102109C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syxLWEElFciq9M6DhNTbPhzlobVvIlZkd45m/16WhaWbOrK6D5zigYYcBk1TX0S7ns5dOV3tnHAfpsJN0LacreS7jCWdJGgUT0CnDWJSMiKquE+0cW3nbmhMYjbL9U6FHxfwEuZvJOFXCjTBdxTn0bEjoCG86CeNDGI90cT+LccUdKfb0DLpB/4e/8mk9TsmF4aDHokUzx4aVIOARYF4UXt73cq5XTIi435sIT92MvJxQ47vv202w95ejNZ23MaNYkDA3yvcJD4G/MpGq0RRjKnYcyyLZ3Rw8pXwg1xGz+dLRfI04gjYQ50Kt3cMgGkOtoF7qM1I2tWE8AFQWriNabjazYLDcLGjDiaXZ366UyslSThWUQLAsXJh4SC4z1T/hmAU8oCr5QgW/EhlZVMyONBJeW0g7P9qHKgUMV54mGUwxLNXx8tG1Fs1LNg/1U+q3AXxdDxX9fQVmi8E9BLBRk6ZdDRXB3jXEMx41G4xmOVkR8pEj62gumFlKNsVQKu4kinsYO489m+r+y76NMTNKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ij9/4TEm3w/+l2FqBm3iwuEhMaI7VKmWDKxcFIT1EElox2obGruZg8F3EfYG?=
 =?us-ascii?Q?ms7RjIQ4DDznZvwUbkILvQeyl0g4+1BCJa06N9dmXubozGVp5usqSaQRt5q3?=
 =?us-ascii?Q?WhtVsg1El1HpCQ7/GiK5Si05hO5HI7I1uaRHNNEjshvvAEqhf+zHl/3fRMgW?=
 =?us-ascii?Q?w9JXa0RS9c9P9exest0cZ1L+q5Q4ArjRuhGJR8TAOCOLQOGV18FJk5hShJfR?=
 =?us-ascii?Q?kuj1CqklvPNQ5qWQeLzOi/7V4MlxoYPIiVKpFwXbA339r0nNiokCZ8F0c4Uc?=
 =?us-ascii?Q?avWtEYpqbhIWvBAjf90tqRun0IdaaFZjctSkZNBjJiufFCplQNwGfM/e5qKg?=
 =?us-ascii?Q?m19vv5vpdhxrUeqBeRXjV83kTspShCTfBdBtm+OAweTFuCqcH+8R/jjVugYF?=
 =?us-ascii?Q?bLLAy2dw9LWAudMe4N2hAIA7+2tr9loLL6XANqjGt0fcuuwlzJB7zgLvggbV?=
 =?us-ascii?Q?RgoCuqAaq4yNAKY1lGvn2dNkahOViaTKB1K5/oXVebE0n8ZKW+71Uu+Uy+HV?=
 =?us-ascii?Q?X0AagHjnhtfS2kwQxVA5lSttPP5ac5TZHSHlt+KHJq2uV8lPVO7GMCIVxuvu?=
 =?us-ascii?Q?mYOJMPCdwudqhzNgUOWGDmP/lSZScAo92/pE0bBSPHgff8VfY99zB05f4In5?=
 =?us-ascii?Q?SlgGK2W1OK225WjENP3EVu02rnQXVClAK5w9qJRUhCTDaNzoze48W6N0KHKi?=
 =?us-ascii?Q?oOgiHUE85f9qED0bfj+u8RswJbek4Z0drBiBDwakARxzjT0F9vNxJVmyEuNS?=
 =?us-ascii?Q?19c1EKby5b4hbRrhc8+yTSmJNfuc5yzGNudO84zWBQModtz/ofIouMG69Njb?=
 =?us-ascii?Q?wh9JBcBTyk7u5nBHuDRfgqzx+4QVSIILG7yGaf47yGuGEICZFVLWCfSdHINO?=
 =?us-ascii?Q?HC5h2Tz51gWEmtuSNxZ1uj3puQoH3cIpfn2pGRJWYIo+DDwaM6v69kwzccM8?=
 =?us-ascii?Q?PIXDMA9Iujz3E9EnO0otTb7IRMoSKkmtUT5ZoviV5V0PrrAm4mm+JfJ1Zo+2?=
 =?us-ascii?Q?3cjaKxzQZ5mRb64xu6Rd/MmgZCXHJyC0C+Av4SQ9Y4GjmJ8blRTsxCqpr5Am?=
 =?us-ascii?Q?1DRVpyZW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abdb8be2-80b5-425e-967c-08d8c7792403
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:38.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5H8DeKY56EC/0aGqwgtSrwEiBjTH4XWxXTLq+FWfrIg4UgVvDTgvFEOWA+HAzb3+IB5bFAU5TBAD1wFtuXoKj4jGs1BJC0BxX3QpnlFe10=
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

Let's check return value of mirror_start_job to check for failure
instead of local_err.

Rename ret to job, as ret is usually integer variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/mirror.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index fad2701938..b7b5686a57 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1851,8 +1851,7 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
                               bool auto_complete, Error **errp)
 {
     bool base_read_only;
-    Error *local_err = NULL;
-    BlockJob *ret;
+    BlockJob *job;
 
     base_read_only = bdrv_is_read_only(base);
 
@@ -1862,19 +1861,18 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    ret = mirror_start_job(
+    job = mirror_start_job(
                      job_id, bs, creation_flags, base, NULL, speed, 0, 0,
                      MIRROR_LEAVE_BACKING_CHAIN, false,
                      on_error, on_error, true, cb, opaque,
                      &commit_active_job_driver, false, base, auto_complete,
                      filter_node_name, false, MIRROR_COPY_MODE_BACKGROUND,
-                     &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                     errp);
+    if (!job) {
         goto error_restore_flags;
     }
 
-    return ret;
+    return job;
 
 error_restore_flags:
     /* ignore error and errp for bdrv_reopen, because we want to propagate
-- 
2.29.2


