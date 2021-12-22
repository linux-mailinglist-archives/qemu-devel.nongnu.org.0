Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0C47D4E1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:09:46 +0100 (CET)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04BV-0004NH-V4
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045L-00052U-IO; Wed, 22 Dec 2021 11:03:23 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:2823 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045K-00043n-2O; Wed, 22 Dec 2021 11:03:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hb0OT1JPfDY0dkVsk2L0NsmRvKErfNyrpNQNieQSVQVKbz/vM/CpgWuvSTQvsMSEMFZD4jlSP2bflG8N/PnXp71fsZ+d9xFwbUK6DkMS2OfHylf9ANHMfJGPzi27TtHXMfIiOMVhPsLiF/EXELAcf433n6Ek2WnEQgXxuSccf8Dz033vOThsXoY0ps6OWwnORZ+ZKCu/38XE0QEDrRE1Yv5rf3CXk9BeORQ3FLUNJw3SNUJ7XWQr/pDgyosPbKiHGejyPwyNp0zHz7MjeZV69WhH4OjN++lGNNy9mqhJPq4BX/vfi4u4VihChXfP0MVHEAzy8aPAyXr7NsAFaJAV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLB5Dv/1GYn5I+CAd03lR75J1viOHLrpmujXJiyH7dc=;
 b=c83OXU9NFNAlrMUZhB32F2PlsWtDfw4xY3Gmfc1dUD+bgC6P5i/8d9ZYu8CBkYFKRYNTVj7XQbzM+5OgErxbvfQp/jLYh6xOVxblLxmS8iPZ9pbOpz7AgzNsXs6PcOqyoEyD4ueZ6ksoT4n8h3ZnWXAlRHocCA3S2AxpXeYLhXbYqIlk6wOK4g9sWYC+G51vZayeRE+mGsTr+SLehBQIkS8Bb3E4iQ8Hw6qgtkyXyxkMkfpK6RXFM+N9y5W887DwH8DDrz4Iktw0cILWCPs7MNuOMeVqb3mFDts6xqE3WGLGmfQUziztbVjhuNJ8n/52hwqqEijK+85eDt76aZS71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLB5Dv/1GYn5I+CAd03lR75J1viOHLrpmujXJiyH7dc=;
 b=rd008eKW2LIxE2NXvTMmdrEFcnVcdwomGZ1eONXqgU+z3Nnq2xt/E/Lisz6gMb9TwQ6DLpUO3juhycQunmKD0Ns2Aw2U5q/XxiQ7LYuuvLetyHDuOdrR20TjOvlUHKNYlx/so+BCgXJMweBWjt2r3HfQ3TVaoakSxGCMVkTLwOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 16:03:11 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Wed, 22 Dec 2021
 16:03:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 2/4] block/export: add blk_by_export_id()
