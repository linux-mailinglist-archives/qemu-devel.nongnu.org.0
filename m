Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6335444272
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:33:35 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGOU-0002cS-PO
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKx-0007XU-4u; Wed, 03 Nov 2021 09:29:55 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:3553 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1miGKt-00076y-U5; Wed, 03 Nov 2021 09:29:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq/StTIc8WSRe53VUZaDZMVrXUOuzT2VVpv9o1HT9wcxZygwlEQx379trmYUwwBoxakoZw2X6NJ/noEYo+Zhy4fSjYhcJF4tVcaK38GFAIG7RMioMVnhXL+P4WuukSGySOczt9tzuk6RHPMBwIlZdKrjWHd+I1IhwX+HDD089yKUiZKgtejljOsFcdycrKgFbog6RQmUV4rF+/gRWQumx6tX/M/rFEm0kA9eqX7vfOY9eXg4+P6PXO0mJ5kJCIp+qpobMDZO2H+lCpGQqp7L6n75sSYaJ9tgbTYiEchcewib5FNo32wT7fvSghSwNNHnLDgms5Pn5RZdHEKlSO3sKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx8hTNe3tu88i/c7gA/eULZBQw44rNtDIR++HajU5h0=;
 b=NT6E+VBpigGqyF1bG9mHd0qy4Md+j+RzcP2gmWG8vY1yjeGKh4e/DMmqTT+PPWvXptSPFoK/O02iBLTtdiHwfoNP/b9lYQgCamIgACtdF/XqY1mEmX/h0PqNpWyJ+RRaOStt2eAfSVKJmiGDgBtLnNI5USKUMy5WbEWHRoEgZFa3F0XrCZxRJd5UV1QQ+MxqtD43wyUXeF7sDsVia7NWd4g1w0LhEsn5T1tg1jZJT5sm7cex13Oy/VLianiu1SJyVnHvuzZg0+G8L2cczhQaPj/+TuOXb24Z9K6bo+HtkjSmxY1iMvvchhpSaRAF5ezvXjru9MCY+gGxhH1mezuMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx8hTNe3tu88i/c7gA/eULZBQw44rNtDIR++HajU5h0=;
 b=UM/1R+E8KLv58fFSplmNsC28CjgEgKcB44VzU7eDNgGrVKB3EqH1+H5x40QDWRnNxSn8MHNxm8Ci59QdERH3UUiOK3x+RZzsDcS+vp6FzzryWkI9SIpUmKO8kq540cyA43mSgmudoWqAOiCUUu/FbRMttq2Ko1mDAHiEVMpnPyI=
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
Subject: [PATCH v3 3/3] qapi: deprecate drive-backup
Date: Wed,  3 Nov 2021 14:29:12 +0100
Message-Id: <20211103132912.1977438-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 02671726-5ee7-4439-70b5-08d99ecdfc6f
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256605DF93CFD5BE4BD244DC18C9@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cf0nWX55ELPOufYb8A9Pg4zNb09zinsy6qLV3/J+Ivj1TMVN9SYAZUGMuwh6RIwvINcAxyV4I7MJDxxkbOujaEvAml4NiPGs5Ubinyzk0ROhtf4FgccjysrEl3/7Zw4pqQtUqA94jWdEtoGCwSvoZvMUcg2xbLcY/5tFCQk1ZHxTjLxmd+7qcnW4RYf+cqMVUyc0GPjyruCtDjmCt4eP414tiqM1SAg07AclY1KMEJGTUM+EnIRPwhxjNbrxwDCk5jM4Qr0oSQvtAd2tEYrdkPFAAkZzkOUuA9yPExqfQqXuRlnaSNxHeuRSkfCGb/4El1EW4bVNllK82Ldaro+Zn3HXlZgMYPvJq3d8qGkxccsSowd6U66+LBBSwIKkyLdC4Uwix6ljwyXXtLjfIOPK+7+Tn2CBbaIAQpOLUotED+nO/o950xE3nwig4Loi7tI7WahVo1BhYZniUiOVxBgDDD6b8YN6Fmmhc4AQGJeXXdPx8MCDwyFPAA5PtLYxTg2XIJ2FuIssmKfPVORybOaW9MQ3B1hfQLqX5BS7NrX83yy9UNEy3y7Zr725t7XWGfrYz9O+cTRipb41lA/4WbaSGbaep4AG19uRq+fEL5JF84/2lEhsJL8pMFJXMTGs01lTVgdVgJWYIU+4XdaQA1B/F+nZWv326W6HeHr1MZdwybkXSdnQYglAzf/QvHfwlAVRUAJS9qYxUKmEQpGZNcmSWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(8676002)(52116002)(6486002)(6506007)(508600001)(6666004)(186003)(8936002)(2906002)(83380400001)(956004)(2616005)(36756003)(66946007)(5660300002)(38100700002)(66476007)(86362001)(6916009)(38350700002)(4326008)(6512007)(66556008)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yRNwGu3uHUkdWIuTT9Vkd2VkrBoZ/9+zPko0RjQ0sCp2JI0juVN38MFMEv4+?=
 =?us-ascii?Q?FWof2Whp9NtxCR7WcvyZm1W1HVeyUrwbk0zM08oNKIxw8eV3/tSjgcqYaxtD?=
 =?us-ascii?Q?Jb07bB3TzcqQtuwNq4XsTuSL2wtkmV0TyLp+s46wG5QJGm+P888KWFnPqSwJ?=
 =?us-ascii?Q?lr8x6nMUih8ERL+Gav5EeK6SzH+LKyzWxFkCljg5+YzVNItPUaOGrUAkJulp?=
 =?us-ascii?Q?93T+kmTvJDE7tS/VU4PYaPjpIOFk+qj8Ybk5awC62cC+/L2ad5rRXGDLm4Gt?=
 =?us-ascii?Q?6vG6rIWxk8K4RcnVmCIzq+4C/dCLtsZWm2I8DmrWWnqA63KvQdKZnnS+n1JE?=
 =?us-ascii?Q?GybViev+h0dHPp5KiN9LHu4sIaYiJAafVIeCG0Ol3dZDGnxZHWpHQ4a4oHm+?=
 =?us-ascii?Q?3DKI1e1SS/r1XckhtminP7p+Q03BkOv2Bq7/DRsGoL8WGHCOiWARJLBXo8tC?=
 =?us-ascii?Q?zE9pydD9Q50V6sMMXLGaJS7mePmOhrTNwg8kJuC/ZE7yo6b07H+GzpTOte6D?=
 =?us-ascii?Q?lCTVNztgBuUPNUEvt9V9lvC6eW+w5rfCqMD3Y8brL1X8mIA31AHC2NrP+Z8H?=
 =?us-ascii?Q?Kf2KrCsih8ljDButrKOtuK3v20TXxwhYh3bwaD4rAtp5b7/k67gfIVBhCOSD?=
 =?us-ascii?Q?7om/xDsYAwheHywj6x1r30ofoUxgOTLQMS1NjA+E3DuAc/JVvQVHRAZk5E9B?=
 =?us-ascii?Q?s4G7902C4gPF/64wbZKbeUtWdMYi4apLEgzcR0gCkTRoBtnI9/NY6XU40itw?=
 =?us-ascii?Q?nWunrRXbAscN6tOsVmWra2XipZgn6678AflUcLVZt1muL2rzGBk3NmmTcw1G?=
 =?us-ascii?Q?/VzdcV/yIxTJ8YH3XT5iA5OjCEO5xClHVcF08XFrQ2LJyCKf7/q2XwMlS3AK?=
 =?us-ascii?Q?Im03xx7YBbXaJdyZs5nbHCC4N/6thbG28VktIgSUdQ0uXZUinhP96SEhCE4L?=
 =?us-ascii?Q?Wg7McbmOTZ5rvvmZxAJlfi63n1Jl2Qty24AGM/dVLQiPsnVj4gu4JfLfGtMj?=
 =?us-ascii?Q?eRFu7gTvlbz+a52O0svIzkZTEZ0jbSj+2RuAUBJCBZ9VLYezCEHEZCtS6HUT?=
 =?us-ascii?Q?EF1AamUTRSBelmrRzGFGIViNIziyG7MDhh6i0QBC94Nr6NyYr9A72Nq2GrrU?=
 =?us-ascii?Q?mzR5AmTUAz2dgbZ1p2moDs6siCIkTalHfTgKNq2XR7E6dsd8TC2qWmdhRLxh?=
 =?us-ascii?Q?1hX4A7t8Ugex6loC/F3A00cyRiFzwIb6h9W0MyEqp3itFBq7ChwpmP3zrO7Y?=
 =?us-ascii?Q?fcV8hBQEV91DpaMW9hq+Ijw7oYF3BbLfr5d6/WloTzdjWN2XElIMXk5in7gn?=
 =?us-ascii?Q?1hu9gfBvY8hKyCx2RT9H85HHLpmLlzRrFMV+gKoZ0I1J8YbMqiAHYPAt5Oh7?=
 =?us-ascii?Q?g/KPjMAYZjt1TRWhUjTRvRRJXsklXb/11CK+mucNu/IfOzjPhb6QnNFO6bMJ?=
 =?us-ascii?Q?jjY1hHAl6tCAQg/nxVdLvx7Ro1NXjbJpYtOW6BufMQRjd0eJvTaCuB91W8vs?=
 =?us-ascii?Q?Vh9i76tNmhkkz8HiFEhVpj60MDu6hoGot1SL5kk7pIkXPKkxoHQtQnJnJJ6F?=
 =?us-ascii?Q?73+jz6ye0AZzgi+9TFFtazJo2Ua6xIqg4Dchgi2BmoR3E4RTT81ziHJhWwyp?=
 =?us-ascii?Q?HyU5r90X6OnPQSacmZITY/1OIpBEABmAQcvmE8sgp3ijt/38beyJx7D+9v4F?=
 =?us-ascii?Q?GJ9BAg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02671726-5ee7-4439-70b5-08d99ecdfc6f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:29:39.1486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7Llyh4ri1fqYV8JsB2IlQ3bkuLb/mShQ63tfYKaEZN5OLYHTiyN0lG63tKOX63iJ4ueak3diaLbkrkj5tphp/O7ykbUk1A6Kk5dVLwj3OA=
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

