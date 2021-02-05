Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA30310E1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:47:30 +0100 (CET)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84GX-000146-3d
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847F-00006W-37; Fri, 05 Feb 2021 11:37:53 -0500
Received: from mail-eopbgr00136.outbound.protection.outlook.com
 ([40.107.0.136]:22969 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847D-0002Zv-A5; Fri, 05 Feb 2021 11:37:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFWI3uiaSbNr4EMcBb9hwslVn+ZBCSoiHCQvd7FT+8HRB6eaG2R3zWO803G21mxSUI8LSSOBV0YXdoK/U2TpAXZp1zAbHiGUgZrNPEDFygLTN9kjClCDyr4Cp7eHmYarfzcQJyu6/N6BGbMGW4Mmx26gorNnE9+NTWmuYnii4eoyqHjkdk8sjdzY/RPLoI1hyDelOf0VzPFKvNFpy/BRx/smVVjcodl3bFgXvq5zcLdydSgjXLJhLBBIEQwFSsanfjLLsr2opstlxOLxIzXfR4hzLCJ4n20xDQqp4S8RYvOppg2lNQgH9ThYR9q2e6y/CcOf+lcYBPC3Y6LynrGs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyz1XND5omVmyjpBJb1rOG9vCcFs4qBL4Mimt4dg2xo=;
 b=FyAzb7mPuCY9Rin9huPykkjiiqRV8dHdYBWjioI6sqnK4Xv9UDVc2iCEumQZwB+1cqhvK/9QQXhruWdsK4AZdAbCxkJQh3U6cNvIIKvOcsruxemQIn5u4Lb3VzZF6WsXjeNrutYrJD0gYxGiycWZcg9A7SNWWiZnONw0/XYGXWlpR2bSaArEywm5D/4dbeJF0gMYCWm/YuT1wICze50BFjgr/XOpwqd2nwgSozFftBMVOaqOc5XVBpNpdLpWu1O+SL13zFvG6xxlbaTBeO9032Nt/1kxB0kDVtaKCltyC2hcN/pjtPYMRaDTFYXCausf27te+vhvKx7w50qiJqMWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyz1XND5omVmyjpBJb1rOG9vCcFs4qBL4Mimt4dg2xo=;
 b=J1cv36gGR9Ce5s2by9+bhhM+Et3lGEnYRUVgYv8DNS2BnPB3AijC/Gq38s23e7bTxPnFvLrgoEF3Ibr+mUEVEY49eLZnjshEEzs7NBKa9eMGFNYDrudSAadgCQ5aAhvnVnKm5UI5UuLMbplpKj7f3vSS7RgktzYBIe23zae0Uxk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 05/10] block/mirror: implement .cancel job handler
