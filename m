Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CB3F1742
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 12:27:37 +0200 (CEST)
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfGq-0008M8-Bq
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 06:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGfEq-00071V-Dz
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:25:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGfEg-0003XZ-CE
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629368718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CiS9nc8vpC8rZW4Hm6tSwk2MiEcMDZPBbRX9R3m0zJc=;
 b=bbsjAs54T/ak9BUFrN7o8T9IhLT0vOAJ2hVIsxJXROlNWv/iJKTb4qeFPZpXxOEquGBx8r
 kRoLrBMiUQvkWRKF2pOGRgTCQpVuTKy3DeI4I40JQJ7XZ/OPF8UzkFaHtp6yeM/PrnFg8p
 h9kjyyZ2szARsE9RUDCPSAHJvz0bu/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-iNg9wP-tPnChIuQLJilCgA-1; Thu, 19 Aug 2021 06:25:13 -0400
X-MC-Unique: iNg9wP-tPnChIuQLJilCgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B851190D341
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:25:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF075DA2D;
 Thu, 19 Aug 2021 10:25:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Add a blog post about FUSE block exports
Date: Thu, 19 Aug 2021 12:25:01 +0200
Message-Id: <20210819102501.69638-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This post explains when FUSE block exports are useful, how they work,
and that it is fun to export an image file on its own path so it looks
like your image file (in whatever format it was) is a raw image now.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
You can also find this patch here:
https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1

My first patch to qemu-web, so I hope I am not doing anything overly
stupid here (adding SVGs with extremely long lines comes to mind)...
---
 _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
 screenshots/2021-08-18-block-graph-a.svg  |   2 +
 screenshots/2021-08-18-block-graph-b.svg  |   2 +
 screenshots/2021-08-18-block-graph-c.svg  |   2 +
 screenshots/2021-08-18-block-graph-d.svg  |   2 +
 screenshots/2021-08-18-block-graph-e.svg  |   2 +
 screenshots/2021-08-18-root-directory.svg |   2 +
 screenshots/2021-08-18-root-file.svg      |   2 +
 8 files changed, 502 insertions(+)
 create mode 100644 _posts/2021-08-18-fuse-blkexport.md
 create mode 100644 screenshots/2021-08-18-block-graph-a.svg
 create mode 100644 screenshots/2021-08-18-block-graph-b.svg
 create mode 100644 screenshots/2021-08-18-block-graph-c.svg
 create mode 100644 screenshots/2021-08-18-block-graph-d.svg
 create mode 100644 screenshots/2021-08-18-block-graph-e.svg
 create mode 100644 screenshots/2021-08-18-root-directory.svg
 create mode 100644 screenshots/2021-08-18-root-file.svg

diff --git a/_posts/2021-08-18-fuse-blkexport.md b/_posts/2021-08-18-fuse-b=
lkexport.md
new file mode 100644
index 0000000..e6a55d0
--- /dev/null
+++ b/_posts/2021-08-18-fuse-blkexport.md
@@ -0,0 +1,488 @@
+---
+layout: post
+title:  "Exporting block devices as raw image files with FUSE"
+date:   2021-08-18 18:00:00 +0200
+author: Hanna Reitz
+categories: [storage, features, tutorials]
+---
+Sometimes, there is a VM disk image whose contents you want to manipulate
+without booting the VM.  For raw images, that process is usually fairly si=
mple,
+because most Linux systems bring tools for the job, e.g.:
+* *dd* to just copy data to and from given offsets,
+* *parted* to manipulate the partition table,
+* *kpartx* to present all partitions as block devices,
+* *mount* to access filesystems=E2=80=99 contents.
+
+Sadly, but naturally, such tools only work for raw images, and not for ima=
ges
+e.g. in QEMU=E2=80=99s qcow2 format.  To access such an image=E2=80=99s co=
ntent, the format has
+to be translated to create a raw image, for example by:
+* Exporting the image file with `qemu-nbd -c` as an NBD block device file,
+* Converting between image formats using `qemu-img convert`,
+* Accessing the image from a guest, where it appears as a normal block dev=
ice.
+
+Unfortunately, none of these methods is perfect: `qemu-nbd -c` generally
+requires root rights, converting to a temporary raw copy requires addition=
al
+disk space and the conversion process takes time, and accessing the image =
from a
+guest is just quite cumbersome in general (and also specifically something=
 that
+we set out to avoid in the first sentence of this blog post).
+
+As of QEMU 6.0, there is another method, namely FUSE block exports.
+Conceptually, these are rather similar to using `qemu-nbd -c`, but they do=
 not
+require root rights.
+
+**Note**: FUSE block exports are a feature that can be enabled or disabled
+during the build process with `--enable-fuse` or `--disable-fuse`, respect=
ively;
+omitting either configure option will enable the feature if and only if li=
bfuse3
+is present.  It is possible that the QEMU build you are using does not hav=
e FUSE
+block export support, because it was not compiled in.
+
+FUSE (*Filesystem in Userspace*) is a technology to let userspace processe=
s
+provide filesystem drivers.  For example, *sshfs* is a program that allows
+mounting remote directories from a machine accessible via SSH.
+
+QEMU can use FUSE to make a virtual block device appear as a normal file o=
n the
+host, so that tools like *kpartx* can interact with it regardless of the i=
mage
+format.
+
+## Background information
+
+### File mounts
+
+A perhaps little-known fact is that, on Linux, filesystems do not need to =
have
+a root directory, they only need to have a root node.  A filesystem that o=
nly
+provides a single regular file is perfectly valid.
+
+Conceptually, every filesystem is a tree, and mounting works by replacing =
one
+subtree of the global VFS tree by the mounted filesystem=E2=80=99s tree.  =
Normally, a
+filesystem=E2=80=99s root node is a directory, like in the following examp=
le:
+
+|![Regular filesystem: Root directory is mounted to a directory mount poin=
t](/screenshots/2021-08-18-root-directory.svg)|
+|:--:|
+|*Fig. 1: Mounting a regular filesystem with a directory as its root node*=
|
+
+Here, the directory `/foo` and its content (the files `/foo/a` and `/foo/b=
`) are
+shadowed by the new filesystem (showing `/foo/x` and `/foo/y`).
+
+Note that a filesystem=E2=80=99s root node generally has no name.  After m=
ounting, the
+filesystem=E2=80=99s root directory=E2=80=99s name is determined by the or=
iginal name of the
+mount point.
+
+Because a tree does not need to have multiple nodes but may consist of jus=
t a
+single leaf, a filesystem with a file for its root node works just as well=
,
+though:
+
+|![Mounting a file root node to a regular file mount point](/screenshots/2=
021-08-18-root-file.svg)|
+|:--:|
+|*Fig. 2: Mounting a filesystem with a regular (unnamed) file as its root =
node*|
+
+Here, FS B only consists of a single node, a regular file with no name.  (=
As
+above, a filesystem=E2=80=99s root node is generally unnamed.) Consequentl=
y, the mount
+point for it must also be a regular file (`/foo/a` in our example), and ju=
st
+like before, the content of `/foo/a` is shadowed, and when opening it, one=
 will
+instead see the contents of FS B=E2=80=99s unnamed root node.
+
+### QEMU block exports
+
+QEMU allows exporting block nodes via various protocols (as of 6.0: NBD,
+vhost-user, FUSE).  A block node is an element of QEMU=E2=80=99s block gra=
ph (see e.g.
+[Managing the New Block Layer](http://events17.linuxfoundation.org/sites/e=
vents/files/slides/talk\_11.pdf),
+a talk given at KVM Forum 2017), which can for example be attached to gues=
t
+devices.  Here is a very simple example:
+
+|![Block graph: image file <-> file node (label: prot-node) <-> qcow2 node=
 (label: fmt-node) <-> virtio-blk guest device](/screenshots/2021-08-18-blo=
ck-graph-a.svg)|
+|:--:|
+|*Fig. 3: A simple block graph for attaching a qcow2 image to a virtio-blk=
 guest device*|
+
+This is the simplest example for a block graph that connects a *virtio-blk=
*
+guest device to a qcow2 image file.  The *file* block driver, instanced in=
 the
+form of a block node named *prot-node*, accesses the actual file and provi=
des
+the node above it access to the raw content.  This node above, named *fmt-=
node*,
+is handled by the *qcow2* block driver, which is capable of interpreting t=
he
+qcow2 format.  Parents of this node will therefore see the actual content =
of the
+virtual disk that is represented by the qcow2 image.  There is only one pa=
rent
+here, which is the *virtio-blk* guest device, which will thus see the virt=
ual
+disk.
+
+The command line to achieve the above could look something like this:
+```
+$ qemu-system-x86_64 \
+    -blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_path \
+    -blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
+    -device virtio-blk,drive=3Dfmt-node
+```
+
+Besides attaching guest devices to block nodes, you can also export them f=
or
+users outside of qemu, for example via NBD.  Say you have a QMP channel op=
en for
+the QEMU instance above, then you could do this:
+```json
+{
+    "execute": "nbd-server-start",
+    "arguments": {
+        "addr": {
+            "type": "inet",
+            "data": {
+                "host": "localhost",
+                "port": "10809"
+            }
+        }
+    }
+}
+{
+    "execute": "block-export-add",
+    "arguments": {
+        "type": "nbd",
+        "id": "fmt-node-export",
+        "node-name": "fmt-node",
+        "name": "guest-disk"
+    }
+}
+```
+
+This opens an NBD server on `localhost:10809`, which exports *fmt-node* (u=
nder
+the NBD export name *guest-disk*).  The block graph looks as follows:
+
+|![Same block graph as fig. 3, but with an NBD server attached to fmt-node=
](/screenshots/2021-08-18-block-graph-b.svg)|
+|:--:|
+|*Fig. 4: Block graph extended by an NBD server*|
+
+NBD clients connecting to this server will see the raw disk as seen by the
+guest =E2=80=93 we have *exported* the guest disk:
+
+```
+$ qemu-img info nbd://localhost/guest-disk
+image: nbd://localhost:10809/guest-disk
+file format: raw
+virtual size: 20 GiB (21474836480 bytes)
+disk size: unavailable
+```
+
+### QEMU storage daemon
+
+If you are not running a guest, and so do not need guest devices, but all =
you
+want is to use the QEMU block layer (for example to interpret the qcow2 fo=
rmat)
+and export nodes from the block graph, then you can use the more lightweig=
ht
+QEMU storage daemon instead of a full-blown QEMU process:
+
+```
+$ qemu-storage-daemon \
+    --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_path =
\
+    --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
+    --nbd-server addr.type=3Dinet,addr.host=3Dlocalhost,addr.port=3D10809 =
\
+    --export type=3Dnbd,id=3Dfmt-node-export,node-name=3Dfmt-node,name=3Dg=
uest-disk
+```
+
+Which creates the following block graph:
+
+|![Block graph: image file <-> file node (label: prot-node) <-> qcow2 node=
 (label: fmt-node) <-> NBD server](/screenshots/2021-08-18-block-graph-c.sv=
g)|
+|:--:|
+|*Fig. 5: Exporting a qcow2 image over NBD*|
+
+## FUSE block exports
+
+Besides NBD exports, QEMU also supports vhost-user and FUSE exports.  FUSE=
 block
+exports make QEMU become a FUSE driver that provides a filesystem that con=
sists
+of only a single node, namely a regular file that has the raw contents of =
the
+exported block node.  QEMU will automatically mount this filesystem on a g=
iven
+existing regular file (which acts as the mount point, as described in the
+=E2=80=9CFile mounts=E2=80=9D section).
+
+Thus, FUSE exports can be used like this:
+
+```
+$ touch mount-point
+
+$ qemu-storage-daemon \
+    --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_path =
\
+    --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
+    --export type=3Dfuse,id=3Dfmt-node-export,node-name=3Dfmt-node,mountpo=
int=3Dmount-point
+```
+
+The mount point now appears as the raw VM disk that is stored in the qcow2
+image:
+```
+$ qemu-img info mount-point
+image: mount-point
+file format: raw
+virtual size: 20 GiB (21474836480 bytes)
+disk size: 196 KiB
+```
+
+And *mount* tells us that this is indeed its own filesystem:
+```
+$ mount | grep mount-point
+/dev/fuse on /tmp/mount-point type fuse (rw,nosuid,nodev,relatime,user_id=
=3D1000,group_id=3D100,default_permissions,allow_other,max_read=3D67108864)
+```
+
+The block graph looks like this:
+
+|![Block graph: image file <-> file node (label: prot-node) <-> qcow2 node=
 (label: fmt-node) <-> FUSE server <-> exported file](/screenshots/2021-08-=
18-block-graph-d.svg)|
+|:--:|
+|*Fig. 6: Exporting a qcow2 image over FUSE*|
+
+Closing the storage daemon (e.g. with Ctrl-C) automatically unmounts the e=
xport,
+turning the mount point back into an empty normal file:
+
+```
+$ mount | grep -c mount-point
+0
+
+$ qemu-img info mount-point
+image: mount-point
+file format: raw
+virtual size: 0 B (0 bytes)
+disk size: 0 B
+```
+
+## Mounting an image on itself
+
+So far, we have seen what FUSE exports are, how they work, and how they ca=
n be
+used.  Now let=E2=80=99s add an interesting twist.
+
+### What happens to the old tree under a mount point?
+
+Mounting a filesystem only shadows the mount point=E2=80=99s original cont=
ent, it does
+not remove it.  The original content can no longer be looked up via its
+(absolute) path, but it is still there, much like a file that has been unl=
inked
+but is still open in some process.  Here is an example:
+
+First, create some file in some directory, and have some process keep it o=
pen:
+
+```
+$ mkdir foo
+
+$ echo 'Is anyone there?' > foo/bar
+
+$ irb
+irb(main):001:0> f =3D File.open('foo/bar', 'r+')
+=3D> #<File:foo/bar>
+irb(main):002:0> ^Z
+[1]  + 35494 suspended  irb
+```
+
+Next, mount something on the directory:
+
+```
+$ sudo mount -t tmpfs tmpfs foo
+```
+
+The file cannot be found anymore (because *foo*=E2=80=99s content is shado=
wed by the
+mounted filesystem), but the process who kept it open can still read from =
it,
+and write to it:
+```
+$ ls foo
+
+$ cat foo/bar
+cat: foo/bar: No such file or directory
+
+$ fg
+f.read
+irb(main):002:0> f.read
+=3D> "Is anyone there?\n"
+irb(main):003:0> f.puts('Hello from the shadows!')
+=3D> nil
+irb(main):004:0> exit
+
+$ ls foo
+
+$ cat foo/bar
+cat: foo/bar: No such file or directory
+```
+
+Unmounting the filesystem lets us see our file again, with its updated con=
tent:
+```
+$ sudo umount foo
+
+$ ls foo
+bar
+
+$ cat foo/bar
+Is anyone there?
+Hello from the shadows!
+```
+
+### Letting a FUSE export shadow its image file
+
+The same principle applies to file mounts: The original inode is shadowed =
(along
+with its content), but it is still there for any process that opened it be=
fore
+the mount occurred.  Because QEMU (or the storage daemon) opens the image =
file
+before mounting the FUSE export, you can therefore specify an image=E2=80=
=99s path as
+the mount point for its corresponding export:
+
+```
+$ qemu-img create -f qcow2 foo.qcow2 20G
+Formatting 'foo.qcow2', fmt=3Dqcow2 cluster_size=3D65536 extended_l2=3Doff=
 compression_type=3Dzlib size=3D21474836480 lazy_refcounts=3Doff refcount_b=
its=3D16
+
+$ qemu-img info foo.qcow2
+image: foo.qcow2
+file format: qcow2
+virtual size: 20 GiB (21474836480 bytes)
+disk size: 196 KiB
+cluster_size: 65536
+Format specific information:
+    compat: 1.1
+    compression type: zlib
+    lazy refcounts: false
+    refcount bits: 16
+    corrupt: false
+    extended l2: false
+
+$ qemu-storage-daemon \
+    --blockdev node-name=3Dnode0,driver=3Dqcow2,file.driver=3Dfile,file.fi=
lename=3Dfoo.qcow2 \
+    --export type=3Dfuse,id=3Dnode0-export,node-name=3Dnode0,mountpoint=3D=
foo.qcow2 &
+[1] 40843
+
+$ qemu-img info foo.qcow2
+image: foo.qcow2
+file format: raw
+virtual size: 20 GiB (21474836480 bytes)
+disk size: 196 KiB
+
+$ kill %1
+[1]  + 40843 done       qemu-storage-daemon --blockdev  --export
+```
+
+In graph form, that looks like this:
+
+|![Two graphs: First, foo.qcow2 is opened by QEMU; second, a FUSE server e=
xports the raw disk under foo.qcow2, thus shadowing the original foo.qcow2]=
(/screenshots/2021-08-18-block-graph-e.svg)|
+|:--:|
+|*Fig. 6: Exporting a qcow2 image via FUSE on its own path*|
+
+QEMU (or the storage daemon in this case) keeps the original (qcow2) file =
open,
+and so it keeps access to it, even after the mount.  However, any other pr=
ocess
+that opens the image by name (i.e. `open("foo.qcow2")`) will open the raw =
disk
+image exported by QEMU.  Therefore, it looks like the qcow2 image is in ra=
w
+format now.
+
+### `qemu-fuse-disk-export.py`
+
+Because the QEMU storage daemon command line tends to become kind of long,=
 I=E2=80=99ve
+written a script to facilitate the process:
+[qemu-fuse-disk-export.py](https://gitlab.com/hreitz/qemu-scripts/-/blob/m=
ain/qemu-fuse-disk-export.py)
+([direct download link](https://gitlab.com/hreitz/qemu-scripts/-/raw/main/=
qemu-fuse-disk-export.py?inline=3Dfalse)).
+This script automatically detects the image format, and its `--daemonize` =
option
+allows safe use in scripts, where it is important that the process blocks =
until
+the export is fully set up.
+
+Using `qemu-fuse-disk-export.py`, the above example looks like this:
+```
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: qcow2
+
+$ qemu-fuse-disk-export.py foo.qcow2 &
+[1] 13339
+All exports set up, ^C to revert
+
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: raw
+
+$ kill -SIGINT %1
+[1]  + 13339 done       qemu-fuse-disk-export.py foo.qcow2
+
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: qcow2
+```
+
+Or, with `--daemonize`/`-d`:
+```
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: qcow2
+
+$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2
+
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: raw
+
+$ kill -SIGINT $(cat qfde.pid)
+
+$ qemu-img info foo.qcow2 | grep 'file format'
+file format: qcow2
+```
+
+## Bringing it all together
+
+Now we know how to make disk images in any format understood by QEMU appea=
r as
+raw images.  We can thus run any application on them that works with such =
raw
+disk images:
+
+```
+$ qemu-fuse-disk-export.py \
+    -dp qfde.pid \
+    Arch-Linux-x86_64-basic-20210711.28787.qcow2
+
+$ parted Arch-Linux-x86_64-basic-20210711.28787.qcow2 p
+WARNING: You are not superuser.  Watch out for permissions.
+Model:  (file)
+Disk /tmp/Arch-Linux-x86_64-basic-20210711.28787.qcow2: 42.9GB
+Sector size (logical/physical): 512B/512B
+Partition Table: gpt
+Disk Flags:
+
+Number  Start   End     Size    File system  Name  Flags
+ 1      1049kB  2097kB  1049kB                     bios_grub
+ 2      2097kB  42.9GB  42.9GB  btrfs
+
+$ sudo kpartx -av Arch-Linux-x86_64-basic-20210711.28787.qcow2
+add map loop0p1 (254:0): 0 2048 linear 7:0 2048
+add map loop0p2 (254:1): 0 83881951 linear 7:0 4096
+
+$ sudo mount /dev/mapper/loop0p2 /mnt/tmp
+
+$ ls /mnt/tmp
+bin   boot  dev  etc  home  lib  lib64  mnt  opt  proc  root  run  sbin  s=
rv
+swap  sys   tmp  usr  var
+
+$ echo 'Hello, qcow2 image!' > /mnt/tmp/home/arch/hello
+
+$ sudo umount /mnt/tmp
+
+$ sudo kpartx -d Arch-Linux-x86_64-basic-20210711.28787.qcow2
+loop deleted : /dev/loop0
+
+$ kill -SIGINT $(cat qfde.pid)
+```
+
+And launching the image, in the guest we see:
+```
+[arch@archlinux ~] cat hello
+Hello, qcow2 image!
+```
+
+## A note on `allow_other`
+
+In the example presented in the above section, we access the exported imag=
e with
+a different user than the one who exported it (to be specific, we export i=
t as a
+normal user, and then access it as root).  This does not work prior to QEM=
U 6.1:
+
+```
+$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2
+
+$ sudo stat foo.qcow2
+stat: cannot statx 'foo.qcow2': Permission denied
+```
+
+QEMU 6.1 has introduced support for FUSE=E2=80=99s `allow_other` mount opt=
ion.  Without
+that option, only the user who exported the image has access to it.  By de=
fault,
+if the system allows for non-root users to add `allow_other` to FUSE mount
+options, QEMU will add it, and otherwise omit it.  It does so by simply
+attempting to mount the export with `allow_other` first, and if that fails=
, it
+will try again without.  (You can also force the behavior with the
+`allow_other=3D(on|off|auto)` export parameter.)
+
+Non-root users can pass `allow_other` if and only if `/etc/fuse.conf` cont=
ains
+the `user_allow_other` option.
+
+## Conclusion
+
+As shown in this blog post, FUSE block exports are a relatively simple way=
 to
+access images in any format understood by QEMU as if they were raw images.
+Any tool that can manipulate raw disk images can thus manipulate images in=
 any
+format, simply by having the QEMU storage daemon provide a translation lay=
er.
+By mounting the FUSE export on the original image path, this translation l=
ayer
+will effectively be invisible, and the original image will look like it is=
 in
+raw format, so it can directly be accessed by those tools.
+
+The current main disadvantage of FUSE exports is that they offer relativel=
y bad
+performance.  That should be fine as long as your use case is just light
+manipulation of some VM images, like manually modifying some files on them=
.
+However, we did not yet really try to optimize performance, so if more ser=
ious
+use cases appear that would require better performance, we can try.
diff --git a/screenshots/2021-08-18-block-graph-a.svg b/screenshots/2021-08=
-18-block-graph-a.svg
new file mode 100644
index 0000000..bea1ba3
--- /dev/null
+++ b/screenshots/2021-08-18-block-graph-a.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"93.084mm" height=3D"112.19mm" version=3D"1.1" vi=
ewBox=3D"0 0 93.084 112.19" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"auto"=
><path id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-=
4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"con=
text-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=
=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=
=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.03=
37-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" f=
ill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stro=
ke-width=3D".625"/></marker></defs><g id=3D"text31368" fill=3D"#802400" str=
oke-width=3D".26458px" aria-label=3D"QEMU process"><path id=3D"path7252" d=
=3D"m72.021 7.6476q-0.75792 0-1.2058 0.565-0.44442 0.565-0.44442 1.54 0 0.9=
7152 0.44442 1.5365 0.44786 0.565 1.2058 0.565 0.75792 0 1.1989-0.565 0.444=
42-0.565 0.44442-1.5365 0-0.97496-0.44442-1.54-0.44097-0.565-1.1989-0.565zm=
0.97496 4.5785 0.9164 1.0025h-0.8406l-0.76137-0.82338q-0.11369 0.0069-0.175=
7 0.01034-0.05857 0.0034-0.11369 0.0034-1.0852 0-1.7363-0.72347-0.64768-0.7=
2692-0.64768-1.943 0-1.2196 0.64768-1.943 0.65112-0.72692 1.7363-0.72692 1.=
0818 0 1.7294 0.72692 0.64768 0.72347 0.64768 1.943 0 0.89573-0.36174 1.533=
1-0.35829 0.63734-1.0404 0.94051z"/><path id=3D"path7254" d=3D"m75.487 7.17=
56h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183v0.585=
67h-3.3142z"/><path id=3D"path7256" d=3D"m79.945 7.1756h1.037l1.3126 3.5002=
 1.3195-3.5002h1.037v5.1435h-0.67868v-4.5165l-1.3264 3.5278h-0.69936l-1.326=
