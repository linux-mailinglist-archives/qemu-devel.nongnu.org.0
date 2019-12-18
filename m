Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD3123BB4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 01:39:02 +0100 (CET)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihNMj-0005kI-Jc
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 19:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <3d6eff9edc559c30eb731c312ee0107f4b93b7d1@lizzy.crudebyte.com>)
 id 1ihNJM-00034n-6p
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <3d6eff9edc559c30eb731c312ee0107f4b93b7d1@lizzy.crudebyte.com>)
 id 1ihNJL-00048Q-6M
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:35:32 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <3d6eff9edc559c30eb731c312ee0107f4b93b7d1@lizzy.crudebyte.com>)
 id 1ihNJK-0002tI-Vj
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Subject:Date:Cc:To:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=+r/2yfDYgXtCnULIR9c27voiJVbNVeG2bHfLUiZoQpA=; b=PF4Fz
 IH0wE+QYFZAL7754OTi9rQi34gt7SWsgzlfWz3HCc/rQaXrvu6d03RomhOxHvFk6pLjkpqGLnI5LC
 r53IXGnun2LwgneQlirIIVbBQM0YoUduNgl7e6Q+mPe+737Zpl2GqJUVPNma02H4T5XOhtAhvW9MC
 GObISVllxkhK1X2qrv+hC/MchyK1QviZ7WppYWunI+sZ19sJZi2qJn60EB9tS5R0U8+CbSc8MUSgT
 tYG0MXHj0xcrqbUEcZVjXs1cwoPTmBQmy4zOm3DM4sQruk7AbOBnoWsqqPpNHPXS0QAUn3janTe2N
 /KSzbm0S1QmLWlQjnyyctB6vp+CjQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Mon, 16 Dec 2019 00:33:17 +0100
Subject: [PATCH 3/9] hw/9pfs/9p-synth: added directory for readdir test
Message-Id: <E1ihMut-00077B-Bs@lizzy.crudebyte.com>
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

This will provide the following virtual directories by the 9p
synth backend:

  - /ReadDirDir/ReadDirFile99
  - /ReadDirDir/ReadDirFile98
  ...
  - /ReadDirDir/ReadDirFile1
  - /ReadDirDir/ReadDirFile0

These virtual directories will be used by the upcoming
9pfs READDIR tests.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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


