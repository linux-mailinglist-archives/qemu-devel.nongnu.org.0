Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06443D0C7A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:36:14 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69aH-00008P-JL
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697w-0008Q8-Fu; Wed, 21 Jul 2021 06:06:57 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:17760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697u-0002He-Ti; Wed, 21 Jul 2021 06:06:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqLu3toBclZCKNUtpkniQcPgRhfXdtisVhe/OlEsOFtM6MlU5TOUWhsVVqYaz/SrV6If8T0oDV53d8pQIWaP53nHyWtCbMFHZd1SfBbIzYsqG+iFWl/0h/95/UzZSqA/xlK5bZ4ZhJ2/EAWurkkRtfMmKh5ozNbkeUn+ZRwE4BDcuieY3BJeekfv6Oim79s7JGq+F65VkgpqdJuNX9vjT8HSLnQm5hcQA6lOTSdmeo6gZoacgatrr6IROJsMamSJFYrEILjVTQmGm6Z9c5t4xwho273C+LM/Aa7bnIVP/BAStw3ZdkLh1nzNqosbl42q8eMQebokmSDskgGskuwW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs/iF0uAnWGWNcaTs51FWUmSUP3WZ5GkCULLXWuyWw0=;
 b=U1c9kHbTKKpon4LADy6RuWB9EvQQPAxPsycmI7U5FisD3aeW8zKnhtCq7dK+uwYhxKZ26HCfEKPhy4b09oM/b7rKqOrBHCIp2l2TjWqL2YE5Ex/Afy2YQP7tZGs0ezlhgGHvBlXF7Rh+Ybh81vwpmDCIaW+4i5w7kW7u1So2k310aX/YYckxbif1Pb3vEEdePaPrdQDLYnUxqAGJz65HinGphJ9oh4veDw1DHdb2Bd1pGJxtmGvRkPiT4W0fNQiQUx9FfvWYxxqTmQNCGpjZsk4l03mhUcZSUV8BFw2Kju9shfcqBmfXv/BJ7wUT6f7BnUQ9PdOIstiM0Ys+jK4qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs/iF0uAnWGWNcaTs51FWUmSUP3WZ5GkCULLXWuyWw0=;
 b=nAvHXjr0sBQ17wIrDklhdcXkKC2EIrxbPtYcI0zgFJkXE3vLhJtQfonZNbivZZqsksA9oCdPgm34TREy2+ZYsexPTpn+4TaheIb9P9954+vwnzsd7SrPvFYnFjFhQ0zbSIJ9RS9lbSXAZA+3C6hhEutN3Ndjth7xS2OyAO4uF8g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 22/33] qapi: publish copy-before-write filter
