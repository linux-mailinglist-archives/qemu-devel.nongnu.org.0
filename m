Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28192371470
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:40:38 +0200 (CEST)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWwH-00054a-7c
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqG-0008AT-53; Mon, 03 May 2021 07:34:24 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqE-000054-9H; Mon, 03 May 2021 07:34:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUTWYXH3Et8g8ZAZBu6pMGCXdXbuWLb40Tk5ChgPsmWSWpi7P7Z2Gd82dljayxkBoAiZE4LYXIzmKdDDR1Iy7QiQExUxurUJ8EHtecMvq8/MESos0DNPQ5XH3GIFo+xcJbcNsSE2SslNzXkt0l/QBf+P15nSK47E2PvHKj/P3mAptEQg1Q6BC4azuJuWTl4EzNhSxkaKYNDeZCjwnwcqZKU5Xiy/peYZtmDyALKNFsueela5N3O8Sug97w8Nu8D88fiMpPMaPsooQQnnXvYMuvkc5R8gwofGayVxQ02KR+S/AXeMkgUlsfXanAteaDHY7iXe/z2pDj7R+jjh6RT69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cAEjoSj6guZuOB4/+LwW8DEDRGWWkcw8lDFFuIwXRc=;
 b=H6skpxuSAFajX8bf263cCd8SDYSPHtu9So1JBSX4Dyk4iPvOalZDzBMwv+r5HwlkzC7meyeJJ8K0TShZ+miuMWCb5P2VjhI/UD7xYWKJVoOPxMFZnuae87PPAIPpW8gah2TXDInmusPMzcv+iMC6DLqNyAl5rSkQ1DjzgpRDGC9/tg7Ut004IKRoL3wmG7qMPOEihgRwmnqsjr0k204LSCN86+l2+U4KCwB1Xt8wvCnMlBfsfAk/98eHS5TjZ79PKDMpo7n7zcxGtZUwIcTK8Zaww/Aj8iTT+mnJz7NGnfkFmZeuR5L6bta4sndVvkVWRgoBBcl+eNxzQTeE5RVAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cAEjoSj6guZuOB4/+LwW8DEDRGWWkcw8lDFFuIwXRc=;
 b=VC9O2CdQOMQYyg624RssaRt/xAc0U850PqEfr/oSuMh8TcNNYcSaiULexNT0965tBShudpuEaWWTgDxy3/Y4xXFCRLJCEN9BUvrlWnwMiM6FW30uJvQjqXji8Dcs/7VGYGKSZi0ect70+RUyg2/vQ3Ebre+a2sXbdK95pvzfO5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child
