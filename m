Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4210DFC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 22:27:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLvpS-0005LK-Ez
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 16:27:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvnH-0003tv-7z
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hLvnB-0001Ek-FR
	for qemu-devel@nongnu.org; Wed, 01 May 2019 16:25:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hLvmz-00017n-Dx; Wed, 01 May 2019 16:25:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A61D430832E9;
	Wed,  1 May 2019 20:25:12 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-238.bos.redhat.com [10.18.17.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 991137C5EE;
	Wed,  1 May 2019 20:25:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 16:25:06 -0400
Message-Id: <20190501202506.13875-3-jsnow@redhat.com>
In-Reply-To: <20190501202506.13875-1-jsnow@redhat.com>
References: <20190501202506.13875-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 01 May 2019 20:25:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/2] docs/interop/bitmaps: rewrite and modernize
 doc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	jsnow@redhat.com, qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This just about rewrites the entirety of the bitmaps.rst document to
make it consistent with the 4.0 release. I have added new features seen
in the 4.0 release, as well as tried to clarify some points that keep
coming up when discussing this feature both in-house and upstream.

It does not yet cover pull backups or migration details, but I intend to
keep extending this document to cover those cases.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190426221528.30293-3-jsnow@redhat.com
[Adjusted commit message. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/interop/bitmaps.rst | 1599 ++++++++++++++++++++++++++++++--------
 1 file changed, 1264 insertions(+), 335 deletions(-)

diff --git a/docs/interop/bitmaps.rst b/docs/interop/bitmaps.rst
index 7bcfe7f461..510e8809a9 100644
--- a/docs/interop/bitmaps.rst
+++ b/docs/interop/bitmaps.rst
@@ -1,5 +1,5 @@
 ..
-   Copyright 2015 John Snow <jsnow@redhat.com> and Red Hat, Inc.
+   Copyright 2019 John Snow <jsnow@redhat.com> and Red Hat, Inc.
    All rights reserved.
=20
    This file is licensed via The FreeBSD Documentation License, the full
@@ -9,547 +9,1476 @@
 Dirty Bitmaps and Incremental Backup
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
--  Dirty Bitmaps are objects that track which data needs to be backed up
-   for the next incremental backup.
+Dirty Bitmaps are in-memory objects that track writes to block devices. =
They
+can be used in conjunction with various block job operations to perform
+incremental or differential backup regimens.
=20
--  Dirty bitmaps can be created at any time and attached to any node
-   (not just complete drives).
+This document explains the conceptual mechanisms, as well as up-to-date,
+complete and comprehensive documentation on the API to manipulate them.
+(Hopefully, the "why", "what", and "how".)
+
+The intended audience for this document is developers who are adding QEM=
U
+backup features to management applications, or power users who run and
+administer QEMU directly via QMP.
=20
 .. contents::
=20
+Overview
+--------
+
+Bitmaps are bit vectors where each '1' bit in the vector indicates a mod=
ified
+("dirty") segment of the corresponding block device. The size of the seg=
ment
+that is tracked is the granularity of the bitmap. If the granularity of =
a
+bitmap is 64K, each '1' bit means that a 64K region as a whole may have
+changed in some way, possibly by as little as one byte.
+
+Smaller granularities mean more accurate tracking of modified disk data,=
 but
+requires more computational overhead and larger bitmap sizes. Larger
+granularities mean smaller bitmap sizes, but less targeted backups.
+
+The size of a bitmap (in bytes) can be computed as such:
+    ``size`` =3D ceil(ceil(``image_size`` / ``granularity``) / 8)
+
+e.g. the size of a 64KiB granularity bitmap on a 2TiB image is:
+    ``size`` =3D ((2147483648K / 64K) / 8)
+         =3D 4194304B =3D 4MiB.
+
+QEMU uses these bitmaps when making incremental backups to know which se=
ctions
+of the file to copy out. They are not enabled by default and must be
+explicitly added in order to begin tracking writes.
+
+Bitmaps can be created at any time and can be attached to any arbitrary =
block
+node in the storage graph, but are most useful conceptually when attache=
d to
+the root node attached to the guest's storage device model.
+
+That is to say: It's likely most useful to track the guest's writes to d=
isk,
+but you could theoretically track things like qcow2 metadata changes by
+attaching the bitmap elsewhere in the storage graph. This is beyond the =
scope
+of this document.
+
+QEMU supports persisting these bitmaps to disk via the qcow2 image forma=
t.
+Bitmaps which are stored or loaded in this way are called "persistent",
+whereas bitmaps that are not are called "transient".
+
+QEMU also supports the migration of both transient bitmaps (tracking any
+arbitrary image format) or persistent bitmaps (qcow2) via live migration=
.
+
+Supported Image Formats
+-----------------------
+
+QEMU supports all documented features below on the qcow2 image format.
+
+However, qcow2 is only strictly necessary for the persistence feature, w=
hich
+writes bitmap data to disk upon close. If persistence is not required fo=
r a
+specific use case, all bitmap features excepting persistence are availab=
le for
+any arbitrary image format.
+
+For example, Dirty Bitmaps can be combined with the 'raw' image format, =
but
+any changes to the bitmap will be discarded upon exit.
+
+.. warning:: Transient bitmaps will not be saved on QEMU exit! Persisten=
t
+             bitmaps are available only on qcow2 images.
+
 Dirty Bitmap Names
 ------------------
=20
--  A dirty bitmap's name is unique to the node, but bitmaps attached to
-   different nodes can share the same name.
+Bitmap objects need a method to reference them in the API. All API-creat=
ed and
+managed bitmaps have a human-readable name chosen by the user at creatio=
n
+time.
=20
--  Dirty bitmaps created for internal use by QEMU may be anonymous and
-   have no name, but any user-created bitmaps must have a name. There
-   can be any number of anonymous bitmaps per node.
+- A bitmap's name is unique to the node, but bitmaps attached to differe=
nt
+  nodes can share the same name. Therefore, all bitmaps are addressed vi=
a
+  their (node, name) pair.
=20
--  The name of a user-created bitmap must not be empty ("").
+- The name of a user-created bitmap cannot be empty ("").
=20
-Bitmap Modes
-------------
+- Transient bitmaps can have JSON unicode names that are effectively not
+  length limited. (QMP protocol may restrict messages to less than 64MiB=
.)
=20
--  A bitmap can be "frozen," which means that it is currently in-use by
-   a backup operation and cannot be deleted, renamed, written to, reset,
-   etc.
+- Persistent storage formats may impose their own requirements on bitmap=
 names
+  and namespaces. Presently, only qcow2 supports persistent bitmaps. See
+  docs/interop/qcow2.txt for more details on restrictions. Notably:
=20
--  The normal operating mode for a bitmap is "active."
+   - qcow2 bitmap names are limited to between 1 and 1023 bytes long.
+
+   - No two bitmaps saved to the same qcow2 file may share the same name=
.
+
+- QEMU occasionally uses bitmaps for internal use which have no name. Th=
ey are
+  hidden from API query calls, cannot be manipulated by the external API=
, are
+  never persistent, nor ever migrated.
+
+Bitmap Status
+-------------
+
+Dirty Bitmap objects can be queried with the QMP command `query-block
+<qemu-qmp-ref.html#index-query_002dblock>`_, and are visible via the
+`BlockDirtyInfo <qemu-qmp-ref.html#index-BlockDirtyInfo>`_ QAPI structur=
e.
+
+This struct shows the name, granularity, and dirty byte count for each b=
itmap.
+Additionally, it shows several boolean status indicators:
+
+- ``recording``: This bitmap is recording writes.
+- ``busy``: This bitmap is in-use by an operation.
+- ``persistent``: This bitmap is a persistent type.
+- ``inconsistent``: This bitmap is corrupted and cannot be used.
+
+The ``+busy`` status prohibits you from deleting, clearing, or otherwise
+modifying a bitmap, and happens when the bitmap is being used for a back=
up
+operation or is in the process of being loaded from a migration. Many of=
 the
+commands documented below will refuse to work on such bitmaps.
+
+The ``+inconsistent`` status similarly prohibits almost all operations,
+notably allowing only the ``block-dirty-bitmap-remove`` operation.
+
+There is also a deprecated ``status`` field of type `DirtyBitmapStatus
+<qemu-qmp-ref.html#index-DirtyBitmapStatus>`_. A bitmap historically had
+five visible states:
+
+   #. ``Frozen``: This bitmap is currently in-use by an operation and is
+      immutable. It can't be deleted, renamed, reset, etc.
+
+      (This is now ``+busy``.)
+
+   #. ``Disabled``: This bitmap is not recording new writes.
+
+      (This is now ``-recording -busy``.)
+
+   #. ``Active``: This bitmap is recording new writes.
+
+      (This is now ``+recording -busy``.)
+
+   #. ``Locked``: This bitmap is in-use by an operation, and is immutabl=
e.
+      The difference from "Frozen" was primarily implementation details.
+
+      (This is now ``+busy``.)
+
+   #. ``Inconsistent``: This persistent bitmap was not saved to disk
+      correctly, and can no longer be used. It remains in memory to serv=
e as
+      an indicator of failure.
+
+      (This is now ``+inconsistent``.)
+
+These states are directly replaced by the status indicators and should n=
ot be
+used. The difference between ``Frozen`` and ``Locked`` is an implementat=
ion
+detail and should not be relevant to external users.
=20
 Basic QMP Usage
 ---------------
=20
+The primary interface to manipulating bitmap objects is via the QMP
+interface. If you are not familiar, see docs/interop/qmp-intro.txt for a=
 broad
+overview, and `qemu-qmp-ref <qemu-qmp-ref.html>`_ for a full reference o=
f all
+QMP commands.
+
 Supported Commands
 ~~~~~~~~~~~~~~~~~~
=20
+There are six primary bitmap-management API commands:
+
 - ``block-dirty-bitmap-add``
 - ``block-dirty-bitmap-remove``
 - ``block-dirty-bitmap-clear``
+- ``block-dirty-bitmap-disable``
+- ``block-dirty-bitmap-enable``
+- ``block-dirty-bitmap-merge``
=20
-Creation
-~~~~~~~~
+And one related query command:
=20
--  To create a new bitmap, enabled, on the drive with id=3Ddrive0:
+- ``query-block``
=20
-.. code:: json
+Creation: block-dirty-bitmap-add
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-    { "execute": "block-dirty-bitmap-add",
-      "arguments": {
-        "node": "drive0",
-        "name": "bitmap0"
-      }
-    }
+`block-dirty-bitmap-add
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002dadd>`_:
=20
--  This bitmap will have a default granularity that matches the cluster
-   size of its associated drive, if available, clamped to between [4KiB,
-   64KiB]. The current default for qcow2 is 64KiB.
+Creates a new bitmap that tracks writes to the specified node. granulari=
ty,
+persistence, and recording state can be adjusted at creation time.
=20
--  To create a new bitmap that tracks changes in 32KiB segments:
+.. admonition:: Example
=20
-.. code:: json
+ to create a new, actively recording persistent bitmap:
=20
-    { "execute": "block-dirty-bitmap-add",
-      "arguments": {
-        "node": "drive0",
-        "name": "bitmap0",
-        "granularity": 32768
-      }
-    }
+ .. code:: json
=20
-Deletion
-~~~~~~~~
+  -> { "execute": "block-dirty-bitmap-add",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap0",
+         "persistent": true,
+       }
+     }
=20
--  Bitmaps that are frozen cannot be deleted.
+  <- { "return": {} }
=20
--  Deleting the bitmap does not impact any other bitmaps attached to the
-   same node, nor does it affect any backups already created from this
-   node.
+- This bitmap will have a default granularity that matches the cluster s=
ize of
+  its associated drive, if available, clamped to between [4KiB, 64KiB]. =
The
+  current default for qcow2 is 64KiB.
=20
--  Because bitmaps are only unique to the node to which they are
-   attached, you must specify the node/drive name here, too.
+.. admonition:: Example
=20
-.. code:: json
+ To create a new, disabled (``-recording``), transient bitmap that track=
s
+ changes in 32KiB segments:
=20
-    { "execute": "block-dirty-bitmap-remove",
-      "arguments": {
-        "node": "drive0",
-        "name": "bitmap0"
-      }
-    }
+ .. code:: json
=20
-Resetting
-~~~~~~~~~
+  -> { "execute": "block-dirty-bitmap-add",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap1",
+         "granularity": 32768,
+         "disabled": true
+       }
+     }
=20
--  Resetting a bitmap will clear all information it holds.
+  <- { "return": {} }
=20
--  An incremental backup created from an empty bitmap will copy no data,
-   as if nothing has changed.
+Deletion: block-dirty-bitmap-remove
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-.. code:: json
+`block-dirty-bitmap-remove
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002dremove>`_:
=20
-    { "execute": "block-dirty-bitmap-clear",
-      "arguments": {
-        "node": "drive0",
-        "name": "bitmap0"
-      }
-    }
+Deletes a bitmap. Bitmaps that are ``+busy`` cannot be removed.
+
+- Deleting a bitmap does not impact any other bitmaps attached to the sa=
me
+  node, nor does it affect any backups already created from this bitmap =
or
+  node.
+
+- Because bitmaps are only unique to the node to which they are attached=
, you
+  must specify the node/drive name here, too.
+
+- Deleting a persistent bitmap will remove it from the qcow2 file.
+
+.. admonition:: Example
+
+ Remove a bitmap named ``bitmap0`` from node ``drive0``:
+
+ .. code:: json
+
+  -> { "execute": "block-dirty-bitmap-remove",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap0"
+       }
+     }
+
+  <- { "return": {} }
+
+Resetting: block-dirty-bitmap-clear
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+`block-dirty-bitmap-clear
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002dclear>`_:
+
+Clears all dirty bits from a bitmap. ``+busy`` bitmaps cannot be cleared=
.
+
+- An incremental backup created from an empty bitmap will copy no data, =
as if
+  nothing has changed.
+
+.. admonition:: Example
+
+ Clear all dirty bits from bitmap ``bitmap0`` on node ``drive0``:
+
+ .. code:: json
+
+  -> { "execute": "block-dirty-bitmap-clear",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap0"
+       }
+     }
+
+  <- { "return": {} }
+
+Enabling: block-dirty-bitmap-enable
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+`block-dirty-bitmap-enable
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002denable>`_:
+
+"Enables" a bitmap, setting the ``recording`` bit to true, causing write=
s to
+begin being recorded. ``+busy`` bitmaps cannot be enabled.
+
+- Bitmaps default to being enabled when created, unless configured other=
wise.
+
+- Persistent enabled bitmaps will remember their ``+recording`` status o=
n
+  load.
+
+.. admonition:: Example
+
+ To set ``+recording`` on bitmap ``bitmap0`` on node ``drive0``:
+
+ .. code:: json
+
+  -> { "execute": "block-dirty-bitmap-enable",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap0"
+       }
+     }
+
+  <- { "return": {} }
+
+Enabling: block-dirty-bitmap-disable
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+`block-dirty-bitmap-disable
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002ddisable>`_:
+
+"Disables" a bitmap, setting the ``recording`` bit to false, causing fur=
ther
+writes to begin being ignored. ``+busy`` bitmaps cannot be disabled.
+
+.. warning::
+
+  This is potentially dangerous: QEMU makes no effort to stop any writes=
 if
