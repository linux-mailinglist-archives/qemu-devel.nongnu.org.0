Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E70689373
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEF-0007M8-7e; Fri, 03 Feb 2023 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE5-0007Dv-Bz; Fri, 03 Feb 2023 04:19:25 -0500
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE3-0000oK-UW; Fri, 03 Feb 2023 04:19:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0jME4kgVKXUQ2ci9v4MT7inVIRDhpSBBSaF+zF1+iBSDlNbnnjYt7Wu/RoR6hMT1Zdh0rycSLS11sr6S+DE4GbOs10iCX0+E8Ux/V8TYFF5BNJ0mvcB2A3ptPO175ictpB869/ooL81+k7SNvEEAHUuYlk7PPXtfNK3vz7zuRgLTaA3rP+RIgKKvOVS9Aw1AooT4cwnwrtlaq+4TwP0SSN2V3GH/47R7+nRgVaQUq4Zp4Kzmf8VtprAQebCR/10vTrBR0H9GmZ/b7CNSvJBLkhLqQyuHeYzXxe+cRywBxV/UJXPJJlLTRis5JgwbBMbNsvRKuUrGRifYix6uKhTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSAQfrnNEDCTHhDdggbEkX2oxk4SSHRhYpKMrKpDeHk=;
 b=BWgDk3nHhRsEoONuxZvqX6TijIfXMyp5rS1R9gk2YEzjiyrYgsE2ebBWvgCAX6IGS+tNDCFTJGFKhuODxZqZEo2w+dE8nhLjkq0CTqUg2+8IWDADe4hTMgTai+Yss2f095yN1V5/C0yTmDcscRgnKLqj1wIHVDPmJn8EDw++2GZpVskLw0CqPL/UaxqjBlCvGrEErHd/i73WM0sgYh2gglxUSS23o1H8Nou3TowpyJSBbeGYIUSgiTTD7ffMAuNsaI2Ds822Sn/+wD+pMDYahPnDSK6I+CM4qdJuoGHO5LHneqr/A+Vwc67CuVMmOMRRXTLDmW9LGqMLLllxql/C5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSAQfrnNEDCTHhDdggbEkX2oxk4SSHRhYpKMrKpDeHk=;
 b=Hqox3RRqTRtglbp9VSXxSptNnEENPZPK7jDgnF2FtDXg78jI0f7ka2uKOe5EkaCZjqFovvI5/0v9Ocx+pJhFnmWIv60fllBBEf5aeRPdC/LWrFNRLLexHTKXWtbNw9+EYR1o44YpexsiPgKmnoFCJnBmK3KngS0YtjZTZruGL2MTxSfR+qTEHL0lNipPTow3HYbXzvAaSfBj5tiG05PdyXWPOzivcuwWU7+ymtTx5vT7O7Uki9hhPNcWLI+VGNlMEdhJDd7RjCbN5keLfe9IwkT2APlNaVIOlHPCRkoqtA8bW3Mcm+jAVRsCAwWgk1KwOVnQpmtAJjtNcv+5CTdCxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:07 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 08/12] parallels: Fix statistics calculation