4-3.5278v4.5165h-0.67524z"/><path id=3D"path7258" d=3D"m85.953 7.1756h0.699=
36v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36174 0.97152 0.36174 0.66835 0=
 0.96807-0.36174 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.0=
06-0.49954 1.5193-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4745-0.51332-0=
.49609-0.51332-0.49609-1.5193z"/><path id=3D"path7260" d=3D"m67.594 18.916v=
2.0464h-0.63734v-5.3261h0.63734v0.58567q0.19982-0.34451 0.50298-0.50988 0.3=
0661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811 0.44097 0.55811 0.4409=
7 1.4676t-0.44097 1.4676q-0.43753 0.5581-1.1403 0.5581-0.42375 0-0.73036-0.=
16536-0.30317-0.16881-0.50298-0.51332zm2.1566-1.347q0-0.69936-0.28939-1.095=
5-0.28594-0.39963-0.78893-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594=
 1.0955t0.28594 1.099q0.28939 0.39619 0.79237 0.39619t0.78893-0.39619q0.289=
39-0.39963 0.28939-1.099z"/><path id=3D"path7262" d=3D"m73.695 16.229q-0.10=
68-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.8268=
2 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.5=
9945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546=
 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path7264" d=
=3D"m75.701 16.081q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.088=
7t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963t0=
.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0=
.53744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47=
198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853=
-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=
=3D"path7266" d=3D"m81.299 15.785v0.59256q-0.26872-0.14814-0.54088-0.22049-=
0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.=
34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54433-=
0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.=
18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.51332-0.547=
77-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0=
.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z"/><path id=3D"pat=
h7268" d=3D"m85.702 17.408v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 =
0.35485 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.=
68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72=
692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.947=
4 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.=
45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.830=
27-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972=
-0.36518 0.84405z"/><path id=3D"path7270" d=3D"m89.202 15.75v0.59945q-0.268=
72-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0689-0.47198 0-0.70969 0=
.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.34796 0.16881 0.=
12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774 0.40997 0.285=
94 0.26183 0.28594 0.7338 0 0.53744-0.42719 0.85094-0.42375 0.3135-1.1679 0=
.3135-0.31006 0-0.64768-0.06201-0.33418-0.05857-0.70625-0.17914v-0.65457q0.=
3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68=
902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0.25838-0.1757-0.39619-0.1722=
6-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58911-0.12402-0.85094-0.37896-=
0.26183-0.25838-0.26183-0.70624 0-0.54433 0.38585-0.8406 0.38585-0.29628 1.=
0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0.15503z"/><path id=3D"path72=
72" d=3D"m92.878 15.75v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.06=
89-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408=
 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q=
0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.7338 0 0.53744-0.=
42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.3341=
7-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0=
.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.=
43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05=
168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54=
433 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t=
0.57189 0.15503z"/></g><rect id=3D"rect991" x=3D"15.436" y=3D"33.475" width=
=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"none" sto=
p-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"text3=
313" stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D"path7275" d=
=3D"m22.055 38.496q0 0.69935 0.28594 1.099 0.28939 0.39619 0.79237 0.39619t=
0.79237-0.39619q0.28939-0.39963 0.28939-1.099 0-0.69936-0.28939-1.0955-0.28=
939-0.39963-0.79237-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.095=
5zm2.1601 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.=
16536-0.69936 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676 0-0.90951 0.4=
3753-1.4676 0.44097-0.55811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.3066=
1 0.16536 0.50643 0.50987v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"pat=
h7277" d=3D"m28.932 36.711v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872=
-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106 1=
.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235=
 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0=
.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.51=
332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.29283 =
0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z"/><path id=3D"path7279" =
d=3D"m31.529 37.008q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.08=
87 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027=
1-0.39963t0.29628-1.0886q0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0=
.40308zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 =
1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54=
088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z=
"/><path id=3D"path7281" d=3D"m33.982 36.563h0.6339l0.79237 3.011 0.78893-3=
.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.=
83027-3.1626-0.83371 3.1626h-0.74759z"/><path id=3D"path7283" d=3D"m40.81 3=
9.836h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0=
.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.134=
36-0.51332 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.3272=
8 0-0.69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 =
0.78548-0.25494t0.66835-0.08613q0.79926 0 1.2747 0.39963 0.47542 0.39963 0.=
47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.0861=
3 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z"/></g><rect id=3D"=
rect9379" x=3D"15.436" y=3D"62.186" width=3D"33.768" height=3D"13.398" rx=
=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#0=
00" stroke-width=3D".52917"/><g id=3D"text9383" stroke-width=3D".26458px" a=
ria-label=3D"file"><path id=3D"path7303" d=3D"m30.837 65.488v3.8585h-0.6373=
4v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.2687=
2q0-0.63045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-=
0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-=
0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path id=3D"path7305" d=3D"m32.1=
63 63.986h0.6339v5.3606h-0.6339z"/><path id=3D"path7307" d=3D"m37.424 67.25=
9v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.=
34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.=
34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4=
642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-=
0.5581 1.3815-0.5581 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.360=
8zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0=
.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g =
id=3D"g22369" transform=3D"translate(78.903 34.429)" fill=3D"none" stroke=
=3D"#000" stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.0=
6h10.715l3.1067 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D=
"path21920" d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round" =
style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate(8=
4.24 30.251)"><rect id=3D"rect22371" x=3D"-75.456" y=3D"-25.487" width=3D"4=
7.071" height=3D"13.398" fill=3D"none" stop-color=3D"#000000" stroke=3D"#80=
8080" stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#808080" stroke-=
width=3D".26458px" aria-label=3D"virtio-blk"><path id=3D"path7231" d=3D"m-6=
7.446-20.016h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469 3.8585h-0.=
86127z"/><path id=3D"path7233" d=3D"m-62.815-20.016h0.6339v3.8585h-0.6339zm=
0-1.5021h0.6339v0.80271h-0.6339z"/><path id=3D"path7235" d=3D"m-58.619-19.4=
24q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 =
0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.6=
3734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226=
 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02411z"/><path id=3D"pat=
h7237" d=3D"m-57.327-21.112v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 =
0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.=
73381 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.=
49265h0.46509v-1.0955z"/><path id=3D"path7239" d=3D"m-55.188-20.016h0.6339v=
3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path id=3D"path7241" d=
=3D"m-51.733-19.572q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.08=
87 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027=
1-0.39963t0.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0=
.40308zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 =
1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54=
088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z=
"/><path id=3D"path7243" d=3D"m-49.1-18.373h1.8569v0.565h-1.8569z"/><path i=
d=3D"path7245" d=3D"m-43.464-18.084q0-0.69936-0.28939-1.0955-0.28594-0.3996=
3-0.78893-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955t=
0.28594 1.099q0.28939 0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-0.399=
63 0.28939-1.099zm-2.1566-1.347q0.19982-0.34451 0.50298-0.50988 0.30661-0.1=
6881 0.73036-0.16881 0.7028 0 1.1403 0.55811 0.44097 0.55811 0.44097 1.4676=
t-0.44097 1.4676q-0.43753 0.55811-1.1403 0.55811-0.42375 0-0.73036-0.16536-=
0.30317-0.16881-0.50298-0.51332v0.57878h-0.63734v-5.3606h0.63734z"/><path i=
d=3D"path7247" d=3D"m-41.756-21.518h0.6339v5.3606h-0.6339z"/><path id=3D"pa=
th7249" d=3D"m-39.819-21.518h0.63734v3.166l1.8914-1.664h0.8096l-2.0464 1.80=
52 2.1325 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.63734z"/></g></g><rect i=
d=3D"rect23797" x=3D".26458" y=3D".26458" width=3D"64.111" height=3D"83.942=
" rx=3D"5.2917" ry=3D"5.4057" fill=3D"none" stop-color=3D"#000000" stroke=
=3D"#802400" stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"=
 stroke-width=3D".52917"/><path id=3D"path24007" d=3D"m32.315 80.657v10.837=
" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=
=3D".52917" style=3D"paint-order:normal"/><path id=3D"path25180" d=3D"m32.3=
15 52.012v9.2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-star=
t=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.058=
33" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path2=
5334" d=3D"m32.315 19.127v13.399" fill=3D"none" marker-end=3D"url(#Arrow1Me=
nd)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=
=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/=
><rect id=3D"rect35415" x=3D"17.503" y=3D"71.251" width=3D"29.634" height=
=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stro=
ke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text35=
918" stroke-width=3D".26458px" aria-label=3D"prot-node"><path id=3D"path731=
0" d=3D"m21.06 76.592v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.241=
16 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.3906=
7 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0=
.39067-0.29662 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.=
94292q0-0.48955-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466 0.=
27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733 0.55=
466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path id=3D"=
path7312" d=3D"m25.331 74.711q-0.07476-0.04341-0.16399-0.0627-0.08682-0.021=
7-0.19293-0.0217-0.3762 0-0.57878 0.24598-0.20016 0.24357-0.20016 0.70177v1=
.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598 0.36415-0.36415 0.224=
28-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072 0.05547 0.0048 0.12299 =
0.01688z"/><path id=3D"path7314" d=3D"m26.735 74.608q-0.35691 0-0.56431 0.2=
7974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0=
.27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.207=
4-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762t0.33038 1.0418q=
0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.=
3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762=
 0.91157-0.3762z"/><path id=3D"path7316" d=3D"m29.149 73.53v0.76688h0.91398=
v0.34486h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 =
0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0=
.19534-0.69935v-1.4662h-0.32556v-0.34486h0.32556v-0.76688z"/><path id=3D"pa=
th7318" d=3D"m30.422 75.447h1.2998v0.3955h-1.2998z"/><path id=3D"path7320" =
d=3D"m34.674 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44=
855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614v-2.701=
h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.4992-0.1=
2058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z"/><path id=
=3D"path7322" d=3D"m36.605 74.608q-0.35691 0-0.56431 0.27974-0.2074 0.27733=
-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5=
619-0.27974 0.20739-0.27974 0.20739-0.76206 0-0.4799-0.20739-0.75964-0.2074=
-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762t0.33038 1.0418q0=
 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3=
762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 =
0.91157-0.3762z"/><path id=3D"path7324" d=3D"m40.358 74.707v-1.4614h0.44373=
v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0=
.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.3=
0627-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.214=
63 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.2025=
7 0.27733 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-=
0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 =
0.27733-0.20016 0.76688z"/><path id=3D"path7326" d=3D"m44.026 75.536v0.2170=
4h-2.0402q0.02894 0.4582 0.27492 0.69936 0.24839 0.23874 0.68971 0.23874 0.=
25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.101=
28-0.48955 0.15434-0.2508 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.=
3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-=
0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373=
-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.=
37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect id=3D"=
rect38770" x=3D"17.503" y=3D"42.585" width=3D"29.634" height=3D"8.4415" fil=
l=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000" str=
oke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774" stroke-wid=
th=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path7286" d=3D"m22.93 4=
4.774v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.=
34726v0.23875h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34=
485h0.42444v-0.1881q0-0.45096 0.20981-0.65595 0.20981-0.2074 0.66559-0.2074=
z"/><path id=3D"path7288" d=3D"m25.405 46.343q0.1664-0.29904 0.39791-0.4413=
2t0.54501-0.14228q0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.83922v1=
.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636t-0.41961-0.1881q-0.34485 0=
-0.54501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0=
.57636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0.22=
91-0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0=
.36415-0.36656t0.50402-0.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952 0.3=
0627 0.43408z"/><path id=3D"path7290" d=3D"m28.552 45.058v0.76688h0.91398v0=
.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.=
09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0.1=
9534-0.69935v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=3D"path=
7292" d=3D"m29.825 46.975h1.2998v0.3955h-1.2998z"/><path id=3D"path7294" d=
=3D"m34.077 46.896v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.448=
55-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614v-2.701h=
0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.49919-0.1=
2058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z"/><path id=
=3D"path7296" d=3D"m36.008 46.136q-0.35691 0-0.56431 0.27974-0.2074 0.27733=
-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5=
619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.=
28215zm0-0.3762q0.57878 0 0.90916 0.3762t0.33038 1.0418q0 0.66318-0.33038 1=
.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.3786=
2-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/>=
<path id=3D"path7298" d=3D"m39.761 46.235v-1.4614h0.44373v3.7524h-0.44373v-=
0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.4=
8955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.3086=
8-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 =
0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 =
0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0=
.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.=
76688z"/><path id=3D"path7300" d=3D"m43.429 47.065v0.21704h-2.0402q0.02894 =
0.4582 0.27492 0.69936 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.=
0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434=
-0.2508 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762=
-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 =
0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0=
.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.=
20981-0.22186 0.20981-0.25563 0.59083z"/></g><g id=3D"text877" stroke-width=
=3D".26458px" aria-label=3D"qcow2 image file"><path id=3D"path7204" d=3D"m5=
2.492 98.541q0 0.69936 0.28594 1.099 0.28939 0.39618 0.79237 0.39618t0.7923=
7-0.39618q0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.=
79237-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.34=
7q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16537-0.73036 0.16537-0.69936 =
0-1.1403-0.55811-0.43753-0.5581-0.43753-1.4676t0.43753-1.4676q0.44097-0.558=
11 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.50987=
v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path7206" d=3D"m59.368 96.75=
7v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-=
0.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.341=
06 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-=
0.22393v0.58567q-0.26527 0.12402-0.55122 0.18603-0.2825 0.062-0.60289 0.062=
-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.478 0-0.94396 0.51676-1=
.4848 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05=
857 0.54088 0.17914z"/><path id=3D"path7208" d=3D"m61.966 97.053q-0.50988 0=
-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.=
29628 0.39618 0.8096 0.39618 0.50643 0 0.80271-0.39963t0.29628-1.0887q0-0.6=
8557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.=
2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 =
0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0=
.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path7210" d=3D"=
m64.419 96.609h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011 0.7=
8893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371 3.1626h-0=
.74759z"/><path id=3D"path7212" d=3D"m71.247 99.882h2.4288v0.58567h-3.266v-=
0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.89228 0.3341=
7-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.28939-=
0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0=
.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494t0.66835-0.086=
13q0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058=
 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.4=
6164 0.47542-1.3022 1.3333z"/><path id=3D"path7214" d=3D"m46.098 103.78h0.6=
339v3.8585h-0.6339zm0-1.5021h0.6339v0.8027h-0.6339z"/><path id=3D"path7216"=
 d=3D"m51.062 104.53q0.23771-0.42719 0.56844-0.63045t0.77859-0.20326q0.6028=
9 0 0.93018 0.42375 0.32728 0.4203 0.32728 1.1989v2.3289h-0.63734v-2.3082q0=
-0.55466-0.19637-0.82338-0.19637-0.26871-0.59945-0.26871-0.49265 0-0.77859 =
0.32728t-0.28594 0.89228v2.1808h-0.63734v-2.3082q0-0.5581-0.19637-0.82338-0=
.19637-0.26871-0.60634-0.26871-0.48576 0-0.7717 0.33073-0.28594 0.32728-0.2=
8594 0.88883v2.1808h-0.63734v-3.8585h0.63734v0.59944q0.21704-0.35484 0.5202=
1-0.52365t0.72003-0.16881q0.4203 0 0.71314 0.2136 0.29628 0.21359 0.43753 0=
.62011z"/><path id=3D"path7218" d=3D"m56.684 105.7q-0.76826 0-1.0645 0.1757=
t-0.29628 0.59944q0 0.33762 0.22049 0.53744 0.22393 0.19637 0.60634 0.19637=
 0.5271 0 0.84405-0.37207 0.32039-0.37552 0.32039-0.99563v-0.14125zm1.2644-=
0.26183v2.2014h-0.6339v-0.58567q-0.21704 0.3514-0.54088 0.52021-0.32384 0.1=
6537-0.79237 0.16537-0.59256 0-0.94396-0.33073-0.34795-0.33418-0.34795-0.89=
228 0-0.65113 0.43408-0.98186 0.43753-0.33073 1.3022-0.33073h0.88884v-0.062=
q0-0.43753-0.28939-0.67524-0.28594-0.24115-0.80615-0.24115-0.33073 0-0.6442=
3 0.0792t-0.60289 0.23771v-0.58566q0.34795-0.13436 0.67524-0.19982 0.32728-=
0.0689 0.63734-0.0689 0.83716 0 1.2506 0.43408 0.41341 0.43408 0.41341 1.31=
6z"/><path id=3D"path7220" d=3D"m61.793 105.67q0-0.68902-0.28594-1.068-0.28=
25-0.37896-0.79582-0.37896-0.50988 0-0.79582 0.37896-0.2825 0.37896-0.2825 =
1.068 0 0.68557 0.2825 1.0645 0.28594 0.37896 0.79582 0.37896 0.51332 0 0.7=
9582-0.37896 0.28594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753=
 1.4642-0.43753 0.48231-1.3401 0.48231-0.33418 0-0.63045-0.0517-0.29628-0.0=
482-0.57533-0.15158v-0.61667q0.27905 0.15158 0.55122 0.22393 0.27216 0.0723=
 0.55466 0.0723 0.62356 0 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v-=
0.31351q-0.19637 0.34107-0.50298 0.50988t-0.73381 0.16881q-0.70969 0-1.1438=
-0.54088t-0.43408-1.4332q0-0.89573 0.43408-1.4366t1.1438-0.54088q0.42719 0 =
0.73381 0.16881t0.50298 0.50987v-0.58566h0.6339z"/><path id=3D"path7222" d=
=3D"m67.033 105.56v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 =
0.34106 0.9853 0.34106 0.36518 0 0.70624-0.0896 0.34451-0.0896 0.68213-0.26=
872v0.59945q-0.34106 0.14469-0.69936 0.22048-0.35829 0.0758-0.72692 0.0758-=
0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.=
5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.4995=
4 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.=
31005-0.75103-0.31005-0.53055 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.8=
4405z"/><path id=3D"path7224" d=3D"m73.434 103.78v3.8585h-0.63734v-3.3659h-=
1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.63045=
 0.29628-0.93018 0.29972-0.30316 0.9164-0.30316h0.63734v0.5271h-0.60634q-0.=
34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34107zm-0.63734-1.4=
952h0.63734v0.8027h-0.63734z"/><path id=3D"path7226" d=3D"m74.761 102.28h0.=
6339v5.3606h-0.6339z"/><path id=3D"path7228" d=3D"m80.021 105.56v0.31006h-2=
.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.3651=
8 0 0.70624-0.0896 0.34451-0.0896 0.68213-0.26872v0.59945q-0.34106 0.14469-=
0.69936 0.22048-0.35829 0.0758-0.72692 0.0758-0.92329 0-1.4642-0.53744-0.53=
744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0=
.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.1=
8604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31005-0.75103-0.31005-0.53054=
 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g></svg>
diff --git a/screenshots/2021-08-18-block-graph-b.svg b/screenshots/2021-08=
-18-block-graph-b.svg
new file mode 100644
index 0000000..5bf98af
--- /dev/null
+++ b/screenshots/2021-08-18-block-graph-b.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"93.084mm" height=3D"112.19mm" version=3D"1.1" vi=
ewBox=3D"0 0 93.084 112.19" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"auto"=
><path id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-=
4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"con=
text-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=
=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=
=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.03=
37-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" f=
ill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stro=
ke-width=3D".625"/></marker></defs><rect id=3D"rect991" x=3D"15.436" y=3D"3=
3.475" width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=
=3D"none" stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><=
g id=3D"text3313" stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=
=3D"path96" d=3D"m22.055 38.496q0 0.69935 0.28594 1.099 0.28939 0.39619 0.7=
9237 0.39619 0.50298 0 0.79237-0.39619 0.28939-0.39963 0.28939-1.099 0-0.69=
936-0.28939-1.0955-0.28939-0.39963-0.79237-0.39963-0.50298 0-0.79237 0.3996=
3-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982 0.34451-0.50643 0.5=
1332-0.30317 0.16536-0.73036 0.16536-0.69936 0-1.1403-0.55811-0.43753-0.558=
11-0.43753-1.4676 0-0.90951 0.43753-1.4676 0.44097-0.55811 1.1403-0.55811 0=
.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.50987v-0.58567h0.6339v5.=
3261h-0.6339z"/><path id=3D"path98" d=3D"m28.932 36.711v0.59256q-0.26872-0.=
14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.3=
9274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3=
893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26=
527 0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849=
-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.=
54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17=
914z"/><path id=3D"path100" d=3D"m31.529 37.008q-0.50987 0-0.80615 0.39963-=
0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8=
096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0886 0-0.68=
558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2=
988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 =
0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4=
883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"=
path102" d=3D"m33.982 36.563h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.7=
9237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.8=
3371 3.1626h-0.74759z"/><path id=3D"path104" d=3D"m40.81 39.836h2.4288v0.58=
567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.=
89228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40=
997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.113=
69-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0=
.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.4=
7542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613=
 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z"/></g><rect id=3D"r=
ect9379" x=3D"15.436" y=3D"62.186" width=3D"33.768" height=3D"13.398" rx=3D=
"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#000"=
 stroke-width=3D".52917"/><g id=3D"text9383" stroke-width=3D".26458px" aria=
-label=3D"file"><path id=3D"path124" d=3D"m30.837 65.488v3.8585h-0.63734v-3=
.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-=
0.63045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-0.60=
634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-0.63=
734-1.4952h0.63734v0.80271h-0.63734z"/><path id=3D"path126" d=3D"m32.163 63=
.986h0.6339v5.3606h-0.6339z"/><path id=3D"path128" d=3D"m37.424 67.259v0.31=
006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 =
0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 =
0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.=
53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.5581=
 1.3815-0.5581 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.=
