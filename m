Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A244D143545
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 02:40:23 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itiWk-0003fR-M3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 20:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <5408c28c8de25dd575b745cef63bf785305ccef2@lizzy.crudebyte.com>)
 id 1itiUW-0001cJ-I7
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:38:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <5408c28c8de25dd575b745cef63bf785305ccef2@lizzy.crudebyte.com>)
 id 1itiUV-000329-Df
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:38:04 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <5408c28c8de25dd575b745cef63bf785305ccef2@lizzy.crudebyte.com>)
 id 1itiUV-0002cv-7S
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=fb6OOVIO1AGu0rbOOglAJ88WjD1vPGjm74d52ypJseM=; b=Zbc6y
 YsPPWtlc480bHQ+9uRog8T2MfTRopRY/zkDuL8UcM+58BhuGXnl4hxDdpyafptqdVZhA4aKZB2y1q
 zieJUmEo6MOJHxBRDj61CT2Xsg2RojmBDgK+AdgvWTfeyy1o+iv562DTWmyW80yQ8LAjRMJfzJ9GL
 Ms9PEbaSKQKJd8BuNF4Olnzhxoz4mCnvYWcWU/mbME0G5m85EMFe2Z+EpvAs+2gZcRiR+W6F+pDCX
 rvZxluoMnxNZCvwkDUrXsXsXaLeciZFqXnbXoMEEUqmEPBytUMweUvJN908Z25HfAYQTP3ime7R9V
 EFD/FK/kkbCqI6d+HQFNbjeLoVrBw==;
Message-Id: <5408c28c8de25dd575b745cef63bf785305ccef2.1579567020.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1579567019.git.qemu_oss@crudebyte.com>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 21 Jan 2020 01:01:56 +0100
Subject: [PATCH v4 04/11] hw/9pfs/9p-synth: added directory for readdir test
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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

This will provide the following virtual files by the 9pfs
synth driver:

  - /ReadDirDir/ReadDirFile99
  - /ReadDirDir/ReadDirFile98
  ...
  - /ReadDirDir/ReadDirFile1
  - /ReadDirDir/ReadDirFile0

This virtual directory and its virtual 100 files will be
used by the upcoming 9pfs readdir tests.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-synth.c | 19 +++++++++++++++++++
 hw/9pfs/9p-synth.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 54239c9bbf..7eb210ffa8 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -578,6 +578,25 @@ static int synth_init(FsContext *ctx, Error **errp)
                                        NULL, v9fs_synth_qtest_flush_write,
                                        ctx);
         assert(!ret);
+
+        /* Directory for READDIR test */
+        {
+            V9fsSynthNode *dir = NULL;
+            ret = qemu_v9fs_synth_mkdir(
+                NULL, 0700, QTEST_V9FS_SYNTH_READDIR_DIR, &dir
+            );
+            assert(!ret);
+            for (i = 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
+                char *name = g_strdup_printf(
+                    QTEST_V9FS_SYNTH_READDIR_FILE, i
+                );
+                ret = qemu_v9fs_synth_add_file(
+                    dir, 0, name, NULL, NULL, ctx
+                );
+                assert(!ret);
+                g_free(name);
+            }
+        }
     }
 
     return 0;
diff --git a/hw/9pfs/9p-synth.h b/hw/9pfs/9p-synth.h
index af7a993a1e..036d7e4a5b 100644
--- a/hw/9pfs/9p-synth.h
+++ b/hw/9pfs/9p-synth.h
@@ -55,6 +55,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
 #define QTEST_V9FS_SYNTH_LOPEN_FILE "LOPEN"
 #define QTEST_V9FS_SYNTH_WRITE_FILE "WRITE"
 
+/* for READDIR test */
+#define QTEST_V9FS_SYNTH_READDIR_DIR "ReadDirDir"
+#define QTEST_V9FS_SYNTH_READDIR_FILE "ReadDirFile%d"
+#define QTEST_V9FS_SYNTH_READDIR_NFILES 100
+
 /* Any write to the "FLUSH" file is handled one byte at a time by the
  * backend. If the byte is zero, the backend returns success (ie, 1),
  * otherwise it forces the server to try again forever. Thus allowing
-- 
2.20.1


