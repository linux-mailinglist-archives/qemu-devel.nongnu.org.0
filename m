Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DC38B1C3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:30:38 +0200 (CEST)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjh7-0004qU-96
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZi-0005oG-P0; Thu, 20 May 2021 10:23:00 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZf-0005ik-3K; Thu, 20 May 2021 10:22:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deawXR/MvLOI1FBSS+2+ngTHjkeUuA6wpvPWWfyOrLsXDW41se8BrJG+JC3CEAxG6YR2DNdP9j3W+TSDgDk6UPYXdqSvinYYQV9nFWxBiQNTGifyDqqwgwFbRgDqqpWMkwWNYhUXpTQ2ecI1Mv4Yke1CLe+i3d26eVdY7vpD4czj0DYvgUHsQ2ufye5mlX4osGRHLzf8NkXrbiagQptnesD8ffF3iBkT//ZE59TTznc8GbtVThbPzfaUIn43JsHyNtRUXath/NRA8jRuJ5TMpPj83AcP6I2wmpIVrZTg50gJV9G0c52QODcHdVU0uDplAEVtip88OWWfO+x7u6kBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoJsNy9IWl0hzQSrb1isa0wceMU5510Tm4LF3TQOTTw=;
 b=c8SAr9Lqfub4S+NYnzQArPT3+IcPzvGTD4mSAX7DYVB1HHyU0/Sia4dshRPOfhBrgmcWMCL/Fvti299ZwjsAEa7HSBbq2YXZJ/KqXYYdlHePJG3e6BvNdVjPk06W8zw5XA0S7QSfrz+teQ6R9LtvuYXsFZP2WK+lsD3RVRsi4UvaNB2NynnVuTfys72SOdUH6d9xJG1am3RMkz0I4Y3+pF+V0iQcw77sJd5IKDBEDKgRoEti2H+pd7X6iOfqaNcJ6hY7CgKg1kRkf75BTH1J432SpDZRfUDHew5ltQZ3x6+ga/8wSmYs8a3ng2OSsxKGAbduTkEuXaWP9BF0SVmfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoJsNy9IWl0hzQSrb1isa0wceMU5510Tm4LF3TQOTTw=;
 b=o/DCGopEHIIqOq8kWGfs5r5WTyntWnpTdO2bR4pvdnrGYYtu7r07quTHRiTvaCkkidWR5AnITZ7LECJfVpXH5QBkQCMUsSmBGKSlLJJtL3ugPpTH82x2tIN7DibtLChylyMNhbUfpwJxYY1VhuB/n/qsY6PBw4BI56FlS37qhR8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 12/33] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Thu, 20 May 2021 17:21:44 +0300
