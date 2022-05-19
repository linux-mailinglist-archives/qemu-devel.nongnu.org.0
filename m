Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2752D5B3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:14:10 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgun-0004VT-6V
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgsc-0002PI-BI; Thu, 19 May 2022 10:11:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgsW-0003eJ-BJ; Thu, 19 May 2022 10:11:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so6110881pjb.1; 
 Thu, 19 May 2022 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Nv+HdUBzbWB3FQruXCG+Vr04O93PrLwUpsvaMFd8dM=;
 b=Msl/wseJB/E2nEpsSfbGCs/zqIlDIjSN7fJQp7NeYZvM4eUjt2yd1XSoTrlrl0CPVc
 9++7xlV8K6Xw3YeQL/HTDIP3jORY6CQK/10t99WmdbTcHsM37ppAWHmKKKQHV65E1qy4
 01e7p9gmr8F59gIY7a001keIu6sJ0ltHJKoONkC9LN+r/Xy2Wijfs+wJwZfPoRgyiYFy
 lMFU2GqO+3xtqWxv42WXCCq/k2waY3Y4WHULKLQyC7CduOpj/uMxYARiPvq1Tya2IbH1
 WhuT+0eH+h44xpPdpsuUEbje+wZTDITGCSGiS9XPd11gtt2YFevrWRLgvqlaO5qB7JkR
 0M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Nv+HdUBzbWB3FQruXCG+Vr04O93PrLwUpsvaMFd8dM=;
 b=ffsNHWa62ba8GvAQYV7RRYrtLh4kMuNYOF90kXevyiAjiYQcuOHzOfbogZgeoKKVCD
 NUoWtqvhRm17w5ypcouD05ptjWOdele+LrL8Y+PR0pWMxmuQJ0Wt7o1SxnVUp+29W7HF
 2fiigl0n6BV4nzIuoSwvyeN6SBByQ/eb3yVCzalnWh6pcLWO8IB/f2eE64lfjW06n8Se
 eoZ4R8Wo1HZ7Sa7SoCoNkWGB0fVQF2NSbr5Sc3Lpm0QCsuCeTbfGIXQHEeI7qXrwyIeR
 h/pQ8GEV+Uu2Cm2hURSNHI0HG2b4H1jZIp5JGwdN6ytH0SQS+6zlnxzZlOI+0eT0yPE2
 V+1Q==
X-Gm-Message-State: AOAM532uYA8EiTcf+7ygTBL8xyz35hYzDsfIpd/cB4yZ2nqzmr5Lmuhd
 EUkwBz3CX3PbCnGCRMucP2VnpeQSumfpSg==
X-Google-Smtp-Source: ABdhPJx8oYK9nBni2YNd4vHIj34ZNMA9m71A5hYv4NVuiziWIT+uBj2N2j7r3SOaSpC3F0jRZ+pyIQ==
X-Received: by 2002:a17:90b:386:b0:1df:2d85:e4f3 with SMTP id
 ga6-20020a17090b038600b001df2d85e4f3mr5340320pjb.204.1652969500579; 
 Thu, 19 May 2022 07:11:40 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b0015e8d4eb1c1sm3814943pln.11.2022.05.19.07.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:11:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] util: optimise flush_idcache_range when the ppc host has
 coherent icache
Date: Fri, 20 May 2022 00:11:31 +1000
Message-Id: <20220519141131.29839-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

dcache writeback and icache invalidate is not required when icache is
coherent, a shorter fixed-length sequence can be used which just has to
flush and re-fetch instructions that were in-flight.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

I haven't been able to measure a significant performance difference
with this, qemu isn't flushing large ranges frequently so the old sequence
is not that slow.

 include/qemu/cacheflush.h |  4 ++++
 util/cacheflush.c         |  9 +++++++++
 util/cacheinfo.c          | 16 ++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
index ae20bcda73..f65349ce3c 100644
--- a/include/qemu/cacheflush.h
+++ b/include/qemu/cacheflush.h
@@ -28,6 +28,10 @@ static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 
 #else
 
+#if defined(__powerpc__)
+extern bool have_coherent_icache;
+#endif
+
 void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len);
 
 #endif
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 4b57186d89..15060f78b8 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -108,7 +108,16 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
     size_t isize = qemu_icache_linesize;
 
     b = rw & ~(dsize - 1);
+
+    if (have_coherent_icache) {
+        asm volatile ("sync" : : : "memory");
+        asm volatile ("icbi 0,%0" : : "r"(b) : "memory");
+        asm volatile ("isync" : : : "memory");
+        return;
+    }
+
     e = (rw + len + dsize - 1) & ~(dsize - 1);
+
     for (p = b; p < e; p += dsize) {
         asm volatile ("dcbst 0,%0" : : "r"(p) : "memory");
     }
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index ab1644d490..b632ff47ae 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -133,18 +133,30 @@ static void arch_cache_info(int *isize, int *dsize)
     }
 }
 
-#elif defined(_ARCH_PPC) && defined(__linux__)
-# include "elf.h"
+#elif defined(__powerpc__)
 
+bool have_coherent_icache = false;
+
+# if defined(_ARCH_PPC) && defined(__linux__)
+#  include "elf.h"
 static void arch_cache_info(int *isize, int *dsize)
 {
+#  ifdef PPC_FEATURE_ICACHE_SNOOP
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+#  endif
+
     if (*isize == 0) {
         *isize = qemu_getauxval(AT_ICACHEBSIZE);
     }
     if (*dsize == 0) {
         *dsize = qemu_getauxval(AT_DCACHEBSIZE);
     }
+
+#  ifdef PPC_FEATURE_ICACHE_SNOOP
+    have_coherent_icache = (hwcap & PPC_FEATURE_ICACHE_SNOOP) != 0;
+#  endif
 }
+# endif
 
 #else
 static void arch_cache_info(int *isize, int *dsize) { }
-- 
2.35.1


