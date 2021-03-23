Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDB34606B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:56:49 +0100 (CET)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhWa-00037g-Eh
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOM-0007Ax-5U; Tue, 23 Mar 2021 09:48:20 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:12455 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOB-0001uO-0x; Tue, 23 Mar 2021 09:48:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWdnpUhRhYJiggJq66DrGkEnFPmAy0bEq/HgwSSxoYyoSFCwXJx+CVLwdHJpcICLJ2KCO8BTFJJT9xDO6otZA6WBtf8xn/fasA6qgjViZCiIneBQdJD9jAqs0ZiPBEnAFD4nsHOEfxS4zzJWIyyjSJMEesVov7p3lOMgIuldOgb67mmd/D2FhefdH69R2ttd6RDmeKPBiO0rNYaB1u/xmfkEJlQ3c+0IYMI9OhWRYm8Kq8tkilnM6KKg00cNnbsthm+ykhNwJY+4N2ema+XgD6th1ugMp13Ed77n9DFUXgslBIqZ4LwYDELamyE93/pKOkBXGhAMLa/5QrQi7fqDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8zBsmMxJRJ7JdwQ2/eVs5MHRhIVTdBAw5wcBts+qaY=;
 b=CzqJbRayvlP8/FZfkuPb1j37G+Cldy0mMwlt6DoIP1vEt5EIpa9MBml9nlxn6dgbrK8k6Tc4N1nk1daLtQX975kN8z5d9reaMjgnVb4ggE4reUapgUQT83GRLlB88gVcaRXihgUktmGEeQMMKJSXSccWAygv/avUUe/vkaJMOSDCIiAYsrCX14xB/cMVAAriKP6M5s4y+cIU/eXH2YopNLMmHgxYWTS5KdATv0HowFK9UXw5vpUU7dBYL6cNHsWLfiYsgqVlLEESWSB6P1Yp6fH6eTbXWHOJjh48Y7iGaEMkJI/pq+YO85Rx8u3K6lMp9tkrpwYBGbRLeE+UOy2pJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8zBsmMxJRJ7JdwQ2/eVs5MHRhIVTdBAw5wcBts+qaY=;
 b=IFO74cgEjggwTfjJSVnNjdgAlCnwr7q1Ju/7D5kF7HrQIKsABArWsbv5wBfu3jkFeVhrwWlTercdYKEVlR+cliGs1j3Y2mB1KG7YOXJTUe3QcM3UXVLAGAGEh3zcQA4JJMUd9PvRM3RYJrYj2mX++zP2NinueAGi6PjYWY9idvk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 4/9] simplebench/bench-backup: add target-cache argument
