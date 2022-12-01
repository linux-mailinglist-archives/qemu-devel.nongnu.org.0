Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFF63EA7C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:46:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0eGX-0004kE-J0; Thu, 01 Dec 2022 02:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eG6-0004bf-Ms
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:45:36 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eG4-00065y-TU
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:45:26 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y17so882741plp.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wPfTsXByzqqpErQP2kZxiMdnz9aCgi9SsKK4inODxFo=;
 b=VyttmRNybxL3xLd1RzwhyCCtd4vnEi4bUoCj/anf8mkU49O7k3AzLU+TtU1/mQjpKP
 2+YUQUXztjBhsau2VoghnnnV/00fVbDS30arPzH9yP6IdN8zuPMeZKp5Q3pUiKmdde+L
 NhU9m/BbnG5zsuLmkO3jr8m6asbjGHJL05hkbE2EaUMsJjDkxAIwMiiXi+dexRAVvIID
 tdF5c2rDkwTiMLVOkLCamGYPDORECnuDwnjd5qPzX71ZJRYen0rd9H+q2f3eHNMZC4Xl
 Y5xT944SfWuasK+wkz9HQKsy5INKbCxle0uJRck6QqBpWIDpM/GO3f7qb7CETRHa6jLe
 U61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPfTsXByzqqpErQP2kZxiMdnz9aCgi9SsKK4inODxFo=;
 b=Pu+xY302JDw0GrDAshUqKsceFlQ1iiuY5QsSWKf7pnUqaBaOLg+wFrtzSoWq1U4Doh
 SO0ivBKJqmD6E/fiPM8BAu0QcVRZxUeGOhvmHNbEnMAbBUsiGxZEgeI9Pe4gkgAUtfwE
 gIjQt3zPDYV8JLuEtDM/rw6dh5PHcruyhfee2/JnAz++hpYsNJ2KlYzGwZY1aV/2asiz
 mBbiZqKTv/WaR5zQSKYWilPf+5oT91Ia2NGjrtRbY21FOfox/s83MrtYIGOumCyCNb74
 p081zkzAEU1sSS54oTfZVpj+7nQwJ291zZ8v1YNcKOnYHOWDZVKhTY7dS/TjcEXAu/X6
 rvSQ==
X-Gm-Message-State: ANoB5pl/RM1mfUUAi5WgGTPRjuV71T2RzSNCJebBESUk63+aboMB3G7x
 bqXYi8lKhaQLQUUnf/5J4BG417xxf5BMlA==
X-Google-Smtp-Source: AA0mqf6BN8ctQvHwGLZG8U03xeYtB6xP6MOCPLV9zAH7k0dkcknI0aczOaTHP5zcmh0KD9yvDGgM4g==
X-Received: by 2002:a17:902:8bc4:b0:187:2790:9bc2 with SMTP id
 r4-20020a1709028bc400b0018727909bc2mr48873529plo.61.1669880723502; 
 Wed, 30 Nov 2022 23:45:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ff0200b0018975488514sm2831451plj.126.2022.11.30.23.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:45:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Hoffman <dhoff749@gmail.com>
Subject: [PATCH for-7.2] target/i386: Always completely initialize
 TranslateFault
Date: Wed, 30 Nov 2022 23:45:22 -0800
Message-Id: <20221201074522.178498-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

In get_physical_address, the canonical address check failed to
set TranslateFault.stage2, which resulted in an uninitialized
read from the struct when reporting the fault in x86_cpu_tlb_fill.

Adjust all error paths to use structure assignment so that the
entire struct is always initialized.

Reported-by: Daniel Hoffman <dhoff749@gmail.com>
Fixes: 9bbcf372193a ("target/i386: Reorg GET_HPHYS")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 34 ++++++++++++++++------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 405a5d414a..55bd1194d3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -71,10 +71,11 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
         TranslateFault *err = inout->err;
 
         assert(inout->ptw_idx == MMU_NESTED_IDX);
-        err->exception_index = 0; /* unused */
-        err->error_code = inout->env->error_code;
-        err->cr2 = addr;
-        err->stage2 = S2_GPT;
+        *err = (TranslateFault){
+            .error_code = inout->env->error_code,
+            .cr2 = addr,
+            .stage2 = S2_GPT,
+        };
         return false;
     }
     return true;
@@ -431,10 +432,11 @@ do_check_protect_pse36:
                                   MMU_NESTED_IDX, true,
                                   &pte_trans.haddr, &full, 0);
         if (unlikely(flags & TLB_INVALID_MASK)) {
-            err->exception_index = 0; /* unused */
-            err->error_code = env->error_code;
-            err->cr2 = paddr;
-            err->stage2 = S2_GPA;
+            *err = (TranslateFault){
+                .error_code = env->error_code,
+                .cr2 = paddr,
+                .stage2 = S2_GPA,
+            };
             return false;
         }
 
@@ -494,10 +496,11 @@ do_check_protect_pse36:
         }
         break;
     }
-    err->exception_index = EXCP0E_PAGE;
-    err->error_code = error_code;
-    err->cr2 = addr;
-    err->stage2 = S2_NONE;
+    *err = (TranslateFault){
+        .exception_index = EXCP0E_PAGE,
+        .error_code = error_code,
+        .cr2 = addr,
+    };
     return false;
 }
 
@@ -564,9 +567,10 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
                 int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
                 int64_t sext = (int64_t)addr >> shift;
                 if (sext != 0 && sext != -1) {
-                    err->exception_index = EXCP0D_GPF;
-                    err->error_code = 0;
-                    err->cr2 = addr;
+                    *err = (TranslateFault){
+                        .exception_index = EXCP0D_GPF,
+                        .cr2 = addr,
+                    };
                     return false;
                 }
             }
-- 
2.34.1


