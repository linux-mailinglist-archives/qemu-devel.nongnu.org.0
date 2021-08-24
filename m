Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD13F5A3A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:54:58 +0200 (CEST)
Received: from localhost ([::1]:44508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISCl-0003zb-71
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz2-00056c-SR; Tue, 24 Aug 2021 04:40:36 -0400
Received: from mail-eopbgr130131.outbound.protection.outlook.com
 ([40.107.13.131]:22309 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz1-00086z-1V; Tue, 24 Aug 2021 04:40:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUNdRZS3tMBqM4ygZVRXeQxWJ54eBCGk2StViZR/GXXPvEh4elMAbaWSyS05tzMRFk3taSuhM16MeJ42l8hqp02ZX0rMFNCGzGCEthgoFpU1y4olIk4HwZcUvdNllJY0bIPvvxcS3duY9gzDR8hNyneDbsjwdBGKeNP6EJJRrxT7K+99jDQPRuisHyuQ7A96pykLREsoc+JuoxgjoqpH70+KBA+rir4BPUZA2Pqftl+kmlu14eH8yGldfPoI1dt/We0NyDsy9+oSKlPA2zDf5dvRwsxmdjt5qh31ZIAWoCPVlMpGDmponRqg98Z3Fhfst0uRaGxvb57zp7qrwQ2FzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=hXaXXLcib1xbuYlXIaWFe9ZhA9cpriAZA13vdHvRgIZrg9fs4ZSSOqq0Dc45AA72MbJDhk24ONGLpfatDvvCTZCIkIdwtlXy/e8TheLvIhpTu2yxnbZacknulHW63Jg7CpDLnqEGwZpW2dNTKnR8xMeHU9dTJVvi9VDWRhEMX2tjO04JlNXYkC4mwXfk+cvWMI5G7MDxy2FrlHOGmelN/Pn0vLFoQcWqPbfYxXoniXP3r1bNgEFiYvKg2KfVmodqzRJvwIZTbyF6CgciKOEXa8B/RI26ULG4DXKJIutR38ZLZA+Lrsi1kHBPG2yuB1cs8f1UYd++5sq5Fyuo72+C7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=sE+qaDLrRya1S+g3Wm9q6LNlxAnu2Fq9wDFozB/Hvpv5DueoYIQUdaEJLZyIBldQlDEnPyhNADFk/nOBKen924+HjRNFgZYWFSKtkVf6ciyNvDOVDg32gz4NKW2uhubtvX2QtJvbg4R0r3QATd0xT3hmruevxiQ+tGzfT70tEGw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:40:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:40:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 31/34] iotests/image-fleecing: rename tgt_node
Date: Tue, 24 Aug 2021 11:38:53 +0300
Message-Id: <20210824083856.17408-32-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:40:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0f87cb-12c4-4528-b50f-08d966dac31b
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077714867A710B3B6D36634C1C59@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOzj8zU7yPss3YLYtCzxaD4FpdCA082pD4JZl3e6HxhuFF1k7T0wCXU4ewj89lKRMv2dRkbkwaMVaNFLvooaqhlXpMke+tUxbtmS3xse2VEt8O7zUEI3d5Wm69A7G1TPuVIIpopsNpNI4xcHsPcPuWl1LXwQtwxD0kbAqhQPcFO+6Vk3ahil5w5YzZnLTkUyH/8LDnN+lg8G5CjCbj3JG0mncG08Ynpk+WtShzouY6VPZ9Hkgvo6LPMeE29UzbkSQceDAsiKxL5Sh9oOCKAm65YtUl5O2/5RekLNDm0ylTCl7x5mhE//enUxQefACV+XkO4NF/7NS9n5W1lgMzIfyqKrgP+faS7tLo32a/jo16vxeHk5pdUX643XC9R420DLU8CrJOR6MGXa/9axHsCarJ67Pk1FVHANyDgh4ar8A2emZlrL1iKfaYFxPtPjFUO63/e3GB6QQ4kLSYW32IEK1hCAeDbdCKDAIXbEBhNy2I5AUKaAo3U1mCcl1BRy29TUHfPlcATj+xn51A8bbv+SarTttgILC9l8qXvdoPXT1L0/zjPl7rh0DgOhKyha0Q6hixuiW0QjDZ9BZpyVXdlAu++NAb8QLuuYxhPk4gg0tdLUY6agNIdKRuy4W6j5NgCB00rzj/zlluaAZay6o0YsKOvrtcbAi19pZ7A/NoXkED4j3fBWnyA+tqjmE9rql8fKQ2O88ft5GASzVwx+FPXWGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(956004)(66476007)(66946007)(316002)(6506007)(36756003)(2906002)(66556008)(6512007)(186003)(2616005)(1076003)(6486002)(52116002)(6666004)(86362001)(38100700002)(38350700002)(8676002)(4326008)(478600001)(26005)(5660300002)(7416002)(83380400001)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3dabt4TXgZoOlYn1+UL6p43dLfVJMLmespd34aOSlN+8wvkkJ+z4IKW5F7Qr?=
 =?us-ascii?Q?MzDvKoPUAw6Fu8WG9O3jjXmlkvx4gRDfb9F2k4qtZcNlVgj6u/bV00nlerO5?=
 =?us-ascii?Q?OmOaB68uCcggagPzdGWWVu1WOgFVInud53UGBTlboy1Jwlljmq+Iwk8EAkSo?=
 =?us-ascii?Q?LAF2VQlXQFigvqRwkhQ2yUgzTJOmhK6rC4aAe+zQUs6Z2O/2pCHV+bDbFCTm?=
 =?us-ascii?Q?js5p+s5JJ5/ShB4yhBjhYD8jamkImAs6a5h6Q8HXfY3AJ4oljMkskeMq/Zzt?=
 =?us-ascii?Q?Wi8ILJiLZRl3hQ7Qe5dfsLL9WrHntwQT4sV8bW627V92pXFEBN9uFU6xlJTG?=
 =?us-ascii?Q?7HwptMEkatuGos8PIlmOd7G6pWc/f7GTvSk4oY459ekoERj/w/Zs6DPZSO4n?=
 =?us-ascii?Q?cLfPTBml97EP/Uqx5xmNB7ZnyxP/KGw70wbdVOYVjPEJZnw+ij0nYVQFvtSw?=
 =?us-ascii?Q?5QiLe8JL1Q06lunujxpF8UPKAOxWzNA9tSEdKESyuWwDqLLdensqzCYo7IzU?=
 =?us-ascii?Q?O5iQhMsIPUGUnmMT2+OmT3dl8byq8lp9u8yIlAFsSA2MljqFoZK6z8w+6XcI?=
 =?us-ascii?Q?WQ/2Wggqqx6onGyJUJAp53nFHCE3LhVygX82NK7zRuUeuziJ84Q11oBndyd8?=
 =?us-ascii?Q?FoRQSvMv042fCmTnc8X1MUiX6Y8Km3yh1hYiWvvZ3wXR+YZflIsawIkvWO1c?=
 =?us-ascii?Q?NImdYmGNLwcMJxJflvgCOLIz1vSuzv0aFj3ntxhjtqWkgNEj1iAgMyWk/eq5?=
 =?us-ascii?Q?kz7MWelSmZrFvX0+mXqAcan+aazb665Bk4pPK+NbmWXzqNlw1MP0BMQwjH2q?=
 =?us-ascii?Q?T1W664rmAnhkHwjzVc+EJqqSNP5UEdK5UgPUk0Mq8E8/8jKAMdx8NKG2/V71?=
 =?us-ascii?Q?6IV19vQHMmICNAIFXPUcDdMdjjpAOICE/UJgTdGiTrQ3md3WDWBHWF0VTDWX?=
 =?us-ascii?Q?erq8+cuVm4LaO+HVkVNoa/fChKahqdw5m2VX/CnSNtnUM5BEt4sCPZD8KulI?=
 =?us-ascii?Q?DSAZzHndKia31oCwH6pkFseCkvukrRbU0+SJnIFfbtXaLGGa3NGSc3fmwOt7?=
 =?us-ascii?Q?6B+V2XfxKeSZHAPwwhsLSp6K5mMYGpzo39m1HoCEBbJyW+YyNQ0FOa27CTsX?=
 =?us-ascii?Q?WpTlHuKwX6JX3cloppFRMdtE2U3kUi4KVrjEKjyvmZZnPXeUrToHAdLmQWBE?=
 =?us-ascii?Q?2fqDh58FeBJMD72JzLTb3GyLoZqFe3MZH69ubBRpcLwqlnZ4HbfYtu+fNtyU?=
 =?us-ascii?Q?BqOloYp9LLmRlbMcwWSNhkXdkSrL5JQBX9YasXWS1fgr4aJP6BRkX5Sv3/5b?=
 =?us-ascii?Q?4YppRZz8e0KmAGLRu+93v5xt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0f87cb-12c4-4528-b50f-08d966dac31b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:40:01.3694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07s5XGk7nAtlEFhShq3Niwghtx2LDqnCRn6kBTvNykC4ahFjDk9JuOx9+7L7aFaMeLr7TavOHsJJYIpdDrzcXz7hHOZV4eVK5vJr+LJPcyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