6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006=
-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"=
g22369" transform=3D"translate(78.903 34.429)" fill=3D"none" stroke=3D"#000=
" stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path219=
20" d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round" style=3D=
"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate(84.24 30.=
251)"><rect id=3D"rect22371" x=3D"-75.456" y=3D"-25.487" width=3D"47.071" h=
eight=3D"13.398" fill=3D"none" stop-color=3D"#000000" stroke=3D"#808080" st=
roke-width=3D".52917"/><g id=3D"text22477" fill=3D"#808080" stroke-width=3D=
".26458px" aria-label=3D"virtio-blk"><path id=3D"path75" d=3D"m-67.446-20.0=
16h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469 3.8585h-0.86127z"/><=
path id=3D"path77" d=3D"m-62.815-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6=
339v0.80271h-0.6339z"/><path id=3D"path79" d=3D"m-58.619-19.424q-0.1068-0.0=
6201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.35=
14-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0=
.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.1=
4469 0.01034 0.07924 0.0069 0.1757 0.02411z"/><path id=3D"path81" d=3D"m-57=
.327-21.112v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 =
0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.73381 0-1.0129-0=
.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1=
.0955z"/><path id=3D"path83" d=3D"m-55.188-20.016h0.6339v3.8585h-0.6339zm0-=
1.5021h0.6339v0.80271h-0.6339z"/><path id=3D"path85" d=3D"m-51.733-19.572q-=
0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 =
1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.3=
9963 0.29628-1.0887 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.4030=
8zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.94=
74-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0=
.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.30=
22-0.53744z"/><path id=3D"path87" d=3D"m-49.1-18.373h1.8569v0.565h-1.8569z"=
/><path id=3D"path89" d=3D"m-43.464-18.084q0-0.69936-0.28939-1.0955-0.28594=
-0.39963-0.78893-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 =
1.0955t0.28594 1.099q0.28939 0.39619 0.79237 0.39619 0.50298 0 0.78893-0.39=
619 0.28939-0.39963 0.28939-1.099zm-2.1566-1.347q0.19982-0.34451 0.50298-0.=
50988 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811 0.44097 0.558=
11 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.55811-1.1403 0.55811-0.42375 0=
-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332v0.57878h-0.63734v-5.3606h0=
.63734z"/><path id=3D"path91" d=3D"m-41.756-21.518h0.6339v5.3606h-0.6339z"/=
><path id=3D"path93" d=3D"m-39.819-21.518h0.63734v3.166l1.8914-1.664h0.8096=
l-2.0464 1.8052 2.1325 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.63734z"/></=
g></g><rect id=3D"rect23797" x=3D".26458" y=3D".26458" width=3D"76.401" hei=
ght=3D"83.942" rx=3D"6.3061" ry=3D"5.4057" fill=3D"none" stop-color=3D"#000=
000" stroke=3D"#802400" stroke-dasharray=3D"2.11666, 2.11666" stroke-lineca=
p=3D"round" stroke-width=3D".52917"/><path id=3D"path24007" d=3D"m32.315 80=
.657v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"=
url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" s=
troke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path25180"=
 d=3D"m32.315 52.012v9.2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" =
marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.0=
5833, 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path =
id=3D"path25334" d=3D"m32.315 19.127v13.399" fill=3D"none" marker-end=3D"ur=
l(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-=
dasharray=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D"paint-order=
:normal"/><rect id=3D"rect35415" x=3D"17.503" y=3D"71.251" width=3D"29.634"=
 height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#00000=
0" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D=
"text35918" stroke-width=3D".26458px" aria-label=3D"prot-node"><path id=3D"=
path131" d=3D"m21.06 76.592v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987=
-0.24116 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 =
0.39067 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.7=
9823 0.39067-0.29662 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5=
096-0.94292q0-0.48955-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55=
466 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.2773=
3 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path =
id=3D"path133" d=3D"m25.331 74.711q-0.07476-0.04341-0.16399-0.0627-0.08682-=
0.0217-0.19293-0.0217-0.3762 0-0.57878 0.24598-0.20016 0.24357-0.20016 0.70=
177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598 0.36415-0.36415 =
0.22428-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072 0.05547 0.0048 0.1=
2299 0.01688z"/><path id=3D"path135" d=3D"m26.735 74.608q-0.35691 0-0.56431=
 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.566=
72 0.27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0=
.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3=
762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0=
.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.=
0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path137" d=3D"m29.149 73.=
53v0.76688h0.91398v0.34486h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.0916=
4 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051=
-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34486h0.32556v-0.76688=
z"/><path id=3D"path139" d=3D"m30.422 75.447h1.2998v0.3955h-1.2998z"/><path=
 id=3D"path141" d=3D"m34.674 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.149=
52-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265=
h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.=
12058 0.4992-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84=
646z"/><path id=3D"path143" d=3D"m36.605 74.608q-0.35691 0-0.56431 0.27974-=
0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.2773=
3 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 0-0.4799-0.20739-=
0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.=
33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916=
 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0=
.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path145" d=3D"m4=
0.358 74.707v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.35=
45 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.3062=
7-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-0.39067 0.2=
9903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.=
48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733 0.35209 0 0.55466-0.2=
7733 0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55=
466-0.27974-0.35209 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><p=
ath id=3D"path147" d=3D"m44.026 75.536v0.21704h-2.0402q0.02894 0.4582 0.274=
92 0.69936 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116=
-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10128-0.48955 0.15434-0.2508 0.05=
305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.=
66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35=
209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.204=
98-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.2218=
6 0.20981-0.25563 0.59083z"/></g><rect id=3D"rect38770" x=3D"17.503" y=3D"4=
2.585" width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenod=
d" stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round" stroke-w=
idth=3D".529"/><g id=3D"text38774" stroke-width=3D".26458px" aria-label=3D"=
fmt-node"><path id=3D"path107" d=3D"m22.93 44.774v0.36897h-0.42444q-0.23874=
 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.34726v0.23875h0.7307v0.34485h-0=
.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-0.45096 0=
.20981-0.65595 0.20981-0.2074 0.66559-0.2074z"/><path id=3D"path109" d=3D"m=
25.405 46.343q0.1664-0.29904 0.39791-0.44132 0.23151-0.14228 0.54501-0.1422=
8 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.83922v1.6302h-0.44614v-=
1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.41961-0.1881-0.34485 0-0.=
54501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57=
636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0.2291-=
0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0.36=
415-0.36656t0.50402-0.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952 0.3062=
7 0.43408z"/><path id=3D"path111" d=3D"m28.552 45.058v0.76688h0.91398v0.344=
85h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.0940=
5h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0.19534=
-0.69935v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=3D"path113"=
 d=3D"m29.825 46.975h1.2998v0.3955h-1.2998z"/><path id=3D"path115" d=3D"m34=
.077 46.896v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.190=
51-0.44855-0.19051-0.35932 0-0.56672 0.2291-0.2074 0.2291-0.2074 0.6246v1.5=
265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704=
-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 =
0.84646z"/><path id=3D"path117" d=3D"m36.008 46.136q-0.35691 0-0.56431 0.27=
974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.=
27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074=
-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0=
.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.5811=
9 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 =
0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path119" d=3D"m39.761 46.235v-=
1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.2=
1222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30=
627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125=
 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 =
0.76929 0.20257 0.27733 0.55466 0.27733 0.35209 0 0.55466-0.27733 0.20257-0=
.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.=
35209 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path=
121" d=3D"m43.429 47.065v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.2=
4839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.4774=
9-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05305-0.50884 0.=
05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-=
1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.=
34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.1=
9775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25=
563 0.59083z"/></g><g id=3D"g4466" transform=3D"translate(1.1863 -2.0666)">=
<rect id=3D"rect951" x=3D"61.379" y=3D"16.76" width=3D"28.304" height=3D"19=
.996" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"=
#808080" stroke-width=3D".52917"/><g id=3D"text955" fill=3D"#808080" stroke=
-width=3D".26458px" aria-label=3D"NBD server"><path id=3D"path56" d=3D"m68.=
257 20.548h0.93707l2.2807 4.3029v-4.3029h0.67524v5.1435h-0.93707l-2.2807-4.=
3029v4.3029h-0.67524z"/><path id=3D"path58" d=3D"m74.231 23.235v1.8845h1.11=
62q0.56155 0 0.83027-0.23082 0.27216-0.23427 0.27216-0.71314 0-0.48231-0.27=
216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.5503h1.0301q0.50988=
 0 0.75792-0.18948 0.25149-0.19293 0.25149-0.58567 0-0.3893-0.25149-0.58222=
-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.57189h1.7777q0.79582 0 1.2265 =
0.33073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.22049 0.75103-0.22049 0=
.27905-0.64768 0.34796 0.51332 0.11024 0.79582 0.46164 0.28594 0.34796 0.28=
594 0.87161 0 0.68902-0.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466=
z"/><path id=3D"path60" d=3D"m79.071 21.12v3.9998h0.8406q1.0645 0 1.5572-0.=
48231 0.49609-0.48231 0.49609-1.5227 0-1.0335-0.49609-1.5124-0.49265-0.4823=
1-1.5572-0.48231zm-0.69591-0.57189h1.4297q1.4952 0 2.1945 0.62356 0.69936 0=
.62012 0.69936 1.943 0 1.3298-0.7028 1.9534-0.7028 0.62356-2.1911 0.62356h-=
1.4297z"/><path id=3D"path62" d=3D"m67.297 29.002v0.59945q-0.26872-0.1378-0=
.55811-0.20671-0.28939-0.0689-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23=
427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.678=
68 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 =
0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31=
006 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.182=
59 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.1515=
8 0.24116-0.15503 0.24116-0.43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0=
.76137-0.26527l-0.22049-0.05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.=
25838-0.26183-0.70624 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.296=
28 0.3514 0 0.66146 0.05168 0.31006 0.05168 0.57189 0.15503z"/><path id=3D"=
path64" d=3D"m71.814 30.659v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908=
 0.35485 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0=
.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.35829 0.07579-0.72=
692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.947=
4 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.=
45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.830=
27-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972=
-0.36518 0.84405z"/><path id=3D"path66" d=3D"m75.09 29.481q-0.1068-0.06201-=
0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.=
28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.1998=
2-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 =
0.01033 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path68" d=3D"m75.3 28.=
889h0.67179l1.2058 3.2384 1.2058-3.2384h0.6718l-1.4469 3.8585h-0.86127z"/><=
path id=3D"path70" d=3D"m83.231 30.659v0.31006h-2.9146q0.04134 0.65457 0.39=
274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.3445=
1-0.08957 0.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.35829 0=
.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4=
538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299=
 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.=
29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31=
695 0.29972-0.36518 0.84405z"/><path id=3D"path72" d=3D"m86.507 29.481q-0.1=
068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.826=
82 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.=
59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.0654=
6 0 0.14469 0.01033 0.07924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"pa=
th4501" d=3D"m42.542 32.486c0-7.5272 6.2582-7.9595 6.2582-7.9595h12.801" fi=
ll=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Msta=
rt)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D"=
.52917" style=3D"paint-order:normal"/></svg>
diff --git a/screenshots/2021-08-18-block-graph-c.svg b/screenshots/2021-08=
-18-block-graph-c.svg
new file mode 100644
index 0000000..bcdf868
--- /dev/null
+++ b/screenshots/2021-08-18-block-graph-c.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"46.756mm" height=3D"107.74mm" version=3D"1.1" vi=
ewBox=3D"0 0 46.756 107.74" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"auto"=
><path id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-=
4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"con=
text-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=
=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=
=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.03=
37-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" f=
ill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stro=
ke-width=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D".26458" y=3D=
"9.1324" width=3D"46.227" height=3D"70.624" rx=3D"3.8155" ry=3D"4.5481" fil=
l=3D"none" stop-color=3D"#000000" stroke=3D"#802400" stroke-dasharray=3D"2.=
11666, 2.11666" stroke-linecap=3D"round" stroke-width=3D".52917"/><rect id=
=3D"rect991" x=3D"6.494" y=3D"29.025" width=3D"33.768" height=3D"13.398" rx=
=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#0=
00" stroke-width=3D".52917"/><g id=3D"text3313" stroke-width=3D".26458px" a=
ria-label=3D"qcow2"><path id=3D"path54" d=3D"m13.113 34.046q0 0.69936 0.285=
94 1.099 0.28939 0.39619 0.79237 0.39619t0.79237-0.39619q0.28939-0.39963 0.=
28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963t-0.79237 0.399=
63q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982 0.34451-0.50643 0=
.51332-0.30317 0.16536-0.73036 0.16536-0.69935 0-1.1403-0.55811-0.43753-0.5=
5811-0.43753-1.4676t0.43753-1.4676q0.44097-0.5581 1.1403-0.5581 0.42719 0 0=
.73036 0.16881 0.30661 0.16536 0.50643 0.50988v-0.58567h0.6339v5.3261h-0.63=
39z"/><path id=3D"path56" d=3D"m19.99 32.261v0.59256q-0.26872-0.14814-0.540=
88-0.22049-0.26872-0.07579-0.54432-0.07579-0.61667 0-0.95774 0.39274-0.3410=
6 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561=
 0 0.54432-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402=
-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.=
51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.422=
8-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z"/><pat=
h id=3D"path58" d=3D"m22.587 32.557q-0.50987 0-0.80615 0.39963-0.29628 0.39=
619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 =
0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68557-0.29628-1.0852-0.2=
9628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1.=
4883q0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.302=
2-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0=
.53744 1.3022-0.53744z"/><path id=3D"path60" d=3D"m25.04 32.113h0.6339l0.79=
237 3.011 0.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 =
3.8585h-0.74759l-0.83027-3.1626-0.83371 3.1626h-0.74759z"/><path id=3D"path=
62" d=3D"m31.868 35.386h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.07=
83-1.099 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339 0.1=
3436-0.26183 0.13436-0.51332 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74=
759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.70=
28q0.4203-0.16881 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0=
 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.1=
1713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164 0.47542=
-1.3022 1.3333z"/></g><rect id=3D"rect9379" x=3D"6.494" y=3D"57.736" width=
=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"none" sto=
p-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"text9=
383" stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path82" d=3D=
"m21.895 61.038v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.=
60634v-0.49265h0.60634v-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0=
.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1=
378-0.13091 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><p=
ath id=3D"path84" d=3D"m23.221 59.536h0.6339v5.3606h-0.6339z"/><path id=3D"=
path86" d=3D"m28.482 62.809v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908=
 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0=
.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.7=
2692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.94=
74 0.50988-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0=
.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83=
027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.2997=
2-0.36518 0.84405z"/></g><g id=3D"g22369" transform=3D"translate(69.961 29.=
979)" fill=3D"none" stroke=3D"#000" stroke-width=3D".52917"><path id=3D"rec=
t18531" d=3D"m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z" stop-colo=
r=3D"#000000"/><path id=3D"path21920" d=3D"m-42.779 58.06v3.41l3.1067 1e-6"=
 stroke-linecap=3D"round" style=3D"paint-order:normal"/></g><g id=3D"g25195=
" transform=3D"translate(75.298 30.046)"><rect id=3D"rect22371" x=3D"-66.56=
" y=3D"-29.781" width=3D"29.28" height=3D"17.692" fill=3D"#fff" fill-rule=
=3D"evenodd" stop-color=3D"#000000" stroke=3D"#808080" stroke-width=3D".529=
17"/><g id=3D"text22477" fill=3D"#808080" stroke-width=3D".26458px" aria-la=
bel=3D"NBD server"><path id=3D"path35" d=3D"m-59.195-27.145h0.93707l2.2807 =
4.3029v-4.3029h0.67524v5.1435h-0.93707l-2.2807-4.3029v4.3029h-0.67524z"/><p=
ath id=3D"path37" d=3D"m-53.221-24.458v1.8845h1.1162q0.56155 0 0.83027-0.23=
082 0.27216-0.23427 0.27216-0.71314 0-0.48231-0.27216-0.70969-0.26872-0.230=
82-0.83027-0.23082zm0-2.1153v1.5503h1.0301q0.50988 0 0.75792-0.18948 0.2514=
9-0.19292 0.25149-0.58567 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.75792-=
0.19293zm-0.69591-0.57189h1.7777q0.79582 0 1.2265 0.33073 0.43064 0.33073 0=
.43064 0.94051 0 0.47198-0.22049 0.75103-0.22049 0.27905-0.64768 0.34795 0.=
51332 0.11024 0.79582 0.46164 0.28594 0.34795 0.28594 0.87161 0 0.68902-0.4=
6853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z"/><path id=3D"path39" d=
=3D"m-48.38-26.573v3.9998h0.8406q1.0645 0 1.5572-0.48231 0.49609-0.48231 0.=
49609-1.5227 0-1.0335-0.49609-1.5124-0.49265-0.48231-1.5572-0.48231zm-0.695=
91-0.57189h1.4297q1.4952 0 2.1945 0.62356 0.69936 0.62012 0.69936 1.943 0 1=
.3298-0.7028 1.9534-0.7028 0.62356-2.1911 0.62356h-1.4297z"/><path id=3D"pa=
th41" d=3D"m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-=
0.0689-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.4=
3408 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04=
823q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.537=
44-0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0=
.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34=
106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.241=
16-0.43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049=
-0.05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0=
-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.0=
5168t0.57189 0.15503z"/><path id=3D"path43" d=3D"m-55.638-17.034v0.31006h-2=
.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.3651=
8 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.1446=
9-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-=
0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.38=
15-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339=
-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.5=
3054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path4=
5" d=3D"m-52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.2=
7561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326=
h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.=
17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.024=
12z"/><path id=3D"path47" d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 1.2058=
-3.2384h0.67179l-1.4469 3.8585h-0.86128z"/><path id=3D"path49" d=3D"m-44.22=
-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9=
853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.599=
45q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329=
 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.=
51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.454=
75 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/=
><path id=3D"path51" d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0=
.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.2=
8594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-=
0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0=
.0069 0.1757 0.02412z"/></g></g><path id=3D"path24007" d=3D"m23.373 76.207v=
10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#=
Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke=
-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path25180" d=3D=
"m23.373 47.562v9.2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marke=
r-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833,=
 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D=
"path25334" d=3D"m23.373 18.929v9.1469" fill=3D"none" marker-end=3D"url(#Ar=
row1Mend)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasha=
rray=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D"paint-order:norm=
al"/><rect id=3D"rect35415" x=3D"8.5609" y=3D"66.8" width=3D"29.634" height=
=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stro=
ke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text35=
918" stroke-width=3D".26458px" aria-label=3D"prot-node"><path id=3D"path89"=
 d=3D"m12.118 72.142v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.2411=
6 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067=
 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0.=
39067-0.29662 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.9=
4292q0-0.48955-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974-0.35209 0-0.=
55466 0.27974-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.277=
33 0.55466 0.27733 0.35209 0 0.55225-0.27733 0.20257-0.27974 0.20257-0.7692=
9z"/><path id=3D"path91" d=3D"m16.389 70.261q-0.07476-0.04341-0.16399-0.062=
7-0.08682-0.0217-0.19292-0.0217-0.3762 0-0.57878 0.24598-0.20016 0.24357-0.=
20016 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598 0.3641=
5-0.36415 0.22428-0.12058 0.54502-0.12058 0.04582 0 0.10128 0.0072 0.05547 =
0.0048 0.12299 0.01688z"/><path id=3D"path93" d=3D"m17.793 70.157q-0.35691 =
0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498 0.76447q0.2074 0.=
27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206=
 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0=
 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33=
038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-=
1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=
=3D"path95" d=3D"m20.207 69.08v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.=
33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45=
579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.325=
56v-0.34485h0.32556v-0.76688z"/><path id=3D"path97" d=3D"m21.48 70.997h1.29=
98v0.3955h-1.2998z"/><path id=3D"path99" d=3D"m25.732 70.917v1.6302h-0.4437=
3v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2=
291t-0.2074 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0=
.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939 0.=
23874 0.28698 0.23874 0.84646z"/><path id=3D"path101" d=3D"m27.663 70.157q-=
0.35691 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498 0.76447q0=
.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074=
-0.76206 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.=
57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.04=
18-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0=
.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/><pa=
th id=3D"path103" d=3D"m31.416 70.256v-1.4614h0.44373v3.7524h-0.44373v-0.40=
514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955=
 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.=
39067 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35=
691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27=
733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.202=
57-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.7668=
8z"/><path id=3D"path105" d=3D"m35.084 71.086v0.21704h-2.0402q0.02894 0.458=
2 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 =
0.24116-0.0627 0.47749-0.1881v0.41961q-0.23875 0.10129-0.48955 0.15434-0.25=
08 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.01=
77 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.860=
93 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.3641=
5-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981=
-0.22186 0.20981-0.25563 0.59083z"/></g><rect id=3D"rect38770" x=3D"8.5609"=
 y=3D"38.135" width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D=
"evenodd" stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round" s=
troke-width=3D".529"/><g id=3D"text38774" stroke-width=3D".26458px" aria-la=
bel=3D"fmt-node"><path id=3D"path65" d=3D"m13.988 40.323v0.36897h-0.42444q-=
0.23875 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.34727v0.23874h0.7307v0.3=
4485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-0.=
45096 0.20981-0.65595 0.20981-0.20739 0.66559-0.20739z"/><path id=3D"path67=
" d=3D"m16.463 41.893q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228 0.5450=
1-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.83923v1.6302h-0=
.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.41961-0.1881-0.34=
486 0-0.54502 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13=
746-0.57636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016=
 0.2291-0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24=
839 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.4992 0.1495=
2 0.20739 0.14952 0.30627 0.43408z"/><path id=3D"path69" d=3D"m19.61 40.608=
v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 =
0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0=
.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"=
/><path id=3D"path71" d=3D"m20.883 42.525h1.2998v0.3955h-1.2998z"/><path id=
=3D"path73" d=3D"m25.135 42.446v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0=
.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.=
44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.1205=
8 0.4992-0.12058 0.46543 0 0.70418 0.28939 0.23875 0.28698 0.23875 0.84646z=
"/><path id=3D"path75" d=3D"m27.066 41.686q-0.35691 0-0.56431 0.27974-0.207=
4 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3=
545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-=
0.20739-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0=
.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762=
-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-=
1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path77" d=3D"m30.819 41=
.785v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.359=
32-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.3906=
7-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.39067 0.79823-0.39067 0=
.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 =
0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466-0.27733q0.2=
0257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27=
974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path79=
" d=3D"m34.487 42.614v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.2483=
9 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0=
.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.053=
06-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0=
514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.349=
68 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.1977=
5-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563=
 0.59083z"/></g></svg>
