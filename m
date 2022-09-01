Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70035A9AF7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:55:56 +0200 (CEST)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlbn-0004Yz-Vs
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlTA-0001Bt-Ck
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlGb-0006yD-SS
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662042841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSJJnmIXmudaMnxuNmMvGw3Z7IavYVzasHgSDRE1bBY=;
 b=TE2SFIzLGFXu5UnemZUdnwPHP7MuMeGBTv9Q1+KioZnJuX8mcIfmHmfyQmWLfiO4IbPKLV
 BSK/9azgwh4T5MP5d36vjxdQiFjZQg/x/a7nt9aKqrlFzX4GQVWs5hXQyRGq5dBs5FhI0v
 nEwERPqApJiXs92oPMUZZld0bAR4ZDk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-eQ17MzSyNTShQU6sEfs8AA-1; Thu, 01 Sep 2022 10:32:28 -0400
X-MC-Unique: eQ17MzSyNTShQU6sEfs8AA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D724B296A62D;
 Thu,  1 Sep 2022 14:32:27 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936E4492C3B;
 Thu,  1 Sep 2022 14:32:26 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH 1/3] qemu-img: Add checksum command
Date: Thu,  1 Sep 2022 17:32:21 +0300
Message-Id: <20220901143223.201295-2-nsoffer@redhat.com>
In-Reply-To: <20220901143223.201295-1-nsoffer@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The checksum command compute a checksum for disk image content using the
blkhash library[1]. The blkhash library is not packaged yet, but it is
available via copr[2].

Example run:

    $ ./qemu-img checksum -p fedora-35.qcow2
    6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de4c7d22cff713a5  fedora-35.qcow2

The block checksum is constructed by splitting the image to fixed sized
blocks and computing a digest of every block. The image checksum is the
digest of the all block digests.

The checksum uses internally the "sha256" algorithm but it cannot be
compared with checksums created by other tools such as `sha256sum`.

The blkhash library supports sparse images, zero detection, and
optimizes zero block hashing (they are practically free). The library
uses multiple threads to speed up the computation.

Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times
faster, depending on the amount of data in the image:

    $ ./qemu-img info /scratch/50p.raw
    file format: raw
    virtual size: 6 GiB (6442450944 bytes)
    disk size: 2.91 GiB

    $ hyperfine -w2 -r5 -p "sleep 1" "./qemu-img checksum /scratch/50p.raw" \
                                     "sha256sum /scratch/50p.raw"
    Benchmark 1: ./qemu-img checksum /scratch/50p.raw
      Time (mean ± σ):      1.849 s ±  0.037 s    [User: 7.764 s, System: 0.962 s]
      Range (min … max):    1.813 s …  1.908 s    5 runs

    Benchmark 2: sha256sum /scratch/50p.raw
      Time (mean ± σ):     14.585 s ±  0.072 s    [User: 13.537 s, System: 1.003 s]
      Range (min … max):   14.501 s … 14.697 s    5 runs

    Summary
      './qemu-img checksum /scratch/50p.raw' ran
        7.89 ± 0.16 times faster than 'sha256sum /scratch/50p.raw'

The new command is available only when `blkhash` is available during
build. To test the new command please install the `blkhash-devel`
package:

    $ dnf copr enable nsoffer/blkhash
    $ sudo dnf install blkhash-devel