+  there are disabled bitmaps on a node, and will not mark any disabled b=
itmaps
+  as ``+inconsistent`` if any such writes do happen. Backups made from s=
uch
+  bitmaps will not be able to be used to reconstruct a coherent image.
+
+- Disabling a bitmap may be useful for examining which sectors of a disk
+  changed during a specific time period, or for explicit management of
+  differential backup windows.
+
+- Persistent disabled bitmaps will remember their ``-recording`` status =
on
+  load.
+
+.. admonition:: Example
+
+ To set ``-recording`` on bitmap ``bitmap0`` on node ``drive0``:
+
+ .. code:: json
+
+  -> { "execute": "block-dirty-bitmap-disable",
+       "arguments": {
+         "node": "drive0",
+         "name": "bitmap0"
+       }
+     }
+
+  <- { "return": {} }
+
+Merging, Copying: block-dirty-bitmap-merge
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+`block-dirty-bitmap-merge
+<qemu-qmp-ref.html#index-block_002ddirty_002dbitmap_002dmerge>`_:
+
+Merges one or more bitmaps into a target bitmap. For any segment that is=
 dirty
+in any one source bitmap, the target bitmap will mark that segment dirty=
.
+
+- Merge takes one or more bitmaps as a source and merges them together i=
nto a
+  single destination, such that any segment marked as dirty in any sourc=
e
+  bitmap(s) will be marked dirty in the destination bitmap.
+
+- Merge does not create the destination bitmap if it does not exist. A b=
lank
+  bitmap can be created beforehand to achieve the same effect.
+
+- The destination is not cleared prior to merge, so subsequent merge
+  operations will continue to cumulatively mark more segments as dirty.
+
+- If the merge operation should fail, the destination bitmap is guarante=
ed to
+  be unmodified. The operation may fail if the source or destination bit=
maps
+  are busy, or have different granularities.
+
+- Bitmaps can only be merged on the same node. There is only one "node"
+  argument, so all bitmaps must be attached to that same node.
+
+- Copy can be achieved by merging from a single source to an empty
+  destination.
+
+.. admonition:: Example
+
+ Merge the data from ``bitmap0`` into the bitmap ``new_bitmap`` on node
+ ``drive0``. If ``new_bitmap`` was empty prior to this command, this ach=
ieves
+ a copy.
+
+ .. code:: json
+
+  -> { "execute": "block-dirty-bitmap-merge",
+       "arguments": {
+         "node": "drive0",
+         "target": "new_bitmap",
+         "bitmaps: [ "bitmap0" ]
+       }
+     }
+
+  <- { "return": {} }
+
+Querying: query-block
+~~~~~~~~~~~~~~~~~~~~~
+
+`query-block
+<qemu-qmp-ref.html#index-query_002dblock>`_:
+
+Not strictly a bitmaps command, but will return information about any bi=
tmaps
+attached to nodes serving as the root for guest devices.
+
+- The "inconsistent" bit will not appear when it is false, appearing onl=
y when
+  the value is true to indicate there is a problem.
+
+.. admonition:: Example
+
+ Query the block sub-system of QEMU. The following json has trimmed irre=
levant
+ keys from the response to highlight only the bitmap-relevant portions o=
f the
+ API. This result highlights a bitmap ``bitmap0`` attached to the root n=
ode of
+ device ``drive0``.
+
+ .. code:: json
+
+  -> {
+       "execute": "query-block",
+       "arguments": {}
+     }
+
+  <- {
+       "return": [ {
+         "dirty-bitmaps": [ {
+           "status": "active",
+           "count": 0,
+           "busy": false,
+           "name": "bitmap0",
+           "persistent": false,
+           "recording": true,
+           "granularity": 65536
+         } ],
+         "device": "drive0",
+       } ]
+     }
+
+Bitmap Persistence
+------------------
+
+As outlined in `Supported Image Formats`_, QEMU can persist bitmaps to q=
cow2
+files. Demonstrated in `Creation: block-dirty-bitmap-add`_, passing
+``persistent: true`` to ``block-dirty-bitmap-add`` will persist that bit=
map to
+disk.
+
+Persistent bitmaps will be automatically loaded into memory upon load, a=
nd
+will be written back to disk upon close. Their usage should be mostly
+transparent.
+
+However, if QEMU does not get a chance to close the file cleanly, the bi=
tmap
+will be marked as ``+inconsistent`` at next load and considered unsafe t=
o use
+for any operation. At this point, the only valid operation on such bitma=
ps is
+``block-dirty-bitmap-remove``.
+
+Losing a bitmap in this way does not invalidate any existing backups tha=
t have
+been made from this bitmap, but no further backups will be able to be is=
sued
+for this chain.
=20
 Transactions
 ------------
