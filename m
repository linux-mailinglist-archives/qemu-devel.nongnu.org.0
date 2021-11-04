Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB034450D2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:01:24 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYcd-0007cy-IU
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYZy-0003eY-9i
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miYZw-00010Z-6B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDzxbTAdVhdkUeIGHMVEb8KWVVdw3wXoaPWYssoRDF4=;
 b=aRtWHt1rkHisAi5RT43NprM2eYpbxhSWjXMaiwfT3HKEJtvyg3QNce+Jph4d/8YCYeAUr9
 /xoKC7CouPi5MigKJwZ+/KJScEoCC4wDqS3E6jEPW/ufcZ1xyvxz8VgZEsyTIr/MdTeiio
 842QEX9zW64YAS8T4CAc/un5pvByCQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-yrexOdQ_Ow6S4ciHgnDP-w-1; Thu, 04 Nov 2021 04:58:33 -0400
X-MC-Unique: yrexOdQ_Ow6S4ciHgnDP-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5141F91272;
 Thu,  4 Nov 2021 08:58:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F7B567841;
 Thu,  4 Nov 2021 08:58:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BADE511380B8; Thu,  4 Nov 2021 09:58:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] docs/interop/bitmaps: use blockdev-backup
Date: Thu,  4 Nov 2021 09:58:10 +0100
Message-Id: <20211104085811.1736654-3-armbru@redhat.com>
In-Reply-To: <20211104085811.1736654-1-armbru@redhat.com>
References: <20211104085811.1736654-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, kchamart@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to deprecate drive-backup, so use modern interface here.
In examples where target image creation is shown, show blockdev-add as
well. If target creation omitted, omit blockdev-add as well.

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


