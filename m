Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E523DFE7A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:57:08 +0200 (CEST)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDe7-0004sf-Pn
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNY-0006q9-EF; Wed, 04 Aug 2021 05:40:01 -0400
Received: from mail-eopbgr30127.outbound.protection.outlook.com
 ([40.107.3.127]:26086 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNW-0006y7-FD; Wed, 04 Aug 2021 05:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2Ac+QgHt+WjVjrIkexN8GgwP7jX9s0QJ87SN07p+x7xMBK8ZHH1d511MFpcktujanwFfUQSyfyH5zIX/dabGyA/mTFPfs03K3bj3WcURdO7V+TXGZxZ9k8A8LfuQf/JMVRLMYHkhu1q58T0XTGExM0cga8CtLLrF3fJPs4a4hpdYlaoBzxFIs5tklhND54FbJK+rfVG7wzEYq9opYYHjEG+e43Bu0NFADvlAQyUYoasgMyYQee4O6i4ehaXG1sXb1c78DpoRCu5MBcwM48M5X+iA2ojXs3kEwQxIVC0y9zGvo8P89FV0zJ+x8PPV808HKEuGLDAAHQ6stqKSzmWCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=WM8lL8GzzUBn7k6y5eJjSmO8BpFJwpyhoDGWkwr8cujV/jSkHrF1esTrm4nMAgZLJan6gXUbvMBISY6umxhp2sky9CTlCI3kWB5QueH39bNJRzfm3XT4EE/b7LMFq7sGWn70sZMiN5rD5Ru2YR75y75DYeHLqbSBBpq/ywpstwnSPlFbkZZER7xvm/3GzkOejUkdD1sRdjlWEgwmBBOs5MaeyIZKa1ION2oh4QKRoCMGjIC5fe971jXULN95+3AvtZVplis7xpdkRlIcspkHRflk73zmmthdaMwgJrU5n3QD+zp378cOuDh7/HMAkWOjD6a1YTZcQ3fV2IgjxlBTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=fj9NEmhTOywJSbPFj/Pew6RGrJ4P4+rqnlotnpoMabfI5SJfyEm6agg69L5ACViFb6YxG3mL+Nz6G11RJnshsEjCyJ39OgIjGQWqGq5cTTEJQ7mGFVpB16nLJ3PbLO0TolhSDs+wV1XOXvJdtFtZco6va1j9VUSWutb6FCYEcUA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 31/33] iotests/image-fleecing: rename tgt_node
