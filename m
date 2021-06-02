Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D038B398AD2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:35:10 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR1Z-00029t-QD
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQg5-0002cs-Oy; Wed, 02 Jun 2021 09:12:57 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:57568 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfy-0003lC-Pn; Wed, 02 Jun 2021 09:12:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpszw5eb21uIQJ+9S5V11Lx2yF8XXmBNIPTxwEuiY0CQhPtXYg9IXw87gsz9P7b00oHlkQghvNa9hZmDVeGNkeZ+amdOc0lIZS8pF8MxdnuhMTQsmBcPsEMi5/JCRUpgZDvZG2n2o2fNYIjNH5a9jM3NFuaM44x2mffRVsi1V6EIgPxayER5vDp8XUvVd+AvXb+HHuUOlfZTMLgM176I0Khrt+ybeC/x2i17P6nc/TFxPuY1fLyPAlc9sHzO7MF3oqmyjbI2+6VQtm98k5AMze81aHu4Mz1xHkY90h7wYZOU6aQPdNoe/Url0N4mYe4njeffeV6cs4mjcAdFp+tKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=TKgqa1RzAvidi/2J6Wv0+uvn7HO+fkL+TUO6E7lQwxJi7e/kNaxwfABjoy9O29dBf0yQw/B3oAgf3FE/5wXFMTlsKmlmryEIZSH9XzbTpeMDMNtTnuunMGBUkppvUpHxqXj8fCfGuVsw+lrxbcYGi6wyszWVrc4Jux7uzA2ZNoLLGmR60ofFpcCw6pfPUUMfAocjA8zPr0UNoracWaXz9mJ/h7h9YQrlets8B90RXfJ0c+2VeLoX6cJUQkR1hAtYuL8dDwGdfBw1+DX8ECIOD+Vqn3wBR+Jv8Ps8pM/mB6qS/2Y1I9TjsuR333ek/aUVrwZo8vCkTHPM/Jo2k3/S7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfTynrtFoOtQlEZdXbg/sqJjKgrWrpnDM9PaHle0IOc=;
 b=czsrqjqWJYqbE+ag+PcmKTyIwCzaL7o6/hQHuWdGON/uV+XpiV2XFFMYNaQ3OPMQ9BqyBlaAeGad4WS1dKbpCLpivuIB0SyOP5SyECpMwK8WJ9dFmTz/ZWnJPehoc/ZLD6p6yLPNIXZIyxd0FwrDqqR81bSpBjlvVsiULEUmXhQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 33/35] iotests/image-fleecing: rename tgt_node
