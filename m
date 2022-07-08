Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAC56BE2B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:31:47 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qtO-0007ri-MG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCa-0004qJ-8i
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCY-0002Rz-8x
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id n12so23903068pfq.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q073Mp4VcMDO3I3Vy8AI4TpHUeDs1rzP3KM+D2Dojc0=;
 b=fgKbjynVbMpZLRFnegJPE3DU229xWRdL/RcAZA3xZHUUrpy9bIyhxsExtYz95Wty6V
 k1wQXM40TezwxDwBleIGmj1IMqDUuz76zAviOLhY0mMyo4N5g+wtpNh7wxhho216Vodu
 b5hIW7HNDWvTiEg7rGBCdWEJIVF6hFVUamJNvawstYqUvpCaf3Cm0PHEvdmzGBDSck8E
 xFJZHtuRHToCEu1BK7PFgnUn49D8t0WaiKd87+I+jmJMHuy8KgVrRx9IhiwHvkxR6q9y
 P4Q400tSpzUJNw9mvZJCkVoKry1/Yhs+TZ6+Sx5Dmu8xRVzgzShP3EYP7HORZ4Ohr9Us
 uiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q073Mp4VcMDO3I3Vy8AI4TpHUeDs1rzP3KM+D2Dojc0=;
 b=OwsNQ+ARx91AVu+p4FWcbx1rLTWV+NGURQ06vlI/tM+X/srEy0F4oiWFEJTJ8VSlK0
 R5uwZMsjXWunW69nB5VYj5E6+gSYFrZOtcy+4fU64s7IlAnfKrRcUwZWtuJEixxYnuqt
 PSPPRZuPgSmYviV47JYxbXcdvZ8mIonzA8OOWho+4ENUinpMcfwoWJ5NkAU3K47MDVBa
 lAZOOpbclr1gYcM87lE84DX9UPeva9MZ1g9Lr8sNf0wkiE5blmRQzkoPTjEB2LVb4Odp
 Zo5KAAzLrKFNWMcwVVRxZcVLpo/w3anmZyYo1uWjMHwMbhw6djPwOKRA9Qiyb7sHLnlg
 2VhA==
X-Gm-Message-State: AJIora/caY20iDATAjL2Lp5hSDcnq0UZ9iatmPDl0EcpYQTe0VMf1bQg
 C47xYIG1g03HxcQGw7+LYnaOYQyBFulzahR+
X-Google-Smtp-Source: AGRyM1sc3OWUt5wzuqL+vIsTEiSb9rpjnX01UInnjEwf+D3HNcc2gGlnhmeRYcyZ3YuR2nxstFx8bA==
X-Received: by 2002:a63:e658:0:b0:40d:dfde:89f7 with SMTP id
 p24-20020a63e658000000b0040ddfde89f7mr3857658pgj.178.1657295248857; 
 Fri, 08 Jul 2022 08:47:28 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 07/29] Add enum RisuOp
Date: Fri,  8 Jul 2022 21:16:38 +0530
Message-Id: <20220708154700.18682-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Formalize the set of defines, plus -1, into an enum.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h         | 23 +++++++++++++++--------
 reginfo.c      | 32 +++++++++++++++++++-------------
 risu_aarch64.c |  6 +++---
 risu_arm.c     |  6 +++---
 risu_i386.c    |  4 ++--
 risu_m68k.c    |  4 ++--
 risu_ppc64.c   |  4 ++--
 7 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/risu.h b/risu.h
index e2b4508..a7aa929 100644
--- a/risu.h
+++ b/risu.h
@@ -45,11 +45,17 @@ extern uintptr_t image_start_address;
 extern void *memblock;
 
 /* Ops code under test can request from risu: */
-#define OP_COMPARE 0
-#define OP_TESTEND 1
-#define OP_SETMEMBLOCK 2
-#define OP_GETMEMBLOCK 3
-#define OP_COMPAREMEM 4
+typedef enum {
+    /* Any other sigill besides the destignated undefined insn.  */
+    OP_SIGILL = -1,
+
+    /* These are generated by the designated undefined insn. */
+    OP_COMPARE = 0,
+    OP_TESTEND = 1,
+    OP_SETMEMBLOCK = 2,
+    OP_GETMEMBLOCK = 3,
+    OP_COMPAREMEM = 4,
+} RisuOp;
 
 /* The memory block should be this long */
 #define MEMBLOCKLEN 8192
