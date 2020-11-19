Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3D2B9382
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:19:02 +0100 (CET)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjq1-0007c5-R5
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjo8-0006In-L6; Thu, 19 Nov 2020 08:17:04 -0500
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:25503 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjo6-00062k-RU; Thu, 19 Nov 2020 08:17:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIQ4VkRP92YVuVgs7Jyb4j+50ABwE48jCIc51NC+VX6dswC4x00TkuPcMpK3AuaENqYGTq+k26qRN+y8bNVkRj4txDJ3g/i34JErxSPiZXDh9bQlE+iQcuswnpyaejc32waPSuSjIGtxM/o9ITCKXuIiS037uL8jUoyGi/bL07dzPX+vT6thtpvShQHA5SH3Cx0o2Fg8PmScvSQdSMEZo7UezqqDx98fPOLWNplLAvi/USRnW0d32Pj9/5+hFYh9svYrb7w+ZzJs1oO12KaQIwBth16rI9hxYw6yKmcnQVAIrpv02TqKiTqAe9A4LaBqjdO7e1CmEyFpAtYRHaq7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm9hN2aY3MJGb6J22+twsKPzZuq0up0R6e58gGLCyvs=;
 b=Zfd38s9YZr9nvLTMw7wt7f3NKFkLZ+FKWcf2et6Vk6Y+E9+SQ+3EUu5/i0RSrtZ/yyZYDgthMZ+772OfXCHaLOEQBllveMp3vxqIB40ioylh59GnIhPT9xW7BRQQn+naXDqVV00EonIGtUwUsrwsjxqOCKPMcicFOr1fvGDywwnn+rMlUuuTSZYKUJ6+8IL6q7vo8JStbChLYZ3atWnKzEXf5Os3efLel9Zczv9syiTyTfRULG/+cUuyivmCfslGauhv1kgntOMKlfjWZQVLYN7e/b5f/Cdru9B+RSGHhNcDH+2Dxzq6leR4D7Di+PzEXIdrLC48GgdZtEg/gHOPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm9hN2aY3MJGb6J22+twsKPzZuq0up0R6e58gGLCyvs=;
 b=GtdwRMVUXW/uFdv8D/korzvUHcQgpCFAcFXm+izWNSVr7+pZFR8L8ijOoUFe7LWNedue2j9uMAuX3UYkE+iaGMv+atmjjUPRBoZsR14tY+2+9LUCNY1iz6K8m098oT/xEs/n+g9IQnIG8DPWyCt+MFloto5RZmcDT3VDJ9Ak464=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH 1/4] block: bdrv_get_xdbg_block_graph() drop unused errp
 argument
Date: Thu, 19 Nov 2020 16:16:31 +0300
Message-Id: <20201119131634.14009-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201119131634.14009-1-vsementsov@virtuozzo.com>
References: <20201119131634.14009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.89) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 13:16:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0c3014-1f71-4a29-1ab0-08d88c8d5fcd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18448E3C7D4E924ED2C181CFC1E00@AM5PR0801MB1844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAv73NlUZ1C7eat0VDzhU+k2V5kv2hQ4ohq6eP4X4lFfk7YeerdW8zsGIauVYY9Ns9f022f2FB235zEeqy3MeMLD5azK/fQqzGtj61fugKuk1QlcQ5q/HxaivKPap27UCneT0wzmqDdCzQrVzelmgQtislCK+2y9vW1opaTRv7h7NCQmqBmM/jwgeQOUNzVKAmF6iNGcE/mRgOGvCsT6Q74PjLp4ROQzpv6L2kolTTB1N4x50cp73WazXuiYayxFSz0V05BCddu5Ne9LuWf1R3t1O3VYsWicjk61Y1wnrqnbRf3gvxLZB0XKkwzXaN7MNWlALdiHCQ4up8QVYR+OMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(6486002)(36756003)(186003)(16526019)(316002)(2616005)(26005)(4326008)(107886003)(478600001)(6512007)(83380400001)(6916009)(8676002)(6506007)(52116002)(6666004)(2906002)(8936002)(956004)(66946007)(1076003)(66476007)(86362001)(66556008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ne/X1cle0D4IAY1Mb6WkJFvH99tQGuJhQw+Z+N2O3e5JwgqVNF1eVVISuqhwqyGpSDzDsRfNlg7/zEBVCnwOBHf5f8nolAUdv0jQ6Vg4qjdeVFF9V+cVKYJazCv9JSBofM8zAgGgwJ6TPRA5dGehcemS2Ze24sbekELEchJVAjk48UahSc21jDkAh5vmG74xnpbvg2aPyk06oSy9tEU77yfIGjv0xGOQqwI/ov4Sw4Uf4ie3QJHxZouM4SjPyxlwbULtc35C5WfM39+8tc+YiWFlW8DL1UrsqgMXtdL9xcOPH73NKZx3rjsQpXIPi9PQ25d7cOwgi39dKGcDmcOrLcMcKP1qf4aGYeNwEj3/wbnN3neceAZn+zGkqgGUT816XTZvKnXYWW7VX0u35p0u8TfzWIrR0kK426BnDISKOUf9O+HL6kkLk/rJnlMUNGeUusKfJAg6Ajk8RpE4vxXio9ktiB5/5ck9q76J6Dc/J2VmM5r79q5WacPu2kwFI3Qwlh5tvg7mj/Ww3/ChBkdDK/Z5HRexrzbQv/3f5TJRBp0WSjRL0yPFfv7QmP/dFeMrU1aop2BjDRbuJ9R/Tq9FLEhRY434hCpZW476+wXD3EeVE8XckrbBo1dJllY7dkmDGhXuodspqIfwbI7rX8WyeA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0c3014-1f71-4a29-1ab0-08d88c8d5fcd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 13:16:50.0351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rc7fsgOguIanQTgTpH/GcZktVLXqy1Q69MKM/aCpGnxj6d0015xE37InUO3WG/OVbO7V2LlhlHbn8HjaTz2PfAjpTiMMEngsoulhNuSuum0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:17:00
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 2 +-
 block.c               | 2 +-
 blockdev.c            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..d17151abd7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -524,7 +524,7 @@ void bdrv_eject(BlockDriverState *bs, bool eject_flag);
 const char *bdrv_get_format_name(BlockDriverState *bs);
 BlockDriverState *bdrv_find_node(const char *node_name);
 BlockDeviceInfoList *bdrv_named_nodes_list(bool flat, Error **errp);
-XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp);
+XDbgBlockGraph *bdrv_get_xdbg_block_graph(void);
 BlockDriverState *bdrv_lookup_bs(const char *device,
                                  const char *node_name,
                                  Error **errp);
diff --git a/block.c b/block.c
index f1cedac362..eca16a5e29 100644
--- a/block.c
+++ b/block.c
@@ -5338,7 +5338,7 @@ static void xdbg_graph_add_edge(XDbgBlockGraphConstructor *gr, void *parent,
 }
 
 
-XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
+XDbgBlockGraph *bdrv_get_xdbg_block_graph(void)
 {
     BlockBackend *blk;
     BlockJob *job;
diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..6f103e5ce7 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2911,7 +2911,7 @@ BlockDeviceInfoList *qmp_query_named_block_nodes(bool has_flat,
 
 XDbgBlockGraph *qmp_x_debug_query_block_graph(Error **errp)
 {
-    return bdrv_get_xdbg_block_graph(errp);
+    return bdrv_get_xdbg_block_graph();
 }
 
 void qmp_blockdev_backup(BlockdevBackup *backup, Error **errp)
-- 
2.21.3


