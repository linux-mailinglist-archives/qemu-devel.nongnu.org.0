Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0156A890
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:49:46 +0200 (CEST)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UhF-0005Os-LJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UW1-0008TX-0T
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVs-0006pj-SG
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07uLczDlambja7CzBYzFBorf8YjPmc4em0jNKKJjDkA=;
 b=MMD9I0wytWK0eUyyRBhG6MDg9rTshbPgmO/OwEd+OYiovmJonNsKmcIUCPnEvIEY6pVrUi
 jmz0CICq+pAXR730gerVAG85kpkuPyKPW1zUgOrvkMh0wkVS4MGk+DaGuZsef/aAVIVypU
 RyNTqA2JjekA4ofuOhTtDDx6blczjZs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-WS43NHp8PtSMAj8Jwx_Hbw-1; Thu, 07 Jul 2022 12:37:55 -0400
X-MC-Unique: WS43NHp8PtSMAj8Jwx_Hbw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ABDD940490;
 Thu,  7 Jul 2022 16:37:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF19E492C3B;
 Thu,  7 Jul 2022 16:37:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 6/9] misc: ensure qemu/osdep.h is included first in all .c
 files
Date: Thu,  7 Jul 2022 17:37:17 +0100
Message-Id: <20220707163720.1421716-7-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A few files relied on qemu/osdep.h being included via a common
header. Others didn't need it because they were actually an
included file, so ought to have been named '.c.inc'. Finally
some didn't have it as the first header included.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 backends/hostmem-epc.c                                        | 4 +++-
 block/export/vduse-blk.c                                      | 3 ++-
 bsd-user/arm/signal.c                                         | 2 ++
 bsd-user/arm/target_arch_cpu.c                                | 3 +++
 bsd-user/{elfcore.c => elfcore.c.inc}                         | 0
 bsd-user/elfload.c                                            | 2 +-
 bsd-user/freebsd/os-sys.c                                     | 2 ++
 bsd-user/i386/signal.c                                        | 2 ++
 bsd-user/i386/target_arch_cpu.c                               | 3 ++-
 bsd-user/main.c                                               | 3 ++-
 bsd-user/qemu.h                                               | 1 -
 bsd-user/x86_64/signal.c                                      | 2 ++
 bsd-user/x86_64/target_arch_cpu.c                             | 3 ++-
 crypto/rsakey.c                                               | 1 +
 hw/hyperv/syndbg.c                                            | 2 +-
 qga/cutils.c                                                  | 2 ++
 ...-enc-hextile-template.h => vnc-enc-hextile-template.c.inc} | 0
 ui/vnc-enc-hextile.c                                          | 4 ++--
 ui/vnc-enc-zrle.c.inc                                         | 2 +-
 ...nc-enc-zywrle-template.c => vnc-enc-zywrle-template.c.inc} | 0
 util/mmap-alloc.c                                             | 3 ++-
 21 files changed, 32 insertions(+), 12 deletions(-)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)
 rename ui/{vnc-enc-hextile-template.h => vnc-enc-hextile-template.c.inc} (100%)
 rename ui/{vnc-enc-zywrle-template.c => vnc-enc-zywrle-template.c.inc} (100%)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 037292d267..d88da98119 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -9,9 +9,11 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include <sys/ioctl.h>
 
 #include "qemu/osdep.h"
+
+#include <sys/ioctl.h>
+
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index f101c24c3f..c251210251 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -10,9 +10,10 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
+
 #include <sys/eventfd.h>
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "block/export.h"
 #include "qemu/error-report.h"
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 2b1dd745d1..eca20ac4d7 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -17,6 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
index 02bf9149d5..186cf43fb9 100644
--- a/bsd-user/arm/target_arch_cpu.c
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -16,6 +16,9 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#include "qemu/osdep.h"
+
 #include "target_arch.h"
 
 void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c.inc
similarity index 100%
rename from bsd-user/elfcore.c
rename to bsd-user/elfcore.c.inc
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index f8edb22f2a..1717a454dc 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -121,7 +121,7 @@ static void bswap_note(struct elf_note *en) { }
 
 #endif /* ! BSWAP_NEEDED */
 
