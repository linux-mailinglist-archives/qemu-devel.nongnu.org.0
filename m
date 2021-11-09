Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A190A44B239
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:54:50 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVKb-0005tg-Pi
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVId-0004PZ-Oy; Tue, 09 Nov 2021 12:52:48 -0500
Received: from mail-eopbgr130133.outbound.protection.outlook.com
 ([40.107.13.133]:13792 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVIa-00016j-8N; Tue, 09 Nov 2021 12:52:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOGK7pHldAtHtHz9/LK0G/yUNee1Z1zTcUkuuYXk1bope+2yxg+N0u/dHzOA0JzCIMPE/j04O/YZcwurzEdcJ6IbkOp+sCCgzAXr8X12gTTC8eev+kdITIJR3v7yXG+2752QVHsitZdkTGsvnH6wcA9eqfvFuiQdTX1ezv1xnt71XPncdBLRl0cLlKf0Iecg9dmNVhzTJYkU6o/zdBJXCitSXA0RcgTdE+Wd1eAhAg6m2Weki0/lDtIJ4rX0zn3vFPkQxRtzHXa+mhSGo0k9P0MTlqa+OoxliRDeukpn89Kv7VonaYBmTaY/WXcT6kxPrFenm3kfRHSmjUmpCFMf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjhADTVAUoDLhCzfU++FG7KITNukarM7S6d27exKUFw=;
 b=XOEUxxezG0W9fWVS4ThHvHxXw0aP+yvLUFyhji58rMprvFj1FSBoT8AMH4ZlrKMl2B0RrKwDRNtKItudgJlu8EmdXQenQJGCbUYGE0lI2hxvuWPJiNiuP+kP5LEr1vFMw4Npyr6b5nnhzvhckrNkgRnKyHwpLpnvUmKVdFoycGQ8ncEmnFGdPA9AtmYkV7Ud3Ctybt77lTTVr7ui/h2Y9llSjCOFfvLW6u+1R+GNvBgLIoGuENmWJogZy1jLArGf6l/RNl3JhZTpR+Zi1Y8/NTaYeS6rhZqS1/n3Sjer1jyv2zpKKM7vmxspZDjGDsB4y3Srf6bbO+nTOPOJ2tLbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjhADTVAUoDLhCzfU++FG7KITNukarM7S6d27exKUFw=;
 b=FA7l/sdSnx2/erE+gfztM2etqS1Jtf70zIjd3lpPL2U3KTZemJkk4/IhrU8hHSpqMce1k8c+WIQVN8MOhgJ+of4I/aGVTwrVYra+l0gmYySTIgCiw7Q+HUAH+8YPnbHGhgX9OIaP2lKZpIjsmhHSmI9P4zimUsmBfVr8bqEOaRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 17:52:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:52:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, peter.maydell@linaro.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PULL 2/3] docs/interop/bitmaps: use blockdev-backup
