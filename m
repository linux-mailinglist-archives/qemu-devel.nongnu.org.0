Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E23F5A66
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:04:42 +0200 (CEST)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISML-0002Az-2G
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyT-0003E3-83; Tue, 24 Aug 2021 04:40:01 -0400
Received: from mail-eopbgr50092.outbound.protection.outlook.com
 ([40.107.5.92]:39447 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyR-0007cr-Gz; Tue, 24 Aug 2021 04:40:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxB2eJHWevbeSv8Lkcmi06bE5QC/3NiWQluiGCP20CKkbk/qxKF2PmIhVA3NldSP5R97vmQytiSw9Q3cCHKZDQLGpZupS9cqP9IA5QPgdfbnTXchJRsgQA5Y1Pw/Rzn71nghly3ugyu9fX+xZ+tVA1QGBM8UVq1tsNdUiaI6/Xc0DRWnenYyQS4du8n51tCM/a8d8Mood9ASEmTvKOcUoiuknTszmhnwHBmsqCtFQNFI+01DGq5o3oKp2NtBrZ61X9I2qhbL2NgLrC72VXdh0fQmlLkzOM9V+9gyElzTBkO/PaFIZfJGw2Aiu8n8S2wqDIBidzFQL4HIB5yqoLUhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H4ribzFNeXT+JKVfw7jHp1pKBhoGjoKPX/UWvK2KA0=;
 b=FBM2K9MT/uAhstCc6fG1L7t7o36usd4aIKhvXU92X4xELPwOpsRX0wUMG2aNO2MTNeFX4VqpHRe94WjEJrNpCFpweVvNCDHlivwyON2szX5HB+pW1rh1VSgWXuMwmgkWfPf3LyIm6vx9UMHx7FFSkmWXzwyybpxnvovv100cwWp4HLII6TA3Jpd6hCzTBsbOscrrISqWhMyPxH5qFOYXO7+cJgX9MF42Sz9BDHHtbHU4VO2ZHBcj0dioiQP4iG4Ipovv8CQIRGr4Q+ttx/jXObyXclbVNjtMYnqdkMO9Gn6cLQfIHdFbgHrE7EBvWEBxoTlTpb+IQic7qBD8OaB85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H4ribzFNeXT+JKVfw7jHp1pKBhoGjoKPX/UWvK2KA0=;
 b=cFT1iRz5Gie6+3sGMZQI05jlo+s94rehHPEG+HSb8AyL43OCh/2UdnWcslEQOzYy6LIfqkfg7i9YlEl0vip6Hx/PLsYpYpyGLs7s95eatGNjXSHcwY+XFWo2MpygvNApq8ge/J6ZUqSWxMhT9/4wZXNqT8J4QkTJ5+n6UwqTVl0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 22/34] qapi: publish copy-before-write filter
