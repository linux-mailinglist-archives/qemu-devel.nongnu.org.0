Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5033A2AE4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:56:38 +0200 (CEST)
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJIb-0003u8-UX
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqv-0004qF-8S; Thu, 10 Jun 2021 07:28:01 -0400
Received: from mail-eopbgr40102.outbound.protection.outlook.com
 ([40.107.4.102]:59870 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqt-0004oO-CC; Thu, 10 Jun 2021 07:28:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxnl+94AOI/R0Cw8EI96kOpYlXM3FuUw4NCtg/qPmwZAMmTQ3/WlI/kxuDfn0QgnY/hgXC2nIG6uyAD3kknOcIxXBa6Y2qslqjQ0Mmx5whPx/uoiV0x42gzTR9XExBBoouVyHXTkzJfSNgSgvCNQbuYGs2PCY7V4AGHcS1tg3AwlnQ1IFWxGsYo5enmOwaR+N+LhTQHWzN6Z0fT46H6JsWZW3hCszwm+tdwGiqPVDPiRDctdkD0sXSqzC6GJm5YRAOKME6COZhLWRS43ck1YSjLyywM3rSFO6epgFvwCLWBslGQ14+E/k6bSxIvU7BaQLbgzzyRVWGaypFC944aKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=oFKjZF8ZOP+5NALKKj3WqoZKfjzOaPNERa5QGtKykQ8wNTwlbYWQSaLrztvr5GXygs1Ly48OcEirv7Ap+iTODwO8u4KNOMp/9XzsoYuuz6MTgg49xM72P/Wwai5htC4xKqd3xhUhMQb/svhAAWBjBjOWcCEdl92BywSQkGwUp/IiW9qKrpZCOJqRcyFUdhQ17KZ6P6H0Iye7K0Ep+mb8c0/m2GdJUNd4aFRrvTOXvIBiaANeQ8jOxHsMMCO/FyhV3umdcMelaeHBJuGokCb95Z1LGxHLgqoarOXvQcb9k2F0RBeJD4rzQP/ZJPIpvK077NPDYrLExcXxgm7HQmHRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=Oh9dxb3wWFL+jbaxuq7BmYya6FnwQBrTk53j44IgDqNeZNqJjVoMV6qIggNEkuOx3ikbToeduoV6mHfJkQdFN/BkdTzbbbil6gRCPEyRprG6ZJHuNnIZAyNDVQfe0j0/j3oCnBi5Oh803LS6uTqaMHO2PWUMZ5bwVYJyOrCQMec=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 33/35] iotests/image-fleecing: rename tgt_node
