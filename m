Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64364F14D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fq0-0000Ux-06; Fri, 16 Dec 2022 13:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpu-0000Ta-Vx
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:35 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpt-0003Gv-89
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:34 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x2so3150954plb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1M2wRoJOi+BqzGwIPM2hSiFC08op8oobTL1vRrCJmc=;
 b=Vk9cX5yDaw0eTMaSyfcMtXUvf5LkIWcGWwS6OfG4EqGMUQzqV3a9sL6KTNByjCFs+x
 61lyPy6YYwrqk0zZ8SiDoh7fjEy84oTqtINsSiujhI/WVbgU88tdha3xQ011TFhBsC1e
 AmLnpdbLqcFFXUZjgvPp6XyyYmtb2W9uRbqkjbvF3UiZRoJaj8Okiv1ANODfut0AJrGt
 gv/mYrkOmhlrCIa6VK90R/QvGo8AOXMDFe7hNMoD++3B1O54rdTWYrvAczhxRAqzkAzg
 skIOMZH7JgpdECEJT2DRn81ELc+nX/+x0RckVsEjw1BoHnCqVMFr4DOP2egcPqDTVuAb
 GnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1M2wRoJOi+BqzGwIPM2hSiFC08op8oobTL1vRrCJmc=;
 b=aekSeBMEhwM51eP+bp7bDB9m+R0wLsgSgUJpxCVIyzUB+EEyYUrst9p1eclVEJloo2
 zGJYkAk3oraewY33sYGubz/QIN9yuoRqnrypicQJ0ZYjjBWzOmrWh6EI2MbA6cTT80Ks
 cvdIaXPC53ksX3sza/7no+6YNi8RP2QheGnCs5gXwkFOouFe+dqrBu2FWI6gmRoLDkZb
 ZLBaSJ9Ll7tsb61F57icbAhEXQDBUQ2sja9O5TMc1eUnJZ5xruKW0J4qq+jXJ1XjFTHs
 J71BntAPhsMivwT8D+Pcfn8MlH7IiUEk2MpzsjQ1aaBg+eRUc9CjoQzEFBgVJKj+1wxY
 3iyw==
X-Gm-Message-State: ANoB5pmVtrvFAwOzKQi2gY9XOHz4XJvPqklRK7jOI/GF9u2efVQelm8J
 Oe80UOcvkzEO9XnxjzTZWpRkVAw872GBkGOP
X-Google-Smtp-Source: AA0mqf6O8eFJyk9teiWrgqxtkBMcANMaE61fT/rTu8MYidd49o0C+YbaiBho0vIxLpP7WareA6pSHA==
X-Received: by 2002:a05:6a21:2d8b:b0:a0:462f:8e3e with SMTP id
 ty11-20020a056a212d8b00b000a0462f8e3emr42296030pzb.55.1671216811875; 
 Fri, 16 Dec 2022 10:53:31 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/13] accel/tcg: Remove trace events from trace-root.h
Date: Fri, 16 Dec 2022 10:53:02 -0800
Message-Id: <20221216185305.3429913-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Commit d9bb58e510 ("tcg: move tcg related files into accel/tcg/
subdirectory") introduced accel/tcg/trace-events, so we don't
need to use the root trace-events anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-3-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c     | 2 +-
 accel/tcg/trace-events | 4 ++++
 trace-events           | 4 ----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6f1c00682b..ac459478f4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,7 +33,7 @@
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
 #include "exec/translate-all.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 #include "tb-hash.h"
 #include "internal.h"
 #ifdef CONFIG_PLUGIN
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 59eab96f26..4e9b450520 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -6,5 +6,9 @@ exec_tb(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_nocache(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 
+# cputlb.c
+memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
+memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+
 # translate-all.c
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
diff --git a/trace-events b/trace-events
index 035f3d570d..b6b84b175e 100644
--- a/trace-events
+++ b/trace-events
@@ -42,10 +42,6 @@ find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx
 find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
 ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
 
-# accel/tcg/cputlb.c
-memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
-memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
-
 # job.c
 job_state_transition(void *job,  int ret, const char *legal, const char *s0, const char *s1) "job %p (ret: %d) attempting %s transition (%s-->%s)"
 job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
-- 
2.34.1