@@ -114,10 +120,11 @@ void set_ucontext_paramreg(void *vuc, uint64_t value);
 /* Return the value of the parameter register from a reginfo. */
 uint64_t get_reginfo_paramreg(struct reginfo *ri);
 
-/* Return the risu operation number we have been asked to do,
- * or -1 if this was a SIGILL for a non-risuop insn.
+/*
+ * Return the risu operation number we have been asked to do,
+ * or OP_SIGILL if this was a SIGILL for a non-risuop insn.
  */
-int get_risuop(struct reginfo *ri);
+RisuOp get_risuop(struct reginfo *ri);
 
 /* Return the PC from a reginfo */
 uintptr_t get_pc(struct reginfo *ri);
diff --git a/reginfo.c b/reginfo.c
index 1b2a821..2d67c93 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -11,7 +11,7 @@
 
 #include <stdio.h>
 #include <string.h>
-
+#include <stdlib.h>
 #include "risu.h"
 
 struct reginfo master_ri, apprentice_ri;
@@ -25,7 +25,7 @@ int send_register_info(write_fn write_fn, void *uc)
 {
     struct reginfo ri;
     trace_header_t header;
-    int op;
+    RisuOp op;
 
     reginfo_init(&ri, uc);
     op = get_risuop(&ri);
@@ -38,11 +38,18 @@ int send_register_info(write_fn write_fn, void *uc)
     }
 
     switch (op) {
+    case OP_COMPARE:
     case OP_TESTEND:
-        write_fn(&ri, reginfo_size());
-        /* if we are tracing write_fn will return 0 unlike a remote
-           end, hence we force return of 1 here */
-        return 1;
+    case OP_SIGILL:
+        /*
+         * Do a simple register compare on (a) explicit request
+         * (b) end of test (c) a non-risuop UNDEF
+         */
+        if (write_fn(&ri, reginfo_size()) != 0) {
+            return -1;
+        }
+        /* For OP_TEST_END, force return 1 to exit. */
+        return op == OP_TESTEND;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
         break;
@@ -53,12 +60,8 @@ int send_register_info(write_fn write_fn, void *uc)
     case OP_COMPAREMEM:
         return write_fn(memblock, MEMBLOCKLEN);
         break;
-    case OP_COMPARE:
     default:
-        /* Do a simple register compare on (a) explicit request
-         * (b) end of test (c) a non-risuop UNDEF
-         */
-        return write_fn(&ri, reginfo_size());
+        abort();
     }
     return 0;
 }
@@ -74,8 +77,9 @@ int send_register_info(write_fn write_fn, void *uc)
 int recv_and_compare_register_info(read_fn read_fn,
                                    respond_fn resp_fn, void *uc)
 {
-    int resp = 0, op;
+    int resp = 0;
     trace_header_t header;
+    RisuOp op;
 
     reginfo_init(&master_ri, uc);
     op = get_risuop(&master_ri);
@@ -97,7 +101,7 @@ int recv_and_compare_register_info(read_fn read_fn,
     switch (op) {
     case OP_COMPARE:
     case OP_TESTEND:
-    default:
+    case OP_SIGILL:
         /* Do a simple register compare on (a) explicit request
          * (b) end of test (c) a non-risuop UNDEF
          */
@@ -130,6 +134,8 @@ int recv_and_compare_register_info(read_fn read_fn,
         }
         resp_fn(resp);
         break;
+    default:
+        abort();
     }
 
     return resp;
diff --git a/risu_aarch64.c b/risu_aarch64.c
index 492d141..f8a8412 100644
--- a/risu_aarch64.c
+++ b/risu_aarch64.c
@@ -29,16 +29,16 @@ uint64_t get_reginfo_paramreg(struct reginfo *ri)
     return ri->regs[0];
 }
 
-int get_risuop(struct reginfo *ri)
+RisuOp get_risuop(struct reginfo *ri)
 {
     /* Return the risuop we have been asked to do
-     * (or -1 if this was a SIGILL for a non-risuop insn)
+     * (or OP_SIGILL if this was a SIGILL for a non-risuop insn)
      */
     uint32_t insn = ri->faulting_insn;
     uint32_t op = insn & 0xf;
     uint32_t key = insn & ~0xf;
     uint32_t risukey = 0x00005af0;
-    return (key != risukey) ? -1 : op;
+    return (key != risukey) ? OP_SIGILL : op;
 }
 
 uintptr_t get_pc(struct reginfo *ri)
diff --git a/risu_arm.c b/risu_arm.c
index 5fcb2a5..a20bf73 100644
--- a/risu_arm.c
+++ b/risu_arm.c
@@ -56,17 +56,17 @@ uint64_t get_reginfo_paramreg(struct reginfo *ri)
     return ri->gpreg[0];
 }
 