[1] https://gitlab.com/nirs/blkhash
[2] https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash/
[3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,
    sha256sum (estimate): 17,749s

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 docs/tools/qemu-img.rst |  22 +++++
 meson.build             |  10 ++-
 meson_options.txt       |   2 +
 qemu-img-cmds.hx        |   8 ++
 qemu-img.c              | 191 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 232 insertions(+), 1 deletion(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 85a6e05b35..8be9c45cbf 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -347,20 +347,42 @@ Command description:
     Check completed, image is corrupted
   3
     Check completed, image has leaked clusters, but is not corrupted
   63
     Checks are not supported by the image format
 
   If ``-r`` is specified, exit codes representing the image state refer to the
   state after (the attempt at) repairing it. That is, a successful ``-r all``
   will yield the exit code 0, independently of the image state before.
 
+.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f FMT] [-T SRC_CACHE] [-p] FILENAME
+
+  Print a checksum for image *FILENAME* guest visible content. Images with
+  different format or settings wil have the same checksum.
+
+  The format is probed unless you specify it by ``-f``.
+
+  The checksum is computed for guest visible content. Allocated areas full of
+  zeroes, zero clusters, and unallocated areas are read as zeros so they will
+  have the same checksum. Images with single or multiple files or backing files
+  will have the same checksums if the guest will see the same content when
+  reading the image.
+
+  Image metadata that is not visible to the guest such as dirty bitmaps does
+  not affect the checksum.
+
+  Computing a checksum requires a read-only image. You cannot compute a
+  checksum of an active image used by a guest, but you can compute a checksum
+  of a guest during pull mode incremental backup using NBD URL.
+
+  The checksum is not compatible with other tools such as *sha256sum*.
+
 .. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-r RATE_LIMIT] [-d] [-p] FILENAME
 
   Commit the changes recorded in *FILENAME* in its base image or backing file.
   If the backing file is smaller than the snapshot, then the backing file will be
   resized to be the same size as the snapshot.  If the snapshot is smaller than
   the backing file, the backing file will not be truncated.  If you want the
   backing file to match the size of the smaller snapshot, you can safely truncate
   it yourself once the commit operation successfully completes.
 
   The image *FILENAME* is emptied after the operation has succeeded. If you do
diff --git a/meson.build b/meson.build
index 20fddbd707..56b648d8a7 100644
--- a/meson.build
+++ b/meson.build
@@ -727,20 +727,24 @@ if not get_option('curl').auto() or have_block
                     kwargs: static_kwargs)
 endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
                        method: 'pkg-config',
                        required: get_option('libudev'),
                        kwargs: static_kwargs)
 endif
 
