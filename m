Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37850648037
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZoZ-0004EK-FK; Fri, 09 Dec 2022 04:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoW-0004Dl-LN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoV-0003nM-0C
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso5591126wmb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xs8hKJC3drTwU6EvGSY8CbqIQfqKG7hGtbB4kWHTpkY=;
 b=Vq9UhN1/mvI2U3OxbFDD1kizwea0Bt9Nm0XSImQwl8PNMjmMEzj0p4Bsj4WIJEpFT6
 eL8wQDtUY6pnEA9x1srfq3GlDj5YKdTa6iGt1Kkfhd9tfgx0NSNK7AGrHG2b9H0s/x+o
 tEd7URJgDQc2BTeZdx3ZD2fhq2GEf/5y8WfdZhp5C02t9SLIwpqqs2Ch7JmLLeGwFzIj
 oC2Awn8/axRBjpgkE5pCwlTr72Ujg85fd+DMhmIu4eDMXbraestTYuKSbumE4xKJEhHF
 gyOV1ywpN9Yg8gYyZ4ZKhkdrk184kpN4IMahaeqfo1pEyToFy6rMni7yRSpg1eRth9X2
 U9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xs8hKJC3drTwU6EvGSY8CbqIQfqKG7hGtbB4kWHTpkY=;
 b=xME7L+JVhMVJVt21+/zJxjNIwfaY8kNu+A5SAdJkvkuu23+5fooDdWOLryV0CuqMz/
 VsDWtFvIy7soXlIWK4Ki5bay1mC6/TSUf8pWMu21cf6j1+H6JafdQoyY7gI5Myy6ObQ1
 vFGuUetJxErRb4Haf8onUMa+eElBkNBpPSs3ruPi8+HK7pWlz7iQuAvPieOm1MjzNGNT
 KNLumRVrrufDo20VCGCb2YTA1yM/PLQChD9E3yaXi/HO7jj41b8Ti/zZO7y0dGhq1hWw
 YiXqk7bXcMJ/hsjJc5jzS/NxMJ+vwKcYm0JRFh/IiEFLLSyKbFYkPftCb/zDAGRzZWmN
 kdIg==
X-Gm-Message-State: ANoB5pn5Z7Ugfa4DSzq2/UVS5T/qWJloC7gWlal7WiZxt8M5K10OhsZy
 owgKdimqDIgMRVj/XbFLM7ckwiJfNS4xD5elkAU=
X-Google-Smtp-Source: AA0mqf5ePu6iKg0AvVrjOcE2cORk5K3aPMxvha6mNdpRBiyvtQwiF8p4JzXeBY8e0ksoLTTycC4Hhw==
X-Received: by 2002:a05:600c:20a:b0:3d2:7e0:3d51 with SMTP id
 10-20020a05600c020a00b003d207e03d51mr2275795wmi.17.1670578621411; 
 Fri, 09 Dec 2022 01:37:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003cf57329221sm8899073wmq.14.2022.12.09.01.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/5] accel/tcg: Remove trace events from trace-root.h
Date: Fri,  9 Dec 2022 10:36:46 +0100
Message-Id: <20221209093649.43738-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209093649.43738-1-philmd@linaro.org>
References: <20221209093649.43738-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Commit d9bb58e510 ("tcg: move tcg related files into accel/tcg/
subdirectory") introduced accel/tcg/trace-events, so we don't
need to use the root trace-events anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.38.1


