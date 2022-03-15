Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6524D928B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:24:18 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwrB-0000PO-Qa
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:24:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnm-0004xj-K1
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:46 -0400
Received: from smtp121.iad3a.emailsrvr.com ([173.203.187.121]:51766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnk-0002gh-Vl
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:46 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp24.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id A63C3232DE; 
 Mon, 14 Mar 2022 22:20:43 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] util/osdep: Remove some early cruft
Date: Mon, 14 Mar 2022 21:20:25 -0500
Message-Id: <20220315022025.18908-4-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220315022025.18908-1-adeason@sinenomine.net>
References: <20220315022025.18908-1-adeason@sinenomine.net>
X-Classification-ID: dfe4ae03-7d50-4331-ad7e-e8686e56eaca-4-1
Received-SPF: pass client-ip=173.203.187.121;
 envelope-from=adeason@sinenomine.net; helo=smtp121.iad3a.emailsrvr.com
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

The include for statvfs.h has not been needed since all statvfs calls
were removed in commit 4a1418e07bdc ("Unbreak large mem support by
removing kqemu").

The comment mentioning CONFIG_BSD hasn't made sense since an include
for config-host.h was removed in commit aafd75841001 ("util: Clean up
includes").

Remove this cruft.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
 util/osdep.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 560ce9111a..ed932a0c7c 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -17,26 +17,20 @@
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 
-/* Needed early for CONFIG_BSD etc. */
-
-#ifdef CONFIG_SOLARIS
-#include <sys/statvfs.h>
-#endif
-
 #ifdef HAVE_MADVISE_MISSING_PROTOTYPE
 /* See MySQL bug #7156 (http://bugs.mysql.com/bug.php?id=7156) for
    discussion about Solaris header problems */
 extern int madvise(char *, size_t, int);
 #endif
 
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
-- 
2.11.0