-#include "elfcore.c"
+#include "elfcore.c.inc"
 
 /*
  * 'copy_elf_strings()' copies argument/envelope strings from user
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 309e27b9d6..1eab1be6f6 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -17,6 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index 5dd975ce56..db5b774213 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -17,6 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index d349e45299..bbe237f178 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -17,9 +17,10 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include <sys/types.h>
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d65..042afd0693 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -18,12 +18,13 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include <sys/types.h>
 #include <sys/time.h>
 #include <sys/resource.h>
 #include <sys/sysctl.h>
 
-#include "qemu/osdep.h"
 #include "qemu/help-texts.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index be6105385e..0ceecfb6df 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,7 +17,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index c3875bc4c6..217f9ceb66 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -16,6 +16,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index be7bd10720..e4746c7efe 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -17,9 +17,10 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
+
 #include <sys/types.h>
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu.h"
 #include "qemu/timer.h"
diff --git a/crypto/rsakey.c b/crypto/rsakey.c
index cc40e072f0..dcdbd9ec57 100644
--- a/crypto/rsakey.c
+++ b/crypto/rsakey.c
@@ -19,6 +19,7 @@
  *
  */
 
+#include "qemu/osdep.h"
 #include "rsakey.h"
 
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index 16d04cfdc6..94fe1b534b 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -5,8 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "qemu/ctype.h"
 #include "qemu/osdep.h"
+#include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
diff --git a/qga/cutils.c b/qga/cutils.c
index b8e142ef64..c53dd418c7 100644
--- a/qga/cutils.c
+++ b/qga/cutils.c
@@ -2,6 +2,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
+
+#include "qemu/osdep.h"
 #include "cutils.h"
 
 #include "qapi/error.h"
diff --git a/ui/vnc-enc-hextile-template.h b/ui/vnc-enc-hextile-template.c.inc
similarity index 100%
rename from ui/vnc-enc-hextile-template.h
rename to ui/vnc-enc-hextile-template.c.inc
diff --git a/ui/vnc-enc-hextile.c b/ui/vnc-enc-hextile.c
index 4215bd7daf..c8fee1e2f6 100644
--- a/ui/vnc-enc-hextile.c
+++ b/ui/vnc-enc-hextile.c
@@ -34,12 +34,12 @@ static void hextile_enc_cord(uint8_t *ptr, int x, int y, int w, int h)
 }
 
 #define BPP 32
-#include "vnc-enc-hextile-template.h"
+#include "vnc-enc-hextile-template.c.inc"
 #undef BPP
 
 #define GENERIC
 #define BPP 32
-#include "vnc-enc-hextile-template.h"
+#include "vnc-enc-hextile-template.c.inc"
 #undef BPP
 #undef GENERIC
 
diff --git a/ui/vnc-enc-zrle.c.inc b/ui/vnc-enc-zrle.c.inc
index c107d8affc..b7484aef00 100644
--- a/ui/vnc-enc-zrle.c.inc
+++ b/ui/vnc-enc-zrle.c.inc
@@ -66,7 +66,7 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
                              int zywrle_level);
 
 #if ZRLE_BPP != 8
-#include "vnc-enc-zywrle-template.c"
+#include "vnc-enc-zywrle-template.c.inc"
 #endif
 
 
diff --git a/ui/vnc-enc-zywrle-template.c b/ui/vnc-enc-zywrle-template.c.inc
similarity index 100%
rename from ui/vnc-enc-zywrle-template.c
rename to ui/vnc-enc-zywrle-template.c.inc
diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 5b90cb68ea..6c6a58da7f 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -10,6 +10,8 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
+
 #ifdef CONFIG_LINUX
 #include <linux/mman.h>
 #else  /* !CONFIG_LINUX */
@@ -17,7 +19,6 @@
 #define MAP_SHARED_VALIDATE   0x0
 #endif /* CONFIG_LINUX */
 
-#include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
 #include "qemu/cutils.h"
-- 
2.36.1


