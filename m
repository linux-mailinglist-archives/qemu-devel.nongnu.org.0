Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD724D88E4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:12:26 +0100 (CET)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnJ3-0001KS-Jx
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmuB-00079A-Q8
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:43 -0400
Received: from smtp82.ord1d.emailsrvr.com ([184.106.54.82]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTmu7-0007aE-Sg
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:42 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp11.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id AC41A6015B; 
 Mon, 14 Mar 2022 11:46:14 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] util/osdep: Avoid madvise proto on modern Solaris
Date: Mon, 14 Mar 2022 10:45:56 -0500
Message-Id: <20220314154557.306-2-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220314154557.306-1-adeason@sinenomine.net>
References: <20220314154557.306-1-adeason@sinenomine.net>
X-Classification-ID: 4af82b43-bb37-46e0-ae29-cb6bfb0f992e-2-1
Received-SPF: pass client-ip=184.106.54.82;
 envelope-from=adeason@sinenomine.net; helo=smtp82.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 12:09:06 -0400
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

Which conflicts with the prototype in util/osdeps.c. Instead of always
declaring this prototype, check if madvise() is already declared, so
we don't need to declare it ourselves.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
I'm not sure if a test is needed for this at all; that is, how much qemu
cares about earlier Solaris. The madvise prototype exists earlier in
Solaris 11 (I'm not sure when it started appearing usefully), but in
11.4 and earlier it was compatible with the char* prototype.

 meson.build  | 3 +++
 util/osdep.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 2d6601467f..c29d49c7a1 100644
--- a/meson.build
+++ b/meson.build
@@ -322,20 +322,23 @@ if targetos == 'windows'
                                       include_directories: include_directories('.'))
   host_dsosuf = '.dll'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
   host_dsosuf = '.dylib'
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
             cc.find_library('resolv')]
+  config_host_data.set('HAVE_MADVISE_PROTO',
+                       cc.has_function('madvise',
+                                       prefix: '#include <sys/mman.h>'))
 elif targetos == 'haiku'
   socket = [cc.find_library('posix_error_mapper'),
             cc.find_library('network'),
             cc.find_library('bsd')]
 elif targetos == 'openbsd'
   if get_option('tcg').allowed() and target_dirs.length() > 0
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
 endif
diff --git a/util/osdep.c b/util/osdep.c
index 7c4deda6fe..c99083372b 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -21,24 +21,26 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 
 /* Needed early for CONFIG_BSD etc. */
 
 #ifdef CONFIG_SOLARIS
 #include <sys/statvfs.h>
+#ifndef HAVE_MADVISE_PROTO
 /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
    discussion about Solaris header problems */
 extern int madvise(char *, size_t, int);
 #endif
+#endif
 
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