Date: Tue,  9 Nov 2021 18:52:24 +0100
Message-Id: <20211109175225.2209903-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
References: <20211109175225.2209903-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0059.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 17:52:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f3b28f2-12eb-445a-db33-08d9a3a9b850
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-Microsoft-Antispam-PRVS: <AS8PR08MB65682C73B3DAE0CD18DC2E83C1929@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xuwtx1XIRyoTnQD8izQtps/g/IRiZ89iguRPskWEkbt3y3JwtHT0XnfCp/8FdBlrXAXiqYeLOhnu1zyyk/lL3io/Yu3FCg+trUZkKtEVKgnDidXvpFLebQ6UWOkYfqu82lCJEPVZF88c/wQDjHHQ2GXGylEvrhNCdqqMe6B8PrWnbZtJd/YwiBxoHkKjlB3RHPxntHgRcUMAZ/NaVDsRJ7udQmS5T3Kv7mVbsimKh8dBbhjCOxrj5wf2qC21jV9IyKSd+oAeBkdqu0sKvpzT9eKAcqKR52l+x92Lcj8A2t9NItc3sXuqK/mkdWPnQGriRgKf64Nh5ayaOmJ8vqr2MNtNoyqLn1ok3JrSL0KJg/2pJg4R3ez6J02TjLlaZ+YfVp9QWKobMLFpwJjHK/RJmazV9TY361ITi8scHhymGr9QXv+bTmLjlflkaPWAvejlAHeJG4R83yLDGa+VyjVRc3tHCZeWWP859JEF4SA6uxeUnIE8Iacf3bBYfGf5SWR8l7AKw7mQGMN9BEOgnvKY8ClLexoyks2DnwreblOImORS5MQICt9Yug1BJZjjqtxJPSEMSdauvP94DhCROP9v4TbYg37cX76fibtEyfjAX0315cf4xe9O6noK1dbCBVtOi12ERR5y/JyCcklUBYaShRccaOcMZ+LoB3QZjSbsQSqzvTQk7agz+PBBh8tjF0qgiMwItixmzbL9IF0+ZDAKfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(8936002)(6506007)(6916009)(186003)(5660300002)(316002)(6512007)(38100700002)(86362001)(52116002)(2906002)(6666004)(66556008)(956004)(508600001)(26005)(6486002)(1076003)(66476007)(38350700002)(83380400001)(8676002)(30864003)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAwRfh41UrPAiqwdHnYGIXM9HR5Qfy4oi45S5tUpdMbLOv0yXNCRkv3r23/I?=
 =?us-ascii?Q?9NTs7dVyvwomfnm1kLkmPMVv+vdYzE4kr1RSi36hwVPgfxZKS90I3OGqtepE?=
 =?us-ascii?Q?ps/2aLNxw6qi2dKsVAMQqNHmPLpGIOc5XeSWaFhaFrej+R6e4lGmS1W3NJQK?=
 =?us-ascii?Q?MBZG7tlhYDE1QeJc4r4zBMpHt2tF2P2KnkPuJAKCxtjVJnJEd1nRHypJ4D16?=
 =?us-ascii?Q?V+yi02d1MJWiaDNtiShqZWDLXxSDyRBPX+tkm3bLcPtdVe8A/B04SLwIERII?=
 =?us-ascii?Q?tfVtSG35LJh9hPmHGo9s3y6EHAEPniarRyMR0hVshSE7pc96jpEGGu1CRhwq?=
 =?us-ascii?Q?9kibCtImXcvycnNmRsnMSLCGRXAIAkSBuPvkzQzdDnYvlMwDZMJuINDRnXGl?=
 =?us-ascii?Q?z7u4sW9xe8aYcbTL0HFpJYevbA60cGFPDJHpEpUo7Go1aJIpfa5V7yn83Ll5?=
 =?us-ascii?Q?YJGDw+6D6CZTQ6o4wYHRD9wLc0E/p3Oq+4xGrNJC+03NvBtpqyG8d/SZ80wu?=
 =?us-ascii?Q?2bOfWl5XlZ3xHwX2gmEnD7U8R4ahm9hGVVI2m9vguRzBguj3cLNFXbYJ1ETL?=
 =?us-ascii?Q?5b2m7QTsJmNQbDw2RoAuXPpHs/4y29PfSm3qgVq7/6ViR+2X5pgUCMwX8TaQ?=
 =?us-ascii?Q?5ri/ZXaD2lEwAbR0/na/lNY0hef/GZkUSFScVWRaeDMUbVWfBZ3eD8xKaO3v?=
 =?us-ascii?Q?64ef+1U7xlYvCRpU4qwHeZpGm3fGaRxyw3MFI/6coo/inraELHTjnZV/Ev3y?=
 =?us-ascii?Q?iGqju36jIdTdaAv44cQOcGXXvrAB5dqhCMoP+u//Os7cTWqvBvIgghK3VhSa?=
 =?us-ascii?Q?7MglifSVHuZ8xadFffYVhyFzYsn51rfh0dTrL21ZFQYVj8k3JEpY7QZzsasC?=
 =?us-ascii?Q?LAt0s77MC4uSJrkdW6Wx8BVgfjRT0tr1AaqMnasFQhBLwHvAdOHQTyC/Z9DB?=
 =?us-ascii?Q?6+N78+BC+NfcGy4NjTZ92/n5PZUBFOeI62xvhMaTyMWliyPArI2EBzaiSAKa?=
 =?us-ascii?Q?I+TGLRmy53ykhAs1PK1IE2U0D/2HjHl8P+cWE/QFSqd8sAFBiHL7L5LRNzbI?=
 =?us-ascii?Q?Iz5fZqz5T2KTOwY0EvGJcXVhZ4TIMF2F0MFMmS1KQUvOa4LWdxMVCT7ArNUU?=
 =?us-ascii?Q?BmzmVV66UNTXy7I9gMnM2RI7g7FQAkhVpy1p4Zmj7XlekSAQdxeRk+SmtdYr?=
 =?us-ascii?Q?ymbRU1ZALUPGxjppbXd2n2Qn7qFXCWGj4zjOvVHmAH3VzO4LOR0OxUAw+iuU?=
 =?us-ascii?Q?6TeWctluRIT/4WDKTiCfx/CG7Xrzucn/hXNGhIcO5aMcMIeDYNcs7kHhORq1?=
 =?us-ascii?Q?gvP/IJOTwvgiWo+YZP5prctxIHvikk1FrQ640mpLHJhjkMMcr3nRqLYTQlnQ?=
 =?us-ascii?Q?PRufS4F7306F5fIDM1o7R+CCv8nKojEOhBd8JZHq5KrLy/dTiG0qub4cnZ/q?=
 =?us-ascii?Q?qbbYWjhrXJOyhvY5I5oNYd3hIFGW6IdDmkKduWzI5e2cg4wOqLDBgqt6lwc/?=
 =?us-ascii?Q?/8QODvVKeDx+6Ov8CemWxys8bDP7je2r6sYiKkNSecDtolvTCQYxsbDmAy7y?=
 =?us-ascii?Q?8yfe7wNXrv5R6mwoNHA+Ie6dM10m0UAZ3We+4E/Pl2sM+qq1gp3mFtoPsIW+?=
 =?us-ascii?Q?LZvvjjkFC2mmqXGYFPVmoSDymRNgLvLjKSyCAyRH/fWXy87ezim6W4pTicD6?=
 =?us-ascii?Q?w2p8/A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3b28f2-12eb-445a-db33-08d9a3a9b850
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:52:38.8067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vWBh7eq14XAaI8w7WnOAwAjX0LL5VUQSjDnqYMMRgsXsIgAKKMsEIpRxlRG60ESZlPw3WGDJuaI5LViytZm0QmiZHP0WkMv93/E84WOID8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Received-SPF: pass client-ip=40.107.13.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