diff --git a/screenshots/2021-08-18-block-graph-d.svg b/screenshots/2021-08=
-18-block-graph-d.svg
new file mode 100644
index 0000000..67c1e81
--- /dev/null
+++ b/screenshots/2021-08-18-block-graph-d.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"105.13mm" height=3D"108.92mm" version=3D"1.1" vi=
ewBox=3D"0 0 105.13 108.92" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"auto"=
><path id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-=
4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"con=
text-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=
=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=
=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.03=
37-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" f=
ill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stro=
ke-width=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D".26458" y=3D=
".26458" width=3D"58.32" height=3D"70.624" rx=3D"4.8137" ry=3D"4.5481" fill=
=3D"none" stop-color=3D"#000000" stroke=3D"#802400" stroke-dasharray=3D"2.1=
1666, 2.11666" stroke-linecap=3D"round" stroke-width=3D".52917"/><rect id=
=3D"rect991" x=3D"6.4942" y=3D"20.157" width=3D"33.768" height=3D"13.398" r=
x=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#=
000" stroke-width=3D".52917"/><g id=3D"text3313" stroke-width=3D".26458px" =
aria-label=3D"qcow2"><path id=3D"path64" d=3D"m13.113 25.178q0 0.69936 0.28=
594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0.79237-0.39619 0.28939=
-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963-0.5=
0298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.1998=
2 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936 0-1.1403-=
0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.5581 1.1403=
-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.50988v-0.58567h=
0.6339v5.3261h-0.6339z"/><path id=3D"path66" d=3D"m19.99 23.393v0.59256q-0.=
26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.9=
5774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.9=
5774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.585=
67q-0.26527 0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 =
0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.=
52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54=
088 0.17914z"/><path id=3D"path68" d=3D"m22.587 23.69q-0.50988 0-0.80615 0.=
39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 =
0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68557-=
0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 =
0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53=
744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 =
0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path=
70" d=3D"m25.04 23.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3=
.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371 3=
.1626h-0.74759z"/><path id=3D"path72" d=3D"m31.868 26.518h2.4288v0.58567h-3=
.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.89228 =
0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.=
28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.3=
6174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.36518=
-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1=
.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 0.099=
91-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect937=
9" x=3D"6.4942" y=3D"48.868" width=3D"33.768" height=3D"13.398" rx=3D"1.796=
4" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#000" strok=
e-width=3D".52917"/><g id=3D"text9383" stroke-width=3D".26458px" aria-label=
=3D"file"><path id=3D"path92" d=3D"m21.895 52.17v3.8585h-0.63734v-3.3659h-1=
.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.63045 =
0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.3=
4106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-0.63734-1.49=
52h0.63734v0.80271h-0.63734z"/><path id=3D"path94" d=3D"m23.221 50.668h0.63=
39v5.3606h-0.6339z"/><path id=3D"path96" d=3D"m28.482 53.941v0.31006h-2.914=
6q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 =
0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.=
69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53=
744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0=
.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.1=
8604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054=
 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369" =
transform=3D"translate(69.961 21.111)" fill=3D"none" stroke=3D"#000" stroke=
-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715l3.1067 =
3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920" d=3D=
"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round" style=3D"paint-o=
rder:normal"/></g><g id=3D"g25195" transform=3D"translate(110.44 35.205)"><=
rect id=3D"rect22371" x=3D"-66.56" y=3D"-29.781" width=3D"29.28" height=3D"=
17.692" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=
=3D"#808080" stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#808080" =
stroke-width=3D".26458px" aria-label=3D"FUSE server"><path id=3D"path43" d=
=3D"m-60.499-27.145h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.45=
64h-0.69591z"/><path id=3D"path45" d=3D"m-56.519-27.145h0.69936v3.1247q0 0.=
82682 0.29972 1.192 0.29972 0.36174 0.97152 0.36174 0.66835 0 0.96807-0.361=
74 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5=
193-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4745-0.51332-0.49609-0.51332=
-0.49609-1.5193z"/><path id=3D"path47" d=3D"m-48.193-26.976v0.67868q-0.3961=
9-0.18948-0.74759-0.2825-0.3514-0.09302-0.67868-0.09302-0.56844 0-0.8785 0.=
22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.1=
7226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.1472 0.52366 0.37207 =
0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.3=
8585-0.36518 0-0.77859-0.08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42=
375 0.23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984=
-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-=
0.2136-0.76137-0.3204l-0.42375-0.08268q-0.77859-0.15503-1.1265-0.48576-0.34=
796-0.33073-0.34796-0.91984 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264=
-0.39274 0.36174 0 0.73725 0.06546 0.37552 0.06546 0.76826 0.19637z"/><path=
 id=3D"path49" d=3D"m-46.797-27.145h3.2522v0.58567h-2.5563v1.5227h2.4495v0.=
58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z"/><path id=3D"path51" d=3D"m-6=
0.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945=
-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049=
 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.=
14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.8=
5094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33417-0.05857=
-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.=
67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0=
.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58=
911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54432 0.385=
85-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0=
.15503z"/><path id=3D"path53" d=3D"m-55.638-17.034v0.31006h-2.9146q0.04134 =
0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70625-0.=
08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22=
049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.5374=
4-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.7=
7859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.00=
69-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094=
 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path55" d=3D"m-52.3=
