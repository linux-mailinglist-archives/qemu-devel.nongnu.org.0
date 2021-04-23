Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14078369C34
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:48:07 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3eg-0004EE-3S
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y8-0005Tn-Ry; Fri, 23 Apr 2021 17:41:21 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:45636 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y5-00030s-0a; Fri, 23 Apr 2021 17:41:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhEpdzXKayfvQKRAjtJkILfn2Zca0HIEi0ugWlgFRQOiPpxJRcfwIQqlEg3+WmdIN6aprquA+psNRjMzyfET787Bm0yEfG6RS9QZI28cxZUldKcQdJDNKtXXQZdphnMXCDJSdOXPzRKWOvDzB3cS5mHFtS+GEshNPDGeCxldXLxtt6AloicZH6jlMF7pJQNflutx6t7MKF9pnOoKPyPAj3Aauu+oXEMKieV1QDS6bG/QxnmKjqQPwOfoXGx3Z4m+uBxJjrNrkpfme1VMV7qm2uBoMqXWU8F4eZmR2NYL/Vj6MXNC5mZM5J09CDUONiw0hPlm7qenB0cOK+9pTmOJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgV3SrP/KLLv7aHId1Od/9m5zdpjlJgeA+DWHphVYyI=;
 b=SF/sDHIKgKBI9FSkXqhn3/247uTVpjtGGcYl6Gh66m2t6h9Dz7N5ZeLt0YACGxID4Lq7IZFdNM9dWh4zumDdKJnMMl3BV+Fx9X4ZLtPpmrO6/Z60zzc6ecZLrg96TjjhMDhyC7h3fGR3CuQ7Ig1JKHB2AJ/QxV+X6Pzb7WQKhaLphRIAh2sK39fcYQDc1kgkUJP5Y9UBz+N+SAt8+yVbMND4ofC8iHpoiUqtwIczqWx6J/i6lAJQFPD8d+HH5Jm5RcRG4gFveNeO/XLw3Jv/B0d4ZMbOXYH9SdHsBFxQjVUYJ2aNOaQ5MO71kJYhVcsPNBxbQr0jBsPcplXu48kT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgV3SrP/KLLv7aHId1Od/9m5zdpjlJgeA+DWHphVYyI=;
 b=XrahQSbpTBaY8bHpb87BeDK4NvIjps/8ZDZrZVP1ercgpw01Fyh+AHrD/62jMyKI1VzxeQMlwGL1W31VGsZMxQGfJVAUfwNGTYTQvFMx0w5jCRpMWMj2YwLMky7ymZMidprNwZ6nZRGGyMlmwVh+j+bpZfhfpaasnFaBoDl8eGo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:41:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:41:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 11/11] block-backend: drop unused blk_save_vmstate() and
 blk_load_vmstate()
