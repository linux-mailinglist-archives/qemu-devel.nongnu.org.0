Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0604F9B5A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:11:25 +0200 (CEST)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncs8q-00052d-P2
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsl-00084L-CN
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsj-0003tJ-Tp
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id d7so10709873edn.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BMis61C8omQYYseV7MGnkVBUiKXffiRK6pjvcW205Rg=;
 b=JxkhP0+fU7ua0h1hkpmIU5X6+bXjFlsqJckyalU7djWibnUIH92bqeAACfEy2/jV1u
 uNFm1BQq24YpMA1lwRp/UCHHS6xJU1p5cd/CM14bOIrbiZ8x0lI4Y7JqSUYYHKT59zzR
 kZsDtIl3ZOdNu4ngSpzpHXYNn1JfvInC7TSDlJdm/t6lNzY1iV4BQ5XQwaVWMLZxH55C
 M/3/X5rDtdvr988MIMfJlVZ1Ze9J+lltb5OPfCKXxxyeF+lUZXP9pNpL9GpKTWeXn7ey
 wKi9WFtcP/+6iuWhgCi/Jo9XTIkjd8W0xlLKqHojz3000T7J6dY1CV8bc/s50lOGG5b/
 bLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BMis61C8omQYYseV7MGnkVBUiKXffiRK6pjvcW205Rg=;
 b=t7ujHsaEuT/jibIJzdhJzfl8+GVGPDQbO1Oh5L9PSQWU8UNqseUSMzK5QQxEYJErDH
 IMGs/5owoebsfA0PCzNcqnvkuyxBxAj37WupDIvMk0O5cBGaWwi8vedHRPgc79Fb3M8T
 s+BL+BxDTGnePbKYMTesKDSbakYVaolaxIV9tLT8REM+hrMTMsPfaGyXb2BiLIEf9w0e
 b3Rh2mFYqWB0mnjntqkmj/5nCEhh+Q8h5r1Qsz7tNVccYvcqPsG9qdXq9beUnQLuXmwn
 ut0XG8m9qD3VZnrnFXKA66NuzAjc6F8GllpLp1nBQb8yCguHB3mRaqoLahghJE4Z2TCx
 zmYw==
X-Gm-Message-State: AOAM532PN2DFINXL87DWdjvgPOyPeZttpAXxn8YWmj3eVKPUXYR9r6p+
 /f37v91mrVSmtx7+rwpPeWr8Fg==
X-Google-Smtp-Source: ABdhPJzOpXYzyjAGmZj9PWUCu2ZUIjtKjG5WERAFN6QaKRg0hmYsVP5mSRZFpT8NfI0UUoqDXhclvQ==
X-Received: by 2002:a50:c3cf:0:b0:41d:5fc4:7931 with SMTP id
 i15-20020a50c3cf000000b0041d5fc47931mr1088212edf.244.1649436884406; 
 Fri, 08 Apr 2022 09:54:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm10614237edm.90.2022.04.08.09.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:54:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C396F1FFC1;
 Fri,  8 Apr 2022 17:47:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/15] cputlb: add tracepoints for TB invalidation
Date: Fri,  8 Apr 2022 17:47:37 +0100
Message-Id: <20220408164742.2844631-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 2 ++
 accel/tcg/trace-events    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9f1cc179d..b0009177b9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1180,6 +1180,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     assert_memory_lock();
 
+    trace_tb_phys_invalidate(tb, tb->pc);
+
     /* make sure no further incoming jumps will be chained to this TB */
     qemu_spin_lock(&tb->jmp_lock);
     qatomic_set(&tb->cflags, tb->cflags | CF_INVALID);
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index e11e59492f..c034649dc2 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -14,5 +14,6 @@ memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
 # translate-all.c
+tb_phys_invalidate(void *tb, uintptr_t pc) "tb:%p, pc:0x%"PRIxPTR""
 tb_invalidate_phys_page_fast(uint64_t page_start, int len, uint64_t ret, int wc, void *bmap) "addr:0x%" PRIx64 "/%d pc:0x%" PRIx64" wc:%d/%p"
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
-- 
2.30.2