61-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0=
.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8=
585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-=
0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02412z"/><path id=
=3D"path57" d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0.6717=
9l-1.4469 3.8585h-0.86128z"/><path id=3D"path59" d=3D"m-44.22-17.034v0.3100=
6h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.=
36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.=
14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53=
744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 =
1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.=
6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006=
-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"p=
ath61" d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101=
-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.=
0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.3203=
9-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0=
.02412z"/></g></g><path id=3D"path24007" d=3D"m23.373 67.339v10.837" fill=
=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart=
)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".5=
2917" style=3D"paint-order:normal"/><path id=3D"path25180" d=3D"m23.373 38.=
694v9.2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"u=
rl(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" st=
roke-width=3D".52917" style=3D"paint-order:normal"/><rect id=3D"rect35415" =
x=3D"8.561" y=3D"57.933" width=3D"29.634" height=3D"8.4415" fill=3D"#fff" f=
ill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=
=3D"round" stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".2645=
8px" aria-label=3D"prot-node"><path id=3D"path99" d=3D"m12.118 63.274v1.432=
5h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116 0.35209-0.35691 0.21463-=
0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39067 0.30868 1=
.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662 0-0.51125-0.=
11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.48955-0.20257-0.7=
6688-0.20016-0.27974-0.55225-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20=
016 0.76688t0.20016 0.76929q0.20257 0.27733 0.55466 0.27733t0.55225-0.27733=
q0.20257-0.27974 0.20257-0.76929z"/><path id=3D"path101" d=3D"m16.389 61.39=
3q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.3762 0-0.=
57878 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-2.701h0.4461=
4v0.41961q0.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0=
.04582 0 0.10129 0.0072 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path1=
03" d=3D"m17.793 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.7=
6206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974=
 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.561=
9-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 =
0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.=
3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762=
 0.91157-0.3762z"/><path id=3D"path105" d=3D"m20.207 60.212v0.76688h0.91398=
v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 =
0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0=
.19534-0.69935v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=3D"pa=
th107" d=3D"m21.48 62.129h1.2998v0.3955h-1.2998z"/><path id=3D"path109" d=
=3D"m25.732 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.448=
55-0.19051q-0.35932 0-0.56672 0.2291-0.20739 0.2291-0.20739 0.6246v1.5265h-=
0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12=
058 0.49919-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.846=
46z"/><path id=3D"path111" d=3D"m27.663 61.29q-0.35691 0-0.56431 0.27974-0.=
2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 =
0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.759=
64-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038=
 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.37=
62-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.3279=
7-1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path113" d=3D"m31.416=
 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.=
35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.3=
9067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 =
0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955=
 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733 0.35209 0 0.55466-0.27733 =
0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0=
.27974-0.35209 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path i=
d=3D"path115" d=3D"m35.084 62.218v0.21704h-2.0402q0.02894 0.4582 0.27492 0.=
69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.06=
27 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05306-0=
.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318=
 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0=
.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.=
58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.2=
0981-0.25563 0.59083z"/></g><rect id=3D"rect38770" x=3D"8.561" y=3D"29.267"=
 width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" sto=
p-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=
=3D".529"/><g id=3D"text38774" stroke-width=3D".26458px" aria-label=3D"fmt-=
node"><path id=3D"path75" d=3D"m13.989 31.456v0.36897h-0.42444q-0.23874 0-0=
.3328 0.09646-0.09164 0.09646-0.09164 0.34727v0.23874h0.7307v0.34485h-0.730=
7v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-0.45096 0.209=
81-0.65595 0.20981-0.20739 0.66559-0.20739z"/><path id=3D"path77" d=3D"m16.=
463 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228 0.54501-0.14228 0=
.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.83923v1.6302h-0.44614v-1.6=
158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.41961-0.1881-0.34485 0-0.545=
01 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636=
-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0.2291-0.2=
0016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0.36415=
-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952 0.2074 0=
.14952 0.30627 0.43408z"/><path id=3D"path79" d=3D"m19.61 31.74v0.76688h0.9=
1398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36=
897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.192=
93-0.19534-0.69936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=
=3D"path81" d=3D"m20.883 33.657h1.2998v0.3955h-1.2998z"/><path id=3D"path83=
" d=3D"m25.135 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.1=
4952-0.19051-0.44855-0.19051-0.35932 0-0.56672 0.2291-0.2074 0.2291-0.2074 =
0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.364=
15 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.2869=
8 0.23874 0.84646z"/><path id=3D"path85" d=3D"m27.067 32.818q-0.35691 0-0.5=
6431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0=
.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.47=
99-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916=
 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.37=
62-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0=
-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path87=
" d=3D"m30.819 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.2=
4116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.390=
67-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.39067 =
0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-=
1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.=
55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.2=
7974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><=
path id=3D"path89" d=3D"m34.487 33.747v0.21704h-2.0402q0.02894 0.4582 0.274=
92 0.69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116=
-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05=
306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.=
66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35=
209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.204=
98-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.2218=
6 0.20981-0.25563 0.59083z"/></g><path id=3D"path8203" d=3D"m23.908 19.196c=
0-8.7692 8.1536-8.1536 8.1536-8.1536h10.854" fill=3D"none" marker-end=3D"ur=
l(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-=
dasharray=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D"paint-order=
:normal"/><g id=3D"g9231" transform=3D"translate(128.75 21.111)" fill=3D"no=
ne" stroke=3D"#0081cf" stroke-width=3D".52917"><path id=3D"path9227" d=3D"m=
-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z" stop-color=3D"#000000"/=
><path id=3D"path9229" d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=
=3D"round" style=3D"paint-order:normal"/></g><path id=3D"path9233" d=3D"m74=
.123 14.397c8.7692 0 8.1536 8.1536 8.1536 8.1536v55.724" fill=3D"none" mark=
er-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#=
000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D=
"paint-order:normal"/><g id=3D"text9935" stroke-width=3D".26458px" aria-lab=
el=3D"$image_path"><path id=3D"path118" d=3D"m2.3853 105.12v1.4952q0.37896-=
0.0103 0.59256-0.21015 0.2136-0.19981 0.2136-0.54432 0-0.3204-0.19293-0.496=
1-0.19293-0.17914-0.61323-0.2446zm-0.34451-0.65457v-1.4228q-0.35829 0.0138-=
0.56155 0.2067-0.19982 0.19293-0.19982 0.51677 0 0.29628 0.18604 0.46853 0.=
18948 0.17226 0.57533 0.23082zm0.34451 3.6897h-0.34451l-0.00345-1.037q-0.35=
14-0.0172-0.69935-0.0965-0.34451-0.0792-0.68213-0.22049v-0.62012q0.34451 0.=
2136 0.69246 0.32729 0.3514 0.11368 0.69246 0.12057v-1.5778q-0.68902-0.1068=
-1.037-0.4203-0.34795-0.31351-0.34795-0.83027 0-0.54088 0.36174-0.86127 0.3=
6518-0.32384 1.0232-0.37208v-0.80959h0.34451l0.00345 0.80959q0.27216 0.0172=
 0.55122 0.0689t0.56844 0.14125v0.596q-0.29283-0.14814-0.57189-0.22738-0.27=
561-0.0827-0.55122-0.0965v1.4848q0.70969 0.10679 1.0818 0.44097 0.37207 0.3=
3417 0.37207 0.86472 0 0.53054-0.40308 0.88539-0.39963 0.35484-1.0473 0.385=
85z"/><path id=3D"path120" d=3D"m5.1311 103.26h1.6226v3.3659h1.2575v0.49265=
h-3.1488v-0.49265h1.2575v-2.8732h-0.98874zm0.98874-1.5021h0.6339v0.8027h-0.=
6339z"/><path id=3D"path122" d=3D"m10.826 103.66q0.11713-0.24805 0.29628-0.=
36518 0.18259-0.12058 0.43753-0.12058 0.46509 0 0.65457 0.36174 0.19292 0.3=
5829 0.19292 1.3539v2.2359h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.0895=
7-0.19981-0.33073-0.19981-0.27561 0-0.37896 0.21359-0.09991 0.21015-0.09991=
 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.09991-1.0198-0.09646-0.19292-0=
.3514-0.19292-0.25149 0-0.3514 0.21359-0.096463 0.21015-0.096463 0.99908v2.=
2083h-0.57532v-3.8585h0.57533v0.33073q0.11369-0.20671 0.2825-0.31351 0.1722=
5-0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058 0.1757 0.12058 0.27216 0=
.36518z"/><path id=3D"path124" d=3D"m15.163 105.18h-0.21015q-0.55466 0-0.83=
716 0.19637-0.27905 0.19292-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.210=
15 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.36173 0.29972-0.36518 0.3031=
7-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-=
0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0=
.3514-0.33418-0.3514-0.89228 0-0.64424 0.43064-0.97841 0.43408-0.33418 1.27=
12-0.33418h0.85094v-0.0999q-0.0034-0.46165-0.23427-0.66835-0.23082-0.21015-=
0.73725-0.21015-0.32384 0-0.65457 0.093t-0.64423 0.27217v-0.6339q0.3514-0.1=
3436 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.1412=
5 0.34106 0.14125 0.55122 0.42375 0.13091 0.17225 0.18604 0.42719 0.05512 0=
.25149 0.05512 0.75792z"/><path id=3D"path126" d=3D"m19.948 105.16q0-0.7131=
4-0.23427-1.0818-0.23082-0.37207-0.67524-0.37207-0.46509 0-0.70969 0.37207-=
0.2446 0.36862-0.2446 1.0818 0 0.71313 0.2446 1.0886 0.24805 0.37207 0.7165=
8 0.37207 0.43753 0 0.66835-0.37552 0.23427-0.37551 0.23427-1.0852zm0.6339 =
1.7122q0 0.86817-0.40997 1.316-0.40997 0.44786-1.2058 0.44786-0.26183 0-0.5=
4777-0.0482t-0.57189-0.14125v-0.62701q0.33762 0.15848 0.61323 0.23427 0.275=
61 0.0758 0.50643 0.0758 0.51332 0 0.74759-0.27905 0.23427-0.27905 0.23427-=
0.88539v-0.45824q-0.15158 0.32384-0.41341 0.48231-0.26183 0.15848-0.63734 0=
.15848-0.67524 0-1.0783-0.54088-0.40308-0.54088-0.40308-1.4469 0-0.90951 0.=
40308-1.4504 0.40308-0.54088 1.0783-0.54088 0.37207 0 0.63045 0.14814 0.258=
38 0.14814 0.4203 0.4582v-0.49954h0.6339z"/><path id=3D"path128" d=3D"m25.0=
71 105.03v0.31006h-2.7457v0.0207q0 0.63045 0.32728 0.97496 0.33073 0.34451 =
0.93018 0.34451 0.30317 0 0.6339-0.0965 0.33073-0.0965 0.70624-0.29283v0.63=
045q-0.36174 0.14814-0.69936 0.22048-0.33417 0.0758-0.64768 0.0758-0.89917 =
0-1.4056-0.53744-0.50643-0.54088-0.50643-1.4883 0-0.92329 0.49609-1.4745 0.=
49609-0.55122 1.3229-0.55122 0.73725 0 1.161 0.49954 0.42719 0.49954 0.4271=
9 1.3643zm-0.6339-0.18604q-0.01378-0.5581-0.26527-0.84749-0.24805-0.29283-0=
.71658-0.29283-0.4582 0-0.75448 0.30317-0.29628 0.30316-0.3514 0.8406z"/><p=
ath id=3D"path130" d=3D"m29.736 108.51v0.27561h-4.2478v-0.27561z"/><path id=
=3D"path132" d=3D"m31.028 106.64v1.9534h-0.63734v-5.3261h0.63734v0.49265q0.=
15847-0.28595 0.4203-0.43408 0.26527-0.15159 0.60978-0.15159 0.69936 0 1.09=
55 0.54088 0.39963 0.54088 0.39963 1.4986 0 0.94051-0.39963 1.478-0.39963 0=
.53399-1.0955 0.53399-0.3514 0-0.61667-0.14814-0.26183-0.15159-0.41341-0.43=
753zm1.8604-1.44q0-0.73725-0.23427-1.1128-0.23082-0.37551-0.68902-0.37551-0=
.46164 0-0.69935 0.37896-0.23771 0.37551-0.23771 1.1093 0 0.73036 0.23771 1=
.1093 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.68902-0.37551 0.23427-0.37=
552 0.23427-1.1128z"/><path id=3D"path134" d=3D"m36.402 105.18h-0.21015q-0.=
55466 0-0.83716 0.19637-0.27905 0.19292-0.27905 0.57878 0 0.34795 0.21015 0=
.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.36173 0.29972-0.=
36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20=
326 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.940=
51-0.33073-0.3514-0.33418-0.3514-0.89228 0-0.64424 0.43064-0.97841 0.43408-=
0.33418 1.2712-0.33418h0.85094v-0.0999q-0.0034-0.46165-0.23427-0.66835-0.23=
082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.093t-0.64423 0.27217v-0.633=
9q0.3514-0.13436 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.=
81649 0.14125 0.34106 0.14125 0.55122 0.42375 0.13091 0.17225 0.18604 0.427=
19 0.05512 0.25149 0.05512 0.75792z"/><path id=3D"path136" d=3D"m40.347 102=
.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596 0.16192 0.=
16881 0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314 0-1.006-0.28594-0.292=
83-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1.0301v-1.0955z"/><path =
id=3D"path138" d=3D"m46.1 104.73v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-=
0.76481t-0.57189-0.2446q-0.44442 0-0.68557 0.31695-0.23771 0.3135-0.23771 0=
.90261v2.1808h-0.6339v-5.3606h0.6339v2.0808q0.16881-0.33073 0.4582-0.49954 =
0.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893 0.29283 0.38585 0.2=
9283 1.1713z"/></g><g id=3D"text14411" fill=3D"#0081cf" stroke-width=3D".26=
458px" aria-label=3D"mount-point"><path id=3D"path141" d=3D"m61.294 103.66q=
0.11713-0.24805 0.29628-0.36518 0.18259-0.12058 0.43753-0.12058 0.46509 0 0=
.65457 0.36174 0.19292 0.35829 0.19292 1.3539v2.2359h-0.57878v-2.2083q0-0.8=
1649-0.09302-1.0129-0.08957-0.19981-0.33073-0.19981-0.27561 0-0.37896 0.213=
59-0.09991 0.21015-0.09991 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.0999=
1-1.0198-0.09646-0.19292-0.3514-0.19292-0.25149 0-0.3514 0.21359-0.09646 0.=
21015-0.09646 0.99908v2.2083h-0.57533v-3.8585h0.57533v0.33073q0.11369-0.206=
71 0.2825-0.31351 0.17226-0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058 =
0.1757 0.12058 0.27216 0.36518z"/><path id=3D"path143" d=3D"m65.335 103.71q=
-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 =
1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.=
37897 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.375=
51zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.9=
8874-0.42375 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-=
0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z"/><pa=
th id=3D"path145" d=3D"m68.133 105.66v-2.3909h0.6339v2.3909q0 0.52021 0.182=
59 0.76481 0.18604 0.2446 0.57189 0.2446 0.44786 0 0.68557-0.3135 0.23771-0=
.31695 0.23771-0.90606v-2.1808h0.63734v3.8516h-0.63734v-0.57878q-0.16881 0.=
33418-0.46164 0.50643-0.28939 0.17226-0.67868 0.17226-0.59256 0-0.88194-0.3=
8585-0.28939-0.3893-0.28939-1.1748z"/><path id=3D"path147" d=3D"m75.33 104.=
73v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0.57189=
-0.2446-0.44442 0-0.68557 0.31695-0.23771 0.3135-0.23771 0.90261v2.1808h-0.=
6339v-3.8585h0.6339v0.57878q0.16881-0.33073 0.4582-0.49954 0.28939-0.17226 =
0.68558-0.17226 0.58911 0 0.8785 0.3893 0.29283 0.38585 0.29283 1.1713z"/><=
path id=3D"path149" d=3D"m78.072 102.17v1.0955h1.4401v0.49265h-1.4401v2.094=
6q0 0.42719 0.16192 0.596 0.16192 0.16881 0.565 0.16881h0.71314v0.50643h-0.=
77515q-0.71314 0-1.006-0.28594-0.29283-0.28595-0.29283-0.9853v-2.0946h-1.03=
01v-0.49265h1.0301v-1.0955z"/><path id=3D"path151" d=3D"m81.431 104.91h1.79=
49v0.565h-1.7949z"/><path id=3D"path153" d=3D"m85.744 106.64v1.9534h-0.6373=
4v-5.3261h0.63734v0.49265q0.15847-0.28595 0.4203-0.43408 0.26527-0.15159 0.=
60978-0.15159 0.69936 0 1.0955 0.54088 0.39963 0.54088 0.39963 1.4986 0 0.9=
4051-0.39963 1.478-0.39963 0.53399-1.0955 0.53399-0.3514 0-0.61667-0.14814-=
0.26183-0.15159-0.41341-0.43753zm1.8604-1.44q0-0.73725-0.23427-1.1128-0.230=
82-0.37551-0.68902-0.37551-0.46164 0-0.69936 0.37896-0.23771 0.37551-0.2377=
1 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936 0.37896 0.4582 0 =
0.68902-0.37551 0.23427-0.37552 0.23427-1.1128z"/><path id=3D"path155" d=3D=
"m90.822 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0=
 0.7338 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.=
37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.375=
51-0.73381-0.37551zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42=
719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0=
-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.226=
5-0.52021z"/><path id=3D"path157" d=3D"m93.83 103.26h1.6226v3.3659h1.2575v0=
.49265h-3.1488v-0.49265h1.2575v-2.8732h-0.98874zm0.98874-1.5021h0.6339v0.80=
27h-0.6339z"/><path id=3D"path159" d=3D"m100.82 104.73v2.3909h-0.63735v-2.3=
909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0.57189-0.2446-0.44442 0-0.685=
58 0.31695-0.23771 0.3135-0.23771 0.90261v2.1808h-0.6339v-3.8585h0.6339v0.5=
7878q0.16881-0.33073 0.4582-0.49954 0.28939-0.17226 0.68557-0.17226 0.58911=
 0 0.8785 0.3893 0.29284 0.38585 0.29284 1.1713z"/><path id=3D"path161" d=
=3D"m103.56 102.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0=
.596t0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314 0-1.006-0.28594-0.2928=
3-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1.0301v-1.0955z"/></g></s=
vg>
diff --git a/screenshots/2021-08-18-block-graph-e.svg b/screenshots/2021-08=
-18-block-graph-e.svg
new file mode 100644
index 0000000..4bcc615
--- /dev/null
+++ b/screenshots/2021-08-18-block-graph-e.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"195.9mm" height=3D"108.74mm" version=3D"1.1" vie=
wBox=3D"0 0 195.9 108.74" xmlns=3D"http://www.w3.org/2000/svg"><defs id=3D"=
defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"auto"><pa=
th id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.01=
77 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"context=
-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=3D".6=
25"/></marker><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=3D"auto=
"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.0337-10.92=
6-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"c=
ontext-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=
=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D"114.19" y=3D".26458"=
 width=3D"58.32" height=3D"70.624" rx=3D"5.2917" ry=3D"5.2917" fill=3D"none=
" stop-color=3D"#000000" stroke=3D"#802400" stroke-dasharray=3D"2.11666, 2.=
11666" stroke-linecap=3D"round" stroke-width=3D".52917"/><rect id=3D"rect99=
1" x=3D"120.42" y=3D"20.157" width=3D"33.768" height=3D"13.398" rx=3D"1.796=
4" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#000" strok=
e-width=3D".52917"/><g id=3D"text3313" stroke-width=3D".26458px" aria-label=
=3D"qcow2"><path id=3D"path89" d=3D"m127.04 25.178q0 0.69936 0.28594 1.099 =
0.28939 0.39619 0.79237 0.39619 0.50299 0 0.79237-0.39619 0.28939-0.39963 0=
.28939-1.099t-0.28939-1.0955q-0.28938-0.39963-0.79237-0.39963-0.50298 0-0.7=
9237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19981 0.34451-=
0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69935 0-1.1403-0.55811-0.=
43752-0.55811-0.43752-1.4676t0.43752-1.4676q0.44098-0.5581 1.1403-0.5581 0.=
42719 0 0.73036 0.16881 0.30662 0.16536 0.50643 0.50988v-0.58567h0.6339v5.3=
261h-0.6339z"/><path id=3D"path91" d=3D"m133.91 23.393v0.59256q-0.26872-0.1=
4814-0.54088-0.22049-0.26872-0.07579-0.54432-0.07579-0.61668 0-0.95774 0.39=
274-0.34107 0.3893-0.34107 1.0955t0.34107 1.099q0.34106 0.3893 0.95774 0.38=
93 0.2756 0 0.54432-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.2652=
7 0.12402-0.55121 0.18604-0.2825 0.06201-0.6029 0.06201-0.87161 0-1.3849-0.=
54777t-0.51332-1.4779q0-0.94396 0.51677-1.4848 0.52021-0.54088 1.4228-0.540=
88 0.29284 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z"/><path id=3D=
"path93" d=3D"m136.51 23.69q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29=
628 1.0887t0.29284 1.0921q0.29628 0.39619 0.80959 0.39619 0.50643 0 0.80271=
-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.=
40308zm0-0.53744q0.82683 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1=
.4883-0.47198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0.46854-0.540=
88-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.3022-0.53744z"=
/><path id=3D"path95" d=3D"m138.97 23.245h0.6339l0.79237 3.011 0.78893-3.01=
1h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74758l-0.830=
27-3.1626-0.83372 3.1626h-0.74758z"/><path id=3D"path97" d=3D"m145.79 26.51=
8h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.692=
46 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0=
.51332 0-0.40997-0.28939-0.66835-0.28595-0.25838-0.74759-0.25838-0.32728 0-=
0.69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78=
548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.4754=
2 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43063 0.=
66835-0.0861 0.09991-0.54778 0.57878-0.46164 0.47542-1.3022 1.3333z"/></g><=
rect id=3D"rect9379" x=3D"120.42" y=3D"48.868" width=3D"33.768" height=3D"1=
3.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" str=
oke=3D"#000" stroke-width=3D".52917"/><g id=3D"text9383" stroke-width=3D".2=
6458px" aria-label=3D"file"><path id=3D"path117" d=3D"m135.82 52.17v3.8585h=
-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v=
-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0.91639-0.30317h0.63735v=
0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13092 0.1378-0.13092 0.49609v0.=
34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path id=3D"path119" d=
=3D"m137.15 50.668h0.6339v5.3606h-0.6339z"/><path id=3D"path121" d=3D"m142.=
41 53.941v0.31006h-2.9146q0.0413 0.65457 0.39275 0.99908 0.35484 0.34106 0.=
98529 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.5=
9945q-0.34107 0.14469-0.69936 0.22049-0.35829 0.07579-0.72691 0.07579-0.923=
29 0-1.4642-0.53744-0.53743-0.53744-0.53743-1.4538 0-0.9474 0.50987-1.5021 =
0.51332-0.55811 1.3815-0.55811 0.7786 0 1.2299 0.50298 0.45476 0.49954 0.45=
476 1.3608zm-0.6339-0.18604q-7e-3 -0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53055 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/=
></g><g id=3D"g22369" transform=3D"translate(183.89 21.111)" fill=3D"none" =
stroke=3D"#aaa" stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.49=
4 58.06h10.715l3.1067 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path=
 id=3D"path21920" d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"r=
ound" style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"trans=
late(224.36 35.205)"><rect id=3D"rect22371" x=3D"-66.56" y=3D"-29.781" widt=
h=3D"29.28" height=3D"17.692" fill=3D"#fff" fill-rule=3D"evenodd" stop-colo=
r=3D"#000000" stroke=3D"#808080" stroke-width=3D".52917"/><g id=3D"text2247=
7" fill=3D"#808080" stroke-width=3D".26458px" aria-label=3D"FUSE server"><p=
ath id=3D"path68" d=3D"m-60.499-27.145h2.9559v0.58567h-2.26v1.5158h2.0395v0=
.58567h-2.0395v2.4564h-0.69591z"/><path id=3D"path70" d=3D"m-56.519-27.145h=
0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36174 0.97152 0.36174 0.66=
835 0 0.96807-0.36174 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936v3.2108q=
0 1.006-0.49954 1.5193-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4745-0.51=
332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path72" d=3D"m-48.193-26.=
976v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.09302-0.67868-0.09302-=
0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 =
0.51676 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.14=
72 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954=
 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.08268-0.40997-0.08268-0.85094-0=
.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12=
058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.234=
27-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q-0.77859-0.15503-=
1.1265-0.48576-0.34796-0.33073-0.34796-0.91984 0-0.68213 0.47887-1.0749 0.4=
8231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.06546 0.37552 0.06546 0.768=
26 0.19637z"/><path id=3D"path74" d=3D"m-46.797-27.145h3.2522v0.58567h-2.55=
63v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z"/><path id=
=3D"path76" d=3D"m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.=
28939-0.0689-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.234=
27 0.43408 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.2170=
4 0.04823q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0=
 0.53744-0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.0=
6201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.2756=
1 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503=
 0.24116-0.43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0=
.22049-0.05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.7=
0624 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.661=
46 0.05168t0.57189 0.15503z"/><path id=3D"path78" d=3D"m-55.638-17.034v0.31=
006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 =
0.36518 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 =
0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.=
53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.5581=
1 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-=
0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.310=
06-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D=
"path80" d=3D"m-52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.031=
01-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v=
2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32=
039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757=
 0.02412z"/><path id=3D"path82" d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 =
1.2058-3.2384h0.67179l-1.4469 3.8585h-0.86128z"/><path id=3D"path84" d=3D"m=
-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.341=
06 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872=
v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0=
.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5=
021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954=
 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.3=
1006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84=
405z"/><path id=3D"path86" d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.0=
8957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.347=
96-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.=
52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.0=
7924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"path24007" d=3D"m137.3 67=
.339v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"=
url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" s=
troke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path25180"=
 d=3D"m137.3 38.694v9.2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" m=
arker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05=
833, 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><rect i=
d=3D"rect35415" x=3D"122.49" y=3D"57.933" width=3D"29.634" height=3D"8.4415=
" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000=
" stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text35918" strok=
e-width=3D".26458px" aria-label=3D"prot-node"><path id=3D"path124" d=3D"m12=
6.04 63.274v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116 0.35209=
-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067 0.30868 =
0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0.39067-0.2=
9662 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.=
48955-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466 0.27974q-0.2=
0016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733 0.55466 0.2773=
3t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path id=3D"path126" d=
=3D"m130.31 61.393q-0.0748-0.04341-0.16398-0.0627-0.0868-0.0217-0.19293-0.0=
217-0.3762 0-0.57877 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.4461=
4v-2.701h0.44614v0.41961q0.13987-0.24598 0.36414-0.36415 0.22428-0.12058 0.=
54502-0.12058 0.0458 0 0.10128 0.0072 0.0555 0.0048 0.12299 0.01688z"/><pat=
h id=3D"path128" d=3D"m131.72 61.29q-0.35692 0-0.56431 0.27974-0.20739 0.27=
733-0.20739 0.76206t0.20498 0.76447q0.20739 0.27733 0.56672 0.27733 0.3545 =
0 0.56189-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2=
0739-0.28215-0.56189-0.28215zm0-0.3762q0.57877 0 0.90916 0.3762 0.33038 0.3=
762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33039 0.3762-0.90916 0.3762-0=
.58119 0-0.91158-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.=
0418 0.33039-0.3762 0.91158-0.3762z"/><path id=3D"path130" d=3D"m134.13 60.=
212v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892 0.42444 0.0916=
 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-=
0.19533-0.19293-0.19533-0.69936v-1.4662h-0.32557v-0.34485h0.32557v-0.76688z=
"/><path id=3D"path132" d=3D"m135.4 62.129h1.2998v0.3955h-1.2998z"/><path i=
d=3D"path134" d=3D"m139.66 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952=
-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291-0.20739 0.2291-0.20739 =
0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.364=
15 0.21704-0.12058 0.49919-0.12058 0.46544 0 0.70418 0.28939 0.23875 0.2869=
8 0.23875 0.84646z"/><path id=3D"path136" d=3D"m141.59 61.29q-0.35691 0-0.5=
6431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498 0.76447q0.2074 0.27733=
 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 0-=
0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.=
90916 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039 1.0418-0.33038=
 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0=
418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"p=
ath138" d=3D"m145.34 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.139=
87 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823=
-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79=
823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.51=
2 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466=
-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-=
0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path =
id=3D"path140" d=3D"m149.01 62.218v0.21704h-2.0402q0.0289 0.4582 0.27492 0.=
69935 0.24839 0.23874 0.68971 0.23874 0.25562 0 0.49437-0.0627 0.24115-0.06=
27 0.47749-0.1881v0.41961q-0.23875 0.10129-0.48955 0.15434-0.2508 0.05306-0=
.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318=
 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0=
.31832 0.34968 0.31832 0.95257zm-0.44372-0.13022q-5e-3 -0.36415-0.20499-0.5=
8119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20=
981-0.25562 0.59083z"/></g><rect id=3D"rect38770" x=3D"122.49" y=3D"29.267"=
 width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" sto=
p-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=
=3D".529"/><g id=3D"text38774" stroke-width=3D".26458px" aria-label=3D"fmt-=
node"><path id=3D"path100" d=3D"m127.91 31.456v0.36897h-0.42443q-0.23875 0-=
0.3328 0.09646-0.0916 0.09646-0.0916 0.34727v0.23874h0.73071v0.34485h-0.730=
71v2.3561h-0.44614v-2.3561h-0.42443v-0.34485h0.42443v-0.1881q0-0.45096 0.20=
981-0.65595 0.2098-0.20739 0.66559-0.20739z"/><path id=3D"path102" d=3D"m13=
0.39 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228 0.54501-0.14228 =
0.42203 0 0.65113 0.29662 0.2291 0.29421 0.2291 0.83923v1.6302h-0.44614v-1.=
6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.41962-0.1881-0.34485 0-0.54=
501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.5763=
6-0.13746-0.1881-0.42443-0.1881-0.34004 0-0.5402 0.23151-0.20016 0.2291-0.2=
0016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0.36415=
-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952 0.2074 0=
.14952 0.30627 0.43408z"/><path id=3D"path104" d=3D"m133.53 31.74v0.76688h0=
.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892 0.42444 0.0916 0.09405 0.36=
897 0.09405h0.45578v0.37138h-0.45575q-0.51367 0-0.70901-0.19051-0.19533-0.1=
9293-0.19533-0.69936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=
=3D"path106" d=3D"m134.81 33.657h1.2998v0.3955h-1.2998z"/><path id=3D"path1=
08" d=3D"m139.06 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0=
.14951-0.19051-0.44855-0.19051-0.35932 0-0.56672 0.2291-0.20739 0.2291-0.20=
739 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0=
.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70417 0.28939 0.23875 0.2=
8698 0.23875 0.84646z"/><path id=3D"path110" d=3D"m140.99 32.818q-0.35691 0=
-0.5643 0.27974-0.2074 0.27733-0.2074 0.76206t0.20499 0.76447q0.20739 0.277=
33 0.56671 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 =
0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 =
0.90916 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039 1.0418-0.330=
38 0.3762-0.90916 0.3762-0.58118 0-0.91157-0.3762-0.32797-0.37862-0.32797-1=
.0418 0-0.66559 0.32797-1.0418 0.33039-0.3762 0.91157-0.3762z"/><path id=3D=
"path112" d=3D"m144.74 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.1=
3987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.798=
23-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-=
0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.=
35691zm-1.512 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.2=
7733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20=
257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.766=
88z"/><path id=3D"path114" d=3D"m148.41 33.747v0.21704h-2.0402q0.0289 0.458=
2 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0.25562 0 0.49437-0.0627 =
0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.25=
08 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.37621-0.3762-0.37621-1.=
0177 0-0.66318 0.35691-1.0514 0.35933-0.39067 0.96704-0.39067 0.54502 0 0.8=
6093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-5e-3 -0.364=
15-0.20498-0.58119-0.19775-0.21704-0.52573-0.21704-0.37138 0-0.59565 0.2098=
1-0.22187 0.20981-0.25563 0.59083z"/></g><path id=3D"path8203" d=3D"m137.83=
 19.196c0-8.7692 8.1536-8.1536 8.1536-8.1536h10.854" fill=3D"none" marker-e=
nd=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000"=
 stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52917" style=3D"pai=
nt-order:normal"/><g id=3D"g9231" transform=3D"translate(186.33 23.805)" fi=
ll=3D"#fff" fill-rule=3D"evenodd" stroke=3D"#0081cf"><path id=3D"path9227" =
d=3D"m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z" stop-color=3D"#00=
0000" stroke-width=3D".52917"/><path id=3D"path9229" d=3D"m-42.779 58.06v3.=
41l3.1067 1e-6z" stroke-linecap=3D"round" stroke-linejoin=3D"round" stroke-=
width=3D".529" style=3D"paint-order:normal"/></g><g id=3D"text9935" fill=3D=
"#0081cf" stroke-width=3D".26458px" aria-label=3D"foo.qcow2"><path id=3D"pa=
th143" d=3D"m121.81 101.76v0.5271h-0.72002q-0.34107 0-0.47543 0.14125-0.130=
91 0.1378-0.13091 0.49264v0.34107h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.=
3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.6339 0.28939-0.93362 0.29283-0.29=
972 0.90951-0.29972z"/><path id=3D"path145" d=3D"m124.52 103.71q-0.48231 0-=
0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24=
805 0.37551 0.73036 0.37551 0.48576 0 0.7338-0.37551 0.24805-0.37897 0.2480=
5-1.1128 0-0.73725-0.24805-1.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744=
q0.80271 0 1.2264 0.52021 0.4272 0.52021 0.4272 1.5055 0 0.98874-0.42375 1.=
509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42374-0.52021=
-0.42374-1.509 0-0.9853 0.42374-1.5055 0.42375-0.52021 1.2265-0.52021z"/><p=
ath id=3D"path147" d=3D"m128.77 103.71q-0.48231 0-0.73036 0.37551-0.24804 0=
.37552-0.24804 1.1128 0 0.7338 0.24804 1.1128 0.24805 0.37551 0.73036 0.375=
51 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.248=
05-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 0 1.2265 0.520=
21 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42374 0.51677-1=
.2299 0.51677-0.8027 0-1.2264-0.51677-0.42375-0.52021-0.42375-1.509 0-0.985=
3 0.42375-1.5055t1.2264-0.52021z"/><path id=3D"path149" d=3D"m132.58 106.07=
h0.86817v1.0508h-0.86817z"/><path id=3D"path151" d=3D"m136.29 105.21q0 0.73=
725 0.23082 1.1128 0.23427 0.37551 0.69246 0.37551 0.4582 0 0.69247-0.37551=
 0.23771-0.37896 0.23771-1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69247-0.=
37896-0.45819 0-0.69246 0.37551-0.23082 0.37552-0.23082 1.1128zm1.8535 1.43=
32q-0.15503 0.28594-0.4203 0.44097-0.26183 0.15159-0.60978 0.15159-0.69247 =
0-1.0955-0.53399-0.39964-0.53744-0.39964-1.478 0-0.95774 0.39964-1.4986 0.3=
9963-0.54088 1.0955-0.54088 0.34451 0 0.60633 0.15159 0.26528 0.14814 0.423=
75 0.43408v-0.49265h0.63734v5.3261h-0.63734z"/><path id=3D"path153" d=3D"m1=
43.05 106.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.55121 0.0758-=
0.89573 0-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.50=
643-0.53744 1.4022-0.53744 0.27905 0 0.54432 0.0724t0.53399 0.22393v0.6649q=
-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57188-0.0999-0.59601 0-0.=
9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384 0.38585 0.916=
4 0.38585 0.33072 0 0.59255-0.0999 0.26183-0.10335 0.48576-0.31695z"/><path=
 id=3D"path155" d=3D"m145.76 103.71q-0.48232 0-0.73036 0.37551-0.24805 0.37=
552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24804 0.37551 0.73036 0.37551 =
0.48576 0 0.7338-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.24805-1=
.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744q0.8027 0 1.2264 0.52021 0.4=
2719 0.52021 0.42719 1.5055 0 0.98874-0.42374 1.509-0.42375 0.51677-1.2299 =
0.51677-0.80271 0-1.2265-0.51677-0.42374-0.52021-0.42374-1.509 0-0.9853 0.4=
2374-1.5055 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path157" d=3D"m14=
7.89 103.26h0.62701l0.67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913 0.=
67179-3.1178h0.62701l-0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323 2.115=
3h-0.60633z"/><path id=3D"path159" d=3D"m153.42 106.54h2.3633v0.58567h-3.12=
47v-0.58567q0.64424-0.67868 1.1266-1.1989t0.6649-0.73381q0.34451-0.4203 0.4=
6509-0.67868 0.12058-0.26183 0.12058-0.53399 0-0.43064-0.25494-0.67524-0.25=
149-0.2446-0.69246-0.2446-0.31351 0-0.65802 0.11368-0.34451 0.11369-0.73036=
 0.34451v-0.7028q0.35485-0.16881 0.69591-0.25493 0.34451-0.0861 0.67869-0.0=
861 0.75447 0 1.2127 0.40308 0.46165 0.39963 0.46165 1.0508 0 0.33073-0.155=
03 0.66146-0.15159 0.33073-0.4961 0.73036-0.19292 0.22393-0.56155 0.62012-0=
.36518 0.39618-1.1162 1.1851z"/></g><rect id=3D"rect876" x=3D".26458" y=3D"=
13.714" width=3D"46.311" height=3D"57.175" rx=3D"5.2917" ry=3D"5.2917" fill=
=3D"none" stop-color=3D"#000000" stroke=3D"#802400" stroke-dasharray=3D"2.1=
1666, 2.11666" stroke-linecap=3D"round" stroke-width=3D".52917"/><rect id=
=3D"rect878" x=3D"6.5361" y=3D"20.157" width=3D"33.768" height=3D"13.398" r=
x=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#=
000" stroke-width=3D".52917"/><g id=3D"text882" stroke-width=3D".26458px" a=
ria-label=3D"qcow2"><path id=3D"path265" d=3D"m13.155 25.178q0 0.69936 0.28=
594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0.79237-0.39619 0.28939=
-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963-0.5=
0298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.1998=
2 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936 0-1.1403-=
0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.5581 1.1403=
-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.50988v-0.58567h=
0.6339v5.3261h-0.6339z"/><path id=3D"path267" d=3D"m20.032 23.393v0.59256q-=
0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0=
.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0=
.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.5=
8567q-0.26527 0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.8716=
1 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 =
0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.=
54088 0.17914z"/><path id=3D"path269" d=3D"m22.629 23.69q-0.50988 0-0.80615=
 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.80=
96 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.685=
57-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.29=
88 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0=
.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.48=
83 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"p=
ath271" d=3D"m25.082 23.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79=
237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83=
371 3.1626h-0.74759z"/><path id=3D"path273" d=3D"m31.91 26.518h2.4288v0.585=
67h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68557-0.69246 0.86127-0.8=
9228 0.33418-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.409=
97-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.1136=
9-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.=
36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47=
542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 =
0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z"/></g><rect id=3D"re=
ct884" x=3D"6.5361" y=3D"48.868" width=3D"33.768" height=3D"13.398" rx=3D"1=
.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D"#000000" stroke=3D"#000" s=
troke-width=3D".52917"/><g id=3D"text888" stroke-width=3D".26458px" aria-la=
bel=3D"file"><path id=3D"path276" d=3D"m21.937 52.17v3.8585h-0.63734v-3.365=
9h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.63=
045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-0.60634q=
-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-0.63734-=
1.4952h0.63734v0.80271h-0.63734z"/><path id=3D"path278" d=3D"m23.263 50.668=
h0.6339v5.3606h-0.6339z"/><path id=3D"path280" d=3D"m28.524 53.941v0.31006h=
-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36=
518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14=
469-0.69935 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.5374=
4-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 1.=
3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.63=
39-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0=
.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g8=
94" transform=3D"translate(70.003 21.111)" fill=3D"none" stroke=3D"#000" st=
roke-width=3D".52917"><path id=3D"path890" d=3D"m-53.494 58.06h10.715l3.106=
7 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path892" d=3D=
"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round" style=3D"paint-o=
rder:normal"/></g><path id=3D"path906" d=3D"m23.415 67.339v10.837" fill=3D"=
none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)" s=
troke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52917=
" style=3D"paint-order:normal"/><path id=3D"path908" d=3D"m23.415 38.694v9.=
2246" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Ar=
row2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-w=
idth=3D".52917" style=3D"paint-order:normal"/><rect id=3D"rect910" x=3D"8.6=
03" y=3D"57.933" width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=
=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round=
" stroke-width=3D".529"/><g id=3D"text914" stroke-width=3D".26458px" aria-l=
abel=3D"prot-node"><path id=3D"path283" d=3D"m12.16 63.274v1.4325h-0.44614v=
-3.7283h0.44614v0.40997q0.13987-0.24116 0.35209-0.35691 0.21463-0.11817 0.5=
1125-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39067 0.30868 1.0273t-0.30=
868 1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662 0-0.51125-0.11576-0.212=
22-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.48955-0.20257-0.76688-0.2001=
6-0.27974-0.55225-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688=
t0.20016 0.76929q0.20257 0.27733 0.55466 0.27733t0.55225-0.27733q0.20257-0.=
27974 0.20257-0.76929z"/><path id=3D"path285" d=3D"m16.431 61.393q-0.07476-=
0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.3762 0-0.57878 0.245=
98-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0=
.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.04582 0 0.=
10129 0.0072 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path287" d=3D"m1=
7.835 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.2049=
8 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.2=
7974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm=
0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0=
.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.3279=
7-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.=
3762z"/><path id=3D"path289" d=3D"m20.249 60.212v0.76688h0.91398v0.34485h-0=
.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.4=
5579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69=
936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=3D"path291" d=3D=
"m21.522 62.129h1.2998v0.3955h-1.2998z"/><path id=3D"path293" d=3D"m25.774 =
62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051q-=
0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41=
961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 =
0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path295" d=
=3D"m27.705 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t=
0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20=
739-0.27974 0.20739-0.76206 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-=
0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 =
0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.37=
62-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0=
.91157-0.3762z"/><path id=3D"path297" d=3D"m31.458 61.389v-1.4614h0.44373v3=
.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.5=
1125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.306=
27-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463=
 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 =
0.27733 0.55466 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974 0.20257-0=
.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209 0-0.55466 =
0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path299" d=3D"m35.12=
6 62.218v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874 0.6=
8971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961=
q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1=
.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0=
.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.=
95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.5=
2572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/><=
/g><rect id=3D"rect916" x=3D"8.603" y=3D"29.267" width=3D"29.634" height=3D=
"8.4415" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=
=3D"#000" stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text920"=
 stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path248" d=
=3D"m14.031 31.456v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.096=
46-0.09164 0.34727v0.23874h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-=
0.42444v-0.34485h0.42444v-0.1881q0-0.45096 0.20981-0.65595 0.20981-0.20739 =
0.66559-0.20739z"/><path id=3D"path250" d=3D"m16.505 33.026q0.1664-0.29903 =
0.39791-0.44132 0.23151-0.14228 0.54501-0.14228 0.42202 0 0.65112 0.29662 0=
.2291 0.29421 0.2291 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57=
636-0.13746-0.1881-0.41961-0.1881-0.34485 0-0.54501 0.2291t-0.20016 0.6246v=
1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0.42444-0.=
1881-0.34003 0-0.54019 0.23151-0.20016 0.2291-0.20016 0.62218v1.5265h-0.446=
14v-2.701h0.44614v0.41961q0.15193-0.24839 0.36415-0.36656 0.21222-0.11817 0=
.50402-0.11817 0.29421 0 0.49919 0.14952 0.2074 0.14952 0.30627 0.43408z"/>=
<path id=3D"path252" d=3D"m19.652 31.74v0.76688h0.91398v0.34485h-0.91398v1.=
4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37=
138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.46=
62h-0.32556v-0.34485h0.32556v-0.76688z"/><path id=3D"path254" d=3D"m20.925 =
33.657h1.2998v0.3955h-1.2998z"/><path id=3D"path256" d=3D"m25.177 33.578v1.=
6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.19051-0.44855-0.1=
9051-0.35932 0-0.56672 0.2291-0.2074 0.2291-0.2074 0.6246v1.5265h-0.44614v-=
2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.499=
19-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z"/><pa=
th id=3D"path258" d=3D"m27.108 32.818q-0.35691 0-0.56431 0.27974-0.2074 0.2=
7733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0=
 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.207=
4-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 =
0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.581=
19 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418=
 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path260" d=3D"m30.861 32.917v=
-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.=
21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.3=
0627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.39067 0.79823-0.39067 0.2990=
4 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.489=
55 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466-0.27733q0.20257-=
0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-=
0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path262" d=
=3D"m34.529 33.747v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0=
.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.18=
81v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-=
0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514=
 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 =
0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0=
.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.=
59083z"/></g><g id=3D"text934" stroke-width=3D".26458px" aria-label=3D"foo.=
qcow2"><path id=3D"path162" d=3D"m7.9308 101.76v0.5271h-0.72003q-0.34106 0-=
0.47542 0.14125-0.13091 0.1378-0.13091 0.49264v0.34107h1.3264v0.49265h-1.32=
64v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.6339 0.28939=
-0.93362 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path164" d=3D"m10.6=
39 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.733=
8 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.7338-0.37551 0=
.24805-0.37897 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73=
38-0.37551zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.50=
55 0 0.98874-0.42375 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-=
0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.2265-0.5202=
1z"/><path id=3D"path166" d=3D"m14.886 103.71q-0.48231 0-0.73036 0.37551-0.=
24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.7303=
6 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.7372=
5-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 0 1.226=
5 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.=
51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509=
 0-0.9853 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path168" d=3D"m18.69=
7 106.07h0.86816v1.0508h-0.86816z"/><path id=3D"path170" d=3D"m22.404 105.2=
1q0 0.73725 0.23082 1.1128 0.23427 0.37551 0.69246 0.37551t0.69246-0.37551q=
0.23771-0.37896 0.23771-1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69246-0.3=
7896t-0.69246 0.37551q-0.23082 0.37552-0.23082 1.1128zm1.8535 1.4332q-0.155=
03 0.28594-0.4203 0.44097-0.26183 0.15159-0.60978 0.15159-0.69246 0-1.0955-=
0.53399-0.39963-0.53744-0.39963-1.478 0-0.95774 0.39963-1.4986 0.39963-0.54=
088 1.0955-0.54088 0.34451 0 0.60634 0.15159 0.26527 0.14814 0.42375 0.4340=
8v-0.49265h0.63734v5.3261h-0.63734z"/><path id=3D"path172" d=3D"m29.163 106=
.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.55122 0.0758-0.89573 0=
-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.50643-0.537=
44 1.4022-0.53744 0.27905 0 0.54432 0.0724 0.26527 0.0724 0.53399 0.22393v0=
.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57189-0.0999-0.596 =
0-0.9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384 0.38585 0=
.9164 0.38585 0.33073 0 0.59256-0.0999 0.26183-0.10335 0.48576-0.31695z"/><=
path id=3D"path174" d=3D"m31.878 103.71q-0.48231 0-0.73036 0.37551-0.24805 =
0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.73036 0.37=
551 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.24=
805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 0 1.2265 0.52=
021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51677-=
1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9=
853 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path176" d=3D"m34.003 103.=
26h0.62701l0.67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913 0.67179-3.1=
178h0.62701l-0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323 2.1153h-0.6063=
4z"/><path id=3D"path178" d=3D"m39.536 106.54h2.3633v0.58567h-3.1247v-0.585=
67q0.64423-0.67868 1.1265-1.1989 0.48231-0.52021 0.6649-0.73381 0.34451-0.4=
203 0.46509-0.67868 0.12058-0.26183 0.12058-0.53399 0-0.43064-0.25494-0.675=
24-0.25149-0.2446-0.69246-0.2446-0.3135 0-0.65801 0.11368-0.34451 0.11369-0=
.73036 0.34451v-0.7028q0.35484-0.16881 0.69591-0.25493 0.34451-0.0861 0.678=
68-0.0861 0.75448 0 1.2127 0.40308 0.46164 0.39963 0.46164 1.0508 0 0.33073=
-0.15503 0.66146-0.15158 0.33073-0.49609 0.73036-0.19293 0.22393-0.56155 0.=
62012-0.36518 0.39618-1.1162 1.1851z"/></g><path id=3D"path3010" d=3D"m188.=
01 14.34c8.4834 0 7.5897 6.5118 7.5897 6.5118v64.293c0 7.1845-7.0725 6.5115=
-7.0725 6.5115h-40.896" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marke=
r-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1.05833,=
 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D=
"path5636" d=3D"m52.435 42.311h54.899" fill=3D"none" marker-end=3D"url(#Arr=
ow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D"1.0583" =
style=3D"paint-order:normal"/><g id=3D"text10276" stroke-width=3D".26458px"=
 aria-label=3D"Exporting foo.qcow2  via FUSE on itself"><path id=3D"path181=
" d=3D"m64.283 22.613h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v=
1.8638h2.6183v0.58567h-3.3142z"/><path id=3D"path183" d=3D"m71.92 23.898-1.=
3953 1.8776 1.4676 1.9809h-0.74759l-1.1231-1.5158-1.1231 1.5158h-0.74759l1.=
4986-2.0188-1.3711-1.8397h0.74759l1.0232 1.3746 1.0232-1.3746z"/><path id=
=3D"path185" d=3D"m73.502 27.178v2.0464h-0.63734v-5.3261h0.63734v0.58567q0.=
19982-0.34451 0.50298-0.50987 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.14=
03 0.55811 0.44097 0.55811 0.44097 1.4676 0 0.9095-0.44097 1.4676-0.43753 0=
.55811-1.1403 0.55811-0.42375 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.5=
1332zm2.1566-1.347q0-0.69936-0.28939-1.0955-0.28594-0.39963-0.78893-0.39963=
t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955 0 0.69935 0.28594 1.099 0=
.28939 0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963 0.28939-1.09=
9z"/><path id=3D"path187" d=3D"m78.862 24.343q-0.50988 0-0.80615 0.39963-0.=
29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.809=
6 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0886 0-0.6855=
8-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.298=
8 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.=
53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.488=
3 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"pa=
th189" d=3D"m83.92 24.491q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0=
.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.03=
26h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-=
0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01033 0.07924 0.0069 0.1757 0.0=
2412z"/><path id=3D"path191" d=3D"m85.212 22.803v1.0955h1.3057v0.49265h-1.3=
057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112=
v0.53054h-0.65112q-0.7338 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v=
-2.0946h-0.46509v-0.49265h0.46509v-1.0955z"/><path id=3D"path193" d=3D"m87.=
351 23.898h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path =
id=3D"path195" d=3D"m92.519 25.428v2.3289h-0.6339v-2.3082q0-0.54777-0.2136-=
0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.=
89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34796 0.53399-0.520=
21 0.31006-0.17226 0.71314-0.17226 0.6649 0 1.006 0.41341 0.34106 0.40997 0=
.34106 1.2092z"/><path id=3D"path197" d=3D"m96.322 25.783q0-0.68902-0.28594=
-1.068-0.2825-0.37896-0.79582-0.37896-0.50987 0-0.79582 0.37896-0.2825 0.37=
896-0.2825 1.068 0 0.68558 0.2825 1.0645 0.28594 0.37896 0.79582 0.37896 0.=
51332 0 0.79582-0.37896 0.28594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9=
853-0.43753 1.4642-0.43753 0.48231-1.3401 0.48231-0.33418 0-0.63045-0.05168=
-0.29628-0.04823-0.57533-0.15158v-0.61667q0.27905 0.15158 0.55122 0.22393 0=
.27216 0.07235 0.55466 0.07235 0.62356 0 0.93362-0.32728 0.31006-0.32384 0.=
31006-0.98185v-0.3135q-0.19637 0.34106-0.50298 0.50987-0.30661 0.16881-0.73=
381 0.16881-0.70969 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.895=
72 0.43408-1.4366 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 =
0.30661 0.16881 0.50298 0.50987v-0.58567h0.6339z"/><path id=3D"path199" d=
=3D"m65.127 30.863v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378=
-0.13091 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.=
60634v-0.49265h0.60634v-0.26872q0-0.64423 0.29972-0.93707 0.29972-0.29628 0=
.95085-0.29628z"/><path id=3D"path201" d=3D"m67.152 32.809q-0.50987 0-0.806=
15 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.=
8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.6=
8558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.=
2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198=
 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.=
4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D=
"path203" d=3D"m71.469 32.809q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.=
29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027=
1-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68558-0.29628-1.0852-0.29628-0=
.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 =
0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.830=
27 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883=
 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path205" d=3D"m74.256 35.349=
h0.72692v0.87506h-0.72692z"/><path id=3D"path207" d=3D"m76.788 34.298q0 0.6=
9936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0.79237-0.3961=
9 0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.=
39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.34=
7q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936 =
0-1.1403-0.5581-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.558=
11 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.50988=
v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path209" d=3D"m83.665 32.513=
v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0=
.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.3410=
6 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0=
.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06=
201-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.516=
76-1.4848 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 =
0.05857 0.54088 0.17914z"/><path id=3D"path211" d=3D"m86.262 32.809q-0.5098=
8 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0=
.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0=
887 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.8=
2682 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.488=
3-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0=
.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><p=
ath id=3D"path213" d=3D"m88.715 32.365h0.6339l0.79237 3.011 0.78893-3.011h0=
.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-=
3.1626-0.83371 3.1626h-0.74759z"/><path id=3D"path215" d=3D"m95.543 35.638h=
2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68557-0.69246=
 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.5=
1332 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.=
69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.7854=
8-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 =
0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66=
835-0.08613 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z"/><path =
id=3D"path217" d=3D"m65.373 49.298h0.67179l1.2058 3.2384 1.2058-3.2384h0.67=
179l-1.4469 3.8585h-0.86128z"/><path id=3D"path219" d=3D"m70.003 49.298h0.6=
339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path id=3D"path221"=
 d=3D"m73.717 51.217q-0.76826 0-1.0645 0.1757-0.29628 0.1757-0.29628 0.5994=
5 0 0.33762 0.22049 0.53744 0.22393 0.19637 0.60634 0.19637 0.5271 0 0.8440=
5-0.37207 0.32039-0.37552 0.32039-0.99563v-0.14125zm1.2644-0.26183v2.2014h-=
0.6339v-0.58567q-0.21704 0.3514-0.54088 0.52021-0.32384 0.16536-0.79237 0.1=
6536-0.59256 0-0.94396-0.33073-0.34796-0.33418-0.34796-0.89228 0-0.65112 0.=
43408-0.98185 0.43753-0.33073 1.3022-0.33073h0.88884v-0.06201q0-0.43753-0.2=
8939-0.67524-0.28594-0.24116-0.80615-0.24116-0.33073 0-0.64423 0.07924-0.31=
35 0.07924-0.60289 0.23771v-0.58567q0.34796-0.13436 0.67524-0.19982 0.32728=
-0.0689 0.63734-0.0689 0.83716 0 1.2506 0.43408 0.41341 0.43408 0.41341 1.3=
16z"/><path id=3D"path223" d=3D"m78.557 48.013h2.9559v0.58567h-2.26v1.5158h=
2.0395v0.58567h-2.0395v2.4564h-0.69591z"/><path id=3D"path225" d=3D"m82.536=
 48.013h0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36174 0.97152 0.36=
174 0.66835 0 0.96807-0.36174 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936=
v3.2108q0 1.006-0.49954 1.5193-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4=
745-0.51332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path227" d=3D"m90=
.863 48.182v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.09302-0.67868-=
0.09302-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 =
0.20326 0.51676 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14=
814 1.1472 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334=
-0.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.08268-0.40997-0.08268-0=
.85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 0.12058 0.79=
926 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.378=
96-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q-0.77859-=
0.15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.91984 0-0.68213 0.47887-1.=
0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.06546t0.76826 0.196=
37z"/><path id=3D"path229" d=3D"m92.258 48.013h3.2522v0.58567h-2.5563v1.522=
7h2.4495v0.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z"/><path id=3D"path2=
31" d=3D"m68.644 58.21q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1=
.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8=
0271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68558-0.29628-1.0852-0.2962=
8-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.537=
44 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.=
83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4=
883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path233" d=3D"m74.673 59.=
295v2.3289h-0.6339v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.64079-=
0.27216-0.51332 0-0.8096 0.32728-0.29628 0.32728-0.29628 0.89228v2.1807h-0.=
63734v-3.8585h0.63734v0.59945q0.22738-0.34796 0.53399-0.52021 0.31006-0.172=
26 0.71314-0.17226 0.6649 0 1.006 0.41341 0.34106 0.40997 0.34106 1.2092z"/=
><path id=3D"path235" d=3D"m78.18 57.765h0.6339v3.8585h-0.6339zm0-1.5021h0.=
6339v0.80271h-0.6339z"/><path id=3D"path237" d=3D"m80.767 56.67v1.0955h1.30=
57v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 =
0.13436h0.65112v0.53054h-0.65112q-0.73381 0-1.0129-0.27216-0.27905-0.27561-=
0.27905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z"/><path id=3D"pa=
th239" d=3D"m85.367 57.879v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-=
0.0689-0.59945-0.0689-0.47198 0-0.70969 0.1447-0.23427 0.14469-0.23427 0.43=
408 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.048=
23q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.5374=
4-0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.=
33417-0.05857-0.70624-0.17915v-0.65457q0.3514 0.18259 0.69246 0.27561 0.341=
06 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.2411=
6-0.43408 0-0.25838-0.1757-0.39619-0.17225-0.1378-0.76137-0.26527l-0.22049-=
0.05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-=
0.54433 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05=
168t0.57189 0.15503z"/><path id=3D"path241" d=3D"m89.883 59.536v0.31006h-2.=
9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518=
 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469=
-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0=
.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 1.381=
5-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-=
0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53=
054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path24=
3" d=3D"m90.924 56.263h0.6339v5.3606h-0.6339z"/><path id=3D"path245" d=3D"m=
94.837 56.263v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13=
091 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634=
v-0.49265h0.60634v-0.26872q0-0.64423 0.29972-0.93707 0.29972-0.29628 0.9508=
5-0.29628z"/></g></svg>
diff --git a/screenshots/2021-08-18-root-directory.svg b/screenshots/2021-0=
8-18-root-directory.svg
new file mode 100644
index 0000000..f9449f1
--- /dev/null
+++ b/screenshots/2021-08-18-root-directory.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"149.08mm" height=3D"64.908mm" version=3D"1.1" vi=
ewBox=3D"0 0 149.08 64.908" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=3D"auto"><=
path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"cont=
ext-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=3D=
".625"/></marker><marker id=3D"ArrowRedMend" overflow=3D"visible" orient=3D=
"auto"><path id=3D"path53977" transform=3D"scale(.6) rotate(180) translate(=
0)" d=3D"m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5=
.6175-6e-7 8.0354z" fill=3D"#0081cf" fill-rule=3D"evenodd" stroke-linejoin=
=3D"round" stroke-width=3D".625"/></marker></defs><g id=3D"text10527" strok=
e-width=3D".26458px" aria-label=3D"/  foo/=C2=A0   a    b  bar/    c    d">=
<path id=3D"path79" d=3D"m5.3131 16.476h0.65457l-2.7078 5.7981h-0.65801z"/>=
<path id=3D"path81" d=3D"m14.408 23.435v0.5271h-0.72003q-0.34106 0-0.47542 =
0.14125-0.13091 0.1378-0.13091 0.49265v0.34106h1.3264v0.49265h-1.3264v3.365=
9h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.6339 0.28939-0.93362=
 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path83" d=3D"m17.116 25.381=