Date: Fri,  5 Feb 2021 19:37:15 +0300
Message-Id: <20210205163720.887197-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f1d6e7e-ca5f-408c-1e21-08d8c9f4593d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44703BC49D841816788629D8C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmBE4DwJfIQCE3q/lMZvv5wWf1riTmgFfR6IGf8+b5TzJtx/Nyhmy/uhJeR2gK9pgAuoFst6DLNLIJMczYDnj6/9vPkVmc294kDKXTDvyFlV+17HiesTl3Cjb8d2NKO/UVyYhCJvr+JBNUw2R6HX4Zjm4I/7XNDxuXcSgUTQKcRmytND5pF+3VHIGD5ZEFb5I6cSdQvtmppv08ZGWYB2oPjD6Adf2CXiDATwjZ6SuR9YEj8XUyJkpH8e+rrINsEDqJdn7qYt3OpoR/UibEmni32eUC3jvGD2jilolYS1TrakGbYMT7vHXiJNciSBQsAWA2In9O+WYUDU293oxE58VbPE/b8591k/e4/wDrZfJo7CyaDmKDslb7vqkj8awi5K7L43TwJToeobGhm1sgJIwE1zqhfAhlx9BLO0sdEgW/kZrgPOnkXKbC1gWc9Q4o20Te4CENnu1aRdNoEJDLAkyWZQ/9FItuslrQc1Jy9jeNicpXrd+TqT+GLRO2fwv3VS3ITT+wKnEk9IesHno2TDtkR/db5WmDtUOUm6BU0pg1Ta3LbJu6Fu9XpjMzaNDmmUv4cTI10r5jyX69lBNiVWjS36tpkqVe0ncjOBvZ1og7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(4744005)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(142923001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RnzvGsM7miwlN7fAT/ZnBiBD1FfAeM7/Tiy9GtS0F2tfXP0wxLL+Y4bQxbet?=
 =?us-ascii?Q?Ab3LCNXQX/xInZe7UZCq8mft9d02l5RSAczGGheBLi8fyNr1paE9TBQ6f34l?=
 =?us-ascii?Q?K/cfQxs3KVvLKoDcYT42aymK57WFUW3b8C9YxQ+ouJuGeqGMhT06zBD7hYdz?=
 =?us-ascii?Q?JsbeAM3epvRn/JlOehW23Lblp3SdcIFjZmvRxk1+7Br2OTSUo4wgCJx1/O2H?=
 =?us-ascii?Q?AXQQCv7EwZThXi5uEBOevcpF7xrN8+l9asZoNVLq+k7iCtTkdU2FC0XbE3IV?=
 =?us-ascii?Q?j4cwZqzk7sLS39QKGd8gkqxSMM5CMr5X2zwfjm2N8VzJdfs95qUz0ihgZBPP?=
 =?us-ascii?Q?USRPM1LP+tbJQhSmreY/MinrB6yNRW59A0xKND89HAt6wXCRAvUnHEhnq5+r?=
 =?us-ascii?Q?wLX3cDHoFUnc/oYOxr0Ajs2/oyTlN5w859UFCUpDynGAXUFaftdeIneFRQZ+?=
 =?us-ascii?Q?xE+j5UKxrxis2YOO6dzrW0eNuPbzvNCB2fzrECSsfYLfxWQnxuUCpWIta+qG?=
 =?us-ascii?Q?7rrLFW5pjxHVY7GvWThXpK9iKtdS5X89mjQSnrQAEGrtKC3L9Wp7EQnlZaNx?=
 =?us-ascii?Q?hVu4wpseaBIPdQ9awqlo+/AWCcrAtWhOKzHI9AAKWnz7xNvHxUIX8uCpnit7?=
 =?us-ascii?Q?y63KEcFUhbwtrqq9QnTxwItvMOb9eoDk/Oe0lj/UpixuOSbF/knEzZKGcd+y?=
 =?us-ascii?Q?Gax/PdNIKbqA9Cniss64vM5h9C5bZCY20AesssSKya4Eks2zLdvCsNgyAxAK?=
 =?us-ascii?Q?xUmy07FBKFCbN2I2UdKdYgYtj4s9RRVOYpWwdjcLEXP/2p4BKA6TOXNEEVLa?=
 =?us-ascii?Q?SY94/6uM+XcWL6DGWhTu4WAYqtG65j+lv5vqB5bTOAq2zTztDKPpX4LwyvMQ?=
 =?us-ascii?Q?8zt00/JhDLrcMCTTQ1Zle5XDDMwFAtAwWUloURbucv7xdAOrkHnGGRTL2NiY?=
 =?us-ascii?Q?3qx5a7MHdETx+fj3/DxbnmWpkD31S+7FU1h9i2sh98fg9jp+HIPx4bOEwu7e?=
 =?us-ascii?Q?lve6V+m2qHu/OCvV+x67bGD2Z6JCBg54IYEvgSd3LhhlPa/T9wNECaM87yzV?=
 =?us-ascii?Q?Wosn2rk2DC9c1kvsmahE9+9bUv2uoWWn+YvDNu2jXAHzgNLot6hRzHWEDDxW?=
 =?us-ascii?Q?u9PIAK7k3fUBrt9FsNcDAhA34CvD0gVxOnJJ0xtPC/vCSidh3TZ795OuFWX5?=
 =?us-ascii?Q?x7NCJdPyMsdxSvkGn97ohgtwTWcuYbtafzPUXdbX/b4Qx92DPmDbn6QURTM7?=
 =?us-ascii?Q?FpI2gnxM/J9+4aLT/tSlj1UxsfP7Oyq84QF4Mj9Xm+8eH5/xU3q0voHu6VH+?=
 =?us-ascii?Q?dpTkd8zeLqozYVb+yFSP5py8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1d6e7e-ca5f-408c-1e21-08d8c9f4593d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:38.0829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQtktfJld6dfInGalKtsotA8coxcUTQLAXGzObO5qZ2D2u7z4wNZoS6gSLEF8y3AvpLJQ2uNb43c2qhngkuwvfU4t/fpqOQ8hsXV1T3wKnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.0.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Cancel in-flight io on target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/mirror.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..9faffe4707 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1179,6 +1179,14 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
+static void mirror_cancel(Job *job)
+{
+    MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
+    BlockDriverState *target = blk_bs(s->target);
+
+    bdrv_cancel_in_flight(target);
+}
+
 static const BlockJobDriver mirror_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(MirrorBlockJob),
@@ -1190,6 +1198,7 @@ static const BlockJobDriver mirror_job_driver = {
         .abort                  = mirror_abort,
         .pause                  = mirror_pause,
         .complete               = mirror_complete,
+        .cancel                 = mirror_cancel,
     },
     .drained_poll           = mirror_drained_poll,
 };
-- 
2.29.2


