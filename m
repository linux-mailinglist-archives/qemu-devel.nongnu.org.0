Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4B3F0BE1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:36:22 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRML-0000d8-IW
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6j-0001Gj-LV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6i-0000PN-4e
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:20:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u1so2469700plr.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrhEH74uRU5wNo7wx1ajciBORCdhKaW0yGEoPAQT7ZY=;
 b=F9sv85+Jw6v3QZNL2IXJmTczCp/NzC5jO7N0x2Tx/5zENT9yw0DRlZb+rab8quLXWl
 HkHdlvmqEpJMJpbxtWdcbHoZBAeLBJFqQ4ixi0lGciVgxLprfq1J9T+i5eh7jQ1C7GQN
 X73nbcC3EtbLfuom5ETnVt0aTQkilWFj1g/YXOVPfP7T7VM39fAEWmxM+aORZmqCGQlw
 S/MgVKzU9QKie9LpdOXWe2W3FJyB6QgetXO9QuMJUs42vodeTF+m5qEIUDnF8nYL8tu6
 w8L5y3ne2aTzT1KK6eA90PkGr1/ekXfdk9ZGH/r7cgNAZ5EZYNF+SvNVKsLG1ogz47Za
 5OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrhEH74uRU5wNo7wx1ajciBORCdhKaW0yGEoPAQT7ZY=;
 b=qVya21nZJsVlFcLH9dKckoJd6EKwDsr4eWpMsYYRpJd+B8GZLsynlHAjZscjZ5hXJB
 VGqKUbNFIDmQvbEotaGNY6hNUdUbJXgwa07bs2dvKvTwGNqgJEkZOusKJnszzjN2Lm4d
 1b2zM5rLf2l79iKSuyPEvx8182pb4PZBk1dzsulTdOv6EZI7aycV2TtB15q+BlQKTT3n
 7rcDgnA5G5k4mbY/ZubQOOQ+6yARgol6xEqXHqILCloe/Ohbyr6+xJuQoDGhNNboDamH
 pO9tXNsvczjaWKc+cBCqfmvVBQ+Y8+uLDvjpIus5tUatctYjhyfySw8qF34iNepR1Isp
 V8zw==
X-Gm-Message-State: AOAM532uEyjjoHEnoF8wa0kGyUJTPYfPr88QEWKLkvY1HMzPHCjA+viX
 tsfus9Iyi640XxftyWRMgQQ9GxRirmk9Jg==
X-Google-Smtp-Source: ABdhPJw76xfZ16WOZcgzpTeaRuSs/GaEkGQmIMaKExKg+Oc0jip0aBuvJOsjMV8vVd7TkAQL+Q1ulg==
X-Received: by 2002:a17:90b:18f:: with SMTP id
 t15mr10657686pjs.168.1629314410989; 
 Wed, 18 Aug 2021 12:20:10 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:20:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/66] target/s390x: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 18 Aug 2021 09:18:53 -1000
Message-Id: <20210818191920.390759-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b20a82a914..4115cadbd7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -248,13 +248,13 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
          * page. This is especially relevant to speed up TLB_NOTDIRTY.
          */
         g_assert(size > 0);
-        helper_ret_stb_mmu(env, vaddr, byte, oi, ra);
+        cpu_stb_mmu(env, vaddr, byte, oi, ra);
         haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
         if (likely(haddr)) {
             memset(haddr + 1, byte, size - 1);
         } else {
             for (i = 1; i < size; i++) {
-                helper_ret_stb_mmu(env, vaddr + i, byte, oi, ra);
+                cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
             }
         }
     }
@@ -290,7 +290,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    byte = helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
     return byte;
 #endif
@@ -324,7 +324,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    helper_ret_stb_mmu(env, vaddr + offset, byte, oi, ra);
+    cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 #endif
 }
-- 
2.25.1