q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.2480=
5 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-=
0.37896 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.3=
7552zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0=
.98874-0.42375 1.509-0.42375 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.5167=
6-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2=
265-0.52021z"/><path id=3D"path85" d=3D"m21.364 25.381q-0.48231 0-0.73036 0=
.37552-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37=
552 0.73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.112=
8 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-=
0.42375 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.4=
2375-1.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z"/><path =
id=3D"path87" d=3D"m26.552 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path =
id=3D"path89" d=3D"m21.66 34.032h-0.21015q-0.55466 0-0.83716 0.19637-0.2790=
5 0.19293-0.27905 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222=
 0.19293 0.52365 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm=
1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50987-0.=
30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.35=
14-0.89228 0-0.64423 0.43064-0.97841 0.43408-0.33417 1.2712-0.33417h0.85094=
v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0=
.32384 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.1=
3436 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.1412=
5 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0=
.25149 0.05512 0.75792z"/><path id=3D"path91" d=3D"m22.404 41.222q0-0.73725=
-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164 0-0.69936 0.37896-0=
.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69=
936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.863=
8-1.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.6=
9591 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.49=
86-0.39963 0.54088-1.099 0.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-=
0.4203-0.43753v0.48576h-0.6339v-5.3606h0.6339z"/><path id=3D"path93" d=3D"m=
13.909 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46=
164 0-0.69935 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.10=
93 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552=
 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0.15=
158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.4745=
 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0.54088-0.34451 0-0.60978-0=
.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h0.6339z"/><pa=
th id=3D"path95" d=3D"m17.412 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.=
27905 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.5=
8222 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.141=
25zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.5098=
8-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-=
0.3514-0.89228 0-0.64423 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.8=
5094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.210=
15-0.32384 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514=
-0.13436 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.=
14125 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.055=
12 0.25149 0.05512 0.75792z"/><path id=3D"path97" d=3D"m23.221 47.261q-0.20=
326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46164-0.07235-0.59256 0-0.906=
06 0.37207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.7=
5448q0.15847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78204-0.22049 0.2342=
7 0 0.43753 0.05857t0.3893 0.18259z"/><path id=3D"path99" d=3D"m26.552 45.1=
8h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path101" d=3D"m22.897 57.3=
03q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122 0.07579-0.89572 =
0-1.4022-0.53744-0.50298-0.53744-0.50298-1.4883t0.50298-1.4883q0.50643-0.53=
744 1.4022-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399 0.2239=
3v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0.09991-0=
.596 0-0.9164 0.38585t-0.32039 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38=
585 0.9164 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335 0.48576-0.3169=
5z"/><path id=3D"path103" d=3D"m22.198 61.31v-1.9947h0.6339v5.3606h-0.6339v=
-0.48576q-0.15848 0.28594-0.42375 0.43753-0.26183 0.14814-0.60634 0.14814-0=
.69936 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.=
4745 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.1481=
4 0.41686 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552 =
0.69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093 0-0.73381-0.=
24116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246 0.37552q-0.23427 0.37=
552-0.23427 1.1128z"/></g><path id=3D"path25696" d=3D"m4.5344 23.535v22.663=
" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".5=
2917" style=3D"paint-order:normal"/><path id=3D"path25958" d=3D"m4.5344 24.=
564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker=
-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-w=
idth=3D".52917" style=3D"paint-order:normal"/><path id=3D"path27085" d=3D"m=
4.5344 46.199c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"no=
ne" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round=
" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path274=
90" d=3D"m13.266 30.8-0.0056 8.5867" fill=3D"none" stroke=3D"#000" stroke-l=
inecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"/><pat=
h id=3D"path27629" d=3D"m13.26 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l=
3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"=
 stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:norm=
al"/><path id=3D"path27844" d=3D"m13.26 39.387c0 1.5071 1.5429 1.4354 1.542=
9 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=
=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-o=
rder:normal"/><path id=3D"path28236" d=3D"m13.266 52.334-0.0056 8.5867" fil=
l=3D"none" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917"=
 style=3D"paint-order:normal"/><path id=3D"path28238" d=3D"m13.26 53.996c0 =
1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=
=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=
=3D".52917" style=3D"paint-order:normal"/><path id=3D"path28240" d=3D"m13.2=
6 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" ma=
rker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stro=
ke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text31368" strok=
e-width=3D".26458px" aria-label=3D"VFS tree:"><path id=3D"path62" d=3D"m2.0=
96 5.3688-1.9637-5.1435h0.72692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603 =
5.1435z"/><path id=3D"path64" d=3D"m5.5962 0.22531h2.9559v0.58567h-2.26v1.5=
158h2.0395v0.58567h-2.0395v2.4564h-0.69591z"/><path id=3D"path66" d=3D"m12.=
614 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868=
-0.093018-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.3410=
6 0.20326 0.51676 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0=
.14814 1.1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1=
334-0.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.40997-0.082=
682-0.85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 0.12058=
 0.79926 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-=
