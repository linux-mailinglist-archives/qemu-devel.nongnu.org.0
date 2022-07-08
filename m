Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59B56B4F9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 10:59:57 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9jq8-0002Rn-Rx
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 04:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jo1-0000nK-Nz
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:57:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9jnz-0004Yo-Ow
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 04:57:45 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y18so7822210plb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn+bFSsVswx38izVfqrD35XdPG8lzZ2KkKEOUOF9vuQ=;
 b=YeIE83IDvX89SfaqvQ4vyzcWOpWCHaS8pNykS6NFMMLP6cqLmlZh9pt/jrOUm2jUJ6
 VJnIAnwJ/If7wcVestPQSvW5nxncwEpTliAaoRiDl3d4Ilsz2SV8Nk+4QQpOPubOmcDr
 fXXFnjj5b6YEO58yUDqKCnhg3gfRFkQWTgfa/FYdtH3gyWs29KgInhWXJIByu5x66JjC
 nflkB4xKLMmofql6JiIYcKf3MVsMs10J7bxSY9/QiNLyca/NTwDK+YLutDTd8pGR4TIA
 dZeyD36U3wX8BxIJ1cxBUG8STHs6aOECOrgO5UhSP6JRa6PqbcooWqYiz0zOLBpYUiWC
 abZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jn+bFSsVswx38izVfqrD35XdPG8lzZ2KkKEOUOF9vuQ=;
 b=qlz2VbYqht0pb8zimog6qERjPBWaIDTQ95KZB35RX+Z/D8CB/NKVQNoF/qB/S+gDHQ
 +QK5ahZSfsLnFWyAfp4OjCBJksFAXnVbLM3E69JgqGKGfsHnJHW7rCEL0mZRigDbhT7m
 AfNFT82CVkcO4gEH9LQsAY1cTyH+FP+LX8PJ9BI5IgMHGXgVWeM8dBbeXG5LLaYFdl1E
 jqPj/HH35DmllDsuUZ3gByudoJTaY4fZ8uzQ9rszczH7xEswBZKCfkp6OYQg1BGDuuXw
 u7wKHrYxuKtD9KqB8ExiWtYEULAX91fn/Q99qhl+GqaPPs/PZbFKMu6HBh6PG4MQ3447
 GB/A==
X-Gm-Message-State: AJIora8Zhcy7Znurl3l9WffkCjhxSNzylI12r+SOEf9nPfgoOBdhJztL
 E/+KS9rqYeeaudrmStvf6minUA==
X-Google-Smtp-Source: AGRyM1v4zuJGDtd1OBbT9t7Tbhsmp3tiKGxTNgyidT2mm+Q9EvZron5ps/U+aWYJ8waPgkAe9pouIg==
X-Received: by 2002:a17:90a:a384:b0:1ef:da60:9577 with SMTP id
 x4-20020a17090aa38400b001efda609577mr7620589pjp.36.1657270660954; 
 Fri, 08 Jul 2022 01:57:40 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k27-20020aa7999b000000b0052ab5740130sm71854pfh.37.2022.07.08.01.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 01:57:40 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn,
 richard.henderson@linaro.org
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 1/2] util/log: Add vu to dump content of vector unit
Date: Fri,  8 Jul 2022 16:57:35 +0800
Message-Id: <20220708085736.94546-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=kito.cheng@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add new option for -d vu to dump the content of vector unit, many target
has vector register, but there is no easy way to dump the content, we
use this on downstream for a while to help debug, and I feel that's
really useful, so I think it would be great to upstream that to save debug time
for other people :)

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 accel/tcg/cpu-exec.c  | 3 +++
 include/hw/core/cpu.h | 2 ++
 include/qemu/log.h    | 1 +
 util/log.c            | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..2cbec0a6ed 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -221,6 +221,9 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
                 if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
                     flags |= CPU_DUMP_FPU;
                 }
+                if (qemu_loglevel_mask(CPU_LOG_TB_VU)) {
+                    flags |= CPU_DUMP_VU;
+                }
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 996f94059f..7a767e17cd 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -535,11 +535,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
  * @CPU_DUMP_CODE:
  * @CPU_DUMP_FPU: dump FPU register state, not just integer
  * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimization state
+ * @CPU_DUMP_VU: dump vector register state
  */
 enum CPUDumpFlags {
     CPU_DUMP_CODE = 0x00010000,
     CPU_DUMP_FPU  = 0x00020000,
     CPU_DUMP_CCOP = 0x00040000,
+    CPU_DUMP_VU   = 0x00080000,
 };
 
 /**
diff --git a/include/qemu/log.h b/include/qemu/log.h
index c5643d8dd5..49bd0b0fbc 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 #define LOG_PER_THREAD     (1 << 20)
+#define CPU_LOG_TB_VU      (1 << 21)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index d6eb0378c3..775d122c2e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -441,6 +441,8 @@ const QEMULogItem qemu_log_items[] = {
 #ifdef CONFIG_PLUGIN
     { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins\n"},
 #endif
+    { CPU_LOG_TB_VU, "vu",
+      "include vector unit registers in the 'cpu' logging" },
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
     { LOG_PER_THREAD, "tid",
-- 
2.34.0


