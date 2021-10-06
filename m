Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE81423EB0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:24:05 +0200 (CEST)
Received: from localhost ([::1]:57042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6tw-0006Uy-44
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nt-0004rm-HX; Wed, 06 Oct 2021 09:17:49 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:24830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nr-0004Ha-5U; Wed, 06 Oct 2021 09:17:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNcpfXJ/eOnW4JvpVt68JkOhoNj0sFlKepoWOVeegUiPGUaCAUeEK9i0EEnsWokMMoklhODPla9/WIedLkISu+FDD1Xs7CFvYRVKkDpjhgCgW2cXnduCRrNrfBj8ZHNX8dRabO8DxfPuNzvyg/pLDXaOIZBlbKNK+Ett7M4TzqZX2MJiC67wlDj/IgBaZW5FZ/6sRCp4OYuXcnRZLc9KfW4bsAQtKyziVNNnUHtRIg6wfR+95uybKgjawWJcoVlL2+FLzt2BH+4GBd2QoUN/pE+g2tXP3IMO+ZC5ycWoykvetZeOVoEqsFt0MohpiLOp9TBjtYForoLYK6l9RQCwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBu2DEz2DQImlNi/j4N9x+ltK4O2K25+p33rd6WQirY=;
 b=bzBsG+4g7IQCHnWm4+g3rdlFInMWJ1DiYXVt4ttPpZaQ4sUHc3K8kUxDmVdiHeVUFD0TsQbJrAXA3vC6VJPsHgNMEI+9lUXYu1qt3J2CvKoZ8L37wwT1Vu35r3zLd3R4dIv219DUWf/+f25Xw3qlO4n5bMJCegXUERH0f5RhF6RV22yR8HydDZeR75RelT9WDwvrtfjPZuJan/w+vmZxiG5IOeuoiijdc4dNzW2nKe1GVh6BxaTZ/KFmbALoGaqCColTPBWkDZFQDHs1HTRRwonC85MmMWbq4z9Ydq1ECF7Zi+ZYieIoRjDcEIYT9SgvFNHicTm9JllQZnd6tKUkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBu2DEz2DQImlNi/j4N9x+ltK4O2K25+p33rd6WQirY=;
 b=SZ83d7wI/ATmIX8SHC04grH6JX+5exMYmVZHvr8zWjSS5m8W1egQCH1KwDfLyzeJa1niyN9VRstcd4en4J7uYJ48NHSMlt/4ZKdC7PdLKX2C3a04vYBZ3yErNDqnzHN3iQ1tBecjiUl79LsR3wX4nuCRX54Iln8gdNrHotE3Lb0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 13:17:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 11/12] block-backend: blk_pread,
 blk_pwrite: rename count parameter to bytes