Date: Wed,  2 Jun 2021 16:11:06 +0300
Message-Id: <20210602131108.74979-34-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15780ef4-ec7b-4743-8f25-08d925c808cb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536D559706ADBB93C640D67C13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6cBtgjFYyhSbJbTxCitOPS5aPKdckSFOpHrkfO0gqwpyR1tcIxBDqmb0vYqb7G7dw/abb5xtZOkTBH54dcKoiEPl91DBeXC/Zn3q/AEeZvx090pb0Om0OrHOmznLMmmMfZNNL1zgfjEIeP2O5+IxbR4i+lJ8owoXjelSZv1V9F3Gv0UAWsfCSRlhLIaPPxTtYtn2y5APFrzMrnLZsPykOB6A9485RhTbi8NtUR/RW7dglYwSWkhh9OWXLYfjemg+GG3osfG0mA8ilE+ptl7ChG6vQhcOCjJDVbJXWWRaYzX/+XfmQ3jZEOANDLqrZD14wJQRIgiSwk4S8WyyKkny+9vXnbGtwbn7fbtvux07ojZ2QlfQX45Wbt5TgI0Z2vVwO3C7hzr430vWQNvl0LY1Pu6XBU8I/RX/rSC+cM6eQNBlBFgcLSzpUHCyT2RJU+HEF54R6EOJnwJR51Q0uOcRVx7tlozQNncfdLX+XJxSpMwV96Ld0X9lqrpQo6xxMUCnnCxDvdzEcRF7Vj/Ba2DfuR376j89xY5rt6N0vLihCQ4RH+AR3D/ciAzEpuZBkF64e+w2xcF24KduYF3aAK6BUOIBtHzhnZCf2lUWmJT2POIF6lpG6+wT6Zx6CBFfUUtJdAX3pPmXWWXhNQlPb1VXlalxk6lodImlOf86z1Q+NZ+f2z2X/vXEg6fBZoXNIZ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gn6arGLnNt2WgMje3pyUOLO5xCJNKCKm8JodMWjht1hllrwosw7eZwHILANA?=
 =?us-ascii?Q?xAovDx9LGmNWXbS084Jd+x4jrKozVhdkXS7oJuNav+O5xtaUwr5bTh4CNVLT?=
 =?us-ascii?Q?oxm+NO6whChiRpp0DhoyRX4XWQk7UYe9emZ0Tol2FIBT66vs735T+tfTXVRc?=
 =?us-ascii?Q?klKI/6yk5mhH2sDezks0PSeb6K1UfXUi3KxvzkkELSQGTDexd6s674TMaeY3?=
 =?us-ascii?Q?cpm9mhfBalYWwtKOBnVjQf+nBQU7ZNh91duET1SOmdho/1bQuDhimVXnxHmi?=
 =?us-ascii?Q?t3I9kQj5KNAPXjFDGrGgxjpWqU6EJm7VyblCO1IQQKmsgwuRONw4sa1nt2Lm?=
 =?us-ascii?Q?p291I19SAxojjmeesCFDSU9uUDfOO+q4L49YqPXvWDFpD+rg9J21vC/mqZcL?=
 =?us-ascii?Q?q4qNRLi2ZwSWMf2PnNPFF2MAtGGsNZKAc+qbb3KiDUBM1BXoqWoayUoGe8Zq?=
 =?us-ascii?Q?n2ZUkwKk+eoNjdKUoefzAfZGcvLQFG1uQnFp82VlpBIGCqg71+xD63iSczpg?=
 =?us-ascii?Q?FN38Rd0raQ9zTL0k5hzCUeRlNI9Smgoiq4L9k6C0YLIogqJU5MxnC52j69UU?=
 =?us-ascii?Q?/MeK3llN+L7cFUHkJWQ3jY+0py2Lx5WmJKwIPB+ynrj/+Iqtcdul6OPpd8MO?=
 =?us-ascii?Q?2cE+O2m6zAlb6RLlVc+EGtDLvCVgHQWxX/4+kE2YvnQD+UPorGRZjh7MhabF?=
 =?us-ascii?Q?oIO5GKfm7jlZF899PRPQ5g2JnuS215Ho/hqyDhTuzpoALwGqAargo1A4QuG8?=
 =?us-ascii?Q?nnW5rERt4clyoz6fuadrZk1SA+OnsOiykBcZETaWjZ2oOAuI4eWDvWX8pZoJ?=
 =?us-ascii?Q?rf2NFIJfjfSh2VAOeatwwwK3KAz9QXCtC6ug38haLuwKa3AfO2eOVL447/oc?=
 =?us-ascii?Q?+sdJdhKbcNLwgCpe2ErKAFV69h7kbMvCAp5zVj33/oo0Eh1J0EFnEbdZ8+V8?=
 =?us-ascii?Q?Bxlhytph9YEY56O6nO6vwbVEyUqlsORZTEEZP9ToWbxTmMqD1J7nH8swKYP6?=
 =?us-ascii?Q?TV/ySjPiGxENdrAxhE5yV+3R1GrCntwCBAWyr4ZsaEJccqhNryb9ATs2IAUJ?=
 =?us-ascii?Q?2MfKG9fewOJ5FqeZGIdLvTUcJpSvESCFSCehjDqwRpnWyGJbNN0dc+SJ9y+l?=
 =?us-ascii?Q?3douZJ142MbA/gbTeGsNuVQMrFTl2d8luwLFO3ZCxXA9uud92X6ZgPVryIo+?=
 =?us-ascii?Q?32O5jP17E6C14I1n8WQgGscogphfknxnlub/oSHzHw05TOUtdWJAfyc+66Hf?=
 =?us-ascii?Q?QuVoDgJe36axWQZaLxUHog1uzr3vibwA2PMILwKPELVqr8WhfdoNGzk8Hvoa?=
 =?us-ascii?Q?kVTEVMivYTgDa7H+8rQbF2KY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15780ef4-ec7b-4743-8f25-08d925c808cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:12.2444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etsur6bjI5rQNZGLM9UUSXYRbuOsFxUGcaKd60B0VhqvtciJL5yMJS/qJYVr4tp9OKpvSu6x0MSCkiKivLVsCnAqP69h4rmvn4ZOUa7dt58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.3.130;
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


