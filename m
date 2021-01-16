Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87082F8F8C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:59:24 +0100 (CET)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tbP-0004BD-Hi
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQX-0005UO-Kj; Sat, 16 Jan 2021 16:48:09 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:11232 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQU-0007As-RN; Sat, 16 Jan 2021 16:48:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB+1Y1T/6NMsjsOnQc1MRg5bh4GzCO2BKCW+6IvxslmwpA7DV+YAHWuliqQyQXAW+SXRvDwinsTcUKR+LVDkmGFJFipFOJS8Gcxy9XNXsg+SgtojLE2leTLhuIHHPYTy1YIpsm6sdoDX80kSA/quwvSUqDMDIQqIztqlnq2B9tDEheXXTGhnO7WEnOc7jiVotCgOmdnKWFVTadBwZAtv1Rd4p47m5VXZcCq6fODLE6XAJe+6039Pe76UxRKyjqkwConDgyrqvAjhzenGGLcK3lJWSjsu4iZMDxDPi1YKkiS6QL3GL6L46Q/zXgisxN1HulThkxZLCrsZJyyl80AyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuvBR0Zwhc2vdHC1b5cm5iI9fW9Z+IMin6BAdSOhMVM=;
 b=e5zczt8Pn3A7rQcuN4XFkXXwqTtRGWcmG+PQYIx13QRpUVYN9C2LsDYTX6pC9rMYdS3uxl0oXUEl9rn+q/3WmBP8meFtoCvV1IKxET84zwkcc88zIBwXMvSPHLw5+iVQBOkr4dDQfBSntTmJNl3bGYdboCmhgnUi918DB7BDj8VjEPDm+b2wavcHHixoxiPML0atomJL4frwmmuBaoZULckvhnzHiAdQKla+Qe6sm90VJ676ega+X1HaTt2/1mcR2P+WXjjR+6RJJLqSTGbhQ/VXqafA55eMzN2aN3Le8Jb3q/7z3Bvyr315Oubxlb5waEidxubv43DgXDXhaV8SSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuvBR0Zwhc2vdHC1b5cm5iI9fW9Z+IMin6BAdSOhMVM=;
 b=g9oE38hmtRPhiodYTRhpyextcRPSNJaSCrMmNqHxNH8jchRC4aMUjQJcjjjG+e3ca76qZOW+CJeYtmFBS+ZpBzojIGYTYZ4rJrUwr1zVeYGP4pxF35MtB7kAIhyLVm+SXrEhn0cuvjk3HJt1BKv5P99lflZggejzrNxFA/yXx9o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 15/23] block/block-copy: make progress_bytes_callback
 optional
