Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C239236E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:55:24 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Mx-0003O4-Ml
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FI-0005br-2h
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F7-0004Rx-5q
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so4456111pjr.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcCXa7GKI4W/d3/jlaSrG0mCq3KpdgKzNszQYbsDFeI=;
 b=QFsGZAO3YYJWh5kh9+psjXK7Io4S8d/t1TEkXOHidtNQPQK0Zr0RGZ2UdSEO8wzv21
 yzOAaPQfS9gSGb9pdfNQOqR1U/A+FSRdXKx92L6uVvZGszh/C/pGmESZ3iEYfUfWuTze
 IYS4dqu63fivPzjFQ91jhxRU8bas+bFagzlyUGMBQ8blwRQ7A+Gk79QyD0Y5fiXiD3J8
 y7CBBsojMjTZa+JQAU8bk+DyK3YnldqNzjpDJQBL5uFgxFru8lFs/+gO4leYZLlRdiwT
 2aAyvIWsx0gdwixR9DhhHExjXJ5wlMq0a/GO4Yuf2KzeY8gcmIal7dAk5z06sFM41zwD
 o5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcCXa7GKI4W/d3/jlaSrG0mCq3KpdgKzNszQYbsDFeI=;
 b=jPMkVjfUUPTxCD1OfcWvQ/qxCzZ+YB1ZzngPHo9nZclbd53qjkeiGFw1apjow8XKUZ
 4adLjdxILatP8/DdIrF57zgE57sPmAfzdekO1GcdpczkkC+vVm2/JdnEJN0O0chsBcXq
 4LQ6151rm2WjPUm95obI7FHJ3xj3EJSzJ2KKCJJbYYSOZYw703ZnT/0glNb5a/TMiULM
 xnW83pJczVyQU+Ol0ZqPp30EIcGRcxRJ0RtKx86FK8WCcHiZb/KoduAX+IiRWyZMWEbi
 cTtGu1M79RZ21VCKNhaD/a92ImxBUX1xBnh9u7ELIcLTaIuXYgXa6QjNgpuZrZ5kPFhX
 ed3A==
X-Gm-Message-State: AOAM5339GkK6Nsr4CcnTxpZJSYOQcXLeDYxH8K+7YB8HXrsd0B4hXc+5
 teDdwPZEJaite4IgMSdPZhi3cCrfi6fSIw==
X-Google-Smtp-Source: ABdhPJyd9xLiIHaLsJVmX7FUGsNgBJfEBuncNRUzEupbUXmiJQlhQg4MdGdHNp0fmQmpU9HyykNyDA==
X-Received: by 2002:a17:90b:70c:: with SMTP id s12mr692672pjz.98.1622072835834; 
 Wed, 26 May 2021 16:47:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] exec/memory_ldst: Use correct type sizes
Date: Wed, 26 May 2021 16:46:42 -0700
Message-Id: <20210526234710.125396-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use uint8_t for (unsigned) byte, and uint16_t for (unsigned)
16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-4-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory_ldst.h.inc | 16 ++++++++--------
 memory_ldst.c.inc              | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 46e6c220d3..7c3a641f7e 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -20,7 +20,7 @@
  */
 
 #ifdef TARGET_ENDIANNESS
-extern uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -29,17 +29,17 @@ extern uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
 extern void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 #else
-extern uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+extern uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -50,11 +50,11 @@ extern uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
 extern uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index b56e961967..84b868f294 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -157,7 +157,7 @@ uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
                                                     DEVICE_BIG_ENDIAN);
 }
 
-uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
@@ -193,7 +193,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
 }
 
 /* warning: addr must be aligned */
-static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
+static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
     enum device_endian endian)
 {
@@ -240,21 +240,21 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     return val;
 }
 
-uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_NATIVE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_LITTLE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
@@ -366,7 +366,7 @@ void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -398,7 +398,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
 
 /* warning: addr must be aligned */
 static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs,
+    hwaddr addr, uint16_t val, MemTxAttrs attrs,
     MemTxResult *result, enum device_endian endian)
 {
     uint8_t *ptr;
@@ -441,21 +441,21 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_NATIVE_ENDIAN);
 }
 
 void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_LITTLE_ENDIAN);
 }
 
 void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                DEVICE_BIG_ENDIAN);
-- 
2.25.1