=20
+Transactions are a QMP feature that allows you to submit multiple QMP co=
mmands
+at once, being guaranteed that they will all succeed or fail atomically,
+together. The interaction of bitmaps and transactions are demonstrated b=
elow.
+
+See `transaction <qemu-qmp.ref.html#index-transaction>`_ in the QMP refe=
rence
+for more details.
+
 Justification
 ~~~~~~~~~~~~~
=20
-Bitmaps can be safely modified when the VM is paused or halted by using
-the basic QMP commands. For instance, you might perform the following
-actions:
+Bitmaps can generally be modified at any time, but certain operations of=
ten
+only make sense when paired directly with other commands. When a VM is p=
aused,
+it's easy to ensure that no guest writes occur between individual QMP
+commands. When a VM is running, this is difficult to accomplish with
+individual QMP commands that may allow guest writes to occur inbetween e=
ach
+command.
=20
-1. Boot the VM in a paused state.
-2. Create a full drive backup of drive0.
-3. Create a new bitmap attached to drive0.
-4. Resume execution of the VM.
-5. Incremental backups are ready to be created.
+For example, using only individual QMP commands, we could:
=20
-At this point, the bitmap and drive backup would be correctly in sync,
-and incremental backups made from this point forward would be correctly
-aligned to the full drive backup.
+#. Boot the VM in a paused state.
+#. Create a full drive backup of drive0.
+#. Create a new bitmap attached to drive0, confident that nothing has be=
en
+   written to drive0 in the meantime.
+#. Resume execution of the VM.
+#. At a later point, issue incremental backups from ``bitmap0``.
=20
-This is not particularly useful if we decide we want to start
-incremental backups after the VM has been running for a while, for which
-we will need to perform actions such as the following:
+At this point, the bitmap and drive backup would be correctly in sync, a=
nd
+incremental backups made from this point forward would be correctly alig=
ned to
+the full drive backup.
=20
-1. Boot the VM and begin execution.
-2. Using a single transaction, perform the following operations:
+This is not particularly useful if we decide we want to start incrementa=
l
+backups after the VM has been running for a while, for which we would wa=
nt to
+perform actions such as the following:
+
+#. Boot the VM and begin execution.
+#. Using a single transaction, perform the following operations:
=20
    -  Create ``bitmap0``.
    -  Create a full drive backup of ``drive0``.