+blkhash = dependency('blkhash', version: '>=0.4.1',
+                     method: 'pkg-config',
+                     required: get_option('blkhash'))
+
 mpathlibs = [libudev]
 mpathpersist = not_found
 mpathpersist_new_api = false
 if targetos == 'linux' and have_tools and get_option('mpath').allowed()
   mpath_test_source_new = '''
     #include <libudev.h>
     #include <mpath_persist.h>
     unsigned mpath_mx_alloc_len = 1024;
     int logsink;
     static struct config *multipath_conf;
@@ -1852,20 +1856,22 @@ config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
 if xen.found()
   # protect from xen.version() having less than three components
   xen_version = xen.version().split('.') + ['0', '0']
   xen_ctrl_version = xen_version[0] + \
     ('0' + xen_version[1]).substring(-2) + \
     ('0' + xen_version[2]).substring(-2)
   config_host_data.set('CONFIG_XEN_CTRL_INTERFACE_VERSION', xen_ctrl_version)
 endif
+config_host_data.set('CONFIG_BLKHASH', blkhash.found())
+
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
 config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 have_coroutine_pool = get_option('coroutine_pool')
 if get_option('debug_stack_usage') and have_coroutine_pool
@@ -3594,21 +3600,22 @@ subdir('qga')
 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
 # when we don't build tools or system
 if xkbcommon.found()
   # used for the update-keymaps target, so include rules even if !have_tools
   qemu_keymap = executable('qemu-keymap', files('qemu-keymap.c', 'ui/input-keymap.c') + genh,
                            dependencies: [qemuutil, xkbcommon], install: have_tools)
 endif
 
 if have_tools
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
-             dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
+             dependencies: [authz, block, crypto, io, qom, qemuutil, blkhash],
+             install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls, selinux],
                install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')
 
@@ -3977,20 +3984,21 @@ summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': numa}
 summary_info += {'capstone':          capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
 summary_info += {'libudev':           libudev}
 # Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary_info += {'selinux':           selinux}
+summary_info += {'blkhash':           blkhash}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
   message()
   warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
   message()
   message('CPU host architecture ' + cpu + ' support is not currently maintained.')
   message('The QEMU project intends to remove support for this host CPU in')
   message('a future release if nobody volunteers to maintain it and to')
   message('provide a build host for our continuous integration setup.')
diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..8bf1dece12 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -304,10 +304,12 @@ option('debug_mutex', type: 'boolean', value: false,
 option('debug_stack_usage', type: 'boolean', value: false,
        description: 'measure coroutine stack usage')
 option('qom_cast_debug', type: 'boolean', value: false,
        description: 'cast debugging support')
 option('gprof', type: 'boolean', value: false,
        description: 'QEMU profiling with gprof')
 option('profiler', type: 'boolean', value: false,
        description: 'profiler support')
 option('slirp_smbd', type : 'feature', value : 'auto',
        description: 'use smbd (at path --smbd=*) in slirp networking')
+option('blkhash', type: 'feature', value: 'auto',
+       description: 'blkhash support for computing image checksum')
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 1b1dab5b17..c4fc935a37 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -26,20 +26,28 @@ DEF("bitmap", img_bitmap,
 SRST
 .. option:: bitmap (--merge SOURCE | --add | --remove | --clear | --enable | --disable)... [-b SOURCE_FILE [-F SOURCE_FMT]] [-g GRANULARITY] [--object OBJECTDEF] [--image-opts | -f FMT] FILENAME BITMAP
 ERST
 
 DEF("check", img_check,
     "check [--object objectdef] [--image-opts] [-q] [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] [-U] filename")
 SRST
 .. option:: check [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [--output=OFMT] [-r [leaks | all]] [-T SRC_CACHE] [-U] FILENAME
 ERST
 
+#ifdef CONFIG_BLKHASH
+DEF("checksum", img_checksum,
+    "checksum [--object objectdef] [--image-opts] [-f fmt] [-T src_cache] [-p] filename")
+SRST
+.. option:: checksum [--object OBJECTDEF] [--image-opts] [-f FMT] [-T SRC_CACHE] [-p] FILENAME
+ERST
+#endif /* CONFIG_BLKHASH */
+
 DEF("commit", img_commit,
     "commit [--object objectdef] [--image-opts] [-q] [-f fmt] [-t cache] [-b base] [-r rate_limit] [-d] [-p] filename")
 SRST
 .. option:: commit [--object OBJECTDEF] [--image-opts] [-q] [-f FMT] [-t CACHE] [-b BASE] [-r RATE_LIMIT] [-d] [-p] FILENAME
 ERST
 
 DEF("compare", img_compare,
     "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] filename1 filename2")
 SRST
 .. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
diff --git a/qemu-img.c b/qemu-img.c
index 7d4b33b3da..7edcfe4bc8 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -17,20 +17,21 @@
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 
 #include "qemu/osdep.h"
 #include <getopt.h>
+#include <blkhash.h>
 
 #include "qemu/help-texts.h"
 #include "qemu/qemu-progress.h"
 #include "qemu-version.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qdict.h"
@@ -1611,20 +1612,210 @@ out:
     qemu_vfree(buf1);
     qemu_vfree(buf2);
     blk_unref(blk2);
 out2:
     blk_unref(blk1);
 out3:
     qemu_progress_end();
     return ret;
 }
 
+#ifdef CONFIG_BLKHASH
+/*
+ * Compute image checksum.
+ */
+static int img_checksum(int argc, char **argv)
+{
+    const char *digest_name = "sha256";
+    const size_t block_size = 64 * KiB;
+
+    const char *format = NULL;
+    const char *cache = BDRV_DEFAULT_CACHE;
+    const char *filename;
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    uint8_t *buf = NULL;
+    int64_t pnum;
+    bool progress = false;
+    int flags = 0;
+    bool writethrough;
+    int64_t total_size;
+    int64_t offset = 0;
+    int c;
+    bool image_opts = false;
+    struct blkhash *h = NULL;
+    unsigned char digest[64];
+    unsigned int digest_len;
+    int ret = 1;
+    int err;
+
+    for (;;) {
+        static const struct option long_options[] = {
+            {"help", no_argument, 0, 'h'},
+            {"object", required_argument, 0, OPTION_OBJECT},
+            {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
+            {0, 0, 0, 0}
+        };
+        c = getopt_long(argc, argv, ":hf:T:p",
+                        long_options, NULL);
+        if (c == -1) {
+            break;
+        }
+        switch (c) {
+        case ':':
+            missing_argument(argv[optind - 1]);
+            break;
+        case '?':
+            unrecognized_option(argv[optind - 1]);
+            break;
+        case 'h':
+            help();
+            break;
+        case 'f':
+            format = optarg;
+            break;
+        case 'T':
+            cache = optarg;
+            break;
+        case 'p':
+            progress = true;
+            break;
+        case OPTION_OBJECT:
+            {
+                Error *local_err = NULL;
+
+                if (!user_creatable_add_from_str(optarg, &local_err)) {
+                    if (local_err) {
+                        error_report_err(local_err);
+                        exit(2);
+                    } else {
+                        /* Help was printed */
+                        exit(EXIT_SUCCESS);
+                    }
+                }
+                break;
+            }
+        case OPTION_IMAGE_OPTS:
+            image_opts = true;
+            break;
+        }
+    }
+
+    if (optind != argc - 1) {
+        error_exit("Expecting image file name");
+    }
+
+    filename = argv[optind++];
+
+    err = bdrv_parse_cache_mode(cache, &flags, &writethrough);
+    if (err < 0) {
+        error_report("Invalid source cache option: %s", cache);
+        return ret;
+    }
+
+    blk = img_open(image_opts, filename, format, flags, writethrough, false,
+                   false);
+    if (!blk) {
+        return ret;
+    }
+
+    /* Initialize before using goto out. */
+    qemu_progress_init(progress, 2.0);
+
+    bs = blk_bs(blk);
+    buf = blk_blockalign(blk, IO_BUF_SIZE);
+
+    total_size = blk_getlength(blk);
+    if (total_size < 0) {
+        error_report("Can't get size of %s: %s",
+                     filename, strerror(-total_size));
+        goto out;
+    }
+
+    h = blkhash_new(block_size, digest_name);
+    if (!h) {
+        error_report("Can't create blkhash: %s", strerror(errno));
+        goto out;
+    }
+
+    qemu_progress_print(0, 100);
+
+    while (offset < total_size) {
+        int status;
+        int64_t chunk;
+
+        status = bdrv_block_status_above(bs, NULL, offset,
+                                         total_size - offset, &pnum, NULL,
+                                         NULL);
+        if (status < 0) {
+            error_report("Error checking status at offset %" PRId64 " for %s",
+                         offset, filename);
+            goto out;
+        }
+
+        assert(pnum);
+        chunk = pnum;
+
+        if (status & BDRV_BLOCK_ZERO) {
+            chunk = MIN(chunk, SIZE_MAX);
+            err = blkhash_zero(h, chunk);
+            if (err) {
+                error_report("Error zeroing hash at offset %" PRId64
+                             " of %s: %s",
+                             offset, filename, strerror(err));
+                goto out;
+            }
+        } else {
+            chunk = MIN(chunk, IO_BUF_SIZE);
+            err = blk_pread(blk, offset, chunk, buf, 0);
+            if (err < 0) {
+                error_report("Error reading at offset %" PRId64 " of %s: %s",
+                             offset, filename, strerror(-err));
+                goto out;
+            }
+            err = blkhash_update(h, buf, chunk);
+            if (err) {
+                error_report("Error updating hash at offset %" PRId64
+                             " of %s: %s",
+                             offset, filename, strerror(err));
+                goto out;
+            }
+        }
+
+        offset += chunk;
+        qemu_progress_print(((float) chunk / total_size) * 100, 100);
+    }
+
+    err = blkhash_final(h, digest, &digest_len);
+    if (err) {
+        error_report("Error finalizing hash of %s: %s",
+                     filename, strerror(err));
+        goto out;
+    }
+
+    for (unsigned i = 0; i < digest_len; i++) {
+        printf("%02x", digest[i]);
+    }
+    printf("  %s%s", filename, progress ? "" : "\n");
+
+    ret = 0;
+
+out:
+    blkhash_free(h);
+    qemu_vfree(buf);
+    blk_unref(blk);
+    qemu_progress_end();
+
+    return ret;
+}
+#endif /* CONFIG_BLKHASH */
+
 /* Convenience wrapper around qmp_block_dirty_bitmap_merge */
 static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
                                   const char *src_node, const char *src_name,
                                   Error **errp)
 {
     BlockDirtyBitmapOrStr *merge_src;
     BlockDirtyBitmapOrStrList *list = NULL;
 
     merge_src = g_new0(BlockDirtyBitmapOrStr, 1);
     merge_src->type = QTYPE_QDICT;
-- 
2.37.2


