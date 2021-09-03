Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A583FFE4E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:40:25 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6cS-000493-DR
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RG-0003EX-CV; Fri, 03 Sep 2021 06:28:50 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RE-0002A7-OE; Fri, 03 Sep 2021 06:28:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNkuwyG8eTX7a9YnCDrv7IHqlqy9Hz4PUo7DyULaBCqi83RlkSWWNf7NLAgDfm+AjwOttIfiTMaECOSBosE/f3AFcV4A+e5/Cjx9FMbzWBDhheC8m7gnfam2TPpKO7OH/XsPQZdhGGNayL+0HTih5qozz5oUOfpgpYFed1bg4+3daB/pomxE4Gtwu/BndnDj8MTlAnAIMnrlWCBBWF+hWn9TCeUPAxIfpPEL04KZGuvSqTAJyljRwxWh+uqQzclWZNW3RPCAeztN1rgjVwN15djFxj3VPKcODZCN6IYAbJbKkiUuajTELfJxSbP9q8mwhQt4GttYCCk5/lCNsn11GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BhsBWb2vxMCBK7qKyU3DpwqXc4vOSgxnp20A2n9Oqz4=;
 b=CqKtldzxO7ZHtkAmDOyQOto5ymtvm8WUPIN+zFUF9BkBXXyxdIqU/bLNGKlJUXlpAB0mEnjsALm/x1dLV1Iq1ltuOPzkMLW+QDBz2WFqPMNJw71WYEhkfQG51p9miVe+cI3lBdRlV/LSMq0Y/qrowDntg9g5YpjohZG3rjT0IlIzZPJbvTtU+EVOyhavmT08QJ52GDOoQA7hr3e1ZfgVpC4J0IQMhhrl2TO6AMbQt8B+9L4PDzUKZd9ug8caaGOjfFJowuB0mCGXbLsuIyhjQkFaE0Sg+h9ZJqUELj6LoGzgMAujQr5Osw5xx/v1cYgGwWBrntnF8jeXoYdZw/Okuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhsBWb2vxMCBK7qKyU3DpwqXc4vOSgxnp20A2n9Oqz4=;
 b=bqdxgKoC4xyiTqANkdEAkgsZBMYB14uT2EqbKGWxeBnIAeViY02EK5yoMNZUThxto5+mTuo0mdJIe48dxxrv+1SIq6asAVFXofYvVPqKFuiy84OWUdMLWya+x5aY/YPEhCBcsVS2f4fqehq+2BbWVjgW2WgCc+J5fggaOXcKSlE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 08/11] block/io: allow 64bit write-zeroes requests
