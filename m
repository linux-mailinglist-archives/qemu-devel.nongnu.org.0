Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A323A2A89
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:43:38 +0200 (CEST)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ60-0001q0-4m
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq1-0003ur-PC; Thu, 10 Jun 2021 07:27:06 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpy-0004ZR-Cp; Thu, 10 Jun 2021 07:27:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5TwXdF12J3YqQkXLojAbz9AEkgaj0oU37uOK+mrP1zm/XgTfsAiQ9El8U0eQ7mxoiRzC4nJrT3MkUOPfeEihFMGEh1UYFbq6HihYHPSsRNbxAd5eW4s5mJtAsMUyPvZ2bas5aOkPxm6TS5rH4vQrRCH2QFT7pibpu7kkKI1iZO0Ln29aBGY3vRWhXlE+3e1Q9ife86HtImTGCO/6+9hXwPwih6C7srZIpfcSrKJYwYPuL30GOFpdRj4WXdQzKuSZ0gcKDHfcW/Ic7ClvDRJaGBirTMFYCaTxd0Tvuy0bwjTkRKYKK5KNSGbQAlB8xs9HslUnSbaNPIzrwjizqoLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=IWrMf1W972AL/l5lZJZy5Drf14tX9d/HPqZ93o9qa+A1iKfTmsnIGCD9Vdh1P4+cmYUDXQ0S0Jg9G5Jo4/KgOpcnmBbRO7iNc1SiuLnC//XCctmrUb/HKh8bmjZhcDVdWD0O7US5joSMyf+5+M1I3rXUqvwDjsV33v5Fl/L2mMIIgfMjoBDq7YVl1jMY+4NAplLPH8WHhAcg79aujWIanVn4b1iue/56Qcm8dfPm+FUneJxBIolzeT9oxO8ljkNFHwwBhDND6vVLZhCjVI6ZcDZoTTFHAWyv9SgDM7M2n6Bdmcu60qxerxqC/Xn4fQWUX90Wsq58fVuAOWxn41ZgCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=FeDfZtXD1OvaIeUOwBrCqvAb10HIMD6yeaqtaJgBC8hBs8hOxdh4GHRaTq3neQYIf0lDKZ+VMAqDiAoCKEJJzOZ+lFoGPsif+f1vMk4PuN4WQe5/Y1rV6051Gd3f139ym+UwzFwhMsLqdsJDGDpFvvtfkTcEgB3EOVcVJLlkxWU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:26:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v5 24/35] qapi: publish copy-before-write filter
Date: Thu, 10 Jun 2021 14:26:07 +0300
Message-Id: <20210610112618.127378-25-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa630c49-5ddb-4c1d-5ce4-08d92c02a954
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280CFAFD32CD1B189CACFE5C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAsvr8D6kJVWgA/I88VFQTNqbo3CfswkXDPQ97ttbK7PPSfhgBPv0woyJ62OCZ0ZKgMSs8Fde/ChyGSM7yIi/o1CHoroERdpJiez5fNkLaTDXrUJb4F5L2SlLlyLkTGKX1AqQ/v8xvF4zvlcO62ZqiJrriclLyyU0Cn7Yveh+8PaOmryYzKTGSOHM861YsurDc/1pGR/kWeFEhRc/PK7U3pO8vAnGvJYIwL0BwkMLXE39AXxWHvjc9xvrJ7NrDw584PtdQevtYmbjy/gfbL71DVT/kepeOF5S10SQ63h8FR09tsc0Qb2xPhDzYi5hPkIaV7hcEPoflbrejx9HA95R9oziz9eiWuxCSGl2e8ddqNpdy+lyIYfkvmiYro4W/04fNxHE9IakKnY/dKU3a8tbfP0E+rvRa9DTvHrv8C699Jv3uKTwbyauqGY9Wj/Ab2qAGrPMXBB5yF2fKxJ7LkyUyX5BG1bnUSl1LItvKpiKHmfAfjjChXk5ASb9SochapxemNKrktWUzDKwWz1U3+iTHFgL/wfgFsbFn9zAyo3G3gxn2fCXPTYo+EG05qh7hEAqWn0Dn7IdmAwcoxswASM5EcSJ2XhJPhxF5sGjcspxtjjfYFAAqVN1jkV79KOGRV/Tpcn59+6zmZc/ICZV2rGMx0LeLSFD1qrotVPOoeTQD+f8ykBtcamJkzo3yu6RkrP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(54906003)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A0hg72ORAfZvMI4+ibg+FXHyuvlihVDxVQ7pJQ4SGMGVkfwTHhs2pvCR61q+?=
 =?us-ascii?Q?jYP2okhd0GcmlX8rayJofOs7ievW+L48ys2G/jUPxcQJSrtcvsBSmS/8yEII?=
 =?us-ascii?Q?1kJaeM4mvssP13/xKFbO6ylea06jVeNCcExbfxmZvxJKovNF46+zloNSidkT?=
 =?us-ascii?Q?ywKNIveCn4CAcVA4kUAyZNC2kKl3MJyWRG3t5pB42d01JuunHG9SBaZ1uY8C?=
 =?us-ascii?Q?GMUCz31VHiyp51q1GYgrMwLe5RSGg9sMrr1S/7sexQ8KX3faCa1QzyjcubFM?=
 =?us-ascii?Q?sqS31bVIQ6ggQ0FMxPp+HFsg19sBzZvhAqG0+QPvCx9rzsa7v6UmVAKRY4W6?=
 =?us-ascii?Q?ACbYIS60IcvZ3ql2rSHvnDGF+05cyJ6qwB0Evprbo5wrYJvd+bphXB7WMOk/?=
 =?us-ascii?Q?4CWtOQQWK1G0o4mP1EBXlaFDqcXSz9IHMnwgrkKa2eDzd314HLrD2DkK3e8Z?=
 =?us-ascii?Q?8O4QO36SiGtzQtcUid6YAD7axSIxKYvg+3u+X/kxDz4N1aMyvoA7MEt0Ju+V?=
 =?us-ascii?Q?iWpWVOwS2x93fqsHjAWDObgt7lW7y4FN8DCfhCMcNe6vRshagh5+Cv0JiJMH?=
 =?us-ascii?Q?hjHcNMl2+wZm5PDizARNw1yT+zb8iN16phqh9FSpkkJv8xbRS0KxW6U1RdxH?=
 =?us-ascii?Q?oiCksuIXnILRqOkns5sEgWsIiJAhuaQsws5HvAubfoUbPBlhn1APC3ss41M/?=
 =?us-ascii?Q?FU4CO9LoBRZNgyPtTFi1qHNnDG6RGvDPOhLZOyNOQii+NiM1D+6Hb7fjGtX9?=
 =?us-ascii?Q?MuvS6taA1aac6bHWBb8ANXH1lV+6xnUGyT5ps6dH5/XtAT3GQZFGzaBlBvtL?=
 =?us-ascii?Q?UPIeC26S6SYY4NEe9Qtx/4AXUM4Dw5ykgEOewH6HEGK/vKrW8PN6iDtJPkAe?=
 =?us-ascii?Q?m7ljtjYWsdVh0F4YlURKbR1u8xF5PXiyxV6FmWWUYLHTqJrxe+B54Jwxf/yB?=
 =?us-ascii?Q?6lMX0c2dVxYQDvL9NdWbPNlBotM5+qHmrm1++BcTXbG06Iditszk9tbSqpAT?=
 =?us-ascii?Q?z2u24Z7AmV5YxilCna/kjJ1KYLP4paZ5+rqTerPJNXnB/Olfk0fpvw4bRdqu?=
 =?us-ascii?Q?En53rImFZJfvbAMy+aln7bCAlNyuyGtDjyorsaFaZsxImGwCpI0ownMb3trb?=
 =?us-ascii?Q?73ErP+BEvECqMqimDwd1zSRMx3iFpNOjdS9sNCDsPqJwUkT5YY2W81KCZ6lM?=
 =?us-ascii?Q?Vv1wqaS79Qtnwt893CI8hJk0JhVhx5JqScRjn5omROuJT+prTyRuRdyQi25H?=
 =?us-ascii?Q?F2ws4UJpIxFU2+TAuWPrNbsrc9yjFi/BjTXr66Q4hsgTduYMDqLKqe6qIKvF?=
 =?us-ascii?Q?feMPrLHca7cb9zgou8R4xZGJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa630c49-5ddb-4c1d-5ce4-08d92c02a954
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:59.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PH2jl9andWJl2osfvIsQ3ggCAQu3TUNiqi9AjbRjFv7cBBnfrT/Dg7lZttDjICnk0lp6bYiitYytnlulfwU+dMwiD5W0/DZwwbU59AlhhRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..6c1ce86235 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2808,15 +2808,17 @@
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
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
-            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
-            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
+            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
+            'file', 'ftp', 'ftps', 'gluster', 'host_cdrom', 'host_device',
+            'http', 'https', 'iscsi', 'luks', 'nbd', 'nfs', 'null-aio',
+            'null-co', 'nvme', 'parallels', 'preallocate', 'qcow', 'qcow2',
+            'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
@@ -3937,6 +3939,25 @@
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
@@ -3989,6 +4010,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
+      'copy-before-write':'BlockdevOptionsCbw',
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
-- 
2.29.2


