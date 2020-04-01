Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1435019AE75
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 17:05:29 +0200 (CEST)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJevo-0002WX-3S
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 11:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jJes3-0006NK-Gn
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jJery-0004Ab-HY
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 11:01:35 -0400
Received: from mail-eopbgr10096.outbound.protection.outlook.com
 ([40.107.1.96]:31205 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jJerv-00046o-JP; Wed, 01 Apr 2020 11:01:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyahS227jSK11y6c4KQSS5f9tSZayp5u5LU17MBljF2lSocCMOkR3riArvpSw+oH8iZoV/PDCvk1j1nd6L48aPRnsWbBywKk6aVlaj1Zf4bl28wNwMYJXqu1ErwzjQJkQvDLgqoUD/YNzmoB8fRIzRP5IVVdhuueeDRumhDw1jqOGIE3Ep+lqMGjJnZzWqDZEvxTJeY0dMD26w+V312pmcaRbi6hHNO2iuaVbjFCSwhnR37BDyE99SQ6dAIfwUBLMtwOL/kg0dOFq4y6NfbrBJqibNZM88YO56PKJlwdjPfhIBaoreFs6fzd1wWkBVtK1HQM+k4vI1nJvmDsTklMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/P6o6jba9HFn9+qZXwVrBFiVJZ4lFKlpvW7nPlhnsE=;
 b=hKKS3cjoHEYFqN484k/tk3oKdLYnbg2AO4yAc+nhf4aaqFPjsrqOX6jPfcazuFCdO6CttM5h++JUXlY7ma3pNFm9TbaxL+FPFjXORsqccWXAsuRCZBERpU7Wu81hcZ7T604vF4zJ+mxVwqgIs06vhqWYPEFxk3lBnMoNDaUtW7Y97XTGcn6tTsmEB2NNapgbnMsjJtCRluOimpLmm4K290c1jW/445IKuZDI82+6tM5cQT3JXpnMCGY1Ep1dYVujOKZ2pGPbqcia87Jzz3TJhMTIebQVnsQQCpke4zfGGkzXRdQgkpRDpe6gVLZfnyoy//kBxRlo/xqA441D3nks6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/P6o6jba9HFn9+qZXwVrBFiVJZ4lFKlpvW7nPlhnsE=;
 b=BfDIA2GpatcDcTUeKFJ2ThAG8upXBaE+nBbVe8RqixJRyciqFfxLSdLQ/DwaNIa2gBzbJ963yKQfs2anIZIHAwEAaT4rXnbX/54zTSSa/SADg9Lc1s1ZpzJ89msDGY+qHO3ULwXD9nsAWja0bh2m3HVMC+PnOAHyiSsrbZQ08X4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (10.141.175.15) by
 AM7PR08MB5494.eurprd08.prod.outlook.com (10.141.175.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Wed, 1 Apr 2020 15:01:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3944:477e:1562:cfcf]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3944:477e:1562:cfcf%8]) with mapi id 15.20.2878.014; Wed, 1 Apr 2020
 15:01:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/6] block/nbd-client: drop max_block restriction from
 block_status
Date: Wed,  1 Apr 2020 18:01:07 +0300
Message-ID: <20200401150112.9557-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200401150112.9557-1-vsementsov@virtuozzo.com>
References: <20200401150112.9557-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.23) by
 AM4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20 via Frontend Transport; Wed, 1 Apr 2020 15:01:26 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.23]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e891b2-3b65-466d-4f77-08d7d64d8d38
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494255141B6086BC4E22E41C1C90@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(39840400004)(366004)(66946007)(66556008)(52116002)(6486002)(86362001)(186003)(107886003)(478600001)(6506007)(4326008)(2906002)(6916009)(16526019)(26005)(5660300002)(6666004)(316002)(66476007)(1076003)(81166006)(36756003)(4744005)(2616005)(81156014)(8676002)(8936002)(956004)(6512007);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+IqOd2mo1Se1yaCtMx5+TOwjScnZcPZX7B7WUjSBOETOnjAfk485lp/56QgXpdrMx7fyS5NBILodCeOp+4zXlvKwamDlzPtGRur93JpMyZPx6cVkvRq1SQ9RFpo4GEhvFd+blQiitAOGiVqWrMMw6vDZQ0Hlw47OaOKzitWCBJLkVcyPkidzAgN1eCs3S6eDD+wsmPsKzqtd8ys3dgcnG6JGuL6w6bmrb8usVL5RkZiVRvvnACeTzVpPC3nr3K2Cj9Z1qWo6KyoFlls9RocCEwcjYh8kgAMc3vsXBgkgV9yg+vLXEqwCIybNbI9c3tCI5LiLqp/aUrZDzu44+s27vKv1maY/QnHGdSkvQsg4cyT0tD2B/LLtGD6wXy2AcOCNQfR7ITpjq3GSdlIOUon7DqO+AuhJNVFTgB+msz5SpoCAMmA57QBtFwg9pjyojrk
X-MS-Exchange-AntiSpam-MessageData: 4Xm21SDh9lVAlvZeJSCo9mgEZA4scKfrYc0fXHb4k8lK2/um3+07gNYAVBYoiGM80UryD5vnUVIyGWUaWXZzMpvgprJ7XJttPGq2NLGnBgH7TLUb7xQhYlSRQ8QgJsQ+zCRj6eCCSy6Ay5yWEwTo/w==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e891b2-3b65-466d-4f77-08d7d64d8d38
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 15:01:26.8050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffYuczaGFhTNXmxGyFDvoikPUMpAAeOxDHp9e2jcTeKfl7eJf+uzdjnfI6MUs6bw4z7FaUY9+b1UxnwLliGaFNv5sEEyfiwtucxostGZDZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
 [fuzzy]
X-Received-From: 40.107.1.96
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBD spec is updated, so that max_block doesn't relate to
NBD_CMD_BLOCK_STATUS. So, drop the restriction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2160859f64..d4d518a780 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1320,9 +1320,7 @@ static int coroutine_fn nbd_client_co_block_status(
     NBDRequest request =3D {
         .type =3D NBD_CMD_BLOCK_STATUS,
         .from =3D offset,
-        .len =3D MIN(MIN_NON_ZERO(QEMU_ALIGN_DOWN(INT_MAX,
-                                                bs->bl.request_alignment),
-                                s->info.max_block),
+        .len =3D MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
                    MIN(bytes, s->info.size - offset)),
         .flags =3D NBD_CMD_FLAG_REQ_ONE,
     };
--=20
2.21.0