Date: Sun, 17 Jan 2021 00:46:57 +0300
Message-Id: <20210116214705.822267-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 529264b0-7d6a-42de-5be5-08d8ba68621a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35423C8341C2C94BE6EEDFA4C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:89;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qs60ZCioO2tbvkClfJtOYbgZHjHCEirPdCEoQ2ghFTZjCFb+cPlTsUeJlW5Qwst53y97kmFMWdBP0RhBvlDMWawrIDitHAhtCdgmw9jIXvInslp8E8XscZIZ7o14KEB3WTVqudAOocM55emCfNs+IzcN6ywbF1veXj+fELylW24DsMNOXE4Te+Ll3t79q91NqrlqZZZwPUEnfhbhroZ8Nphygh46tQBPuiObdmEGV4qVJJ5bRyiEt2UynTptIrE2f2gDjYP2UT9CcmqaKECrlmCnGVzzduDfsGnQjORGt/yxmyh4tyj7Hhwl2RcJzgYqs4QLbgpIMgX2TWVByJnG5en6p5+IQ/X+QbjB+C0JuPrIr+AUohCTg5aABXVSeyhZXzlfFnfa5XIsf0t2dOCb0JdMtGqVMx6aKs2sQhwdg7EiSpZlH8rQkBGHDAaT1IcK4F7voQl/a2xJPdLX8bniJr41r9BzF7wEdEs8dQoRy1F7rI38hyWNEKLHXwruplkoWi5auMM2tAAs/qOYexRWag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(4744005)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u1Ds4Dl1ciEfgjo3E20X9re+XhbAjyxe3Q6jRUZz4neEJoMt+ahWJ7xHwzfZ?=
 =?us-ascii?Q?S615BwQfS4++tu2IkBhUNoLMHPMuavBFfQ7rqnziROvhFnUbYE7NwEOeUKsd?=
 =?us-ascii?Q?aGKX33GQv6DuV9XGFQ1P3K6NUzooJkXlv34FV4OKh3I79fKjMBm7IjjMUsUa?=
 =?us-ascii?Q?EuJhMFxw2WLJc/mDmYL1mwXqYlOM5A01fniOHCAB5sHL1AEIOq92oicnzjEx?=
 =?us-ascii?Q?f8KVWuNVtFUYbmbMvDWrqa7TAlXFEPORmS15k2y380h8zpsePiC9gWQXdpas?=
 =?us-ascii?Q?zbXdA451KyyFt4k/SioCDkAgktHBbfswnWVWDpuVUYRsZcQ/KvkKEg43EL+z?=
 =?us-ascii?Q?QZHLg3lvc1mX/SJa2ljPIeo54qw4sZ+rfWlp/AXMazCDtS5tpU0Dbb5rbDmg?=
 =?us-ascii?Q?aUb6a4GMHzrBJqkYoPwqKx4Xotty0SzZlTR0U7gTEmLyAqMQ1juDqpTBRPAB?=
 =?us-ascii?Q?7kYSE6HeSe8Jn1HqumOVrAWK14XhVsvr6zugwAVwaKoTB5Mr5uZV/LlRECZp?=
 =?us-ascii?Q?abWKHpvUTU2YR40pd4DQwN2eMEQzKr4mzNh8n8NG3xrzHr4Yr+bYaZ9S0DvV?=
 =?us-ascii?Q?rFigCA4IHl2zorbbscycnQ9OgaRAG7JA7N6dvlekCKsiPzKGZUz9Kj5KIXWh?=
 =?us-ascii?Q?X5s/IP6ftu/rBMJ+eIDXb045voT8mlFNb+R5FpdL+18ys2qOuvgMCnqU6RkA?=
 =?us-ascii?Q?n4d76AfMq0AawWUpKz8LcJ/2xNGQegMb+cd1fs/jt1K9pJrTp0DXpncwjzN5?=
 =?us-ascii?Q?0SOzC8ohc1vQl2pa3fCsj92jNoXIr04PHl060VdpQ8ryzqMXxZbDPTSka1mo?=
 =?us-ascii?Q?S6An7U6R/R9EDmAiPtfawoVmKAa1jCKHJIY2zeliFe4JXSbpQ8Lo+nGGTC+z?=
 =?us-ascii?Q?2JYB3/xk7AVUgYUWv/XNhl+6Pt31E6hldRVUIV1rdGSfwXeMnGXnU1/hC89f?=
 =?us-ascii?Q?GPo/zdE8Fp6XbQRPIwuEw8PxkwA323aOs4kqD1s9S3f+JT2i49o1vgw7El/V?=
 =?us-ascii?Q?CJc0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529264b0-7d6a-42de-5be5-08d8ba68621a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:55.9454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmT9fFdEiGcRv80UO66UsQBzZTp7d80SwR6nBHZmaOTwn97xDQ/UcGJriqYynIswPx125bVYg/QsHyJFhdgRb/U6Cw9LzJC459HglKmpqSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to stop use of this callback in the following commit.
Still the callback handling code will be dropped in a separate commit.
So, for now let's make it optional.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 82cf945693..61d82d9a1c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -454,7 +454,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
         t->call_state->error_is_read = error_is_read;
     } else {
         progress_work_done(t->s->progress, t->bytes);
-        t->s->progress_bytes_callback(t->bytes, t->s->progress_opaque);
+        if (t->s->progress_bytes_callback) {
+            t->s->progress_bytes_callback(t->bytes, t->s->progress_opaque);
+        }
     }
     co_put_to_shres(t->s->mem, t->bytes);
     block_copy_task_end(t, ret);
-- 
2.29.2