We are going to deprecate drive-backup, so use modern interface here.
In examples where target image creation is shown, show blockdev-add as
well. If target creation omitted, omit blockdev-add as well.

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/bitmaps.rst | 285 +++++++++++++++++++++++++++++----------
 1 file changed, 215 insertions(+), 70 deletions(-)

diff --git a/docs/interop/bitmaps.rst b/docs/interop/bitmaps.rst
index 059ad67929..1de46febdc 100644
--- a/docs/interop/bitmaps.rst
+++ b/docs/interop/bitmaps.rst
@@ -539,12 +539,11 @@ other partial disk images on top of a base image to reconstruct a full backup
 from the point in time at which the incremental backup was issued.
 
 The "Push Model" here references the fact that QEMU is "pushing" the modified
-blocks out to a destination. We will be using the `drive-backup
-<qemu-qmp-ref.html#index-drive_002dbackup>`_ and `blockdev-backup
-<qemu-qmp-ref.html#index-blockdev_002dbackup>`_ QMP commands to create both
+blocks out to a destination. We will be using the  `blockdev-backup
+<qemu-qmp-ref.html#index-blockdev_002dbackup>`_ QMP command to create both
 full and incremental backups.
 
-Both of these commands are jobs, which have their own QMP API for querying and
+The command is a background job, which has its own QMP API for querying and
 management documented in `Background jobs
 <qemu-qmp-ref.html#Background-jobs>`_.
 
@@ -557,6 +556,10 @@ create a new incremental backup chain attached to a drive.
 This example creates a new, full backup of "drive0" and accompanies it with a
 new, empty bitmap that records writes from this point in time forward.
 
+The target can be created with the help of `blockdev-add
+<qemu-qmp-ref.html#index-blockdev_002dadd>`_ or `blockdev-create
+<qemu-qmp-ref.html#index-blockdev_002dcreate>`_ command.
+
 .. note:: Any new writes that happen after this command is issued, even while
           the backup job runs, will be written locally and not to the backup
           destination. These writes will be recorded in the bitmap
