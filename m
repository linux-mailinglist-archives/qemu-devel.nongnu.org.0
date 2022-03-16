Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50F4DA91D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 04:57:00 +0100 (CET)
Received: from localhost ([::1]:47780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUKmR-0000VP-W2
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 23:57:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKiy-0005Mk-7F
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:24 -0400
Received: from smtp126.ord1c.emailsrvr.com ([108.166.43.126]:34192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKiw-0005d7-Ks
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:23 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp8.relay.ord1c.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 573A4A00FF; 
 Tue, 15 Mar 2022 23:53:21 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] util/osdep: Remove some early cruft
Date: Tue, 15 Mar 2022 22:52:27 -0500
Message-Id: <20220316035227.3702-4-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220316035227.3702-1-adeason@sinenomine.net>
References: <20220316035227.3702-1-adeason@sinenomine.net>
X-Classification-ID: bed69193-96d2-4a39-a762-e06e17567ffe-4-1
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

The include for statvfs.h has not been needed since all statvfs calls
were removed in commit 4a1418e07bdc ("Unbreak large mem support by
removing kqemu").

The comment mentioning CONFIG_BSD hasn't made sense since an include
for config-host.h was removed in commit aafd75841001 ("util: Clean up
includes").

Remove this cruft.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
 util/osdep.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 1825399bcf..394804d32e 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -16,27 +16,20 @@
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-
-/* Needed early for CONFIG_BSD etc. */
-
-#ifdef CONFIG_SOLARIS
-#include <sys/statvfs.h>
-#endif
-
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
 #include "qemu/hw-version.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
-- 
2.11.0


