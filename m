Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3860D92B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:19:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtX-0004rF-Ib; Tue, 25 Oct 2022 22:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtU-0004qV-Es
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:48 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtP-000186-89
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:44 -0400
Received: by mail-pg1-x531.google.com with SMTP id b5so13437405pgb.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+bQ8y2aE1cH3TKB7oyilRPItnm1DTZkui5P8deFPJQ=;
 b=C0QZ/r6zYkP/x74z2KIotNtqD88L5FBbh8BUgbNw+Eo4rH7bEs+BzXOkUGDYcrJu4o
 8ahh3DdXr+M6zgWzinstMTyGMp4cIFQqXNr5mPGChzLEht8apIWiOY9fAdmOadkCjxvJ
 kKOqCu/WJ5qIYYhZ1xb2vxs+cmQHlZCmGVuJNsJrPlm5Ditx9+hBhlGbhucEEXUyX296
 /55OxDNgcjTitjYwgIUDbswZ6kvDkBNnf/4QfE0Iy/BHZjtNS7urRAlDitmWZeL9x9fG
 PXuFaa/omYfAZiWCUuoqK/rak35UXK6AC8Vzm/SIpcE/Pwi/prc0V1AnNTAJWSVddH+8
 8RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+bQ8y2aE1cH3TKB7oyilRPItnm1DTZkui5P8deFPJQ=;
 b=lLB2T3mjVOYwk3fy7rPIVohwx8qv/9Sz3IC1nkSKPPVoKRmSOW/J2ZrghOsXIdWHDl
 b8ITXeHDTYGURz8aQsEsxi98EMLJ71rYdsh5IFXbUUfV/2aZalJAxy9YHpk57Rpgk/Bc
 bspgOZoI06KDkRLpCIycmvMAZs+xJT8MAF92lY48fDcUH7WGWTHllq3HvcgZYR2d7uBi
 O8owrXSNKoFHCHoAlYAZuT89sYbeBFi1ClBL9raAjIGJLLKfiokXu5u64EKD4tfSWzE3
 GArvE37c92uQv/lzJ4KRASKvDV0dynQclTDlrVh7RvoYRSCaA883IZmxg5+sZGJbmOec
 4yGQ==
X-Gm-Message-State: ACrzQf3F9jkXAkolvACbp1aGMZuvFuR8e6PtpINxyGu0ir9AsYJno6nT
 iaf8DIfJwFl1NnhTwy8NBCoah1tvXfkkuiPk
X-Google-Smtp-Source: AMsMyM4KyGefwzhqgY4a8YpSJzQ4ubAL9IqPc1c4/9LZH5O6jo5BaCMdoCX9ZJ1J3GzicxGmNGz1Og==
X-Received: by 2002:a63:86c3:0:b0:46f:33df:46b0 with SMTP id
 x186-20020a6386c3000000b0046f33df46b0mr4055007pgd.564.1666750301899; 
 Tue, 25 Oct 2022 19:11:41 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/47] include/qemu/atomic: Use qemu_build_assert
Date: Wed, 26 Oct 2022 12:10:35 +1000
Message-Id: <20221026021116.1988449-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Change from QEMU_BUILD_BUG_ON, which requires ifdefs to avoid
problematic code, to qemu_build_assert, which can use C ifs.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 7e8fc8e7cd..874134fd19 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -133,7 +133,7 @@
 
 #define qatomic_read(ptr)                              \
     ({                                                 \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     qatomic_read__nocheck(ptr);                        \
     })
 
@@ -141,7 +141,7 @@
     __atomic_store_n(ptr, i, __ATOMIC_RELAXED)
 
 #define qatomic_set(ptr, i)  do {                      \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     qatomic_set__nocheck(ptr, i);                      \
 } while(0)
 
@@ -159,27 +159,27 @@
 
 #define qatomic_rcu_read(ptr)                          \
     ({                                                 \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     typeof_strip_qual(*ptr) _val;                      \
     qatomic_rcu_read__nocheck(ptr, &_val);             \
     _val;                                              \
     })
 
 #define qatomic_rcu_set(ptr, i) do {                   \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     __atomic_store_n(ptr, i, __ATOMIC_RELEASE);        \
 } while(0)
 
 #define qatomic_load_acquire(ptr)                       \
     ({                                                  \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);  \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     typeof_strip_qual(*ptr) _val;                       \
     __atomic_load(ptr, &_val, __ATOMIC_ACQUIRE);        \
     _val;                                               \
     })
 
 #define qatomic_store_release(ptr, i)  do {             \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);  \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
     __atomic_store_n(ptr, i, __ATOMIC_RELEASE);         \
 } while(0)
 
@@ -191,7 +191,7 @@
 })
 
 #define qatomic_xchg(ptr, i)    ({                          \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);      \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE);     \
     qatomic_xchg__nocheck(ptr, i);                          \
 })
 
@@ -204,7 +204,7 @@
 })
 
 #define qatomic_cmpxchg(ptr, old, new)    ({                            \
-    QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE);                  \
+    qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE);                 \
     qatomic_cmpxchg__nocheck(ptr, old, new);                            \
 })
 
-- 
2.34.1


