Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4444D9289
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:22:24 +0100 (CET)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwpH-0006Px-HF
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:22:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnl-0004xP-Ac
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:45 -0400
Received: from smtp123.iad3a.emailsrvr.com ([173.203.187.123]:58663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnj-0002gV-Gu
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:45 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp24.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id E3EDB21FC4; 
 Mon, 14 Mar 2022 22:20:41 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] util/osdep: Avoid madvise proto on modern Solaris
Date: Mon, 14 Mar 2022 21:20:23 -0500
Message-Id: <20220315022025.18908-2-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220315022025.18908-1-adeason@sinenomine.net>
References: <20220315022025.18908-1-adeason@sinenomine.net>
X-Classification-ID: dfe4ae03-7d50-4331-ad7e-e8686e56eaca-2-1
Received-SPF: pass client-ip=173.203.187.123;
 envelope-from=adeason@sinenomine.net; helo=smtp123.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On older Solaris releases, we didn't get a protype for madvise, and so
util/osdep.c provides its own prototype. Some time between the public
Solaris 11.4 release and Solaris 11.4.42 CBE, we started getting an
madvise prototype that looks like this:

    extern int madvise(void *, size_t, int);

which conflicts with the prototype in util/osdeps.c. Instead of always
declaring this prototype, check if we're missing the madvise()
prototype, and only declare it ourselves if the prototype is missing.

The 'missing_madvise_proto' meson check contains an obviously wrong
prototype for madvise. So if that code compiles and links, we must be
missing the actual prototype for madvise.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
To be clear, I'm okay with removing the prototype workaround
unconditionally; I'm just not sure if there's enough consensus on doing
that.

The "missing prototype" check is based on getting a compiler error on a
conflicting prototype, since this just seems more precise and certain
than getting an error from a missing prototype (needs
-Werror=missing-prototypes or -Werror). But I can do it the other way
around if needed.

Changes since v1:
- madvise prototype check changed to not be platforms-specific, and turned into
  CONFIG_MADVISE_MISSING_PROTOTYPE. 

 meson.build  | 17 +++++++++++++++--
 util/osdep.c |  3 +++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 2d6601467f..ff5fce693e 100644
--- a/meson.build
+++ b/meson.build
@@ -1705,25 +1705,38 @@ config_host_data.set('CONFIG_EVENTFD', cc.links('''
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
+  missing_madvise_proto = cc.links(gnu_source_prefix + '''
+    #include <sys/types.h>
+    #include <sys/mman.h>
+    #include <stddef.h>
+    extern int madvise(int);
+    int main(void) { return madvise(0); }''')
+endif
+config_host_data.set('CONFIG_MADVISE', has_madvise)
+config_host_data.set('CONFIG_MADVISE_MISSING_PROTOTYPE', missing_madvise_proto)
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
index 7c4deda6fe..560ce9111a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -21,20 +21,23 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 
 /* Needed early for CONFIG_BSD etc. */
 
 #ifdef CONFIG_SOLARIS
 #include <sys/statvfs.h>
+#endif
+
+#ifdef HAVE_MADVISE_MISSING_PROTOTYPE
 /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
    discussion about Solaris header problems */
 extern int madvise(char *, size_t, int);
 #endif
 
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
-- 
2.11.0


