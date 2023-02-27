Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535EC6A441B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFy-0003o7-1n; Mon, 27 Feb 2023 09:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF6-0000p3-DY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF4-0001Lz-Cw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so6372647wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IaVs6FOwXp7HWgaVY9BxYKdINeZMyNNvs9/2KbcKP1Y=;
 b=EXwQ86RcHS/CX0U5AG8RXdVF3z3BR12ZekRsD85Pip1x26MkCHVnEdjKlG+k/0RDTj
 cEC1mSH6lsFn1lVHY40VMZlcEKiKUjYKhw5Jl+ax5LqcX5Ztw/axHwz+Lq7DlfhXOWfH
 KSiiml6XZLYGTOhu3U8XdaQy1gjSGzztfYBux1qwivvqiICpTtZIKkRwfsyu+MUahiLq
 LnF6E/VWK/GSz1myzModh00e2FP0rNhR923B6PwG1F2d5amqoxdVLA7jdQQiWXpfg3MY
 ZdWBIih28oNIAUUx6ARWCycE+9BRDybZ94nVuwEy2ArLXxoNEI0Y9tDYpT/BNy7uOUU6
 iEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaVs6FOwXp7HWgaVY9BxYKdINeZMyNNvs9/2KbcKP1Y=;
 b=gvV+7YReQw9ePMvTIGDC17uXhuQfs1HFHYNSysrWo8mTw9PDMIz8lz/kkf2LVGnTtS
 klRgM/qXXadD2U2oKdqkCmBm+vF1f1H7Ap7U8cI47aIAgkt9l6TrYsn3DyGspdi1lCqj
 0P0IuxsTIfUCPP6Ls99Eo2FHVf9/6Pq35tNJNN2zzDqLlNIpmc5wh5CjMD+VWsJtfftx
 LDVPc5iFMuHXbfvUnFL3/qRjMQSwkxkjns/EzKOqbR8yFNMSwlrg1SQps1Z+oYFMbr7t
 CkPCWup0rGSZ5Fq4jx1qv0L5PLC/+4fG8K1s8YukL+OywYdViGqIO3KMr61RB4po1h7x
 ROwA==
X-Gm-Message-State: AO0yUKUWtmpHXDnCegSoCTfGDibP5DYe9hzjm+UjdgOespldroFRoJji
 Ghg3j+nPROTfiix+k6LBflzEoLrDQGrpFXjq
X-Google-Smtp-Source: AK7set8vJjr4eT8wk9xwG9mN0RaAeiBK1CeI6jKOMR2R/alz38qKOhcDJRyz+SNbP5UbYRCyvTRH1A==
X-Received: by 2002:adf:f883:0:b0:2c7:3d5:9faa with SMTP id
 u3-20020adff883000000b002c703d59faamr18061653wrp.11.1677507156734; 
 Mon, 27 Feb 2023 06:12:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iz10-20020a05600c554a00b003e2243cfe15sm9213969wmb.39.2023.02.27.06.12.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 124/126] dump: Simplify compiling win_dump.o by introducing
 win_dump_available()
Date: Mon, 27 Feb 2023 15:02:11 +0100
Message-Id: <20230227140213.35084-115-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

To make dump.c less target dependent, move the TARGET_X86_64 #ifdef'ry
from dump.c to win_dump.c (introducing a win_dump_available() method
there). By doing so we can build win_dump.c on any target, and
simplify the meson rule.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230225094903.53167-5-philmd@linaro.org>
---
 dump/dump.c      | 16 +++++-----------
 dump/meson.build |  2 +-
 dump/win_dump.c  | 18 ++++++++++++++++++
 dump/win_dump.h  |  3 +++
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index da63129825..fa650980d8 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -28,10 +28,7 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
 #include "hw/core/cpu.h"
-
-#ifdef TARGET_X86_64
 #include "win_dump.h"
-#endif
 
 #include <zlib.h>
 #ifdef CONFIG_LZO
@@ -2126,12 +2123,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     }
 #endif
 
-#ifndef TARGET_X86_64
-    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-        error_setg(errp, "Windows dump is only available for x86-64");
+    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP
+        && !win_dump_available(errp)) {
         return;
     }
-#endif
 
 #if !defined(WIN32)
     if (strstart(file, "fd:", &p)) {
@@ -2213,10 +2208,9 @@ DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
     QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY);
 #endif
 
-    /* Windows dump is available only if target is x86_64 */
-#ifdef TARGET_X86_64
-    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
-#endif
+    if (win_dump_available(NULL)) {
+        QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
+    }
 
     return cap;
 }
diff --git a/dump/meson.build b/dump/meson.build
index 2eff29c3ea..f13b29a849 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,4 @@
 softmmu_ss.add(files('dump-hmp-cmds.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
diff --git a/dump/win_dump.c b/dump/win_dump.c
index ba7fa404fe..ff9c5bd339 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -18,6 +18,13 @@
 #include "win_dump.h"
 #include "cpu.h"
 
+#if defined(TARGET_X86_64)
+
+bool win_dump_available(Error **errp)
+{
+    return true;
+}
+
 static size_t win_dump_ptr_size(bool x64)
 {
     return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
@@ -470,3 +477,14 @@ out_cr3:
 
     return;
 }
+
+#else /* !TARGET_X86_64 */
+
+bool win_dump_available(Error **errp)
+{
+    error_setg(errp, "Windows dump is only available for x86-64");
+
+    return false;
+}
+
+#endif
diff --git a/dump/win_dump.h b/dump/win_dump.h
index 56f63683c3..c9b49f87dc 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -13,6 +13,9 @@
 
 #include "sysemu/dump.h"
 
+/* Check Windows dump availability for the current target */
+bool win_dump_available(Error **errp);
+
 void create_win_dump(DumpState *s, Error **errp);
 
 #endif /* WIN_DUMP_H */
-- 
2.38.1


