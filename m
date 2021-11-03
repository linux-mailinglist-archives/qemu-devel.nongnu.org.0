Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E444427A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:34:06 +0100 (CET)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGOz-0004Sa-R0
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGL5-0007o4-KY; Wed, 03 Nov 2021 09:30:03 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:3553 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKy-00076y-8P; Wed, 03 Nov 2021 09:30:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xau83nAj1r1E8DakNZMdOpgCgDlHfG9M2oa3c+gnIA7h5AWCUQATlywOrsIBqcQOt1oQGyooiRYSiRc9hIvpFwzAswFvctLo6GhYP8Zhx082FtG36i5H0M1Z0g83b7zGZkInAUdXVlc9bwwdTFr0pLrSY9fSSWgcRizlzzM7O/ijedxKg5Zq2SUlwR9Oo9zHFjNcLuC/MCdxla/wNb+Qc9e+ylBp78ZN4YlxJ+/r9UxgOECjTPRJlh1ooUau0kmWgjR1fOaxbhV9uDNjw6ayu9K73iYGKfzjMrJjRt3W8Rtj5sodIRx86nfV3m0agWyfwn8B8H3jHFs3MgCtp7wk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjhADTVAUoDLhCzfU++FG7KITNukarM7S6d27exKUFw=;
 b=hEEf3fdsB2S6wiCQDv80LG1WKWEYgO2Qg/DUA//nDoU1iIvCm0oOifXKA6Lw3X4HhUiWOXdAcfwIqVci6dcPR6vUYnCvBbN3W5AYJwAVJaK4J/onIz5XJ3/ZX/A09J2C/LjrRtXJ72oo/e6lMti9vVMkRRH/F3BT8mJ8cDKfbBK+jNHjxli+AQWhmik4LXADRAb0K5IHFkw2GVpinQNZrhMFQpswMsx+D489/GCL8vDspCWtEKy0tyjkMXWWp0+0OJw9bB2focNrf0G7dzSa+ZSLyJZT/fw2kCiLkN5oRchFkyArEfxJ3dI5hb2jOa2px5pITdoocoml0nZ6S1WYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjhADTVAUoDLhCzfU++FG7KITNukarM7S6d27exKUFw=;
 b=IezYTmRuv6KVGr6xnt2HDXX3+Snf0M3ZWpKuQLeuUAvj2lxhgA0MQ/T0KbO3KI483eFOoOfKixhGQo8iPlcPsetkT46/Bg4KpyQeb+PR5nGHq7acgEogzbh0mXtDcyHpnSbyQMapfpMiCwhJCFEFSksj15sKnjYmvhlI7ZicwUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:29:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 13:29:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, libvir-list@redhat.com, kchamart@redhat.com