=20
-3. Incremental backups are now ready to be created.
+#. At a later point, issue incremental backups from ``bitmap0``.
+
+.. note:: As a consideration, if ``bitmap0`` is created prior to the ful=
l
+          drive backup, incremental backups can still be authored from t=
his
+          bitmap, but they will copy extra segments reflecting writes th=
at
+          occurred prior to the backup operation. Transactions allow us =
to
+          narrow critical points in time to reduce waste, or, in the oth=
er
+          direction, to ensure that no segments are omitted.
=20
 Supported Bitmap Transactions
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 -  ``block-dirty-bitmap-add``
 -  ``block-dirty-bitmap-clear``
+-  ``block-dirty-bitmap-enable``
+-  ``block-dirty-bitmap-disable``
+-  ``block-dirty-bitmap-merge``
=20
-The usages are identical to their respective QMP commands, but see below
-for examples.
+The usages for these commands are identical to their respective QMP comm=
ands,
+but see the sections below for concrete examples.
=20
-Example: New Incremental Backup
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Incremental Backups - Push Model
+--------------------------------
=20
-As outlined in the justification, perhaps we want to create a new
-incremental backup chain attached to a drive.
+Incremental backups are simply partial disk images that can be combined =
with
+other partial disk images on top of a base image to reconstruct a full b=
ackup
+from the point in time at which the incremental backup was issued.
=20
-.. code:: json
+The "Push Model" here references the fact that QEMU is "pushing" the mod=
ified
+blocks out to a destination. We will be using the `drive-backup
+<qemu-qmp-ref.html#index-drive_002dbackup>`_ and `blockdev-backup
+<qemu-qmp-ref.html#index-blockdev_002dbackup>`_ QMP commands to create b=
oth
+full and incremental backups.
=20
-    { "execute": "transaction",
-      "arguments": {
-        "actions": [
-          {"type": "block-dirty-bitmap-add",
-           "data": {"node": "drive0", "name": "bitmap0"} },
-          {"type": "drive-backup",
-           "data": {"device": "drive0", "target": "/path/to/full_backup.=
img",
-                    "sync": "full", "format": "qcow2"} }
-        ]
-      }
-    }
+Both of these commands are jobs, which have their own QMP API for queryi=
ng and
+management documented in `Background jobs
+<qemu-qmp-ref.html#Background-jobs>`_.
=20
 Example: New Incremental Backup Anchor Point
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-Maybe we just want to create a new full backup with an existing bitmap
-and want to reset the bitmap to track the new chain.
+As outlined in the Transactions - `Justification`_ section, perhaps we w=
ant to
+create a new incremental backup chain attached to a drive.
+
+This example creates a new, full backup of "drive0" and accompanies it w=
ith a
+new, empty bitmap that records writes from this point in time forward.
+
+.. note:: Any new writes that happen after this command is issued, even =
while
+          the backup job runs, will be written locally and not to the ba=
ckup
+          destination. These writes will be recorded in the bitmap
+          accordingly.
+
+.. code:: json
+
+  -> {
+       "execute": "transaction",
+       "arguments": {
+         "actions": [
+           {
+             "type": "block-dirty-bitmap-add",
+             "data": {
+               "node": "drive0",
+               "name": "bitmap0"
+             }
+           },
+           {
+             "type": "drive-backup",
+             "data": {
+               "device": "drive0",
+               "target": "/path/to/drive0.full.qcow2",
+               "sync": "full",
+               "format": "qcow2"
+             }
+           }
+         ]
+       }
+     }
+
+  <- { "return": {} }
+
+  <- {
+       "timestamp": {
+         "seconds": 1555436945,
+         "microseconds": 179620
+       },
+       "data": {
+         "status": "created",
+         "id": "drive0"
+       },
+       "event": "JOB_STATUS_CHANGE"
+     }
+
+  ...
+
+  <- {
+       "timestamp": {...},
+       "data": {
+         "device": "drive0",
+         "type": "backup",
+         "speed": 0,
+         "len": 68719476736,
+         "offset": 68719476736
+       },
+       "event": "BLOCK_JOB_COMPLETED"
+     }
+
+  <- {
+       "timestamp": {...},
+       "data": {
+         "status": "concluded",
+         "id": "drive0"
+       },
+       "event": "JOB_STATUS_CHANGE"
+     }
+
+  <- {
+       "timestamp": {...},
+       "data": {
+         "status": "null",
+         "id": "drive0"
+       },
+       "event": "JOB_STATUS_CHANGE"
+     }
+
+A full explanation of the job transition semantics and the JOB_STATUS_CH=
ANGE
+event are beyond the scope of this document and will be omitted in all
+subsequent examples; above, several more events have been omitted for br=
evity.
+
+.. note:: Subsequent examples will omit all events except BLOCK_JOB_COMP=
LETED
+          except where necessary to illustrate workflow differences.
+
+          Omitted events and json objects will be represented by ellipse=
s:
+          ``...``
+
+Example: Resetting an Incremental Backup Anchor Point
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If we want to start a new backup chain with an existing bitmap, we can a=
lso
+use a transaction to reset the bitmap while making a new full backup:
=20
 .. code:: json