Date: Thu, 10 Jun 2021 14:26:16 +0300
Message-Id: <20210610112618.127378-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a615935e-345b-4384-0a54-08d92c02aefa
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338171B1630535201A146536C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9koqWV7NJpgD54M9cQjvK6dGAbwXhkERmpIH/iwET0xZg8iovtlXCI0C7MGMkZHMwYRnurEkXtum7C7tMbuCjj2pzetCTnVuLKYPW4GLSZwvb1/tJ1SLqC8yK2PCKXl8dhXOZHLoptgwI62wPg8F7BqEjL4W3DGzxZnHBsWgEQ80QSpYyIEoM6vd2gqAxGvMb+tpEHPjKWb1OPNYeDOskogjz3y/VrKR5FMMHrOYbwIbL1n3tVt1O2bmbGy22Nyryvyj8CP8m2IeqZT9WQtZ786gZjBqf6ndfQji1cNxD69ygApw6LdCtNB0qvSvG+VbfiJwSX8vIncimplccPYeoBeO72M+bhRg8a8i1jcrjJu3G1Q3quY5Ii8wmVJDO2QApGZiLimjJwSG59xqKvXDhJD2Sif0RE6o3TgFyE0e0pXr4Yr4COFHnSblCus6oXIdbKhmed7EXnYikQU1ctKwkNjCXiQQlhz2wQZ/4OAzGBdhtZKYTtSPvJkONtTEq8WGf5+sJMrecvSui1VbPKAF6NBwBEZgC5N9FbE+frO20apUh+GLVEm6Ur71M62nQlg25Kc8sSkPg80qKTiVmPssKUy4vxBIS2xJrODO2vrLBClcvmaoKz1DFep/Eqn/KyxtFCcNDQoW6Frq/HH606d5wQejAyLRqFuTfwqoZ+D8EHIkYvnvZX0t6b9bk7O9hgLV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z9QNdCKJlHbP5sZFtJYIeH5Ios54ibO8l48FFlYqFtUTtcPqDCEvncYm0kln?=
 =?us-ascii?Q?jkSnNYL9lXRxlP0HlNjRiZr2qEaW701O9IIuA9O51/+Tteu3nvJwakCcf72i?=
 =?us-ascii?Q?DsDIm7RX/wHEFdPzRNTMtR/hKP4PKuPPcNrrKO8/5XhG7AumyWfghmR/W7p3?=
 =?us-ascii?Q?By/AorrIOP1hL7P8ln7tysqKYNm1n7ODEgFUyw0zDXarm6JHDVLbcuA2d+3g?=
 =?us-ascii?Q?NWamFFoTaqzTqOHE26OlUMFKWBO/C5iXl7sS7eAtdCnpwpNbYK2+e117AoXd?=
 =?us-ascii?Q?3Q6/+B8Z/kUyg+ujjxfHveiKXdLY2vrKeI1vwlHYWzKgkpDOKrrlbAwm753+?=
 =?us-ascii?Q?KIj+t8ecKTmM9OAgX+ObO2GKdCRs6hj2LBo4Q7fv060U4dMfoN7AZJ7mQpHq?=
 =?us-ascii?Q?37OnQnaakUmhlzLpc635I6XjcuSPIxkhm8WLNTd9d9DBmZE15RhljVrGlq58?=
 =?us-ascii?Q?4BgrYvXUucwB9xIrNxZFiPFxoai3Wj7MyscxmfXo9y3TGGJd3n6097GkN3Yb?=
 =?us-ascii?Q?REFI/xKko11CNgb24FvQMQ/BdpqD4rTjmCzsIsQ67+HhSPYa2ZRCMdiG/l9E?=
 =?us-ascii?Q?x67QAE3TehVKHjjVGXOIXlYusbw2TnM8JrOg844Zf4y8PnLa4kwrOSHVLL/C?=
 =?us-ascii?Q?N8jbB5KpB4lPMsPittukfuWHBa5zIjoWFKpL0U2DC9UR4bi91QjYKTkcZHGA?=
 =?us-ascii?Q?ZAMtxE7NxL6X3FhpcVpc4SpqAT/YlsvcqaCf5un/r9QDdND5UtlpfjwHHph+?=
 =?us-ascii?Q?mnff0ScyaSasMSt/ijgEoy4El28n0EvQ770heV440NPCWXvZa5/Y9O4Lb9MP?=
 =?us-ascii?Q?m+2d0RnBX2KKC5q++/s2laY1i6jw9UhBKy6jaHxvpleKubEkX5tz9XwsYGPF?=
 =?us-ascii?Q?bTU1Q1v8X6pZQYlVXw/kUz7Ohuc5XTMEwnAde4ulKPSpuoZrOM2y3vYVbIOM?=
 =?us-ascii?Q?4FcqumoQ9TWLDLWK/QMx1iLffM1U4hV6ntU/RVjB+ngmQm/ZHLX6LZeK8MUY?=
 =?us-ascii?Q?LCG2oOiVCVEuPo3qaNLfVhMX96I+DZ8MNBw6bxXLtwUqKQORehwcQTEjoN/V?=
 =?us-ascii?Q?pFUJ3hU7OOJBHXEpAKeuhRW7518aU21jIroaRylpR0YRPCwLWbLn7xdE8Syz?=
 =?us-ascii?Q?MV1pTzSyLuEsns2FYNXuRohPtEj9VqRJ3w08T1zMPZSMfsFAHi4IRvXNYqJF?=
 =?us-ascii?Q?Hv1PrwS1I9un8/5Jc176oQf0RF9BLT6ntw5aVUEY0Xd5alTijnFVQqaRv0Rj?=
 =?us-ascii?Q?4wt5buy+fHs+npGrfP/6qt3ZIiN2jCN9bK3I3A+MU6Iflmn/+2AieMjH0vhW?=
 =?us-ascii?Q?bOZUwYokdpbIfSttrGgRd3JV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a615935e-345b-4384-0a54-08d92c02aefa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:08.8855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smHpCk85ziKoONXI0oFy+sZ/5+RvmrJivxzPh/AATAMFV441BK1VUsGFYSVYOf0QWKWAk1qcPU2C6NpUv3313ArblEomuIr2ScWDhgJnAj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Actually target of backup(sync=None) is not a final backup target:
image fleecing is intended to be used with external tool, which will
copy data from fleecing node to some real backup target.

Also, we are going to add a test case for "push backup with fleecing",
where instead of exporting fleecing node by NBD, we'll start a backup
job from fleecing node to real backup target.

To avoid confusion, let's rename temporary fleecing node now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 961941bb27..ec4ef5f3f6 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -71,6 +71,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     src_node = 'source'
+    tmp_node = 'temp'
     vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
                     f'file.filename={base_img_path},node-name={src_node}')
     vm.add_device('virtio-scsi')
@@ -82,12 +83,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    tgt_node = 'fleeceNode'
 
-    # create tgt_node backed by src_node
+    # create tmp_node backed by src_node
     log(vm.qmp('blockdev-add', {
         'driver': 'qcow2',
-        'node-name': tgt_node,
+        'node-name': tmp_node,
         'file': {
             'driver': 'file',
             'filename': fleece_img_path,
@@ -99,19 +99,19 @@ with iotests.FilePath('base.img') as base_img_path, \
     log(vm.qmp('blockdev-backup',
                job_id='fleecing',
                device=src_node,
-               target=tgt_node,
+               target=tmp_node,
                sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
+    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
                {'addr': { 'type': 'unix',
                           'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp('nbd-server-add', device=tgt_node))
+    log(vm.qmp('nbd-server-add', device=tmp_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -149,7 +149,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
     log(vm.qmp('nbd-server-stop'))
-    log(vm.qmp('blockdev-del', node_name=tgt_node))
+    log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
     log('')
-- 
2.29.2