@@ -576,12 +579,11 @@ new, empty bitmap that records writes from this point in time forward.
              }
            },
            {
-             "type": "drive-backup",
+             "type": "blockdev-backup",
              "data": {
                "device": "drive0",
-               "target": "/path/to/drive0.full.qcow2",
-               "sync": "full",
-               "format": "qcow2"
+               "target": "target0",
+               "sync": "full"
              }
            }
          ]
@@ -664,12 +666,11 @@ use a transaction to reset the bitmap while making a new full backup:
            }
          },
          {
-           "type": "drive-backup",
+           "type": "blockdev-backup",
            "data": {
              "device": "drive0",
-             "target": "/path/to/drive0.new_full.qcow2",
-             "sync": "full",
-             "format": "qcow2"
+             "target": "target0",
+             "sync": "full"
            }
          }
        ]
@@ -728,19 +729,35 @@ Example: First Incremental Backup
        $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
          -b drive0.full.qcow2 -F qcow2
 
+#. Add target block node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc0.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Issue an incremental backup command:
 
    .. code-block:: QMP
 
     -> {
-         "execute": "drive-backup",
+         "execute": "blockdev-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "drive0.inc0.qcow2",
-           "format": "qcow2",
-           "sync": "incremental",
-           "mode": "existing"
+           "target": "target0",
+           "sync": "incremental"
          }
        }
 
@@ -785,20 +802,36 @@ Example: Second Incremental Backup
        $ qemu-img create -f qcow2 drive0.inc1.qcow2 \
          -b drive0.inc0.qcow2 -F qcow2
 
+#. Add target block node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc1.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Issue a new incremental backup command. The only difference here is that we
    have changed the target image below.
 
    .. code-block:: QMP
 
     -> {
-         "execute": "drive-backup",
+         "execute": "blockdev-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "drive0.inc1.qcow2",
-           "format": "qcow2",
-           "sync": "incremental",
-           "mode": "existing"
+           "target": "target0",
+           "sync": "incremental"
          }
        }
 
@@ -866,20 +899,36 @@ image:
              file for you, but you lose control over format options like
              compatibility and preallocation presets.
 
+#. Add target block node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc2.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Issue a new incremental backup command. Apart from the new destination
    image, there is no difference from the last two examples.
 
    .. code-block:: QMP
 
     -> {
-         "execute": "drive-backup",
+         "execute": "blockdev-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "drive0.inc2.qcow2",
-           "format": "qcow2",
-           "sync": "incremental",
-           "mode": "existing"
+           "target": "target0",
+           "sync": "incremental"
          }
        }
 
@@ -930,6 +979,38 @@ point in time.
     $ qemu-img create -f qcow2 drive0.full.qcow2 64G
     $ qemu-img create -f qcow2 drive1.full.qcow2 64G
 
+#. Add target block nodes:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.full.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target1",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive1.full.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Create a full (anchor) backup for each drive, with accompanying bitmaps:
 
    .. code-block:: QMP
@@ -953,21 +1034,19 @@ point in time.
                }
              },
              {
-               "type": "drive-backup",
+               "type": "blockdev-backup",
                "data": {
                  "device": "drive0",
-                 "target": "/path/to/drive0.full.qcow2",
-                 "sync": "full",
-                 "format": "qcow2"
+                 "target": "target0",
+                 "sync": "full"
                }
              },
              {
-               "type": "drive-backup",
+               "type": "blockdev-backup",
                "data": {
                  "device": "drive1",
-                 "target": "/path/to/drive1.full.qcow2",
-                 "sync": "full",
-                 "format": "qcow2"
+                 "target": "target1",
+                 "sync": "full"
                }
              }
            ]
@@ -1016,6 +1095,38 @@ point in time.
      $ qemu-img create -f qcow2 drive1.inc0.qcow2 \
        -b drive1.full.qcow2 -F qcow2
 
+#. Add target block nodes:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc0.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target1",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive1.inc0.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Issue a multi-drive incremental push backup transaction:
 
    .. code-block:: QMP
