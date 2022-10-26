Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A260D926
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVyn-00085e-Km; Tue, 25 Oct 2022 22:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy6-0007pF-36
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy2-0001sx-W0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id l6so9114541pjj.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoTrhOW+FgyqAL5tOpJBBH0wKZwhc1ALSUhVIqbqWFk=;
 b=ifM1s71OUGJ1BqD5n6gaPyBtJO/VbwERZTg9C5IN0m5JAkJC3se1gH3n2zKAbRxgzL
 6FWuaXAWriDS5ttnOJZFgQBBulHyQEygEBVpDTWPNXyBpHkhv3fcUN9H+DKgML8Fu++I
 TiFtb7aspRY0V+oDi57BuvyB1bpjR1mfiMH846xtJ5p2+oVfiQWTjldN0sncZokV0vlh
 TngsB8csK6LPhirb/U3TAnU4tD0sdmDKGDd5XOSWqQZ0MAJaWnJYi/vnFoZ8DX+7W5jt
 AbdHnkCkd5ChOhzYMTqOEX3m2zWmr17stiDU4QX1KHffmhQrVJdhg1aSQZ7nISJjHnHX
 DlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OoTrhOW+FgyqAL5tOpJBBH0wKZwhc1ALSUhVIqbqWFk=;
 b=lZ4XOEV2zWiiKHqffOk3Onc+8cQjeilM5ZIYFnX/T/piOdqvcLQ3ZdPTs4e4hSwIr3
 pcIx3tiHZGhYGIRAcKTu9HTvWRFb1vgbgfbGR+L4Gma1okoWTEXgJyJxyNaL5Mm0s/gE
 TkcBpN1XkfkuU6ZQspcojJmlgS+1i9wx5JY2bzkVrHbBZuovVf8kL3sKwL5Cfi5PZlFX
 SqF43mjyW2t8o5wvF2khULgPqjyG+TRhZB0xSZHRyUyuNUg95d8OuejQxN4NsbPdQgzr
 QU7ZGoNS3sS9LRWMnb4BqqZ3uMSMid8ltyr+hJqZXr77L6GWOK+T4py1bpkLbXvxitak
 qQqQ==
X-Gm-Message-State: ACrzQf0T5SGsnxdtakIMWifyAHnVMhPzdfLZiJl1lCINMzlzNEL1j9pb
 xAD5TlzG6jDRZHnAZsw1Wp4oFV5Tig7WWEJH
X-Google-Smtp-Source: AMsMyM49ITgQUXcOddPYwSixRyMLyxrvq+lwqdWDIZL6RKhxnHqSATW/Hrk2Gdj7Q5NHQq+r+UoPag==
X-Received: by 2002:a17:902:e9c2:b0:186:79dc:7d87 with SMTP id
 2-20020a170902e9c200b0018679dc7d87mr25204153plk.59.1666750588174; 
 Tue, 25 Oct 2022 19:16:28 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 44/47] target/sparc: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:13 +1000
Message-Id: <20221026021116.1988449-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.h       | 3 +++
 target/sparc/cpu.c       | 1 +
 target/sparc/translate.c | 7 +++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index f80ea2e8cf..e478c5eb16 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -600,6 +600,9 @@ int sparc_cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
 /* translate.c */
 void sparc_tcg_init(void);
+void sparc_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data);
 
 /* cpu-exec.c */
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1f9ef7afd8..4c3d08a875 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -872,6 +872,7 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
+    .restore_state_to_opc = sparc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = sparc_cpu_tlb_fill,
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2cbbe2396a..34858eb95f 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -6011,9 +6011,12 @@ void sparc_tcg_init(void)
     }
 }
 
-void restore_state_to_opc(CPUSPARCState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void sparc_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data)
 {
+    SPARCCPU *cpu = SPARC_CPU(cs);
+    CPUSPARCState *env = &cpu->env;
     target_ulong pc = data[0];
     target_ulong npc = data[1];
 
-- 
2.34.1


