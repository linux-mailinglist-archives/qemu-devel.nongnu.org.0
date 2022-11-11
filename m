Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2366254A9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:53:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgw-0007KR-Uu; Fri, 11 Nov 2022 02:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgL-00073D-GK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:33 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgJ-0000Jk-Ma
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:33 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7068925pjs.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WlfgTKwjPzR9xe9xdxRaR9DbAja99BeWVoRkY0FKPGQ=;
 b=g8eNcfJA8o7QHJ9q+8/qadavI3KG27PFTYT04f2hN8mSqv6aWgcc5pOeYjmOWQ11kS
 PT0El6lsd2WeXTCI1lio6xvYv+txj2MJ6J/6AeRAQxBPGS/MeSwjIbLMIEvKzamJUr7D
 +vHFY1dmurCGQDlm2h9tCKHUKTkmWGV/4BjnzqYWzOXnMG9/sBe+aJkkRUQ8fqqmqjz6
 eXrCmypPV1nqPK5XK5ttJ1IevIFdNwebfnjZqLbk01jYYuOrg4tbLpe4ClquBy298jkW
 5r6dMaSgoD1V+85aMVhQLUQKSI+QwjMG2ReZ5tLjv0chElQckJiYrkJ5CvUIuZn3mHJp
 RgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlfgTKwjPzR9xe9xdxRaR9DbAja99BeWVoRkY0FKPGQ=;
 b=ie/IrkZZlJKbKRGX2Il6kirZzmtvZVdQHpPuZ2lX5qdjOYBDX3ehD6LIXivUQL702G
 87dzugPiTZt1O239j4D7y3AfnKSEDuKrKD9AVpqoe5yJaoO2EW6Mdpcvp4xyjFuUHWXR
 orOJY/5gZOw4g/SVrd6/GU/Qg3F0JVUNBkmZKdpzA+CEkDayabwlouib4lNBXP1Xvdhf
 GMViQ36eH5IBFAsKJey96AiP/D9W4u15c2Ek9Xn7hdL5mnZL1Uj57Ij1X3jKk+Xd9r+U
 ZJ8ofeLTfT9sQshESGMe+raCrJJbJiKL8kUtEmEe0VjXrN6/sYU0q3OgUO2d3vd3avUA
 Nolg==
X-Gm-Message-State: ANoB5pmkrv18oGJsp/ZjruisYgTq1FM2dpOjW6LlY96fSMM2JdNCES27
 GzSLCdn/mHK/S6C7WdntJRB27QGNCfBpTyLp
X-Google-Smtp-Source: AA0mqf6LRiRpFfyGMeTlnkhX6FkfEZVKWAqj9THPor2gfr+rwIvVpfWK12/2UQAcgJ7EvOzuMf37kA==
X-Received: by 2002:a17:902:da90:b0:187:12cc:d6f1 with SMTP id
 j16-20020a170902da9000b0018712ccd6f1mr1146761plx.63.1668152550164; 
 Thu, 10 Nov 2022 23:42:30 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 36/45] include/qemu/int128: Use Int128 structure
 for TCI
Date: Fri, 11 Nov 2022 17:40:52 +1000
Message-Id: <20221111074101.2069454-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are about to allow passing Int128 to/from tcg helper functions,
but libffi doesn't support __int128_t, so use the structure.

In order for atomic128.h to continue working, we must provide
a mechanism to frob between real __int128_t and the structure.
Provide a new union, Int128Alias, for this.  We cannot modify
Int128 itself, as any changed alignment would also break libffi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic128.h | 29 +++++++++++++++++++++------
 include/qemu/int128.h    | 25 +++++++++++++++++++++---
 util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index adb9a1a260..d0ba0b9c65 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -44,13 +44,23 @@
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return qatomic_cmpxchg__nocheck(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = qatomic_cmpxchg__nocheck((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(CONFIG_CMPXCHG128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return __sync_val_compare_and_swap_16(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = __sync_val_compare_and_swap_16((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(__aarch64__)
@@ -89,12 +99,18 @@ Int128 QEMU_ERROR("unsupported atomic")
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
-    return qatomic_read__nocheck(ptr);
+    Int128Alias r;
+
+    r.i = qatomic_read__nocheck((__int128_t *)ptr);
+    return r.s;
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
 {
-    qatomic_set__nocheck(ptr, val);
+    Int128Alias v;
+
+    v.s = val;
+    qatomic_set__nocheck((__int128_t *)ptr, v.i);
 }
 
 # define HAVE_ATOMIC128 1
@@ -132,7 +148,8 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
     /* Maybe replace 0 with 0, returning the old value.  */
-    return atomic16_cmpxchg(ptr, 0, 0);
+    Int128 z = int128_make64(0);
+    return atomic16_cmpxchg(ptr, z, z);
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
@@ -141,7 +158,7 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
     do {
         cmp = old;
         old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (old != cmp);
+    } while (int128_ne(old, cmp));
 }
 
 # define HAVE_ATOMIC128 1
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6ac..f62a46b48c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -3,7 +3,12 @@
 
 #include "qemu/bswap.h"
 
-#ifdef CONFIG_INT128
+/*
+ * With TCI, we need to use libffi for interfacing with TCG helpers.
+ * But libffi does not support __int128_t, and therefore cannot pass
+ * or return values of this type, force use of the Int128 struct.
+ */
+#if defined(CONFIG_INT128) && !defined(CONFIG_TCG_INTERPRETER)
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
@@ -460,8 +465,7 @@ Int128 int128_divu(Int128, Int128);
 Int128 int128_remu(Int128, Int128);
 Int128 int128_divs(Int128, Int128);
 Int128 int128_rems(Int128, Int128);
-
-#endif /* CONFIG_INT128 */
+#endif /* CONFIG_INT128 && !CONFIG_TCG_INTERPRETER */
 
 static inline void bswap128s(Int128 *s)
 {
@@ -472,4 +476,19 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)
 
+/*
+ * When compiler supports a 128-bit type, define a combination of
+ * a possible structure and the native types.  Ease parameter passing
+ * via use of the transparent union extension.
+ */
+#ifdef CONFIG_INT128
+typedef union {
+    Int128 s;
+    __int128_t i;
+    __uint128_t u;
+} Int128Alias __attribute__((transparent_union));
+#else
+typedef Int128 Int128Alias;
+#endif /* CONFIG_INT128 */
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef1..df6c6331bd 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -144,4 +144,46 @@ Int128 int128_rems(Int128 a, Int128 b)
     return r;
 }
 
+#elif defined(CONFIG_TCG_INTERPRETER)
+
+Int128 int128_divu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u / b.u;
+    return r.s;
+}
+
+Int128 int128_remu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u % b.u;
+    return r.s;
+}
+
+Int128 int128_divs(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i / b.i;
+    return r.s;
+}
+
+Int128 int128_rems(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i % b.i;
+    return r.s;
+}
+
 #endif
-- 
2.34.1


