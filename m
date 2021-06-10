Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A893A291B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:15:12 +0200 (CEST)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHiQ-0002qo-MH
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcP-0004yS-75; Thu, 10 Jun 2021 06:08:57 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcN-0004uY-J8; Thu, 10 Jun 2021 06:08:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQjORHua7PMlRUB7Pw6D21WGsL9qBlQUrhCAP5LPL+p8gBBHPlNi6Baa26Rsil/em4UpDOBg+FxA4QI+c/5dRbvBODJYjqG4f7sVwTo0mDYMDnN451mdABIuo1vrJ00QzDeXlvcyhuoeDZPk0LAlMy8/fdOYdEKd8p2A63f+Ka71By7tSykb1YlJ85O95GDmy+YqbTGFPdw+UaUfV8pSdfyKrFPrre5MSFubi56dTKAmE8LslGes+zXUuZ+zt8IIBv9pfOD7VJbebQk3l31cCjKUJMIcZq8avNlRoHpuFVQaqy0r1NJjqh5kawuexhhQCsWzB/m58LoxfI17XDl6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoQe9a07nAcBPYLju8lIXoeEA8eDswQiCGtGDDQ2kuw=;
 b=Aby9U1HSjjQxQNabK7xZd+8m7wG6hHXmvKJuWzDS1Km59WmW5sGpaJrolDl69vgNqd157ZbbYHCGpZvyrD3TSgSFqZDIS+H2mXbJm8f+4H7UdEzdpS/9JFWD8XVis2+29VIeMpB6wEDzp69al7HDrsTO+viFTyHWUAfV1zIXWUynRpypS4l1M1M9Z/XYa7OjHPs8hTKNB+1+pkSuyJOxL4zuzRR6olR0MS7BKyWZiYFA8NhFwp7bj/uG7YEE4vhQBai+ANCFEx+PBrICV8S8+n3jlgeJ8Gf9Sev1hfZ4kGGRpeRRaLyqIiR2k2NBbD3+qYXJQHroTUg79JCrArRvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoQe9a07nAcBPYLju8lIXoeEA8eDswQiCGtGDDQ2kuw=;
 b=nNyiK3XyuIT4Q+s7r8mAYWqBvKm1v31MVGUARaNhYevXb+dW8sKsKiL6yD29cL6EcFZZvvNkQj/2pvw/Z/ChjZha1Yk1pF66lLC3FLqSir5URFjIFzqmYGUiCYt5od5cQX6GIhqR9IkrYazM3dFpTP9xl+9k+8EJ4k3+IlcmGKA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 02/32] block/nbd: fix channel object leak
