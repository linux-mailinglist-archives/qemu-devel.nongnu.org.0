Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5A38B223
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:45:26 +0200 (CEST)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjvR-0003JW-HH
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja2-0006bh-24; Thu, 20 May 2021 10:23:18 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja0-0005ij-8c; Thu, 20 May 2021 10:23:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQtZwIU3KoG0NRCWg9j9LerjfvM83dx/GISG2vI9GW/48uQYCp7uIGVSAhRpo5WNX9dyMSXs9VDdsfmKeY4Y7C0RU3NT/rOb0+D5td/tgBgB1FGl2hkD5Fuf9Rl1BA8FiyvoDhf09/eCXNLUIGea0M734KDDpvJABnLsnTIEdyT7lLyOh7xW+JVKAlDQZ8LeL+v4zzmebuPpE8TZZpJi6jkikgf6f9DIIjqXqGwAbNxdjY4pyhphu7P4fwAIOLaWx4KtjAMTzamLSWF8g6DjleldwBp053xPMFN0aCZI+eXSX/4s0/CwTKUTRqIBanEoyT1bCBDbhKMh6NMm3aZylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHX+YWHixEG9j0ZyOvUEmge+MEfvt1U4V3K3x3YbWkw=;
 b=LLgfrkOYbwwEzvTbWIxu38HRsI5Fg+3S+zRHCx/UG4w0uyU2iRyvRP8FmkD7uc+M56BnWQlx3ZmwhFZ77gsDqAin9pr/UJsdcHbAfR8dba/O6OdyznBjc1nxeX2CLt+SaGXS/YXC3vEmyCi8PIyMt3sgexfHrsux9EjFh23nxZD2Q0euLGH9dvFFN+1bUqfDxQj6XsFc3xs/TaYYeMOo1peT6z1aoWKgV+XcukOI2+h/v9zQoGt5zVV0QEK12ziUwGYkYqpeSWkqh8W5/ZsZC53BBbrgBi1vkuC1ESG2SG+U7OBXaLzqIlmDfML7RJMcisJHOCUaw0LCYqy2w4GDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHX+YWHixEG9j0ZyOvUEmge+MEfvt1U4V3K3x3YbWkw=;
 b=M49cX2aHNZyEeLW1Cj4JFvbjilRskQoEVkNxoRdGOkq/xcej5hWIq16179Z3CDor38qi0E0BrzNla86XX/USDRkTM3zC07pX+EmaxlpCBvqVOhawV5EznPuX1VIy5LxXWzHEBMLuvUpfd5FAv41e17c74gfmX3juQVVnN455Nc0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 22/33] qapi: publish copy-before-write filter
