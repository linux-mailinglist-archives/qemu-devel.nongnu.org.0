Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936982DBE08
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:54:26 +0100 (CET)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTVp-0005T0-Mg
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTv-00047d-K6; Wed, 16 Dec 2020 04:52:27 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:24992 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTt-0004EF-Dw; Wed, 16 Dec 2020 04:52:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiZvE50LH9L2fV0lhkinblibcY/983FQSFt7Jzd2zhPt0yxbX9e6g6VuEy+JhXOOH1BAy7VM+zyXhr8DqdSyGfTSIeOUZG3X2jdXkVpPO5ZWon6KMutRcsFLlpoMEv3H3/6ls7ADcXdVbl+Ctz+BPNaOkDFC0Gc6THztgVEIt0iKpwqIayRsD0vGxUmwm4BSHXTi/sMRMereh8x0cl/S/e4HXW6dkk1BFsNHInvo3oI0w4iMnxM3FrfnXCOFbmC/Dz6DlyGTO9dnRClY9QWUuPhjAjut0FEpy1KbGL0KOf34NsL9tnlmuCY/Ia13qBc2GPuh2hLs4Zwg5oZfMeKdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcrRnWX9sxMyMxfllWlGcH6JkPEsc3IuqE+TRZlGKec=;
 b=mwi7QxYislJnpr/5sGnK+xVLXM4RFAfvdCyz6vT43FpB9j5M1snLiGHyPY5ZDcmUCjzoqAxxp89hBpYoIFteclVKPJiHTmNXtHf14/66j1uLmXg69qTBOGIBhq/ZTpQsdn93+ApWPldmOORCmGcoW9AwpkL48lgwFPMOdDA92vIf5lz6fiqkgQIHBTf4qwKuxYHtM8EfjvsJgbigBXMCiZ+PYFu8ovq3EegzidrscTnO88tCAmr3T4UqPaGeA5uRvydYwh4VIfplG2bUbjElIGbNzK09Dpdkcqkz7EQoq8RKdEoAzo68MxReW443KvqmWniY04WlEQcHZV8vGVVbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcrRnWX9sxMyMxfllWlGcH6JkPEsc3IuqE+TRZlGKec=;
 b=jzQuk3NH3ciBEGNhAF+3Mj0IgIK4vu+3W95P23chFhZjhl06twWChKwQwBgYmSs2bjKYHAZFhe6iWI/3lTl9NLyykodkfyeqJmZHT9QxCPha/gNfwSkAjEJtT8iio35h7ihZCoaueBCKAT3O1QRFpj0vuwLgYopsKoCz13s1Ckw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Wed, 16 Dec
 2020 09:52:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 09:52:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests: make _filter_qom_path more strict
Date: Wed, 16 Dec 2020 12:52:04 +0300
Message-Id: <20201216095205.526235-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216095205.526235-1-vsementsov@virtuozzo.com>
References: <20201216095205.526235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 09:52:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96521990-59fb-4249-84df-08d8a1a846b3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171359A130003D0AB76C3977C1C50@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPI3epgtlJQfh1iadJovymuFvqs00UFAGBSCnxPaLh++y7nTxz+T1LyiQ5zr04zPJbFXCJDYCguBSLaxjBG5qSxcAgG3JXDUwDOLLl2RL/3Y8uSBvH2IRN2ae1K2+TYTVkTT+YdI5OIxHZM/BNysGp6y4QR+UWMkhGgtjjQcsyC4KkvwwZ8+Iolr/erXj55mw8wf3WE7mMHv5gaWQpS+r6xd23BRJBO4jialuafxq2kFzUxnnrAYIE6pPIlXs5sx7CUqF/QAkpA5jrqHW1XmpJHTt3DdLcpcCJ9r1bVdQhJeqjzDudkGybJ2TEW1B82rVq9W1aHlucvMm+Y/qd69iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(8936002)(316002)(52116002)(5660300002)(6506007)(26005)(8676002)(66476007)(186003)(6486002)(478600001)(16526019)(66946007)(107886003)(6512007)(956004)(4326008)(36756003)(30864003)(66556008)(2906002)(6916009)(83380400001)(6666004)(86362001)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/CorLb4fl2ccDIgLbg//LWJgn+19/hsku/k/EQEYVOOmum6KmBrhvHkZ5Ilf?=
 =?us-ascii?Q?roOixzSYhhe4YdooPRMzQulwYA3fzpFDuQHJW32ATtTPVLcUt/rT+Ssux1Hp?=
 =?us-ascii?Q?u0524Q9G5K0OeNxUsF3a6ZFiR+ANXmZcs/OnSzs9ZlM6XuzQhL9akpSFq5tm?=
 =?us-ascii?Q?DMbXS0iDauQg1tUNBtylPw6k7ZgFeJSuq/3efKjtXJq6b3btUwMmuHNrHQkP?=
 =?us-ascii?Q?12nO8lWJSY3MslSAhm0j02Qez7ZoJ4GDwmuUn1/MlA3fH8oQsnmtSip/iAmO?=
 =?us-ascii?Q?7V53JwUqk0NTYgQaIDa57wZqg+dClp4E7TKWNYdu5elYJIb6jCtRzJYgPkF3?=
 =?us-ascii?Q?ArY6p/uGUcSl7CbTbjZMnxp57AKnNA/Oj+OC4gjQqyseUGFxnCgJEavzdooE?=
 =?us-ascii?Q?EQtPPenjrK6WT3jaXic/LzhMk6sVEJo96JuhBdiPajAoPBfVP7gObfxEFPxY?=
 =?us-ascii?Q?4mIwVH/BvT+ln6ENsArKNVLN3SAtz2Jdsq2t8i3VpMo47tCbi/3GrHDUph15?=
 =?us-ascii?Q?hzV31jb40HvxFa+FSwYtmGbje/+lPwSQe2nheMbKbBuwJihQL43ZEt1MydFP?=
 =?us-ascii?Q?XBtRr/xhxhVYRIZRnIRLTRJcr6aUsql7osKTf9efupRBJsaQAu9LEnzBMY+y?=
 =?us-ascii?Q?g1GPzXwmtXPucpfbFW0XARj+/PMbrOzr+14NHzKpbMlN24WaA2d41eOWiRKr?=
 =?us-ascii?Q?DPlQrP1VWwSR8FnSBaPligE1AM930EoLzokeTkAhJE0ombhMuDskU/gkZIt4?=
 =?us-ascii?Q?8s+kyCH6LJDGljpUOpfp2bUhDYYjgC6YHpKBZPay6xpjGRXfjd02qmw8tmo0?=
 =?us-ascii?Q?iEkD3E/BrqG/ZHqYLdB6NmKIZk4I5b9ZP9MHCkUdr5bAXcjOKrTLcX/Wt7ZZ?=
 =?us-ascii?Q?OcvUm1EcQcQfrB4SQAeWlMhjZGOwgECRsPDMJ4X7biFGUWoG4n0fQoYnkQm9?=
 =?us-ascii?Q?Yle9uWKPY4ds7DCgZTc8EocnoquAjzpKDtaWb55nUGV349VQ5KX/7rUVxBPK?=
 =?us-ascii?Q?4TSV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 09:52:18.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 96521990-59fb-4249-84df-08d8a1a846b3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0q5M3OYSIgZMKNZnHQ+dnLjAIBwqh2jrtQuhr6O42rtMu1ZZakO1kAxo0Y4cNla2kh5GS/a8aN9LKsebIqS6+1dz4q05l3xcysi/Nh2/rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to original commit, that added this filter (627f607e3dddb2),