@@ -1025,25 +1136,21 @@ point in time.
          "arguments": {
            "actions": [
              {
-               "type": "drive-backup",
+               "type": "blockev-backup",
                "data": {
                  "device": "drive0",
                  "bitmap": "bitmap0",
-                 "format": "qcow2",
-                 "mode": "existing",
                  "sync": "incremental",
-                 "target": "drive0.inc0.qcow2"
+                 "target": "target0"
                }
              },
              {
-               "type": "drive-backup",
+               "type": "blockdev-backup",
                "data": {
                  "device": "drive1",
                  "bitmap": "bitmap0",
-                 "format": "qcow2",
-                 "mode": "existing",
                  "sync": "incremental",
-                 "target": "drive1.inc0.qcow2"
+                 "target": "target1"
                }
              },
            ]
@@ -1119,19 +1226,35 @@ described above. This example demonstrates the single-job failure case:
        $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
          -b drive0.full.qcow2 -F qcow2
 
+#. Add target block node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc0.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Attempt to create an incremental backup via QMP:
 
    .. code-block:: QMP
 
     -> {
-         "execute": "drive-backup",
+         "execute": "blockdev-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "drive0.inc0.qcow2",
-           "format": "qcow2",
-           "sync": "incremental",
-           "mode": "existing"
+           "target": "target0",
+           "sync": "incremental"
          }
        }
 
@@ -1164,6 +1287,19 @@ described above. This example demonstrates the single-job failure case:
          "event": "BLOCK_JOB_COMPLETED"
        }
 
+#. Remove target node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-del",
+         "arguments": {
+           "node-name": "target0",
+         }
+       }
+
+    <- { "return": {} }
+
 #. Delete the failed image, and re-create it.
 
    .. code:: bash
@@ -1172,20 +1308,36 @@ described above. This example demonstrates the single-job failure case:
        $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
          -b drive0.full.qcow2 -F qcow2
 
+#. Add target block node:
+
+   .. code-block:: QMP
+
+    -> {
+         "execute": "blockdev-add",
+         "arguments": {
+           "node-name": "target0",
+           "driver": "qcow2",
+           "file": {
+             "driver": "file",
+             "filename": "drive0.inc0.qcow2"
+           }
+         }
+       }
+
+    <- { "return": {} }
+
 #. Retry the command after fixing the underlying problem, such as
    freeing up space on the backup volume:
 
    .. code-block:: QMP
 
     -> {
-         "execute": "drive-backup",
+         "execute": "blockdev-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "drive0.inc0.qcow2",
-           "format": "qcow2",
-           "sync": "incremental",
-           "mode": "existing"
+           "target": "target0",
+           "sync": "incremental"
          }
        }
 
@@ -1210,7 +1362,8 @@ described above. This example demonstrates the single-job failure case:
 Example: Partial Transactional Failures
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-QMP commands like `drive-backup <qemu-qmp-ref.html#index-drive_002dbackup>`_
+QMP commands like `blockdev-backup
+<qemu-qmp-ref.html#index-blockdev_002dbackup>`_
 conceptually only start a job, and so transactions containing these commands
 may succeed even if the job it created later fails. This might have surprising
 interactions with notions of how a "transaction" ought to behave.
@@ -1240,25 +1393,21 @@ and one succeeds:
          "arguments": {
            "actions": [
            {
-             "type": "drive-backup",
+             "type": "blockdev-backup",
              "data": {
                "device": "drive0",
                "bitmap": "bitmap0",
-               "format": "qcow2",
-               "mode": "existing",
                "sync": "incremental",
-               "target": "drive0.inc0.qcow2"
+               "target": "target0"
              }
            },
            {
-             "type": "drive-backup",
+             "type": "blockdev-backup",
              "data": {
                "device": "drive1",
                "bitmap": "bitmap0",
-               "format": "qcow2",
-               "mode": "existing",
                "sync": "incremental",
-               "target": "drive1.inc0.qcow2"
+               "target": "target1"
              }
            }]
          }
@@ -1375,25 +1524,21 @@ applied:
            },
            "actions": [
            {
-             "type": "drive-backup",
+             "type": "blockdev-backup",
              "data": {
                "device": "drive0",
                "bitmap": "bitmap0",
-               "format": "qcow2",
-               "mode": "existing",
                "sync": "incremental",
-               "target": "drive0.inc0.qcow2"
+               "target": "target0"
              }
            },
            {
-             "type": "drive-backup",
+             "type": "blockdev-backup",
              "data": {
                "device": "drive1",
                "bitmap": "bitmap0",
-               "format": "qcow2",
-               "mode": "existing",
                "sync": "incremental",
-               "target": "drive1.inc0.qcow2"
+               "target": "target1"
              }
            }]
          }
-- 
2.31.1


