Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C5459BCCD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:27:24 +0200 (CEST)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3iN-0008Pu-Mo
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NU-0005tJ-MO; Mon, 22 Aug 2022 05:05:48 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:35904 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NO-0006xs-E6; Mon, 22 Aug 2022 05:05:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acBm6MaFP2ZqejJuopNwg2It2kWPclWp4ve7xpHdBLE8HmMAGajNcTpJqkyn6AL/KwMGg8uRKxbEt3JNEx9J86YsIMoNUYG1PXjobglIu85TuuiBTgFrJlUrovA4CzeXMtsPeEXR9GR8z+JKbNUoVQB9asds9RB/fEXKHszsm7nPPvjQP+Jk+eqonHOP4Ksb6BPz+Z70Jb575aX0f+ixJaxzikbp/IyhkT6jTur2avBz1WOUtNTSR0Ue8R182e6fDfcoOwmUUByD8vRhTnggskLf7deWRjDcCjai0eJO59xIUb6AtKKm/5JglPLOICJZCHInVtr5xkOlKEr9viEK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvzcU4lPj7OU+Y9IuchDVapPQwkUp3HHBcVB7RPa58c=;
 b=ZH72sE7ETf0odXXU7ZO3vFfYQbV2JfXsPyJg9u2BE3VzFD1ksMj0MdsEHrgmWzeRQ48MRpyasg21KHQCzEFiwvzz76cbcbpRm6igESSI4mfb7LccazV9pMOEgdIb2MpnaD6Gzrlfee9LzEHt2b+0nCzbyWFoGO2g5SRdCQMurClVHgkUJHoOZLh/tjW+u1kghFf0PK5RaSmZbTKpNXzcIpZgOrVNt+HtUlmeObllfcSd1E7uWpL5z04YKWj5bes0Vvk6esYLg7ybG/0Cf8VZwRUQPQfFvCOau2LFF1Zd54WJT5Z9DrRhiov5KW5DRe4kwjCL9durq/YW07ctB4TF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvzcU4lPj7OU+Y9IuchDVapPQwkUp3HHBcVB7RPa58c=;
 b=UPvGdbIB5nan/e3tyoy6uvCKdZMSSio++c10Q347rtIg6Pw1kBNZyDD7bVmspQSA5Aaz3tqK2vgZXkBMoRIVXF0pxfUWH2vc4mTg7x9Ay+soSy0+QfO1r1vooBTFcQgHgX2fjohKJMVg7v1BgscyuaQA5ZfwIeoCxsf7KQV14AuBf3DPjijwYwWXPETFdHXeCDeZVboLz2SGmB5AZBIsbnRyxFwO/VpQCo4MwIEv8Tli9D465pBWgmnkmBeYC3sYb3ZcIywi3woju0/g1zlmdAcURfEZt6df/N38AKndZSfbfrOEY2p1bUBox/mpm8sOIweNUmIXWyzgtxp4QnLaRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB8112.eurprd08.prod.outlook.com (2603:10a6:20b:54e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 09:05:37 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:37 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 9/9] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 22 Aug 2022 11:05:17 +0200
