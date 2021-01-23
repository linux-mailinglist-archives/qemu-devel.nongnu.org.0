Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD923017F3
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 20:03:06 +0100 (CET)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3OBc-0000CS-GY
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 14:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nze-0005KA-3g
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzc-0008IA-8i
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id a20so2881401pjs.1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GmBs5ay9uV9kxOX2oWB2tt33ICLoNCCnlqJiSZlo34=;
 b=mAKrbA0sM/NSZqoO9kIpDgE1DeEX0VdikjFGeHu0Q5vu7IGU1UUvMNm3bPf3K96t/2
 d3Y+1VZpiupRtOJBWkLplblP1PbSGDq5QX8iLcjACF2+NQi5kxYqKOQ/ZIuE9uvnog0/
 lwurlEne4wOZrtJK3KqHqQJ0L42y05lghOvDDRCAbUFEIGJDwfCo0FlD1VjMRRBk2ays
 22wOcBT2qx4dKBPT+JwnWYz890GLz3Qsv2J4Qw32cRBi/LyqxteUP6LOLAabitEQGaeX
 2cV0DxOAXwi5V7nxP8OW/myuKPTPMO7+S1eBgoCc2gq4YZZM8oPl249YN/dqUN4lbwn6
 voRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GmBs5ay9uV9kxOX2oWB2tt33ICLoNCCnlqJiSZlo34=;
 b=hgaGgx7LC9M8Y7gs2g3guKNWPN8LQ9mqFT8lXQT5UP2ElZAtqf1ucPJp+prhpSZyj0
 hMY4gUjsQCujGh9f/ZL7SgPBhLezdw2Dh/FgkM7eiUWKcveGfLiufcVWzDkPAhe9gAO+
 RnadhMl5t6MDU6k/KDU9CFXa68mYEsb515eoOWv72yV+mlX7y7vqYuVqD90I6ucr5dhX
 oVotbwEXGn8RTocp54Y6syGHv7gVOQQQj/JTHCpP8BIEj8Nkln/f8PfERSQyA3fVElXu
 uYV2CC7cxd1Yv9LGRfT5Y27DO8kKRxQfuXeVXaMiJWiAKEh9uTwLJ1kaiVcTe4YwV/zD
 nLvw==
X-Gm-Message-State: AOAM533ZkmdvlgFGqdJDrLiy01IV1CZaRymjOdTwG489+fr0ZfWk3ElY
 IFj4bGyii2co8NpgwITFdCsEcUsfFnLNKA==
X-Google-Smtp-Source: ABdhPJy5Fl/hKbJtt5833x5DTjkcuq9ZJnW4lHLqmxhIv5b/txBUgknxgNfcr+7We5IVCGu3VFd6fg==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id
 z10mr12690085pjn.67.1611427839006; 
 Sat, 23 Jan 2021 10:50:39 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] accel/tcg: Restrict cpu_io_recompile() from other
 accelerators
Date: Sat, 23 Jan 2021 08:50:19 -1000
Message-Id: <20210123185020.1766324-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As cpu_io_recompile() is only called within TCG accelerator
in cputlb.c, declare it locally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210117164813.4101761-6-f4bug@amsat.org>
[rth: Adjust vs changed tb_flush_jmp_cache patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h    | 2 ++
 include/exec/exec-all.h | 1 -
 accel/tcg/cputlb.c      | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 06b341fceb..e9c145e0fb 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -15,4 +15,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
 
+void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 3acc7c2943..125000bcf7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -63,7 +63,6 @@ void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
 bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 
 void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
-void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 0fa1643ed3..7a69726ba4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -37,6 +37,7 @@
 #include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "internal.h"
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
 #endif
-- 
2.25.1