Date: Wed, 21 Jul 2021 13:05:44 +0300
Message-Id: <20210721100555.45594-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2533647-10bb-4738-b1f1-08d94c2f3c4c
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494576D43142E69535236AAC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2s0srUczXWXvS8G3pzaNHl/QbCL4LSbWZmM6/kq8OCkxdpwMBvzn5vZldXOE9NNGwcuv/LATKJUPgK5RpwVM4teN0QVxMvB17ep/geWHMxlOG6OkhrVtfqxFR1htxRfFzQEo1fBXvZWoPy6Uk6/xtGf5AotdeEu0sQ1Pi7LFtG18Z9byOu/rs1UwCnJ30ZmRlj5uTe5lKI3726CLt3f6tWRBQUyo3OMeshiPv90XIBPlzbUDcNbt2fZQD9aLlhtnGPnT9s1m+WccoSmZ/HW/r6o3jVAPrEeSePp0r0eZp4ZrZLo3Z+B1eeyi9L1ql8PKbEpKvWWGrO5NlDsQOMCYuBW7qxb8QpaCzSW4EJFtK6gDZv3wrAy7wI5lyJFuJW84+lohRCLcb9h/iYb5qsuj8eltRwhDlJByAjJr3R5UASLRN7XC5SXmj4uZfhjHKqKt8q+RF4AL2T2bNXXzijde6HV97acHXBuhobV05jdxYlb3nhwUQMcl21gkZhXiezI7BX1+AXhTRzSIPeDqonNDwizz47W9tF62xAAzixKa6jEIfnR0HmZB9Uae0H+D2hMg88WVhgskdR96MpJyd/xugJ5A41Y93f8HoaD/1bguNd2YKG+ZlclqrRH+3kNe7ufaN7X/qJWNqcB57vx3h57hY30WpYiE+OVvg/q6K/T9UlnBtF1G/7LjBo7wv45Mg1xd1KX3Adbk5Wl1OIco5e6bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nq1Q1FcAP4P/BS6q5L9I255uqL2IOAhhOfBxMGbcUqht+FyyrZL9b9gUKppu?=
 =?us-ascii?Q?fSHBcZ6o1l/Tv5fPVq4ctirfo5uTxFgtLrH00hzfRmBF1iGsLFEQAtVjDahV?=
 =?us-ascii?Q?jjBOzjuloekqdQGfsswzVmCbLnmEJHSQW8xU6oDLDxEPvm0A3VpkSMvGiZME?=
 =?us-ascii?Q?qt17eGNY4BG4jZ1OaFDmS8muxsiBgD6m2OyuajDxY6P7hK9cVhhNa+iEhDT/?=
 =?us-ascii?Q?qX+MNugyTIuB88uTW2myxAev82R3Gz7enJFoiV9nZuuMXTQ+JAc3kv3Z6Bki?=
 =?us-ascii?Q?nKKqCLsQkm51mQx9HDa769ZZMkqP8vwAgWFITysxy+v/xTmfMgLq714ZBAon?=
 =?us-ascii?Q?8Ff4MSTmgkCXScVUqpM1tS6UTBv8H4reEAspUAU50/z1nmeKiQE+kwohPCXx?=
 =?us-ascii?Q?qRfGXmsLylp6A51EYSFLA+Oi+/97CqxQsCn50nsnHrNsye7cyaieuK+XVcfb?=
 =?us-ascii?Q?whKu6LYKcG+0267AJ79MZ40aDH8GOQc9MvP/mM/t1rIvwAUlgSyrV9d6eDyu?=
 =?us-ascii?Q?B97jM/QZcOy+LUjK8aDtNCGGOvCB//wGwxu9gkgZxEIpP9AIPlnLc0K9XdPF?=
 =?us-ascii?Q?rM5lrLKshGTpAIyCMHzL5a8UwB8vRx7loGwsgMaf5N3UOZG63I/0TqvR+YI/?=
 =?us-ascii?Q?WgoGZ6covKfTd68I5YXs3fH4SiR5GC8AV8muEpzNy03MXfYpX+ifP4CNzsqj?=
 =?us-ascii?Q?RHoXBmJw/VCyTYCLsZQaWih6olSjeLdCdaDwfeyedlmtZfE5oSuU8vz9aRCN?=
 =?us-ascii?Q?X7rtOUXyU4Gq4IKpQcop5dcyoeAQqA/5vKZSEZ+cUwAQZAm3LlveOays5eY9?=
 =?us-ascii?Q?KPH89u48jCkGBjKXRn01D0AuLpx5mUoqOIft5ublckIRTYV4AoMklxG8Ty3n?=
 =?us-ascii?Q?DMvZ0BphbbqsAOjssLJH5RXuLWB8t4ZLmMaj2i58TppuziCAj8NzUdPie4oq?=
 =?us-ascii?Q?48szuZ+XVWtZqta1oTh3vaHKieeQ88vhxZQxWTls/mnenNZLoSLt1eqm/FNT?=
 =?us-ascii?Q?I41Vnjyhz8mXUC4TMhjuwA4FZ9xvnB5LEEmHK4yeWVKn/SbSzUCu6KiZFloN?=
 =?us-ascii?Q?abzJ6FllP/5QsqeTSO8QMF9EUolMWL6zuF11ZqZ6jqqrZVOlxsCVx/lpGzcb?=
 =?us-ascii?Q?7muwNv1mNhNoQBCguKcsPwObb9POgvDZma4OD0Cjoqi5s3fXS8QSZLysBgC3?=
 =?us-ascii?Q?XkJa5YezBZrs9Z3bKIclSyCeCLxJx/Eaho2x54+rUFeAPqssErU2Zu87+uuC?=
 =?us-ascii?Q?57gNq6UefCJLbFw8bpHSkXm35FdqawjdqE4aVsvvIRwA316wM45SZum5B8K7?=
 =?us-ascii?Q?5QN70pprIXL4RElELdAi91UH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2533647-10bb-4738-b1f1-08d94c2f3c4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:40.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XBe+7pCxcVWQSPL8h1wIcAppVZFM5vJNUzdoBf3sWTEQ/8x5G/LQzWc9g4z8JjQfWSuLylaIk7MWzM7lqzAZN0Q/xywP8q5EgTbsOL61Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 675d8265eb..59d3e5e42d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2825,13 +2825,14 @@
 # @blklogwrites: Since 3.0
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
+# @copy-before-write: Since 6.1
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
-            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster',
+            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
+            'file', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
             {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
             'http', 'https', 'iscsi',
@@ -4049,6 +4050,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @BlockdevOptionsCbw:
+#
+# Driver specific block device options for the copy-before-write driver,
+# which does so called copy-before-write operations: when data is
+# written to the filter, the filter firstly reads corresponding blocks
+# from its file child and copies them to @target child. After successful
+# copying the write request is propagated to file child. If copying
+# failed, the original write request is failed too and no data is written
+# to file child.
+#
+# @target: The target for copy-before-write operations.
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevOptionsCbw',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'target': 'BlockdevRef' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -4101,6 +4121,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
+      'copy-before-write':'BlockdevOptionsCbw',
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
-- 
2.29.2


