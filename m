Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663E346642
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:27:04 +0100 (CET)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOko3-0002oY-8y
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhT-00073D-RA
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:11 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhQ-0008RZ-LD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:11 -0400
Received: by mail-oi1-x233.google.com with SMTP id n140so17570137oig.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mSPjl/4/EKHW0h64VZT+YVO0G10BLyrXeHIIt+er56Y=;
 b=Y8c5jC3z0hcP3rlW2K8QqL+T2GUhWvqCkmbnKUAh6bHvNBooK8WevPV4iyuMo9lL0h
 uevp1TnU10RCtiBtdy0x8Pdv+cK/zioATBGzFUvMHmgnd23Jis+tZNFKInTJKal9gKQi
 xhSAl1Bf5B6OmxzTA0gXJuUrS1S6DrMX+CuHPqfzCaZi+TmJJIwjblVk/8ZTd4tG7fji
 W892OYfx7/qqHbalwLDfGRK5Vc6gwbmRae2qLUd6XGWqiU6rhSi0z5ecWr2Lzs67NHkW
 CLMEZiG3iBX/n0k1FpxIvR+Y53CIrKbaOWaanbsOAavmVt0dFMxKLpqBljbHW9WglZf6
 ohrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSPjl/4/EKHW0h64VZT+YVO0G10BLyrXeHIIt+er56Y=;
 b=GRTCCrCXbw+4vvjXEf6SVg4z4Yyx5dYGJMBhpbod1b9DDqpQmu50IqsUz2P9j9os+5
 /fS4qz89D2IsoppJPiDSnrvDAOfGRWJa5dee6c/TSlZruUmbPJoV9E77fU3IIrHTAlKF
 h/YkwDqel6cV306hnA56b9MnXA4W93ZMO5+xgaKh3TtoTV35z5VTtOTk5q7ggz4+6mbW
 Gg+STrRUrP/6bOIh6afAozB5LtYMb0abts9eB3xliubs+Ta/AYvUID9xhr91CRDKKYAs
 5tGM/3faBzmbvRSuaxNdIY5avEZM0x7g+0TAUm7tTCcsoOcY1Xz6Gmw3PBd2Yk0By5sb
 2XQw==
X-Gm-Message-State: AOAM530i52VaCrebmz55dehV1WGnLyZe13VPBcNsgTGt7V+tkohzvhXh
 B2TS89aSn8B2r7nNeJW1xhIUUg/Lrf94oPZJ
X-Google-Smtp-Source: ABdhPJzD0X5gb4N3V+VJSEeh2UrHUVwkQeLNA1kNRKjOR4k5kNeOxLXvVb9PN+6G7+FxjUZ8EgADqQ==
X-Received: by 2002:aca:1b01:: with SMTP id b1mr3738626oib.177.1616516167455; 
 Tue, 23 Mar 2021 09:16:07 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 8sm4317822otx.1.2021.03.23.09.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:16:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] exec: Build page-vary-common.c with -fno-lto
Date: Tue, 23 Mar 2021 10:16:01 -0600
Message-Id: <20210323161601.454996-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323161601.454996-1-richard.henderson@linaro.org>
References: <20210323161601.454996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, gshan@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In bbc17caf81f, we used an alias attribute to allow target_page
to be declared const, and yet be initialized late.

This fails when using LTO with several versions of gcc.
The compiler looks through the alias and decides that the const
variable is statically initialized to zero, then propagates that
zero to many uses of the variable.

This can be avoided by compiling one object file with -fno-lto.
In this way, any initializer cannot be seen, and the constant
propagation does not occur.

Since we are certain to have this separate compilation unit, we
can drop the alias attribute as well.  We simply have differing
declarations for target_page in different compilation units.
Drop the use of init_target_page, and drop the configure detection
for CONFIG_ATTRIBUTE_ALIAS.

In order to change the compilation flags for a file with meson,
we must use a static_library.  This runs into specific_ss, where
we would need to create many static_library instances.

Fix this by splitting page-vary.c: the page-vary-common.c part is
compiled once as a static_library, while the page-vary.c part is
left in specific_ss in order to handle the target-specific value
of TARGET_PAGE_BITS_MIN.