Date: Tue, 23 Mar 2021 16:47:29 +0300
Message-Id: <20210323134734.72930-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8aa3669-da01-43cc-e60a-08d8ee0247b2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203479C4D0871B9F71771EE1C1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTWP3gQ3OH3RD1bKxx93BDqLGvhlYANb4lBsBHSG5K1f26I0yLS2d3g2bqQNvrlRCRLCAttVgNFZN/ckuxQFEuS8/BJ7y9rXXZwz2KkZD05XTfX/ZTZVe6Kjl+yHRzUoteOZUyVybSUBQUnOhwPwZH3RkekEGeBlYXmijzuy+FPnVKnAJI+tDng1Cru/0aZmGz77sSB/RPnBE+77W8Lk1exw3LTL21JaoNnGzbDXRSSmNspxNSd3hlBCIqM1PW3KlHuTAY4OW3eB5fNWAs4zbgA0XPsYNf/30n2m6GOHcABzP8WUAYATNHWb05mpiLqbodbUtzPirOSQTZdB5PW4D1Ti9PDMx2MT/1wXQXo91OwndQs5ZeUfcwkvI0MAu85dD/mZio6ym/mOMjRxbxmBo6m1HvVxM1ObXSRW+kqmovAXm24IqQNdwEk/CIx0B9cO5L2oArTiYPIy0jzdzIDIOWMjFUXb+m6OaAAg3jv5DYpKTw/muS7KyOaYv6HdrXj6HN29lodWjMc6xQ2QX18W2B7JYaXG2AuCxq/amRryaXqKklc4QpcXFUutfao3pEZ+IBQT4gWFfgBcxK7FQl5SVzuZH/rLoMVz5oQIsy2U2DTGxJ5TapIiOmDp9/gXNSdbrPqKt1df6xMVXHRG9UOXSVdYr1LdAFgGRmxh0k/5gZfoAkrPOS/+K4dSUT9KMGPy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(66946007)(316002)(26005)(83380400001)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DjsgWOS7n4NB0VE8kDMPIeHbgLP6r2OOlyBYMRgecmacQcjHk8UXZ8qxXQ5G?=
 =?us-ascii?Q?PbBNsWmhV7lXL+r+zi4IhmqCeEPtSPtP2CKcvFWrawSqMFk+masgqW2/8zmy?=
 =?us-ascii?Q?NqCgxXLWAap9F2LlEs0SP6InTryzAq3rPNbxbHxxnIZHiFSUHEPZKaKVRDmm?=
 =?us-ascii?Q?sTOTFKekcQiTzoNE3si25MRfVUc7T/ZO+D4CO5h4hwHdCLnrPuT9IkQXAXD+?=
 =?us-ascii?Q?Xx15NG9sYngWQ40vNxJc7Rziej0CTGfl+79ekC5UIOlcA7wZ/KkZHzbzJHk+?=
 =?us-ascii?Q?Q4vx2zfZUBoAIfjxGSPxLy2rxfo9rZ+bgD0AqDF1MqkT0zqmT32vmr5dIk5N?=
 =?us-ascii?Q?iXviLqxF3WkyBH+x3sNKWemhok/1S04JYr5xE5bSCsrG8RuQQKFVtdfU0ZSJ?=
 =?us-ascii?Q?eYamzrxpxhMMLGpGIUeZvKPPguVrOWL6HKI9dq6XqZhbDCcEzr9JCiHv2MdO?=
 =?us-ascii?Q?9xcScKaXMsD06F5SxpXi6AvXzABXjZFpFsOFSN42AKlWibEgRnUMb6x62A0h?=
 =?us-ascii?Q?dM2m9eT3UTqc3pRoqkPPJzUUnhupEYGs/YqZSbZ8eZcpO9rv257YbBpLB5ml?=
 =?us-ascii?Q?0gXr41+UH67YyCstFO3QCKaeXK3nlJq9yPxb5esyUz6Yx+73SBJm9XuTMIFy?=
 =?us-ascii?Q?AviZF1LuFHAGAR6CwpMTQ+yS+OmcHPcQ6uV2WStdfydh7Msh7+pCsuiP6bYY?=
 =?us-ascii?Q?FNm7wab7TJf96LiuhBwwWpBkqp55BMKZ8rSn0QwbNbKXaGogLJkYmcR1gfYa?=
 =?us-ascii?Q?jX7INV8DGl5ghe34B+sCy9LpIm6aJZjdXtSbGRmSFnKNLuGnMR3oMzcM6koj?=
 =?us-ascii?Q?dVoc9KejLcSKqlX3O24cEQRgiBXj9CZdREjMezbV4DTVviu8q6e6kvsQbbLg?=
 =?us-ascii?Q?oaowlZh6/pf8FgKHqiRNapdjl1n5RQD3dF/EJHyyVJEnyoeLydXX/MiHnfQl?=
 =?us-ascii?Q?KN1LoB2Gp37GRB7arH3L6n5CfL50Amun9qZqfkb2QHXeR/b5+wzEng7iAYDY?=
 =?us-ascii?Q?Wc0HFOtgt2VEGVAyDcvD+2W544LqfZ1lsLT+Z3rKFob/Q7yGlFCiimbwmgEw?=
 =?us-ascii?Q?kJik/Mq1CSKXPFOjr56QtnpMC4k+2ghD5o4fHqFUM6IUCUj8pTVW0Oo8ifzU?=
 =?us-ascii?Q?Xt/itj2CY7DRYlR8QvSzNSuYElguZCF2Ud4BO0z6jfjtU3cCbHyBTVJpervT?=
 =?us-ascii?Q?xCE4q9RVcPWhyd6A4rqbqJgaiBPkGcWczhyIkaMU0lkKcQJubExlyFrYffdf?=
 =?us-ascii?Q?wc1/gQg80NL3YNG9c4EwuWhY/34M+LCRKWi9EpSwOHxn27rLaxXppHUP74OJ?=
 =?us-ascii?Q?OazDFpzqw3Ud4buslcjXYQav?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8aa3669-da01-43cc-e60a-08d8ee0247b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:03.4829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBIJCmArnYzTb6C0pLuq/SbTFZjjrrKWQ8aLu80H4xhVgjlal2I2XF/tpICKA3nZR0UDk9grpf9c74EG4VLnNN70zyZQnRTsYzXNyiPM6c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Allow benchmark with different kinds of target cache.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench-backup.py    | 33 ++++++++++++++++++++------
 scripts/simplebench/bench_block_job.py | 10 +++++---
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index 72eae85bb1..fbc85f266f 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -65,13 +65,26 @@ def bench(args):
             test_cases.append({'id': t, 'source': source, 'target': nbd_drv})
             continue
 
-        fname = dirs[dst] + '/test-target'
-        if args.compressed:
-            fname += '.qcow2'
-        target = drv_file(fname)
-        if args.compressed:
-            target = drv_qcow2(target)
-        test_cases.append({'id': t, 'source': source, 'target': target})
+        if args.target_cache == 'both':
+            target_caches = ['direct', 'cached']
+        else:
+            target_caches = [args.target_cache]
+
+        for c in target_caches:
+            o_direct = c == 'direct'
+            fname = dirs[dst] + '/test-target'
+            if args.compressed:
+                fname += '.qcow2'
+            target = drv_file(fname, o_direct=o_direct)
+            if args.compressed:
+                target = drv_qcow2(target)
+
+            test_id = t
+            if args.target_cache == 'both':
+                test_id += f'({c})'
+
+            test_cases.append({'id': test_id, 'source': source,
+                               'target': target})
 
     binaries = []  # list of (<label>, <path>, [<options>])
     for i, q in enumerate(args.env):
@@ -186,5 +199,11 @@ def __call__(self, parser, namespace, values, option_string=None):
 Use compressed backup. It automatically means
 automatically creating qcow2 target with
 lazy_refcounts for each test run''', action='store_true')
+    p.add_argument('--target-cache', help='''\
+Setup cache for target nodes. Options:
+   direct: default, use O_DIRECT and aio=native
+   cached: use system cache (Qemu default) and aio=threads (Qemu default)
+   both: generate two test cases for each src:dst pair''',
+                   default='direct', choices=('direct', 'cached', 'both'))
 
     bench(p.parse_args())
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 08f86ed9c1..8f8385ccce 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -115,9 +115,13 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
                             '-blockdev', json.dumps(target)])
 
 
-def drv_file(filename):
-    return {'driver': 'file', 'filename': filename,
-            'cache': {'direct': True}, 'aio': 'native'}
+def drv_file(filename, o_direct=True):
+    node = {'driver': 'file', 'filename': filename}
+    if o_direct:
+        node['cache'] = {'direct': True}
+        node['aio'] = 'native'
+
+    return node
 
 
 def drv_nbd(host, port):
-- 
2.29.2