=20
-    { "execute": "transaction",
-      "arguments": {
-        "actions": [
-          {"type": "block-dirty-bitmap-clear",
-           "data": {"node": "drive0", "name": "bitmap0"} },
-          {"type": "drive-backup",
-           "data": {"device": "drive0", "target": "/path/to/new_full_bac=
kup.img",
-                    "sync": "full", "format": "qcow2"} }
-        ]
-      }
-    }
-
-Incremental Backups
--------------------
-
-The star of the show.
-
-**Nota Bene!** Only incremental backups of entire drives are supported
-for now. So despite the fact that you can attach a bitmap to any
-arbitrary node, they are only currently useful when attached to the root
-node. This is because drive-backup only supports drives/devices instead
-of arbitrary nodes.
+  -> {
+       "execute": "transaction",
+       "arguments": {
+         "actions": [
+         {
+           "type": "block-dirty-bitmap-clear",
+           "data": {
+             "node": "drive0",
+             "name": "bitmap0"
+           }
+         },
+         {
+           "type": "drive-backup",
+           "data": {
+             "device": "drive0",
+             "target": "/path/to/drive0.new_full.qcow2",
+             "sync": "full",
+             "format": "qcow2"
+           }
+         }
+       ]
+     }
+   }
+
+  <- { "return": {} }
+
+  ...
+
+  <- {
+       "timestamp": {...},
+       "data": {
+         "device": "drive0",
+         "type": "backup",
+         "speed": 0,
+         "len": 68719476736,
+         "offset": 68719476736
+       },
+       "event": "BLOCK_JOB_COMPLETED"
+     }
+
+  ...
+
+The result of this example is identical to the first, but we clear an ex=
isting
+bitmap instead of adding a new one.
+
+.. tip:: In both of these examples, "bitmap0" is tied conceptually to th=
e
+         creation of new, full backups. This relationship is not saved o=
r
+         remembered by QEMU; it is up to the operator or management laye=
r to
+         remember which bitmaps are associated with which backups.
=20
 Example: First Incremental Backup
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-1. Create a full backup and sync it to the dirty bitmap, as in the
-   transactional examples above; or with the VM offline, manually create
-   a full copy and then create a new bitmap before the VM begins
-   execution.
+#. Create a full backup and sync it to a dirty bitmap using any method:
=20
-   -  Let's assume the full backup is named ``full_backup.img``.
-   -  Let's assume the bitmap you created is ``bitmap0`` attached to
-      ``drive0``.
+   - Either of the two live backup method demonstrated above,
+   - Using QMP commands with the VM paused as in the `Justification`_ se=
ction,
+     or
+   - With the VM offline, manually copy the image and start the VM in a =
paused
+     state, careful to add a new bitmap before the VM begins execution.
=20
-2. Create a destination image for the incremental backup that utilizes
-   the full backup as a backing image.
+   Whichever method is chosen, let's assume that at the end of this step=
:
=20
-   -  Let's assume the new incremental image is named
-      ``incremental.0.img``.
+   - The full backup is named ``drive0.full.qcow2``.
+   - The bitmap we created is named ``bitmap0``, attached to ``drive0``.
+
+#. Create a destination image for the incremental backup that utilizes t=
he
+   full backup as a backing image.
+
+   - Let's assume the new incremental image is named ``drive0.inc0.qcow2=
``:
=20
    .. code:: bash
=20
-       $ qemu-img create -f qcow2 incremental.0.img -b full_backup.img -=
F qcow2
+       $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
+         -b drive0.full.qcow2 -F qcow2
=20
-3. Issue the incremental backup command:
+#. Issue an incremental backup command:
=20
    .. code:: json
=20
-       { "execute": "drive-backup",
+    -> {
+         "execute": "drive-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "incremental.0.img",
+           "target": "drive0.inc0.qcow2",
            "format": "qcow2",
            "sync": "incremental",
            "mode": "existing"
          }
        }
=20
+    <- { "return": {} }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+This copies any blocks modified since the full backup was created into t=
he
+``drive0.inc0.qcow2`` file. During the operation, ``bitmap0`` is marked
+``+busy``. If the operation is successful, ``bitmap0`` will be cleared t=
o
+reflect the "incremental" backup regimen, which only copies out new chan=
ges
+from each incremental backup.
+
+.. note:: Any new writes that occur after the backup operation starts do=
 not
+          get copied to the destination. The backup's "point in time" is=
 when
+          the backup starts, not when it ends. These writes are recorded=
 in a
+          special bitmap that gets re-added to bitmap0 when the backup e=
nds so
+          that the next incremental backup can copy them out.
+
 Example: Second Incremental Backup
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-1. Create a new destination image for the incremental backup that points
-   to the previous one, e.g.: ``incremental.1.img``
+#. Create a new destination image for the incremental backup that points=
 to
+   the previous one, e.g.: ``drive0.inc1.qcow2``
=20
    .. code:: bash
=20
-       $ qemu-img create -f qcow2 incremental.1.img -b incremental.0.img=
 -F qcow2
+       $ qemu-img create -f qcow2 drive0.inc1.qcow2 \
+         -b drive0.inc0.qcow2 -F qcow2
=20
-2. Issue a new incremental backup command. The only difference here is
-   that we have changed the target image below.
+#. Issue a new incremental backup command. The only difference here is t=
hat we
+   have changed the target image below.
=20
    .. code:: json
=20
-       { "execute": "drive-backup",
+    -> {
+         "execute": "drive-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "incremental.1.img",
+           "target": "drive0.inc1.qcow2",
            "format": "qcow2",
            "sync": "incremental",
            "mode": "existing"
          }
        }
=20
-Errors
-------
+    <- { "return": {} }
=20
--  In the event of an error that occurs after a backup job is
-   successfully launched, either by a direct QMP command or a QMP
-   transaction, the user will receive a ``BLOCK_JOB_COMPLETE`` event wit=
h
-   a failure message, accompanied by a ``BLOCK_JOB_ERROR`` event.
+    ...
=20
--  In the case of an event being cancelled, the user will receive a
-   ``BLOCK_JOB_CANCELLED`` event instead of a pair of COMPLETE and ERROR
-   events.
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+Because the first incremental backup from the previous example completed
+successfully, ``bitmap0`` was synchronized with ``drive0.inc0.qcow2``. H=
ere,
+we use ``bitmap0`` again to create a new incremental backup that targets=
 the
+previous one, creating a chain of three images:
+
+.. admonition:: Diagram
+
+ .. code:: text
=20
--  In either case, the incremental backup data contained within the
-   bitmap is safely rolled back, and the data within the bitmap is not
-   lost. The image file created for the failed attempt can be safely
-   deleted.
+   +-------------------+   +-------------------+   +-------------------+
+   | drive0.full.qcow2 |<--| drive0.inc0.qcow2 |<--| drive0.inc1.qcow2 |
+   +-------------------+   +-------------------+   +-------------------+
=20
--  Once the underlying problem is fixed (e.g. more storage space is
-   freed up), you can simply retry the incremental backup command with
-   the same bitmap.
+Each new incremental backup re-synchronizes the bitmap to the latest bac=
kup
+authored, allowing a user to continue to "consume" it to create new back=
ups on
+top of an existing chain.
=20
-Example
-~~~~~~~
+In the above diagram, neither drive0.inc1.qcow2 nor drive0.inc0.qcow2 ar=
e
+complete images by themselves, but rely on their backing chain to recons=
truct
+a full image. The dependency terminates with each full backup.
=20
-1. Create a target image:
+Each backup in this chain remains independent, and is unchanged by new e=
ntries
+made later in the chain. For instance, drive0.inc0.qcow2 remains a perfe=
ctly
+valid backup of the disk as it was when that backup was issued.
+
+Example: Incremental Push Backups without Backing Files
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Backup images are best kept off-site, so we often will not have the prec=
eding
+backups in a chain available to link against. This is not a problem at b=
ackup
+time; we simply do not set the backing image when creating the destinati=
on
+image:
+
+#. Create a new destination image with no backing file set. We will need=
 to
+   specify the size of the base image, because the backing file isn't
+   available for QEMU to use to determine it.
=20
    .. code:: bash
=20
-       $ qemu-img create -f qcow2 incremental.0.img -b full_backup.img -=
F qcow2
+       $ qemu-img create -f qcow2 drive0.inc2.qcow2 64G
=20
-2. Attempt to create an incremental backup via QMP:
+   .. note:: Alternatively, you can omit ``mode: "existing"`` from the p=
ush
+             backup commands to have QEMU create an image without a back=
ing
+             file for you, but you lose control over format options like
+             compatibility and preallocation presets.
+
+#. Issue a new incremental backup command. Apart from the new destinatio=
n
+   image, there is no difference from the last two examples.
=20
    .. code:: json