Date: Thu, 20 May 2021 17:21:54 +0300
Message-Id: <20210520142205.607501-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47dbc5ec-0a4f-4ba6-d738-08d91b9ac1bf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544B098776089541365001AC12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOgVrzLYSe9ug8RGMm85l5Qpnh+/uQSbtHR9nw+tThiuduRjK/MfmcdB88oPStO0AF4cOcQ+xtoS4E5Ynq+AlfybItW4hpX3ANaH1E9xxAujwk/rzhnCJ/BUXic13yd7NNfXUZzh8oaDdqpMMwCy5ufbgFAJsyu0k7LsjhuQe/LS/xVXGwnuBsUV66TwoTTzR3yE3vXngxJQ9tEHovKJx5yia5DUAinDpbiwGeOFY+XVwjMswaXwepdB1ksIl7hqhespj7AIP3azQiFRIaBVp/a5zTq9KY7JuV0xrIKhdOEMV29g5xM1A2/BSNxObKTDU7EEyTNf2G7yQQxy11anXsvaXhbEQkrZxiYpzKs9MDAWT2y0RYZETmJnDMYDnlEw+elazU1RUAfYrLuniiC3FwyWk8twsLymd/KCzAWQeKk7yMys5NHNOpLPB5+if+fElItSF4Z0vQWsxJwsgfxsBwmN7mLqWAkiLeBSNBRC01ko9AQA1hkcmZAkrfeJcLlSqiosb8nhIie3luglwCGA2jdgvMAixJL0/qSptS0NsDIQBE2/hgxa0+8Tu0/ooq5YUu1ji+ZZ/0Fe1xwcRWRMIuDyeNNeJNjrtJI900s/EBshwVXzP6gHZvPv2atLjcx6qZOwvdBcCaA3C+IUi0usnyf7boy5oJ3Cq8OIz0AKH0D4LAvmIwGo611qcTuq7Gt1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?InoDFTIuEDSGEQG9wuId2jrMHOmYCGao1XEy/7tHtjQDp3rmKuMpvXh1nW1X?=
 =?us-ascii?Q?khaRh43lhZ9qzUNJTJ7onwE758u7xsFp2RlDZTk5fV8YH39bC6LEB8sahBEw?=
 =?us-ascii?Q?MvhRGSGZnPH32a1lyHmRqODFCccL5/R5CotVvLYMz56xlrfpOgZ/m5nZb8CJ?=
 =?us-ascii?Q?vzBWk8LKYURe+9GH/uhygga2Vm8JihlYaV/w8cVyB4K7OWf/UVOCAdMTmps+?=
 =?us-ascii?Q?jAf6FH4ZLjySdrxirElqcDkRbMSAnCnPjEyX3VrN49e2eZd7TwYjP7CavRmb?=
 =?us-ascii?Q?YlQPM9F3Qw4W22fK1qgXXR2upkOLUe5+6bfNn+k3cLuZ/6w+amPfOq96wKzl?=
 =?us-ascii?Q?o1BqubeSN2xxMnjvld7NwIxb7XYpHDUY1AABTyPRI9nV1t7599ARQjlFgVaj?=
 =?us-ascii?Q?FyepiS35Ksc7qbiVzP35bVUdnKPpLrO336OtFuRNKgIqfVNaI5FWZNcJHflz?=
 =?us-ascii?Q?zpVPeT5ylWEhnnrna4I6pN3X1s1gFUqrkvU454OCwo0hCVcftsPx54AbsgaC?=
 =?us-ascii?Q?dC8FP8SPasLs0fbcFf7lmDQHhnRhiUD920Z4Xro1Q0zdp/pWKZs9ByW99c1x?=
 =?us-ascii?Q?gsdE6GCi0sfFMTM5HJ87qHysR1xu9gfv7pAH2aODhy42itwBXqo+wXaSJvrs?=
 =?us-ascii?Q?Bzb++Ft6KS1fqJJ1ebLC+wSEmrm6qVBhiHW6ZSXVxJ8Yzc6Oex5bC+OAYmCb?=
 =?us-ascii?Q?wHj61kB3Rp5zhiFjCzh1hgAJFJG3HMxvsNXZZpsIJ4nosYfWPsMwWZ7pOR/4?=
 =?us-ascii?Q?U7rC0NmUqHcXL8f2FnFWVNbpgv2UXNCiaeKie1MWZKzeab0nhzbMIkF6M85c?=
 =?us-ascii?Q?Ph+bBZWQmpf/SvN6tAAQ/cjg2Fy2LvAAdePlc5QScS3dupeRPSiYTinlD7qu?=
 =?us-ascii?Q?NcwQMjBJABIRQ7WesiqIUDg3nEYFj4nUl/RLiAKme4y6DC2MjhBb9TGrAIKM?=
 =?us-ascii?Q?JXJeBvl1YZn5FxD0AlJ3dC9WSs8V/uWLExsKtAKKSltCS7bAn7+W68ZK7Evx?=
 =?us-ascii?Q?wPntKGRZdnD3ycmVudoncjWBpMJSF88qkc3XaLQDIDS0S0ixRPk/5Y9Nkzh+?=
 =?us-ascii?Q?mXShOjJWedGQJ8QAjd1F7UzLce9Ww5G9yLWaEE5ptxdvS8uMb877zAuIlk1K?=
 =?us-ascii?Q?pQ3un+PKbXqAxazPNkkLA/1cn07tGBVShYzcPNASM0NMntPB5Z3fOAeWMdOO?=
 =?us-ascii?Q?dvFvQkMhnEv/i0MKOWO14/eFnDaHODGxL30bMR4BPazxDaMzy7kwrFZTXPmc?=
 =?us-ascii?Q?exr95Xy6R7+maobGoUqo/415h4rGweLXJmxoZne+zHwFuUszSszO4Y4soAF6?=
 =?us-ascii?Q?cxAkZz6RCmvm1AtuCfrmHvhD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dbc5ec-0a4f-4ba6-d738-08d91b9ac1bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:54.0498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3G9nwGx3QhzIKn084zVsdf7aYWAvUzRqRcEGRidIUfw4sPAE3PAksqWj1hKJgsfrHDR+AosU3tXKKkU+omCBuwdjGPZXrgZ/AAkz3/iNXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
---
 qapi/block-core.json | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..8c4801a13d 100644
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
+# filed, the original write request is failed too and no data is written
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


