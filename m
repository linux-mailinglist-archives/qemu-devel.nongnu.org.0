Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE34F9B4C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:03:48 +0200 (CEST)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncs1S-0002Nu-F8
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmL-0007AN-R8
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmJ-00031y-3c
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5979211wmz.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/M3SIRLq1wHJgDuF/NudSRgd4ibV/jQ9bygCh3f7Fk=;
 b=iEFWTm3pV+mWFXfY0ir7BjI/l8jOzYdMPFy7ydJHZkMRJUhMDt0zxpN0FdAygv67rw
 Um5dC536w/fGqhtvfoutFBCgYHsF5USj3+1IAYRE03Hq9GD3XUnQfiXpvx+tkKIF6JEu
 XmEhb2qNina6xkq91vb2SkmPgN0fzs6DKWClbJsDzqCJp1nl7Od9zlzhZqoQUmPBHgSZ
 icBrhJqJUXWuISI31qifzSpKkMzUjSB6TvA7NJB3gRSw2SJ01hTVLMxUVXp6QTV/SqJ0
 TQaSRZOHbRq4vXi7JmVuhXMvKeuUfqT2nYg4b4TjIqmTgn/Pj7+3zSLdQX09i/GZcVrE
 J85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/M3SIRLq1wHJgDuF/NudSRgd4ibV/jQ9bygCh3f7Fk=;
 b=W93RP1kdhWQMraP55XssWAkW5vjqfummri0JmwdYMOF1XrMp8vMTQsMq9g8VdRpfDR
 iqJHrmipgP8cNC+4PLfgdhs9llDEl/nZx1Mi6g3EbGpONobY6Fv+wnbLKgNMjfi5WHAc
 vWSA5PCL2Sw1wH0XX/huuaA6tDj0bSYaQWQFbUcorhZCK3kPQxQmHNV7Bj3t2uWC6e7a
 tR/L4f2ZsWwPQnGkgxPyfw+UlZj1hekTiuHexs7VhbNRoVmgm6F3ERQMcMXx6+OxGsvg
 uLZkiWgHoc60OKIhGu8YMYSA20vdFLaEy0SQ8HjT0ETiApaMo6DEzhSnrk44CiWgjqEM
 5Crg==
X-Gm-Message-State: AOAM533L9Oai6sVMK8N7WMkRPmbAEfR8vIrAglE5Sf5WkLJI7MfnS3ly
 5in/eb/VhWMzuetwB5/AMV9zJQ==
X-Google-Smtp-Source: ABdhPJz1Yz8wiCyMCjAJfd/ziXaEKDjxctPbhAHrOHShn6YZzCv4TSPZD3HB+DYvFOCK6vohgjFyKg==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr18249558wmi.67.1649436472304; 
 Fri, 08 Apr 2022 09:47:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bd27-20020a05600c1f1b00b0038ea3ead086sm1914029wmb.32.2022.04.08.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BADBC1FFBD;
 Fri,  8 Apr 2022 17:47:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/15] accel/tcg: add tb_invalidate_phy_pages_fast
 tracepoint
Date: Fri,  8 Apr 2022 17:47:32 +0100
Message-Id: <20220408164742.2844631-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These events can be very expensive for the translator so lets add a
tracepoint to help with debugging what might be causing them. Clean up
the comments while we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 15 +++++++++++----
 accel/tcg/trace-events    |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5971cd53ab..e9f1cc179d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1807,21 +1807,28 @@ void tb_invalidate_phys_range(target_ulong start, target_ulong end)
 }
 
 #ifdef CONFIG_SOFTMMU
-/* len must be <= 8 and start must be a multiple of len.
+/*
+ * len must be <= 8 and start must be a multiple of len.
  * Called via softmmu_template.h when code areas are written to with
  * iothread mutex not held.
  *
- * Call with all @pages in the range [@start, @start + len[ locked.
+ * Call with all @pages in the range [@start, @start + len] locked.
  */
 void tb_invalidate_phys_page_fast(struct page_collection *pages,
                                   tb_page_addr_t start, int len,
                                   uintptr_t retaddr)
 {
-    PageDesc *p;
+    PageDesc *p = page_find(start >> TARGET_PAGE_BITS);
+
+    if (trace_event_get_state_backends(TRACE_TB_INVALIDATE_PHYS_PAGE_FAST)) {
+        TranslationBlock *tb = tcg_tb_lookup(retaddr);
+        g_assert(tb);
+        trace_tb_invalidate_phys_page_fast(start, len, tb->pc,
+                                           p->code_write_count, p->code_bitmap);
+    }
 
     assert_memory_lock();
 
-    p = page_find(start >> TARGET_PAGE_BITS);
     if (!p) {
         return;
     }
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index 4e9b450520..f4d1321b1b 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -11,4 +11,5 @@ memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
 # translate-all.c
+tb_invalidate_phys_page_fast(uint64_t page_start, int len, uint64_t ret, int wc, void *bmap) "addr:0x%" PRIx64 "/%d pc:0x%" PRIx64" wc:%d/%p"
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
-- 
2.30.2


