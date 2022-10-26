Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFAB60D93D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:24:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtZ-0004s4-NL; Tue, 25 Oct 2022 22:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtV-0004qp-QG
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:49 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtU-00010i-Cd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:49 -0400
Received: by mail-pg1-x535.google.com with SMTP id f193so13495092pgc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5RUJyLcG6Hy9YMvmiQcSVrXQZZmnqOqzwc/5ZpYsi60=;
 b=ITACuO04URowlNQjlwNEWeceyKpXcO7ZguZEvAA9Broy1i+b37HmtbUSbHCVEwEwjN
 BDOypPVGm6W1ZDFl8ox/pSID7QN+lEG6v3Gzlc5W4gXEQtsvvwibb9H2Wj4fljzSkGNP
 oZ0SGRzwLK1VyjMgfeFJXTpOprX+U2FLvc6fmjfjBTBKQHTeVuQIO+fKXrjzoip+FFPT
 ZPRvzA3XBnLWECZjZuPeK5WTKmTjn3kfwExcu7JpxIpGEa1qeoI1FQDuJOTbGW/Qsm7J
 VjtoVxONzsGnQSyJ/0yrXRcwuOPNHUPnurxkE9HlCl2VqnE84EAdtHAVg2m8hAeA0x0P
 eVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5RUJyLcG6Hy9YMvmiQcSVrXQZZmnqOqzwc/5ZpYsi60=;
 b=L1loMfmg7IYC4L3OJSmHGqcnRUeCQjTJtqs56mraCEnGkNtfIfzOa0A9hPTpDyDkBH
 7IoGtLaO+PiDnFdeydDpN0FzowtnkfNA5OXi4Duegf1W748jgwTFi3svcSGM32p/2SDc
 R8zgrNWWctgR/z/I+ZnPab6xTa/xtLmP9isuJNDO5+5xF41F20w+YUFs5G9hcNAislnp
 VZZl+IeasXmW8PCNf6K3sEivLCS8nR7vQYobs0AlZVkmmKJnN1hY0WRo9lNptvT8I7Wt
 pbjn80Wd13Ba562qAqWAVsKYMqpXrqP+qgNfChcAJqOw1MxUCSlXTDgaJWiIM6gFFHBI
 6K+w==
X-Gm-Message-State: ACrzQf11F1jYptd1FlUDFlMjZ68OjqUWYZGdM99K1P1IBo1DSq+RviMR
 eR9nZAvHfch5m4ECGyUFzfWJFV3YtGs61P6c
X-Google-Smtp-Source: AMsMyM59eikQXzK1orXhuFwNBMyarR9zgFQ1L6Czm4oiZaFhOc1TJ2WFPTSVSJUPlzw7Sa3uwBqBTA==
X-Received: by 2002:a63:ed18:0:b0:439:4176:3ea6 with SMTP id
 d24-20020a63ed18000000b0043941763ea6mr35169031pgi.363.1666750304810; 
 Tue, 25 Oct 2022 19:11:44 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 07/47] include/qemu/thread: Use qatomic_* functions
Date: Wed, 26 Oct 2022 12:10:36 +1000
Message-Id: <20221026021116.1988449-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Use qatomic_*, which expands to __atomic_* in preference
to the "legacy" __sync_* functions.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/thread.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index af19f2b3fc..20641e5844 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -227,7 +227,7 @@ struct QemuSpin {
 
 static inline void qemu_spin_init(QemuSpin *spin)
 {
-    __sync_lock_release(&spin->value);
+    qatomic_set(&spin->value, 0);
 #ifdef CONFIG_TSAN
     __tsan_mutex_create(spin, __tsan_mutex_not_static);
 #endif
@@ -246,7 +246,7 @@ static inline void qemu_spin_lock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_lock(spin, 0);
 #endif
-    while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
+    while (unlikely(qatomic_xchg(&spin->value, 1))) {
         while (qatomic_read(&spin->value)) {
             cpu_relax();
         }
@@ -261,7 +261,7 @@ static inline bool qemu_spin_trylock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_lock(spin, __tsan_mutex_try_lock);
 #endif
-    bool busy = __sync_lock_test_and_set(&spin->value, true);
+    bool busy = qatomic_xchg(&spin->value, true);
 #ifdef CONFIG_TSAN
     unsigned flags = __tsan_mutex_try_lock;
     flags |= busy ? __tsan_mutex_try_lock_failed : 0;
@@ -280,7 +280,7 @@ static inline void qemu_spin_unlock(QemuSpin *spin)
 #ifdef CONFIG_TSAN
     __tsan_mutex_pre_unlock(spin, 0);
 #endif
-    __sync_lock_release(&spin->value);
+    qatomic_store_release(&spin->value, 0);
 #ifdef CONFIG_TSAN
     __tsan_mutex_post_unlock(spin, 0);
 #endif
-- 
2.34.1