Date: Fri,  3 Feb 2023 10:18:50 +0100
Message-Id: <20230203091854.2221397-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 57630ce4-2f52-4b55-842d-08db05c7b377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CY0AbRFvCtmJJrzEStZXOg5PDGrTXKod4CWZ+W1lvXkBdI3i7Rzlzwlw3QIZgQkevCyb9/FLHkU9g2pVETtn+VzKGZHqI5gxNAcRdj6hyFovAbJsLxDlfkyCf8Fim6hV3rYOOcK8yx9erOJo7Waw35iGZwp0ivKGQovN9F0O935dyki47x5nCgHnugAXb4n0G3MogQilcuH+sodrmGcOWuSQXJEP03LucLr0t3pLS6bNxQjVWtaA0jcPOyxYn6ASceHzgA+d1+0L2L/2qQul303oDPctfo6TvIuVBUQ3WllJcwPN+NgfqJ0xzLJcvdIoT3TIl5j7e/FbKQyKGNVvRSJjX3fiVDLpsajwFlfV467Z8JXu7LeckoPlKlVGSqyhyzegkTK9DqNckh63Lr5ESw2mr5MVX3vuqvGPDPzBAt42xonkQOpFH+Rb9otjQ1dxYTkX7awTFCptEe9CQKOKItS8PxJ5K85wqpuE7a2pPO80SS0s8HV8aZzplFF3sKEzC8CZfxwoO/3dUvzLkXMynGxtUVkKbQgIxwuJBRINkpJad0m7xb4n/NBvhR7Up6z8ZWNOfRnEufchXXZ8h/9pU5cjXlY/krwu5wlzrYP4BvMAe/IiRkn23+Y2h2RQgeu2ytr/42B0VLCSsDYbyY5gPvfHAwjwkzG9q4WFT0AW/qJhkSKhA1Wv30BaD760P+eIZxd7PHcahGjTiWcwBY1jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(4744005)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+jMzguknaXaBbRJPc6BpMKKmelndErPalDbJYv6kYDiwFYwFSvHbEjPiZZC?=
 =?us-ascii?Q?aQ+nNzE7yrM98lDi8VwvgGermls2G4PF1V1lUSz0nHhgytwIYvCEXtIO67SR?=
 =?us-ascii?Q?MJ++6IqCszStMAemkSMzB1qV2EPi9Oieglb6MmrOgwynwca8sg+5/T5jlJaP?=
 =?us-ascii?Q?E0W7DQJXHqixwhhbgH64hdEgkoYdgCTHdCqPaSHwib3hflOzbhUGFXSKzLFq?=
 =?us-ascii?Q?4ezjt98pM2uBtLx/W+Uhac4pzIn7duFlD2HXI1lktED6nJvQt5YWjXzojRBd?=
 =?us-ascii?Q?pekeoqbKe5dQusk6c+Db2LG062BL1TZdb2wYtydQuzb0FV0RKcP38kcloVyE?=
 =?us-ascii?Q?oURfcdG/qwEPL7arIc+JxKuUWLzOcu7WLwee2QJ5mVD8nhV7AXUKdejk/h/n?=
 =?us-ascii?Q?iLjzgYE3uvIHIy69OXM25WfO37j9y0t7SrC3vjPR18qpkutZ1KKtkiJJSdKf?=
 =?us-ascii?Q?u2RERKzm8F1yTeNePNhvczyYuPLqFTUH8kxb4W9EsjgosJAWmd+ZzTUk0LGY?=
 =?us-ascii?Q?BgbPaS/6gVvvZvAlwSFLGoroy2Yexenvl4oAEGocniuQ+P1ERGtGE58TBWo1?=
 =?us-ascii?Q?8UVEALrRD62iBvGT4JSBLBOGADWRg/5BprpRpf4XtMqDfkrKcg/GF/V+XDKP?=
 =?us-ascii?Q?z9oECjU4EyMidBZPGZZ7ns4yggYagqZ4E3l2FOK1bDzaKAPm6qFwpWubcvWG?=
 =?us-ascii?Q?SNBLD7mKhhH4mj+aKxzqzDRkSf5ezeFdQUlgDHkCyRbn0dqJqJaAUHanse4Y?=
 =?us-ascii?Q?++qYkFWf/8zrgqVb58sAhZ+i/ysLI+99GzrvleRKBjk2IgYvP97kP/r5a1EJ?=
 =?us-ascii?Q?4jKEKxZOLKszaDv3WxkVrG1L0niFkiSrx+e3kl3k68pJQ3134OTI/I6t+cM+?=
 =?us-ascii?Q?sVE+I/YkcdAcb8Mq3CnamWCPuwQ8F1UlA7UYxlQRn9Mot1IpScnYBorFWB5C?=
 =?us-ascii?Q?CDqcVl/cvzVzeBrd5wKkwlb+yoFOGp+fQssJT9awV2/YwwX3Hhn5hLHcf168?=
 =?us-ascii?Q?C3ibUz4NlLSEAefF5T/iGgnwDDbC/vbiMtKwUeWcZJ4LaU5TmTHYknx3EWYh?=
 =?us-ascii?Q?yQC2RzNyHH9q5HzW2fIW/rl1RmQ365e4wG1fvxAcgiixS9A43dc77Rnh+JIo?=
 =?us-ascii?Q?4w8VW1Z2AqT1YFXGUVKPudt5gurMdVqrR+oiReMdhcQRjT8E4MSIrcqvfMl+?=
 =?us-ascii?Q?0UpHRQE1KwcZeevIHdzqQIZwEaU9XpLlPvKYKeYqCMe4SgsMz76dX7nDoC/L?=
 =?us-ascii?Q?9p4L9y1wJe0Z/J4rLaqltc3dx5dt5t449Ub8rBhnDtU8nYPlHll4fS3ADA3z?=
 =?us-ascii?Q?1XdswfsPGoa/3ui9p3l+BsXCLRCLEvqmL4NFpmZ5fjsPA+jNn+M6GFeOmfZK?=
 =?us-ascii?Q?iXiVMNawqvfqUIuT6XtBYFk5SOimdHBkLlYeJM1Hw/zsTCIGcXTZkMbXWyMr?=
 =?us-ascii?Q?SQsFxPoiQtLqskyPCjJ6Ul3PFovK1Q7w9yOg7XtaAXlb7MSmFtyJBGndhlNb?=
 =?us-ascii?Q?1+egQI3gdFtiT3f4AWcl7WeytvE4fU6BYLiyfCE+LuAw3LGLQCxPOyzfSVNe?=
 =?us-ascii?Q?3ZiUMkiJwbHmEeG10QtwLwozxrVb2eV97tgDDmxDk+Bs6MeZFwBo1mJQt9O7?=
 =?us-ascii?Q?k2l8ncpH8MN1vDoiGiQHS6M=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57630ce4-2f52-4b55-842d-08db05c7b377
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:07.2204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jvQTS9BR7RdBXiTOicVAZRfxxJ8Uc9xNCagWfU07CqO8l5IwhOE74BcH3GL05IpsmNjNnvssbsgjFDnTjQTInHc2PnQfRVLTZTWY77J7wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Exclude out-of-image clusters from allocated and fragmented clusters
calculation.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index f9acee1fa8..994528d93c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -510,7 +510,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
+        /*
+         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
+         * fixed. Skip not allocated and out-of-image BAT entries.
+         */
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
             prev_off = 0;
             continue;
         }
-- 
2.34.1