the problematic thing in qom path is device[NUMBER], not the whole
path. Seems that tracking the other parts of the path in iotest output
is not bad. Let's make _filter_qom_path stricter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/186.out       | 56 ++++++++++++++++----------------
 tests/qemu-iotests/common.filter |  2 +-
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/tests/qemu-iotests/186.out b/tests/qemu-iotests/186.out
index 5b3504042a..01530040e5 100644
--- a/tests/qemu-iotests/186.out
+++ b/tests/qemu-iotests/186.out
@@ -7,7 +7,7 @@ Testing: -device floppy
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -23,7 +23,7 @@ Testing: -device ide-cd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -39,7 +39,7 @@ Testing: -device scsi-cd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 /machine/peripheral-anon/device[1]: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -58,7 +58,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-hd,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -74,7 +74,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-hd,
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -90,7 +90,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -98,7 +98,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -106,7 +106,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device floppy,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -124,7 +124,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device ide-cd,d
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -142,7 +142,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device scsi-cd,
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 null: json:{"read-zeroes": true, "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -191,7 +191,7 @@ none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
     Cache mode:       writeback
 
 null: json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -241,7 +241,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -257,7 +257,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scs
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -273,7 +273,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device vir
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -281,7 +281,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device vir
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral/qdev_id/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -289,7 +289,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device flo
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -307,7 +307,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device ide
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -325,7 +325,7 @@ Testing: -drive if=none,driver=null-co,read-zeroes=on,node-name=null -device scs
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0 (null): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -353,7 +353,7 @@ Testing: -drive if=none -device floppy,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -369,7 +369,7 @@ Testing: -drive if=none -device ide-cd,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -385,7 +385,7 @@ Testing: -drive if=none -device scsi-cd,drive=none0
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 none0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -404,7 +404,7 @@ Testing: -drive if=floppy
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 floppy0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -412,7 +412,7 @@ Testing: -drive if=floppy,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 floppy0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -421,7 +421,7 @@ Testing: -drive if=ide,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-hd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Cache mode:       writeback
 (qemu) quit
 
@@ -429,7 +429,7 @@ Testing: -drive if=ide,media=cdrom
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-cd0: [not inserted]
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
 (qemu) quit
 
@@ -437,7 +437,7 @@ Testing: -drive if=ide,driver=null-co,read-zeroes=on,media=cdrom
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 ide0-cd0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co, read-only)
-    Attached to:      PATH
+    Attached to:      /machine/unattached/device[N]
     Removable device: not locked, tray closed
     Cache mode:       writeback
 (qemu) quit
@@ -446,7 +446,7 @@ Testing: -drive if=virtio,driver=null-co,read-zeroes=on
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 virtio0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/peripheral-anon/device[N]/virtio-backend
     Cache mode:       writeback
 (qemu) quit
 
@@ -454,7 +454,7 @@ Testing: -drive if=pflash,driver=null-co,read-zeroes=on,size=1M
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) info block
 pflash0 (NODE_NAME): json:{"read-zeroes": "on", "driver": "null-co", "size": "1M"} (null-co)
-    Attached to:      PATH
+    Attached to:      /machine/system.flash0
     Cache mode:       writeback
 (qemu) quit
 
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 172ea5752e..268b749e2f 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -37,7 +37,7 @@ _filter_generated_node_ids()
 
 _filter_qom_path()
 {
-    $SED -e 's#\(Attached to: *\) /.*#\1 PATH#'
+    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
 }
 
 # replace occurrences of the actual TEST_DIR value with TEST_DIR
-- 
2.25.4


