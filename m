Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D96373CFE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:05:20 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leI9P-00074T-Om
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3L-00031X-RA; Wed, 05 May 2021 09:59:03 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:4891 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leI3I-0005lY-RP; Wed, 05 May 2021 09:59:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZwoFug3O/CzLDv3lhQ052qx5Anx8VDi/w9cVsIUrQ3Cia8z3rW6UPBIhtBwZh84RTGsywAR73MY/crqnkUidiomziW6sx9VDwaK3wtCaVC3/f9TbHoA3wjAGCsKmqWYyGb7FUyFTSmTHGnidAjyYfjHtrJqaHS3fxa6rgwJobc2BVGQrDfMDPLMQ5LkQCdGo++o+b3sTyj+OYxPqP4LOp6DLZhWfPGvIhyG5znq9qycJa80ihsQU/vPx7vv2bz9n9cjxHYVLIlbibsUTTF2OJYTmXGaAUn1QipEpqk+vHJxyySBW4lZGbmVBR2MAdXeGFFZrmPHBBBW5iQXdZEK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFQCltJH7MkIdedMj/L2uumEpXtZMo1gMDgSMrWhfGY=;
 b=PYKSe6wTr7yyx5U4K86+6e3d0CTH7iSHD1xGZAc5d0OW8e9cRguWGb8Nb3vJOhtO1O2Z7zaDQoCu5BGLq6XisXOr/rHhBuWe9uJkm5H98F5f0MFaPgkRg6IMUnRZgyf5yGbbFlD4EvZsmcchLnviZLOSQWSXdo7pMr416h+KOgPo504gZYLLhgwa3tmPJ9orhCh3IE+p45LzVzqFhiTzA3fhw3MkQ8LBH85ljg7+IkeHEvqf0ploocU0XwLbKCuQfKJEgy76vQLM5ZK9KuTkcaJM2rcCA2csV+Cm3z6dR/JeZik9SorDY89xOPwhG2CIsPs/ruE0CUMRY8yHvD9HNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFQCltJH7MkIdedMj/L2uumEpXtZMo1gMDgSMrWhfGY=;
 b=ZgDL2gF6Z0vHlqrR8tBAbZ1k3Ea7V1GSImL5d7JK3yb4kn3GRNn0cfR4lSKEoIAkRXzHzXz5AvbXZIfh0+wEcg++tUsUcQNSlKns6vocKLc11idWWrwxqga8WIDV/cU5bgP+r07XpUZjKmbwQyjLyzbHrQqdWQJFtLwUkUQXzMw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4071.eurprd08.prod.outlook.com (2603:10a6:20b:a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Wed, 5 May
 2021 13:58:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:58:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, libvir-list@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com,
 kchamart@redhat.com
Subject: [PATCH v2 2/3] docs/interop/bitmaps: use blockdev-backup
Date: Wed,  5 May 2021 16:58:02 +0300
Message-Id: <20210505135803.67896-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505135803.67896-1-vsementsov@virtuozzo.com>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 5 May 2021 13:58:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 368c093a-028d-44de-1f6d-08d90fcdebb8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40716D93F8CF29513E07FE3EC1599@AM6PR08MB4071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjCeNNrWtQNg+yHjb1NcMSDD8qJFIhGsY5QFgHs3f8BOgI8WvleVgfuu90zZPNxHg8IQHkFwV9xxOIY6L1RJrQLLPMuCJqeo8n8LBpWWX/wb3XtA04FRV8fm9ahZG32URiWYOHrf0snXBc6rQ8uJgmjF2PM9FnbWoL7HVuynEkOV5fkcDRR9VNwOhRbT4wGwJ1dqNfFEn3UzDWj3qW035h82IYnRgxcLfN1sXx5Eke0UjP9XGTt85684LDyExVnLVdc0GfI3htm8TCFTOE9cUBJD3YLNPq24y4qtFKeVVIEbiuoPNukEnnEtV/+0zWOsv7wQ5z3ODDdR1JPdkxnbB2cTX0FjShRzb3MZ1VMgm1nWJK7FyfAmKtt1wrONBNpmiqigK6JfnxNwBAadyRy8XbjriGG/j8Ao0Q0fCmr0IJkfwDZNLQPfsDSeMUwmgAYh+V7Fn0TebnvjCJ9ddVg6BUHhlhJQ91+gd7jmYSMgzhcXyQ3Q/Q2gfLZSXdLChpqLHp6kTVH4J1AB2CrLVqM/gC8mZXPSZij11cGRYrsEx+wrdcvYOAvtTS8iJ1W619Dsln2igWj/h5j7Z8CeRFPkw4qtcb/R6RiWunnTrhobJyxXWBOVGM8bqF3e9Ml5S8KZBAAhqi0bHAEY+r4HFUHCDAiplFPBS30ItEp8baDj1dtLffXHLZsBWHvd3hHV9iTF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(346002)(396003)(376002)(66476007)(6916009)(2906002)(36756003)(26005)(316002)(6506007)(83380400001)(6512007)(956004)(186003)(16526019)(6666004)(478600001)(52116002)(86362001)(7416002)(38100700002)(30864003)(8936002)(6486002)(1076003)(4326008)(8676002)(66556008)(5660300002)(38350700002)(66946007)(2616005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QEotw60fT90NPvmCUOnDwfsbNTlCOId1nZNHhLObMU6EgMpIOl+0tUfHEYQt?=
 =?us-ascii?Q?vywOo1V4nTxVWnFsJAl5muF6WbtdMneSnKW0nboJOH6B85A0UBsme4hCTxpo?=
 =?us-ascii?Q?5DwaQv3hRGvuhH9TZHBPaC4V6pOJ/4cZ91+Kjia5vFSi3RBUUlxcQC0ih3vC?=
 =?us-ascii?Q?0zY1TmobU5p1txxpdJSjMI91gJKraMtxoGW8zlWs1RPEwg5QnDzBhcg3s0l1?=
 =?us-ascii?Q?5S7XJ16W7eQsUXzQ+n/gZ1I3cFG/W1JDfhFKUL5ahWqAYk6dxDn2urPFTE+M?=
 =?us-ascii?Q?aGKfXiurPi9GnM0bsR/KPzCPDsmcakU8Yyhs460UtlsO+atkVYt87/+4GJLe?=
 =?us-ascii?Q?YDtsxzzZFhL77AM+uOszo/idxGhk1UcHQrOEOutaAatKPn2CNQaXO5oVckO8?=
 =?us-ascii?Q?cU1roO0XVe+77Y/iSY3NFM9agIJW7NZwgb41jXPm0TvdVgHLHFWxddVhLdJB?=
 =?us-ascii?Q?/JAnIp8RZTMwTypnoC/Qob1BZHI0ykzI5hZ1VNdaIfYqcjExA1FXrXFruoPO?=
 =?us-ascii?Q?4o0KLPbbncC9jkunrnCKsZ5KjYGfgaUWYnFG6wB1FgkExfjkjNDvn+SVOhgd?=
 =?us-ascii?Q?D3Rq8pNfpXEwoiTaDjOvPHE+XGDAfoXIPgAxxhrLWV7CECArmLCInh4TTYlS?=
 =?us-ascii?Q?S4GO4RCEBWS5DmISAmbo0pjflFpKXdEYBSiqoGtWT+KtyBeGcf8q/qkmxRXW?=
 =?us-ascii?Q?7/zj46MERGvYBKxSUlOEYDNJOdpIgpyg4O4CaVRa4gsxur+06kNBd9Ly8/5e?=
 =?us-ascii?Q?749knBwO1M5rC8keHFbC7YQHJ3j8is2WvL1Lnfb2vamv7zGsvX0u/5bqvoAI?=
 =?us-ascii?Q?/qCk9uZUJDzhgOIgP80SkMvLy3YVYhdEM7Hk0VlziJNZtF/EoP4uOBdwOcy5?=
 =?us-ascii?Q?jaCHKEDohvEMpMBUZuOPV89HC+5ugjpE28sIFnQ0sWWd87uoz9H+sPWEQWnR?=
 =?us-ascii?Q?Dy1fNY30aN/JZmEMbNJUwnosYN3Vssl/qWQL/Ig89E8KEdc7YjSh2SpFNosW?=
 =?us-ascii?Q?UQ61oEqnx1cVnJQfoJEiX3SMVw/6gVOiW3hRi2mKxp5IdS3nQW++i83oJzIh?=
 =?us-ascii?Q?80m2mx/aahs/5WRnOiJZEeXtlF88qxN69NloYei7r180+QzdgJw1O8RjkrKM?=
 =?us-ascii?Q?JLxXdMGOmOPIUYtdqn7o8ak6UufFaH9r3gJlwQ8O6JpP70e/TGBiYtWIM3Pd?=
 =?us-ascii?Q?W3wfwIKzgYd5cno/M9IeldGiz+eVWuVaj3fVL95TPZ9ZUXtGy0RI0lH8qarG?=
 =?us-ascii?Q?NPuWSL+jLTxVoyvnLoyoG17Opu3WI+CvllFSUJuugQlFvRATOOQV+DAOOOTo?=
 =?us-ascii?Q?P7L5tk9BVtcfR3ZcIUz75rSd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368c093a-028d-44de-1f6d-08d90fcdebb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:58:54.8902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjEfnB/Rqt24gTBuNQXa/yAbzfDH5xLfW/Wd0LTB4jvcAd/sW0ogiexfH5jUiKDUoaEJ2hpXxZH/PrwJzlCQkYxkMQAugMyjZ9/TFsE9vCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4071
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We are going to deprecate drive-backup, so use modern interface here.
In examples where target image creation is shown, show blockdev-add as
well. If target creation omitted, omit blockdev-add as well.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/bitmaps.rst | 285 +++++++++++++++++++++++++++++----------
 1 file changed, 215 insertions(+), 70 deletions(-)

diff --git a/docs/interop/bitmaps.rst b/docs/interop/bitmaps.rst
index 059ad67929..ef95090c81 100644
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
+The command is a job, which has its own QMP API for querying and
 management documented in `Background jobs
 <qemu-qmp-ref.html#Background-jobs>`_.
 
@@ -557,6 +556,10 @@ create a new incremental backup chain attached to a drive.
 This example creates a new, full backup of "drive0" and accompanies it with a
 new, empty bitmap that records writes from this point in time forward.
 
+The target may be created with help of `blockdev-add
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
2.29.2