Date: Tue, 24 Aug 2021 11:38:44 +0300
Message-Id: <20210824083856.17408-23-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06f5d33b-c916-48d0-32ca-08d966dabb52
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533319D9D3A4EA0607D53487C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPSSzxbiJ37U71g/C+wBrJOUKqIDXeTdRazoumijNBe0MDJaGoK7ZYODgYREx4dffkoq4yxFPHdqb12hLbPStTV1VwwADMCIOjEjoyMlRwraNj3gIwWf1/BDNQ9dLRbm34NHcStOV1547FGgtZT9BC0ALZIMQ9z9WCIJSkK7ShDs5WEiMGgYjbZL9BKMUXhli9DcY8SMxIMlzfUnqTmdC82j8y6dfQfjpeUE/sOGP3WNf2z4TbpiLS38OZ6dwjsor4wxAVuHkBRpWia2ZVgGCnvpPWrnO8fHCsi3ZhLYAV5Ep+uSeAnnhrt/bXuaI7/O2Bgagqr0SGX76OCLVRXwoZvIdsxVk+ub29ffrEg/Jul4MsDSUq2d+3KKNNoF0lXZDileew1CIfdmenzjLOgiF8VT99aE0YkAIVo5Am9k6vLR/0pykGcLLPsAiF5xpWU+Q3/kYaaNtJ5zxCP8wBkmsfDVoCyat6Xzs6P4630QCq5in6G7m2JTPOWX9Z60enG4G7FtcangrvoNqu8brpCyit/B33WeIISJD2hlO7Ui+vdUTofS3x/F7L7HbmJx8QNc6wdybJ2AlbWzPPoXRlA1ar0x0VQ3bxjH8CkjIYPAX66OApPnH4ZJsSZxkcr6xgk7f1wFi9QhCEaTYnXtpJ/A6aB9ZoaZEwr9wCJc6G1FkcymSLXPP0Tw/9QjP9IWpicHZH9gYdRDJ72GJupuxS3C4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(6666004)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uV08kWWsgebwpp7uo7yofSFv1ym7UPmrWXpfU6cWEQ9MIwjXRw17LjymuebR?=
 =?us-ascii?Q?BYDD98EeqF2PeIp5Hk14uadDCDEV1NyqXyiZD2ASrEg9MVCJzhM22nMiorXt?=
 =?us-ascii?Q?v9TaXs8lHIoPRlW6PpgDBs86rexIgBGzRqtzWH3GoXPsOMWTKDTTfo+ufqtM?=
 =?us-ascii?Q?4I6PFX33f09FIgquN3cpeKJ+8Fw4M4sIebUOeie9Nv4GEEb3RejKm7KmJD9I?=
 =?us-ascii?Q?a+KKsfka7WzGtaSuGoHq4xpj8KFpRKoNqnJw9OoaWmaZaDbbv625Swja8CU+?=
 =?us-ascii?Q?C2W7ZWYuA3+MgILWCi/BPpnkf9WZzWrbxUGDCwRspY8IyD5jnmvmBig6DQ7Y?=
 =?us-ascii?Q?OA6IqqVyRpC5s5CIrcigAM0UGPcRli7XAYfVOy8+4L5tfW6AeU87k/WQ6R4U?=
 =?us-ascii?Q?kGnlY9Ysb3b48JE7m0OORaqBfgXiWpQUi022stuk+yYJR700aHbipMeVMmrC?=
 =?us-ascii?Q?LOHuPxlXSJ5HAZ7dY+1QH8Dj403NqwPFFROFJITnY0Uy4rIKYCcuYdglpU60?=
 =?us-ascii?Q?8I5Db2tOlTThGyR1WBVXjOQ0fwEKf9HcRfR5yuaBPhI6FL90K5a3frccfxAS?=
 =?us-ascii?Q?3OdFqg1Xj1aQ7R1CzZ4ndA1dLz50t/+7oNJL8VfHDURt0Xjn0Ed4op7SYre0?=
 =?us-ascii?Q?E0iQeYy2tgZujxqlnfQGGiALh56k3ditE4EQkN5Obedi49Bm3ynP3T2/p3oX?=
 =?us-ascii?Q?K//IYMKf2z+ri1qjyl0BcGaJ1tyX9pdXmoq9xUBjHYkzVd+/l0qOzfblvKxn?=
 =?us-ascii?Q?a9Cjw04X+O9Elyub8d+qFaUppj0Uo3ICyk5tuBQxSrYiQiJb96EEd9iISvc+?=
 =?us-ascii?Q?FfN5TCPllJQi1eRTgxxpqOfKTK7HRH1gUA21+MyR6eoPRAs0MRfqmDiVByB+?=
 =?us-ascii?Q?SWBK79EK6mmsc5qRcbHQ0D7clv0h2+TD82aRrC0UEqx4LwLzc55WB/KZfWE1?=
 =?us-ascii?Q?FIShcC6IqGM0TBvV+0ErlYVQ0Ww/dOssgQbQbr4Vs57aISdnCnXoEiWFv0XE?=
 =?us-ascii?Q?mdgf7TupeDloEJCVBvsh5I8nY2868YXXuuBYfq52Gjqye6s2ALyOBS9dKh1n?=
 =?us-ascii?Q?yOoWq7MZVLir9SR/s/exRvwbxFisMuYT5qlD+2OVvpHOvbh2Q3vOKRFU1Jnw?=
 =?us-ascii?Q?bkiNdibppZZFHrF8J+BnFgtfdRUUTaE9IgS+YDjopCLH1nK7BpqE1v2ZJvpX?=
 =?us-ascii?Q?jIPYQy+Y5HzVWOUf+042T3pGYvY+zyI7hssT03mUdTsOIi7byEcsdBF2T5OC?=
 =?us-ascii?Q?v/sJa60roxukZ+ZJ0rYTnEz1qu04tsxMr7KMAmvO7Q0ntjqgi8mCU4MSQ1G6?=
 =?us-ascii?Q?jZ5+dfjMxC4Xb9OB6UH1dQgn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f5d33b-c916-48d0-32ca-08d966dabb52
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:48.2540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0ZMyi+gjvTojwdqhypUrMw3I/OT6LA48yqN9sadBsMOSB2Ry+cOGSloyPmLItoTqLOeiS4BLYuwfAOEqa0VoL8aJrE+lrTqdjdMwqIebDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.5.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 675d8265eb..6764d8b84f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2825,13 +2825,14 @@
 # @blklogwrites: Since 3.0
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
+# @copy-before-write: Since 6.2
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
+# written to the filter, the filter first reads corresponding blocks
+# from its file child and copies them to @target child. After successfully
+# copying, the write request is propagated to file child. If copying
+# fails, the original write request is failed too and no data is written
+# to file child.
+#
+# @target: The target for copy-before-write operations.
+#
+# Since: 6.2
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


