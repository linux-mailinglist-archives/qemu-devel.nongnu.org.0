Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC7553BFD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:55:24 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kuB-00011q-7H
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3km2-0006dj-W8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:47:01 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3kly-00016r-GU
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:58 -0400
Received: by mail-pf1-x432.google.com with SMTP id i64so14160581pfc.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3YLx19yslSTTaLGcQTbBkJC0TNZDbNOKWylq2WnPkw=;
 b=wXRAJgeu88VAK0d4jbnRHsKr/e7hSkdPgzlcz+QpmuqS3cVaooJ6wm/+BVotY672p+
 80WHm1MqqCa9zvwk9gRaKKsK9yK1R5IrolEeLuFXBQAUUmJgzgdRuGbhuENnRe9srWTF
 EcJ4/V2jJYwLkH/Z4J1oL6KfnnaPy0tP8AjZkbbMP3M0lgQGjZ0KCDQJFdm7fkfsKNUn
 gAx158K3//zxJe1xJ8MO1yEAI6tTlzBtiBHG/7P3fakZcDssy0qJHd/xtnhXoEKpUZ8k
 msjJfq71ufwwyDG+e81YG0qW2+r4Edgp5KOfE+vp5tXo2Sum2QdR26VtLCwcuDXLY0iv
 3mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3YLx19yslSTTaLGcQTbBkJC0TNZDbNOKWylq2WnPkw=;
 b=cX547mwzw2D9UzfYtIidO32h1ZylcVWDcL4hGsB+V7k4kPG9QNSgO+XAr3xMadGLLN
 fx6uzQ4rCQISXj6ukUrxd7WUSPoibcSODZa6IDY2ad1/2CbXRhCyno3gg1KlNq7uYCdt
 SHu3Pw+DLbrOXJwSNcHiqPWgwbth6IN28V0VSOaFxceLq3zybA9kH4lYtlOp2W3A+MZq
 LjJzIeJVCmdxtSMdDWvpyx++Z/uvlsucSiHfHexaHsPPMB+/XO23FBVPG724h28Pj0Wa
 +cpGzfKJCfpWDpxmGAU4WRbxB8uC5pnTyOgYcOocg6bCW2uV8h7tlDWON71wQi2qvYIu
 8yIw==
X-Gm-Message-State: AJIora/QpmM2dYuI4RWY6LEapxe+UMzLFJUrRu/ERys9rV+wwoWK0PKx
 tBpdi5pbqYB2bkqu00R1FXfT3hOfisCCRg==
X-Google-Smtp-Source: AGRyM1vp/f24bvHX1yf0CJTqSf9XxQ/54rp66jKQeYax1Q5pi8oQWWl1WNSMRuMUkmrvBAylQb2Ntw==
X-Received: by 2002:a63:4b02:0:b0:3fc:a31a:304 with SMTP id
 y2-20020a634b02000000b003fca31a0304mr27235325pga.121.1655844413118; 
 Tue, 21 Jun 2022 13:46:53 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] util/cacheflush: Optimize flushing when ppc host has
 coherent icache
Date: Tue, 21 Jun 2022 13:46:43 -0700
Message-Id: <20220621204643.371397-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

From: Nicholas Piggin <npiggin@gmail.com>

On linux, the AT_HWCAP bit PPC_FEATURE_ICACHE_SNOOP indicates
that we can use a simplified 3 instruction flush sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220519141131.29839-1-npiggin@gmail.com>
[rth: update after merging cacheflush.c and cacheinfo.c]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220621014837.189139-4-richard.henderson@linaro.org>
---
 util/cacheflush.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 01b6cb7583..2c2c73e085 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -117,6 +117,10 @@ static void sys_cache_info(int *isize, int *dsize)
  * Architecture (+ OS) specific cache detection mechanisms.
  */
 
+#if defined(__powerpc__)
+static bool have_coherent_icache;
+#endif
+
 #if defined(__aarch64__) && !defined(CONFIG_DARWIN)
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
 static uint64_t save_ctr_el0;
@@ -156,6 +160,7 @@ static void arch_cache_info(int *isize, int *dsize)
     if (*dsize == 0) {
         *dsize = qemu_getauxval(AT_DCACHEBSIZE);
     }
+    have_coherent_icache = qemu_getauxval(AT_HWCAP) & PPC_FEATURE_ICACHE_SNOOP;
 }
 
 #else
@@ -298,8 +303,24 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
     uintptr_t p, b, e;
-    size_t dsize = qemu_dcache_linesize;
-    size_t isize = qemu_icache_linesize;
+    size_t dsize, isize;
+
+    /*
+     * Some processors have coherent caches and support a simplified
+     * flushing procedure.  See
+     *   POWER9 UM, 4.6.2.2 Instruction Cache Block Invalidate (icbi) 
+     *   https://ibm.ent.box.com/s/tmklq90ze7aj8f4n32er1mu3sy9u8k3k
+     */
+    if (have_coherent_icache) {
+        asm volatile ("sync\n\t"
+                      "icbi 0,%0\n\t"
+                      "isync"
+                      : : "r"(rx) : "memory");
+        return;
+    }
+
+    dsize = qemu_dcache_linesize;
+    isize = qemu_icache_linesize;
 
     b = rw & ~(dsize - 1);
     e = (rw + len + dsize - 1) & ~(dsize - 1);
-- 
2.34.1