Reported-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210321211534.2101231-1-richard.henderson@linaro.org>
[PMD: Fix typo in subject, split original patch in 3]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20210322112427.4045204-4-f4bug@amsat.org>
[rth: Update MAINTAINERS]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                | 19 ----------
 meson.build              | 15 ++++++++
 include/exec/cpu-all.h   |  4 --
 include/exec/page-vary.h |  5 +++
 page-vary-common.c       | 54 +++++++++++++++++++++++++++
 page-vary.c              | 79 +++-------------------------------------
 MAINTAINERS              |  1 +
 7 files changed, 81 insertions(+), 96 deletions(-)
 create mode 100644 page-vary-common.c

diff --git a/configure b/configure
index 61872096a8..edf9dc8985 100755
--- a/configure
+++ b/configure
@@ -4889,21 +4889,6 @@ if  test "$plugins" = "yes" &&
       "for this purpose. You can't build with --static."
 fi
 
-########################################
-# See if __attribute__((alias)) is supported.
-# This false for Xcode 9, but has been remedied for Xcode 10.
-# Unfortunately, travis uses Xcode 9 by default.
-
-attralias=no
-cat > $TMPC << EOF
-int x = 1;
-extern const int y __attribute__((alias("x")));
-int main(void) { return 0; }
-EOF
-if compile_prog "" "" ; then
-    attralias=yes
-fi
-
 ########################################
 # check if getauxval is available.
 
@@ -5935,10 +5920,6 @@ if test "$atomic64" = "yes" ; then
   echo "CONFIG_ATOMIC64=y" >> $config_host_mak
 fi
 
-if test "$attralias" = "yes" ; then
-  echo "CONFIG_ATTRIBUTE_ALIAS=y" >> $config_host_mak
-fi
-
 if test "$getauxval" = "yes" ; then
   echo "CONFIG_GETAUXVAL=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index f0dd8aa089..24e8897ba2 100644
--- a/meson.build
+++ b/meson.build
@@ -1944,6 +1944,21 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
+# Work around a gcc bug/misfeature wherein constant propagation looks
+# through an alias:
+#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
+# to guess that a const variable is always zero.  Without lto, this is
+# impossible, as the alias is restricted to page-vary-common.c.  Indeed,
+# without lto, not even the alias is required -- we simply use different
+# declarations in different compilation units.
+pagevary = files('page-vary-common.c')
+if get_option('b_lto')
+  pagevary = static_library('page-vary-common',
+                            sources: pagevary,
+                            c_args: ['-fno-lto'])
+  pagevary = declare_dependency(link_with: pagevary)
+endif
+common_ss.add(pagevary)
 specific_ss.add(files('page-vary.c'))
 
 subdir('backends')
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index b0a422c7b6..d76b0b9e02 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -216,11 +216,7 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 
 #ifdef TARGET_PAGE_BITS_VARY
 # include "exec/page-vary.h"
-#if defined(CONFIG_ATTRIBUTE_ALIAS) || !defined(IN_EXEC_VARY)
 extern const TargetPageBits target_page;
-#else
-extern TargetPageBits target_page;
-#endif
 #ifdef CONFIG_DEBUG_TCG
 #define TARGET_PAGE_BITS   ({ assert(target_page.decided); target_page.bits; })
 #define TARGET_PAGE_MASK   ({ assert(target_page.decided); \
diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
index 799d6310d6..c22a7a742e 100644
--- a/include/exec/page-vary.h
+++ b/include/exec/page-vary.h
@@ -26,4 +26,9 @@ typedef struct {
     uint64_t mask;
 } TargetPageBits;
 
+#ifdef IN_PAGE_VARY
+extern bool set_preferred_target_page_bits_common(int bits);
+extern void finalize_target_page_bits_common(int min);
+#endif
+
 #endif /* EXEC_PAGE_VARY_H */