=20
-       { "execute": "drive-backup",
+    -> {
+         "execute": "drive-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "incremental.0.img",
+           "target": "drive0.inc2.qcow2",
            "format": "qcow2",
            "sync": "incremental",
            "mode": "existing"
          }
        }
=20
-3. Receive an event notifying us of failure:
+    <- { "return": {} }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+The only difference from the perspective of the user is that you will ne=
ed to
+set the backing image when attempting to restore the backup:
+
+.. code:: bash
+
+    $ qemu-img rebase drive0.inc2.qcow2 \
+      -u -b drive0.inc1.qcow2
+
+This uses the "unsafe" rebase mode to simply set the backing file to a f=
ile
+that isn't present.
+
+It is also possible to use ``--image-opts`` to specify the entire backin=
g
+chain by hand as an ephemeral property at runtime, but that is beyond th=
e
+scope of this document.
+
+Example: Multi-drive Incremental Backup
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Assume we have a VM with two drives, "drive0" and "drive1" and we wish t=
o back
+both of them up such that the two backups represent the same crash-consi=
stent
+point in time.
+
+#. For each drive, create an empty image:
+
+   .. code:: bash
+
+    $ qemu-img create -f qcow2 drive0.full.qcow2 64G
+    $ qemu-img create -f qcow2 drive1.full.qcow2 64G
+
+#. Create a full (anchor) backup for each drive, with accompanying bitma=
ps:
+
+   .. code:: json
+
+    -> {
+         "execute": "transaction",
+         "arguments": {
+           "actions": [
+             {
+               "type": "block-dirty-bitmap-add",
+               "data": {
+                 "node": "drive0",
+                 "name": "bitmap0"
+               }
+             },
+             {
+               "type": "block-dirty-bitmap-add",
+               "data": {
+                 "node": "drive1",
+                 "name": "bitmap0"
+               }
+             },
+             {
+               "type": "drive-backup",
+               "data": {
+                 "device": "drive0",
+                 "target": "/path/to/drive0.full.qcow2",
+                 "sync": "full",
+                 "format": "qcow2"
+               }
+             },
+             {
+               "type": "drive-backup",
+               "data": {
+                 "device": "drive1",
+                 "target": "/path/to/drive1.full.qcow2",
+                 "sync": "full",
+                 "format": "qcow2"
+               }
+             }
+           ]
+         }
+       }
+
+    <- { "return": {} }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive1",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+#. Later, create new destination images for each of the incremental back=
ups
+   that point to their respective full backups:
+
+   .. code:: bash
+
+     $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
+       -b drive0.full.qcow2 -F qcow2
+     $ qemu-img create -f qcow2 drive1.inc0.qcow2 \
+       -b drive1.full.qcow2 -F qcow2
+
+#. Issue a multi-drive incremental push backup transaction:
=20
    .. code:: json
=20
-       { "timestamp": { "seconds": 1424709442, "microseconds": 844524 },
-         "data": { "speed": 0, "offset": 0, "len": 67108864,
-                   "error": "No space left on device",
-                   "device": "drive1", "type": "backup" },
-         "event": "BLOCK_JOB_COMPLETED" }
+    -> {
+         "execute": "transaction",
+         "arguments": {
+           "actions": [
+             {
+               "type": "drive-backup",
+               "data": {
+                 "device": "drive0",
+                 "bitmap": "bitmap0",
+                 "format": "qcow2",
+                 "mode": "existing",
+                 "sync": "incremental",
+                 "target": "drive0.inc0.qcow2"
+               }
+             },
+             {
+               "type": "drive-backup",
+               "data": {
+                 "device": "drive1",
+                 "bitmap": "bitmap0",
+                 "format": "qcow2",
+                 "mode": "existing",
+                 "sync": "incremental",
+                 "target": "drive1.inc0.qcow2"
+               }
+             },
+           ]
+         }
+       }
+
+    <- { "return": {} }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive1",
+           "type": "backup",
+           "speed": 0,
+           "len": 68719476736,
+           "offset": 68719476736
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+    ...
+
+Push Backup Errors & Recovery
+-----------------------------
+
+In the event of an error that occurs after a push backup job is successf=
ully
+launched, either by an individual QMP command or a QMP transaction, the =
user
+will receive a ``BLOCK_JOB_COMPLETE`` event with a failure message,
+accompanied by a ``BLOCK_JOB_ERROR`` event.
+
+In the case of a job being cancelled, the user will receive a
+``BLOCK_JOB_CANCELLED`` event instead of a pair of COMPLETE and ERROR
+events.
+
+In either failure case, the bitmap used for the failed operation is not
+cleared. It will contain all of the dirty bits it did at the start of th=
e
+operation, plus any new bits that got marked during the operation.
+
+Effectively, the "point in time" that a bitmap is recording differences
+against is kept at the issuance of the last successful incremental backu=
p,
+instead of being moved forward to the start of this now-failed backup.
+
+Once the underlying problem is addressed (e.g. more storage space is all=
ocated
+on the destination), the incremental backup command can be retried with =
the
+same bitmap.
+
+Example: Individual Failures
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Incremental Push Backup jobs that fail individually behave simply as
+described above. This example demonstrates the single-job failure case:
+
+#. Create a target image:
+
+   .. code:: bash
+
+       $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
+         -b drive0.full.qcow2 -F qcow2
+
+#. Attempt to create an incremental backup via QMP:
+
+   .. code:: json
+
+    -> {
+         "execute": "drive-backup",
+         "arguments": {
+           "device": "drive0",
+           "bitmap": "bitmap0",
+           "target": "drive0.inc0.qcow2",
+           "format": "qcow2",
+           "sync": "incremental",
+           "mode": "existing"
+         }
+       }
+
+    <- { "return": {} }
+
+#. Receive a pair of events indicating failure:
+
+   .. code:: json
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "action": "report",
+           "operation": "write"
+         },
+         "event": "BLOCK_JOB_ERROR"
+       }
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "speed": 0,
+           "offset": 0,
+           "len": 67108864,
+           "error": "No space left on device",
+           "device": "drive0",
+           "type": "backup"
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
=20
-4. Delete the failed incremental, and re-create the image.
+#. Delete the failed image, and re-create it.
=20
    .. code:: bash
=20
-       $ rm incremental.0.img
-       $ qemu-img create -f qcow2 incremental.0.img -b full_backup.img -=
F qcow2
+       $ rm drive0.inc0.qcow2
+       $ qemu-img create -f qcow2 drive0.inc0.qcow2 \
+         -b drive0.full.qcow2 -F qcow2
=20
-5. Retry the command after fixing the underlying problem, such as
+#. Retry the command after fixing the underlying problem, such as
    freeing up space on the backup volume:
=20
    .. code:: json