Date: Wed,  4 Aug 2021 12:38:11 +0300
Message-Id: <20210804093813.20688-32-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 688e1556-0fc0-4b4f-76ee-08d9572bbd41
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533652BE33E6BC4B3D9CE682C1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gov5WXJ8A6RjpZTTkakfMWDpFUF/UaskBbL2oRwRNNUOwmn8jTW4bcBEA6sdPYXUrFqQ7ay+WXdIhXDY2flpYgoaXavHHGPkNdbaWKByEIy5tfRlyoqooFnAv+mr+p820TOKOpDFRCkn0zsoQFj7Ym9jhNFSxXbtrYSV0sTpXhc/C7J2+US7CMHAzleTlMi3OdzkAEcfNo4LNUV8VkqLn81/oh5cmzAexXXfNNX9Gui8EvICCaTIaj8aaAvLVcj5C96BtRz62Sst3E027CCC6KoatNOT81/ByxFgbR7JRsi4sfTREyhsMmAN1WFzkxxQI6yl75Iuy0ffiiYTatyFFf2+hB/mTi+q2VWlPBNLvqxitSkwuHLYv+pBMuIIh9S0YNxBDhzlGB/Lva60gqOwpRYNvfm3LJDWBWLAi4MlxEWg1W05sD5taCuCoAOkWTbM3avOcwIiEc2F12YvDL/IOSyNNZLc7cayDA7YeaaRi1/oC48Rbt1B7vAvsiOmXhZ2z+BnwWSUtzwkYHoVyRL5eZfqYgIN3LdDC95GqK75QnQG6Uq5zK8dQo4M0ZGmTCdaZ87ugZUd7/MK5sM8nCWHWK6XXQMfVuOa+KDHVOqzP1By6oGSlW2oToifQrvcFbx63KhdGC2kF0vd4EAL7HFEFeny0d2r3knHgY5SlbO2AZIAZOKapCS/QMgDQh4PdaZ5wx4fWKCsXb5jD6gQbYL85A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxMUmvUhFo6GCnPMNTodpEKL6B0SyndWgaiJvOk0yfT0knVa/TyMKUuExUNz?=
 =?us-ascii?Q?TiFLa06NUf7mgTY7ARIbz+Hp/8PGCxfH9c54Ch8H4Bu6Q13uKSLx+c7/rxMt?=
 =?us-ascii?Q?Z/L7O+DNc+9IPRTDtQ7c1Q5zBEecaBGeH0blugZ61FWoRepdC1xXGwOX0XFO?=
 =?us-ascii?Q?5v/nJyA304Q6hgpkGdGkqvoOJwTYDcMRz2QOZJj1ltN3HgQ2m0nAygmJlRkv?=
 =?us-ascii?Q?jEKo/neQ+JAU87kFlra0pMKeKNoLm3bn3i5d7jPD36Rxpora5CDMGcW1UMML?=
 =?us-ascii?Q?76TT5wT0cTJvusAQ3GJX2FEoFvXjbSR023Iq9H1RoU9rk5ITwKbzPM2qLhFJ?=
 =?us-ascii?Q?OtDyytINXWJOFsU5pC108y5Bi/szkG/dy0SFZ9+klWOp77xh4GmaPUmB8r1J?=
 =?us-ascii?Q?o2XDtr51sMkkzA3yZGueXtyFeu6H0c4U9RspuEycqN/vEd0c8X448VCLNN0D?=
 =?us-ascii?Q?sGbw1cQB0hbgEjgcYnLHkn9E7sGBAOu9h4KVC44+I9uOfhTkHBb8QrDQCcS9?=
 =?us-ascii?Q?LJzIWBbJGWBsjnedkE8wVs786z5w1NW94OqLT9Sq+nHSLxDQXBCMJghyss77?=
 =?us-ascii?Q?/J07TF4eS9nBt71FTnoakPZLmbbEkWbTGr2wm67SphItJGvg+JZlzD04PqLB?=
 =?us-ascii?Q?/RKxNekyDuIjBnmVp+1edtzqI/MG9I3xZ4UBPP5iK/r6/5g69cInyuf49YNt?=
 =?us-ascii?Q?KopNxxf1L2YErC5FIyvP/a5oMARQBpnfsHJFlRT52N45+3fj1TP+W+qOp7yJ?=
 =?us-ascii?Q?pvIkehRgYcEnHuMD477cyADeEQ7Uxu9WOgzNlpfzihbV805hMFLDfEX4sJR1?=
 =?us-ascii?Q?Q6CemQJuQNo020dCoZ1sKsntLduImfj4fIvyRci4eHhVdhv94yemaBUOOVfe?=
 =?us-ascii?Q?JLTQjqivGNrWbhlKKDVCrwgLqOYIvOsRxDPSX3wUNDL8eDhE4YFvpqqueEr8?=
 =?us-ascii?Q?DxrjsSIvlPDCBF5tr7zBAnqqvGmyEpKF6yD8uYNVAFeZLjwjXWgPxDEae0Ps?=
 =?us-ascii?Q?Ks1Og0BRYp9gFCdiv1y0+fPEtk9jOmE4jzEnOBQt9hfq5WjEtf7ao/Y58Xjq?=
 =?us-ascii?Q?xMqChnnOXftQcJ8XYppg7AoAWyvGfnpNPdDfqs6b9ACz8nGlTR6KxcOhDqHw?=
 =?us-ascii?Q?oMMmn4lVAAxkYsr59eDN/YHhAbw80FydhUdIlMml3aKWltLWl9jPirBWvEYO?=
 =?us-ascii?Q?s9Jso5x+7npZ9eO1SJsxCXNpYvBAUxV5JkElXIUSoDFZxRmigDT4t0Zn5+j/?=
 =?us-ascii?Q?XyQztseHQuXadjm7lY3cLWAFwYbcFjMr2PwLNxIXYFyb0I/Zcp1K1Wu5L0my?=
 =?us-ascii?Q?avby7pj/A/lmvwsgr8FsfEtg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688e1556-0fc0-4b4f-76ee-08d9572bbd41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:22.1782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRt/QwXuxmFQ96l7c7aeDZyxJWnxw7sSuMqPMXIGoDulse5a6gvx0j7ux94gEPKfoznOG68fyP0KtObgI4LLM/9BTJj6tIkp93HUnyXWHHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.3.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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


