Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C43698ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTM-0003X3-Iv; Wed, 15 Feb 2023 21:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTK-0003Wl-Pa
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:10 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTI-0005mc-Vb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:10 -0500
Received: by mail-pg1-x52e.google.com with SMTP id c29so415748pgm.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j43l2wwityBoGjxEXvAnE2DYTf2+ihi6z7wIWyCgIko=;
 b=F34IOuP+nK/HoRVIX/dkUZ65V8DDhXBH/2eKcT+bp/LAs9epr40CDpX7wSQHDB/PFa
 0h0Rdz0XDPA/jwzEP75yaCf25Em3zpvwHBN4iwUYw8a92tHYsH7bcqEq+uFbgjtCqMBb
 C+seDajIHO4bl/cGk6brr9kcUVWyMBijBEWecPywh47TzsEHM1zRtJdOqoP7p/8ENMqr
 qT1rBfLhGJuSqrdue4lqGkQKKZIcARdt9nkTausX+UzXIz//19OqNwGnOHZGfFE8ZvKL
 R66s9U8l9pqveg3Ul/OWoknGewVnfKUhkS+J/Kpfu2EpQMc7kx5158Jt9mpgXpYvtqpj
 bHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j43l2wwityBoGjxEXvAnE2DYTf2+ihi6z7wIWyCgIko=;
 b=x9/tBq/1Nm1nFt1wNewTwi2lNZlizvYu2HIQbgjE2mlvHnj0u32Rgd+K7z+m2Pu1B5
 auLHoVXRh8IqNpbzH8vB2TUvPeF01/z3cdZp/f96bG5yOWTcuo1CWBphiGJi0SIt60A4
 CkPuWvV4k50Luq2sGuADcmiDxPr8NIUJZKIgGKqz0QBIpqnxFA26f4JV6/DWpIHIqlAH
 dh5gGpBgKnqcO2HotQx5Iq1HLOxy5GR1QcJiHD5ytX28c78gtNQCYjEKei1OjP+nlvuo
 jPDmhvJHnPDrkBKmHwyb8/y04Ms8z2a4xsxiuPdSFYOxXgpr7kOD0WVJ2jQrq6F/L6tv
 QyeA==
X-Gm-Message-State: AO0yUKW7fTI/N8IGr8vlOyzUG31hFgZx0uNZbrWeZLp3rHxCTBuscXmo
 oDPmYLmd8sinDwFB7nU8r9gsv4KD5STO+y/bNKk=
X-Google-Smtp-Source: AK7set+UNvds4bzom7ykHak6erFu4/T0O+tqtf5IIcoWOYvDzDltzdgRITM0fwyfQmg55lCfc/tB9g==
X-Received: by 2002:aa7:9851:0:b0:5a8:4d2a:ad2d with SMTP id
 n17-20020aa79851000000b005a84d2aad2dmr3770213pfq.1.1676516287600; 
 Wed, 15 Feb 2023 18:58:07 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/30] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Wed, 15 Feb 2023 16:57:28 -1000
Message-Id: <20230216025739.1211680-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 9a95ac327d..277629f241 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__)
 # define HAVE_al16_fast    likely(have_atomic16)
 #else
@@ -48,6 +50,8 @@
 #endif
 #if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
 # define HAVE_al16         true
+#elif defined(__aarch64__)
+# define HAVE_al16         true
 #else
 # define HAVE_al16         false
 #endif
@@ -170,6 +174,14 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__aarch64__)
+    uint64_t l, h;
+
+    /* Via HAVE_al16_fast, FEAT_LSE2 is present: LDP becomes atomic. */
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)pv));
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    return int128_make128(l, h);
 #elif defined(__x86_64__)
     Int128Alias r;
 
@@ -409,6 +421,18 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__aarch64__)
+    /*
+     * Via HAVE_al16_fast, FEAT_LSE2 is present.
+     * LDP becomes single-copy atomic if 16-byte aligned, and
+     * single-copy atomic on the parts if 8-byte aligned.
+     */
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t l, h;
+
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)(pi & ~7)));
+    return (l >> shr) | (h << (-shr & 63));
 #elif defined(__x86_64__)
     uintptr_t pi = (uintptr_t)pv;
     int shr = (pi & 7) * 8;
@@ -764,10 +788,15 @@ store_atomic16(void *pv, Int128Alias val)
         l = int128_getlo(val.s);
         h = int128_gethi(val.s);
 
-        asm("0: ldxp %0, xzr, %1\n\t"
-            "stxp %w0, %2, %3, %1\n\t"
-            "cbnz %w0, 0b"
-            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        if (HAVE_al16_fast) {
+            /* Via HAVE_al16_fast, FEAT_LSE2 is present: STP becomes atomic. */
+            asm("stp %1, %2, %0" : "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        } else {
+            asm("0: ldxp %0, xzr, %1\n\t"
+                "stxp %w0, %2, %3, %1\n\t"
+                "cbnz %w0, 0b"
+                : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        }
         return;
     }
 #elif defined(CONFIG_CMPXCHG128)
-- 
2.34.1