Date: Mon,  3 May 2021 14:33:57 +0300
Message-Id: <20210503113402.185852-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e88acc8-41db-4904-200f-08d90e27627d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17135E132F6F5FAA921CE2DAC15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWEz6S6Luby6NGloTiajLVSNaHzlZm1QF2Jf+s4PibDUDTiAbGWrcwjPsSPhxaI6/RaGYkeXEB5LgqxRoS7Mutwyl2eXivFQ2HRhK0cd7spsMnOgKpqdvh8d85//E9qsc2LHdmyv56D5spDJyEW1CHuYEbxhTO7urjqY5H47FgpGP0ZASxM5ZdL+S2M1/aL5SbiMXBc3NmDl7PgfX/kusTAqHdE2Omx5MgTDlX3LMebLuVw5I7LZitIXYtwUt14EarRe0M77Mnndi1E6CN5qnEQu4ZXQYuVEzEpE3bOYxrciG51oM2scX9psUadK9gf9kte5IGTQjGfTYjgpewrnICPAufU8DkOYra6Vg7VqK+mrytoySl5TUKkWuliTKywxxL0EESyPhKGWbMuUVckMkqgv437qbziVAy/jgO0CyMzUPb2PlxTaS62k89qbhluXeNc0BgxWSNQf4/NvDaN/1P336PUXyj9ioXDkNuok1E+RSDm2QmMR4ZYn2cnZzVHlGv2+4fV7VEOScLfwDz/LEj79FYHLHElf+Xr18hjzyZXKHuO15uxXotMidoKnVhyK7AmS7lbnS/feSPNX+Z/uZHGXwGQ3kNu+EDS3Z9Eb/RVobhhZkMqjglRI2wh4wWtwxEV3MQsaXycmShJeoz+exXL7ATKPp5FVMxPQmiI4fgyYbOCTqao6oY/4DosNj0UR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(6512007)(52116002)(4326008)(16526019)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UJMvI/+iCZAqFgIDiXHllaSaFflzTWANZO2zRP1AjEqupuYzo17VED9W7W4G?=
 =?us-ascii?Q?SNuqWMhUkr0c78D/SywxSjOBhsXTghdgOZBSYbFBPdnJQAFv74z+jXL+rxjK?=
 =?us-ascii?Q?n4rNgxy9kilYVtXD4J8StTmcDDou/fPVkyBQdthn1LITnBkXvRyBnKWFL+2+?=
 =?us-ascii?Q?QB4TXCEYaYVrvsx0Qt3efqsaKY17DndCKa4NDYp61xfBEsFpESPyyjEiLogL?=
 =?us-ascii?Q?52vM+QEi7OWQQ65efNPcQMkKfr/9ZzPMXb2ibOFL3dy2Bb164Yftc+tkw+8I?=
 =?us-ascii?Q?jIluq2t+ExV28BygNbjfTBLC+rRHPL7o4O5O90NjIQVPEz09TaYzO829ZADd?=
 =?us-ascii?Q?uk1/MPAp4GCw2RDFzKo3PA+I+CwP5j6nVmEMxcVQKWiVO7XemOq1g4kJ2dsK?=
 =?us-ascii?Q?TcX5sVMjUuzuOmXfBpVIzfNAcUnXl/3MCcL5TDP6K8KtzQe2H1UG3MC5Tvb0?=
 =?us-ascii?Q?sOWhAcKJqxYdZ0sHXM8TKQ0Lo0fa/Fuu0y+UmbP/1VVL4IaM5xDYnZ15mhkp?=
 =?us-ascii?Q?RUB8Xd+o1SednxCVBgRldYOdlJpBmQV6DlQrZNTDPxXBld7dQJQ2J7KSnPBI?=
 =?us-ascii?Q?bmAvcpVGHjEEUF5B9ppN0iBjXR0a73IuL4OGBbeUgX1/iG35afYo9jLVZHYv?=
 =?us-ascii?Q?lm+UYkN6gm5AZduqDWy6Fxa9HU1IDKK8lkvl32qJBJQRgnQQpDposROoGCE0?=
 =?us-ascii?Q?j87etZvbvoIE+O/Quq2CdPbhlTm+7vbbPV8p3XeD+l9YVYZqMtLHB80jhXhI?=
 =?us-ascii?Q?9ZP/+e9nhwiCsC38P+0tc2u6Tjn8ysz8+oPtQ5nA1YNUt+YGJSIlTDQwDXpO?=
 =?us-ascii?Q?mxPCg6PzZWW+eaghucipXY/NVKkAQFNbNjc5ijJzejd81RaS4MP70LQ3lApY?=
 =?us-ascii?Q?I8ezwaWjb69ScTsLGcS95Fpi98QajaGp+KkkMpTY0ComSLBOHDJEexXqe5X0?=
 =?us-ascii?Q?H62br8RRoWTg+nCE/DDrVtEn3XEh5q/wSCSNnnfa1ELgN5m1s2FNGyYncnWp?=
 =?us-ascii?Q?r/bNJxW+l33TSADyu5NLJR23jp8Nx4P75sufyExi4vpCqeaMnMSLceP1UG7Z?=
 =?us-ascii?Q?Q/L7/r4QUa4j7iVuuNUX+Uv5F3rbwGPOJqz96kL5bmVaAh3NlhFlWDfO3Uep?=
 =?us-ascii?Q?mj5Xx0sTR6Y6yhlxV0UqvF3llOswfIuAKKRx5nIrHg5n3GzXpyDyR2vjLvLs?=
 =?us-ascii?Q?W6f4vHlv70Pf3Gqzp9gmXqUTseurM2tLGEkPkI/scvN5dTRRanX5vNkiGSpD?=
 =?us-ascii?Q?tNazymuuP9ZHRT4DWJaK+2JqP2iCDroEwJ9yshWqgbi2ouKttH4lfHjAvcht?=
 =?us-ascii?Q?7WIyxIpt3kG70knqysXD2grU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e88acc8-41db-4904-200f-08d90e27627d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:17.0029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF2OLeaIqzMhDn8qARelafF56ilQoP+qE1BFMMpQZSZWWGRr1yhQc5Ep9A8X9TGiGUk7LlVYJe34DuLrRZ40xlDfdIu6OeCQTAwmrp15eYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

bdrv_attach_child_common() doesn't require tran_finalize() on failure
(it does tran_add() only on success path). Still tran_new() must be
paired with tran_finalize() anyway, at least to free empty Transaction
object itself.

So, refactor the function for clean finalization code, same on all
paths.

While being here, also leave a comment on unobvious background zeroing
of child pointer on failure path.

Reported-by: Coverity (CID 1452773)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 874c22c43e..728aa34b2f 100644
--- a/block.c
+++ b/block.c
@@ -2918,12 +2918,18 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
     if (ret < 0) {
-        bdrv_unref(child_bs);
-        return NULL;
+        goto out;
     }
 
     ret = bdrv_refresh_perms(child_bs, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
     return child;
-- 
2.29.2