Message-Id: <20210520142205.607501-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781dc211-ae53-46b3-1003-08d91b9ab92b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544F6B2B239C9068879F5AEC12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vF+my1UpRXJSqy5a0Muy2+QNCr7hSmMA3A/ndpwukS/eGFxv4ZKd1ByEFHMcdsTEN/GXc75TVkZD8aiM/mTJLTLnJdeC29Z3kYStxh9UFviN/Vo7lW3kuQqr9Q7BWaStKH5G5a/uyVdiYrK9st3LVUCe0hFsgHXCbHYYV/RDyLpJxDPdhLwBGbKRPfOrEzQ6mx5VlEL4aZS6xdTh4ZDgYq35J2Pq0zNc+aWgyHDtdUrMS8ERKlMC2LYnajzWDVqh69BJ1vUBydgK6tliiEWZEIOgpCnQMp/CsFd/bWv/5Dbma2ArjbZ7LQj2E3agmJe5UWcJBFawYdVTdsMRKVLWVqOtLD7IQTD3v9Gp/Iy7OZbcZWpoLhNxAkpB+UgloPJ8tV18iyVYiUXkbDKurXqXJ25FXYq9Zu4Uk9XWrk57p+vLK+AcXM2/mXjfBVsJ9Gib5KtrdiledDo8c2Zg2V7n76O6UEqZa9+D6YR5DtYDiSnnfrr7B9P3bOvutjzMdi1lB1pg5ZMn9xWVd6tHjkB0nszaRv1Is0GxnMAa8I0pbNfeSgr7PYRCZpMbkmRLsdfhWXCs9XI7NQau1VgMpohW8sZkJOmuXx45KBj2WMa+MdK7fUT6r5QqymjsPWZAIdJVlLZy1HGXyHnGshu9f64AoztZslzY2W7XZ7/vaQbBv9afSKhc6z+EYXpv69ABrrzO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(4744005)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oa0FZQRr3Bh6V42vCtytETRr0yEgb2mQgeS6joh9glLmoSIECksxBtJeFtzQ?=
 =?us-ascii?Q?cO8WOwFygvFlEvK7IldWI49M2XI8ZULmwhpOLmVJebZc/SUOlIyqn23ofRCL?=
 =?us-ascii?Q?Dj4iKUF9Wf9LQsXecjlW6BzyurCpi36nZT6IwyuYFPD31FD32X0frdQ5y65c?=
 =?us-ascii?Q?AAfez/7ZSCp5ojn24OhZAm/EFaMTnpQ2lbSyeoIFS1M4Cjkof1P5xvmRqh6z?=
 =?us-ascii?Q?APwnUMJx/JrnqPlHSo30u4OOunNxX1TwfJbW/w5tjNdaIhvYYPodrWgiA3XQ?=
 =?us-ascii?Q?1y34mNhMw5sMKWB2oQhXtDpGrW2lourCNw7Xjl9Q7Gf//REC7DEcw1sb0cwz?=
 =?us-ascii?Q?vaCMV9DCsxX15WB2/3mFddqHwfaZNaoXV/3wqKyQn2Ku359Q1IKFBIVgF6o4?=
 =?us-ascii?Q?cyDHWr9HhqsJW6hWE1Go3p4//ErnyqUYPWju6yUDyJ8cOFvUxy5h7efPrzxK?=
 =?us-ascii?Q?EEs7olpE7cKHyB1NFQaFo38C2MXJFgdAu7bXkKaHs9Drdrnh4T29fUDtZKG2?=
 =?us-ascii?Q?JOjoe1VIlJy5RsTS1i8OHZmDHOt6XTaF87Efp9uZrtANGBDb3RQQwGA2lUDj?=
 =?us-ascii?Q?r3blG+UWqcrkp6NNtZ6bbPnncxfTtCXoMv2IuLzXvCiq+qVCqbYzHel8wVtn?=
 =?us-ascii?Q?4pw6JSj9H1M55luNv/2w3uqqNRd4NnrszGF4BuKzHINZU+kkch2+fax5q3EB?=
 =?us-ascii?Q?mCCFv7uwX887U03+EPiduArOVr1nagGo9bxSLtnJ2a4/8qO0CfVVc+Igg8pz?=
 =?us-ascii?Q?afHH1p4DPblGrIE73lBoObcVCLnDYq6XAdXgqKaIKiXX3DpXUYx85N3fxb+T?=
 =?us-ascii?Q?jpksvy7QOM/EnBs2JWhK+dVaagJo23IPuyxlEZDSMwu7PmIrzxE2/wfUSR5a?=
 =?us-ascii?Q?7yWJh6tNRulCy7vcHMrywgpBvJb/UOf6BhWwdUCTjZbuNv8gQo457zTlrIwK?=
 =?us-ascii?Q?GQRWfrjLGvBgH5VhcKNDvtsoOFzF0aRhUVfSwFULxvvIjGISAtenm5CLsnHu?=
 =?us-ascii?Q?jDmX7NnzkyJGhaGy/uVMlOEjspf+a2h9Seb1vqS6vrG6uNFVwh+e1Oe3/1Kl?=
 =?us-ascii?Q?YQZxTi7ewB6v1cBhuUF3L+gciTCATjxcxQ9PsbbqiLFaS3bGaPIjiBzMtxYp?=
 =?us-ascii?Q?ToGGKlJ4+cItzcXmJppWmZw+MBAmtnjr7EFg+FQ1CZ59AEzt4lpPl031RYWF?=
 =?us-ascii?Q?QwVSy+OAed8L/sami421UCqm2nfU6T3mUZyV5hKKr5FeT9Kd1rUknTqWwz7T?=
 =?us-ascii?Q?8fB9qcgHXsKzz5VisQaVEETYFjm3XXJo1DCQxfwCcmDJdBvu/0WgWhgqrOsh?=
 =?us-ascii?Q?fLMmnwOVv1FaA6D6j5hm3kYO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781dc211-ae53-46b3-1003-08d91b9ab92b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:39.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFE+NZVYH1hFRUKv1ThKIP3SNuZf32LfVSqgirWQeuctcccKR/i9dA3tVCRd+EoC0T1CSDpWAcFEQQTJSynHFBtVhUNf3qR/8TRXRgJpQfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


