Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6E343FBB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:29:32 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIkV-0002Qk-7i
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfv-0006kb-7f
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfs-0005Ih-WC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so11013870wma.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYln04rPdXP16oTRf4bLDfPYDelgruJglulvhLpq8Eg=;
 b=bbDcH2f46kqE7WSNJezMhVvj7Ur3xXCY+3u3SIzO1ihY7RZGSufFyBNUgmlDn9sLIS
 +X5U6PZ/yezmFuF519g21NEGrNXbuEu2wMdZpFfMsp+f/tSXGjRkwB4dDOhh8NtrRcbG
 caF+i5C2vPGDCIH3FzfWAys08xsLsw5VNdoQsEEqd0hKfrFcP76SrfcOlnIsX2f8RUxz
 vGMUnPQwUcKTIC5770uuPRjbvalpFu4tjJ6B87WrSbyOw2xZmRBEW3m3IBQTgEI7jxCy
 argmtXBxNp09JLDdxMbbk4jOsySlMG2ebOh4/+Cfi8IooYj6rc57YR5mH5sfHrAUedtD
 DBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RYln04rPdXP16oTRf4bLDfPYDelgruJglulvhLpq8Eg=;
 b=TC1FbCtRbZGr+ZvWR/NFcepBOtQjDvrFf8yuyE9BAvRk6ULB58th26ySfCUTnDBGSg
 0uGuvY1NLf+zFsBPmOukschJUy+vphoSoJRyS7rBxs7m/+V6/3rTjpHwT/3GRV7Mm65y
 QLgBF5ic1cE/aw549KQPuY6RF1GlCvwDvNghLJjQ6TVGRe34EiivAwDK6fW50XYZuutd
 JN15o27z+MD1BB6MvjecQrGuxaQfx+S9MTkozn78Qdk5tdOFa/46hoBOKryWWS8liFBE
 fTqdCoOUURqgkx+hnnc9ElCGWfZ+MD6zIIJ8AK1MvUK5vfKBZCC70Tsnm8t3RIoTQKR9
 4O8g==
X-Gm-Message-State: AOAM5331b03+xAY5vdDy5bCbPix4zAkMtJcCmxLQ5umT8sgif0hHzoL1
 uJOY4BgaVDtFzDSiiElj5KI2xs/fHcd8+g==
X-Google-Smtp-Source: ABdhPJwx6cIl43GRxETVCbDAdoaE9cQGm7qhdfZsL7MkQ14rwFgAEOtD9ndsIgLBgISerYpEqoy6vA==
X-Received: by 2002:a1c:3d8b:: with SMTP id k133mr15645394wma.6.1616412283397; 
 Mon, 22 Mar 2021 04:24:43 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u3sm19515610wrt.82.2021.03.22.04.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:24:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] exec: Build page-vary-common.c with -fno-lto
Date: Mon, 22 Mar 2021 12:24:26 +0100
Message-Id: <20210322112427.4045204-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322112427.4045204-1-f4bug@amsat.org>
References: <20210322112427.4045204-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In bbc17caf81f, we used an alias attribute to allow target_page
to be declared const, and yet be initialized late.

This fails when using LTO with several versions of gcc.
The compiler looks through the alias and decides that the const
variable is statically initialized to zero, then propagates that
zero to many uses of the variable.

This can be avoided by compiling one object file with -fno-lto.
In this way, any initializer cannot be seen, and the constant
propagation does not occur.

Since are certain to have this separate compilation unit, we can
drop the alias attribute as well.  We simply have differing
declarations for target_page in different compilation units.
Drop the use of init_target_page, and drop the configure detection
for CONFIG_ATTRIBUTE_ALIAS.

In order to change the compilation flags for a file with meson,
we must use a static_library.  This runs into specific_ss, where
we would need to create many static_library instances.

Fix this by splitting exec-page.c: the page-vary-common.c part is
compiled once as a static_library, while the page-vary.c part is
left in specific_ss in order to handle the target-specific value
of TARGET_PAGE_BITS_MIN.

Reported-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20210321211534.2101231-1-richard.henderson@linaro.org>
[PMD: Fix typo in subject, split original patch in 3]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure                | 19 ----------
 meson.build              | 15 ++++++++
 include/exec/cpu-all.h   |  4 --
 include/exec/page-vary.h |  5 +++
 page-vary-common.c       | 54 +++++++++++++++++++++++++++
 page-vary.c              | 79 +++-------------------------------------
 6 files changed, 80 insertions(+), 96 deletions(-)
 create mode 100644 page-vary-common.c

diff --git a/configure b/configure
index 847bc4d0957..dbb873e09cb 100755
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
index f0dd8aa0898..24e8897ba2c 100644
--- a/meson.build
+++ b/meson.build
@@ -1944,6 +1944,21 @@
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
index b0a422c7b62..d76b0b9e02d 100644
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
index 799d6310d6c..c22a7a742e7 100644
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
index 00000000000..91755564985
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
index 344f9fcf76a..057c7f18152 100644
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
-- 
2.26.2


