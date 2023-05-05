Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63656F8649
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:55:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkj-0003O7-S9; Fri, 05 May 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxke-0003Ky-93
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkb-0008DJ-Ko
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso14088455e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302020; x=1685894020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5v8fvq4VC0aPq5wotViTt43FBb9CbIW+fQM89RxcOGc=;
 b=GGxOjGa6F4eAynplYybIhj5pDH0sJRzFcZoqX+dXOGuOmZLYd2l9w0WJq3nG4Haug/
 fSWl7cpSKal4D35Fc7ACKxQzbaSqNf1g00+4kC4ZScGzw0FPTRGBkJ8oP7bqJ28u4Py6
 lEvP0UF/3OA2JBz7H8D07NUfaZxuBSSkjZTaFqm+tISYw/cFB91RoLufWDx+xzCys1ub
 NB/Sr8x/SWx/VmVstWWhdWau4xWgf7PDo3i0ajRz2HMOZHShuzYOWwH3yKgX3veHjOTZ
 pyi7EFlsMX7vpa7/MlKX8mQQxoH9tcLsQxXSSoAImOrVW7o1+7yKDeCCudQ1u08Or5B1
 ilCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302020; x=1685894020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5v8fvq4VC0aPq5wotViTt43FBb9CbIW+fQM89RxcOGc=;
 b=ZHX+TZLX7AZIc1MWONPrvPJvBqeEgJPhpKSSBrT8/+rLQZbP27m1yRlmDPvvs5J3mQ
 fyqt+mjcFLB+kJly/39UAGa3i3rr4nIZ5R/Hotkr5VfkKN/KaDkv0rxTDefPMTuI+sA9
 4zmfUapdHaSrAbdgOlQhP8Wvym1Krm4TkT4xODYFfSXJO5/B4zawfMJ0o9+aLSBeyfN1
 R30U2vZS/Ims3WKC7eKsKLrSpLGEIHvIjlvKR+0dFTxhucuQWgJ7IiZPs1lGeAY9g1bd
 jsMKlWgom6PDZUHGR6PzbMG/G/1woRg9SkNy/hiOYQWAipuK7IVNaC5FQMPVR4yZmEcy
 uw5Q==
X-Gm-Message-State: AC+VfDwdX6BjkskQQG5fDZRpoVzdPHDi8jvWY199DnvfE5BSaSfhZ4ad
 ZICZRBlI1FG+GRMVwU413kufWA==
X-Google-Smtp-Source: ACHHUZ6xGq5Dk53wmPhrkDC5VvoepgUEsOYEj7UZ3LEbgmx24U3DhkAIpvNEoJIVqcOG/OmpBT7Hqg==
X-Received: by 2002:a05:600c:21d0:b0:3f1:8aaa:c20c with SMTP id
 x16-20020a05600c21d000b003f18aaac20cmr1549221wmj.7.1683302020267; 
 Fri, 05 May 2023 08:53:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4843000000b003047d5b8817sm2771261wrs.80.2023.05.05.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6E5E1FFC5;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 10/10] accel/tcg: include cs_base in our hash calculations
Date: Fri,  5 May 2023 16:53:36 +0100
Message-Id: <20230505155336.137393-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We weren't using cs_base in the hash calculations before. Since the
arm front end moved a chunk of flags in a378206a20 (target/arm: Move
mode specific TB flags to tb->cs_base) they comprise of an important
part of the execution state.

Widen the tb_hash_func to include cs_base and expand to qemu_xxhash8()
to accommodate it.

My initial benchmark run on armhf shows very little difference in the
runtime.

Before:

  Time (mean ± σ):     24.440 s ±  2.885 s    [User: 34.474 s, System: 2.028 s]
  Range (min … max):   21.663 s … 29.937 s    20 runs