Date: Fri,  3 Sep 2021 13:28:04 +0300
Message-Id: <20210903102807.27127-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c606212-96a3-4b05-b77b-08d96ec5982f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB694516D2A19D415E43899BF3C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UwTmhJG6C5ZqZf07tsN8Gv6zxTtXnMthGxyXMIW9jnYgEsIozBeeKcZzWmV40o2iMhXxaVerqiNbgp6nm/CbpZcRa7UEviVCSjL50FP37geXnUGHchFnB7ArxQu1ikGcQz6xEzqdwWTSjRI4wdJjRsN58O3MFDPQ0ZjgB+TP3pOpUAXU9Gpd1NDwnoD+cemwRBthTRQ6Ht2o7EfBG4x4vbe7+iWxDN5bG+A7x6awGbuoR1KOI+UPWWGNOn3uI30j6ACFBndwiQuRlXpfcfM4+WNxLkk9WezEx6aySJYDTgDNaTfJ0Odd4szL3J9cIZtj8NgSTKBNxn7+0d2TY9sG/uqDOHmHtQCDS4bFbopU1m2KiFyiEdD/4w1wWH1ZcV20VCR7u6MsoSnS5Hgf1OW4JduNXkzr82eBX7fJgYHM2NCVWROAKHivegO7abU27lvxw1A47C0b5b1lMCtyw4cULkaCY8ETGydrIDeInDgW4t6brvPdZIA+aoM+OuHivEM8QGMkfrknffLxH8z0Hxx4bb/cGxSRC4EVmeWjOMjIjClqFqSFd5sSQTrpChGWFqJ4mTTrzYYtgoh0H6OWT5ulabF+/eG1JdB9zC4ixjdY1rmwKoVbOQRrWBODo1Ew56/3ZLtW2E8GBmqbCAH+8Rur313Lj4ZN7/FaFIt0rgC8VTdi+p0xYco223/pW6d4HufjwycowD1XnVuh+qZ4NZUeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VZHTjadt3t1CP9ZuL+hrZdFxEPcg8yTmh7WoeIRyGWc7Iv91N/dojkMBo8Ep?=
 =?us-ascii?Q?UuCaL/KCCRHHBmiQ1itP5xrzLVplbe/VI7va3L1/qBGC40mRhMZklrnqnjqQ?=
 =?us-ascii?Q?i9FNbUSPaiJiPnkI1cE7KG5Rro/TNKJiGT8koSnV5L5N2MusWIHHC17DHgn6?=
 =?us-ascii?Q?PMwGik+2RMF4pz73751s0FQC6FJPSd/bx+NCBCAmKgav4cMj57qn1gyer52Z?=
 =?us-ascii?Q?LneIP2Y8V8jD80jbNKuotUKdKboe2HeVJa0o1eInLiq4abjVzJWtLYKX7N+H?=
 =?us-ascii?Q?QnbrOMyiummlWVUT7jDkkik0hBsTSRmJp4w8B/g3NdIUOmdcN1rM6DVg9u7s?=
 =?us-ascii?Q?eiTuf7SYsaMICNmol9aJsQR0fftkksCptZm0rbLABlIxPPdBDM677B2SaUxy?=
 =?us-ascii?Q?nMYrCR+HVS9epMZ8edf+qu4ig5AGqZTank3D1yvCdt5Prh0Usj/1F5TrTjzO?=
 =?us-ascii?Q?ATXr+MMkDtaGN1Y3+QlmJF9tZ+QPGz72ahAcdszbrrJ06FcO1gbH0CwYibaB?=
 =?us-ascii?Q?86V9wMaeGifCZxNZ5moVHABkcEr2LrOCCAtUVGF8SnRgUjnYekzJjqMqDwqV?=
 =?us-ascii?Q?tuBlR/VQwJdBnLdukCWrvO0Venzemif7+qyfup7yKnjVuCr1+WsNGDibICLy?=
 =?us-ascii?Q?5c6T7UOdvtbZa17v3xM5Q5k/Xk1VGCLzbYk+5oVyn3PUYvHcIzgDm4Uinm1J?=
 =?us-ascii?Q?fIo4iZvkG+vMtHjc05IiNyKXszl9K+GHkrpF+cS0MqxdRGd0dx0474JxhPBY?=
 =?us-ascii?Q?y5/7JkQHKR1IAjCmQ3U/bDmVn1l6XI0D8aK8lhZEWgeap8DjMo0+XJ1MJz6z?=
 =?us-ascii?Q?apYoA7bNAolGsrxX/JejtxHpDdhXJWozpQvpW6r/s4kb63yo3HvUQtDE48nh?=
 =?us-ascii?Q?dvvPa5X10ChwMdIFi+amUae34VAJgPfM1QkHHPnnH5FzmwEAgP/l1JAgTN3l?=
 =?us-ascii?Q?rJFv3Kf1tnzDm8zFG0WFUD+DJYiU7jBqxzixwP8e3Foor7bH39rXZfFKeqov?=
 =?us-ascii?Q?kdQfv6K1QZt7hNrUoWVG+SDnWPEIxFnl2nZp2QW2ZS7MGGt4wwYNXDNtD7x/?=
 =?us-ascii?Q?HhJYVkbh6SfZBXTvFZ+OyI0VHrOjmx3f8nm6fo2pLGey007z2BbFITEl3qkT?=
 =?us-ascii?Q?uIN/cK8OzUcEqsVDeAiu8X554LdHTJFIMf9x2j/zpEWLWfE0qLI7TQJ1IlI0?=
 =?us-ascii?Q?4w6siKZrURb1KBwqNQVOzk4oy0BTeGe2zjG9XHpmgTGzB3xix0C3ds+EvCoO?=
 =?us-ascii?Q?hL90DVoT3rES2w8Ue5tjAIED7Fru6mP1eLGxfjdLIBzp9Pm4uhDmi/NNu/bk?=
 =?us-ascii?Q?1dK7wlBHY2IbGb+9IKE5uCJP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c606212-96a3-4b05-b77b-08d96ec5982f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:39.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1CCzbIZmVCncAeqw50NtjR6/DR8mDLMCjQ+8NFHcKC0GEyNmUVgAenOQwOaJ0YyQmk8ZumwHak+7baEGEsxgVZWy2eZSzWm4hwMR4Nx72Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Now that all drivers are updated by previous commit, we can drop two
last limiters on write-zeroes path: INT_MAX in
bdrv_co_do_pwrite_zeroes() and bdrv_check_request32() in
bdrv_co_pwritev_part().

Now everything is prepared for implementing incredibly cool and fast
big-write-zeroes in NBD and qcow2. And any other driver which wants it
of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index b4dce946bd..c386cd700e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1869,7 +1869,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
+                                            INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
@@ -2245,7 +2246,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    if (flags & BDRV_REQ_ZERO_WRITE) {
+        ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
+    } else {
+        ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    }
     if (ret < 0) {
         return ret;
     }
-- 
2.29.2


