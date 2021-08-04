Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A93DFE70
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:54:59 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDc2-0007Em-NS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMp-0005IX-3I; Wed, 04 Aug 2021 05:39:15 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMn-0006MN-C6; Wed, 04 Aug 2021 05:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5ySashJAmpCRvaLl2gNDG8LSdMKZmvi2GQiCEyC2WTNg7rR5WqHD6AJOkjBImY3+OOI0xPsPYiipoCl5r5DowWUHkEvMqa17b0A0u8DQFXWXGU4TyooGFzhFakI3rQI9Sxr7CPE/mqy/ihWYGtQ70vlLRbgt4p+KWwL633/3eanfkfZm18XyE4jvzJpGpVWe/ZeQd7uVP0opyKmdJYoH57gFhCW1PVYUjzFilBOuTHMglPlVvMCzSMh18YCZrmlI6imv3PIq1uIeEmpkq0SMkiLJg1Bm2gVAABEE0iOF34bDqEmXW5dO1li5/ZUnL8XQJJBEwfdzenik05M9SRpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs/iF0uAnWGWNcaTs51FWUmSUP3WZ5GkCULLXWuyWw0=;
 b=llS0OTcKY23NvMK+vsX7pEysvvRjbp96tgNQB+rqOCe+g/x5767xPpKVb9QYRdMuTm1C4OA/tVwEYLfd4kgzfqMEaSYP/x/QSe9oiyP9QDUf6t66PIJfTeGTfL7tSZK5vJ9clsb8b0dMc7HUdqzsjujUiapNZhr19muJ8pS+g8cWBz4Ud8C1XrK+py94lMSDlsMf7yMP9DqoQb/yRXr67rc/qAMALpIWME7R8tQpDLYVq2x+3KLntcmnRvWrGon/pVkZj+Vr4BnPJ/rGXn+5E0iZGyDcRQRHnLSEoTbcg0DtpNGa2MxhN2jGKpwvsZNpZSZhJmOy2CERoQ6g4nTkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fs/iF0uAnWGWNcaTs51FWUmSUP3WZ5GkCULLXWuyWw0=;
 b=K5JSRkGzdBtTXToXwQ17ue12E+jTe6q/MzUChFx8zZthJ+uZQArxNdQV58t+rdNyA4FBJ2SqO31sWXpdxzEdHxs/V7ugGrU7NZ1DPh+Qe/zM1HzQG4Ka1qKxjMl5z5MJ/PiNZu1KifjA6omMOKmYbM05DSC8kcSeOELh+mb5LF4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 22/33] qapi: publish copy-before-write filter
