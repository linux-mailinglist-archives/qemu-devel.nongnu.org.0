Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B801E44B23A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:54:55 +0100 (CET)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVKg-0006AM-So
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVIg-0004Pm-HU; Tue, 09 Nov 2021 12:52:50 -0500
Received: from mail-eopbgr130133.outbound.protection.outlook.com
 ([40.107.13.133]:13792 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkVIe-00016j-27; Tue, 09 Nov 2021 12:52:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3Y1D2kJ+LEFeuZe5FBkadQ/hnEUve2jjkMUjaBM3yRBkKVArNZZ9AuWKq1K2Zx0u6x/RvcYlNdotr5d1LqUoy79gektED8/f/2LtU8ofOPacjIbHTwdxCB/zeszTe8pJq8w8OQs1IFWCL8D8lHt3ALJytMSWinZl0y6Mi5YPD0Zpte0IOU41MRhlAZ3CK5ZRALqjS4YWDKrktOOU485HCN1Cpkgaur87AZ8SFbqXRBtJVtdWPLSGPa33q18XhPTrkOYeRUjf8lhy9MQBrJ07CwnfPRKM83w2OXOZl+s5sM/Nl0cVQzGHmC4wsrEreAvv9YwtGauy9ltlNMLLWaEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TaPc6DZMMXIJC1GN1SeWRaY9Yy8BhIhm+2MGW8lKG8=;
 b=kNCBkOrVhW0MSIw3oQrqFPq99e3BbCy+BovaiyBZUN1eeke2ZgF0c89wUoNGyiwQmzGIhg8GN8BAMK+5G33dxuWBeG1TDGejHt6vHYk7weqYO5Ttz486YfY6buswAE+7CRyg7wiED1JcGE7nUSm7oiE8MIcXMmqfgnS0393NmMwD++u0XJ5DlDXcp0Q2P+zGZtPPml5lCV4I0ad5urugOzVp2ucSQiMHk0N944e/saR2BgD+FjuiB+Mm+BbMAExE5m4J8pd7o26uZOW/Rhm5gLK6HJnoMwcYRhy/uR5cDrrsFkD5k0HBq40qaKfbUkiKfwhWJ72zznBboXuACZxwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TaPc6DZMMXIJC1GN1SeWRaY9Yy8BhIhm+2MGW8lKG8=;
 b=aR3Nx1T2Ab3/0eRPwoOSzZeCKr5fEvOMyFR7WeqSwpPc0zt1cEvByQpMxY4N48AlmEONW/E1WsidNUXEgbpiadDsVVxdUTEG7HVaMHgJ8mkpczAjD/dK9M191y6v2QO85/OTmnEa5y/qdBUJIVySCixM/a5b8dSIlx1KaqPWEWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 17:52:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:52:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 3/3] qapi: deprecate drive-backup
