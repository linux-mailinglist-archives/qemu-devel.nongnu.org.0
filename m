Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F3370EBB
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:10:33 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHU8-0002hh-Hs
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHSk-0002GK-Um
 for qemu-devel@nongnu.org; Sun, 02 May 2021 15:09:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHSi-0007vf-Qd
 for qemu-devel@nongnu.org; Sun, 02 May 2021 15:09:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso2086649wmj.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Od1APi/IikRB8BlnR55ihbRQgaqYGdqucLI4V3awYJE=;
 b=R6uJcUg8LxZJw9TBGOVTk/1Bvy6XvEoMDdj1Lqf9T9DSVWuHSk0SRW27CDUV6y6lwP
 BKA9qwsJwD1Ye8fBkn+dQnHFQucYqM02KbWgmxaClkSugMEF0ITiEjn4neIKfzcrNrhB
 +d1hBquEdfUFtPoumD386bOIZ4ZDxbUp1MbMFcQQ7kWt1jnqQA+8Un4nyHW6j7BCbi4p
 2jC6Z2+Emv/5r32oStQpYjoypu7wp8R1lRvi7s2+nE7VNFgSt/Ve+RpQo+y6PjcY0txK
 dQ4rwEVnjY3YDdIsjUM58oyLqAqIQIQbKzqux8DdROyMefXO1asLM+fc/InKenvtQFxb
 V1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Od1APi/IikRB8BlnR55ihbRQgaqYGdqucLI4V3awYJE=;
 b=nZDtMobPgAuLilQXhoRO+3eWFChz2Wg1PFB71fVqaI+JAnMxb8acNmxZFNFvFhPIAp
 RBwrCJGi85RlZjehwS6C18o4RYk+FwVPgkH0et84mT3VopHbkj33zUuzlvpxcLtwomEt
 1xwc7FpQ6xSWBbCN6JIlX+LTRhnCtQAm3noWv/OYAmfYse0uiIwRy1rgDxaDGulwogXr
 M+LlZVgI/GAkFUU6YtAoMbvnEc6uSJaPeieSGlZWgmMmLRFyvzSgHJHIat4bkka9NyfL
 dw5sDdpt3PjO7fQXClA2pdftKf9DuoR1DNK7S4HdyxDPnSKava09+LYwrBdp6mFRzBkh
 u67w==
X-Gm-Message-State: AOAM5322YuRm5r5UgeZ8j4QbQTUNfUQIfIijWb83KDOCmc5X3kvRIRH+
 Pk5YD+jYzpyj2WKMqPGIJDMB/qL6LlH9TWCS
X-Google-Smtp-Source: ABdhPJw6tzNIE37xDvqZNuLotYVkGOei1wEbqvP04MS/+URzHnvlTNzjR7t9qir1Y4im3Y2ibF3qcA==
X-Received: by 2002:a1c:dc41:: with SMTP id t62mr28372388wmg.14.1619982542932; 
 Sun, 02 May 2021 12:09:02 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y14sm9473887wrs.64.2021.05.02.12.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 12:09:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/avr: Ignore unimplemented WDR opcode
Date: Sun,  2 May 2021 21:09:00 +0200
Message-Id: <20210502190900.604292-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Fred Konrad <konrad@adacore.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running the WDR opcode triggers a segfault:

  $ cat > foo.S << EOF
  > __start:
  >     wdr
  > EOF
  $ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
  $ qemu-system-avr -serial mon:stdio -nographic -no-reboot \
    -M mega -bios foo.elf -d in_asm --singlestep
  IN:
  0x00000000:  WDR
  Segmentation fault (core dumped)

  (gdb) bt
     #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at ../gdbstub.c:718
     #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at ../gdbstub.c:743
     #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at ../gdbstub.c:2742
     #3  0x00005555adc99b96 in cpu_handle_guest_debug (cpu=0x5555af5a4af0) at ../softmmu/cpus.c:306
     #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at ../accel/tcg/tcg-accel-ops-rr.c:224
     #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at ../util/qemu-thread-posix.c:521
     #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
     #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6

Since the watchdog peripheral is not implemented, simply
log the opcode as unimplemented and keep going.

Reported-by: Fred Konrad <konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e10195940..981c29da453 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -188,11 +188,7 @@ void helper_break(CPUAVRState *env)
 
 void helper_wdr(CPUAVRState *env)
 {
-    CPUState *cs = env_cpu(env);
-
-    /* WD is not implemented yet, placeholder */
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
 }
 
 /*
-- 
2.26.3