Date: Wed,  4 Aug 2021 12:38:02 +0300
Message-Id: <20210804093813.20688-23-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 213db950-7576-49b5-827b-08d9572bb509
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689FC32D5A56CC776D2164EC1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pti7JGKLIixv+ZD4Bhet5IKupp37G6b1XiOua96N+b9nqtIKgOFb+E/RsoUGHBuWOsqhf2DK5VLwxL7VKKXpQ/S73wSEM9lSIWa0t7FugX/SWIH7tOtU4kmc8XbOOEEbLOnU69VrKdH/bo3C8dIKTnNQg/VzOhQJ1+aHJuRLte5eAUmPe2WaUBdCTyri+P9mZUJUrb2nOvDf5pRWB6W6E3BBOjFd5uIg2htVwE67YimeL+9RkwB0f6XhuLZTgQjQ3m+FIRm7DCYB41ZHuzAJmxemMKYcuv+1nfLn2dO9XQFW0hAayikXJigjX4+QPvRcPMKI9ftepbAH6/aUtZgV7JGimDguJr2ktT7M9JYOaCM+xDL9SDPLxC0RrcuQ6UiIvngPdpxJQ0LhFT24pSNA8qa//VsGADojfm8R60mJbfkxC0u11i8SGXrIz/6/KBvhL0/Kg44euZwt1hsKmXb0zpjzMH6Uv6mHKDhXeDMT9rfy62/mzwTcl3qipqeBrELglIeU4Pb931i496Iief5BrlkAZOhW0iyiu0C2v90TQrXkGu6VWSZAXM2jh9P7aoKapwGY64cNK7hpCwGHx9Pwm0BR9eMNJsPFUI7MQKfQf6aRHGeQ/XacPTLoNGUBROJvrMtFROilbjUot4uEDViiBo6Bkc88y7IJxwlthAMuZKiX5clMdd1UZ3lf521SZ23KR3l2vslJQFjx0NZissXpJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2yZcVX/33mO5iv3IjQ/MF9u1wXLhuJwjSa3KFz/J9nQEPVa+LGQJw0BC6Glh?=
 =?us-ascii?Q?hseXc7NMw+/90tXv2U5DGJhQ0ppTbAvRl4vq9kmOHJco55V8u9Ob9AJlec08?=
 =?us-ascii?Q?ogx4B4EgB9hJK02UIqc+fUnNDLPzqum+9Ag/DiQ0Q7plwx7/sv2N+UwgKwz+?=
 =?us-ascii?Q?LoMz6Guwde5BzzjgNBu9ljh6YqSB64kTvOO7CI9yNmQwct8hUeTa+Csv/zLA?=
 =?us-ascii?Q?wD2d5heaY8dDm4BOi+M8NmpuwV6wgyooPiAuWoBSmNNifs5hMB8BuxZCbx0e?=
 =?us-ascii?Q?Sl7NU+fiCSary+03Qc6SeGNAIsOkcSRF1qw8GTZA+WnEDZyHDYuhgDH0wimE?=
 =?us-ascii?Q?URH2B1O3BDA4g8+pqiE4vVtPo38IQttgA6cbFhc9vSbpPrfvMudL0KJChMmo?=
 =?us-ascii?Q?5dx3hZ8fX/JIu9J2JpRcgvgYSBjuFawMecB9Lox+YPiz3WdXeZnzWZKj35AI?=
 =?us-ascii?Q?wgOqA7lEhtnZHZ56RhdSLyun+NKozM9cQLiwHRG0qGug2Kd0ZBFWhqSvR087?=
 =?us-ascii?Q?Vo8q8gIzIOr/IOO/uWB7+XYbLGlR2PGYeeGAZtxBk7XQ7Xv7xd89tUn2GUWB?=
 =?us-ascii?Q?wasBQ2swHmpEJ1p+e6eCWXGwGaKAgTlgeBQdv57iOpPg2WzVcay8QYMURpI+?=
 =?us-ascii?Q?uGXp0jmoljegZkGjspcB8RRDCHRRFyX8DTzEZIrwYN6HWOS6PsiVXIwtHs3L?=
 =?us-ascii?Q?8xLWsyS1nbmWzfOSMhyVnFTBNiFuV07sUZ13UxkjbhQze34aAvcZt/lMUNFd?=
 =?us-ascii?Q?Vgy1DdcSn3MSYOhgbXZTc3S7QfH5h6sj9kgc9tTHo2uIsncOf7bJfj+dzNIL?=
 =?us-ascii?Q?AM99W8hLCmwgZ9l1aKFMG3vDi4rqkdx63JBmHKKloLR4FYPYfyAzixurrPfK?=
 =?us-ascii?Q?hS7Qv1WOx0TEeSDIsxLJcmr2qchmZgB0c3O1mSXvxG+aKdBvmaEP0/PuOCb2?=
 =?us-ascii?Q?aO9Iex5R6j2icJOoCjx5bVkSN814uhDRezOsXailzMN7lXr0rXii0jGIiILI?=
 =?us-ascii?Q?REixNjO/F2K0BAwBs+0Z93QE7u50yw82CyOmSwe83nqREpII4xrRCBJE4Uoh?=
 =?us-ascii?Q?d9VdIedCwS8Ba/6SML3ucZ9T2jglqSWgsrHZInEgP86AQyfnpZIRCec/mT7r?=
 =?us-ascii?Q?lp11HbbQEcE3cE8+L9cqZM53G3+kQ08vjO9DE8AaCTqwqWi3BkZP395nNZgz?=
 =?us-ascii?Q?x3hOsYqfJ+a7RthPEoHCaBnCO697tjUS/5nZaFlP2TKfmDkzjPL5JAxgFV8P?=
 =?us-ascii?Q?px91d78olI1nNHkDraI/IbfqXE7UoYXFiP+C9jWTja7ZgSiHrnhA0ym22JuH?=
 =?us-ascii?Q?oXLRdANsd7jTGcv0ZyC6BXSR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213db950-7576-49b5-827b-08d9572bb509
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:08.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC1E7ZOHy6NoeD5rokkeIQ/uo/Dwb1R/xbuAQiJG/NBrPapO/w6gE+EwMo9e/7f8dhisKDvsyyrvLo2OqNx/KletGFCadD2j3MAZc26rJNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


