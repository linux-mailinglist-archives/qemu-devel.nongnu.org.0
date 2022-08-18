Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8D59874B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:21:58 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhLJ-0002t8-6J
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEq-0005oF-9n; Thu, 18 Aug 2022 11:15:17 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:49772 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEo-00071E-8U; Thu, 18 Aug 2022 11:15:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR3hURJ3cPCjl4StGRvy6H1pmX5+gIIaHskHph4iZjeo0As9XMuDHUMzuglAO5EoixvkojHOMfwTvaTbL5plzm9wkseNei4LGbAw2mRGY+tns5pDbYXXXblGVUm4w0KJqehdpJMErthOTY/Kc4VLaCOUKtHaECS67xjvyjFDGg4TKVtOrIq73q3CbSn6r+IRJcTp8Dky4GMV4Q2Xtzy4FEDa0VVutMah8ehOFS2XMb5V5KZR6FuvC0IGoidHfuRoDSrVPwSHzsIkwB4PsLtokq0JUVg9SvIiRM3frAV0oMFKv+TPOyUldghMXUeba5rQO6usR5s/pY9eCz/xSMy3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWam9sk5//UyvlgJCumWTo9rqTjzPn9kNwCbYVSYCYY=;
 b=CTX3uCElsR7NWuQW0Gk+uMQRPDBfRjjL4QIg6vJN0N3Z/l7PbGv2WdQZjeW+P10qxrimVzaLOzJ2sdEsxQ7YbFwqSfou1nHUX6J6SLCBI/XJllPdv3e8Ua1PipwoG6pIKSwcwREpqcv5iI4k7RFa0tfs2/VoClDIqd7KHdo5oYf4qkqzug2tp4Ov5HqSQ6x01qrKPKCZmt2wYxzaqPIgfBotI9CuOze8Z1319M5MU1GV73xLaKD4fH2l0Gn37EneKoZz+VpTnmf4OYI599KLY8WFYLx66IQOnD7qeQgkjTIWdyIqcGOk/wdj6gQtoztD+f8k63j5uKNeofaB6Ae3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWam9sk5//UyvlgJCumWTo9rqTjzPn9kNwCbYVSYCYY=;
 b=WqT5RdqjDSF3vOob78x56nkOvwvlp4na7pka7loBKQDP0RAOlxezmwbc8vzMTgjpHqP8uLDVe3Pmw8pQnc9BOXOz1jpQxRVKH3RizuX8CFiD9wsrEqytiRP2rodcMJ3RK1VALf7kyE60l4uMntZtIAfKQO0oT5eBqF9Wu0hRyZATnBitk1cGn1vVomR3J9EnyXzD9X9saqHx+MC6ZB/D5FPXRW39nASKt/Xn3qf+LcfLziMET9/hhGfqmv4u0ietlYJZuWoYu9qogQnOeza8WZ55TkdnxndoPz1B8BbH3aIOhAcrXeM5n25ujq8c2ni9eTYWqgFxWC9NsTYDYZYOHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:07 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 2/9] parallels: Fix data_end field value in
 parallels_co_check()