Message-Id: <20220822090517.2289697-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce13406-9113-4447-db03-08da841d7a47
X-MS-TrafficTypeDiagnostic: AS8PR08MB8112:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RkUXvJEh6ZiWRKKGgOB0MqsivigW72ZPepuZ28pUeqQoXNm1SJt1bpAWx+SLyYnVaRWjdRdo7jFYNQzMLT+upr2uNQ5ir6TDoW37z6N8LDXn9c8X6k0tk6UYmcwUN6OFJ9YZthYvKIucdPl2GrAaJcE2X2X4PwMTkiVX8z0ST53G5xebsw0u/7UEbvhgC3dckonSRKR1I+xpOMtGLNdIUuV5DGOAbE9/Y7rWwvLiNeyDDSqFFoYsl3+og61YlPgEXgtrMA8QnrNn6ZYqqhtt2ZkkOeGE+86lOJTVGkli+aGd5LP/RvUYERyswhyWRTgx+WLLDPL0WKodtC5KCZFvytjW/vn0DvzjlPdHcRYNXxcAGhxsZh24Y4WGBDqrhHVnMOmkRR5v0jg1vZapD/s/6DRP92Va4z6sqszEAJ8dUFPVLt1xFl9UJopWeln6H0cUVACzB/9L1+yoykFag5YqLXPIySkwbrLxPtrYOIieObFf2Sa3W6uFfP/8aFizUgI8kpzZoXYYH+Ex4V7quCVOrUcO1+9W26C+ZdoiTIpx4nZp4h2cD4YRVeXoIYavhr3IkG6hoawaUYz5puEKkqllXHmZUEaTSS0TnaAvjFGE4cTXpcloee8aesO2Mo26dThxyIPenSnutTdCRcqPguolmZVlh/xT0FIDW9PTFYB7U2j1YIi/ip31UqcTh6fMbFUDUn+AWN4DK20rP6Z8I/IPu/m5rcbnDPq8PeHhesxvRxneKF2EAXcpu+sAbmuwSGiD2yV3qxh1atDs931nX1vpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39840400004)(366004)(136003)(396003)(83380400001)(38100700002)(2906002)(38350700002)(66476007)(66946007)(478600001)(6486002)(4326008)(8676002)(66556008)(1076003)(6916009)(44832011)(6666004)(186003)(316002)(8936002)(6506007)(26005)(6512007)(52116002)(5660300002)(41300700001)(36756003)(86362001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H/RwBLlLxt9uSlKRHiZ+5/5PQEalnf3E6raM7USTEj6x32x/c4Q6ZHreKRN2?=
 =?us-ascii?Q?DDpJiGyrqpqVeReiNtBh1nTZVrNPPI/01b5rVf/8e3OXyjco3fPtttkcZR+m?=
 =?us-ascii?Q?R+dHvVYsZFmW9q7d5vE1KdSUX4jkmawzdDRhBPjSNTCG5NRSORTnFHq8OYFJ?=
 =?us-ascii?Q?8VVqv4rfDLUZ9KiCW1mNlCtox+ahnFfUk3MNDSgz2G2wYTCMmoeNe3SgC+tU?=
 =?us-ascii?Q?yJo5KYafc+IMmeyxgvBinTSLk92lKxAPbrL8DjAbdBiK1y/PQcUYWF5MPAM3?=
 =?us-ascii?Q?uhu18axEvAIN9yEz7uEeqX1QmSQbWKYq82sDKSHJSHCAbjESoRd3MrH9mK7k?=
 =?us-ascii?Q?ckBd112ypNXULW3ki3NriKNjaFSIG4cpyPcadsNVX2I5k8ghs6gcuDXW5BWI?=
 =?us-ascii?Q?/9aSB/xZQAedD9FWorDT7YBU5w9sy0QXiY/PaKPD/DoChaXavXga09Sav+p3?=
 =?us-ascii?Q?LN4KH57LDLIW0ftxQkz6WdyClG19zJ2zGn1oTQbsVYzv7Il5c7U66fjQHbez?=
 =?us-ascii?Q?OuXspFIXpgWoHLocfYcqawKR7qBf+zSphshv7vCX/v+jJeplJdC6sD92iexD?=
 =?us-ascii?Q?y35H6U6ONJCzVngEEz+jCZehNl1XfCjvpEovzu3yJMqlUyYEgj7qIancuyl9?=
 =?us-ascii?Q?gO3EvVCXX6g5kWwk5hr3bumKwy4ADAYA8rR6pRUbHKJeQrdznv8Hptwb/IoH?=
 =?us-ascii?Q?8CKKKnozJqpCiygk+H9w9nYu54+S9NUfNZWvzQ8cFIW+x5MjnBAtQBS6x0dU?=
 =?us-ascii?Q?MiUl9DcQdvnBZuv4mOjuqqg/qqFdCIgGJtkb54qCKlGwTiML0zooqTS0eKJ8?=
 =?us-ascii?Q?zbXqt8Awatw2VWd6WXCJhTIEur534Iuww1LRRUXmMd7AlX3wuXDnUZMQGGR0?=
 =?us-ascii?Q?Ux7fveeelYHRRbKp3o91BQrOQ5tj1zRBfO3qwMhQlPFAk1KHRYKVG9XjkopV?=
 =?us-ascii?Q?YCWhn67wFhhBZWWlyjuhBcVu7MAdrLyyh0yGpl52/2bDD17fMLmmTCnYP0v/?=
 =?us-ascii?Q?OWl4djuUgII4Bpz558X6JwHMhSvdkJgCeQSQLLoJLVcR9mOC6Yof0v8xLTMq?=
 =?us-ascii?Q?MJ5N38BAdI8UUVFCEMXqHy90nzy7/XrN4eauyfogMToqOzVhBiWvD9AKqa2v?=
 =?us-ascii?Q?qebtZjNaha/o3GvlJ0/c9/jFJuRi72cGfTDP5KvWuTReV8Wh8rxEhfnCJLDm?=
 =?us-ascii?Q?l3zPGAf96B1G0b1wI7oV7/LShG63XBGNVpTzaaxpQNgCwEIEeDFWgtRV1wFr?=
 =?us-ascii?Q?Q649WoQalr3vGx4UwJ7JeZjxQFNF7CiUqGVUiQ0wspftnxpLwGfokXx+RhBr?=
 =?us-ascii?Q?kak5gtV3E0hc6Fy+vhykUiO5DnJk/fiBPgcfI0z4INxWCT10uwbJnRtVo8jw?=
 =?us-ascii?Q?tgP2Hzo+qtYngW1oguU1lLRrfv8WhLhQlDnkL468ORjPYtSVeh2avyyrb3qg?=
 =?us-ascii?Q?QyNekMjelY1LhGlGSm9cUTdbAw5nCrozdS4pa7MiAcV347v1BU5Qc4hN7Nq6?=
 =?us-ascii?Q?caqfFrrkWEMbGZMVZROOkkILVatytLEIs4/+P6rmy3Leo148mFm5NuL9XDrl?=
 =?us-ascii?Q?QCVVfE73mBTOd/iHBFX8nPnyPfShpNoQhvvqAbjDZL5N9Z8TDcl86uP0QYpY?=
 =?us-ascii?Q?Lg1hO1rDW4YF4Zi6n51zdts=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce13406-9113-4447-db03-08da841d7a47
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:36.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuYTPj54uXzrgKkkTWEJNhhAxxp2GQ39yZm/0OSrHlHrj55YqsKHdwxZP5M3JN1tgM2ecGPMPVMrQhsI9JIjEYc3FotnYT2Rp/cdeSbW/Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8112
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org> 
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 0fe6dd3237..47ef25b193 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -563,30 +563,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


