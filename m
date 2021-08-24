Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C573F5A26
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:50:00 +0200 (CEST)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS87-0007nw-QE
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyK-0002ku-Rr; Tue, 24 Aug 2021 04:39:52 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyI-0007OJ-41; Tue, 24 Aug 2021 04:39:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP2tTsMG6D/bUZkOs/QN48KuZoO6+yjcuHYaGBx2QmWi+e/q6q4b8OhJe20PTiiak62HXPENh+4v3CtdD4PNRiSF5uavDg8Y/eZZJ4CzpG4MNHp+rDAk4E+M57nosTX0HmUmB+Z0Xi/kgC6I2P9QSdlUfPpMVOWLvU5JFIyZ3zl6pgrrQ2kLHG/8Y8vgpmfB5/uNgz9JklqkMChgfCsD9SRK/TJtcDwT39IfNPxT+1CZWNQBbVHzCD55BHfQWby/Y6J8YU5SOUVbmpSYXL8oDpR5Irz6B3x+zYsot7QnX1UBfckOcK4Z9tKub0ig6zQZXBiYBTUixcuQJI1LVUf8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=in7bcr4TwYtjMJXJMWa0WhQTzjcC5narGHuN3YBEj53JVwzgMDPDza8tKMqcsHGA2OV4dYLi+iMuTthDm7OrMdiyhpYHMoOMyzQyOiUowuRa40J8OlHzLfEZT4gpgjGty2OogEfYLOTsxbS3/hIzCWnNiF87itjNojB92EtuOEliMSwxbToNVSuM4iPgoxR5QNJJkkZaOobe5ICPx1iCpkHNikIi1+bVFP2hcvASanrbvHSqmhs+s+KdNJ10jnvb41Q++4nGya8ZWIYmChx/yXhwxvlCDR2n4A6S/1nDG2FaUBqjNlU9nE8Bw696Bza/4yo3ZDM/fXiSZT7oDi+Whg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=OJzSVlK+3goGihXVBjuz5RqwcSc1brO4FVbRZi61eCHttFgXeN+pLtTaclJbbV/h28JP0cK+n0ZIecVTwyIkgFqRwiSt3jSXDlXPxb60YfQ51KzW0/xgJeqj3++5bQ3m1iraFRNMB/1Sz6oXzftR0qTy1OEj6RsTMjBdlQdm8xM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 11/34] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Tue, 24 Aug 2021 11:38:33 +0300
Message-Id: <20210824083856.17408-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d268a4-f200-4534-09e1-08d966dab20d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1780DDE0F3E248CAC432C097C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJkDn2KL6LCB9SSsD1xDxpkp5PORitfuX+eGrw450FB5xaXNzoivCZ41NDx8vRyHbi+rTLZR50bxg9XFYlpwCetu+fX72/pdB6qcjU6E/3Xyq5yJH8a98xR8YzIhyHgDPf2EXXjdcyyGi25iNeekJHzp4I/SubMtshtlsRu3YDma0+xQnXBLoiqCyYyceOIaGbpOflU59kR672BgcEiUDBSsgaHSQK3//uwuT3egQOzDeVevgCeAHT0nZ/Wx95ez5GEOUGmsUmAnZLRM0vcOuWP5G5iVgkK7mJveze/Rf9CyXr/zYgv4xfXjBYNDzyQLGT47PkIRWdLfZhaJxcPkS82n6i1pz+0tOOJ438rVFVMjxGvgp3f2a6Ym0BY+FgAFdPyXSk+OGiwcD7xjdsJ3l+UxxYFepjY8qkhWWbE4tNRM0BpXrbSjgEI9ZvabTJM6T3VblloHIsjuPfDssXDNwAMUxbwvzAmNAp2nKpn9YOAIn4PlaBjs0Of4jPuO0t3RHDVZA0igsWEfz33Edj75PZsFklsQSl7j4LMPCy1r544aKUrz8iRCa6tu3tGi52wPZcdhQSwldEXBvPSbOoGqOtaduiTIYfuuoKHvfeSjFfSD4+G3zbvDtRM6XhMlMA/qkV5v6ea24JjH+vVdCYwTBRDA+fB+lQ1/Icyu8RyGpdWYTD/nQ/d1V34KF34xy53ONfMeEyJ4gNEhxSqL0gNMcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4744005)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tSKrk1Q0M+DR/TXiFRhmUxZTwLUe9dSL5fRx38Gn3AfN4o6WPE5wTRwRYYeN?=
 =?us-ascii?Q?6wlDzyfD8Jc5qcuJg5bqswk2tGeD7QvNVdPXZZ7bv9xcC7ruhpkn9MUCahPv?=
 =?us-ascii?Q?X8PXEtklkFgp75nc3nq4MGhYKffnxAFTHJOysTEXkRhH0vcKtvgvlkwkofQb?=
 =?us-ascii?Q?W0fj4T3XIjjaiuaqmFp8iwf76MTMxQKtFy4/fQdWoSd68VtdVICokRF9k4BL?=
 =?us-ascii?Q?v0QM1/xAADsrmpSPDAkaG+12NjtT9tZLArb8WIy6o/rPNigJ0xTfhzQjearB?=
 =?us-ascii?Q?yxPtHOjFABA5hwLhCaSlEOTONcntX1fWWwpoxJmaltp2p7Q3jz0MWTrS8AlP?=
 =?us-ascii?Q?ldp0uaGXxc0V/2/lYL9UYI9YPJ9SkLMiEIiguQ8vIbIdvv3h7fLkA3Vjrfiy?=
 =?us-ascii?Q?FTGpWDAUnybb02LQp1Kd4iGAzT/bBNnAHFYxixyX9rKe6EhOXMi7+vkljDtw?=
 =?us-ascii?Q?LUtbc7qtIwcCshWWKqitYjTp9PvlDLx7fmY1hWa9kzLGLPpMNiEFMbbhMQjc?=
 =?us-ascii?Q?uygt9zlZ1zVQnjB+sn9pII7/rDk3076q7brf82BmNlJeJ56o0OkHYLgYpBI/?=
 =?us-ascii?Q?tVA7JRebAB5KhaNpXZIX28ihhBpvfOeoCFwND80zwm+joH8HKqBpkXvqKx5Z?=
 =?us-ascii?Q?cLf/oNRPcVsB9nUHBAhcUStg8KgpvR6zlByqlAFHaA/Hb83ONXRa3VbjwvNJ?=
 =?us-ascii?Q?KbO7KQQ8WXyB/fd1RBH//zrDTGQKeH8cJucfTr+GvO4J81Kn++0jIwqH3Duj?=
 =?us-ascii?Q?f7STZkD/uLeaaQFBDh8BUzmM5ziN6D0Rs3Ao7WVM642Hn9Oik5vR2fRi8ruY?=
 =?us-ascii?Q?fvwsUML9nBDwjhNMuZHW9nrkCWYi8DLMutz3/Xuvt0rpUpJmJj0RJ2HzAnqk?=
 =?us-ascii?Q?R6IQ0tQOXEtlhW8XLtquVkqNE7mlDF0sO2E4/z7uuWv+nPaeEeg4595BMNyp?=
 =?us-ascii?Q?AZZfJnaTeIaRvrlS5NVUzD54OKSDABkNQt/ytghxl6iuEpi5PSO+YkSkBK61?=
 =?us-ascii?Q?qxAKW0h+PVOeFTcTdXbPcUz+t4B1MnSHcCavcy4cE8Gxxe53FLFGy1ILYsZ9?=
 =?us-ascii?Q?jt9Ca9X65C0T6XzEiPgEbJXs7zc+fgUyS0U8GM7Gdmhyz1FlECYVhhVBOs8n?=
 =?us-ascii?Q?gqL/HiI9sfVePK/yJGDo+SXwjoEtTqBKcgIOxoryXPCR8MUvhBqHHTN28tBy?=
 =?us-ascii?Q?e2j39UQm+zn0bk5wsl3lA+6gxkMrmvENkX6554K2OaMLRo10Exgc45c20E9i?=
 =?us-ascii?Q?husXJkmSUBg5lA0nEwiRRxWfp57IU/+x479MB2yB53ySB+qUJUKki2w6pGMJ?=
 =?us-ascii?Q?LF3+QgKlS+xZM6VkYbQcGHaD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d268a4-f200-4534-09e1-08d966dab20d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:32.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HfGIjUYgdiC+01+YK/xepmSI2O+PSVFR9Sp9OxLDaD9T4LyR/M7newSXUtQ/kfgWc03nooeseJp4V1uc7Z3uhBRI/xxRLZ7lRYtYIAi4hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


