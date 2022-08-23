Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0759EE51
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:40:12 +0200 (CEST)
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbd6-0004vK-2U
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbbA-0000ie-Vc
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbb9-00060t-5U
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:38:12 -0400
Received: by mail-pl1-x630.google.com with SMTP id u22so13953838plq.12
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1wC40Txe5zJ5ok4xl905SAO8DYChZ8Ztlm4id2EmYkU=;
 b=jikUyGdICV1jmwScfFClC1NRzjd5JLpR4Bflu9jcLq+KAglZXaSxwM3alX085mK2XO
 jEmmi9lNgF4PsUwsgD4q7phYptXMU2LHiT1rYIJzi45QXZGYn42gdeH7Yv01jPjOvJza
 14mcJLNxXzDyuPimyyT2I/X0Vcq0aIrQGcwvXsY/j2OcZNSUm6aKXrcqmzPpr0WoDckh
 rGjUME0o7n3sFtFVBuds/cDEEcD1HsZTUDEJ7fTNHiw97IZZ6vy/ohNr7gUAGVzG7Uhd
 Uq5+KGvmiakozrumD/GEofbO8GYDe3/mWVOu54NamzqbGhEHVMl/31LtT/ae0zrYMZ6I
 iIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1wC40Txe5zJ5ok4xl905SAO8DYChZ8Ztlm4id2EmYkU=;
 b=XaB8jofsisz0ltJO7U0M8sQyNjvnJJjl9NqX9azZ0uZ7VOVJ3pwbQuy7eZ0GPjabR3
 u6NcGRuKPszmttQ0zv4Z44yWar05KYNNOD6iESH+cJukdGW5uTj/IobHamNLbgYapPFI
 ZS/39fTsKpX0xmVNiZOXjAkp3HI3jsjn6v+1QOOOshqjtpuNREKqciOCN5L0hmIvrPJ8
 XCDmAw7PWIGUe8+9p6iAlzEdVdLjx48MTMv+YG8ILST8r5XooRTKv1ldEuzTH0+iUsJY
 leuymVmfRYRc+IdRxy8Md3sjDBIuVYjeg7NHZeNfZkskeod6hn4sXR8lYJT4l5j8prIb
 HNuA==
X-Gm-Message-State: ACgBeo13WMb5CEUgcfojIgyyxiKQn8u+Ar6vrX0r9qc63HG4v8zGLudi
 f2Qyc++M79glyYzCg/nESF4KZu74+gTCWQ==
X-Google-Smtp-Source: AA6agR4DDs5tPSF+PKmcRmkz00ACgSxHJLgdDgiNyI9rivBRY0oMC+KTNr3e83DDkMeV0GyIfvStrQ==
X-Received: by 2002:a17:902:e94c:b0:171:3df0:c886 with SMTP id
 b12-20020a170902e94c00b001713df0c886mr26393020pll.39.1661290689810; 
 Tue, 23 Aug 2022 14:38:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a635253000000b0040d75537824sm5366403pgl.86.2022.08.23.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:38:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com,
	qemu-s390x@nongnu.org
Subject: [PATCH 1/2] Revert "target/s390x: Use probe_access_flags in
 s390_probe_access"
Date: Tue, 23 Aug 2022 14:38:04 -0700
Message-Id: <20220823213805.1970804-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823213805.1970804-1-richard.henderson@linaro.org>
References: <20220823213805.1970804-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit db9aab5783a2fb62250e12f0c4cfed5e1778c189.

This patch breaks the contract of s390_probe_access, in that
it no longer returns an exception code, nor set __excp_addr.

Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index fc52aa128b..4c0f8baa39 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -142,12 +142,20 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              MMUAccessType access_type, int mmu_idx,
                              bool nonfault, void **phost, uintptr_t ra)
 {
-#if defined(CONFIG_USER_ONLY)
-    return probe_access_flags(env, addr, access_type, mmu_idx,
-                              nonfault, phost, ra);
-#else
     int flags;
 
+#if defined(CONFIG_USER_ONLY)
+    flags = page_get_flags(addr);
+    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
+        env->__excp_addr = addr;
+        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
+        if (nonfault) {
+            return flags;
+        }
+        tcg_s390_program_interrupt(env, flags, ra);
+    }
+    *phost = g2h(env_cpu(env), addr);
+#else
     /*
      * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
      * to detect if there was an exception during tlb_fill().
@@ -166,8 +174,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              (access_type == MMU_DATA_STORE
                               ? BP_MEM_WRITE : BP_MEM_READ), ra);
     }
-    return 0;
 #endif
+    return 0;
 }
 
 static int access_prepare_nf(S390Access *access, CPUS390XState *env,
-- 
2.34.1