Date: Wed, 22 Dec 2021 17:02:52 +0100
Message-Id: <20211222160254.226909-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222160254.226909-1-vsementsov@virtuozzo.com>
References: <20211222160254.226909-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142afff9-f946-44c3-23ec-08d9c5648d71
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB614839A32027D1E2226DFC47C17D9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/4Pu/L7b1RAJ+JGRAYmcrHJf9EYjRP3uV4wPLHFnpL4DzjpwJTnFrm2CbfguN91a85VT2072sultOtnSOy8LWzjNh4ZYl47+sH07etnJow1RIFTQuPhS5sWlm5ctQClhcsf1FAXRk2mZKsSwD4UPTD6uXQlT/QOlQRTs7G5QlGvZkZlSpCVNdHNe59ymEpvEzjIyNa6cnK46evzxZjUXfS79HAKcV1kbpyAR0bKJoM8u47/YRgi7yXNMIL67KpSM3Ko3iL2PM4mNdBd/N4V/rpiEL/BUJORtRlk+yaJKxk4ywdweNYYtgmi0kGLX16hQ18f8sjbuv4Splwr4bH9lYqGTY8Z8IKpd7/+/aRo1o7Qpp+vYrMihBI1IwnYZmVGApauCiNoOwdNf7wmSqauBC16K15nEC7UFst8OLFwBXocNnPi+e+AobmyOn3R1KZ4feSz7osDwhk48le8mPCJsVZqRxIXUc3yeYKNBXhA1PuNZFdh7cODrnGz4hrXtJI53wmhQSKTxbmX3m294U45FBTXKhc/ZAed4Q/9KnMcv3ojzo5hoFgS9HcM2+0Pr0gW/F1HDlhiCyUn4uvaILda8pcfN5u1z2MV34ZMaS7Vw6i5YXItgBGb6gCSC9pVhVTWDABRa09lHTKeCvAP6+k34EUhmxO/xb9a1FtMMYlrYhdOIBUcCz3ysbvk31aIC2G3d+mLCRGMQgXNcolXyqm0UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(6506007)(316002)(2906002)(6916009)(2616005)(1076003)(5660300002)(83380400001)(6666004)(86362001)(8936002)(6512007)(66476007)(36756003)(6486002)(186003)(26005)(4326008)(8676002)(66556008)(508600001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVogmBEFn1y4zX1ILojKTmk4iQ17DeDXQ4J0dhbkia9Zr3NP7O5ptYFbEzQX?=
 =?us-ascii?Q?PVPcX4YIiuvWrkuHT3mZfr03jYm82+0YzyMvj8AQRvU9qdzj7qVA+crOK85Z?=
 =?us-ascii?Q?97LbEwQfOqd/5yKkEKAUaDCDfzxcPiszRnlEY6K16QpjRKjWJwIBvqEEYIEt?=
 =?us-ascii?Q?uLYQ7KGPMUt34coMTK1/qAV2a0RAz7+25DXkF1SRaGh3INgzxVNlcJhVl3Rs?=
 =?us-ascii?Q?H9s5Bq/8f2fyFPcaC7xmyJjWkhw9oE3q6PvetKx1pEuZXYLgFb2IqFMpOuaX?=
 =?us-ascii?Q?LoVNEzVFwPgTVgtecSdIAxFuv28svJTjwkQcSNJb9H7zjuGGSaqtyd+esFoq?=
 =?us-ascii?Q?FSeszb4JCWTtrtpOUKi/JcBKq/6UzAxXmmQfcj+u937DoOFu05h8svLc9rFz?=
 =?us-ascii?Q?+5tzUUDMd8XtyXNkOzWbQS1c8PVx1ZgKGfs/YXUhz7ZBQ9dOEe5M2PuufsLG?=
 =?us-ascii?Q?uE7pDvhpJmXZdHxfkGI5xi4Fgkr9HZyQB/voTgHA83lclV8Su6hX3BFw6jjy?=
 =?us-ascii?Q?bOURi2wUJQqqb/i3Qqr5tm3n4s/5pHjfg1GyGwvmwDEb+x0ClDwM2DRqcE19?=
 =?us-ascii?Q?dEXyiPxF6jKjDkwJ+HycHh0/PC8Fd9YXNpzY0qH6SWFBIRaxCPMeyS+pwjex?=
 =?us-ascii?Q?ZrIRlGCCFcBpLE+3GRtV5Tc0ogxTl6FPx+3AQzA0UYKwTIa54kY+PRrB/pK/?=
 =?us-ascii?Q?RmRNi3UNweWIPvrbzC65nAkkbaFBfv92YXXc6KDV0QcjQQWvXbTNhd40IPeo?=
 =?us-ascii?Q?OQ1ONKZvzXRDEc78UjXoME+sujf/xcS4a3LxPt11TKkV4eUNjlp9fAMlxV4I?=
 =?us-ascii?Q?ulrKUbdWye+c9UDE64as2hGQx0JLu8+1zcLiPEnbwlfrvVKFitD+rPNUlKdT?=
 =?us-ascii?Q?y89z9wsZJNKLUiKQFlvSxi6sbGnCaxa4GXgyHNehm0oU4SbnivqErU/SO0D4?=
 =?us-ascii?Q?k1zpQe2JCu9WXNjEek8DUEHR8jsJkG+WKBaw/lG+nSDK3kuX347FN81nOkmZ?=
 =?us-ascii?Q?lHseAd/+lKmo7AlAutRUIHjoaFWnEBrEtf8fIb5n8wGwk07MEwlJvAWDJvw0?=
 =?us-ascii?Q?bT7Hl0qzKicZtTJkEzNKwlNVNnzeFpktcxA+0P2w7CImFHvzjBho98sJeo7l?=
 =?us-ascii?Q?uOdy4vGNBeWVsuTP/+3z/DI835Uh09Mqr61m/MM5xI4EQXvUBsrUEfOgh0Uy?=
 =?us-ascii?Q?7FcovsqoJ2sibR1QMWS8Iac6EykhwzGlPH3beFugLYK5KDafjug23kAOJywt?=
 =?us-ascii?Q?ekEEuDOqlVwsGh3UmUxfSDkouTXGnhWRzdA0xM/whN3v95R/faHq1dp540tr?=
 =?us-ascii?Q?7EnA17EXvv9z7bS/6S4KX31E/TqBrISDqmZKJCLkFm51V9D2YHpZ5PgzF1OY?=
 =?us-ascii?Q?lrUjyqSCB6xV0ZuEJkZWiLYcYWXpvgkNvrJK1RLAX9gfRKcYeXDgZajzImBa?=
 =?us-ascii?Q?BuLU2/sJEH6bJ6LlIUp8UnlN8ClCBIeLjlmorIHsUspflzUCzKQGpiyGISCj?=
 =?us-ascii?Q?0tEipVkiKusJZfbwdTGlVOqyLb8F++BDtqG4EcoRLLWNzOhkBSFohS5hOnI6?=
 =?us-ascii?Q?k7NomLpJHH0n0KlZTyMdfIK+5c2fLTM6WSwqTcO6ENMLDnTDQ/EbngSVF20o?=
 =?us-ascii?Q?sMglibDkhTSpSbPjlHzFKaJpgoWYwgxaVwikZGM4XWSFn4exVVGL4CIB8Ylx?=
 =?us-ascii?Q?6pCV2w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142afff9-f946-44c3-23ec-08d9c5648d71
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 16:03:11.4413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QThOqUYNlLpmpxMSLDVkAooQcsHfHXpOup0UQxyRnr8Vx6fAOiXtNZxu/nQPXiZRwB42qLoiXC/F+4KYVFQ/o+F8/tr3IlYfiKDukDbWkQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h |  1 +
 block/export/export.c          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 904d70f49c..250c7465a5 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -124,6 +124,7 @@ DeviceState *blk_get_attached_dev(BlockBackend *blk);
 char *blk_get_attached_dev_id(BlockBackend *blk);
 BlockBackend *blk_by_dev(void *dev);
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+BlockBackend *blk_by_export_id(const char *id, Error **errp);
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..613b5bc1d5 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -362,3 +362,21 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
 
     return head;
 }
+
+BlockBackend *blk_by_export_id(const char *id, Error **errp)
+{
+    BlockExport *exp;
+
+    exp = blk_exp_find(id);
+    if (exp == NULL) {
+        error_setg(errp, "Export '%s' not found", id);
+        return NULL;
+    }
+
+    if (!exp->blk) {
+        error_setg(errp, "Export '%s' is empty", id);
+        return NULL;
+    }
+
+    return exp->blk;
+}
-- 
2.31.1