0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.082682q-0=
.77859-0.15503-1.1265-0.48576t-0.34795-0.91984q0-0.68213 0.47887-1.0749 0.4=
8231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.065457 0.37552 0.065457 0.7=
6826 0.19637z"/><path id=3D"path68" d=3D"m16.851 0.41479v1.0955h1.3057v0.49=
265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436=
h0.65112v0.53054h-0.65112q-0.7338 0-1.0129-0.27216-0.27905-0.27561-0.27905-=
0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z"/><path id=3D"path70" d=
=3D"m21.227 2.1029q-0.1068-0.062012-0.23427-0.089573-0.12402-0.031006-0.275=
61-0.031006-0.53744 0-0.82682 0.3514-0.28594 0.34795-0.28594 1.0025v2.0326h=
-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.1=
7225 0.77859-0.17225 0.06546 0 0.14469 0.010335 0.07924 0.00689 0.1757 0.02=
4116z"/><path id=3D"path72" d=3D"m25.037 3.2811v0.31006h-2.9146q0.04134 0.6=
5457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.089=
573 0.34451-0.089573 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.220=
49-0.35829 0.075792-0.72692 0.075792-0.92329 0-1.4642-0.53744-0.53744-0.537=
44-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.=
77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0=
0689-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.850=
94 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path74" d=3D"m29.=
378 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 =
0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-0.26872v=
0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0.075792-=
0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.=
5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.4995=
4 0.45475 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0=
.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.=
84405z"/><path id=3D"path76" d=3D"m30.58 4.4938h0.72692v0.87505h-0.72692zm0=
-2.7733h0.72692v0.87505h-0.72692z"/></g><g id=3D"text36298" fill=3D"#0081cf=
" stroke-width=3D".26458px" aria-label=3D"/  x=C2=A0 y"><path id=3D"path115=
" d=3D"m58.664 16.476h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path11=
7" d=3D"m67.949 24.937-1.3815 1.8466 1.5158 2.0119h-0.73381l-1.13-1.5468-1.=
1265 1.5468h-0.73381l1.5158-2.0119-1.3815-1.8466h0.7028l1.0232 1.3953 1.016=
3-1.3953z"/><path id=3D"path119" d=3D"m67.053 34.731q-0.15848 0.40308-0.403=
08 1.0611-0.34106 0.90951-0.4582 1.1093-0.15847 0.26872-0.39619 0.40308t-0.=
55466 0.13436h-0.50987v-0.53055h0.37552q0.27905 0 0.43753-0.16192 0.15847-0=
.16192 0.40308-0.83716l-1.4917-3.7965h0.67179l1.1438 3.0179 1.1265-3.0179h0=
.67179z"/></g><path id=3D"path36300" d=3D"m57.886 23.535v9.5655" fill=3D"no=
ne" stroke=3D"#0081cf" stroke-linecap=3D"round" stroke-width=3D".52917" sty=
le=3D"paint-order:normal"/><path id=3D"path36302" d=3D"m57.886 24.564c0 1.5=
071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"u=
rl(#ArrowRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"round" stroke-width=
=3D".52917" style=3D"paint-order:normal"/><path id=3D"path36304" d=3D"m57.8=
86 33.101c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" =
marker-end=3D"url(#ArrowRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"roun=
d" stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text36320=
" stroke-width=3D".26458px" aria-label=3D"FS A:"><path id=3D"path106" d=3D"=
m53.733 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-=
0.69591z"/><path id=3D"path108" d=3D"m60.75 0.39412v0.67868q-0.39619-0.1894=
8-0.74759-0.2825-0.3514-0.093018-0.67868-0.093018-0.56844 0-0.8785 0.22049-=
0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.17225 0=
.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472 0.52365 0.37207 0.372=
07 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.38585-=
0.36518 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375=
 0.23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.=
23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-0.2=
136-0.76137-0.32039l-0.42375-0.082682q-0.77859-0.15503-1.1265-0.48576-0.347=
95-0.33073-0.34795-0.91984 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-=
0.39274 0.36174 0 0.73725 0.065457 0.37552 0.065457 0.76826 0.19637z"/><pat=
h id=3D"path110" d=3D"m66.107 0.91088-0.94396 2.5597h1.8914zm-0.39274-0.685=
57h0.78893l1.9603 5.1435h-0.72347l-0.46853-1.3195h-2.3186l-0.46853 1.3195h-=
0.7338z"/><path id=3D"path112" d=3D"m69.225 4.4938h0.72692v0.87505h-0.72692=
zm0-2.7733h0.72692v0.87505h-0.72692z"/></g><g id=3D"text44877" stroke-width=
=3D".26458px" aria-label=3D"Mounting FS Aon /foo:"><path id=3D"path122" d=
=3D"m98.949 0.34933h1.037l1.3126 3.5002 1.3195-3.5002h1.037v5.1435h-0.67869=
v-4.5165l-1.3264 3.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z"/><path id=
=3D"path124" d=3D"m106.5 2.0788q-0.50987 0-0.80615 0.39963-0.29628 0.39619-=
0.29628 1.0887 0 0.69246 0.29284 1.0921 0.29627 0.39619 0.80959 0.39619 0.5=
0643 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40=
308-0.80271-0.40308zm0-0.53744q0.82683 0 1.2988 0.53744 0.47197 0.53744 0.4=
7197 1.4883 0 0.9474-0.47197 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026 =
0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.=
47198-0.53744 1.3022-0.53744z"/><path id=3D"path126" d=3D"m109.26 3.9701v-2=
.3358h0.6339v2.3117q0 0.54777 0.2136 0.82338 0.21359 0.27216 0.64079 0.2721=
6 0.51332 0 0.80959-0.32728 0.29973-0.32728 0.29973-0.89228v-2.1876h0.63389=
v3.8585h-0.63389v-0.59256q-0.23082 0.3514-0.53744 0.52365-0.30317 0.16881-0=
.70624 0.16881-0.66491 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z"/><=
path id=3D"path128" d=3D"m117 3.164v2.3289h-0.63389v-2.3082q0-0.54777-0.213=
6-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 =
0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795 0.53399-0.5=
2021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997=
 0.34106 1.2092z"/><path id=3D"path130" d=3D"m118.9 0.53881v1.0955h1.3057v0=
.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13=
436h0.65112v0.53055h-0.65112q-0.73381 0-1.0129-0.27216-0.27905-0.27561-0.27=
905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z"/><path id=3D"path13=
2" d=3D"m121.04 1.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0=
.63389z"/><path id=3D"path134" d=3D"m126.2 3.164v2.3289h-0.63389v-2.3082q0-=
0.54777-0.2136-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32=
728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.3479=
5 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.=
34106 0.40997 0.34106 1.2092z"/><path id=3D"path136" d=3D"m130.01 3.5188q0-=
0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50987 0-0.79582 0.37=
896-0.2825 0.37896-0.2825 1.068 0 0.68557 0.2825 1.0645 0.28595 0.37896 0.7=
9582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896 0.28594-1.0645zm0.63=
39 1.4952q0 0.9853-0.43753 1.4642-0.43753 0.48231-1.3401 0.48231-0.33418 0-=
0.63045-0.051677-0.29628-0.048231-0.57534-0.15158v-0.61667q0.27906 0.15158 =
0.55122 0.22393 0.27216 0.072347 0.55466 0.072347 0.62356 0 0.93362-0.32728=
 0.31006-0.32384 0.31006-0.98185v-0.3135q-0.19637 0.34106-0.50298 0.50987-0=
.30662 0.16881-0.73381 0.16881-0.70969 0-1.1438-0.54088-0.43408-0.54088-0.4=
3408-1.4332 0-0.89573 0.43408-1.4366 0.43408-0.54088 1.1438-0.54088 0.42719=
 0 0.73381 0.16881 0.30661 0.16881 0.50298 0.50987v-0.58567h0.6339z"/><path=
 id=3D"path138" d=3D"m134.22 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.5=
8567h-2.0395v2.4564h-0.69591z"/><path id=3D"path140" d=3D"m141.23 0.51814v0=
.67868q-0.39618-0.18948-0.74758-0.2825t-0.67869-0.093018q-0.56844 0-0.8785 =
0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0=
.17225 0.77859 0.27905l0.42031 0.086127q0.77859 0.14814 1.1472 0.52365 0.37=
207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676=
 0.38585-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.7165=
8q0.42374 0.23771 0.83026 0.35829 0.40653 0.12058 0.79927 0.12058 0.596 0 0=
.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.=
23082-0.2136-0.76137-0.32039l-0.42374-0.082682q-0.77859-0.15503-1.1266-0.48=
576-0.34795-0.33073-0.34795-0.91984 0-0.68213 0.47886-1.0749 0.48232-0.3927=
4 1.3264-0.39274 0.36173 0 0.73725 0.065457 0.37551 0.065457 0.76825 0.1963=
7z"/><path id=3D"path142" d=3D"m146.59 1.0349-0.94395 2.5597h1.8914zm-0.392=
74-0.68557h0.78893l1.9603 5.1435h-0.72347l-0.46854-1.3195h-2.3186l-0.46853 =
1.3195h-0.73381z"/><path id=3D"path144" d=3D"m112.34 9.2549q-0.50987 0-0.80=
615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0=
.8096 0.39619 0.50643 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.=
0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.=
47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988=
 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 =
0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path146" d=3D"=
m118.37 10.34v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0.272=
16-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.89228v2.1807h-0.6373=
4v-3.8585h0.63734v0.59945q0.22738-0.34795 0.53399-0.52021 0.31006-0.17225 0=
.71314-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997 0.34106 1.2092z"/><pa=
th id=3D"path148" d=3D"m123 7.5255h0.58566l-1.7914 5.7981h-0.58566z"/><path=
 id=3D"path150" d=3D"m126.21 7.3084v0.5271h-0.60634q-0.34106 0-0.47542 0.13=
78-0.13092 0.1378-0.13092 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.=
63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.64423 0.29972-0.93707 =
0.29973-0.29628 0.95085-0.29628z"/><path id=3D"path152" d=3D"m128.23 9.2549=
q-0.50988 0-0.80616 0.39963-0.29628 0.39619-0.29628 1.0887t0.29284 1.0921q0=
.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027-0.39963 0.29628-0.39963 0.29=
628-1.0887 0-0.68557-0.29628-1.0852-0.29627-0.40308-0.8027-0.40308zm0-0.537=
44q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198=
 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.5=
4088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744=
z"/><path id=3D"path154" d=3D"m132.55 9.2549q-0.50987 0-0.80615 0.39963-0.2=
9628 0.39619-0.29628 1.0887t0.29284 1.0921q0.29627 0.39619 0.80959 0.39619 =
0.50643 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0=
.40308-0.80271-0.40308zm0-0.53744q0.82683 0 1.2988 0.53744 0.47197 0.53744 =
0.47197 1.4883 0 0.9474-0.47197 1.4883-0.47198 0.53744-1.2988 0.53744-0.830=
26 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883=
 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path156" d=3D"m135.53 11.794=
h0.72691v0.87506h-0.72691zm0-2.7733h0.72691v0.87505h-0.72691z"/></g><g id=
=3D"text45567" stroke-width=3D".26458px" aria-label=3D"/=C2=A0         bar/=
    c    d"><path id=3D"path172" d=3D"m113.98 16.476h0.65457l-2.7078 5.7981=
h-0.65801z"/><path id=3D"path174" d=3D"m122.57 48.398q0-0.73725-0.23427-1.1=
128-0.23426-0.37552-0.69246-0.37552-0.46165 0-0.69936 0.37896-0.23771 0.375=
52-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936 0.37896 =
0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.1=
5159-0.2825 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.095=
5 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0=
.54088-1.099 0.54088-0.34451 0-0.60979-0.14814-0.26182-0.15158-0.4203-0.437=
53v0.48576h-0.6339v-5.3606h0.6339z"/><path id=3D"path176" d=3D"m126.08 48.3=
84h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57878 0 0.=
34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.3=
6174 0.29973-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734=
v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-=
0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0=
.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-3e-3 -0.46164-0.234=
27-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.09302t-0.644=
23 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.32384-0.0689 0.62701-0.=
0689 0.47887 0 0.81649 0.14125 0.34107 0.14125 0.55122 0.42375 0.13091 0.17=
226 0.18603 0.42719 0.0551 0.25149 0.0551 0.75792z"/><path id=3D"path178" d=
=3D"m131.89 47.261q-0.20326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46165=
-0.07235-0.59255 0-0.90606 0.37207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.6=
3734v-3.8585h0.63734v0.75448q0.15847-0.40997 0.48576-0.62701 0.33073-0.2204=
9 0.78203-0.22049 0.23427 0 0.43753 0.05857t0.3893 0.18259z"/><path id=3D"p=
ath180" d=3D"m135.22 45.18h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"p=
ath182" d=3D"m131.56 57.303q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579=
-0.55122 0.07579-0.89572 0-1.4022-0.53744-0.50299-0.53744-0.50299-1.4883t0.=
50299-1.4883q0.50643-0.53744 1.4022-0.53744 0.27906 0 0.54433 0.07235t0.533=
99 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-=
0.09991-0.596 0-0.91639 0.38585-0.3204 0.38585-0.3204 1.1024 0 0.71314 0.32=
04 1.1024 0.32384 0.38585 0.91639 0.38585 0.33073 0 0.59256-0.09991 0.26183=
-0.10335 0.48576-0.31695z"/><path id=3D"path184" d=3D"m130.86 61.31v-1.9947=
h0.6339v5.3606h-0.6339v-0.48576q-0.15847 0.28594-0.42374 0.43753-0.26183 0.=
14814-0.60634 0.14814-0.69935 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.49=
86 0-0.94051 0.40307-1.4745 0.40308-0.53744 1.099-0.53744 0.34795 0 0.61323=
 0.15158 0.26527 0.14814 0.41685 0.43408zm-1.8638 1.4401q0 0.73725 0.23426 =
1.1128 0.23427 0.37552 0.69247 0.37552t0.69591-0.37896q0.24115-0.37896 0.24=
115-1.1093 0-0.73381-0.24115-1.1093-0.23771-0.37896-0.69591-0.37896t-0.6924=
7 0.37552q-0.23426 0.37552-0.23426 1.1128z"/></g><path id=3D"path45569" d=
=3D"m113.2 23.535v22.663" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"r=
ound" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"pat=
h45571" d=3D"m113.2 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.001=
9" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-lin=
ecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"/><path =
id=3D"path45573" d=3D"m113.2 46.199c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.=
846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" s=
troke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal=
"/><path id=3D"path45575" d=3D"m121.93 30.8-6e-3 8.5867" fill=3D"none" stro=
ke=3D"#0081cf" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"pa=
int-order:normal"/><path id=3D"path45577" d=3D"m121.93 32.462c0 1.5071 1.54=
29 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arro=
wRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"round" stroke-width=3D".529=
17" style=3D"paint-order:normal"/><path id=3D"path45579" d=3D"m121.93 39.38=
7c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-e=
nd=3D"url(#ArrowRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"round" strok=
e-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path45581" d=
=3D"m121.93 52.334-6e-3 8.5867" fill=3D"none" stroke=3D"#000" stroke-lineca=
p=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=
=3D"path45583" d=3D"m121.93 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.8=
46-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" st=
roke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"=
/><path id=3D"path45585" d=3D"m121.93 60.92c0 1.5071 1.5429 1.4354 1.5429 1=
.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D=
"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-orde=
r:normal"/><g id=3D"text49419" fill=3D"#0081cf" stroke-width=3D".26458px" a=
ria-label=3D"  foo/    x    y"><path id=3D"path159" d=3D"m123.07 23.435v0.5=
271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091 0.49265v0.34=
106h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-=
0.26872q0-0.6339 0.28939-0.93362 0.29283-0.29972 0.9095-0.29972z"/><path id=
=3D"path161" d=3D"m125.78 25.381q-0.48232 0-0.73037 0.37552-0.24804 0.37552=
-0.24804 1.1128 0 0.73381 0.24804 1.1128 0.24805 0.37552 0.73037 0.37552 0.=
48575 0 0.7338-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725-0.24805-1.1=
128-0.24805-0.37552-0.7338-0.37552zm0-0.53744q0.8027 0 1.2264 0.52021 0.427=
19 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42374 0.51676-1.2299 0.=
51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.423=
75-1.5055 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path163" d=3D"m130.=
03 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.733=
81 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552=
 0.24804-0.37896 0.24804-1.1128 0-0.73725-0.24804-1.1128-0.24805-0.37552-0.=
73381-0.37552zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1=
.5055 0 0.98874-0.42375 1.509-0.42375 0.51676-1.2299 0.51676-0.80271 0-1.22=
64-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055 0.42374-0.=
52021 1.2264-0.52021z"/><path id=3D"path165" d=3D"m135.22 23.652h0.65457l-2=
.7078 5.7981h-0.65801z"/><path id=3D"path167" d=3D"m131.76 32.113-1.3815 1.=
8466 1.5158 2.0119h-0.73381l-1.13-1.5468-1.1266 1.5468h-0.7338l1.5158-2.011=
9-1.3815-1.8466h0.7028l1.0232 1.3953 1.0163-1.3953z"/><path id=3D"path169" =
d=3D"m130.86 41.907q-0.15847 0.40308-0.40307 1.0611-0.34107 0.9095-0.4582 1=
.1093-0.15847 0.26872-0.39619 0.40308-0.23771 0.13436-0.55466 0.13436h-0.50=
987v-0.53054h0.37551q0.27906 0 0.43753-0.16192 0.15848-0.16192 0.40308-0.83=
716l-1.4917-3.7965h0.67179l1.1438 3.0179 1.1265-3.0179h0.6718z"/></g></svg>
diff --git a/screenshots/2021-08-18-root-file.svg b/screenshots/2021-08-18-=
root-file.svg
new file mode 100644
index 0000000..b7b2797
--- /dev/null
+++ b/screenshots/2021-08-18-root-file.svg
@@ -0,0 +1,2 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<svg id=3D"svg5" width=3D"149.08mm" height=3D"64.908mm" version=3D"1.1" vi=
ewBox=3D"0 0 149.08 64.908" xmlns=3D"http://www.w3.org/2000/svg"><defs id=
=3D"defs2"><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=3D"auto"><=
path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"cont=
ext-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round" stroke-width=3D=
".625"/></marker></defs><g id=3D"text10527" stroke-width=3D".26458px" aria-=
label=3D"/  foo/=C2=A0   a    b  bar/    c    d"><path id=3D"path71" d=3D"m=
5.3131 16.476h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path73" d=3D"m=
14.408 23.435v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.1=
3091 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v=
-0.49265h1.0301v-0.26872q0-0.6339 0.28939-0.93362 0.29283-0.29972 0.90951-0=
.29972z"/><path id=3D"path75" d=3D"m17.116 25.381q-0.48231 0-0.73036 0.3755=
2-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0=
.73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0=
.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 =
1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.423=
75 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-=
1.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z"/><path id=3D=
"path77" d=3D"m21.364 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.2=
4805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.4857=
6 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725-0.24805-1.1128=
-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1.2265 0.52021 0.4271=
9 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51676-1.2299 0.5=
1676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.4237=
5-1.5055 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path79" d=3D"m26.552=
 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path81" d=3D"m21.66 =
34.032h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57878 =
0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52365 0 0.82338=
-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.6=
3734v-0.57189q-0.20326 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16=
192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.430=
64-0.97841 0.43408-0.33417 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-=
0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.09302-0=
.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.323=
84-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55122 =
0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792z"/>=
<path id=3D"path83" d=3D"m22.404 41.222q0-0.73725-0.23427-1.1128-0.23427-0.=
37552-0.69246-0.37552-0.46164 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1=
093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.692=
46-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.=
41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39=
963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0=
.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.=
6339v-5.3606h0.6339z"/><path id=3D"path85" d=3D"m13.909 48.398q0-0.73725-0.=
23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164 0-0.69935 0.37896-0.23=
771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69935=
 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1=
.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.6959=
1 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-=
0.39963 0.54088-1.099 0.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-0.4=
203-0.43753v0.48576h-0.6339v-5.3606h0.6339z"/><path id=3D"path87" d=3D"m17.=
412 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57=
878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.8=
2338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h=
-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 =
0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0=
.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-0.0034-0.46=
164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.093=
02-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0=
.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55=
122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792=
z"/><path id=3D"path89" d=3D"m23.221 47.261q-0.20326-0.15848-0.41341-0.2308=
2-0.21015-0.07235-0.46164-0.07235-0.59256 0-0.90606 0.37207-0.3135 0.37207-=
0.3135 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.15847-0.40997 0.485=
76-0.62701 0.33073-0.22049 0.78204-0.22049 0.23427 0 0.43753 0.05857t0.3893=
 0.18259z"/><path id=3D"path91" d=3D"m26.552 45.18h0.65457l-2.7078 5.7981h-=
0.65801z"/><path id=3D"path93" d=3D"m22.897 57.303q-0.25494 0.14814-0.5271 =
0.22049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1.4022-0.53744-0.50298-0.=
53744-0.50298-1.4883t0.50298-1.4883q0.50643-0.53744 1.4022-0.53744 0.27905 =
0 0.54433 0.07235 0.26527 0.07235 0.53399 0.22393v0.6649q-0.25149-0.22393-0=
.50643-0.32384-0.25149-0.09991-0.57189-0.09991-0.596 0-0.9164 0.38585t-0.32=
039 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38585 0.9164 0.38585 0.33073 =
0 0.59256-0.09991 0.26183-0.10335 0.48576-0.31695z"/><path id=3D"path95" d=
=3D"m22.198 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848 0.28594-0=
.42375 0.43753-0.26183 0.14814-0.60634 0.14814-0.69936 0-1.1024-0.54088-0.3=
9963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.4745 0.40308-0.53744 1.099-=
0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814 0.41686 0.43408zm-1.8638 =
1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552 0.69246 0.37552t0.69591-0.3=
7896q0.24116-0.37896 0.24116-1.1093 0-0.73381-0.24116-1.1093-0.23771-0.3789=
6-0.69591-0.37896t-0.69246 0.37552q-0.23427 0.37552-0.23427 1.1128z"/></g><=
path id=3D"path25696" d=3D"m4.5344 23.535v22.663" fill=3D"none" stroke=3D"#=
000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:=
normal"/><path id=3D"path25958" d=3D"m4.5344 24.564c0 1.5071 1.5429 1.4354 =
1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" s=
troke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"pa=
int-order:normal"/><path id=3D"path27085" d=3D"m4.5344 46.199c0 1.5071 1.54=
29 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arro=
w1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" s=
tyle=3D"paint-order:normal"/><path id=3D"path27490" d=3D"m13.266 30.8-0.005=
6 8.5867" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round" stroke-wid=
th=3D".52917" style=3D"paint-order:normal"/><path id=3D"path27629" d=3D"m13=
.26 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"=
 marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" s=
troke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path27844"=
 d=3D"m13.26 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=
=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D=
"round" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"p=
ath28236" d=3D"m13.266 52.334-0.0056 8.5867" fill=3D"none" stroke=3D"#000" =
stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:norma=
l"/><path id=3D"path28238" d=3D"m13.26 53.996c0 1.5071 1.5429 1.4354 1.5429=
 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=
=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-o=
rder:normal"/><path id=3D"path28240" d=3D"m13.26 60.92c0 1.5071 1.5429 1.43=
54 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)=
" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D=
"paint-order:normal"/><g id=3D"text31368" stroke-width=3D".26458px" aria-la=
bel=3D"VFS tree:"><path id=3D"path54" d=3D"m2.096 5.3688-1.9637-5.1435h0.72=
692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603 5.1435z"/><path id=3D"path56=
" d=3D"m5.5962 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2=
.4564h-0.69591z"/><path id=3D"path58" d=3D"m12.614 0.39412v0.67868q-0.39619=
-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0.093018-0.56844 0-0.8785 0=
.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.=
17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472 0.52365 0.3720=
7 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0=
.38585-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q=
0.42375 0.23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.9=
1984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23=
082-0.2136-0.76137-0.32039l-0.42375-0.082682q-0.77859-0.15503-1.1265-0.4857=
6t-0.34795-0.91984q0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 =
0.36174 0 0.73725 0.065457 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"=
path60" d=3D"m16.851 0.41479v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198=
 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0=