diff --git a/page-vary-common.c b/page-vary-common.c
new file mode 100644
index 0000000000..9175556498
--- /dev/null
+++ b/page-vary-common.c
@@ -0,0 +1,54 @@
+/*
+ * Variable page size handling -- target independent part.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define IN_PAGE_VARY 1
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/page-vary.h"
+
+/* WARNING: This file must *not* be complied with -flto. */
+
+TargetPageBits target_page;
+
+bool set_preferred_target_page_bits_common(int bits)
+{
+    /*
+     * The target page size is the lowest common denominator for all
+     * the CPUs in the system, so we can only make it smaller, never
+     * larger. And we can't make it smaller once we've committed to
+     * a particular size.
+     */
+    if (target_page.bits == 0 || target_page.bits > bits) {
+        if (target_page.decided) {
+            return false;
+        }
+        target_page.bits = bits;
+    }
+    return true;
+}
+
+void finalize_target_page_bits_common(int min)
+{
+    if (target_page.bits == 0) {
+        target_page.bits = min;
+    }
+    target_page.mask = -1ull << target_page.bits;
+    target_page.decided = true;
+}
diff --git a/page-vary.c b/page-vary.c
index 344f9fcf76..057c7f1815 100644
--- a/page-vary.c
+++ b/page-vary.c
@@ -17,92 +17,25 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#define IN_PAGE_VARY 1
+
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-
-#define IN_EXEC_VARY 1
-
 #include "exec/exec-all.h"
 
-#ifdef TARGET_PAGE_BITS_VARY
-# ifdef CONFIG_ATTRIBUTE_ALIAS
-/*
- * We want to declare the "target_page" variable as const, which tells
- * the compiler that it can cache any value that it reads across calls.
- * This avoids multiple assertions and multiple reads within any one user.
- *
- * This works because we finish initializing the data before we ever read
- * from the "target_page" symbol.
- *
- * This also requires that we have a non-constant symbol by which we can
- * perform the actual initialization, and which forces the data to be
- * allocated within writable memory.  Thus "init_target_page", and we use
- * that symbol exclusively in the two functions that initialize this value.
- *
- * The "target_page" symbol is created as an alias of "init_target_page".
- */
-static TargetPageBits init_target_page;
-
-/*
- * Note that this is *not* a redundant decl, this is the definition of
- * the "target_page" symbol.  The syntax for this definition requires
- * the use of the extern keyword.  This seems to be a GCC bug in
- * either the syntax for the alias attribute or in -Wredundant-decls.
- *
- * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91765
- */
-#  pragma GCC diagnostic push
-#  pragma GCC diagnostic ignored "-Wredundant-decls"
-
-extern const TargetPageBits target_page
-    __attribute__((alias("init_target_page")));
-
-#  pragma GCC diagnostic pop
-# else
-/*
- * When aliases are not supported then we force two different declarations,
- * by way of suppressing the header declaration with IN_EXEC_VARY.
- * We assume that on such an old compiler, LTO cannot be used, and so the
- * compiler cannot not detect the mismatched declarations, and all is well.
- */
-TargetPageBits target_page;
-#  define init_target_page target_page
-# endif
-#endif
-
 bool set_preferred_target_page_bits(int bits)
 {
-    /*
-     * The target page size is the lowest common denominator for all
-     * the CPUs in the system, so we can only make it smaller, never
-     * larger. And we can't make it smaller once we've committed to
-     * a particular size.
-     */
 #ifdef TARGET_PAGE_BITS_VARY
     assert(bits >= TARGET_PAGE_BITS_MIN);
-    if (init_target_page.bits == 0 || init_target_page.bits > bits) {
-        if (init_target_page.decided) {
-            return false;
-        }
-        init_target_page.bits = bits;
-    }
-#endif
+    return set_preferred_target_page_bits_common(bits);
+#else
     return true;
+#endif
 }
 
 void finalize_target_page_bits(void)
 {
 #ifdef TARGET_PAGE_BITS_VARY
-    if (init_target_page.bits == 0) {
-        init_target_page.bits = TARGET_PAGE_BITS_MIN;
-    }
-    init_target_page.mask = (target_long)-1 << init_target_page.bits;
-    init_target_page.decided = true;
-
-    /*
-     * For the benefit of an -flto build, prevent the compiler from
-     * hoisting a read from target_page before we finish initializing.
-     */
-    barrier();
+    finalize_target_page_bits_common(TARGET_PAGE_BITS_MIN);
 #endif
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index ed68de3cec..10ed6d7624 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -118,6 +118,7 @@ S: Maintained
 F: softmmu/cpus.c
 F: cpus-common.c
 F: page-vary.c
+F: page-vary-common.c
 F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
-- 
2.25.1


