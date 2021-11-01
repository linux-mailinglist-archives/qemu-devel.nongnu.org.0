Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B063441FC1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:01:43 +0100 (CET)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbcs-0005tW-KZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6G-0003vf-EQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:05 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6A-0000fv-RO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:28:00 -0400
Received: by mail-qt1-x835.google.com with SMTP id r2so15235257qtw.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ky6yY478j1xSRIHIN9BTjrdKe+bHyugXQSySqll0teU=;
 b=MKhXscidvPb6EqsDTUo+4VxlspmHziy39kEabPo2fRWtR+jkuQ9ijJFzNkjRZAmR/s
 /keFdev5nObKAF+mVowNz6+MiT9u7gj3kygbhNl24ae7eWZ8kwrXkeoDFvSnIJIibjFX
 JYb8zgKAaVdWDkEi9sz0e+I6YrpvXCXt1cVU+Xo8X2glZcA2+mQIGymXQ0JZ4F+kxDfw
 FooTcdUF97CbNDXyQEOsD4WrU/xdiG9jtbJlFqf9Oqblr/jaMv3hrpu9ujvMlV5ubM0x
 DPdL4ghGz2YSCPYjH4EbfqpWrkQNqk3igGhHLuh0607JqYn8Gzdta5rVLRTPJhEgQua8
 rtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ky6yY478j1xSRIHIN9BTjrdKe+bHyugXQSySqll0teU=;
 b=oE0r/Qwbfl67if8bbazyxlfJ6T1U+AHdqvaFI9WohGNE8D1QKnFKckUQsrzIye4rR3
 NhenT3M5qa6UbDoW+Y9DgWOeO1UJIQh+te7LGaUU8JjIeJ28cALWZYyTh4bU0LLJQUl0
 T4DHtrzQIDznNVVg6JTdsYQXQtGkO8RsbiEMDmB9cOmsBCk/EDVPa1joKlwKJz1o1uMz
 TvuovG0dKRCAqbRySUIiJFylFPXbodkRo9vtFa6DDS6YK+jVJ7hLBmhFXE7zKIvEYk54
 f86x0o15Q5dtD5EQ64C9w+vdsqZJAl//a3AINq0IZF/AO7SG1pJVC89YQ7PxjwuG+KCO
 ue6w==
X-Gm-Message-State: AOAM5305TUe3BBO7Tp7RSiKjRonWy9ZSlDQJg4VR4lDAc8MNAXE83omP
 FnvWsQY2G83wxefulvAgtbLrS/Yx949O1w==
X-Google-Smtp-Source: ABdhPJwE7HPG31GIm3xWOxMEBRpodfGOFg4KLx87b7PKn+hI3lzsBTZ33EmOd0rm5gRM2L9maXDCmg==
X-Received: by 2002:ac8:5f0c:: with SMTP id x12mr32094388qta.309.1635787671889; 
 Mon, 01 Nov 2021 10:27:51 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 36/60] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Mon,  1 Nov 2021 13:27:05 -0400
Message-Id: <20211101172729.23149-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure why the user-only code wasn't rewritten to use
probe_access_flags at the same time that the sysemu code
was converted.  For the purpose of user-only, this is an
exact replacement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


