Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46CA3F5A45
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:59:04 +0200 (CEST)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISGt-0000bn-NV
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz1-000536-O7; Tue, 24 Aug 2021 04:40:35 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:21658 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyz-00086U-UV; Tue, 24 Aug 2021 04:40:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkPc95M1DDfIJ+RZFZp0XIgXFy54djhK3dWJuVNOw5eUfa6uYiVysnt7fKSWIuNRNn1G9fTly4vZMfyU6A5R/v87sOiNQhKQq6RCSKZ9/fag2SBTLWtFH40BOvP9+JlCM5SJmuuDEHdnp3LoEoKdLsNcclrRiiPHRwdxIb1erIg7fvI0nOKhrwXGQrisfeOYvR+/6s+6OFUjjHFMyIhEMxzPbRFB/l+xC0ascQX6E+1jfjd7InP/82WIIlpnWg+P/IHkshM3HjB1KlMjzJ2czQQ5U3wtrf69A9bgYYx/9Ugs/a2jre+z0VBe/1siRH4Od50QFLm7P5WvyLV0Zl60IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=eCYucab35sQRvCZeyT07arY1cpQpPtWDVWQQMHHnujdBHtNLfQsvEFlqzvr6tGIuxvj7RrC5vDHU68Xqb/QF7H7ICUB31CwYSQELbhHgnj3YgWCaOHAX6l1hG+ZdtYA6l0ebyn0EpZUpDz7ZX4CPgjJejHFMn5QRbtAjzanVidHfAI22Hmtu5ge8WK2ppHQPiHndxl3xnme3b8JWR3PtRc8+ECPU1clE/hFVqE4Q7PxBhXIjZm2gqcDSgW9NMUMI0d5A1CDUiGVWup754Nslep8YefA1sn6nkE5U8i9n4sg7wzUJEzQ9Osw4QHuQ5wFjQJGfPvJSLfz4wHxMpIDjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=Qv3XfPdNs7H1dQtJlntENZwuDTfGUiaTCfYRvt3oAChBXJOwQv6Oy/9URexBonLfBRNgRRI3JMwIqXUqhV7FU7YKQlL4pXwaJBN9VmP7l9qeW24A4OXzKii41E008TlnXNHikLGDpe7sgMFcuyT8PLHZ4Hrl1zIde8TLeTgshEs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
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
Subject: [PATCH v8 30/34] iotests/image-fleecing: proper source device
Date: Tue, 24 Aug 2021 11:38:52 +0300
Message-Id: <20210824083856.17408-31-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e364f260-d68b-4ee7-62d4-08d966dac1f9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53336CD0BC0333BFEE39B319C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uhMQOdHGgwvl3xt9JBR+ccOwz4Ir4spH4QomUZ4It5HVoOMOQzeGH5x97RFpGB2593LnWYbbPK1lM+rkCL8um0rbIsR95i+SAsB/6VWAbINILtAFLgIf302slbzZ+EAyQxyMGKaFD7nIXTOar5MftvEgWtv05pTHf8AKPPZTJ4hcmH+/LEhJ6dlPe8hUiUa1j48w/4bJT4y1EmGTysthj3X3NiPXPgmVc4x49CD/1d3B6x/r3pdNnvET4ZaMDcUceuap0u4RVIFVuKnBLY7hp0w3WK/HZQtRpKLYmCMOczPEg6CjonxSgdZzSZ3Z87728LqslDkgnIOSK/jeu71JJYYDT/nxKcGyRxI9bAtax7y8dfKIbhMBXWzDFR5nsJ1sipflHpmowj1rt6lg6FRsUq+atQN7wX/MtaTVnLMHXN1qYJ0X2bgTP2SjI8UNcstxGMQ6tbuOVpfWbLUP+8c9efgxSBf06FI81N2mFChkSC9oqq8cjRdPbsYrHZUHI+b3EC2+//OitPFTMnmJF5JI6U2QGWKNMSicdCflSN5D01hWgrEW6iolKa7+sJ7sZxzQ1rShIXNB3y8308ha6hThSAzDhzZ/x8tmjA82ZQpB/Xg49XwgmSkcX0E1K1Ky3BUpLcrk4jdpnFCoPUnOq/CUnK357Rw7HtRaIKtHadZUa+cYafYsdoYkd3htWKoWfKj8HcSjJpLVSK7D3VWNp21DNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(6666004)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OaW9vlgiiMzILKHt8wU87q2ItrlC34q37RP3gYn/Q2EpF6zfUt2ilPJ34r9T?=
 =?us-ascii?Q?blRnfklzIfqsALGIcQlt61MKOGhDtrkyTlZXAEu40/Ije+pT95bmwvPebP+4?=
 =?us-ascii?Q?FL55g+YEpEJKmGAoDCoEL5DOULZZzpyARQpl7cgbYTyroK75mCx6tUPpJS77?=
 =?us-ascii?Q?GWO/f1uJz6qunjRRjDY3LSr7W6AAdKZSZWhOXJvLzn2zrR/COntNJZDJ2dzN?=
 =?us-ascii?Q?QN3VTF+nBD/3jB5mTXBNDW29Qwx+kl6fm2WCutSB3G5XbhPAhm5+PjzoZN5G?=
 =?us-ascii?Q?/pTrNh8kh+R9QoHArhjnHRcnlM7k667K3/ee1k7LPaqX3cS7IAaVpvbtb5h7?=
 =?us-ascii?Q?78uSSIcFUmdgvAPig7pKW5RdvjafnNP7uS2RhRsCw6fted+OoE2GCW9VbqBA?=
 =?us-ascii?Q?hxa5rzdleKTI47DiZvg25LpQskHRrizHMdOMq2mtFnTfTRs5Y9l+U/nohZPe?=
 =?us-ascii?Q?ijd5kLEalYtW3o2Y4uploQo+ZhL8Xv4I/XTur4FrGeCoIPKWeKhYcAVwPooI?=
 =?us-ascii?Q?vF5P+KmdFiiTGn0b5tNeHIepNHfkhiSRtHggt0eqA35B7IcttXJQqdFneFM8?=
 =?us-ascii?Q?vJrAPum7KULKlXaESqPHBvbBhvsxp3Frmod9MVRYxFoQT6HbSYjIBAZ0sOrx?=
 =?us-ascii?Q?DKuMP48WEiSnfBHhAZumNiPCbVLgc79PW97ewwhiCfbf+kFrmmu/wcIr9LIr?=
 =?us-ascii?Q?TS1DxGlaUOGnSLfFi9I2ih17gABJ41T9W2T8loU3VX+vGIHVZjNFn7FuzmZb?=
 =?us-ascii?Q?piPueptcZaErXeo6XDZbbbr3TaYptVAyPkNIJKFPCjV7mhA+xuBqTEfnXtLo?=
 =?us-ascii?Q?E4DlvPKP7Oz9wLjBAPa5fxoaMRK74MSPyBpT0a7XMyEw3H8HR9ycqosB/3i6?=
 =?us-ascii?Q?1M1GME56PINuyU/N9/WK5wVUuUgwzjFUayNvoahXWpKf69Q0Bsb8WdKLsAKv?=
 =?us-ascii?Q?9RxnMfHK9N5DiXnVKqL8ldpv9HnBPp5bVJHZZheUjmcMOdcF6aMxm4OnW8Cj?=
 =?us-ascii?Q?D3NdOAQ+COB3QuH3RjviiojO0CAqMkmw7biD7KE/dBaeqjR8k09DuKeJYqR7?=
 =?us-ascii?Q?p/ya4uWeeRtvRAWAgXFHK8VKsGPbfAgY7pbV4qNutNBXgHjs3FPrvmRCLNEL?=
 =?us-ascii?Q?mwCl7KZ0YH5HG+FTHpKxIdwofZHyxmlhy+Qx2ZCXBTjqCaK/oK9zw0KZ2r0+?=
 =?us-ascii?Q?STJCGJxmWQK7mf5RSFZU3as80bN+ukQnBUXor87+gUcpuhTFFCGarjebmBuV?=
 =?us-ascii?Q?8ViwErwTzSCDtLlMbLvsd5bMUmAqu2ZEES+Sz5PD6PpA7HR8AGrhlpp+2LjO?=
 =?us-ascii?Q?7EA6Gu5PpMbsr6ilCDCjAPR5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e364f260-d68b-4ee7-62d4-08d966dac1f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:59.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwbhQPOHaMzQ3MX2zkhzi2mkC2mtpzv5Zt4/VnAGvdLOfhlkYNPVQxoCopaKllRo3RsmWHPBEZIZmeikQ4Fiacin39LQpqhJ8X1TbX4ct6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.97;
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