Date: Tue,  9 Nov 2021 18:52:25 +0100
Message-Id: <20211109175225.2209903-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 12b3f5af-12bc-4bda-3803-08d9a3a9b889
X-MS-TrafficTypeDiagnostic: AS8PR08MB6568:
X-Microsoft-Antispam-PRVS: <AS8PR08MB656822E81706AF2B14C6FBADC1929@AS8PR08MB6568.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOvSBEEnI7yxxPoADKvuW3LoDyyyD2PwOvJquhcexySTwDuN6sXFT4qYJWE6SE69THSm7BbSvwXQHdhIHChLaXjDXmCw4A7eI+q+9G4DhiO0eBK0caKmz+vbPE6J8gkn6r2w77MxuYubQ9HwKFJJfk0dVexc82UH5t50y4xMti8eewBqNbzCh0RmHyMrRLtZOoqezzoh3rY2DMNOgcap+GMN4JCpkLX0XMhATPYDmgYD9YZSItZnsjdLV+SHSvQHbJ/SQ17Zny3e9dpShSCO89DdCfvr1/kNK5KRuU/5MWrZsBhwObAiCou4jVk+KQMhwl4w95YeyG9DdUs4QSN2N9v5ldkrpmqTjxRYyk86B+Prr5ZyCXH2spte06Gz+WKKjVSq+4Oq2A9vYzMB/ABYwZ87oB/xFG14m8bBQJlzWWjNr1Zg3YG0X3W+WeyIayuLBHW6O0lD6aGQwh07P01wbBrM3EwXhkz2dqh6PVttEJ/ri0XlKNdkMdNx51aUnhd3mw9/eaIBw2uMU3oY+i3HHu2f5ukncyOwcRblPT2f/MZmAoQV2OnUs2EZq9gqurs1CH3eycKybmtmfiXl8Aexb2LkYNjIjA5IupVLvq0iAntbCNy1+j0t2ibq7G59/a0ChKumOtK+0FTtPhEs1ZfkCV9VqLttN/8sJe138uNZp4NdIo1P4SOpKHybYBUCjVgJAQjBVyAqRM4sjn3aErN7LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(8936002)(6506007)(6916009)(186003)(5660300002)(316002)(6512007)(38100700002)(86362001)(52116002)(2906002)(6666004)(66556008)(956004)(508600001)(26005)(6486002)(1076003)(66476007)(38350700002)(83380400001)(8676002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKdtQ6glWiLROyoKzC7LRXFbhVJHEPDMtTHUwYyCANguPtD+4uSPzoRnDFH6?=
 =?us-ascii?Q?XWmqKUvAYuy5uo+Np+99CPzQiw+GZ9anKG7+Qs5E65+aiZAwQ62x0D0WJA55?=
 =?us-ascii?Q?HiZZb9MWXcvmMKZn0O93INKKbrjQ39kMUh+meFmTGkCygnumSR/fm//w/KHy?=
 =?us-ascii?Q?daBCH3i6l7aCznCSI6A3N+JpN5BGLz+XW2m0pn1ZULiA7siO1L2dQAtborYD?=
 =?us-ascii?Q?6vvCJetW8mCIjoZxU9FAXC9Oa234D2YHVL2y8KWEcT3BpFsd37xkq9+7ydiU?=
 =?us-ascii?Q?PcQaOlMAmPxayZuI0sXfTsHwCD737BToB4H+lwv4wOBKjHSpzFCOzTJHCBmz?=
 =?us-ascii?Q?tvG8ut1/FsnFKE7Bycu8YMXK5ujEtQjxX4W+IZqf2PUuf3fikXKynORl21an?=
 =?us-ascii?Q?ygEPw+5eLjzk4a9pmjFNWolL5MQwJjjhZzQrSZF9okD8Hz/ZRYgaoRr0KW5r?=
 =?us-ascii?Q?mtD3VhImTuMQz3rYH3nrqDDdAb6iuXjX6B0aVBqbC/9e6D+FfsU8xk7bH2v5?=
 =?us-ascii?Q?qOE0tIOXiyFePo8hrFyVSwNYi4vMI7Lmvo4PiIlCTdP0yCi3vfNRYjDwXbrM?=
 =?us-ascii?Q?dVigLGwNpZ4Cb/5qCf1zer/3QfDNPkMcFlZi8Rq3Yl7zV3ukSRcMvzgx6qAp?=
 =?us-ascii?Q?QhmUtWW7FEe57WxsIRKprofW3Dr7R7AoAB7CHGmjY7C7aBZeFF/Ou4Jdpf/G?=
 =?us-ascii?Q?KAUpX955nihjkaZw5KrK6tnYt813sV6aijUuW8dRgZbp4bRreEdArOEiJ7u5?=
 =?us-ascii?Q?Eio+EDJb1arlh96dc/pNHBTa30I0DRqbmXpUAuypFFrA7wBOAtlZ2qeX24jw?=
 =?us-ascii?Q?1HWe19FdkCzI0za4h6HSGNSc49yb0/8tz5HPc0sbzyRg2JDfHUseilf1eSF/?=
 =?us-ascii?Q?O97UvwRKLj4Ga2BuDif2HVSO+9LchWA98SQ9oBMyFn8oGuI99GpdbCYbsQdB?=
 =?us-ascii?Q?w1h8pInQrzVMoxcMk+VDf3zTATGVEoXrh/nloUgYj1M7PVoM0Ne6yvUzA9LQ?=
 =?us-ascii?Q?zx70bi0fMu0PrCanRg9qXA+zFn0lY28a/wIRLdD7uNlVrNwaA2y22sxze3z5?=
 =?us-ascii?Q?rNTa3ucQ6S67r18dPWfKF4fiTXUBfO73xNRWdyuIjtqNIL3A60GzGn7Lw73m?=
 =?us-ascii?Q?FP+X6H1g/FZ/Qi7BEuLG7NTFxfohYfI5SwHJGl44ktlgngUlTc6wwTYijM5C?=
 =?us-ascii?Q?trVeAIh8wh8SnWQCZFnkZKjgKuJ+93NWR94pLzPZfs1JufJPsGN64+guZ55I?=
 =?us-ascii?Q?pU2DG66hRw8YPHIA7bQYx81EEh5xLlM9TEWdFzK/B0ff8QaiF39JpCR5eQA7?=
 =?us-ascii?Q?ee9qKlFy0ZhzNxTCmjIZHXvxP8+ahYdxy5X8R4UcRUW17+7DXWeJNaZJocm/?=
 =?us-ascii?Q?9U7GR6pbe/hjfvuE9geu5V78LTj3TlaBsRwpGqWe1fABHoa6o1teoVO5eFtT?=
 =?us-ascii?Q?u/nJ1D7qPWT8tPDaiIksiZ49Fxbj0uPVWOJhkc7LVjb3/0LVGDiXmZXPzj5A?=
 =?us-ascii?Q?B5JVX7dS50/za5FRyFhUSn6qNoZ6pOiNhJ/n0GyXNnbesjQLkJcww7mBBBOK?=
 =?us-ascii?Q?rHc7MoCsxihR9fT3wDRP+q3tS7WlUVXauerwFH/c5vdJn4wjSJ9lfQmq38OX?=
 =?us-ascii?Q?xeQSDDoLYbOkAjqJ3CmDZYCsQx64ktra2Da0P0sogtU5K81Up6ONH98kUMFH?=
 =?us-ascii?Q?P3gxAw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b3f5af-12bc-4bda-3803-08d9a3a9b889
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:52:39.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4o7LVNgr/xOjTMMWrA3lXPVj42dk1e3FPs0Z3KA9r9uclUta8zIZNJuk0PZP09vQJB8/bp90g/W9caTEbGW9Pu17dBeedEH4ijhscMaxrY=
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
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/about/deprecated.rst              | 11 ++++++
 docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
 qapi/block-core.json                   |  5 ++-
 qapi/transaction.json                  |  6 +++-
 4 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 5e514fb443..600031210d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -239,6 +239,17 @@ single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
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
index 814c29bbe1..39e62c9915 100644
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
 
+Note that ``drive-backup`` command is deprecated since QEMU 6.2 and
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
index 33e8507d10..1d3dd9cb48 100644
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
diff --git a/qapi/transaction.json b/qapi/transaction.json
index d175b5f863..381a2df782 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,6 +54,10 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 #
+# Features:
+# @deprecated: Member @drive-backup is deprecated.  Use member
+#              @blockdev-backup instead.
+#
 # Since: 1.1
 ##
 { 'enum': 'TransactionActionKind',
@@ -62,7 +66,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
-            'drive-backup' ] }
+            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
 # @AbortWrapper:
-- 
2.31.1