After:

  Time (mean ± σ):     24.348 s ±  2.717 s    [User: 34.668 s, System: 1.859 s]
  Range (min … max):   21.830 s … 30.093 s    20 runs

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-hash.h   |  5 +++--
 include/qemu/xxhash.h | 21 +++++++++++++++------
 accel/tcg/cpu-exec.c  |  2 +-
 accel/tcg/tb-maint.c  |  4 ++--
 4 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 1d19c69caa..8cbafb5494 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -62,9 +62,10 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 
 static inline
 uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc,
-                      uint32_t flags, uint32_t cf_mask)
+                      uint32_t flags, uint64_t flags2, uint32_t cf_mask)
 {
-    return qemu_xxhash6(phys_pc, pc, flags, cf_mask);
+    return qemu_xxhash8(phys_pc, pc, flags,
+                        flags2 & 0xffff, flags2 >> 32, cf_mask);
 }
 
 #endif
diff --git a/include/qemu/xxhash.h b/include/qemu/xxhash.h
index c2dcccadbf..cd7054f07e 100644
--- a/include/qemu/xxhash.h
+++ b/include/qemu/xxhash.h
@@ -48,8 +48,8 @@
  * xxhash32, customized for input variables that are not guaranteed to be
  * contiguous in memory.
  */
-static inline uint32_t
-qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
+static inline uint32_t qemu_xxhash8(uint64_t ab, uint64_t cd, uint32_t e,
+                                    uint32_t f, uint32_t g, uint32_t h)
 {
     uint32_t v1 = QEMU_XXHASH_SEED + PRIME32_1 + PRIME32_2;
     uint32_t v2 = QEMU_XXHASH_SEED + PRIME32_2;
@@ -89,6 +89,9 @@ qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
     h32 += g * PRIME32_3;
     h32  = rol32(h32, 17) * PRIME32_4;
 
+    h32 += h * PRIME32_3;
+    h32  = rol32(h32, 17) * PRIME32_4;
+
     h32 ^= h32 >> 15;
     h32 *= PRIME32_2;
     h32 ^= h32 >> 13;
@@ -100,23 +103,29 @@ qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
 
 static inline uint32_t qemu_xxhash2(uint64_t ab)
 {
-    return qemu_xxhash7(ab, 0, 0, 0, 0);
+    return qemu_xxhash8(ab, 0, 0, 0, 0, 0);
 }
 
 static inline uint32_t qemu_xxhash4(uint64_t ab, uint64_t cd)
 {
-    return qemu_xxhash7(ab, cd, 0, 0, 0);
+    return qemu_xxhash8(ab, cd, 0, 0, 0, 0);
 }
 
 static inline uint32_t qemu_xxhash5(uint64_t ab, uint64_t cd, uint32_t e)
 {
-    return qemu_xxhash7(ab, cd, e, 0, 0);
+    return qemu_xxhash8(ab, cd, e, 0, 0, 0);
 }
 
 static inline uint32_t qemu_xxhash6(uint64_t ab, uint64_t cd, uint32_t e,
                                     uint32_t f)
 {
-    return qemu_xxhash7(ab, cd, e, f, 0);
+    return qemu_xxhash8(ab, cd, e, f, 0, 0);
+}
+
+static inline uint32_t qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e,
+                                    uint32_t f, uint32_t g)
+{
+    return qemu_xxhash8(ab, cd, e, f, g, 0);
 }
 
 /*
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 973da2a434..8d67198e56 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -233,7 +233,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     }
     desc.page_addr0 = phys_pc;
     h = tb_hash_func(phys_pc, (cflags & CF_PCREL ? 0 : pc),
-                     flags, cflags);
+                     flags, cs_base, cflags);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 432a0cffdb..52d17815e4 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -887,7 +887,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     phys_pc = tb_page_addr0(tb);
     h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb->pc),
-                     tb->flags, orig_cflags);
+                     tb->flags, tb->cs_base, orig_cflags);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -968,7 +968,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     /* add in the hash table */
     h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb->pc),
-                     tb->flags, tb->cflags);
+                     tb->flags, tb->cs_base, tb->cflags);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
-- 
2.39.2