Subject: [PATCH v3 2/3] docs/interop/bitmaps: use blockdev-backup
Date: Wed,  3 Nov 2021 14:29:11 +0100
Message-Id: <20211103132912.1977438-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
References: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR0301CA0015.eurprd03.prod.outlook.com (2603:10a6:20b:468::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:29:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a633a7af-d5eb-4ac4-ab7d-08d99ecdfc26
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB52564B7431E9426BD353FA44C18C9@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCSmOjcudkrAjH8WXQiVQmYdyCvaT1fCy/Eg9lSyXwzKOpz/O2t/iSRnR02mrTZZi9GiI9bejaAUTba7yF2NlE5hubIe9axyzcYbLHWZ+7pZI/JymPghZ1HkG6z+JwPtWbcPMZJTw0d+82QSsXVVBf80cZiy6Rkfr+F0laNudoySwaD68hGsukcFyI42iG9OQnkv3OqNzWwtSBI/aubfccv9zsBP2BhKYjFD0xrhz7bd7aXLzPIkNucvE6zYx9l9eUcv9zBpB3XnOXgBnCIVCtxO8qVL+T6Mo6ex4S1AAYO/36+J36PJ9CJ4weudE1p1kX5duDwS2I7GxlkPj97t77jpDE3VGtFzHlW46r/GwC0PjGgLVLS2WN+MUNnROqhdtCAniNpR8kYq5YnyU39AAmRVQIhIrM7iuN26Q+SPv1AKRhGNUWLBhDpEwe+2h4c3OAfFGpTsNoxO6qwskfU0eXzqxCCzWLdxcqD/hYWgNc4EjIx05lxbuDfE0Ui6OpFDRbRXO8wVsuwBmURV0r76GqWxUhca4me+ofRQ0F4+XEflNS0byDNh0PVZCvnmZY+Mw5hKjuhPtQi3s9g/ncrg4k5TicvjafDoAeM8k6sFIOg4GIKFvOr8/cKwzVT33IGnScZeBMetJarsT1fhIa9FpAHK/cJXtK97tvSeOKshANw0GlV4Y4W2ovN0JUTf0R0VopldzfgECBX/1uJPQQ4WLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(8676002)(52116002)(6486002)(6506007)(508600001)(6666004)(186003)(8936002)(2906002)(83380400001)(956004)(2616005)(36756003)(66946007)(5660300002)(38100700002)(66476007)(86362001)(6916009)(38350700002)(4326008)(6512007)(66556008)(316002)(30864003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OdT4tFeRujS4JYK0YqXvQvJFv7ZVbhNgIAgH/Id4iJDw9xec6vwpQDCuVE1s?=
 =?us-ascii?Q?DZjyRcsN09Lze3e3gC7icTR2B5I42+zYoo8n2EsJz5YIYmgh4EuRolzzACS5?=
 =?us-ascii?Q?+LTvv1MNS2zw7h+AC0rJ09BSnyYDA2HuKXo+WK6XXiKO5Ctyv86KjLqyc/ac?=
 =?us-ascii?Q?jBZ/MJs+jUvzhEtZFiG+aoJ8G4+XksBksxdCmtXTpQ9Z72zyyxTaB9O5mQq+?=
 =?us-ascii?Q?1a2JmM1iVVlYJIDyLdUiDM2/Z0+5hMY+YuP3zSyibeHx7ZUhcQ0REl+s2dsW?=
 =?us-ascii?Q?jaTNEnoa4jfW1nPgWw8PrBvgAYyj94mwLYsN5nOnUqIDSTwSIedRSBsYSxkM?=
 =?us-ascii?Q?bGXRwiAZeGhSUknfDxMPP5xtY5TrWL9+N3yTJ8/5jzG+JXcZdQThpAW8NMIa?=
 =?us-ascii?Q?g+BJF1XG0Iwqg0efddMNaDrn0aywFXg7P44tjQd3IS4ON3wh185MlwEdLdD0?=
 =?us-ascii?Q?qnqdcl8Vbp+K9DGnTWNBgMUp0Q8YoPIitvkfvCdzGgBNzCPva4jPCjeulGZK?=
 =?us-ascii?Q?k7h5rw9dYqCJExmTEW+zJFbkF23ibiV/kXgHAlK+9yP2lnhrxrdRVSv1Wj1P?=
 =?us-ascii?Q?XW0b1griQc2xLgLAbGOBwEDZ7V2cGp9EOE9YrCbHfWevxrirgnGZp2VBefKe?=
 =?us-ascii?Q?KN3A4qE+qox0WsB3P1FwYOp2/Xbrl7GjHYWCLI94WAgoJHGl+4BhW6Yc6/HW?=
 =?us-ascii?Q?7NzEqeYWGvoL0oR+MNyv5WT6W8EN2SHmOVFwmwKoxK05q7iu57+YsMiawc/8?=
 =?us-ascii?Q?u9I83dhU0+ZQKzXCF6JX6JmMQQpFTR9tvxPvd0ZlNSJURIP6lDBEQ7okJ9fE?=
 =?us-ascii?Q?qEqNI5vuUOB6aqD8eGlcgGgV6hXik5KluszzA2dAj4TCCCpvVc7E0n0TwTmM?=
 =?us-ascii?Q?c1OdwSLMovxCphPJD3rKffeezyhGxafTu2TOS3SMhZ6sObrX1vKyokpEH0C9?=
 =?us-ascii?Q?CKZVbKyX9AKLp3FFPm1Oedf3VcDEAMIdvROQTy2VK3jiSZnKctuFLyeqQPAc?=
 =?us-ascii?Q?x24My4t7sANHYrwbOnrNHsFvgaby3NJrtvJ/BJ1AM8fssAULQGtfMVHPS/RK?=
 =?us-ascii?Q?b0CNZxFzPbRsmcZnMx2/+SRe9p4nPyYnQzS3y9LdDi4wsE68+Yfamf+bT7Io?=
 =?us-ascii?Q?wOS/Pnm5F2K/C2zwzKPNC1sPZKPngJeMO/gqw7EMaosOCncet+g+CfACC5cP?=
 =?us-ascii?Q?7aEVSdAXwJzOEvgHRqoadOKxXbSklkmYNLSkA/nhWKuCMSHT8xln7uSwGynQ?=
 =?us-ascii?Q?/U5S/tlWqn72J7IBpX001RO3QnLh9DvRVJssGT+6ozVkzs+VerqU3OGaQi36?=
 =?us-ascii?Q?XNDrYOpHAn60Sofy5rXBLr2O8xHNhyuoA1IjK6U6Hy0clLzMTwoDkms1Z4pR?=
 =?us-ascii?Q?lViQfuI/Ltq33UiuXpBR8DryKZ0+OxnAlhBsN2EA8qEyVXM6uXKBKWO816Fs?=
 =?us-ascii?Q?zQGqcv82MKZ3jL+UcheQF7T1ZR+bIV3sxl3bIXsK5It2QfyHtjFkxnh+saZN?=
 =?us-ascii?Q?4SWHF79Hyioo6DbZf+QhGd98J3L+dOsJ8T9FVn/UVq8bRKLLlHYNoMbIg4Q8?=
 =?us-ascii?Q?4jjt0YGGQZc2qSdvp2EGGE/Xf6I2GvBYBj3UlFx6UwXtZeC9aCDwpFcpsNGd?=
 =?us-ascii?Q?vD4V2OZVjRGvqujJnXOrfi/ZXBmjWoJ4vAKf3a8ji2LmSFvRHbxxTrjZe44y?=
 =?us-ascii?Q?FbZs5w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a633a7af-d5eb-4ac4-ab7d-08d99ecdfc26
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:29:38.6846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DPnVGd+cL0m2fSSnB3nRs9fPspfRn90Q9mG052X0acBMfBjiGUm4tc2SteNd1EmQp6J6O62NrmF50U+ti7+cxoMD472UhbepN3aAAVH2I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.20.117;
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