Date: Sat, 24 Apr 2021 00:40:33 +0300
Message-Id: <20210423214033.474034-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:41:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f50a43f4-5296-4d84-0078-08d906a07f27
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32215EA1190856008EBF4D44C1459@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xaf9wy91OQ10Vaj9adi/9uO5kIj4v6UZgAnnMd13sMrWsitAG7LrLAdHHLdDsOyOVjOQGFf0Q1VWuJOlQ7UL2tDgZhtLTggwShX+kNq3Otkq9JqK2GdE/yqWTR3LYvmfN1KMoRZC/eEVl92g/sWcosSwSe8gICnVXu9Ki31kn7+O168T3l/ZPfJp697l5BkzJSr5Q6yDdkK2UKrPYDPZR7+I4tUMeItNYs2DWLEIR5WlK4Td99hTS4rMcDeLjNFXbmGMWW8JQ7hLl38+tFacv/Yz6+OV1VjvbS2HJyLgcFYMTXkMqRheYh3KrnOx9PDMpIvG1ukv6Wh1T8YbpNUJxOJp6MPSfQ8FP3HAF4wOlzOqRRCVIdYL3SqKKVkSFg95GAm4OkmvzvINaqR/hhlM6UJFFICSpTchJtvLWOAL9QscCZOgnx8RKmNTQwFXkCx7gMe6nwpibDOWjhDkb/RDGlkzkkiYI1lrCryPUBPFQn+YT0aPx7/yXHnOY7DYkjLxjjUrBzNUsPkav+q/5+l+3oY7op0wYwzgYACKNXpNG1q5Db5ocUuW9Rl09js3U2CydKEFlK0RnCTWtHWZSpiPhUESrHeNmyAu4PKjiSSlRodnfabWk2/kE/FMkRqu7bDqSamXP/306QkD3lAyuXBvUsZeOY0E75AhkOAFxF0QPetMkEJnFhu7ARUjcvjapaZU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(38350700002)(83380400001)(38100700002)(8676002)(186003)(36756003)(6512007)(5660300002)(26005)(66476007)(16526019)(66556008)(478600001)(4326008)(66946007)(6666004)(6486002)(86362001)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(52116002)(1076003)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x/2aTH8gzISi/ZtwQo0JJ9a8UiH5ZX9C5dlK1Yy9/hPar8fPnuCkRBTQA2Lu?=
 =?us-ascii?Q?EG7O+aFQ2gIVn8isuRLC2z86ZM9wNz7+U8nfBQqEppWO4JbaVdbQHsw3Rs89?=
 =?us-ascii?Q?nYcvZ+M5KoWNjlCtfyFIhdsS0tBCuKa7f7POc3CONBCj9wtvAH1poveUnHql?=
 =?us-ascii?Q?GTYtIiobS72ZMwS+k2lzNIf4xnwE/zmEg6qYDo73YRYo6E0MSb4J8sHeoWKF?=
 =?us-ascii?Q?WEuWz5hypd7P5Gc0sJ7L5i11Ik6z4E9BCQV499DHdwdX8i3JUKuA8b2mgKSj?=
 =?us-ascii?Q?OobjroFWXfhSAT1XawedKdESeJh1OLS1aA8gORkhvjzdYpcOTLq5w6UhWxwN?=
 =?us-ascii?Q?UbCvhO2GnVacqFgdZwo/85OPiG4QMkXearBtUGWIMImjMIJVsrAD4ibMisMy?=
 =?us-ascii?Q?jbQC7RggfdKHF44jbCEC39lCsAjIbroPLDh5dc4LmEmIrL0K5kMRAhPIMsEW?=
 =?us-ascii?Q?lupxE8+G87vq8MVDCd+MQ9rb9+5punmKtZiz0X2r94RAb/fUyiC1u4cLpVgv?=
 =?us-ascii?Q?uF2WvJuHSGjwlNPGOykaC2IMoBKIatEhn4LQnY7iHNsytUw93nhpsLC8Dsyo?=
 =?us-ascii?Q?RuVvIXUZuP3u7ZckA251L5Rn2FyGVKGb11aQJpc1EIjQfv6PNGbPqTgMabdY?=
 =?us-ascii?Q?28aJGzNjnL/lNjrYu/t41RKcsY7woFJ6J9ym+dW/cVw+mpYf56Bh9sjn8WZr?=
 =?us-ascii?Q?rqu+UDllwkyA6Z9LVpB81JGeseGmYX4ya6qtDqWCO80JR5CZwc3vaRdm3v3m?=
 =?us-ascii?Q?9h6tUOxtleg7slsYNsiNr77mgw2s8FOFlYLcw8uGRe4HK0vwAUE5l9gnAZCn?=
 =?us-ascii?Q?GXtgNwBBgSQPDXHzCqI1228DOIDTFXtTEnfxwcxMYUjSsqKSeLueYQ7HS6+4?=
 =?us-ascii?Q?Wtro1Nv+XjzlAG4b4raz33aVu6eF8Y/quWFJDSdtLcp89zpVonnFJvHYzkZ4?=
 =?us-ascii?Q?W5GWfVFYaZR5896aIXxJX+F1/qcaQkQ6bTfTO299pbbyTUGMp080PdXZjUnY?=
 =?us-ascii?Q?lPhcpAzG0C2Fc7jVNnPwv273jwnQAZQTO08RFbbhc7cmvNmVljiFgm1GjGtI?=
 =?us-ascii?Q?NHN9Uda5esgZj4BH0vTGAieGAYlxYiHlNmJa8UT3L1HWnM8PkgCO/KL1YVWl?=
 =?us-ascii?Q?Rkjux+k6L1zfIfW7CPKa294trb6rXYmThXaHGGjbblZqPrJLI9gCdPySEgUo?=
 =?us-ascii?Q?MGfG3AgrQRW2M9tuze8gib69VHSLWvJENIQP73aMCyq+zN0vAtCEuiAiF+2a?=
 =?us-ascii?Q?UpugR1GPYJYnQz3CQwRHhiqfXhU5P62kRB6R2dmd3Au3uS1FZFQY6R7JLC/+?=
 =?us-ascii?Q?s5hthZNg8IEcQhS+V+wT4oG6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50a43f4-5296-4d84-0078-08d906a07f27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:41:04.8612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwVUjKbNSlbAybWbKgmIE5JqJI0g9qz9ZBJJLjw9u/wwD8wpIejfWRZbGg4pLVRodeg4yghAojwFWZM4Owk4IN5aqmIEz2PlyUqR/qWGENI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h |  3 ---
 block/block-backend.c          | 30 ------------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 8676bbde5a..14cc410244 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -242,9 +242,6 @@ int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
                  PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
-int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
-                     int64_t pos, int size);
-int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
 int blk_co_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                         int64_t pos, int size);
 int blk_co_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
diff --git a/block/block-backend.c b/block/block-backend.c
index d7f91ce7ad..83aafda791 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2198,36 +2198,6 @@ int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
     return bdrv_truncate(blk->root, offset, exact, prealloc, flags, errp);
 }
 
-int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
-                     int64_t pos, int size)
-{
-    int ret;
-
-    if (!blk_is_available(blk)) {
-        return -ENOMEDIUM;
-    }
-
-    ret = bdrv_save_vmstate(blk_bs(blk), buf, pos, size);
-    if (ret < 0) {
-        return ret;
-    }
-
-    if (ret == size && !blk->enable_write_cache) {
-        ret = bdrv_flush(blk_bs(blk));
-    }
-
-    return ret < 0 ? ret : size;
-}
-
-int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
-{
-    if (!blk_is_available(blk)) {
-        return -ENOMEDIUM;
-    }
-
-    return bdrv_load_vmstate(blk_bs(blk), buf, pos, size);
-}
-
 int blk_co_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                         int64_t pos, int size)
 {
-- 
2.29.2


