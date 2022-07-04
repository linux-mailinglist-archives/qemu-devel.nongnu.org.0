Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34FD5659D8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:29:25 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O0q-0007kl-O7
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nv4-0005Xb-8R
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nv1-0002Oc-NG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fta47YUlsilQV6ge0djhhSmzriViuvan5Fy4AELF3k=;
 b=bMf48K9CRuaMq03DZGn95P7P22CcU3+F0k1OVwZZHZZ3Bh8oClHv+3EVhDGdJcEW01uctC
 8+rFiRHlURv9zCVax0EbdvzYpXE0TtQIz0xt0puLXlqiXOfDin0GJnIZREYbW+NfQyDGnA
 GCbs8dYqZmc73IkUOA5ZsF1PpbavEf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-d0zuZbO7OuW1ZlOPXkYeQA-1; Mon, 04 Jul 2022 11:23:20 -0400
X-MC-Unique: d0zuZbO7OuW1ZlOPXkYeQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95F56801755;
 Mon,  4 Jul 2022 15:23:19 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDF12C28100;
 Mon,  4 Jul 2022 15:23:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 6/7] misc: ensure qemu/osdep.h is included in all .c files
Date: Mon,  4 Jul 2022 16:23:02 +0100
Message-Id: <20220704152303.760983-7-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
header. Another file didn't need it because it was actually an
included file, so ought to have been named .c.inc

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 bsd-user/arm/signal.c                 | 2 ++
 bsd-user/arm/target_arch_cpu.c        | 3 +++
 bsd-user/{elfcore.c => elfcore.c.inc} | 0
 bsd-user/elfload.c                    | 2 +-
 bsd-user/freebsd/os-sys.c             | 2 ++
 bsd-user/i386/signal.c                | 2 ++
 bsd-user/qemu.h                       | 1 -
 bsd-user/x86_64/signal.c              | 2 ++
 crypto/rsakey.c                       | 1 +
 qga/cutils.c                          | 2 ++
 10 files changed, 15 insertions(+), 2 deletions(-)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)

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
-- 
2.36.1