Date: Thu, 18 Aug 2022 17:14:49 +0200
Message-Id: <20220818151456.2118470-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5e91b67-5d16-49e6-40da-08da812c6efb
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzQBAWWUAhmqMpW1dJbNNyNl5AARlElj6dtifOFWXTrCA6XnT2MJSpU1lollNzim8DFS6KsQQVFg2fN4iDCNjH/nN15zWbYSHkzOozz/9U9ogbkYhk6uFeprPDiQ1cN29Q/ds84eaHSqJHzPJP6AaltUQR2OTjtIAZQ+wTgPXRwzQItgEdJd4h3g/yV3sfhi0T7rWBWXrbZ9s90OsrdRXLIadG2UoouEIQyZxhnm4aFiOu6DG7GqjRXbx2CeX/X/dBdN4Gznk7NTe3WnHAdZ3a/YibW/+HIefwJr8SxmKmB/k3n30Wf5SwhWOXDHfaVWdJErDjrstVUX4dibvLZlOXOPk+eJr9E8MIGBM5NgIJQSD4WjvxgPxBAHX/3yzLANld4COHbopzmdDMsTlU8dUvcFmfWM003DTEzMuY7neAKgS7IDgSfP5wItXNEm4zwURYiWPpvbNwOcB+adOddIeF65xbG5WV+2CI5caXOAYDxf8s7aUz5VUt33+0yYAIaw4sLwQIsUktmzPJTHPbynoSbXK1QWtbWss8hOHoqSD543EbYBxKaSzfCBhc/+RPrBX6B10kcmT98FgBSbphe6M3UbPh7uS5Y8BrTCmAEMnXzD9XusfX0s7z2QRKDZerABsTIQsbpBCVUfbinl/Z7Rg/3hs3YgJMu4LmPRrMPU1mS6vh+11FxBUSyCvrdTHC1mU+e0X2kJe2hsDCj9n6ZYCPj4ofKHSpyB1SRpOqQZ4fEzMfeX7Wva9oe0EMROkOPr9wBorfFA7jjumzXcclBaUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(4744005)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7sHTP09oD60FR/cExqE/C0hu+DBgBqquNM9x8YWrzfMz8YoW8psduzYRt1Oz?=
 =?us-ascii?Q?o/JqPTXMj4XwZmHQ+LwooAkx4ZR4K9PJPHtJ5IgIH6Vc6TOvsVKHSbQf4F3I?=
 =?us-ascii?Q?XdcYrwsu7m1DUFFb7maE+fWEtNhr1KvrRFjjAL/SMikcGW1QsNTpnQwaPaQS?=
 =?us-ascii?Q?XchLcp/K5IJRTgAzWyhkDvNfp12AapIC9wcSbi+dEkXJCeMHGuJUcI+AcaHq?=
 =?us-ascii?Q?7lJMs9xfcNrmVmRbps6IraD2vlrRp8L3IC7p+/mz9Js8bKoFko5P466KdzIQ?=
 =?us-ascii?Q?MF5y/rsJ/N/FENX8MWQhREJZVukcTqrrff3QmaJZw8N64DOdBwYWpOJ5XCLK?=
 =?us-ascii?Q?kKWmpHWwrZ3MgVhdZbHgby0D8OL1Q4vFPuSQ6BcNM4Tui8pB6j3tTyC6EP1N?=
 =?us-ascii?Q?yABbHe0/2Idcax6FncuqZ77qV0p4IsFrv71K9NVzS4vlbbdGO1n73WxfwtFd?=
 =?us-ascii?Q?FSzvNSWpqFEDF55AiRG4C5EDqD5RakvZba6tHhr9IlI5+0Z0IbT6GbHZocpJ?=
 =?us-ascii?Q?/Ws25wc9yYw5veesjOpcGvyFckzSRMnRbDnfEkTtQrT9Stf6Vl2lXHW7Pk0C?=
 =?us-ascii?Q?C/M3tcDCteVbkuyn99ElhgCZJRw87xA4LPejl/jjO+saMCoclQTpmYeENmEV?=
 =?us-ascii?Q?DujufTw3japS7qQsxWexEhX/Ba0799b/S66fq7maFqKIWPCpp94GVKLvG5Eu?=
 =?us-ascii?Q?WQrKkk45ZazPFj+Tvk0ZhOrsc7bXAN1sTGYe5lZSxcY56yfhx2f1I+6+Dmvz?=
 =?us-ascii?Q?g0KkU0+9B5DzO8WkwrFBwRoEo0KiSR4BQGvmfdRBgw4Fle5vaIOkCQsajAQg?=
 =?us-ascii?Q?mN8Lb4rYhtNExPjGDMdhILbSRihMrgI00+LN7Ap6A8/kQzK7xphCNU7yL4SN?=
 =?us-ascii?Q?u5rmUvfV/TY55xTgK6ugvsRNlJ0s0fg+iNYNAFKXp7uFsGcvZg7T2Zyip8gd?=
 =?us-ascii?Q?v5qmARzPcD1RemERctfwULbC3m+iUpq7RxNTVkA8Er56SwtNijbfWmImFTyV?=
 =?us-ascii?Q?y4sQxtc91mc0Hqx6HHs14Cx99V98AGPzIAy5aXQM7VW0qlBZFXMQpDaAo7ad?=
 =?us-ascii?Q?emKO6VB33warNo3sq82sLfZmnbT79NFpoe3tNSnZWu8xOxf68UR/n9NAm+Yn?=
 =?us-ascii?Q?g4UFk2tEWAsMG73QX/mFtR4Wdcj/16ct1GxIVQYa6VQu/7UH6s9X+B980XkN?=
 =?us-ascii?Q?+LkJCJuYxKxNBS68VsOoZSo0JN7SH2aJv57Q3B7bHEvkK6+crZGkY16nkcwN?=
 =?us-ascii?Q?rQFGZietL1F6bevDXNi9+l0/iKAmPWeNIfGXPpmtaySmwI+ks1qgfGeAgW9b?=
 =?us-ascii?Q?K/GKxuHhpNHWEMXfDtF3IST2fLyNDnkMge1htkL0J4OT14yPK2fhOo497rKU?=
 =?us-ascii?Q?0wrIv4N2GOodHklpRHJivjgDJ0M/Zn4E8jRLliv3m81d45psKV2pkE4ET5CO?=
 =?us-ascii?Q?JSZNpczBRKP7mV0UTgclSbrTl+ogSG+D8Lcm3sG7xwuAEIx/BMWrgsKfnqRL?=
 =?us-ascii?Q?bgsVLEA80sDJvNAw2BNCFav26y50nUjAnjXhgao39VTiK6HY40sJ2W4dyPt9?=
 =?us-ascii?Q?FPChjX2SANlAbz6g8CI9JUzEm52hTBT0dZhKqiEy7pDa4s0w9btqWoAtiwb4?=
 =?us-ascii?Q?vJQ1dLIM0du7cd4FsxzFs4A=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e91b67-5d16-49e6-40da-08da812c6efb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:07.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6D2ExoU5etqSBaHWIAEh6qQzv5Nb30BN34PkwH3ZVP2t0lGQzCxAAzR+IK/dDq7SJkgywjKPpJ7B+0PXpgQq0v5dBMQBrNx7pxd2tM80lA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

When an image is opened for check there is no error if an offset in the BAT
points outside the image. In such a way we can repair the image.
Out-of-image offsets are repaired in the check, but data_end field
still points outside. Fix this field by file size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index c245ca35cd..24c05b95e8 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -513,7 +513,15 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             res->leaks_fixed += count;
         }
     }
-
+    /*
+     * If there were an out-of-image cluster it would be repaired,
+     * but s->data_end still would point outside image.
+     * Fix s->data_end by the file size.
+     */
+    size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > size) {
+        s->data_end = size;
+    }
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