.7338 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.=
49265h0.46509v-1.0955z"/><path id=3D"path62" d=3D"m21.227 2.1029q-0.1068-0.=
062012-0.23427-0.089573-0.12402-0.031006-0.27561-0.031006-0.53744 0-0.82682=
 0.3514-0.28594 0.34795-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59=
945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17225 0.77859-0.17225 0.06546 =
0 0.14469 0.010335 0.07924 0.00689 0.1757 0.024116z"/><path id=3D"path64" d=
=3D"m25.037 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 =
0.34106 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-=
0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0=
.075792-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.=
50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.4547=
5 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-=
0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.=
36518 0.84405z"/><path id=3D"path66" d=3D"m29.378 3.2811v0.31006h-2.9146q0.=
04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70=
624-0.089573 0.34451-0.089573 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69=
936 0.22049-0.35829 0.075792-0.72692 0.075792-0.92329 0-1.4642-0.53744-0.53=
744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0=
.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.1=
8604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.5305=
4 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path68" =
d=3D"m30.58 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72=
692z"/></g><g id=3D"text36298" fill=3D"#0081cf" stroke-width=3D".26458px" a=
ria-label=3D"(unnamed)"><path id=3D"path107" d=3D"m51.063 16.265q-0.4582 0.=
78548-0.68557 1.5675-0.22393 0.77859-0.22393 1.571 0 0.78893 0.22393 1.571 =
0.22738 0.78204 0.68557 1.5744h-0.55122q-0.52021-0.81993-0.77515-1.5951-0.2=
5494-0.77859-0.25494-1.5503 0-0.76826 0.25494-1.5468 0.25494-0.77859 0.7751=
5-1.5916z"/><path id=3D"path109" d=3D"m52.934 20.158v-2.3909h0.6339v2.3909q=
0 0.52021 0.18259 0.76481 0.18604 0.2446 0.57189 0.2446 0.44786 0 0.68557-0=
.3135 0.23771-0.31695 0.23771-0.90606v-2.1807h0.63734v3.8516h-0.63734v-0.57=
878q-0.16881 0.33417-0.46164 0.50643-0.28939 0.17226-0.67868 0.17226-0.5925=
6 0-0.88194-0.38585-0.28939-0.3893-0.28939-1.1748z"/><path id=3D"path111" d=
=3D"m60.13 19.228v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481-0.18259=
-0.2446-0.57189-0.2446-0.44442 0-0.68557 0.31695-0.23771 0.3135-0.23771 0.9=
0262v2.1807h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073 0.4582-0.49954 0=
.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893 0.29283 0.38585 0.29=
283 1.1713z"/><path id=3D"path113" d=3D"m64.378 19.228v2.3909h-0.63734v-2.3=
909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0.57189-0.2446-0.44442 0-0.685=
58 0.31695-0.23771 0.3135-0.23771 0.90262v2.1807h-0.6339v-3.8585h0.6339v0.5=
7878q0.16881-0.33073 0.4582-0.49954 0.28939-0.17226 0.68558-0.17226 0.58911=
 0 0.8785 0.3893 0.29283 0.38585 0.29283 1.1713z"/><path id=3D"path115" d=
=3D"m67.424 19.68h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19292-0.279=
05 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.5236=
6 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v=
2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50987-0.30661 0.16192-0=
.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.=
64423 0.43064-0.97841 0.43408-0.33417 1.2712-0.33417h0.85094v-0.09991q-0.00=
34-0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6545=
7 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.=
19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.141=
25 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 =
0.75792z"/><path id=3D"path117" d=3D"m71.582 18.153q0.11713-0.24805 0.29628=
-0.36518 0.18259-0.12058 0.43753-0.12058 0.46509 0 0.65457 0.36174 0.19292 =
0.35829 0.19292 1.3539v2.2359h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.0=
8957-0.19982-0.33073-0.19982-0.27561 0-0.37896 0.2136-0.09991 0.21015-0.099=
91 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.09991-1.0197-0.09646-0.19292=
-0.3514-0.19292-0.25149 0-0.3514 0.2136-0.09646 0.21015-0.09646 0.99908v2.2=
083h-0.57533v-3.8585h0.57533v0.33073q0.11369-0.20671 0.2825-0.3135 0.17225-=
0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058 0.1757 0.12058 0.27216 0.3=
6518z"/><path id=3D"path119" d=3D"m77.332 19.531v0.31006h-2.7457v0.02067q0 =
0.63045 0.32728 0.97496 0.33073 0.34451 0.93018 0.34451 0.30317 0 0.6339-0.=
09646 0.33073-0.09646 0.70624-0.29283v0.63045q-0.36174 0.14814-0.69936 0.22=
049-0.33418 0.07579-0.64768 0.07579-0.89917 0-1.4056-0.53744-0.50643-0.5408=
8-0.50643-1.4883 0-0.92329 0.49609-1.4745 0.49609-0.55122 1.3229-0.55122 0.=
73725 0 1.161 0.49954 0.42719 0.49954 0.42719 1.3643zm-0.6339-0.18604q-0.01=
378-0.55811-0.26527-0.84749-0.24805-0.29283-0.71658-0.29283-0.4582 0-0.7544=
8 0.30317-0.29628 0.30317-0.3514 0.8406z"/><path id=3D"path121" d=3D"m80.70=
5 18.253v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848 0.28594-0.42375 0.=
43753-0.26183 0.14814-0.60634 0.14814-0.69935 0-1.1024-0.54088-0.39963-0.54=
433-0.39963-1.4986 0-0.94051 0.40308-1.4745 0.40308-0.53744 1.099-0.53744 0=
.34796 0 0.61323 0.15158 0.26527 0.14814 0.41686 0.43408zm-1.8638 1.44q0 0.=
73725 0.23427 1.1128 0.23427 0.37552 0.69246 0.37552t0.69591-0.37896q0.2411=
6-0.37896 0.24116-1.1093 0-0.7338-0.24116-1.1093-0.23771-0.37896-0.69591-0.=
37896t-0.69246 0.37552q-0.23427 0.37552-0.23427 1.1128z"/><path id=3D"path1=
23" d=3D"m83.195 16.265h0.55122q0.52021 0.81304 0.77515 1.5916t0.25494 1.54=
68q0 0.77515-0.25494 1.5537t-0.77515 1.5916h-0.55122q0.4582-0.79926 0.68213=
-1.5813 0.22738-0.78204 0.22738-1.5641 0-0.78548-0.22738-1.5675-0.22393-0.7=
8204-0.68213-1.571z"/></g><g id=3D"text36320" stroke-width=3D".26458px" ari=
a-label=3D"FS B:"><path id=3D"path98" d=3D"m58.036 0.22531h2.9559v0.58567h-=
2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.69591z"/><path id=3D"path100" =
d=3D"m65.053 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.09301=
8-0.67868-0.093018-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701=
 0 0.34106 0.20326 0.51676 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q=
0.77859 0.14814 1.1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.=
50298 1.1334-0.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.40=
997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.4065=
2 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0=
.66835 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.=
082682q-0.77859-0.15503-1.1265-0.48576-0.34795-0.33073-0.34795-0.91984 0-0.=
68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.065=
457 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"path102" d=3D"m69.387 2=
.9125v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0.23427 0.27216-0.713=
14 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.55=
03h1.0301q0.50987 0 0.75792-0.18948 0.25149-0.19293 0.25149-0.58567 0-0.389=
3-0.25149-0.58222-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.57189h1.7777q=
0.79582 0 1.2265 0.33073t0.43064 0.94051q0 0.47198-0.22049 0.75103t-0.64768=
 0.34795q0.51332 0.11024 0.79582 0.46164 0.28594 0.34795 0.28594 0.87161 0 =
0.68902-0.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z"/><path id=
=3D"path104" d=3D"m73.666 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692=
v0.87505h-0.72692z"/></g><g id=3D"text44877" stroke-width=3D".26458px" aria=
-label=3D"Mounting FS Bon /foo/a:"><path id=3D"path126" d=3D"m98.942 0.3493=
3h1.037l1.3126 3.5002 1.3195-3.5002h1.037v5.1435h-0.67869v-4.5165l-1.3264 3=
.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z"/><path id=3D"path128" d=3D"=
m106.5 2.0788q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0=
.69246 0.29284 1.0921 0.29627 0.39619 0.80959 0.39619 0.50643 0 0.80271-0.3=
9963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.4030=
8zm0-0.53744q0.82683 0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.94=
74-0.47197 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0=
.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.30=
22-0.53744z"/><path id=3D"path130" d=3D"m109.25 3.9701v-2.3358h0.6339v2.311=
7q0 0.54777 0.2136 0.82338 0.21359 0.27216 0.64079 0.27216 0.51331 0 0.8095=
9-0.32728 0.29973-0.32728 0.29973-0.89228v-2.1876h0.63389v3.8585h-0.63389v-=
0.59256q-0.23082 0.3514-0.53744 0.52365-0.30317 0.16881-0.70624 0.16881-0.6=
6491 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z"/><path id=3D"path132=
" d=3D"m117 3.164v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0=
.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.89228v2.1807h-0.=
63734v-3.8585h0.63734v0.59945q0.22738-0.34795 0.53399-0.52021 0.31006-0.172=
25 0.71314-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997 0.34106 1.2092z"/=
><path id=3D"path134" d=3D"m118.89 0.53881v1.0955h1.3057v0.49265h-1.3057v2.=
0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.530=
55h-0.65112q-0.73381 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.09=
46h-0.46509v-0.49265h0.46509v-1.0955z"/><path id=3D"path136" d=3D"m121.03 1=
.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0.63389z"/><path i=
d=3D"path138" d=3D"m126.2 3.164v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.=
81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.89=
228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795 0.53399-0.52021=
 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997 0.3=
4106 1.2092z"/><path id=3D"path140" d=3D"m130 3.5188q0-0.68902-0.28594-1.06=
8-0.2825-0.37896-0.79582-0.37896-0.50987 0-0.79582 0.37896-0.2825 0.37896-0=
.2825 1.068 0 0.68557 0.2825 1.0645 0.28595 0.37896 0.79582 0.37896 0.51332=
 0 0.79582-0.37896 0.28594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0=
.43753 1.4642-0.43753 0.48231-1.3401 0.48231-0.33418 0-0.63045-0.051677-0.2=
9628-0.048231-0.57534-0.15158v-0.61667q0.27906 0.15158 0.55122 0.22393 0.27=
216 0.072347 0.55466 0.072347 0.62356 0 0.93362-0.32728 0.31006-0.32384 0.3=
1006-0.98185v-0.3135q-0.19637 0.34106-0.50298 0.50987-0.30662 0.16881-0.733=
81 0.16881-0.70969 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.8957=
3 0.43408-1.4366 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0=
.30661 0.16881 0.50298 0.50987v-0.58567h0.6339z"/><path id=3D"path142" d=3D=
"m134.21 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h=
-0.69591z"/><path id=3D"path144" d=3D"m141.23 0.51814v0.67868q-0.39618-0.18=
948-0.74758-0.2825t-0.67869-0.093018q-0.56844 0-0.8785 0.22049-0.30661 0.22=
049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.17225 0.77859 0.279=
05l0.42031 0.086127q0.77859 0.14814 1.1472 0.52365 0.37207 0.37207 0.37207 =
0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.38585-0.36518 0-0=
.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42374 0.23771 0.=
83026 0.35829 0.40653 0.12058 0.79927 0.12058 0.596 0 0.91984-0.23427 0.323=
84-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137=
-0.32039l-0.42374-0.082682q-0.77859-0.15503-1.1266-0.48576-0.34795-0.33073-=
0.34795-0.91984 0-0.68213 0.47886-1.0749 0.48232-0.39274 1.3264-0.39274 0.3=
6173 0 0.73725 0.065457 0.37551 0.065457 0.76825 0.19637z"/><path id=3D"pat=
h146" d=3D"m145.56 3.0365v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0=
.23427 0.27216-0.71314 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.=
23082zm0-2.1153v1.5503h1.0301q0.50988 0 0.75792-0.18948 0.2515-0.19293 0.25=
15-0.58567 0-0.3893-0.2515-0.58222-0.24804-0.19293-0.75792-0.19293zm-0.6959=
1-0.57189h1.7777q0.79582 0 1.2264 0.33073 0.43064 0.33073 0.43064 0.94051 0=
 0.47198-0.22049 0.75103-0.22048 0.27905-0.64767 0.34795 0.51332 0.11024 0.=
79581 0.46164 0.28595 0.34795 0.28595 0.87161 0 0.68902-0.46854 1.0645-0.46=
853 0.37552-1.3332 0.37552h-1.8466z"/><path id=3D"path148" d=3D"m108.99 9.2=
549q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.092=
1q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963t0.29628-1.0887q0=
-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82683 =
0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.4=
7197 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46854-0.54088-0.4685=
4-1.4883 0-0.95085 0.46854-1.4883 0.47197-0.53744 1.3022-0.53744z"/><path i=
d=3D"path150" d=3D"m115.02 10.34v2.3289h-0.63389v-2.3082q0-0.54777-0.2136-0=
.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.8=
9228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795 0.534-0.52021 =
0.31005-0.17225 0.71313-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997 0.34=
106 1.2092z"/><path id=3D"path152" d=3D"m119.65 7.5255h0.58567l-1.7914 5.79=
81h-0.58567z"/><path id=3D"path154" d=3D"m122.86 7.3084v0.5271h-0.60634q-0.=
34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106h1.0439v0.4926=
5h-1.0439v3.3659h-0.63735v-3.3659h-0.60633v-0.49265h0.60633v-0.26872q0-0.64=
423 0.29973-0.93707 0.29972-0.29628 0.95084-0.29628z"/><path id=3D"path156"=
 d=3D"m124.88 9.2549q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0=
887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963=
 0.29627-0.39963 0.29627-1.0887 0-0.68557-0.29627-1.0852-0.29628-0.40308-0.=
80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.47198 1=
.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.30=
22-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-=
0.53744 1.3022-0.53744z"/><path id=3D"path158" d=3D"m129.2 9.2549q-0.50988 =
0-0.80616 0.39963-0.29627 0.39619-0.29627 1.0887t0.29283 1.0921q0.29628 0.3=
9619 0.8096 0.39619 0.50643 0 0.8027-0.39963 0.29628-0.39963 0.29628-1.0887=
 0-0.68557-0.29628-1.0852-0.29627-0.40308-0.8027-0.40308zm0-0.53744q0.82682=
 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.=
47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.468=
53-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z"/><path =
id=3D"path160" d=3D"m133.15 7.5255h0.58567l-1.7915 5.7981h-0.58566z"/><path=
 id=3D"path162" d=3D"m136.15 10.729q-0.76825 0-1.0645 0.1757t-0.29628 0.599=
45q0 0.33762 0.22049 0.53744 0.22393 0.19637 0.60633 0.19637 0.5271 0 0.844=
05-0.37207 0.3204-0.37552 0.3204-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0=
.63389v-0.58567q-0.21704 0.3514-0.54088 0.52021-0.32384 0.16536-0.79238 0.1=
6536-0.59255 0-0.94395-0.33073-0.34796-0.33417-0.34796-0.89228 0-0.65112 0.=
43408-0.98185 0.43753-0.33073 1.3022-0.33073h0.88884v-0.06201q0-0.43753-0.2=
8939-0.67524-0.28594-0.24116-0.80615-0.24116-0.33073 0-0.64424 0.079237-0.3=
135 0.079237-0.60289 0.23771v-0.58567q0.34796-0.13436 0.67524-0.19982 0.327=
28-0.068902 0.63734-0.068902 0.83716 0 1.2506 0.43408t0.41341 1.316z"/><pat=
h id=3D"path164" d=3D"m138.88 11.794h0.72691v0.87506h-0.72691zm0-2.7733h0.7=
2691v0.87505h-0.72691z"/></g><g id=3D"text18565" stroke-width=3D".26458px" =
aria-label=3D"/  foo/    b  bar/    c    d"><path id=3D"path167" d=3D"m114.=
16 16.476h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path169" d=3D"m123=
.25 23.435v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13092 0.1378-0.1309=
2 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.63389v-3.3659h-1.0301v-0=
.49265h1.0301v-0.26872q0-0.6339 0.28938-0.93362 0.29284-0.29972 0.90951-0.2=
9972z"/><path id=3D"path171" d=3D"m125.96 25.381q-0.48231 0-0.73036 0.37552=
-0.24804 0.37552-0.24804 1.1128 0 0.73381 0.24804 1.1128 0.24805 0.37552 0.=
73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.=
73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1=
.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.4237=
4 0.51676-1.2299 0.51676-0.8027 0-1.2264-0.51676-0.42375-0.52021-0.42375-1.=
509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2264-0.52021z"/><path id=3D"p=
ath173" d=3D"m130.21 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24=
805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576=
 0 0.7338-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725-0.24805-1.1128-0=
.24804-0.37552-0.7338-0.37552zm0-0.53744q0.80271 0 1.2264 0.52021 0.4272 0.=
52021 0.4272 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51676-1.2299 0.51676-=
0.80271 0-1.2265-0.51676-0.42374-0.52021-0.42374-1.509 0-0.9853 0.42374-1.5=
055 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path175" d=3D"m135.4 23.6=
52h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path177" d=3D"m131.25 41.=
222q0-0.73725-0.23427-1.1128-0.23426-0.37552-0.69246-0.37552-0.46165 0-0.69=
936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771=
 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1=
.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0.15158 0.6201=
2-0.15158 0.6959 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-=
0.40308 1.4986-0.39963 0.54088-1.099 0.54088-0.3445 0-0.60978-0.14814-0.261=
82-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h0.6339z"/><path id=3D"pat=
h179" d=3D"m122.75 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-=
0.37552-0.46165 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 =
0.23771 1.1093 0.23771 0.37896 0.69936 0.37896 0.45819 0 0.69246-0.37552 0.=
23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408=
 0.26871-0.15158 0.62011-0.15158 0.69591 0 1.0955 0.53744 0.39964 0.53399 0=
.39964 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0.54088-0.3445=
1 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path id=3D"path181" d=3D"m126.26 48.384h-0.21015q-0.55466 0-0.83=
716 0.19637-0.27905 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.210=
15 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518 0.3031=
7-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-=
0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0=
.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841 0.43408-0.33418 1.27=
12-0.33418h0.85094v-0.09991q-3e-3 -0.46164-0.23427-0.66835-0.23082-0.21015-=
0.73725-0.21015-0.32384 0-0.65457 0.09302t-0.64423 0.27216v-0.6339q0.3514-0=
.13436 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14=
125 0.34106 0.14125 0.55121 0.42375 0.13092 0.17226 0.18604 0.42719 0.0551 =
0.25149 0.0551 0.75792z"/><path id=3D"path183" d=3D"m132.07 47.261q-0.20326=
-0.15848-0.41342-0.23082-0.21015-0.07235-0.46164-0.07235-0.59255 0-0.90606 =
0.37207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63735v-3.8585h0.63735v0.7544=
8q0.15847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78203-0.22049 0.23427 0=
 0.43753 0.05857t0.3893 0.18259z"/><path id=3D"path185" d=3D"m135.4 45.18h0=
.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path187" d=3D"m131.74 57.303q=
-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1=
.4022-0.53744-0.50299-0.53744-0.50299-1.4883t0.50299-1.4883q0.50643-0.53744=
 1.4022-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399 0.22393v0=
.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0.09991-0.59=
6 0-0.91639 0.38585-0.3204 0.38585-0.3204 1.1024 0 0.71314 0.3204 1.1024 0.=
32384 0.38585 0.91639 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335 0.4=
8576-0.31695z"/><path id=3D"path189" d=3D"m131.04 61.31v-1.9947h0.6339v5.36=
06h-0.6339v-0.48576q-0.15847 0.28594-0.42374 0.43753-0.26183 0.14814-0.6063=
4 0.14814-0.69936 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051=
 0.40307-1.4745 0.40308-0.53744 1.099-0.53744 0.34795 0 0.61323 0.15158 0.2=
6527 0.14814 0.41685 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128t0.692=
47 0.37552q0.45819 0 0.69591-0.37896 0.24115-0.37896 0.24115-1.1093 0-0.733=
81-0.24115-1.1093-0.23772-0.37896-0.69591-0.37896-0.4582 0-0.69247 0.37552t=
-0.23427 1.1128z"/></g><path id=3D"path18567" d=3D"m113.38 23.535v22.663" f=
ill=3D"none" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".5291=
7" style=3D"paint-order:normal"/><path id=3D"path18569" d=3D"m113.38 24.564=
c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-en=
d=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-widt=
h=3D".52917" style=3D"paint-order:normal"/><path id=3D"path18571" d=3D"m113=
.38 46.199c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"=
 marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" s=
troke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path18573"=
 d=3D"m122.11 30.8-6e-3 8.5867" fill=3D"none" stroke=3D"#000" stroke-lineca=
p=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=
=3D"path18575" d=3D"m122.11 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.8=
46-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" st=
roke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:normal"=
/><path id=3D"path18577" d=3D"m122.11 39.387c0 1.5071 1.5429 1.4354 1.5429 =
1.4354l3.846-0.0019" fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=
=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-o=
rder:normal"/><path id=3D"path18579" d=3D"m122.11 52.334-6e-3 8.5867" fill=
=3D"none" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=3D".52917" =
style=3D"paint-order:normal"/><path id=3D"path18581" d=3D"m122.11 53.996c0 =
1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" marker-end=
=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" stroke-width=
=3D".52917" style=3D"paint-order:normal"/><path id=3D"path18583" d=3D"m122.=
11 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none" m=
arker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round" str=
oke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text22069" fill=
=3D"#0081cf" stroke-width=3D".26458px" aria-label=3D"a"><path id=3D"path192=
" d=3D"m130.57 33.771h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19292-0=
.27905 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.=
52365 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26=
183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30662 0.161=
92-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33418-0.3514-0.89228 =
0-0.64423 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-=
3e-3 -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6=
5457 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.3238=
4-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55121 0=
.42375 0.13092 0.17226 0.18604 0.42719 0.0551 0.25149 0.0551 0.75792z"/></g=
></svg>
--=20
2.31.1


