Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A740530BEBF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:53:29 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vBQ-0004Tq-N8
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8j-00017R-3K; Tue, 02 Feb 2021 07:50:41 -0500
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:11748 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8g-0001rd-7R; Tue, 02 Feb 2021 07:50:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZR3KJ4iJAtouiB5Ieqwkmr6fQ+bgw4Rs5bMx5P11yhxRh8cU2afRB+yoEVmeOV4W/d35lytf7Ipugvb7zxjy7o+RUm4B/I48YErsGhBpYD2mIikuOAvEZnu5FCKwxte/p3H6CvY0HAbj1we36QqjIHlkALfJGNMgeq0wzC6CgyV+AcjALNaTDa+X1aJppQT4Xu75io+s9m+yP75xW2EXdTQ5imaTxaRMWnI95/WZ/Bnd8tLUY4YIH7obVCVPaqkBwl8z0MI7TwBlHH7WyUGUl0c7zQEOD0oMGUTHFp2rOzpp4kRpieJpaLuCt0TrtgFf4mtZ8XKqWID8aubkOAsgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1JDRt+qiWRCN0ShN2yu5BTMeZ246ZkQ/BbVXaUXEWE=;
 b=evyqNnLrpQqeMc3jljSzcH2FHPTKDJ//UQT1VdeTMfCx24kNU+2WgpqlBnMmaVxCz73rMxpgC9IMf1sYxAXvKZeexhwPWvrZ9EcKXHyBcfJeY8tin8r5IoUIoODsyaRKUHYvt5Qb08L21ddt2qXB4v56lYX+99LqGg5l3+g7PxVggyiwg7VHaa+LtuFDy/cNOBAX5/o8EVMe/dV+mkGceMHRpqqEL/XAoHzZeU1d8xIz9Z8C/jObEi9T4p2hFbnMF7ncv5H4UJw8VJdWFKefd3Cj7V0enfLwPAA8AH35k5lUDuzppf/9CDZWWbsKkEEmUqOc69cBASspwgxXDMQi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1JDRt+qiWRCN0ShN2yu5BTMeZ246ZkQ/BbVXaUXEWE=;
 b=VF1LuVSHzWrRvfgSPrqxhlMlYCR2HJHb7xDepb5L1KvUGH+raG6P4fUysmA5dyrhjqsjD8qAcbbqKg+ifehHiYxqmYrETGavOd6V7Cvy2lPVkvTmImOJ8Fyxev6ttTM68IV9CRc+GXpcWeIpZzTLFtgkFSsui5EPXv8IEdrWxDk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 04/14] blockdev: fix drive_backup_prepare() missed error
