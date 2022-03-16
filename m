Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433C4DA91C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 04:56:28 +0100 (CET)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUKlu-0007Zv-LD
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 23:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKim-0004rb-Dn
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:12 -0400
Received: from smtp126.ord1c.emailsrvr.com ([108.166.43.126]:60914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKik-0005ax-G2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:12 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp8.relay.ord1c.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 38F5EA00E4; 
 Tue, 15 Mar 2022 23:53:09 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] util/osdep: Avoid madvise proto on modern Solaris
Date: Tue, 15 Mar 2022 22:52:25 -0500
Message-Id: <20220316035227.3702-2-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220316035227.3702-1-adeason@sinenomine.net>
References: <20220316035227.3702-1-adeason@sinenomine.net>
X-Classification-ID: bed69193-96d2-4a39-a762-e06e17567ffe-2-1
Received-SPF: pass client-ip=108.166.43.126;
 envelope-from=adeason@sinenomine.net; helo=smtp126.ord1c.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Deason <adeason@sinenomine.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On older Solaris releases (before Solaris 11), we didn't get a
prototype for madvise, and so util/osdep.c provides its own prototype.
Some time between the public Solaris 11.4 release and Solaris 11.4.42
CBE, we started getting an madvise prototype that looks like this:

    extern int madvise(void *, size_t, int);

which conflicts with the prototype in util/osdeps.c. Instead of always
declaring this prototype, check if we're missing the madvise()
prototype, and only declare it ourselves if the prototype is missing.
Move the prototype to include/qemu/osdep.h, the normal place to handle
platform-specific header quirks.

The 'missing_madvise_proto' meson check contains an obviously wrong
prototype for madvise. So if that code compiles and links, we must be
missing the actual prototype for madvise.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
Changes since v2:
- Rename new symbol to HAVE_MADVISE_WITHOUT_PROTOTYPE
- Move madvise prototype to include/qemu/osdep.h
- More comments in meson.build

Changes since v1:
- madvise prototype check changed to not be platforms-specific, and turned into
  CONFIG_MADVISE_MISSING_PROTOTYPE.

 include/qemu/osdep.h |  8 ++++++++
 meson.build          | 23 +++++++++++++++++++++--
 util/osdep.c         |  3 ---
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 322103aadb..f2274b24cb 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -393,20 +393,28 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 
 #if defined(__linux__) || defined(__FreeBSD__) ||               \
     defined(__FreeBSD_kernel__) || defined(__DragonFly__)
 #define HAVE_CHARDEV_PARPORT 1
 #endif
 
 #if defined(__HAIKU__)
 #define SIGIO SIGPOLL
 #endif
 
+#ifdef HAVE_MADVISE_WITHOUT_PROTOTYPE
+/*
+ * See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for discussion
+ * about Solaris missing the madvise() prototype.
+ */
+extern int madvise(char *, size_t, int);
+#endif
+
 #if defined(CONFIG_LINUX)
 #ifndef BUS_MCEERR_AR
 #define BUS_MCEERR_AR 4
 #endif
 #ifndef BUS_MCEERR_AO
 #define BUS_MCEERR_AO 5
 #endif
 #endif
 
 #if defined(__linux__) && \
diff --git a/meson.build b/meson.build
index bae62efc9c..282e7c4650 100644
--- a/meson.build
+++ b/meson.build
@@ -1708,25 +1708,44 @@ config_host_data.set('CONFIG_EVENTFD', cc.links('''
   int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
 config_host_data.set('CONFIG_FDATASYNC', cc.links(gnu_source_prefix + '''
   #include <unistd.h>
   int main(void) {
   #if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
   return fdatasync(0);
   #else
   #error Not supported
   #endif
   }'''))
-config_host_data.set('CONFIG_MADVISE', cc.links(gnu_source_prefix + '''
+
+has_madvise = cc.links(gnu_source_prefix + '''
   #include <sys/types.h>
   #include <sys/mman.h>
   #include <stddef.h>
-  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }'''))
+  int main(void) { return madvise(NULL, 0, MADV_DONTNEED); }''')
+missing_madvise_proto = false
+if has_madvise
+  # Some platforms (illumos and Solaris before Solaris 11) provide madvise()
+  # but forget to prototype it. In this case, has_madvise will be true (the
+  # test program links despite a compile warning). To detect the
+  # missing-prototype case, we try again with a definitely-bogus prototype.
+  # This will only compile if the system headers don't provide the prototype;
+  # otherwise the conflicting prototypes will cause a compiler error.
+  missing_madvise_proto = cc.links(gnu_source_prefix + '''
+    #include <sys/types.h>
+    #include <sys/mman.h>
+    #include <stddef.h>
+    extern int madvise(int);
+    int main(void) { return madvise(0); }''')
+endif
+config_host_data.set('CONFIG_MADVISE', has_madvise)
+config_host_data.set('HAVE_MADVISE_WITHOUT_PROTOTYPE', missing_madvise_proto)
+
 config_host_data.set('CONFIG_MEMFD', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }'''))
 config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix + '''
   #include <fcntl.h>
   #if !defined(AT_EMPTY_PATH)
   # error missing definition
   #else
   int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
   #endif'''))
diff --git a/util/osdep.c b/util/osdep.c
index 7c4deda6fe..1825399bcf 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -21,23 +21,20 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 
 /* Needed early for CONFIG_BSD etc. */
 
 #ifdef CONFIG_SOLARIS
 #include <sys/statvfs.h>
-/* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
-   discussion about Solaris header problems */
-extern int madvise(char *, size_t, int);
 #endif
 
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
 #include "qemu/hw-version.h"
 #include "monitor/monitor.h"
-- 
2.11.0