Define scsi device to operate with it by qom-set in further patch.

Give a new node-name to source block node, to not look like device
name.

Job now don't want to work without giving explicit id, so, let's call
it "fleecing".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 12 ++++++++----
 tests/qemu-iotests/tests/image-fleecing.out |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 799369e290..961941bb27 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -70,7 +70,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Launching VM ---')
     log('')
 
-    vm.add_drive(base_img_path)
+    src_node = 'source'
+    vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
+                    f'file.filename={base_img_path},node-name={src_node}')
+    vm.add_device('virtio-scsi')
+    vm.add_device(f'scsi-hd,id=sda,drive={src_node}')
     vm.launch()
     log('Done')
 
@@ -78,7 +82,6 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = 'drive0'
     tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
@@ -94,6 +97,7 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     # Establish COW from source to fleecing node
     log(vm.qmp('blockdev-backup',
+               job_id='fleecing',
                device=src_node,
                target=tgt_node,
                sync='none'))
@@ -125,7 +129,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io(src_node, cmd))
+        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -140,7 +144,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device=src_node))
+    log(vm.qmp('block-job-cancel', device='fleecing'))
     e = vm.event_wait('BLOCK_JOB_CANCELLED')
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 16643dde30..314a1b54e9 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -50,7 +50,7 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "drive0", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 {"return": {}}
 
-- 
2.29.2


