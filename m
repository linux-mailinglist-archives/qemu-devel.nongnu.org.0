Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F591652C4D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGQ-0002Jy-HM; Wed, 21 Dec 2022 00:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGM-0002II-8D
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGK-0003P9-Fj
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:29 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so995743pje.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1M2wRoJOi+BqzGwIPM2hSiFC08op8oobTL1vRrCJmc=;
 b=xYODdjB9+Fmmdza1GhwZWsKcYARE/16mGbfGVghWwPCx1jYOU66Il4kjUbnuoRf4+r
 j9jdx7QYorP81e4uUiN5/wOL2HKJb2tQVDdab1ivyS1Zq5WwwKdSvsZ0UIauaR0/R0c/
 xlgT6HuBLLzBQ74HEURnE/f7F3SuFlvprw3Dn6xS4aVV57fo/qxbXj9SENaRpnX6W8Ch
 dWSPk8I6gUnQOP9h/wsGjB4m7QFylouJQYJ8vPTGAs3X8S4o28wiFFDU2FxWibHaZDEo
 Yr3OV05WtTT0TFaoRWjSs3BVDgaQebDRLogS0p+dW8IntkSiB0TAXGxsbyq19oWBKs4T
 qtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1M2wRoJOi+BqzGwIPM2hSiFC08op8oobTL1vRrCJmc=;
 b=M+7+sbCzU25HE/VlmGGESEddL0OA5DsI0vdMKdhwb/lRkyZU71K47Enqz0RQyxkCGt
 7I1hh79UNXFqFJeDcNTHfjU2rzmDHW1zomOLaEomfL2EZLW7aat94RV/wQho4heUlfu/
 lNrnTiKjFLPcLdiTGKQRc2UEiCajYFm6TWmzcT06fXEHwAFl4/yfELV4aYEvBskcB6g0
 O8BquNbrC6Xy72XjBmiCITSp7+fMWeIP8G0vuTpEJ+1RbNZkIGe8mZDinbekhvsG5AH0
 KmKowt0BSmYO81DZsPJdQoO25ceVKY7E6GZu9WzGKg1hGjkFoKkJ1/YLiRymblzCBN3L
 chWw==
X-Gm-Message-State: AFqh2kr0JwJYGCAb//ODj2GkHBCBOtrCkmtmtmiiOQrIW3qcfVy9ujqo
 tKjFJRAuA8r+pA5yDqYReAbKWuzL/AVi3T0o
X-Google-Smtp-Source: AMrXdXsWbbr6FjXFXrr5rDGVPiTJ1mbwRs0+t0PuGlNmIMQv5eDMRG3Ozie/9NeeatjsuJhbGk16uQ==
X-Received: by 2002:a17:90a:cc18:b0:219:4011:b836 with SMTP id
 b24-20020a17090acc1800b002194011b836mr15338874pju.23.1671599007105; 
 Tue, 20 Dec 2022 21:03:27 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 11/14] accel/tcg: Remove trace events from trace-root.h
Date: Tue, 20 Dec 2022 21:03:10 -0800
Message-Id: <20221221050313.2950701-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