Date: Wed,  6 Oct 2021 15:17:17 +0200
Message-Id: <20211006131718.214235-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16da03f0-80f8-4995-0e5b-08d988cbab90
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59106BE144200CE130B294CEC1B09@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LntlPlUCKzRSjEgZ6R5VcPypHs+puC3DxUb/mDHfiCkXMVm6qZ3bIkfo8elpJNW7W109Dg8pkoIkcZw/h5ZfQO+f8PAyxGb9fSY7fkCIISBGuF7bJ7l13OwHqAA2yMmrlXfEu26bePK/sjh5cYP8w29Ip5Bxnc3iACf7Ac98N88232ig8qcaXriQldtUd+WoU0eSgZgC9AvgSdXomELHnyg/jIIHQ2eTRd+L18cIV7+JObZ+oBtkgvHBPmBMAcxao60S44AvF3v1MrPSgz8SOUZoRe/Egoi/UEmbG+FwgGZMfM1IGDqjaXfOZRnThnqozIWx53JDu6REiYRISiMUSQmu5TVDQGTf1mzuMPZloHgVzZoRUVdhcJotZpsjIeBRNWbaTm43g+xymQAP0fBQHg71KidQ3te+OL5dU1hpOVHh4KjK1o4nZG1flM8dDkrTm4LxBEYUgSwM/P0nJeVEKU28wznuTufusEBf1c2wVC3BmvE6NfEoN1JHXbKLeIVJRZsnzYIvMRgRcySb9yW6afYd7lou+MwI+eAqonAWz4marPIlp6TA6by0fj5bEixEP19UPapAKjNA7Sq8a4pHawHJU4lLNK6DSqFUkKiTHPjcbehSjCpeiqB2DbYelIR2ffQf8xSxtscoSflxeB3v8IIW/axzyzOKcTKwmh9pZmrE6YmiSKXqMa917dFNysBRCKN70q4ytWgzkvT6sMYveA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(83380400001)(86362001)(508600001)(52116002)(2616005)(956004)(66946007)(1076003)(316002)(8676002)(6486002)(36756003)(6506007)(186003)(6916009)(4326008)(6512007)(6666004)(66556008)(5660300002)(66476007)(38350700002)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GiZtyxQ6p3LHfAGmxpaoCCQYtUZFmC62bTcYRngfBLg8ZzsndEwhTvPKjFj9O5huR60ddCvfutQ3aMp/kk+8rZclbB4eEaNe8eEzw5DYxYQLQk+Rt2TfbetBg5JwhFDcrHdRKNDeTVWWO3YMbwbnhWKs0kqeTq1JkkGH884SWl4oCDFfE7x+NZqXIgwz1HVdMB7VU5iqaRLtbuO7LbiuAFaBeLKsiEE2z1bmK+gL1O29sjrUPnn2Xy8U1GMIXG2Suc2a/IhLgp7Xtb+3XeXXoB7h6LkSHuH7Nibm0lGqcFR2jmXDyEL0MQLOoMZAwqhJLlPrkSBH7WEcdPxQelP6EKCLcpOu5nVv38hTh/9UVSwBaLTXxCvAr8IC0fZm1Aw99z4vjpQSTq1l/Ik9V4E8b99x07g1UrVo6XhFcPk8qu/3RTBh7qBuTbqo2NufhZ3Zdvl32Vvm6sMEzDFUsCq/IwdvY0R49MghzrvplKxmPC5H6UY8danS8qDSsmw1ocW/oxXNcyq6ELpgj1E/Tl6Joph6pttG5tlN23sdW+AaqH7qzawlMsU4cwR9f74wsym88HfJGsl8S5kNBHUWMsbk37dxMystRVYgM48mQ813MqJypxP83uVonSNOVqwg3Sr9DcKAVW11YMUBm/gTp01DEKlfzIF+4N+vCtYoylUmT6NO9e+MYVzNXiDp35YEJHuDfAq3UVCQGYYFxPRX7CVsK8WnsjTts1XSo3ECiqOzYKiZ7y6V3wlwtigyPhiBxe61
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16da03f0-80f8-4995-0e5b-08d988cbab90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:38.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bkqdNeMoPC1iEUpCDGGPa7OfTWe9rGxnke0Mv1feMJD9U5aXARdr/qGVfOsfmgvgtu0olO5tCyZg833jHCeAaSYlsdF3ysyMnCvGY1HZh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
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

To be consistent with declarations in include/sysemu/block-backend.h.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-backend.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ef0f65be4b..e2b363ff63 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1477,27 +1477,27 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int count)
+int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
 {
     int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
 
     blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, count, &qiov, 0);
+    ret = blk_do_preadv(blk, offset, bytes, &qiov, 0);
     blk_dec_in_flight(blk);
 
-    return ret < 0 ? ret : count;
+    return ret < 0 ? ret : bytes;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int count,
+int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
                BdrvRequestFlags flags)
 {
     int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
 
-    ret = blk_pwritev_part(blk, offset, count, &qiov, 0, flags);
+    ret = blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
 
-    return ret < 0 ? ret : count;
+    return ret < 0 ? ret : bytes;
 }
 
 int64_t blk_getlength(BlockBackend *blk)
-- 
2.31.1


