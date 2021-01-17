Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517732F940B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:53:01 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BIS-0000ny-Ck
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEN-0004BA-2c
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEK-0001vM-V0
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id r4so11815949wmh.5
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZYwqIRQuLmBtaprCcoYNaqSL+UUeepn3F/UBlfKHSc=;
 b=Mg7UU5eoMqdI+nhY0LeAI+Qune6QfeigS3jDa2pSJ88ArzDXWYZrZ4iZCTFhv27FAt
 XBkDE7fVKw5QFwafvoH0ltcr8Q58U18U/BPZWNGfiDzxDjB+7oz5dJRsHNW77x6nJ3dV
 ED01HFuzwdUXs6UTz0QxOoN3Vk1WDoxDtTjuJXjs4WKDDT5gEytfYnBs3/eUnXk32XWb
 4ygGms+c3esnPgNyGHremMRkAJl4rfYE0FVGf5UAKtdcYjT2XckhjJCyYO5hSRxuLC5Z
 w15B8l0BqCWsKChRJqHksUu1fIqNC92+qgiGVdf4UjxU9OQJMp6NhbwP6JgDE/McaonR
 2iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UZYwqIRQuLmBtaprCcoYNaqSL+UUeepn3F/UBlfKHSc=;
 b=qgmWg+w2YN/tYRwtcRwbnaAgvgrFjgczKbV9rOsX6L4OP8Vn4N0ETDQMEToTcq2r90
 wHfmV1JfgRysoK2PoYQSzT/kVC4EuiKOyDwaUaN25W8Ju3BermLtihYQIV6FcEk5N+Nw
 Dgh3X0vaIsO9l0j52noa2+ouEEfRGo8JMpCpMNsjXqsehY5UDnl8hV+iJsqFcnI2mu1X
 XGB++Teg9UbDaUWw5ul8OlPkv8QSKvgDK249mCcm3jxXWXrYVBHTDgO/v27GTAGY73xY
 wka/SChQZAD7fDP3WMtUeY/Pzk+7OFHkjj691qREUvQ6qGRh2cifwLYO8of5BdaHsRXx
 RaOg==
X-Gm-Message-State: AOAM532nNchVXagxk5AHlmXPxF6cfng/NiB4i8D7MR1njbHCuILS2zJS
 yo6kuLt4Ziv0uZfF+8EF+K0zNf9rhho=
X-Google-Smtp-Source: ABdhPJzUybtrTFNUCU/BSNg/VvtwLquz2yYQGtaAQhiEDwZTLN4tVAZS9V8aRKVK73APW8fp0w0WOg==
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr16527154wmq.89.1610902122108; 
 Sun, 17 Jan 2021 08:48:42 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z8sm6535744wmi.44.2021.01.17.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/6] accel/tcg: Restrict cpu_io_recompile() from other
 accelerators
Date: Sun, 17 Jan 2021 17:48:12 +0100
Message-Id: <20210117164813.4101761-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As cpu_io_recompile() is only called within TCG accelerator
in cputlb.c, declare it locally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because not sure if other accelerator could implement this.
---
 accel/tcg/internal.h    | 2 ++
 include/exec/exec-all.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index f7e18c3498b..c72a69e4d63 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -18,4 +18,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
 void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
 
+void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
+
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 3acc7c2943a..125000bcf70 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -63,7 +63,6 @@ void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
 bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 
 void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
-void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
-- 
2.26.2