Modern way is using blockdev-add + blockdev-backup, which provides a
lot more control on how target is opened.

As example of drive-backup problems consider the following:

User of drive-backup expects that target will be opened in the same
cache and aio mode as source. Corresponding logic is in
drive_backup_prepare(), where we take bs->open_flags of source.

It works rather bad if source was added by blockdev-add. Assume source
is qcow2 image. On blockdev-add we should specify aio and cache options
for file child of qcow2 node. What happens next:

drive_backup_prepare() looks at bs->open_flags of qcow2 source node.
But there no BDRV_O_NOCAHE neither BDRV_O_NATIVE_AIO: BDRV_O_NOCAHE is
places in bs->file->bs->open_flags, and BDRV_O_NATIVE_AIO is nowhere,
as file-posix parse options and simply set s->use_linux_aio.

The documentation is updated in a minimal way, so that drive-backup is
noted only as a deprecated command, and blockdev-backup used in most of
places.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/about/deprecated.rst              | 11 ++++++
 docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
 qapi/block-core.json                   |  5 ++-
 3 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 25b7ec8d92..4a4910143f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -234,6 +234,17 @@ single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 Member ``values`` in return value elements with meta-type ``enum`` is
 deprecated.  Use ``members`` instead.
 
+``drive-backup`` (since 6.2)
+''''''''''''''''''''''''''''
+
+Use ``blockdev-backup`` in combination with ``blockdev-add`` instead.
+This change primarily separates the creation/opening process of the backup
+target with explicit, separate steps. ``blockdev-backup`` uses mostly the
+same arguments as ``drive-backup``, except the ``format`` and ``mode``
+options are removed in favor of using explicit ``blockdev-create`` and
+``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
+details.
+
 System accelerators
 -------------------
 
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 9e3635b233..d403d96f58 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -116,8 +116,8 @@ QEMU block layer supports.
 (3) ``drive-mirror`` (and ``blockdev-mirror``): Synchronize a running
     disk to another image.
 
-(4) ``drive-backup`` (and ``blockdev-backup``): Point-in-time (live) copy
-    of a block device to a destination.
+(4) ``blockdev-backup`` (and the deprecated ``drive-backup``):
+    Point-in-time (live) copy of a block device to a destination.
 
 
 .. _`Interacting with a QEMU instance`:
@@ -555,13 +555,14 @@ Currently, there are four different kinds:
 
 (3) ``none`` -- Synchronize only the new writes from this point on.
 
-    .. note:: In the case of ``drive-backup`` (or ``blockdev-backup``),
-              the behavior of ``none`` synchronization mode is different.
-              Normally, a ``backup`` job consists of two parts: Anything
-              that is overwritten by the guest is first copied out to
-              the backup, and in the background the whole image is
-              copied from start to end. With ``sync=none``, it's only
-              the first part.
+    .. note:: In the case of ``blockdev-backup`` (or deprecated
+              ``drive-backup``), the behavior of ``none``
+              synchronization mode is different.  Normally, a
+              ``backup`` job consists of two parts: Anything that is
+              overwritten by the guest is first copied out to the
+              backup, and in the background the whole image is copied
+              from start to end. With ``sync=none``, it's only the
+              first part.
 
 (4) ``incremental`` -- Synchronize content that is described by the
     dirty bitmap
@@ -928,19 +929,22 @@ Shutdown the guest, by issuing the ``quit`` QMP command::
     }
 
 
-Live disk backup --- ``drive-backup`` and ``blockdev-backup``
--------------------------------------------------------------
+Live disk backup --- ``blockdev-backup`` and the deprecated``drive-backup``
+---------------------------------------------------------------------------
 
-The ``drive-backup`` (and its newer equivalent ``blockdev-backup``) allows
+The ``blockdev-backup`` (and the deprecated ``drive-backup``) allows
 you to create a point-in-time snapshot.
 
-In this case, the point-in-time is when you *start* the ``drive-backup``
-(or its newer equivalent ``blockdev-backup``) command.
+In this case, the point-in-time is when you *start* the
+``blockdev-backup`` (or deprecated ``drive-backup``) command.
 
 
 QMP invocation for ``drive-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+Note that ``drive-backup`` command is deprecated since QEMU 6.1 and
+will be removed in future.
+
 Yet again, starting afresh with our example disk image chain::
 
     [A] <-- [B] <-- [C] <-- [D]
@@ -965,11 +969,22 @@ will be issued, indicating the live block device job operation has
 completed, and no further action is required.
 
 
+Moving from the deprecated ``drive-backup`` to newer ``blockdev-backup``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+``blockdev-backup`` differs from ``drive-backup`` in how you specify
+the backup target. With ``blockdev-backup`` you can't specify filename
+as a target.  Instead you use ``node-name`` of existing block node,
+which you may add by ``blockdev-add`` or ``blockdev-create`` commands.
+Correspondingly, ``blockdev-backup`` doesn't have ``mode`` and
+``format`` arguments which don't apply to an existing block node. See
+following sections for details and examples.
+
+
 Notes on ``blockdev-backup``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The ``blockdev-backup`` command is equivalent in functionality to
-``drive-backup``, except that it operates at node-level in a Block Driver
+The ``blockdev-backup`` command operates at node-level in a Block Driver
 State (BDS) graph.
 
 E.g. the sequence of actions to create a point-in-time backup
diff --git a/qapi/block-core.json b/qapi/block-core.json
index b290782bf2..f4968d6404 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1709,6 +1709,9 @@
 # The operation can be stopped before it has completed using the
 # block-job-cancel command.
 #
+# Features:
+# @deprecated: This command is deprecated. Use @blockdev-backup instead.
+#
 # Returns: - nothing on success
 #          - If @device is not a valid block device, GenericError
 #
@@ -1724,7 +1727,7 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup' }
+  'data': 'DriveBackup', 'features': ['deprecated'] }
 
 ##
 # @blockdev-backup:
-- 
2.31.1


