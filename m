Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769C42E7FB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:42:34 +0200 (CEST)
Received: from localhost ([::1]:38490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF3B-0007NL-Ap
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ9-0007UM-6t
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ4-0000Rc-5j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t11so5587767plq.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66Bl8EQR5t0ae9YRNU1Dduo8SF5bSu1MJ1ucFe28OE8=;
 b=Yrp9Qtc+SjFsD0nJ4e7B6+81uBpyb+KaeXdnBzQteaCoRZfo9lcEwfZNfoGyaf/I8k
 t7UiqTt31bDPaI4JGT0qRMxvzWX/usiXdM3K4O/qHrJVA078cAoVFuSp4CFbpSQr4Dfi
 baXBVcZ4NLhLgZpIuyCQg9M8kALjO4JgPaSYO6uVO9e8hCRHcs41PXwyosBGqhKe9pYc
 LZRZdj7l+R4paJYDCKxkzAUATcCPhICrE1wb+WzjJEXzd6kQ+agLhIi1KGTSL8xplGyo
 nfcGVEyvNTr5Gs+3FMxjeMihDZYVM2s7hy/lQirMbNJ0wzbpiMSTVbbRkWje300ZRZ0m
 6ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66Bl8EQR5t0ae9YRNU1Dduo8SF5bSu1MJ1ucFe28OE8=;
 b=WkdQhNrJh6rQp8EXnHYhVBK86RV8nZwj8KOOOpWAkwnW8hw3Tth0r/zrceQ1b7kSAD
 wsUmsLZ/Ty4q3r9SYKM0Ioxb2FsQ4iPISSarjFxXOpeLfADVDEMy9i8jd2rGBzXPXBQU
 maRdH6Kz4NxOjwIxjVeHGaWmHjflMaC7heY7hK6v3HLHFOEIUIzDaJFMcq1Ze39HK+fV
 2jUP1g93LxvbC8zl84bVSVO57XZqHMoK03UoFbLPWj5b4kGZQEuPmiPzbMG2HNRB29e1
 svGAgGZbPbLGkPzhgMCHYUIh/ddD/8gqnj6x2D0fGfAnS7ER7WTRq6+0YUrOkxftmOt6
 /CYw==
X-Gm-Message-State: AOAM531BJ0cyT+ESbPCBLmB9omDX1UsQX2erJSHjpebpDhWHp2rciqBO
 dP9I45YuTIxkt9gech0GpaCfge5liyP3BA==
X-Google-Smtp-Source: ABdhPJysUxGWaoCJ4lmGNwUgodLuZoMMwPPpRsu+81KcBlfCLtITD5DjsO9qfqSOStuQh4VYE46jRw==
X-Received: by 2002:a17:90b:4a48:: with SMTP id
 lb8mr11106849pjb.236.1634271084168; 
 Thu, 14 Oct 2021 21:11:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/67] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Thu, 14 Oct 2021 21:10:22 -0700
Message-Id: <20211015041053.2769193-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure why the user-only code wasn't rewritten to use
probe_access_flags at the same time that the sysemu code
was converted.  For the purpose of user-only, this is an
exact replacement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 17e3f83641..362a30d99e 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -141,20 +141,12 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              MMUAccessType access_type, int mmu_idx,
                              bool nonfault, void **phost, uintptr_t ra)
 {
+#if defined(CONFIG_USER_ONLY)
+    return probe_access_flags(env, addr, access_type, mmu_idx,
+                              nonfault, phost, ra);
+#else
     int flags;
 
-#if defined(CONFIG_USER_ONLY)
-    flags = page_get_flags(addr);
-    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
-        env->__excp_addr = addr;
-        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
-        if (nonfault) {
-            return flags;
-        }
-        tcg_s390_program_interrupt(env, flags, ra);
-    }
-    *phost = g2h(env_cpu(env), addr);
-#else
     /*
      * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
      * to detect if there was an exception during tlb_fill().
@@ -173,8 +165,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              (access_type == MMU_DATA_STORE
                               ? BP_MEM_WRITE : BP_MEM_READ), ra);
     }
-#endif
     return 0;
+#endif
 }
 
 static int access_prepare_nf(S390Access *access, CPUS390XState *env,
-- 
2.25.1


