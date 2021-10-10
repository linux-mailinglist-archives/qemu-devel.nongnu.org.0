Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4934282D4
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 19:54:20 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZd1f-0006PN-4H
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 13:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrw-0000U0-0b
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZcrt-0005pr-Sv
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 13:44:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id r201so8619306pgr.4
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OA5lVsCVexffj4tJ1okwj2NEN/znxpIAZbVY6q21rhk=;
 b=yLhsQCd3YmmYfayNnkAeAZUSSqnntpP+6pSpKb1VFfSA6qGFG0d0JftU4Nir+ZUxn/
 oPuqPfsNTERSbxFh13LviYPLwLCbteVmP4YQ+kbp1dEKG0AxArn33bKVgD9ta3M/7CWh
 +xmfX7KJf0wN1PyCS6VlBzqSM3PGnAfoZ6z0eAXlr2SFx+fsaNKH4ZeXk6cURhdAeNt0
 fIC2jkKyzNAPyrOID0WuqzsaoAuxUh87njofjU7fgKnjZpLVVMk1/znlLyBlzjcYEdSm
 YQ9FIuDpN4jO6qgGh7ruo7cUdi5nPyf9e1un1hm4c7zvoZpt2jEbSxfpED/XIc472rIQ
 slMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OA5lVsCVexffj4tJ1okwj2NEN/znxpIAZbVY6q21rhk=;
 b=JtsdRnkM10x5RVGzuRjTjmRB+2h/NruL/WB0xFr0x9BINCQeiXXGhcujd091cZy8P9
 I81TgcIDiESeZyRh7MC5D4x91Vv29JlvDfdQJ9F4XtaQzKBwDMYWacjgGyJspxSj++3q
 rhwCiRYXxWEqw97w4vGLHa3I2PuWZt4ebZJSzvZeflTepblnwyVpxAyB9Bs1F/tcoMC2
 fVYLtHGpYUKGuSHyTcQhzdw7UKVDyy+WhPEA+O94V2Y4k+eQNV8LOUEz59LqB2YAIgu4
 hqO4Il7F4JIotgBjMwGwiEQYvE+mkiY+ZWlK8eyiGgzDYtFTvCyceCiQY41A5l4C1zlN
 k6iQ==
X-Gm-Message-State: AOAM533MaVr3uFv5dCpmDacAkmSvUrjQkkzP5CRQSHfU7enDX3olmXZf
 QqAgb+SXkSJ0SALbRdaNcFKCzr7hDGjaedp6
X-Google-Smtp-Source: ABdhPJxCTpfU7IxxMd4oxdDLQIu7KQw7Ub2pHrXMNHrMdyjTp+0T9VLtigQpPhBnZh+UbsPK6bKoog==
X-Received: by 2002:a62:6206:0:b0:44c:bc1f:aa5a with SMTP id
 w6-20020a626206000000b0044cbc1faa5amr20852668pfb.5.1633887852598; 
 Sun, 10 Oct 2021 10:44:12 -0700 (PDT)
Received: from localhost.localdomain (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 18sm5095391pfh.115.2021.10.10.10.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 10:44:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] accel/tcg: Add guest_base_signed_addr32 for user-only
Date: Sun, 10 Oct 2021 10:43:57 -0700
Message-Id: <20211010174401.141339-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211010174401.141339-1-richard.henderson@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the host may prefer to treat 32-bit addresses as signed,
there are edge cases of guests that cannot be implemented with
addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.

Therefore, default to guest_base_signed_addr32 false, and allow
probe_guest_base to determine whether it is possible to set it
to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
have to cope with either setting for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h  | 16 ++++++++++++++++
 include/exec/cpu_ldst.h |  3 ++-
 bsd-user/main.c         |  4 ++++
 linux-user/main.c       |  3 +++
 4 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 32cfb634c6..80b5e17329 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -146,6 +146,7 @@ static inline void tswap64s(uint64_t *s)
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
+#include "tcg-target-sa32.h"
 
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
@@ -154,6 +155,21 @@ extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
+#if TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32
+extern bool guest_base_signed_addr32;
+#else
+#define guest_base_signed_addr32  false
+#endif
+
+static inline void set_guest_base_signed_addr32(void)
+{
+#ifdef guest_base_signed_addr32
+    qemu_build_not_reached();
+#else
+    guest_base_signed_addr32 = true;
+#endif
+}
+
 /*
  * Limit the guest addresses as best we can.
  *
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ce6ce82618..db760ff5c2 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,8 @@ static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 static inline void *g2h_untagged(abi_ptr x)
 {
-    return (void *)((uintptr_t)(x) + guest_base);
+    uintptr_t hx = guest_base_signed_addr32 ? (int32_t)x : (uintptr_t)x;
+    return (void *)(guest_base + hx);
 }
 
 static inline void *g2h(CPUState *cs, abi_ptr x)
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 48643eeabc..4fef0520da 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -54,6 +54,10 @@
 int singlestep;
 uintptr_t guest_base;
 bool have_guest_base;
+#ifndef guest_base_signed_addr32
+bool guest_base_signed_addr32;
+#endif
+
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
  * guest address space into a contiguous chunk of virtual host memory.
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..ed7a88c195 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -72,6 +72,9 @@ static const char *seed_optarg;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
 bool have_guest_base;
+#ifndef guest_base_signed_addr32
+bool guest_base_signed_addr32;
+#endif
 
 /*
  * Used to implement backwards-compatibility for the `-strace`, and
-- 
2.25.1