=20
-       { "execute": "drive-backup",
+    -> {
+         "execute": "drive-backup",
          "arguments": {
            "device": "drive0",
            "bitmap": "bitmap0",
-           "target": "incremental.0.img",
+           "target": "drive0.inc0.qcow2",
            "format": "qcow2",
            "sync": "incremental",
            "mode": "existing"
          }
        }
=20
-6. Receive confirmation that the job completed successfully:
+    <- { "return": {} }
=20
-   .. code:: json
-
-       { "timestamp": { "seconds": 1424709668, "microseconds": 526525 },
-         "data": { "device": "drive1", "type": "backup",
-                   "speed": 0, "len": 67108864, "offset": 67108864},
-         "event": "BLOCK_JOB_COMPLETED" }
-
-Partial Transactional Failures
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
--  Sometimes, a transaction will succeed in launching and return
-   success, but then later the backup jobs themselves may fail. It is
-   possible that a management application may have to deal with a
-   partial backup failure after a successful transaction.
+#. Receive confirmation that the job completed successfully:
=20
--  If multiple backup jobs are specified in a single transaction, when
-   one of them fails, it will not interact with the other backup jobs in
-   any way.
-
--  The job(s) that succeeded will clear the dirty bitmap associated with
-   the operation, but the job(s) that failed will not. It is not "safe"
-   to delete any incremental backups that were created successfully in
-   this scenario, even though others failed.
-
-Example
-^^^^^^^
+   .. code:: json
=20
--  QMP example highlighting two backup jobs:
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 67108864,
+           "offset": 67108864
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+Example: Partial Transactional Failures
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+QMP commands like `drive-backup <qemu-qmp-ref.html#index-drive_002dbacku=
p>`_
+conceptually only start a job, and so transactions containing these comm=
ands
+may succeed even if the job it created later fails. This might have surp=
rising
+interactions with notions of how a "transaction" ought to behave.
+
+This distinction means that on occasion, a transaction containing such j=
ob
+launching commands may appear to succeed and return success, but later
+individual jobs associated with the transaction may fail. It is possible=
 that
+a management application may have to deal with a partial backup failure =
after
+a "successful" transaction.
+
+If multiple backup jobs are specified in a single transaction, if one of=
 those
+jobs fails, it will not interact with the other backup jobs in any way b=
y
+default. The job(s) that succeeded will clear the dirty bitmap associate=
d with
+the operation, but the job(s) that failed will not. It is therefore not =
safe
+to delete any incremental backups that were created successfully in this
+scenario, even though others failed.
+
+This example illustrates a transaction with two backup jobs, where one f=
ails
+and one succeeds:
+
+#. Issue the transaction to start a backup of both drives.
=20
    .. code:: json
=20
-       { "execute": "transaction",
+    -> {
+         "execute": "transaction",
          "arguments": {
            "actions": [
-             { "type": "drive-backup",
-               "data": { "device": "drive0", "bitmap": "bitmap0",
-                         "format": "qcow2", "mode": "existing",
-                         "sync": "incremental", "target": "d0-incr-1.qco=
w2" } },
-             { "type": "drive-backup",
-               "data": { "device": "drive1", "bitmap": "bitmap1",
-                         "format": "qcow2", "mode": "existing",
-                         "sync": "incremental", "target": "d1-incr-1.qco=
w2" } },
-           ]
+           {
+             "type": "drive-backup",
+             "data": {
+               "device": "drive0",
+               "bitmap": "bitmap0",
+               "format": "qcow2",
+               "mode": "existing",
+               "sync": "incremental",
+               "target": "drive0.inc0.qcow2"
+             }
+           },
+           {
+             "type": "drive-backup",
+             "data": {
+               "device": "drive1",
+               "bitmap": "bitmap0",
+               "format": "qcow2",
+               "mode": "existing",
+               "sync": "incremental",
+               "target": "drive1.inc0.qcow2"
+             }
+           }]
          }
        }
=20
--  QMP example response, highlighting one success and one failure:
+#. Receive notice that the Transaction was accepted, and jobs were
+   launched:
=20
-   -  Acknowledgement that the Transaction was accepted and jobs were
-      launched:
+   .. code:: json
+
+    <- { "return": {} }
+
+#. Receive notice that the first job has completed:
=20
-      .. code:: json
+   .. code:: json
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 67108864,
+           "offset": 67108864
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
=20
-          { "return": {} }
+#. Receive notice that the second job has failed:
=20
-   -  Later, QEMU sends notice that the first job was completed:
+   .. code:: json
=20
-      .. code:: json
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive1",
+           "action": "report",
+           "operation": "read"
+         },
+         "event": "BLOCK_JOB_ERROR"
+       }
=20
-          { "timestamp": { "seconds": 1447192343, "microseconds": 615698=
 },
-            "data": { "device": "drive0", "type": "backup",
-                       "speed": 0, "len": 67108864, "offset": 67108864 }=
,
-            "event": "BLOCK_JOB_COMPLETED"
-          }
+    ...
=20
-   -  Later yet, QEMU sends notice that the second job has failed:
+    <- {
+         "timestamp": {...},
+         "data": {
+           "speed": 0,
+           "offset": 0,
+           "len": 67108864,
+           "error": "Input/output error",
+           "device": "drive1",
+           "type": "backup"
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
=20
-      .. code:: json
+At the conclusion of the above example, ``drive0.inc0.qcow2`` is valid a=
nd
+must be kept, but ``drive1.inc0.qcow2`` is incomplete and should be
+deleted. If a VM-wide incremental backup of all drives at a point-in-tim=
e is
+to be made, new backups for both drives will need to be made, taking int=
o
+account that a new incremental backup for drive0 needs to be based on to=
p of
+``drive0.inc0.qcow2``.
=20
-          { "timestamp": { "seconds": 1447192399, "microseconds": 683015=
 },
-            "data": { "device": "drive1", "action": "report",
-                      "operation": "read" },
-            "event": "BLOCK_JOB_ERROR" }
+For this example, an incremental backup for ``drive0`` was created, but =
not
+for ``drive1``. The last VM-wide crash-consistent backup that is availab=
le in
+this case is the full backup:
=20
-      .. code:: json
+.. code:: text
=20
-          { "timestamp": { "seconds": 1447192399, "microseconds":
-          685853 }, "data": { "speed": 0, "offset": 0, "len": 67108864,
-          "error": "Input/output error", "device": "drive1", "type":
-          "backup" }, "event": "BLOCK_JOB_COMPLETED" }
+          [drive0.full.qcow2] <-- [drive0.inc0.qcow2]
+          [drive1.full.qcow2]
=20
--  In the above example, ``d0-incr-1.qcow2`` is valid and must be kept,
-   but ``d1-incr-1.qcow2`` is invalid and should be deleted. If a VM-wid=
e
-   incremental backup of all drives at a point-in-time is to be made,
-   new backups for both drives will need to be made, taking into account
-   that a new incremental backup for drive0 needs to be based on top of
-   ``d0-incr-1.qcow2``.
+To repair this, issue a new incremental backup across both drives. The r=
esult
+will be backup chains that resemble the following:
=20
-Grouped Completion Mode
-~~~~~~~~~~~~~~~~~~~~~~~
+.. code:: text
=20
--  While jobs launched by transactions normally complete or fail on
-   their own, it is possible to instruct them to complete or fail
-   together as a group.
+          [drive0.full.qcow2] <-- [drive0.inc0.qcow2] <-- [drive0.inc1.q=
cow2]
+          [drive1.full.qcow2] <-------------------------- [drive1.inc1.q=
cow2]
=20
--  QMP transactions take an optional properties structure that can
-   affect the semantics of the transaction.
+Example: Grouped Completion Mode
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
--  The "completion-mode" transaction property can be either "individual"
-   which is the default, legacy behavior described above, or "grouped,"
-   a new behavior detailed below.
+While jobs launched by transactions normally complete or fail individual=
ly,
+it's possible to instruct them to complete or fail together as a group. =
QMP
+transactions take an optional properties structure that can affect the
+behavior of the transaction.
=20
--  Delayed Completion: In grouped completion mode, no jobs will report
-   success until all jobs are ready to report success.
+The ``completion-mode`` transaction property can be either ``individual`=
`
+which is the default legacy behavior described above, or ``grouped``, de=
tailed
+below.
=20
--  Grouped failure: If any job fails in grouped completion mode, all
-   remaining jobs will be cancelled. Any incremental backups will
-   restore their dirty bitmap objects as if no backup command was ever
-   issued.
+In ``grouped`` completion mode, no jobs will report success until all jo=
bs are
+ready to report success. If any job fails, all other jobs will be cancel=
led.
=20
-   -  Regardless of if QEMU reports a particular incremental backup job
-      as CANCELLED or as an ERROR, the in-memory bitmap will be
-      restored.
+Regardless of if a participating incremental backup job failed or was
+cancelled, their associated bitmaps will all be held at their existing
+points-in-time, as in individual failure cases.
=20
-Example
-^^^^^^^
+Here's the same multi-drive backup scenario from `Example: Partial
+Transactional Failures`_, but with the ``grouped`` completion-mode prope=
rty
+applied:
=20
--  Here's the same example scenario from above with the new property:
+#. Issue the multi-drive incremental backup transaction:
=20
    .. code:: json
=20
-       { "execute": "transaction",
+    -> {
+         "execute": "transaction",
          "arguments": {
-           "actions": [
-             { "type": "drive-backup",
-               "data": { "device": "drive0", "bitmap": "bitmap0",
-                         "format": "qcow2", "mode": "existing",
-                         "sync": "incremental", "target": "d0-incr-1.qco=
w2" } },
-             { "type": "drive-backup",
-               "data": { "device": "drive1", "bitmap": "bitmap1",
-                         "format": "qcow2", "mode": "existing",
-                         "sync": "incremental", "target": "d1-incr-1.qco=
w2" } },
-           ],
            "properties": {
              "completion-mode": "grouped"
-           }
+           },
+           "actions": [
+           {
+             "type": "drive-backup",
+             "data": {
+               "device": "drive0",
+               "bitmap": "bitmap0",
+               "format": "qcow2",
+               "mode": "existing",
+               "sync": "incremental",
+               "target": "drive0.inc0.qcow2"
+             }
+           },
+           {
+             "type": "drive-backup",
+             "data": {
+               "device": "drive1",
+               "bitmap": "bitmap0",
+               "format": "qcow2",
+               "mode": "existing",
+               "sync": "incremental",
+               "target": "drive1.inc0.qcow2"
+             }
+           }]
          }
        }
=20
--  QMP example response, highlighting a failure for ``drive2``:
-
-   -  Acknowledgement that the Transaction was accepted and jobs were
-      launched:
-
-      .. code:: json
-
-          { "return": {} }
-
-   -  Later, QEMU sends notice that the second job has errored out, but
-      that the first job was also cancelled:
-
-      .. code:: json
-
-          { "timestamp": { "seconds": 1447193702, "microseconds": 632377=
 },
-            "data": { "device": "drive1", "action": "report",
-                      "operation": "read" },
-            "event": "BLOCK_JOB_ERROR" }
-
-      .. code:: json
-
-          { "timestamp": { "seconds": 1447193702, "microseconds": 640074=
 },
-            "data": { "speed": 0, "offset": 0, "len": 67108864,
-                      "error": "Input/output error",
-                      "device": "drive1", "type": "backup" },
-            "event": "BLOCK_JOB_COMPLETED" }
-
-      .. code:: json
-
-          { "timestamp": { "seconds": 1447193702, "microseconds": 640163=
 },
-            "data": { "device": "drive0", "type": "backup", "speed": 0,
-                      "len": 67108864, "offset": 16777216 },
-            "event": "BLOCK_JOB_CANCELLED" }
+#. Receive notice that the Transaction was accepted, and jobs were launc=
hed:
+
+   .. code:: json
+
+    <- { "return": {} }
+
+#. Receive notification that the backup job for ``drive1`` has failed:
+
+   .. code:: json
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "device": "drive1",
+           "action": "report",
+           "operation": "read"
+         },
+         "event": "BLOCK_JOB_ERROR"
+       }
+
+    <- {
+         "timestamp": {...},
+         "data": {
+           "speed": 0,
+           "offset": 0,
+           "len": 67108864,
+           "error": "Input/output error",
+           "device": "drive1",
+           "type": "backup"
+         },
+         "event": "BLOCK_JOB_COMPLETED"
+       }
+
+#. Receive notification that the job for ``drive0`` has been cancelled:
+
+   .. code:: json
+
+    <- {
+         "timestamp": {...}
+         "data": {
+           "device": "drive0",
+           "type": "backup",
+           "speed": 0,
+           "len": 67108864,
+           "offset": 16777216
+         },
+         "event": "BLOCK_JOB_CANCELLED"
+       }
+
+At the conclusion of *this* example, both jobs have been aborted due to =
a
+failure. Both destination images should be deleted and are no longer of =
use.
+
+The transaction as a whole can simply be re-issued at a later time.
=20
 .. raw:: html
=20
    <!--
    The FreeBSD Documentation License
=20
-   Redistribution and use in source (Markdown) and 'compiled' forms (SGM=
L, HTML,
-   PDF, PostScript, RTF and so forth) with or without modification, are =
permitted
-   provided that the following conditions are met:
+   Redistribution and use in source (ReST) and 'compiled' forms (SGML, H=
TML,
+   PDF, PostScript, RTF and so forth) with or without modification, are
+   permitted provided that the following conditions are met:
=20
-   Redistributions of source code (Markdown) must retain the above copyr=
ight
-   notice, this list of conditions and the following disclaimer of this =
file
-   unmodified.
+   Redistributions of source code (ReST) must retain the above copyright=
 notice,
+   this list of conditions and the following disclaimer of this file unm=
odified.
=20
-   Redistributions in compiled form (transformed to other DTDs, converte=
d to PDF,
-   PostScript, RTF and other formats) must reproduce the above copyright=
 notice,
-   this list of conditions and the following disclaimer in the documenta=
tion and/or
-   other materials provided with the distribution.
+   Redistributions in compiled form (transformed to other DTDs, converte=
d to
+   PDF, PostScript, RTF and other formats) must reproduce the above copy=
right
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
=20
-   THIS DOCUMENTATION IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUT=
ORS "AS IS"
-   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,=
 THE
-   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR  P=
URPOSE ARE
-   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS  B=
E LIABLE
-   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUE=
NTIAL
-   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS OR
-   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HO=
WEVER
-   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LI=
ABILITY,
-   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF=
 THE USE OF
-   THIS DOCUMENTATION, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE=
.
+   THIS DOCUMENTATION IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUT=
ORS "AS
+   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED=
 TO, THE
+   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
+   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTOR=
S BE
+   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSIN=
ESS
+   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER =
IN
+   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWIS=
E)
+   ARISING IN ANY WAY OUT OF THE USE OF THIS DOCUMENTATION, EVEN IF ADVI=
SED OF
+   THE POSSIBILITY OF SUCH DAMAGE.
    -->
--=20
2.20.1