Date: Thu, 10 Jun 2021 13:07:32 +0300
Message-Id: <20210610100802.5888-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abbb5ce-9197-4376-92f3-08d92bf7bcc8
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2035D21E912671C1837A3027C1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWjTDtq+GH60UydINBorX+KroQLRQR2udUFzfkzRtjZ99YmUVKiUPpmb77gaF7ZUxKBH0iN2Cc4e4Ri738HtpiGu8j04RiIiviEZLSJQidVogzwim9LqTcYG1efIg0EfkzGFishjSAn4hQNY2mP5rtnb/gld8L6bPiczPwGMQny5ps3CWgZozMpRB8HnZ5W+LCxd3tEy1wyb/6KeLecwgG1oq8cDlcYDC2lRiYLxYWl30e3+Gpt020YhoGGnYkEJK16vglx+2Q2sswJd/qLumdJXTFq3wOSm7Bxholh3CkYYqs0Lm7Z999XbutypjDCse05tXCe20IzMe8H8iPe1f7BaRIbyUvYbUbNl2jnrLN6dTdUuyhzSlqJriKdUgteAa8PdFYO9EogkKNWdhaxQ6nc/scGt2ldoEK4rb3WhNQBiK+5yMJYl5PWNgdwtkwSkY26KbaiQ3w+WnYxOF6gIcQixNgOAm9F/UKh9xPFcEW6ABkXcYdC035m211dY/wIqEXp+zjobVi/BkSyv4EnKk3UK5aDRcmUo3lKr/pGjOYajjdP1EIwXhY9XLErWDDWQjPerSHyvFPWVwgH7En+oULtmQVOBsjWcdvTNFuFiTSITotCM5Gv38S14a0tbFHUOYugIqvyGytSL0sXZthKC5WDF2a7/WRNox+zaqoVsUfVxmFwP3IGqzcH/5EfxX4Yn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(38350700002)(1076003)(38100700002)(956004)(316002)(4744005)(83380400001)(66476007)(8676002)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Up2OQSWuL4ciIKHatxt9MvPM8KOwajXhr1K9/s8G8qRIkm4rexg5jeIe3URY?=
 =?us-ascii?Q?21sCyKsatw6aEUqAb8FcHw/7ZzkNDwczpwgRPeNHealMfg7ens+0hsuxrqW6?=
 =?us-ascii?Q?DZZ3e+S3huoaTBIgG7ZjQiqo/gYzGF78a2Ce7vKgNMipVd1OYYe/EjIwVlpx?=
 =?us-ascii?Q?lVb9Tip1fbpbtL13gdMz8cj5BwceAGRwqEF9q5FLzshEl1RtIbXbvYhP9MaF?=
 =?us-ascii?Q?AnE/mHvxP9JiZkZXwtZZUaqh60fPaWr3jp16V5Ie+bqkUR1Yz75uQgun0pMt?=
 =?us-ascii?Q?4jfxRtPvp3pMazufvMhSPrRgNOlHvHvWpzeidrER+4Ah52w/d4lJNw0af4wf?=
 =?us-ascii?Q?+m4P/SriBiVD5fVQCEuV/ipW2++GWaqillQZ9mImLiljDFt9Q2bDcTMaeUmV?=
 =?us-ascii?Q?Ixg904OMRo7zQ+XAEM4ACamYUSEPTnUp54NoMotkYoJwtajrdQxHF+Z7VZhl?=
 =?us-ascii?Q?A8A+nHVOXBJ0thijf/k48pCmHEZp7g4rvzYSIzmAPgmPLUE0euZ77TnZrkXP?=
 =?us-ascii?Q?PeKzA9o3oYKk66Qx8KUW2JiwgTVyFVNur5ZeGbFaWPfr/jCgcKr1tpf45RVw?=
 =?us-ascii?Q?pcdMamazeTQRETObvlbyNjySOdaG23cV+STwperMG6ukQ8vWeCvzezruv1cV?=
 =?us-ascii?Q?OyFzFu+9n59GyxcNUGl3PUnjzf5DkDaEaM0mMlIBylreU3S1SUBYP88WS+iq?=
 =?us-ascii?Q?nrxOCehVaXccjp5+XM9bm7t3ucamTRNBQjLJ9fSHBjQn81nrF7Rpc9HcvUV6?=
 =?us-ascii?Q?3jP+ka0MH9eSQYvDofkS+bR539hGoGKkb0CTofiemAW2MPf17/aNt4LZAnZn?=
 =?us-ascii?Q?oRGP03x4lDJir4/sMvEr/RuW8Q2lbXoPMRZFGj+c7Q2Bo0e5LyP6usVYWq+R?=
 =?us-ascii?Q?LbennKmYo2bXGyMOG7QTDab9W9ZZq2z3jBW0z1t4dCaMHFlInPzrYl7VzMY6?=
 =?us-ascii?Q?OT0Nxm0NPVr9wOmWS655/yT3GXtTN5s7MPFrpu4a+qFcAcQJvTpxF+nB5d8J?=
 =?us-ascii?Q?QQ/AjqndekTlGaSEan28q/U8myKi0lRUCWpyFJnq85ZSyQ/AT1EV9Xu9NOjU?=
 =?us-ascii?Q?TYTO9HuLFEsrVaWX01vZtVwVix1XfOn4ogzHlImR39ZqCRbp0DELHzTksvlZ?=
 =?us-ascii?Q?675m4TyxQIGC/g0ecgZ5yz2yV97VedNDTloGXFyFFpD55EWW38vYYCrepL+u?=
 =?us-ascii?Q?WuoZdcER6/UNiUMQS/BMQCOkJEAkZGURaIF4IfS/1xRc2V7Cmmqh7ryje+31?=
 =?us-ascii?Q?pdQ8D4Te8N6ELF7fBOuf4EaYTmAO2DEz59QEn2qiXlq3rmtkjX1GdZJupsfm?=
 =?us-ascii?Q?IiubK2RodVsOpP3FtxUYJQEX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abbb5ce-9197-4376-92f3-08d92bf7bcc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:47.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIxh+J637gEqwfhknE/NAeBgSe4uHPX3BUZ/p2OInaR1z72i5Zahr9oWXs/nOrz+IpxMqzOiA3p7ihJvEjLs2NkTufP1l/a4tpV0IQ/+vxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

nbd_free_connect_thread leaks the channel object if it hasn't been
stolen.

Unref it and fix the leak.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 616f9ae6c4..f4b3407587 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -381,6 +381,7 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
 {
     if (thr->sioc) {
         qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+        object_unref(OBJECT(thr->sioc));
     }
     error_free(thr->err);
     qapi_free_SocketAddress(thr->saddr);
-- 
2.29.2


