Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464B60BE83
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:26:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6oX-0001PE-39; Mon, 24 Oct 2022 19:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oV-00010e-7w
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:59 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oT-0000GB-Ir
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:58 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso13674505fac.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PvLfshUVxQ9Mypl80D0uVTHRSLnGuXN+L2Mxf0dBkyM=;
 b=vXkHP2Thfh04B9MGPzzuXTBR7b6ZuCb8nAdr8CIhk0h/oBOPxheJnfTM93tqPJC+Dk
 V2w98U8XNP26Zw+UfSAQR0aD7nGkQk8mVz9VK/lG53leoyEy0KDYz1hObnHh5lZamaX6
 w6he8a7+f3uYbQmobhLiN1G2eQoIDaugQefEgqZc1/cGK9fFEpvZdDKlF/1EUrQKH9xR
 Dw56YrxTBiyv+NX6k1Db+e4wCf6MY70sbZx4Xn8wSUpfG0KEP+JoMyIwF6AIK7/U3Rt6
 Vc22fVbF5u2ygYxXAxPHpZIuGUMcwL0BpLP5kNXiMKjncnyIUk7b1IE+nrHH+Ghi5aKT
 yrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PvLfshUVxQ9Mypl80D0uVTHRSLnGuXN+L2Mxf0dBkyM=;
 b=dNoWjwQxC5I+fcr4sGHRnEILbi/IRO7xkzsSkXHRphGQKVjeEnG4QzBCWEKbGSdRPS
 CkPMl2/H6K0E/C9KB8fpONeYNB21/OATp6BZX1v+qDZ3jAqD7N8PxGKmXUqEIlzhtHv7
 vEOwo7fw/QvrohrpE5LQJy9hUf8HtZel+W+Bs9IslDpja8+Ppj5kw5gBoz5ecJTzHiBu
 D33DmgLFHRMbFxoQn3Hxe5yve3ErggkUWzRc+HiWEYAH+mKDhtHVf+m7N7KAavMkODcP
 fdR5btK8ic0f10X3Up5ihMHquX6RmNjYNN8njU8OYePkpskRwjFuOoQEe+sg9mATZRnV
 Ylxw==
X-Gm-Message-State: ACrzQf1Mm427YlBfzxAc7O+rpGNR+ZdPmbI8l+SvBMgLoRoWqbJZOKUK
 XkxPiKR9LCOlhuuFoCLS2YXHksUwvBOs7Q==
X-Google-Smtp-Source: AMsMyM5RUZepWlplJEQy9WfSyrY6x37shLv2/p0zn4df/+lFZvICJ881buJao3wC1Jhnym0uCQMedw==
X-Received: by 2002:a17:90b:1808:b0:20c:8409:2007 with SMTP id
 lw8-20020a17090b180800b0020c84092007mr41585623pjb.226.1666653885712; 
 Mon, 24 Oct 2022 16:24:45 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0056bfa2cf517sm324788pfh.3.2022.10.24.16.24.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:24:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] include/qemu/atomic: Use qemu_build_assert
Date: Tue, 25 Oct 2022 09:24:33 +1000
Message-Id: <20221024232435.3334600-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024232435.3334600-1-richard.henderson@linaro.org>
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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


