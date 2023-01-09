Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B1663174
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:25:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybu-0005FR-L3; Mon, 09 Jan 2023 15:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybp-00052q-DI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:05 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybn-00054B-Sg
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:05 -0500
Received: by mail-pf1-x431.google.com with SMTP id g20so7071612pfb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zltlvjlCUn0zx1Lgpw9up7wSOYc3XGuPw4RO2nRN2MM=;
 b=W6Ya5WIZXKBPN3O6d17dcnSVXs8mXsYVsi87ID324ANlXqpEuWgpOpBYp5Lfk3GflV
 yM7HJZr8W/qKJLdgvaG5otZsDXY5Kxx38nIJNdGEiY38jqsrogBNi1nso4+4gYefpgBz
 RD5ab23aqr/GcsPhC6g8wQ4UqiVZinPWf1/YEK2QKBBwzYYXJjlgb7lotXK6XR4V8ok4
 p8z3lfLX3CsJo+LjS+jtLHRPE8bkzt6qequufwjALnpoQ2rh7ndb51ytY4C8T3kImF1K
 ByaXU17ifrR3ycihB2nTJnRuJgFgULK2F5IZLMfxFYL2V9GqAFxRZKghJEboiVoQxy4X
 ntUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zltlvjlCUn0zx1Lgpw9up7wSOYc3XGuPw4RO2nRN2MM=;
 b=1rX6oOc5Z58Zn3cLfsvqaVTyJ7JG/YUh40HCgngawvrNRzwCo8upNSSJFHGEPlF5EO
 u1T5wyYUQCZskc/fgmZpx/E4A1pJmhEeob/tuu7EkzsdbZ8ZjohKJsJ7lJ/LlNf+iwpw
 BhjVJDhAHBVILB8HI5okhLZ5CfRia9pt94G6zh/Swgz4K4zytn1A3XUoyB+1EHhRP0Nn
 /MdOLZ7HW1fTvj4em82Jkh+IHxn8e6TEIwuBVDuajh+eBcIYugKosJbgGRHfFthAx5bk
 9LwiWtZL7hiLIPv40aLcmGS9N2fxDjuIX45tc6m0/IerSZf1qUfjQraii1qrvha+e7jN
 b81w==
X-Gm-Message-State: AFqh2kpB2Ja60A8jviievmwjup8C9E+k6bUSUj14d0aXwpkzaW8Inzdg
 xXDwtW+Do2OWuqP/Mqvc/y6uyLAQgAqjgS9G
X-Google-Smtp-Source: AMrXdXuryN0G7UEJLKUbxuQUeU25T7cJY9fM+7K7y6ZuCctk6g2TzS5jHQ8Lj2sZJel0d/YCANj/1g==
X-Received: by 2002:a62:ed18:0:b0:574:cc3d:a24e with SMTP id
 u24-20020a62ed18000000b00574cc3da24emr58468547pfh.5.1673295541179; 
 Mon, 09 Jan 2023 12:19:01 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:19:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 3/7] target/s390x: Use void* for haddr in S390Access
Date: Mon,  9 Jan 2023 12:18:52 -0800
Message-Id: <20230109201856.3916639-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

The interface from probe_access_flags is void*, and matching
that will be helpful.  We already rely on the gcc extension
for byte arithmetic on void*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6a50189ef0..0f2830f87c 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -114,8 +114,8 @@ static inline void cpu_stsize_data_ra(CPUS390XState *env, uint64_t addr,
 typedef struct S390Access {
     target_ulong vaddr1;
     target_ulong vaddr2;
-    char *haddr1;
-    char *haddr2;
+    void *haddr1;
+    void *haddr2;
     uint16_t size1;
     uint16_t size2;
     /*
@@ -268,8 +268,9 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
                      desta->mmu_idx, ra);
 }
 
-static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
-                                  int offset, int mmu_idx, uintptr_t ra)
+static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
+                                  void **haddr, int offset,
+                                  int mmu_idx, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
     return ldub_p(*haddr + offset);
@@ -301,7 +302,7 @@ static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                               offset - access->size1, access->mmu_idx, ra);
 }
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
+static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void **haddr,
                                int offset, uint8_t byte, int mmu_idx,
                                uintptr_t ra)
 {
-- 
2.34.1