Date: Tue,  2 Feb 2021 15:49:46 +0300
Message-Id: <20210202124956.63146-5-vsementsov@virtuozzo.com>
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
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2960d2-cb24-4c70-dafe-08d8c7792299
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544D953F042EFAADA5C2BD0C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6WUTy+bQ20gEPC2qwE0QH1DD6JzFeOaUc/6AUez3DD88wBNPrh1b9LojrWokUuvl8JkAkO26suOAeX65T/c7J+z91rLUKI7JVOgyoyJ5W0gOrp4GuDbhVf+zF5VqfcNSqEj84BtZaGSd6AFk6EXUTwsNiT/5+66OrGyT8sV3b2J5CRHxe6/01oLpaObVTjKvIdc+aTJuZ67EpKurKQcT49bu0I321Kpg4Oz7KGhMuWeJ17zC0lyYpkykw5tFroAMOfcbu4R73037T9T43fwhJUsOqcjdc2PV7qRwGNOun7u/J0EwFhyTNYR0pOqf4MxLJa/5Bmh53gUnuDjf5+dVeFrdJEIIl5Rm3WhwDJAfPqjr/LzxznbFLTJqgYuinQ/Zvx6r3Wr8GF0XzVgf2tk/v5oSWsbAR102zL0gEWQMXHxwJALbsrkj5EaKGk4GOL4E7jy0FJS4ZlISkIdRvkAMjwvE8hDIaegiSZRDpMcxcFyftgugCbBwMHbGZGjdEYh6stVKeEt/Yt757WnzaMEQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(4744005)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RvwHBXoKc9dwfX4ctAK4loOlfH8C9ncwvdMLipVh0jJ6htYMVXQLNsx2FhL/?=
 =?us-ascii?Q?4MRnj2N9NtC+JPb4p26ZMkvF299vkSZOGdZcHLGUJEEh9Md7SsPNVm78JL1I?=
 =?us-ascii?Q?Nuj9/EgVnoBlItwcz+XBRG3WIMMjHm7/a54bDl3GxZHFxvn/r3W6aTLW4Cm0?=
 =?us-ascii?Q?tlXTAPzRcPGzDydVk0I+Pb7jv1A9ZLVjvCyi/QCvt81DXZHxjmakA/Yqd7qR?=
 =?us-ascii?Q?CcEh5u80ZCIDOju49jzzTWnjShGVGdX/DqXNP4VlDjsj7SRwgmIyq3MpCHFe?=
 =?us-ascii?Q?oFlTfeyZ6DA0EMtuvzjSr8bvsDIUmfjFNMOjjYWK0dg87tDpaYDucibE6atO?=
 =?us-ascii?Q?UM2XknNzCFQRR/YIaXeCsHULmuH3gDGER0jj5RRAK3aM+8MJhW6nuf8m6+ya?=
 =?us-ascii?Q?Yr127bjp1AeaMWAhAZexUh1K/FAx4Poy5fTG0dBuJLryARZtJhxxJ90Bg8h2?=
 =?us-ascii?Q?B9cM5ZTjiVQEno57nWbKVYEyli2iPFk3nXtnQ++bCjluDQgpIO4XY5N0+ihL?=
 =?us-ascii?Q?NBD6WbhfXM3nREjdC9v6l/klv+fl0Bl1hF/PJWMImHlQinPxzXMkfq/XoHVN?=
 =?us-ascii?Q?LWdq2nXXJQIwxytiFttBN0B3iWvSAG4eU9/qEx7vuWQ/KlF+P3dSzOV4he6y?=
 =?us-ascii?Q?wHUlsnP1lonOzjqI5gm/HL6K0q9dpU0AmO6MsejM/MGtS69fzdqlbrBR5GGM?=
 =?us-ascii?Q?114EHjcBhjzGdW19tELkWVqMpzxdpSP3A0mGK371MZTp6iNQIJ+dBRxE+D6s?=
 =?us-ascii?Q?2hF+1g4SRoGk4GztZ+KFuuRzJkG+hXWhAUiyQh2TkmHl/yYOk2SOQlAoSUGE?=
 =?us-ascii?Q?8sbUefvPsp9DybVktVWsHvRb+6FRgRaP11kxRW2duib676x2J2kLGaDjSD5J?=
 =?us-ascii?Q?9m4kZOToWfikYf0l0fWRiG8bdCr93lxN4O+MXPEjElxRCGoLotsKPehriMjS?=
 =?us-ascii?Q?YgroC1IvbnrhJnTHQ3mqXB4qSYTToOqgOr75HQy7EWxwwqcFdEDbnYvniLhK?=
 =?us-ascii?Q?sT4jOGOp7/2NaES3Y3kwMsaQYi8DHIEzu152uK4Sz7rKpXA77yx9UWFPjwHu?=
 =?us-ascii?Q?Ivn8d2TO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2960d2-cb24-4c70-dafe-08d8c7792299
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:35.9967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jat2lE9yCF6fOIS8b7ZtM5MU5Eq2uUh9QVFtcuPvLNbsCRQv45qcGmIWVwKT34YJGrvKCCA/XKXsjNuNjS7xxI4SUgAocVCu1EHp3eo4q5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We leak local_err and don't report failure to the caller. It's
definitely wrong, let's fix.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 blockdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index cd438e60e3..65884a2826 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1825,9 +1825,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_acquire(aio_context);
 
     if (set_backing_hd) {
-        bdrv_set_backing_hd(target_bs, source, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
             goto unref;
         }
     }
-- 
2.29.2