-int get_risuop(struct reginfo *ri)
+RisuOp get_risuop(struct reginfo *ri)
 {
     /* Return the risuop we have been asked to do
-     * (or -1 if this was a SIGILL for a non-risuop insn)
+     * (or OP_SIGILL if this was a SIGILL for a non-risuop insn)
      */
     uint32_t insn = ri->faulting_insn;
     int isz = ri->faulting_insn_size;
     uint32_t op = insn & 0xf;
     uint32_t key = insn & ~0xf;
     uint32_t risukey = (isz == 2) ? 0xdee0 : 0xe7fe5af0;
-    return (key != risukey) ? -1 : op;
+    return (key != risukey) ? OP_SIGILL : op;
 }
 
 uintptr_t get_pc(struct reginfo *ri)
diff --git a/risu_i386.c b/risu_i386.c
index 9962b8f..127e816 100644
--- a/risu_i386.c
+++ b/risu_i386.c
@@ -38,12 +38,12 @@ uint64_t get_reginfo_paramreg(struct reginfo *ri)
     return ri->gregs[REG_E(AX)];
 }
 
-int get_risuop(struct reginfo *ri)
+RisuOp get_risuop(struct reginfo *ri)
 {
     if ((ri->faulting_insn & 0xf8ffff) == 0xc0b90f) { /* UD1 %xxx,%eax */
         return (ri->faulting_insn >> 16) & 7;
     }
-    return -1;
+    return OP_SIGILL;
 }
 
 uintptr_t get_pc(struct reginfo *ri)
diff --git a/risu_m68k.c b/risu_m68k.c
index 1056eef..acdd57a 100644
--- a/risu_m68k.c
+++ b/risu_m68k.c
@@ -25,13 +25,13 @@ uint64_t get_reginfo_paramreg(struct reginfo *ri)
     return ri->gregs[R_A0];
 }
 
-int get_risuop(struct reginfo *ri)
+RisuOp get_risuop(struct reginfo *ri)
 {
     uint32_t insn = ri->faulting_insn;
     uint32_t op = insn & 0xf;
     uint32_t key = insn & ~0xf;
     uint32_t risukey = 0x4afc7000;
-    return (key != risukey) ? -1 : op;
+    return (key != risukey) ? OP_SIGILL : op;
 }
 
 uintptr_t get_pc(struct reginfo *ri)
diff --git a/risu_ppc64.c b/risu_ppc64.c
index a3028f7..9df8d58 100644
--- a/risu_ppc64.c
+++ b/risu_ppc64.c
@@ -32,13 +32,13 @@ uint64_t get_reginfo_paramreg(struct reginfo *ri)
     return ri->gregs[0];
 }
 
-int get_risuop(struct reginfo *ri)
+RisuOp get_risuop(struct reginfo *ri)
 {
     uint32_t insn = ri->faulting_insn;
     uint32_t op = insn & 0xf;
     uint32_t key = insn & ~0xf;
     uint32_t risukey = 0x00005af0;
-    return (key != risukey) ? -1 : op;
+    return (key != risukey) ? OP_SIGILL : op;
 }
 
 uintptr_t get_pc(struct reginfo *ri)
-- 
2.34.1


